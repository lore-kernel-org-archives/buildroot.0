Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D18C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 20:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDDAE80E3F;
	Sat, 12 Sep 2026 20:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 447NYTO_6Yvl; Sat, 12 Sep 2026 20:47:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 570D380E25
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789246021;
	b=kq1Y1aePyo6RurXVZJQLGBdeDFqlhlfFK7IknNHw4LoHrEJlxgewdu9uTjl8bTvGYX4j
	 Lw8cttLChDve0jMjNHX4GxQrbQs99HyRFDIBKDunbewbso4DAzk8NLUf5iJdaLTTNM4Ka
	 Al4UfSKx/pGLbjHow7SSneHk8WpVb+DjvABSTlzw0v0gZJB09iywVyGKdSjrZcagkt9Wn
	 hC4GzcWqyKCFP87qAm586H2N4dw/ydfvbMXEmVyzSHYbi2myZtnL7wyNHFYT7z83e5CFD
	 6kE3f1nC4d0UxEtYxCSWoud0w9VKP2aQi1hthq2Bu5YdZg7gVIPcszMGUrqUfvqV/Kg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789246021;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=sY0itpPFr2dJK7MjupLjmE4h/5X3DbIo06V0bxxZ6CI=;
	b=cyOKLz6X2kPWh8Uax2lc8XO9RB0G/9S50xrA0L6JsOi+qMBOt8PWhfawgqgZMbxUkEcC
	 9mrLVPkVOr+oy/6eDVb3uEdX9v6VSSypug/PA6nmB5NDQfLfmCEJwh4deGdNnZcGLY4oM
	 xrDY3xLecHWCW+gvsXrlSZvtZnW3L+hdriO5QoZhP/Vsq43Y3ODpHHouLp0OMfQGHoaeN
	 cV642blmaQxay9E/Ko0+YJLUAJhCSI+nAUJRAfOSx6laBuj4aqBKKs8c2QSlhEy3/e4zl
	 Seovxf7Meqy2R2dqilkW3MKqe0ep5MluewVnkw8YG2JjfH6vM841sbsPKUebfVR7MXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789246021;
	bh=sY0itpPFr2dJK7MjupLjmE4h/5X3DbIo06V0bxxZ6CI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QxNUImMtgm5ZhAkYk6W/DFOSUnBhYyDyPVi1iGR8fbyORHGyS4UHcWua/IEvSb4mw
	 5fuoY4LQdQR6pqRRAOV/4fs3KJHFS9djBs1Nh/1XVY3Q6e4JoboFo4diPo5mqH713n
	 Sxsj7jC1przsKHSGngwjsfj8RU/ls+bWR6jZgWAHtaIumRLdvV6TNHO/nOn9iUdP+j
	 /3ivI+F/4d79oEgSqCwFt1PSrZJ76RtpTK680IlslaH5uSeUcUWHEW69M2tvcxxE6V
	 tVmik2Soq4BDVN84MkXbINaJWbUMOzJHohCNVAedCnp+TCBFW1o4ZW3hi6ClH2yZBS
	 qZk1tpNOIgdLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570D380E25;
	Sat, 12 Sep 2026 20:47:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 710142E3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 576CD40070
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGZo6xUDu4lK for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 20:46:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E06DE40067
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789246017;
 b=oAyQQXppSBu+gVzmwQHzfY5oC6HNAR6HYbS1QF95gYJpY15T7FTArNaph4gvbNYLWAsZ
 fIQH3Jla+nIgSknRGPx5q69zF5O1rxUEGagkNQKHbvsxI1ptOxmiIS5g4HEbdEyQAl5Cf
 ugItpALjVxoxKlqFKNIKYlMb0gzv3F3Z/yk+dOWCFfcch5+6/sMuAbJP6WIWTJjPl9vb4
 bxjo7C0+vc8ifMztMAq0lg5+Xu5V3WkuoCjBDuLkx9LmsNoCY1WnbarHa5ROITSY9BYYn
 GXP/zjMz1/Nv0v5fotSSUu444O8QS4EVG3ZynXypjP04jouGw4FhVjdGuF5K4YdUWlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789246017;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=hk/iAqgLqj1hbWSgaP8IeT9V3PpfDyV7piBEIqwYQ04=;
 b=KZ/h+dhYullQ1zA08uWwnAQ3LdSyerRRgouiQBT0CqaPwJr/1IEoAQ03mCA4TKF9lr/I
 q6Ok1cs9P/dlS8uHnCqwAIMmYjjTe71/ZUbNb04l5/cSVRQtIbnOT8aHegxa/bCXwSRYf
 Xptrfet0KVsH4u+2tY1+sNXI16HjnOKXNEf2URTmAGz1g9Ku+b8Og6AEvY5kTut2oSx0/
 q9EbSumfCsX8kZyJSZ9BotobWNNpkBDjc3xpru/1zpvQL1rVwzDEkCEZxDkmjk26kOIOk
 6RCc59tgVR8dyiW1qvh0TTe8G1GGIZFG5Q3LQf7Fy3JLdpsbiLUvvV2UXsvZbAqEXUw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RAycKgQp; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E06DE40067
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:46:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BC6E21A02F4
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:46:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8A3C060580;
 Sat, 12 Sep 2026 20:46:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22AB711C7AFC2; 
 Sat, 12 Sep 2026 22:46:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Sat, 12 Sep 2026 22:46:46 +0200
Message-ID: <20260912204646.1547505-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/go: use
 BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS in
 BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS redefines the conditions to
determine if a host go compiler is available for the current host
architecture. Instead, make it explicit that those conditions are the
same by re-using BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.

No functional change.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/Config.in.host | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 79950983c1..47c7e5d075 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,8 +1,14 @@
+# Host go packages should depend on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+
 # Target go packages should depend on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
@@ -30,12 +36,6 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	# cgo supports uses threads
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 
-# Host go packages should depend on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
-config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
-	bool
-	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
-
 # CGO linking for the host. Since we use the same compiler for target
 # and host, if the target can't do CGO linking, then the host can't.
 # But if the target is not supported by Go, then the host can do CGO
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
