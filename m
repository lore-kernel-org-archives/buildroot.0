Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F79C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC40A6079B;
	Fri, 12 Jan 2024 18:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC40A6079B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oj3_G5ceM_nP; Fri, 12 Jan 2024 18:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01928607A4;
	Fri, 12 Jan 2024 18:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01928607A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D986F1BF997
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0C0440462
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0C0440462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WU4GxbMn6Oiw for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:06:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B400440443
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B400440443
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1E1285FCC; Fri, 12 Jan 2024 18:06:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 19:00:10 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0204ecf5b15a318bde9e8ab3dd5a92563492a39f
X-Git-Newrev: aac3f024327c3a9dffde2f99be4f7a0fd74bbd22
X-Patchwork-Hint: ignore
Message-Id: <20240112180658.A1E1285FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/botan: add
 trousers optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=aac3f024327c3a9dffde2f99be4f7a0fd74bbd22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

trousers is an optional dependency since version 1.11.26 and
https://github.com/randombit/botan/commit/1752f0d522eef9a4a703fccf702b4b026c1c1d01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 55b0434940d46bd16ec1d6063f124c9560e4ceb4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 59fbc950b0..52019f36eb 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -67,6 +67,11 @@ BOTAN_DEPENDENCIES += sqlite
 BOTAN_CONF_OPTS += --with-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_TROUSERS),y)
+BOTAN_DEPENDENCIES += trousers
+BOTAN_CONF_OPTS += --with-tpm
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 BOTAN_DEPENDENCIES += xz
 BOTAN_CONF_OPTS += --with-lzma
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
