Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA065CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8351140746;
	Tue,  6 Oct 2026 16:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8mxjBZwmD13; Tue,  6 Oct 2026 16:34:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AF3DD40741
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304441;
	b=Buyi9aXRq/R/vOAA4iZDkHlA5N0fWJFtKdB1FYhd0BTxQs2alMp+kQwOMK7yiASFcIXz
	 twVwKtfBcbuhcVtpXFFPe9Jz6TPTUuVImDc+/h1+qpeB8hNRV2mqMDMAuq7gbP76zj76q
	 nPseNKOI3f2cnAxoqg3DNmweIa8RRO0GPYiWFbgvSbgKl5oCmo3JL8oBgtKisw00q9e55
	 Aaw7oU8TprWGps/utkqn9ZTxO6JEo5jno6uVERwpZE2NtHJ20Tc2v+OplcDZEXQL3FkqW
	 i0Ugt1+6JAoWtmQ2YE7UaPinpBnTRiCtN2gMFoddABl/c6ua9CYK0WuwTK2dNlXoAoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304441;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bnwo5LUn4mIOugArd4izIIg8OrEdyor/DguUrRnDDS8=;
	b=UcOtB1PjUqIpgftdzPbFBBiKURtlKYo2r4PJbFsJ+4hI+uWz7js9O2CrNR1oyy+EopCd
	 ZEA3ZM1Q3x9Oc77KWXgZw3LEY1RyGp/3b4l7Z/uxhqut9VoLbJKpBPbsqyBwps5hAB0Vk
	 BZpMJtBH4QSFGcvOW4w8XLmvojn0EQGNaGDzwUg6wb2/WihIc+bcYUlxWHi0O5cJaP/FZ
	 y1grA9P/iW1QT9+V8Pq+S4UJD7BpD2QOyqlfvgeZcFRpjma6y7tuHKajFaeFai5pu76Y+
	 656qBu8p44/B/xeGfU/B/c7ZVnhtKgStC72VK62KUuDvoNJzCrijjndf/NDW7XPSqGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304441;
	bh=bnwo5LUn4mIOugArd4izIIg8OrEdyor/DguUrRnDDS8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dDQK7nQzlig+cetVD1ryTfQlrn9bMjmABwnyEVO5i4M8E3vBlpt39uZTa2UbGiSDY
	 Go6j61AQOje2GLQY8d6hClWY7xh1ScorRlWPdgd9zjYAeSaaW6JsBYCjZ4JkQfeSWw
	 tPKi9kjH+4FxFOd7BX6zEpA1CKwRAp/Oz6Ec8CTY/WOo7k362YVOG1ZquxsgRx+0NQ
	 T3w8/smPIVeY4XNmfh7kLULdQKiFX1iEZF1HwS30XC6mlBzgmF7p0bptvoR44soeof
	 a6WIN74/65IH/rBmMNRFEoSTZcCcGxciOAAudUOERLyLro+xd6RWBGNfzx5Vn/JuOE
	 Snc0q9v6zsMug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF3DD40741;
	Tue,  6 Oct 2026 16:34:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 631C0317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 533F6607F6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxIfc5Frq5ds for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:30:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4B83760818
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304231;
 b=Pm3PK01dzbEcds7RyQmelmp/rgQBNKKnnuQAoUDNsyQki2MT8J28WfdlVdNCucSBL4lK
 CCXJPxfD0pq8Lcw+tetHekaEsWRHJyh2TwHHzmHwRsYmIAdphJDN6aU6e8obYz+cl28OH
 pSEluZPxKkBKRHbV/+q1JmcJ5UUyNf6dkXxEEu0wmcNPkCHXxkJ4wdGWIgCoBR+Z/98LQ
 mv4iL+b798dEheMX4v7mimlGq2H2v0GKZ6w0a3UiHDpIhzxG9qCnn9eglCILWSJHPDJsN
 wbkxyj/xSCSWDm+rPIDuE6Q3EFtFUyT5oyZFUZpSGc0GabjD0h/2kD3p8ICFPcV/jog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304231;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8YuznTcvU6b79xSi+JpXHG4Ry9b0kk2DClDyeGjSzUw=;
 b=F/0FMIgII7HIb1Hl7dZuG6UcuHSmJ6gDeQcgf+7//Ggn9gQWfGkJt3gXSnbNayu4P3Hs
 AQ4Z7uQS2pBluia2v++QXWZZA49imLPMtHC6KdqmreMChj89WbYcxyIU51rgUyZpAzwBm
 xVCOdwAuZp0xRIVS5nQTIyd9REkJxxSBOoI1g7Xy5VMrffH6814bV+msLtD2PrRdZsijG
 s1jnqXLT2+RdaiI222LiAX8BTPVBTXmMU72n8Sk8O5lekfg2ZuApg+sww+8igDCF3yt/X
 wvAt1EZUGRn4l9uaSFSJtiqApVpnAgZtVOgErHJ6QF9CMEgadPioV4N/7a/Xe7J0ZGw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JUtERE1J; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JUtERE1J
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B83760818
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303707;
 bh=8YuznTcvU6b79xSi+JpXHG4Ry9b0kk2DClDyeGjSzUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JUtERE1JRibanWz4UN9uvSfagPDCUg7RO6aXfDePMb3C9xuM9UqQAdIPMWCWO4jjj
 M5N4fxprBz/vHNz6IWDdWwYl8wL38frdJ8uRUX2xgNGgxVf2vN3V3DQoNFWJfccp0C
 jLpa2n7rGOXQEOn/Hs4PGdJ5ED0m9HTlC+GkQj5La1FR630wPb2IPtMr1IVtJEehdi
 fzdYsNE0CshSayq3rp1ftbZwmeDAEX7zK5uZ/UJvPkFnBDbDjKWnPDeMMOCZuU97fE
 dewILqvWd69JkeRN5EcRnP2A8jdddXO6kEi79IjSLeP0ALhhWUX8jPVGSgE7QStRBX
 rT2rg4uPGxzww==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 jpXL+DJD0Eroli5lkcB9kMoR6r+Rp98jdC2lpYeFG7p2BzxP5xN9b+nP55wirNwsgOc03fKxJhS
 H5YxiT0cB2kkdpWf37eBPxUFWwAa+feC2nYCx0kahGebKp+cbwsLxbmQhrzEXrf/ZdN74u8dKY9
 SV2QGgqy+72g0kRahLxTlZVQwQjr3x2Xn3omqPQ6unR/rLey1HIMOtfNiUKnRPCUbMyL7lJgbRo
 dmk2En4zo+9Kv7VZzZPoXeqDr8lp0rgdserdKcFiDiU3wJn5D7htTwHY9TYRbMKh8iHjbg6+KwD
 pAAJxEPjHzaKxYRDk9qDWOa5yRLTIU+rj319ZhoxXKq43q+1C1Y6N2YRili3dQnCNseXfDdtBbi
 PF4iK2YRBH2NWVyggzDTDpBWiWJmGMmrZU5nWwW9mK+EBVoKmLSiKF2OeEoWkpzC61UZ6u6g/63
 aQd7yEyZCs0dMJx+Bv3IBwm5m6UnCaYXOD+L2vvtKSPB0uig8swCqlmwc1N9BwHIi0b1w1qVvIw
 XcbDYkVBivxVLbrtf7e7JY7wV3GKwKbQrbgGZpYKV6LZ2zyb+YeKeEHC1Lw8/NwWhZwD/EpskyT
 tr+fqhtVm/GmNYQ9R9/at2Up+J4bFF4If4mL2Ix+eQG/q4E=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ECD0CA4C5458;
 Tue,  6 Oct 2026 18:21:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ui-000000000ir-0uLE;
 Tue, 06 Oct 2026 16:21:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:02 +0200
Message-ID: <20261006162106.3439373-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 21/84] package/boost: system: update
 description
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

From: Michael Nosthoff <buildroot@heine.tech>

After removing the stub library in 1.89 a CMake config
was added in 1.91 to not break 3rd party packages requiring.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index dede9b946e..5eadbff2d3 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -424,8 +424,8 @@ config BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Extensible Error Reporting.
 
-	  This library is now header only. Building a stub library
-	  is still supported for backward compatibility.
+	  This library is header only. Enabling this option will
+	  install a CMake config file for backward compatibility.
 
 comment "boost-system needs a toolchain w/ C++11, gcc>=4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
