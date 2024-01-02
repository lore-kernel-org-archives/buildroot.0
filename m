Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA54C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4099A40A5D;
	Tue,  2 Jan 2024 20:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4099A40A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZOz0V3RxoWe; Tue,  2 Jan 2024 20:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58A0F40A5F;
	Tue,  2 Jan 2024 20:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58A0F40A5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50F1B1BF302
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25B3840A5B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B3840A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-y7Q-lmwYCm for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D782040A5D
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D782040A5D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF96883CBF; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:09:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39a2e7b219ec87e380004ec3f3795652872b9553
X-Git-Newrev: fa3a97c8041ab157e912e50e5eaad1a7e4a10465
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.CF96883CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matio: bump to version 1.5.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa3a97c8041ab157e912e50e5eaad1a7e4a10465
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use xz tarball
- Use https as http is translated to https due to HSTS
- Update hash of COPYING (update in year:
  https://github.com/tbeu/matio/commit/47a7a3340ed3bbedd3c456f8254f9c5441a11127)

https://github.com/tbeu/matio/blob/v1.5.26/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/matio/matio.hash | 6 +++---
 package/matio/matio.mk   | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/matio/matio.hash b/package/matio/matio.hash
index 94e0e48f69..976e9f03e8 100644
--- a/package/matio/matio.hash
+++ b/package/matio/matio.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/matio/files/matio/1.5.23/
-sha512  e125278dcb25695affb7c576d0e2a86c0eff4225aa866b81536c9e4d7b2aea2c554f5389e96d534a8b559f5554b6cbecff4b44fe8915173cd64b2da6d1dc2629  matio-1.5.23.tar.gz
+# From https://sourceforge.net/projects/matio/files/matio/1.5.26/
+sha512  725f5287a1bb9367828ede5071da82892327fb8edd51f5a21d1370614d9ea81034c3bb4d16c87e80dc9e800086800ce14e3c4ad636255ea45b7741453e6cbb4c  matio-1.5.26.tar.xz
 # Locally computed
-sha256  3ed9a50d754fcc92d4accb8448e397eafeab686796b2a7445557ce782806e239  COPYING
+sha256  b3da766592f242fd5cdd4dfd15ac5e6119e88fd6844c3c0e7acb8ad3178280a3  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 2ba9c8f568..d8268a109f 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-MATIO_VERSION = 1.5.23
-MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
+MATIO_VERSION = 1.5.26
+MATIO_SOURCE = matio-$(MATIO_VERSION).tar.xz
+MATIO_SITE = \
+	https://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
 MATIO_CPE_ID_VENDOR = matio_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
