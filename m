Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45E1CF6D2C
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 14:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D7E840965;
	Wed,  2 Oct 2024 14:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5_Rel7oZauh; Wed,  2 Oct 2024 14:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 150AA4099C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 150AA4099C;
	Wed,  2 Oct 2024 14:56:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0841BF2A1
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57C604099C
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 14:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-MLva8Uc3zJ for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 14:56:08 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 02 Oct 2024 14:56:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07AD940965
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07AD940965
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07AD940965
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 14:56:06 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id w0euswjKqNKTWw0eusf2Hr; Wed, 02 Oct 2024 16:48:56 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Oct 2024 16:48:55 +0200
Message-ID: <20241002144855.88551-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNLLgDUmIL2woU/qAIYce2vCpD/wH5dIfyVNxc7UHjU5YTe8jkBoWYTyp5GwQQlcHeNK9zU5X7SpqAyMl+rkET3xh6AaMCCUulEOQPoXAPxh6vUo8+4S
 6znsODPcgLHPzsldSTDtkwCyd5DGX+edilOVBHY10g9fmJ+DQeUiEyGpZjaYvLVMu9NIUCjTscPf46FoGe/VHYR5/YzMfQ0UQ+6Rx3cC5HIRjmyuwBJDUh4A
 7giAnQU+cuBN7SVFamz+HyaTt3lL/+jy+CJXt+5SnKPmPNvL+w9xQVngr7XmdWbB0PEC8fIl79WZXtrON1dEUA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1727880536; bh=ZG7bFh78FqdLytl2nKaleGK0kh3yn6zgHQth2E3KPcA=;
 h=From:To:Subject:Date:MIME-Version;
 b=JNqatW/6Uw1NaTl1ZHLdtq9qv9IJsT+2B0YssKtEuB6/2Cztmd2LmTrLXG+bJpBd4
 POjRsW1Y5Z9wUJESV8YeSxUU7ROTyV4XiIRxVyzSGx4lTGbcluY+weIRvqJjcWzn9V
 NJM1ZLJJYiH1Z1MJkv59xMFINHjpNHm11t1WhF8MnIpKbO964zgimVozObAtOAKwgl
 Peptv4MF71Q1YfGdDBK/7owGLtoTK93GLyw51Z4nemth1+PPXfF+fQOhKXbmDr32BH
 Ebq1+nbVokXhC537sjuWWA2H9f4HoCmiYJ8E6+vsSuX5LD5lqsO7yYIhNuL7CrQZDN
 wKeDnNsidv9Yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JNqatW/6
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.105
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index e92a6fee25..00be413ddc 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_104_RTM/src/SHA256SUMS
-sha256  e2763223622d1e76b98a43030873856f248af0a41b03b2fa2ca06a91bc50ac8e  nss-3.104.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_105_RTM/src/SHA256SUMS
+sha256  8e8e4c8c88ca5c828b207cfaf66c6188e7f96c97cc18946d3db7da4c0d395619  nss-3.105.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0fd9858647..ec9c591739 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.104
+LIBNSS_VERSION = 3.105
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
