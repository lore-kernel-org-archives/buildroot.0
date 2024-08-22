Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250A7C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 11:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C922D817AE;
	Thu, 22 Aug 2024 11:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QefLc2M9IRK; Thu, 22 Aug 2024 11:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF841817AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF841817AF;
	Thu, 22 Aug 2024 11:52:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BC981BF361
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 11:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38466402A5
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 11:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-nK6cGVz5oc for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 11:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA84B4027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA84B4027F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA84B4027F
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 11:51:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4BB7A1C0008;
 Thu, 22 Aug 2024 11:51:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 13:51:51 +0200
Message-ID: <20240822115152.2120669-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724327514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3ALoEgAaOjr0oNa6IB7zMvxmHdXl7Uyz2lpcM0dB098=;
 b=TX5x8mx4Gd5s5pv2HY3PCWpNSa2CrX+Ax2FVUhHOP41Cli8h5xjM23EJVMSjT5fGRIUy2V
 P/baGbKTekFjSQ887u8YZBmI5y+9F+BM6/ksqqbA+FH7nsX9cooZXZli3V7vKyF5EjvU2A
 5AazFJ6gzL+KK9kPimrkJ967naFI5w7c+W8dk1zFK5TzqQdW5RzFtuxKjotCdJgFse/QOw
 ERkx3ppE1kzZLIIqH8s1hGjLIvLJhoVe4nHRUKk2YwQ+eZqcWPsi20y13ZJzbO9KJChxh7
 2NeChA6sSrbzq0GtWED43NP/QOen7xNApc72IB1A/CNU0f9XziOCLuq3Z7S0gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TX5x8mx4
Subject: [Buildroot] [PATCH] package/double-conversion: bump to 3.3.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes between 3.2.1 and 3.3.0:

- Fix some compile warnings in Visual Studio by @Ono-Sendai in #188

- Set permissions for github workflows by @joycebrum in #191

- Add flags to control trailing decimal and zero in exponent form when
  input has one significant digit by @ianmcook in #195

See https://github.com/google/double-conversion/releases/tag/v3.3.0

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/double-conversion/double-conversion.hash | 2 +-
 package/double-conversion/double-conversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
index a2ecd4422c..e3a5754933 100644
--- a/package/double-conversion/double-conversion.hash
+++ b/package/double-conversion/double-conversion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e40d236343cad807e83d192265f139481c51fc83a1c49e406ac6ce0a0ba7cd35  double-conversion-3.2.1.tar.gz
+sha256  04ec44461850abbf33824da84978043b22554896b552c5fd11a9c5ae4b4d296e  double-conversion-3.3.0.tar.gz
 sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
index af1fbab078..74e90d30d7 100644
--- a/package/double-conversion/double-conversion.mk
+++ b/package/double-conversion/double-conversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOUBLE_CONVERSION_VERSION = 3.2.1
+DOUBLE_CONVERSION_VERSION = 3.3.0
 DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
 DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
 DOUBLE_CONVERSION_LICENSE_FILES = COPYING
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
