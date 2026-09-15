Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16FBC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 152C76078C;
	Tue, 15 Sep 2026 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTkh8BaLk_TU; Tue, 15 Sep 2026 21:38:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2FFA1607A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789508324;
	b=P20BLDGrB32ytAeH4bPK90Xxd6463SSn6KRKn7us6C6fxisHdwNfR+hjd7bemWBYtRnp
	 19FynWv9oUCQcsjzMQ8wfqPz4KrNhKtJot1MY/PMOo48rXvRSKX+uG9Ik8HTn7yVqhwlg
	 /re+yLBVydNCnH77phjcshqya6cGdgQClLHcWNVC4BeNb/Ob+Lz/uADdnotTvg2uj3FCd
	 buqzwoBBQZQ7MBQtF3T26JGVhbhk0NGSl5UTzoOt7JshfGCV6rn/14b3B7yotri6rbpyz
	 cKB/sW0GzRQU9x/uWJSfjVwWWYt2R2M8z6tpbFTopZjh7+u3m6XNcQtThTnJp/BuAbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789508324;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=excu28Pbk+LY3mPtAbBN3emaKKhygnnhwtzGyYVBla8=;
	b=f6u2LHqXhXd9sEaTzg/AmrXj7g9ZybCPS7R7yLgQeLvPSSAnFXGwYcFPAWJlsPpET7V0
	 omDa7nnGZXKVRyL0g/T4r9H40yUX678yQCtk9SGHtN0mgXRokBPacGfH5vgJ1AqBUd0Gi
	 NA8neivpxG7NYaxMrbAa99mLq56a5rkn84k6qdOLelnZrbVq0Hix+zC5OpTvOeoWrYikk
	 gDDD+Zv4vsIMikejkizTwvNAggFc/7f58d+qmodtHaZMmJioDtg6+D/XJdHQyWjs5+qKA
	 obKxi5ymGMAQxsk/PCPMmtk/0RUA0ERAcjvrVTrWDSGwONn4W2G4nGLhW8tEFzvYMAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789508324;
	bh=excu28Pbk+LY3mPtAbBN3emaKKhygnnhwtzGyYVBla8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fMnqZML7MOgoPskeDaNof9QYBRMTj5RnrOzbpAm48p6lgh1UIcVNVH9RfObv+4VJj
	 J67fMKbE68d6w8zgqjjB4g2oDl3qEFC3YnYzrsNSwgvT9HT/3iWltck96lP0s3hsi/
	 mWhrT2fkf2jLzxLgbshwsi8oTE/YGNlUlD3mou8w9GHXiqkpuLSd3GwLo4m57J1l6e
	 7OSb/FvhAsfjeCAj4tnl7g3y9FTQ0U24YtyTqVFfebe9cmxhUM+gBIGPExNKZZ81wZ
	 ZP3g5NH0VC2jpg/PUp/ioxcFYA+GM8OExRAdJxqHwbtPF3PnhDHjfCfFoBjyyGrMHs
	 xFFvkPjhxgoOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FFA1607A0;
	Tue, 15 Sep 2026 21:38:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D91E02E3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA9C06079F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTEoDdXMFGOh for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 21:38:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 11C116078C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789508321;
 b=R36axs6rKLWeAYfBNxhXAmYtYZ0oW1iW6KyLW/Cd0fE+Sbjwrn1uJsOKf3HaXd69HPvN
 T46ObOGRM0Gdjc13x5vq7jFXI9Os4j8p+K1ujDQGit7R68D9JPUe0zj/VEOltHchikgQt
 maKyGdocy012iIxapo6XGu/bxbZUF/YmpJmx0qBUUjOGP0N+sQ3zBVWFfqnY7QqMXfx3v
 Qu+Yta7YBOtEXY8SrhAaZtJZCBgCAlVAi4bRMuTHICZghDqy3KhMYmgMZAKwMZJQWWqa6
 aEzdcPT0dLretwc33RP/K+GlQJYFY8ZrFQZ2/iiO1Q+i3W/zsjGYEYNKeP9vcDB9aaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789508321;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=0FOGA5UfWk3tm7qAovu35CTBtUMeaewbH54pkOer3Bg=;
 b=X1onmARF+X2uyfsmqpjnwmF9w1G9TE0bph/EpVU7lA9XQlDh6h0JQ5nCycj6hJpkxHqb
 0QdewQSMd27K/M9MWCOrBBT0dgJ7qnCeRZDAuNuzLo5yBKx3YqZpn/o06L2kY5BcP6U21
 NZxtMrRI7WKAuIQsgJnGIAsD+gPnhgtxEWqcMl6HTk4Re6IMCHzf1T9fn/0kDxt5VbHGB
 t3PFXy5TD4hR1odNKw8hUcgmWOdcvfJkguqxpVTMVY1x7YKpVBw08ItQ1cKMgfYn/Qojk
 RcLO2WrTASBhOSswzCejNQ2CqGNPYnMOt4hC8opra2awcG94Y99kX3R0HjiRGIopZTA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sDQvQ7K1; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11C116078C
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:38:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 66779C5CD55;
 Tue, 15 Sep 2026 21:39:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9C3DF602B0;
 Tue, 15 Sep 2026 21:38:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 67D6111C7AFE7; 
 Tue, 15 Sep 2026 23:38:32 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 Sep 2026 23:38:29 +0200
Message-ID: <20260915213830.2025823-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/libgtk3: add missing !BR2_STATIC_LIBS
 dependency
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

libgtk3 selects at-spi2-core, so it should inherit its
!BR2_STATIC_LIBS, which this commit does.

This has been an issue since libgtk3 started using at-spi2-core
instead of atk in commit 2c3ca7bea1de76163aeef432412eb14551ed0581.

Fixes: 2c3ca7bea1de76163aeef432412eb14551ed0581 ("package/atk: remove package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgtk3/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 52ee50db49..f7618832f1 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,10 +1,11 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, dynamic library"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
 	depends on BR2_USE_MMU
@@ -23,6 +24,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL || \
 		BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
