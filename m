Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E41CF45B7
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF74360BBC;
	Mon, 12 Jan 2026 17:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMmX-qqY9zQD; Mon, 12 Jan 2026 17:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F2460BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240180;
	bh=+tjXHz1/HWt+pwyQ0DQ45sTaZU01NISMQZhKh/cNVcI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=of8an+QQDPheLZHKwMR7uV60depHrbwaWGtuLJK9miVvJ5jIU9eCV91mQgSfbOy8I
	 xQT6lZGFn3rspI4AbmrhxwyMRARPgf5Pzni6m0Wpvbd0izOQLDn/uHgGWXG97QRTb3
	 i78Mcm/O7u+ang7JWu6qM2HDmctfmqeU6uqUfsbx8qc3m/o9ZCYT+sieXCn1xNSk4S
	 6cKvdevwZMV3v3F/nj+ZaJTWPBI4gmKv7wgCzSy4Lnn1IeJKrDKWYz2ziewR7e/CV/
	 ymRmazo10w3k9dgqhG/DP5peOSMoYiGOeCKm8krYmMh5evjqa3TPAfIZieHonzEGun
	 6ZoBnPRaVgxFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F2460BAA;
	Mon, 12 Jan 2026 17:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0CE718D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A283B83F19
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-nmgwIe7FBl for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1BB283F02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1BB283F02
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:49:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBEBB884DA; Mon, 12 Jan 2026 17:49:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 18:30:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 706038833a37f9a54fa4a0227d19056df2a6ac11
X-Git-Newrev: 92dc57c4604b7fa0893ecf689b5f64f34866bef8
X-Patchwork-Hint: ignore
Message-Id: <20260112174937.BBEBB884DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.120
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92dc57c4604b7fa0893ecf689b5f64f34866bef8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_120.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 0581592c63..dd0724f8c7 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_119_RTM/src/SHA256SUMS
-sha256  1387b8478e6c681c533b1f7b0f4d4ef7f58307c1f7e3a353622ddbf841328283  nss-3_119_1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_RTM/src/SHA256SUMS
+sha256  7ce5f5b3a172a41539ffc118d8ef4834974d0a6a782743e4a05a4e208dd6d22f  nss-3.120.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b6be6dbc8c..5883663873 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.119.1
-LIBNSS_SOURCE = nss-$(subst .,_,$(LIBNSS_VERSION)).tar.gz
+LIBNSS_VERSION = 3.120
+LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
 LIBNSS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
