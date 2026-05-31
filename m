Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FB2CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 11:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC27E42393;
	Sun, 31 May 2026 11:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeOFL6YJKu_e; Sun, 31 May 2026 11:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 021A542483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780228619;
	bh=5DXDQfieSWRG331HfCJzhdvcV7ZsfAruzPgLp++kQqI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WlKnGFHlDNLy1SEZDYEpMH1yR96GX2COQKYAcpHD2W/H41Ge6w1iCm7T2typktNQc
	 W0iV6EghLMCVse9XPkleqOsHwCuNhZRWYJjodh/1P8027QMYj3s2d8Ds7A+e8Cg0J5
	 htvUqTXb1pDuvdIDvF1v4TqIGk01rr3LruXRDzrda/lnEDd8Xx71rWLn8Tdq1Ozp8l
	 0SjWj8pjtoKFAj5h8H45XNpxJED8gVsUNpxumP9vGQtQOvBMdblDFyxqRzu9SC9e40
	 VyjAWXiO0YfSrrDX5zUDRWChF5G7nojjI6oQoUTWuQrC3XwIzdhNt1nlAMOtEuHYu3
	 w+eArCZRU9rmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 021A542483;
	Sun, 31 May 2026 11:56:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CAAEF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E18A40567
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5SdxSqg2YYB for <buildroot@buildroot.org>;
 Sun, 31 May 2026 11:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58422402D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58422402D4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 11:56:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E254E876C6; Sun, 31 May 2026 11:56:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 13:56:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d5302d4201912295ee37abe51cfd3b97ba8d38b
X-Git-Newrev: 1d6a0cab454f319524f8f17278a600ce134d1f70
X-Patchwork-Hint: ignore
Message-Id: <20260531115643.E254E876C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cryptsetup: remove
 libiconv dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1d6a0cab454f319524f8f17278a600ce134d1f70
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Iconv dependency has been removed since v2.5.0-rc1

https://gitlab.com/cryptsetup/cryptsetup/-/commit/6e47fb6d8525a96bf264fcd43c163bb4057fa99a

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptsetup/Config.in     | 1 -
 package/cryptsetup/cryptsetup.mk | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 5062bba45c..00424af8b8 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBARGON2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6fff7a1d7b..758d8ef403 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -10,7 +10,6 @@ CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
 	lvm2 popt host-pkgconf json-c libargon2 \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
 	$(TARGET_NLS_DEPENDENCIES)
 CRYPTSETUP_LICENSE = Apache-2.0, CC-BY-SA-4.0, GPL-2.0+ (programs), LGPL-2.1+ (library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
