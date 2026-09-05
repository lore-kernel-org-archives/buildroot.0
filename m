Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90070C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 06:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4136960627;
	Sat,  5 Sep 2026 06:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LH9ewdDv7ONZ; Sat,  5 Sep 2026 06:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 66B0660BF1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788589415;
	b=T18Z2g6crBRs8Xwxd2T1fSi5SGbNt5jSFIGmTu5+oViqLt4JCCH9VKNor4MLTJHBc2W7
	 +7dPUL5UiPg/msmMHFVgw6EO/4CYdrG4GIlvffaLsEwDJMIJ/wzk4Z4om/g7czVa/foes
	 ZGbsijqA8GgmhRLZxt5c6420zuKIX4Xy6N7jBswi6b7FJkMJHCutc+5Jpf8RO4PgEXna+
	 j7IFJjItpWJ9n+jetu9MCbK2IatUZxpclFXX/V/xhaDp4RUqKybHxBTP4yOQzXqGHAdIb
	 vZIc9BanG6SPl4LsYifUVWE3xxK8e24AOF6+2/qwp+gmEVTlRTSMG3jtJVwvpEGDCoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788589415;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4hYdVC/vdeiHitjYBR2OC0TtOjSsh2rO+W8Rd2YuMtE=;
	b=FgNlQC5fxILpOm5fC6KqIu/PKL6Ja0YjXe0thb0mD56Z3oxxLRt4xlAaJtao0aPhftiJ
	 VEj+iWK7XXEJR8oaFx47EnqhUG5bEnsg5paxSE/oBTghb0WiVA7xnDRDEPWjTu3Hsa44h
	 yGHdHJkMEvuQ+1DCgr2YAti3S86q1itDnTexnXGtU240WNG8cAowxfsSqBYuEs5Lf1Ga2
	 FTFwr/w3CSwUN0tpjuSLRtRF3gw6qiPlw4JA4ETzosTDM7cQwBIJzIKjYj4rESD/tEOLC
	 7UeG1Hu2vTT37H/vOa36pogexJbSuzfNGkYQiccX73A4J2NRM8IhxBFSR+CJatERVMw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788589415;
	bh=4hYdVC/vdeiHitjYBR2OC0TtOjSsh2rO+W8Rd2YuMtE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDvBqhQWVtQqp8oroV1UJi78ng67VdzizwTiBh8HhZsmteagxGiO64lXJ/p8WV/Ri
	 kp23cbE6f0YnAJx3HveiYH6sjCJu+9Wmo5J1Vi25XVImbznUnQnbGa5frTGZ3dzelx
	 LNMWj4Y/v7JKle5tBEqjWcC9NGrA0PBxdwS0TIf7nBedoi54i3X9OO7TNaf0fADPa6
	 Pi7apyMyG6Mdh/u3OEbjrkDdEKL4cvtlVeAF2sv/0xFAbRDHKLRHVhD3hmeYEyWeAK
	 87ykEgQDpyQoriaaMsE+01FSzp7EnP0l57GmbcSuemgM0Qaq3yugonlWpUjb+n8IWD
	 g6gL3Rxd6Qk3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B0660BF1;
	Sat,  5 Sep 2026 06:23:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C3A8230
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D9434009A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MVsDaLpH4Bg for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 06:23:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A45FB40024
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788589412;
 b=CMGHEgdQXji+aWDG+uAV1qhFMY/MEvm1LTJODK39bRBQx9wZ94baRSuq/uwH2wteSKgQ
 tgXqhXUDtoPv5wcYuch8R0YbMS4RTig6jEfnb3pDbu7A1KMcM8aRTcEd5ZoI/TIXkgfdn
 deuBNdyj+hy7KmTFvn0JRYeYcM8809yQBTJ4cBbKLaH36XfwseI+aAw79vsufq0R4k9fi
 Rkeu84Xkc1aAIK9BOdIVoF0N8DH2HyWwGbCUOQvpFsvyP0xTbxFgctRqtpJHWfYITZqXj
 OMZC+6mZbnyasJu0dlQwDrfJyLUuLuY+ZqPyswioXC2aBn4KfM7S1g425Z7WubuIUVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788589412;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=NUzFAkqAdKzB72zLmyq2hyXOXcEq+4hf5MWotWY1iSs=;
 b=X0aMEF0gMGKqJ4Xs9XR7jrJD6Fez0s5rqqtaG8NN5n1kvliPMywIhCMAC480wvgjpqvY
 SLI8SQzKU0TZZ/hVCG757ZrT9Km8iZ4M9kLVwYl4IUgvl/DQ6VtvTNUFMMDWg0EJV/MmA
 H0FiHlmxNrMLxnY6LW27EOLvMCYlewTIJXjJJg9+DuQfa0QS91DAUZfSqwb4mCT7HUxbG
 0N86SgS5BVXIAwzoP7YTUlISmZelNgxQWOk+gMFPIJX/p7oauWDXlIe4qVCDjPc1N7AzD
 FYVxoarYTsPELNIdGzoBwrV/H5+tOauaA4GcTgH7KGFljh18KVGQmpUumgDxJFM9lxA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TwKt8K3a; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TwKt8K3a
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A45FB40024
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788589397;
 bh=NUzFAkqAdKzB72zLmyq2hyXOXcEq+4hf5MWotWY1iSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TwKt8K3aNA0nGXbkQLj7TFaHPwV+xftQU4iPpXqhDBwkcTkwYDosfhtyYHJRj5xtd
 a6pBRaQkvyuisfJ0SXIBYogq0G5IFJLouFg1LvoZdAwwWC1gjIWwBhjK6yUo4Id5t7
 XKnhutGmxiHfdhznjxq13pLaqAVAjXreHo1puzuGA8TkEIFPIDTQvluGfjF2STGjZ/
 MAZdhV73IVFKNmZrXzQd+g7gZip9aikVsyOuo2aLGflI9MKIBh8+hDYMzCh5f0GLr7
 TBNh8arIsOyNdX9gJaBhHY/pgqDezuA9gTU7qWMUzsG2mXmhvVcAHbNTs+vQCyVCqj
 PrGJOkieixgrw==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E7FBA4C31C2;
 Sat,  5 Sep 2026 08:23:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40936)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2jo4-000000002H5-3RG9;
 Sat, 05 Sep 2026 06:23:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Sep 2026 08:23:16 +0200
Message-ID: <20260905062316.383690-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905062316.383690-1-bernd@kuhls.net>
References: <20260905062316.383690-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 3/3] package/i2pd: bump version to 2.61.0
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

https://github.com/PurpleI2P/i2pd/blob/2.61.0/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/22dfb2cf28943aeaf56911d53553585d6047adb8

 package/i2pd/i2pd.hash | 4 ++--
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 0d7755b585..05602226cf 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.59.0/SHA512SUMS
-sha512  5fa4365eaa6fbc0e448732d3c96b867e27db21927727aeb9df8241d56fea08561028a7b6d51ba7fa1141d53c95b848108806edb9f420c2ebbed85f627f045af7  i2pd-2.59.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.61.0/SHA512SUMS
+sha512  d88bcb4d4879b8c2399f03f30f360a4121e20659665eda90d46495bf036666e99a05666acc6abd4b67294e5c7d61fdf0d867789e85316dc5338a5c5ee79811c5  i2pd-2.61.0.tar.gz
 # Locally computed:
 sha256  eb5ac2a5ede8cd6bed9e6d93ad943119a73bfaba378f21bafa307f9b026b2034  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index ac0348c24a..aa0b4fc394 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.59.0
+I2PD_VERSION = 2.61.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
