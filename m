Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F02C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA57C606C2;
	Sun, 14 Jul 2024 15:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Kq_dx22Q5JX; Sun, 14 Jul 2024 15:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C4360723
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C4360723;
	Sun, 14 Jul 2024 15:08:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D813F1BF954
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C52724012A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA09kR28QTCB for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E846640096
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E846640096
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D46FE867DD; Sun, 14 Jul 2024 15:07:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 17:06:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9e82865b2b787a40240bbd295831521bb50a284
X-Git-Newrev: 9c9fb320d09b7533cac1e243cba15f26783dcdf7
X-Patchwork-Hint: ignore
Message-Id: <20240714150756.D46FE867DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: set SKOPEO_CPE_ID_VALID
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c9fb320d09b7533cac1e243cba15f26783dcdf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:skopeo_project:skopeo is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/D76885CE-0BE8-4012-A93F-F33A0C5D743E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/skopeo/skopeo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 98b0e7ed0a..58631629b3 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -9,6 +9,7 @@ SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
 SKOPEO_LICENSE_FILES = LICENSE
+SKOPEO_CPE_ID_VALID = YES
 
 HOST_SKOPEO_DEPENDENCIES = \
 	host-btrfs-progs \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
