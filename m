Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B48C44512
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 11:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F44240417;
	Sun, 19 Jul 2026 11:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7xN1quH0FVw; Sun, 19 Jul 2026 11:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52F16404F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784459275;
	bh=e/Ki4NBGMZs75eXQg0C+EdE9/rBKrCLKJWClrZpEGfA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZL2hDUhoElfCg8osRIvDAJUn09fL8kiG6woyt9Rk686uH5bYQ3CWS7cXE5g0FEPHD
	 h5revNNvx7mAQC3OtLB5FD0Mh7XcDiMzhhkQt5X7wHktQSTsM6WCwffMeNXGDgsVCd
	 9PsRUvKXRtHKK1rjWEKua3uiAzouOfXU8FEs9Vud8XA9WDOAcJ96gsZRc6tIUdowSs
	 6mKAw7uAEqeAkvA9klZzciQi8qCUakX2MXAaefPMtxoQq9fikECwApbniPmBfRc+LW
	 pRgNGVtSurw7YkeB5szLR0lz5yHkVs+zxt1M5GKNHPTdjEqf8m76K35n12kfsItxSE
	 vxghR+4NroXKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52F16404F5;
	Sun, 19 Jul 2026 11:07:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B01F320
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11311404F5
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dF6ujadZSsKv for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 11:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3502540417
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3502540417
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0BA08862A; Sun, 19 Jul 2026 11:07:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 12:28:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee9ab33d6f0423d767c6ad13be19c1dc25d321b5
X-Git-Newrev: e39e3e11478eb763b25762ee21d2c47c04a5422d
X-Patchwork-Hint: ignore
Message-Id: <20260719110714.E0BA08862A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdnsd: install libmdnsd to staging/
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e39e3e11478eb763b25762ee21d2c47c04a5422d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The mdnsd project has always been both a daemon and a library you can
link to your own application.  With v1.0 a major bug (requiremnt on an
internal header, config.h) has been removed, enabling installation of
.a and .h files to staging.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mdnsd/mdnsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdnsd/mdnsd.mk b/package/mdnsd/mdnsd.mk
index c938890508..ca443f6211 100644
--- a/package/mdnsd/mdnsd.mk
+++ b/package/mdnsd/mdnsd.mk
@@ -8,6 +8,7 @@ MDNSD_VERSION = 1.1
 MDNSD_SITE = https://github.com/troglobit/mdnsd/releases/download/v$(MDNSD_VERSION)
 MDNSD_LICENSE = BSD-3-Clause
 MDNSD_LICENSE_FILES = LICENSE
+MDNSD_INSTALL_STAGING = YES
 MDNSD_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_MDNSD_MQUERY),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
