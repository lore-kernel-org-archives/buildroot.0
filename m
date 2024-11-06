Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0CCD59F4A
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D32860592;
	Wed,  6 Nov 2024 16:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrFhxkeHCRiw; Wed,  6 Nov 2024 16:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BBA260729
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BBA260729;
	Wed,  6 Nov 2024 16:03:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60FD03B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 213218119C
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 16:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoMsGjl-eQ0r for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 16:03:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9835811C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9835811C9
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9835811C9
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 16:03:17 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8iV0t1ExDwy3r8iV1t04l4; Wed, 06 Nov 2024 17:03:15 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed,  6 Nov 2024 17:03:12 +0100
Message-Id: <20241106160313.453637-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106160313.453637-1-giulio.benetti@benettiengineering.com>
References: <20241106160313.453637-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA4dYBYyd7YKXD6cvo9oXnJi7R84+n5m2+kgp4IpW8Vmp+1WHLd3xFv14K7ZSpv1NwV8VZpQ4tSZkOFeclTQFXaiAFj/xTo2me1eepuMncSW9Ervewk2
 iW2SbuGooHheJlqiLqeAUHJLUrRWhRsvDYRyEpCiPqfXIATVtgCBBZy9xAV+P1B0WZHW42ytqizqqz0+eAMVwkZv/s5iU6d9nA5LNC9wKX9Nk6ZS3X5279OE
 25QEUj9ptu2lc5PfiMBf0StBGJtHXKGmlE6Jydumr371QEekgWxWAd481TgLadKqXWM4AHfgndqfSHk0XwKsMA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1730908995; bh=Jc+ayjlCHQPIwvNIT/QS7C/gprFadM4yORjpj1D7kbE=;
 h=From:To:Subject:Date:MIME-Version;
 b=F6Z99hiogyr+Tl+p0FYfUnmRzkq2bfz1EOp/I9mxkp2zAabZLv/2066Ays+CflldH
 7Iyz6DHMToBcxhiCCCUbZUB1cgX5E6neRMPqbFYXJYpz8URb4r1D3oFSdpCG3PXlMy
 RThWEYtR+uMIbNHxwNWpE7bYunzsE4e3HlyK1kXuIR2FtKUZFeyeUJlvqbS/L5Krey
 ZpsDOQez6TMgKhwf2UOES2vVaE91Y6F2Ve3/yzV1dl1Y5ANP3WTXppeGNFbOrmIuxG
 QIJ0C9RHGhZ1hGto1Y42vy9rSIABcn0ZqsdP9vuoYq4EPbLg/0XvZbwVS0FupLtfRf
 LXgjAkjsEev0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=F6Z99hio
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.36
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index c569135663..521447e051 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.35/src/SHA256SUMS
-sha256  7ea3297ea5969b5d25a5dd8d47f2443cda88e9ee746301f6e1e1426f8a6abc8f  nspr-4.35.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.36/src/SHA256SUMS
+sha256  55dec317f1401cd2e5dba844d340b930ab7547f818179a4002bce62e6f1c6895  nspr-4.36.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index e891aa4852..62a2b92db6 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.35
+LIBNSPR_VERSION = 4.36
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
