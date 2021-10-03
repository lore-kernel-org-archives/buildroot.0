Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB3FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:16:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139386113A
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 139386113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2AC54058F;
	Sun,  3 Oct 2021 17:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ou5Rs3u8afh8; Sun,  3 Oct 2021 17:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D26E940187;
	Sun,  3 Oct 2021 17:16:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03C8C1BF31E
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E634760B0B
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 334hiyZ0fVF8 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 17:16:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DF6A606A6
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 17:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AE0C68DC20; Sun,  3 Oct 2021 17:14:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 19:16:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22cccbd771b859f4a127e28575b360daf36cb4f7
X-Git-Newrev: fffff77dc5cd13942bad9b481f558d5787856d05
X-Patchwork-Hint: ignore
Message-Id: <20211003171412.AE0C68DC20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-augeas: switch from
 "depends on" to "select" for augeas dep
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fffff77dc5cd13942bad9b481f558d5787856d05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During the review of the lua-augeas package, it was pointed out that a
"select BR2_PACKAGE_AUGEAS" should be used instead of a "depends on
BR2_PACKAGE_AUGEAS". But, the same review pointed that python-augeas
used a "depends on BR2_PACKAGE_AUGEAS".

In order to make things consistent, let's switch to "select
BR2_PACKAGE_AUGEAS" as well for python-augeas.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-augeas/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/python-augeas/Config.in b/package/python-augeas/Config.in
index 3503a83b3b..4ab2bd1b26 100644
--- a/package/python-augeas/Config.in
+++ b/package/python-augeas/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_PYTHON_AUGEAS
 	bool "python-augeas"
-	depends on BR2_PACKAGE_AUGEAS
+	depends on !BR2_arc
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_AUGEAS
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  Pure python bindings for Augeas.
 
 	  https://github.com/hercules-team/python-augeas
+
+comment "python-augeas needs a toolchain w/ wchar"
+	depends on !BR2_arc
+	depends on !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
