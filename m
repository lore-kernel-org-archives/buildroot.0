Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B2ECCF9F0
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 08:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9463042233;
	Sat,  1 Nov 2025 08:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RybYwvm33SKX; Sat,  1 Nov 2025 08:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32A2342236
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A2342236;
	Sat,  1 Nov 2025 08:40:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81224113C
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7266784C9C
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Iw1EaI9mvl2 for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 08:40:31 +0000 (UTC)
X-Greylist: delayed 490 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 01 Nov 2025 08:40:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1F3E84C99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F3E84C99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=adeep@lexina.in; receiver=<UNKNOWN> 
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1F3E84C99
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:40:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49D4D1394B2
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 11:32:18 +0300 (MSK)
To: buildroot@buildroot.org
Date: Sat,  1 Nov 2025 11:31:27 +0300
Message-ID: <20251101083134.971777-1-adeep@lexina.in>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1761985938; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=m7Nw+8GevM8xgiKizl/68h7Zbb3240gaognsC71Zk2A=;
 b=hhufN7C2F7TBEfury22PC4d0Oncie5BajDTb5fLnQQGclEknfw46guAWxRJ/eIj1CKVGMV
 bz16LKzjzYJyEyGGpa5j1cfU6oDiS6yqk/WPIDzrkWIXoDMCB6fqUtaM9dz++HoACbvB8y
 +/39VqfwYLeNZo1cbSOzoxFU0e4IDLF1Zn30fYKISLw+4pff6QuWbR/dDpqryv+7DyUPFl
 yHjQ9W/6QHe6i/8jVZ6cb/0ajF4XAMxne1rPagFsftgiIlzcmUMd5yOJCVJ9V6msTTSdj9
 c5Ib9vdyuOWTkIRRrTQEBFa66r56oUPr4kAu1Om6O2d5/YQfHHlN26ZjQyGnTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=lexina.in
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lexina.in header.i=@lexina.in header.a=rsa-sha256
 header.s=dkim header.b=hhufN7C2
Subject: [Buildroot] [PATCH] package/rtl8822cs bump driver version to latest
 with support kernel 6.18
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 2a649fe493..ff2e5d3eaa 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  12bf44c0dbce921440f5800a98e877fadda2d656824cca546c2b9e0e99e6a489  rtl8822cs-0ef9ddd619d2a386df90fd7c32b65958b0d675ed.tar.gz
+sha256  71d1d29d1f04a9decaba4e23df0b213fb454c4cf15f6305133d2821188b588b0  rtl8822cs-2519c0b865e31d93daa65fc5b1168722f6ec7526.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index d10388c2e1..c6a541dd99 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 0ef9ddd619d2a386df90fd7c32b65958b0d675ed
+RTL8822CS_VERSION = 2519c0b865e31d93daa65fc5b1168722f6ec7526
 RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.51.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
