Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C4606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cRjsd50u
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D82540C4A;
	Fri, 30 Oct 2026 14:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u72H2CaVpB00; Fri, 30 Oct 2026 14:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9CB5040BB8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369292;
	b=mrfIlMb2jrH5J4S7DPZcU+M0fsE6ELJJyJFpdrSD8e+MTfxXymiHR4XZqyeC6x9doVsH
	 9MtCcENs32u8ouv9L5+tygqkyAV/jNyB1tEwzTddWCVoeeqhLSNOSrntn2vpAPZmkmGag
	 b5wXJAKaZr+64LB2ga3KySsVBX4TQdLReyuLKI9AlATRykHuZZ3afcPNE4YcKlNJhyxCc
	 26ZM6/vXBY/Ok9Qrj41Zf3BJnR0dSFeQ2oFcr++xLsa6mcQeN5AKGO6tUAkU2jxdilAWA
	 p8uOcZvcpVWIaTSM2XDhPPnpsoyfVIdBeMc5P/Tqwx1rN7WLCl8eIOCdk7qEFRhJKyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369292;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=hRndQsaTR9cNNl3k8h8ieYbtNfl4Kq1+OUI1RLsesrk=;
	b=EDJYXhJHqOOFTY9HEKN/bZrW6CK3m/17GaglEz4OODufdVzwnD4E8teb23NgUf1Fi+RM
	 /2oizgB8l52ex+R1sBXgf77qYqzA6mQJiihfOEvQlv/ES5tdC46HP9D+ctQHDORvpObZg
	 vMewzUcpvfQzRJccveypcYoUaoUrMwojB281Sh80278mF2QzRnGNOlfM6ccX4ussgOcI3
	 JhsDHRH9okbbJwJmA7dk7Q4Lr5ZVGlDtpJ2rtMQeWuyjvnl3CQbumasTR7myfM774QuAS
	 ffR6EFgjuyj78LfReVRpYsZHeqxFdu2wXXl0BMeYwbYFEa3WrVU5iTnlAV+Dy89lvaQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369292;
	bh=hRndQsaTR9cNNl3k8h8ieYbtNfl4Kq1+OUI1RLsesrk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cRjsd50uIuEo5AIFl/PU2J7uqro9kFC4DBHsAoRf9ocSXutHxzdsCY/ya3DgGAaiJ
	 8KvAJLT+6jHyxNw1DEZKEt1hOGb9qYqyNyDTH4vnA7a1rluztm8sLWTUUe1FceLZZa
	 temm1LtCDWH9LGyafM6b/X3BFaSOJ7/Yd/3aUoTr3wno4zHGSGiB1eXiyB23NkSRP+
	 caARQrx9P5AV4AJ98eqTXXURGVPhm5K+xk6i3cASk6uCidAM57fxg98lg1H500Le2Y
	 KfQsbVyBmwMfsPxIULS/YySJWcuWBdmnvE5T7BA1q/5XzsOPyjgxu6hxNoMGXI/cwG
	 1ULDsIqXVJc/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB5040BB8;
	Fri, 30 Oct 2026 14:08:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0E9FD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C221E40B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6Sw1oXG2IL8 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 19E5140B31
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=gv/3DvB/dFfYq+Rpt3hl6CooOJYPXnRC+zdR4iSY1GkhxFismgTGCvScs07ZicWT8cTu
 PMSqn1MHlgcluRPPAAGLwnpuE+vqF/covdzx3CU4xZeD/1SrL849Ht31OVIHM7PkZE0MC
 MQi2VtwWBvwGh5KZHEAArq17d2HTJIRkoSkH/igliigGnb1chlNjNstTUvrr49b/J994J
 RkHGBulxDr0dzC3UbY5WFR53esmqebgDesDgyq+XP6HxsOD1mgQCAcKknxfHM8h0O9fV3
 +o6auQZyjhSODpU+o4H8iks0kaJpWf8WBuhG7eeSRBSIF99XjYBBdoiNGMcWmJEAMiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=i93p2O8e63RsQ879lYwGxGwNEn628jX2hopYkhAw29Y=;
 b=me7trwNRsJiznkA6E5SjzwrnxT0dzTZp7iOBUGeoHZ0+HnP4YAfcfMKuHa5gjJ5qB1xN
 BfMRKeTXBLaNzc4a2TtFn3vgzewstBVNKX88iXY12eFaTHHOfsSTbjWyC+ap6boagzcND
 wls3BQV3SmUh2o/UYj4MUi3v+kn++VgwVhO4wq3nCFGzOkS0dvjTysMaiNXeUfRmkx77K
 NKOQ+vcXTsNBmQ1jLKfQ3lgo2PAj9dvDeLsFRYphadt+/tv9JjX+sB3Ibbz32scKG/3LE
 lESx7HixHFDqXNkqMoPOwZO5QGzyiTgiQSIBtq+32TL3DBB8pulPZKLiPbg7xlDOo9A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19E5140B31
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 388BD9D388; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2df41d754c5484657702d70eefcda82c9b20e0a8
X-Git-Newrev: 7561b83f86c8fb0da668a033ae34ff6da07c2460
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.388BD9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/domoticz: remove
 configure option needed for CMake < 3.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1526845274069313033=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1526845274069313033==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7561b83f86c8fb0da668a033ae34ff6da07c2460
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

In 2020 the fix we remove now was committed with buildroot commit
6e6bd863093605419044d6e376185ff3caed9fbe as build fix for cmake < 3.16.

Buildroot commit 53beb8fc1a4f3ba20ea6c856b4ec8506570f17c1 raised the
minimum CMake version to 3.18 in 2023 so this fix is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2466c7013051f6030bec5bee80cb6fcb9ab7e8b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/domoticz/domoticz.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 95d3335adb..498ca232f4 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -22,9 +22,6 @@ DOMOTICZ_DEPENDENCIES = \
 	sqlite \
 	zlib
 
-# Disable precompiled header as it needs cmake >= 3.16
-DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
-
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \

--===============1526845274069313033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1526845274069313033==--
