Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57070606A334
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C0HYR8TB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ORPgstto
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F90608B6;
	Fri, 13 Nov 2026 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCSGaWw9hpWy; Fri, 13 Nov 2026 20:42:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D276E60D91
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794602545;
	b=KBjYZUPBHG/955IgePU+GRq4XSjNwKLKs13BQ7M5LA9keYin+o/2oAAgbWM7HKoLRFwR
	 EjDd+ZSINyE4aeCn9AaiGxxDlrUcz3LsTNZnpK3UV1x3sjJXHZfdln2//5qEik5QM7Sp4
	 tEg5Nsg7NN9115/zIIXKGyJFhAUxY0GmLbECjmHzqV6gQP0xo0tg2F2Rz5bpLheR0pc4e
	 ky1xnmxMtqRRM5QG6XdKSNqr/3wQztURr7737iva2WX6Im2aHfz+yRuALAZPtxJiE0WoW
	 voEu+Ozw5sdzmnl+IPlZzQRy+IETMUcx29/oip3vdLTDWPOX/jdvazgExGi9+siOzgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794602545;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p3AzWv5tpik2nHvcu2yk9Lc09MWt9xj+GtpD1HE/KwM=;
	b=OIBbVDfzpeSIPFsnO2ADmE5s/3KJ/XRElM7IXMgZ9Naw5coLQtpv/au8eyOpCIkEbigX
	 qEN/z752oE7onLd69psx4IbbPh1cjiDUNgkk9ILiq+o8EZZWLlN1Fff8jIfBOeJV0uD2U
	 nuXbqV0mvkZ1pDMTw0klxS3qHTU9xcTN0Xk3JsQjHCJfKvnZi+8Iea2jPmgCpYHOg2RYE
	 RUokS0FIkJIEcFVU2e376L1kqS0VaflV70C1TgZUVHgM7FDYW9YsicFyXnAxPTFE0kYJg
	 l0FjgPRW3GFQzIdGlqOWLH/7fREz35TrCVLa5fawLfwMT6sgD5x87oq7MwIr5K9c/TQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794602544;
	bh=p3AzWv5tpik2nHvcu2yk9Lc09MWt9xj+GtpD1HE/KwM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C0HYR8TBi7xr0jp9Csu1ANFInjCNJd9QnFDU2M/QKL7ErUB0el6w9R6I5RJrMo2jO
	 FPuq6lv8KEf0T3WnrXF9gEb38508V8ojP6BzHhg2WSdWbEsyxaOEPjspVX9FCPo8UZ
	 OL0FM8LNhvZXkzbp6d31/B9Qgr1/b8jLtnm321oICPPi5zq1r2Ocxi97exa6QX3T7I
	 xdqOb3ForqzQohlbJsUdl2BSTLfbwn/Q3Af6T213KKbcNz9o6f0LDpYIQTKN0lrRB0
	 8g34dfmb5uqKoGHVTYqta8US1RJapW4+Kc5AuMV2DDG+Dj8UevKwKj+Noi+LnYQlsM
	 i2KxY9bNrgymQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D276E60D91;
	Fri, 13 Nov 2026 20:42:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A6C02FE
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 20:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C806400C8
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 20:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAZj8YwppUUj for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 20:42:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9EE0E400AE
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ORPgstto
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EE0E400AE
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 20:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794602536;
 bh=HJ1DI+LXTKAgDinIQ54UKSkwyo6VNOf+6Oj9wmRQpOk=;
 h=From:To:Cc:Subject:Date:From;
 b=ORPgsttosZh3Mjak5wnkd1OMnhARafBXRwUzQS+UH71lJ6AEyh6pRbQKRs4ex+Y7Z
 ROB3s3IGfxX/BTFo8YMIvyxBMUGdWPRsr8Mptt6e5zrCwikRAY02iFcrUdmLlobeZS
 AEuo/kZGiCVel1HNNAvI5iUHVn9PFLsffqr9r/n8gFTz/826MwSZxfbDzdQt9BpNE+
 0DD14Wg9sfHAU6pzE4fON2T2vUEVO/FVQ0+jN9fnIsmFcBNyFcNAKQyJO1X6GBdXMY
 PMuDEI669QsLRoIiRDcjJYm5m0NHtZj9TN5d+sk/OMtYx5I+s+tvbDg20ard2k6ooX
 RLHxx86LShsjQ==
X-KAS-Sym: v3:f51bdf72230551df:iQPpYYtViNpb99L/e2Bb5xg7mK3/VCTQHExOlsymJ0oFp
 MfD35kvuP2Uqgve0/cXo2o18cu35mCfwE6hpim5jkLpG/mBspLklg6wUX8CX5KEJNUtLs/iup80
 wCWzBIdYiYsJQ0fIGFAYLbxT7F9kv8QZ6cwAK2AE4RCvKxJUAWmBaXOI0iXf2GgObQHWh0UNt1H
 JvRVseZgbC8NGrBBgFTY7thFX9z9uJnT9s6FnIcVlsaSCNjKRvudEFlDQhCxCvf5/c0wEYITiXv
 /enbEDzcjupCfx6J1rbwp7oxZ3EefI6b7toYwClzU7ph7xXxixW6dncBD7Fp2pbtXCfbRqDA==:
 OifjsoRrZDRwXYNFejHcx1kn/x3UdelAJo7/tBSCBVPv9LHdQd2QGflggy+7AQKAjCRblZcZ/F/
 i7/VnxruZx8urqI6p/kc9miCNSckulieNG7968ZV0O3TdKin7549pkwGM4WxIf3zTJSsVCj6Dug
 VhPYeE6IC10L2u4MBLGc9zSbqYJam6zHvqD0ME1036QIzQky/tHoAN+29pq5/jXcdpz0j+szqj8
 ozRJnDoGuDq5Op5sBW5HBbey0peHLoXnaKoutV/BfdPZqoBS0GsNttz5ZTPhfk8p6t0DILu6z0t
 3rzPHP036sUKumj68InJOaI1P78FRQTfebrvo39WDYRSZylkfckg+fQYXdsUTHe/pVV/65nuKAF
 f2N4JjLAwCBl4oSoXzGjUSzWrSArUJeif42y2940CnlR48WPO5Yn34XEEY2Ylqy7sSQ2bQAiFd6
 xyeOnYtptf80AdhBSbbgaNsRIb82aZwU8sRr00n2YXdg5zjgC1vc2pjvi1zzp39pZsM7rHmVfrE
 hBePbNgdn6+SJYSvZ1vFvVoFFgv5aGzLfz/pfw18Pw1JQfyZ7mxXSnR9J6tfsZEi+pmZsjQGid8
 UTSGWwOurtlD43wXaZuPaevSLdgi6nykRMStPE8j0fcw61aCst57rlbS69g=
Received: from fli4l.lan.fli4l (p54a1be1d.dip0.t-ipconnect.de [84.161.190.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C699A4C47AC;
 Fri, 13 Nov 2026 21:42:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48294)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xRy6B-000000008S4-2ofc;
 Fri, 13 Nov 2026 20:42:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Fri, 13 Nov 2026 21:42:15 +0100
Message-ID: <20261113204216.1400955-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: needs libopenssl,
 not libressl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot bumped the package from 7.0.3 to 9.0.2 with commit
acda85c85827c123a5238f3628009d8ae3ec0735.

The bump includes upstream commit
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/0486ad61ceb71b7a45976e6e45a4d2a2813aef75
which was first released in version 8.1 and forces the usage of
libopenssl due to missing APIs in openssl forks like libressl.

Fixes:
https://autobuild.buildroot.org/results/31b7a6c2f1296edd0ff23657f92dd6e8854c32c2/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/Config.in | 3 +++
 package/ffmpeg/ffmpeg.mk | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index fce2fef993..f4b5368cd3 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -17,6 +17,9 @@ menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if \
+		BR2_PACKAGE_OPENSSL && \
+		(!BR2_PACKAGE_FFMPEG_GPL || BR2_PACKAGE_FFMPEG_NONFREE)
 	help
 	  FFmpeg is a complete, cross-platform solution to record,
 	  convert and stream audio and video.
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index cda7236eb4..953c733961 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -244,7 +244,7 @@ FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
 FFMPEG_DEPENDENCIES += gnutls
 else
 FFMPEG_CONF_OPTS += --disable-gnutls
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 # openssl isn't license compatible with GPL
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
 FFMPEG_CONF_OPTS += --disable-openssl
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
