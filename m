Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFF7CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2AB60634;
	Sun, 11 Oct 2026 13:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2VeusDh2Hje; Sun, 11 Oct 2026 13:05:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D14F560611
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723931;
	b=NADTxR5lCSKpjN5TGdHImzbyWS0Ef2uJ3ynjDCaUilzVw8mhpdY3Bxh7PTdQ5DmHQbs6
	 KbvUFmD4yoOKfEe++K+IZGyvHmHI0eMA8AEYMXbW4BXn6ukKTLb0NaipPe5n5+0OpbG7B
	 c6Zp33d6y54aUcvAQKazC621W71v4LzPbk/LGkAEhCsIcuw0vtX6BBXPNJGDAZpZ6PK/j
	 Mmc5bqLy7B0/2oEx9E/s+uanF/ZgpRaTDiNkLlYa37SPL/aKvbkQdyt2ODqhOtpWx+/ha
	 XubsVswWgyuQ8a0MXeiV57op7XR1aVcBFwsvQFw+lsuNwL1EF9M5n4da6Tb/ll+PZeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bnwo5LUn4mIOugArd4izIIg8OrEdyor/DguUrRnDDS8=;
	b=tVC/sSEZ2jDD4JQxrKJpIsj88vcePPJRk9iWtKFp2W5jErjvwbnTJ3j6zxL1CfS1yhlV
	 jO6m9Zb7hMSBG7gyLWGsz8X99qnWS+cXA+p+6egxPU7A/ee6dxvqvpCTccSwoDMOmANph
	 LXYojJnPhjvIicLZaUJ59AbbHDKJxLbnJdJFyfKQw2DwdFas+0J+G7rgSE2YMOupRyPXg
	 gedJAplw7XOQMqwH6eWuksEvT8Fe+ofRWuW/rQqolQNrp/U6UCgMLbyF1uHdCT4xV98xs
	 oj2DEfAzSCYhrwtgkwBzZYA06BGKa64KnSNh8OMUieKH/Xco1KjOFKpOHRAPYu1BSGQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723931;
	bh=bnwo5LUn4mIOugArd4izIIg8OrEdyor/DguUrRnDDS8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ngj5B7p0Vrxh5PWCwA2DSrJ/bP0MK+tI6pf1AGRDPXlJDrAY6v9BJsNIlv3XNyvNW
	 bsedbJgmrVDc/Urt50UdCQyUa4c1Nd8ZU6xTR/NiHopDGLipBfbeP7TBWHARwzUdGA
	 6a46hMcc2L7NSXrDZsqbu4/GYamvn1aoIwbR+bVBALMinDhHSBho1dTSxNJDP996nT
	 SS2wEEAJ4Z5JBPDlf3/KkEw+Av82JrcVCm8d7ocA/hK0mWGlm6GC5gbsoD3rIaXd2H
	 kWw0zE7J/yMPB5DUNbKg9QQoPqKd8wkZnZXm9kEqDDRhoqk3UPcZCBG0Wabgc8mWz/
	 lJE6jSIS6xM/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14F560611;
	Sun, 11 Oct 2026 13:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CA311A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83014400CC
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxgTgOCKnKed for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:05:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CB2754008B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723930;
 b=NL+PuQueB1Mq1BOl/cS+jCdSqa6Eg3mnYxojMOwnn6LWiJJQi+JUnu0QslTG6QAkaS1o
 rmLQ36IfAc8pQlEJD16tKDvGH7dkQzdsRl7QDW82/LgZNvlPfh13TO7IgMO0DwtsE7pmw
 vaBr679F6lL29AvH7TiuYo3mjkHbdDf7kb4JL9zpXEmnaG8pUAkqDHIIUD++X5G4XYl8S
 b5S9xmDCzr2Vib/E9TQzQxgBkF7IfAPuC18NJs0nqVC/aO4LdHoa25FYMID1SU0Ncx+W3
 Rr1/b6CKa+8VTwlfVP+jGu8GEaA1P6My+HHvHhKlhDkEF8bNqt7w0DO7DKAk6+5PNIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723930;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8YuznTcvU6b79xSi+JpXHG4Ry9b0kk2DClDyeGjSzUw=;
 b=TdbqXvgaaeK1rqPzEmHJ9TI1NKYU8ZUvKMxZtgG3aX/xnVb4HgJ2VVyyueapqFMC0A5G
 hPX1UJsPUH+TmSZiw9svojHfjkkqeqT1PfnJz8spHc5aAyUXuwxYHjJ079anyv/YUCB5O
 4jHGTWZGLIQ6B20u3Xw+l5415tkSrvBKL6v2tnQpCHuPeRTIijA7q0DtpzM1gsMajuA/6
 3JXljQTQV7GHIJ8gz9k9opGhurZBmUVTmvKLL83tl4xkGl7LPFOwCqy/Pcx0LheHtun3b
 pb8vhaoY1xW3gFEsa3wqq9tc5uwM3UlAVm7BObzReb1u1Clu1Me8fX44HNH6y1zTbXw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XGQ4rwU3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=XGQ4rwU3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB2754008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723663;
 bh=8YuznTcvU6b79xSi+JpXHG4Ry9b0kk2DClDyeGjSzUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XGQ4rwU3NCP3W6gn8iapUHYMI4n2X4S8tQRafNqoxtjNRaIpHxLiuEfOjZxfI0Air
 +siYop1yEco0VqYY2wO1ErkJl6oVp3gmqgKt0Zc/NViY+dBLQychLf61Zp+/R0pR1+
 dyFFlC9yeTJKdAAHARyH9uMDrUE/ak6dF3Jx72YKWxgy0X85nyfW7qwb4YDyVxhYQu
 1TOfNX5nwjrlC3Nu536rdZttDDm2tWRyhel4Mal0cX0lmipWv+QwsrNGIq5WyBLiV0
 dU3MUmHesxGIB58pNmaLHOCOfIWSuSYCccW+iupHCbA7KT6Z1Rs2jJbPyn5FwrgGq4
 lwt5tAKiMWw+A==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 UvH6eyh8WTL4xQh6vrlGebCAzNc2iMdFRCPe554V/sGa+Gt4ULPbbyo49/k9VK9aT4CXrL9CZrC
 XxLKD78+cvk7KOixztAxuwgllFNCaPynDKGe17i5YImuK4GO4ZEmtXgFpKhFQlU42lpSXvNo0g5
 U11YXLXYYmDesSKRdGtM8g07oSeBTf8ABZA+ZporXvxhBHr5dnkRv6o7fbAWdPcIsNzZ/fenQpp
 lB5cpO1lkprwKVR70VO6TCS2Z0at8fWP0ZkUxlwOsSMEQt7KUoOxUY4r+RQx75ZfvvnjJ7S5F8e
 RmvbqZh1oavk4XLW9wCq9fsnbKctHoGYHD9tEgCHTkOKTZ6BVxrPPEmD3E4T8aZ+oWHhpGAKgaD
 6mLKkuYdjoBMQdg23YleeAQMaCasHBJOKtHxcFxXAD22E7w4v6X/JLarZ0rvvqDjuY0p3hUWNxA
 TyJTkZ20ELbGwjnks41L52BPEeRThijSwX+MpcrGBF9HkY3aInueJhfwnb+nUYlzNpxb6OfQhjg
 JiKw9LUs95E77IDwAtWiE6FBVSaN5l7ic4a8+3ccEWz5TVP2Grdm3ozEYm1j82zkHlzAY+0jzwz
 6Bi0gjJV8gxaBGYqRbUXJRtOmke5DMDIzJjNB4WzGD6jhY8=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1ACBFA4C585F;
 Sun, 11 Oct 2026 15:01:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAk-000000007Fz-0IhS;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:25 +0200
Message-ID: <20261011130058.3443432-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 20/52] package/boost: system: update
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
