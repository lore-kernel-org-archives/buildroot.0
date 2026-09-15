Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1857C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 21:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8BF4607A0;
	Tue, 15 Sep 2026 21:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7xrYkSzd58S; Tue, 15 Sep 2026 21:51:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B6D4C605D7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789509078;
	b=aUGFs91m/7gsF5zjsvXK6fYhwnLZgN236ayEpOrUNunS+icr9zZgOv82PwNs2NBqY3Fr
	 Jo4D7oDGBs/4S/HVd1TTVhr5YcnhtapYpjdDui3mgrpeEnB/TTBxAisos1zv0qe0yBchl
	 iZiCS/rvlgMWbSCRykdp0u28YtCm9DPk9I/E5FNXjUWfsO+VlL52XekhzgYzVPJZ7D1IS
	 wYiJWhd/CXGulZRF0v6Clh4xBvXe6POwv/k+6xsL3OjZnGjrfXdvNqkOOEYozDBNcBVhz
	 /CS2bFp+jRM/79UVWNKVQ7XAThIWuX1bcZwLkhqn8bfnMxfTbEgoiT/bC8gkbNNOKLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789509078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RYWQ1uExUEj4o5IhSWt+53bB+9kz15OICuKHy8PX2AA=;
	b=QDxG2NERiR7J59jbI5bxl7kJzg9hIO7PBhz1G/TbSNvHSUWHCeYUaxyFM7DFn2NMeZHB
	 RlvtC0FRLg1pr7oKWvpBaX01OYcwLHIVnwyL0OLYlZjPSE0jxEiiIklpkieypgT+lPsZb
	 eig0KY1k7ywIdvv8QIBjQN7tlww2yahLQliSQXfdp7s52LZ9cqITrlIj3JxIuyjE4hzpN
	 fAW3oAyoYlKQnV7cYsrcMGvvngqzo59yH/5ew7ZQSIdPBmTrbW+ZXYFzaQjeKI7UQv41B
	 YWXHhYqy4hm4kPmhtnEySg+DNh6PHseh2XvcnaDS7vwrcCfjgATIsWGgQTHE1ejbuug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789509078;
	bh=RYWQ1uExUEj4o5IhSWt+53bB+9kz15OICuKHy8PX2AA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cA49xRpBvbIxH+GXM1kQke9LP6ls0Y/HUcdxdThtDQ44oRYNueDgaHnuZzKvalL0n
	 ArNEzp3Z/36IHVrV6EvEeC+paR7pZzPxo9hDUIuKqNaJ5m/kr9L9j/WlH1EM6Vy43V
	 vhLkjBoxKuUUtjWFvwxs2HABKJRoE//GTSn26vllwGSxNs+zWNlJFI5tKRWrdHYSKZ
	 I6RpV0M1yv9zBZLl1B184Fa4tBBf/j0HCYlxVgJsdshDmRGjBr+Zk4dIOjjyWj1b4Y
	 kG/43mgvC2zmLQslZwNTEkAkCoOqe5AyH/3z7BGGaw/Q+2Y1r3GbbP9a5q1gCvV4vo
	 jHjlg5t1BaQWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D4C605D7;
	Tue, 15 Sep 2026 21:51:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFDF9352
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD9A5605D7
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9NA9mVuysd7 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 21:51:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 471D9605D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789509075;
 b=GiYnTh7lYoWn9kYWKQBFHYEgmixCp2Sp2uDab7ZXwTULWTgYEe0IDUjF+lTXLVRJ9b+a
 lYlzS02B/ieNAmEB3b1gMC3eBUerZBqWbMr0k3Gwiw71YVkDhm783znxjkOTUO0AFHSqn
 issJm2KrdTf9HCAht3OQ+UrydzXjcWNDQCeoJh4pyFY9DPwteKOZaNoG35JrDLT8xBwPD
 Tt2h/y1OuZWzhNreyvEc/Di6Q7jy6y7vDNsLzbyNnRQ8T5KcSi2pFglPPtl9nCvzyjUWZ
 wgictVbqVimMFB2xWTUzHr03JFi0C4nxcV1LXenpGwrhSpuP7kGad8DVzaAmeTwKmRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789509075;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=Q/5DQw1+w48z1FeLGFrgTNk5QvxtbKAa0Kpc/MZkcu4=;
 b=BK2MseT158q92X0vu85o62a32mYBbzhKo87hxHdTNHkfQNQZBMp+8EPjPVppQDg2z4hO
 gX8tvJ/87yi1LOmX6+kxj3tD39rCSCMbWRq/gh+WWKplAlStqhLAL862EkvLdR6dti2xD
 +pQTq7+sIv/f+IVK4n6yeqIn8NpbPBty1sQ/4yeLICxyiNYt5etEqn5pVTX07qVrYq+h9
 kxfx145y1eW3eZzJtK4ckoMbzjEwd+tp3uDovkUOrF9MapoHQqTeP33APp56mMvagF6mx
 ugWD2lPoZtVITYmNYiX7OAgag9hlac8R7/n+ZrPAqXIITTNhx21QRrGcjnr//SxlkZg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OT4UjQpt; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 471D9605D3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:51:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DD4411A07F0;
 Tue, 15 Sep 2026 21:51:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB23E602B0;
 Tue, 15 Sep 2026 21:51:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08C5711C7AFE7; 
 Tue, 15 Sep 2026 23:51:07 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Stefan Hager <stefan.hager@ginzinger.com>
Date: Tue, 15 Sep 2026 23:50:58 +0200
Message-ID: <20260915215100.2031555-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915215100.2031555-1-thomas.petazzoni@bootlin.com>
References: <20260915215100.2031555-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/tensorflow-lite: fix Config.in
 comment
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

This commit fixes 3 issues in the Config.in comment:

- It is displayed even on unsupported CPU architectures, so we add a
  "depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS"

- It doesn't mention the need for a glibc toolchain even though that's
  part of the dependencies

- The requirement for dynamic lib support should be part of the same
  comment as the other dependencies

Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 ("package/tensorflow-lite: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tensorflow-lite/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index 604a1ea9ec..2536112f99 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -31,9 +31,8 @@ config BR2_PACKAGE_TENSORFLOW_LITE
 
 	  https://www.tensorflow.org/
 
-comment "tensorflow-lite needs a toolchain w/ gcc >= 10, C++, threads"
+comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 10, C++, threads, dynamic libraries"
+	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
-			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "tensorflow-lite needs a toolchain w/ shared libraries"
-	depends on !BR2_SHARED_LIBS
+			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS || \
+			BR2_STATIC_LIBS
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
