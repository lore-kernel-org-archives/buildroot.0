Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F3CCA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 08:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D77E940A59;
	Sun,  4 Oct 2026 08:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFbWBnL51U9q; Sun,  4 Oct 2026 08:09:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED9DC40A30
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791101387;
	b=InhJCdDcCr9owZr6e1LC8rEJaBq4FflBqb9ZhyU/mbeCZEvPbFkIgISBdRMcVvQcceHK
	 7Bfy/0+3yxeDXbFcji/UMXEGF4Irhxe+zapqjwJX9n2871r2gcU3GtsIkVgW182OU5Ju0
	 UhUyeWjH6eZQXce7tyB/jZuGHz6vZ7+cIz539c8M07xK0un8YpSjTtnKxXiA18AStytfV
	 SNkU7sFB3wb0A/ArC1lpp02XUXm6Q3pKvOQoEYVmlEafdBAyXpnYu/gdBadReDykD734x
	 r+yYjJUNVNQ9gP2f2w8NPjk0zUDQU7rinj16mCBdV9UOc0daGUvij4MGw2w/EYJjOZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791101387;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7NyH4KgkQq0zV34WTYrT0YUq/Lqx2lO9Ulam40DkBt0=;
	b=rtWjJa4EbMdjc++1ScQ7ga15HnsDSnaAWIDocC4M06IPuWxRKekpoAMohIr7QAhU+Avd
	 DdYuq88cwcB3UYXfHEq3pRjkjfAi6H4PO0nhGHuOk2a9QrjKrnrjyXk2p4qqKnSTDY1rY
	 c5y3tbRcif/gc6/RVJvAxcI/YCtsmEqnSvj06cC6JIqxOrxjJDcXpVJW2Qbp7dT7rIGV9
	 8weRaN6oP61/MC2FxE2UrQJOirqUu6GuXH4W+2fPwsap+mRfDsDlrL+6mU4n0ilKz0X2y
	 MPpoYyln2G81egGdi8SJO2HVUNeCY9D7M1itKMVyNfxGNJp5jCNJLyHT8jA/PCQ4klw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791101387;
	bh=7NyH4KgkQq0zV34WTYrT0YUq/Lqx2lO9Ulam40DkBt0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GyOLXDr5P+42chx89DaTZf5Ujz8u2PEEBBHfvUYEdsboUj/wCFugma5Vs1yJ/fMfy
	 +8JXSpe54II5x+G0dNVzwmgzQSP1Vo/EeFiGEzDS/+kMMDqzigYyOPpWwm0Y0Rrxoh
	 GZ6vBsAkzlDB7HKIhst9SexcGZ0Uwpcfco7wGo/A2nqgyeqBXaFiPxyJRm6qVy7WvY
	 15TtzBDWDu4phq2SUroQ8X8hfGvoTR7PvpgujVipU2JtTXj0DGOgvnRaCqv0RLqpNu
	 SwDE9ztSC+fb3n0+Y+BLOXrcpJ0yJQs5cGDFyTmnRABYskI9uQ4GQArH6rrdB9pvpz
	 FhJ54/Tw+Yytw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED9DC40A30;
	Sun,  4 Oct 2026 08:09:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A298E338
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88FAF80E75
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzPMflaj3_Up for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 08:09:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 440C680E2E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791101384;
 b=SWc6nbSwjFuJUvUOcu/nJwo2SXXobOMs1zE7Htf1XZ4QhUdZ4qbZgM9Zm7+/dR6mZFT+
 t3eee8YFVRF9KU9DDUAfun0m6xVbaSIM6ysXbbk4rCgYTIP51zNUABob/RfCmodOUdevA
 dyLpg2boJYMSUTLr7A/T2M6ENa3Ower2txpFEvvhfym+X/wLo7XmjDxzOOBtc5rQMhRKn
 7flFncJkWp+M+jQ4rGcLxXsA8GfxgPpa9vScr+OiIvRdF7u8p5eFg0OMlExjFfAiJng4+
 g+6EpK72NydynQIY21w3NfTbmDlZjjuidQ+swp6ObGOSZi4Wg3imeYmaJdGd8aKjEPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791101384;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=crvoY1ie5/68p0GUz3ql+y5lT2R4d+iuFOdn2CBfsBY=;
 b=RHGlwysQ8y0McmyX+QJsJGfDsJsz2qtA1O4ELcwjmmLtAxo/UxcGUAmUFYKeln5SwFcL
 Prh+LfM2Wh5BK8VxWpKmKUCDiu4g/Z/+7PWpzQyfQ9cxnIN8oXcw+pUlkbRCCZstVz6SO
 7Orp2Pv12jgzoqDDTHfYI4qVZbCgsBteH7kv9b/7HXEMN++jSoTCCu3u6TpY8ayxpq1W7
 XEhE3PdpQI9HB1WXwYisJQ8Ytpg06qROQHOwcWnNvcqbpN3SJKMyOz7cZctJctPerk36y
 k7aTo+/8HYAbCk76rS3ao+Eu99H83xoJepMswiFzDaTH1yS1+6NmcXoaEB66jbr+a/Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U6zAoqf4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U6zAoqf4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 440C680E2E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791101380;
 bh=crvoY1ie5/68p0GUz3ql+y5lT2R4d+iuFOdn2CBfsBY=;
 h=From:To:Subject:Date:From;
 b=U6zAoqf4raUr4XFgKCW9ybCnalpV+hyGJ1bzCN0QVXEHcaXdJPLViTRL71QwjLVb9
 P64DAevR9sin+pVxJODGJebGwta3cJcjqv9QLFTFCVK+N/2+XPgIQdk3DsMYY0xjML
 crM2Vlqe6t/OhVx8NJEe0FsCUHB2pxyYB/ILYbqQ5x+hjdKRGz9/5vReYSaZkREkFp
 lyyu8X2+E7brkV1C880+UZ71/in2KMEJ6dQ/w9n3ptTvvREimMz/SDaJcjEHj48IDS
 DwQ4gy5zIDIY88LpDkzrW4ujbVXBsmAEsbDdmaVSNxguk7BfD1mrq44jwy/YdEU+FG
 kJY7YPOL7KYcA==
X-KAS-Sym: v3:f51bdf72230551df:myykiwQpj3FLPW64/Ntu2vKiNNLe7h4q+kSldFuaHzl1U
 Yv1u2/71b0paelbikvmI3ditghOJdUNrumRYjBGZDzqF27Dvbk6KYNirDSp8VtlEzRq+2uzGQC7
 87dHyl7YXitnz+w6gi3ZXDYQzyYnPwMCmENqlZUK+WXqFKEVwWzMils1bj7EvDKEJ/VGNjMfO0H
 TgJd81j6+D74lFKt+v5w2M0JkecqAt2H8TeUefP3/Z1koC2qV9c5lSZYezLw5uJiXRGJFcp3Pll
 71PwNc8PCAAqgL35a29yJyL0i3OE1wBDs4zl6fo+EF8Dw7qS6wN2X5e62cDYj3LLXld8Xhhw==:
 isaeAYCcHgQ05U0FDSiT/mQZ0PDiMKdQbTPhwWEAypPQkrVh2VHFj3CCn+5gz9IOjvmFJ9J50tz
 3Fvvfl6c5EmDsR5wMyhXgoUQ2dYj5FvMJG3x4GN6aMGwyyE/BSkOUTPprk/d4MQZLdIm1zROpe5
 lVCtMCGwMpH2KfyFudF98bQOvObA24C6tkHSNCSVJbzj5p5wfE7fzrzEmCN5rD/J4UHm9+6NW31
 6Ll69Re4i5Q6KEjPH1pX6kKtsmN2QFNdF30VTQKxMzpV5XXvVFyg57fwUBjzkBFGfo9u4U6ZPh8
 4FobK9sPMXuyA6GUd00acqAESka+IXvX/GsWNmb61HdNHXpstnbd6Sfyrxe3U3T4HfPN1MeFh0X
 I6CqtnFPeVvUpE8CcOlcRz7VP8AedWlj2dHMKx4vloC7B6PFhIbaGsTQJzvgRSD7+QhHVKRSL/D
 k2xTZyuy5GYXv58Bnt5zZOdoib0QWwTfrpY67oZCuHJYwd5qhd2SGNVshQNO63h/h+foJy0Uf/V
 cz0Zu/l6CPp91tCjVByN3iUMiLNdmhaqYflquRutl6eKLKT7ufsyORTHtio4zih9wkRgq9IUd3z
 BGqekQ6s2b3Oo+clXRl/VpAGtA7O8/4LBWAee6VVEPTnB2g=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87ABBA4C4FCB
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 10:09:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50282)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDHHw-0000000048h-2DIG
 for buildroot@buildroot.org; Sun, 04 Oct 2026 08:09:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 10:09:40 +0200
Message-ID: <20261004080940.3050791-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.23.5
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

https://github.com/strukturag/libheif/releases/tag/v1.23.5

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-v8qw-hwjv-44hw)
CVE-2026-XXXXX (GHSA-qwpf-5wf7-r996)
CVE-2026-XXXXX (GHSA-9c75-9g8r-4728)
CVE-2026-XXXXX (GHSA-r7gr-2xm2-23wf)
CVE-2026-XXXXX (GHSA-q492-cfcm-895h)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/188f0146e907aa08e0d9dca0bbde53c5d5cd8a97

 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 78f59f6b67..30265f4aab 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
-sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
+sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 3428646016..cd171b9637 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.4
+LIBHEIF_VERSION = 1.23.5
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
