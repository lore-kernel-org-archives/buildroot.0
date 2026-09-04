Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD641C624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 18:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E47640B7F;
	Fri,  4 Sep 2026 18:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyNKbjW3Gvrc; Fri,  4 Sep 2026 18:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BBC7740B77
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788547862;
	b=G+jeq00f8jMqTqak8zvVxXnRIw3yFssW7FVe02wHYOalehGEnYeS4KdJiT6PO2iZwIyQ
	 9wVtx4OA5KbHRrTSY7KDoTy+2n7fuYq4NBMWcNGfery47EOJHGmLKYhX6EhVO+0vq/q7Y
	 GYkkh6FniLuq2xGpXfvQknT0M6XmUN+q0d4vIjP/LNlZvBShRo/UpCg1O2f0utG9imyko
	 dU0eOqeKJMWPCPgMkpYxaLUgc0JIKEAbHt1Zbfvi8wqGZSk7rOCy/jpq+jMuVijo7azYT
	 GXN8WT6x1q94Gio6tAaJ1gQHdtZbLnl6o2lsWk9vtGjmK4IaRetusqwvB741BgTc4xQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788547862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=SFenxfvoQQGtCbYeuev0yPDV1WpMYULI0uqj2KOj6g8=;
	b=Art7JbsNKOvGFkxDa993pabb/AixIS6tYwpFvzphct+bGidXUAUh2eKhKcOJgiUWQ/17
	 FrRzWb34Ugbw6B3nDHKUvtGso6yqoRxUQC6NsJuqhft1ruVeGO5bBUfPYjR3ddJE3QGdd
	 B9UVYW9+0XZcdyFPlk4F+ZJzx1U8XvxhbTvjp1YvZTj8nhAv8HvvYwArKUCQ+DIIhj4Ph
	 819kIXIzEKeJ5qYkG/h9QCOkMjm251NaNzd7QK94cwOOv/hmwP5e52UmFtvz1lh6aFTxK
	 zS4Uz7fa813n7Dbc3qfC4nx8ImA9Q6hZQ0C7Fb7dgncG7jmytRZjnPWrGXo3OXiF8OQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788547862;
	bh=SFenxfvoQQGtCbYeuev0yPDV1WpMYULI0uqj2KOj6g8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CY8RWsvvcQpJLGVl5Y5vQ2kZfE8rUR6Hh2eBrkEt8ley0Alx93VLjbJW6eB2Z0uSc
	 TR5ra9Zhool2NWCWIFbO8RyNWI3qQbubt1KbHAjPooSARuQhaNypxnMVTuHGO5/Xzd
	 l0DU23lL3ToNDdcR8B2ivxg0AjwVOt1i6R965QmVsMTA4EaTB53synitJAITsFCKYp
	 5aBwb59q5aSkP7SGgCJ5/5noTt4VWbn1hG4Winq8NU9QBiFnpmKBhl0pE6GtX4DKXn
	 Q3MzKc5fr2Iwdi9X2tXxl73Pu+gdLBuoUpxniAnV0UhpuspsX8J6UsjIbfnefP+Bpk
	 kpHAP2anhyrhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBC7740B77;
	Fri,  4 Sep 2026 18:51:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94A7E3DA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A9228112D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocg8tkDi0luP for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 18:51:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4C98981126
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788547860;
 b=P0Ct9wfttS4+svvKrPxBCOOlG09SX2gF7gFwz13D5dLHk/gtt6YpVLzETH+0dCsvWg/F
 ULF/fo1+OnmrHbl821/zPV11cMXcID2V6zHVS0yE/rXudUxzswtIVTJtTqDns6WyySLSf
 LJ2kgKzzFURIXzAIYQtXdjmAQa8VdTzj0X8/LmrduaUKVFINsLx4UkGnJBwAFtl5XLtyE
 AGeHe/VRN1reSBFsvTop/fPhXWQZs+OMBbukt4u5fII9607ifaVWDZDRY9hXWEodW+D02
 HtzQXRzTfGvf/SdH8zp0FN3xi6p/7OcoYJ6MsqjEnZoUDXGtlUuoBnFibVzKokeKr0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788547860;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=YziTpQGhRIY+m4zpPBaSik/4pzS9ZNA4w7bqFybAX5M=;
 b=DZ/4dKD1cLTxs+0IhMVX3bsj+YisRq9FDAbItvHqtwoOfThyqHhciVZ4B144amJI3nrD
 uo69jFVnM9ws6fpy7g0XKN1Iib3gpvlHWMbdVU6eHHFFe+nAZLfgOIpNCT4F9VCJ6dkKx
 q/XMtwNLfC0XQJQBGiDZoIkLXOxFpM5cx+8h2rv+ddaQkiVbX2EbrFwiPGJXBkZriwSG8
 afV6YlebCGYKu3zitXX25X1lKYdKmxeHMQh8O2SwaJkZL1n+gaNWk++uWTNllT2hBM149
 8WvjNgnpFTgTBQffPwRxgXP1hmNea9+gjx8MCqmlfnm+b05b60BqOIxxHn731BlW0ig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=f98UavJj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=f98UavJj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C98981126
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788547857;
 bh=YziTpQGhRIY+m4zpPBaSik/4pzS9ZNA4w7bqFybAX5M=;
 h=From:To:Cc:Subject:Date:From;
 b=f98UavJjfW4h9ADYNveCyYGfPMMPexCFsqduLg9tP8JMIRdfBVhVBdDJrQfNTuOTv
 gdWx4fIjHBbIOGnvskVHKUCZDg/4Gb3Y8bwweXy1m0vbc7IsxXQs/k6ZdQpT5WijDx
 +e5itOEKisUuzH7hdrr2eohl0gTwwZVNRK+g5FS88/7URubZ6UV7IcLKmpNgrvdLid
 Xhnh3w8ybW2jHlu9FuF7AjbdTkmy0HHhhJYEFeIBfl/WWUp0Q5fxGed5vR05h7jkfU
 Nqicj8BcUt4Ip2aq7XWdJr2AuoOeS0X3xk8bHgT3yDvoV+KoES/b90iHJyqjGsQiSC
 zA03v77D2iTEg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D844DA4C2F2F;
 Fri,  4 Sep 2026 20:50:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35512)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2Z05-000000006ZK-2Rak;
 Fri, 04 Sep 2026 18:50:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri,  4 Sep 2026 20:50:57 +0200
Message-ID: <20260904185057.877269-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libcamera-apps: needs gcc >= 10
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

Buildroot commit 9a43bf6593aa981040e5ab91e69946af4fe0cee2 bumped the gcc
dependency from 9 to 10 but forgot to propagate this change to the
libcamera-apps package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcamera-apps/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index fa41d1be2d..397d59b6d8 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
 	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # libcamera
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libcamera
 	depends on !BR2_STATIC_LIBS # gnutls/libcamera
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
@@ -25,9 +25,9 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 
 	  https://github.com/raspberrypi/libcamera-apps
 
-comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, headers >= 5.5"
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10, headers >= 5.5"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
