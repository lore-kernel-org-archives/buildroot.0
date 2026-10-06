Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6363FCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 20:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20B6E80F4E;
	Tue,  6 Oct 2026 20:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd6DENtcOoXW; Tue,  6 Oct 2026 20:40:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1694880F22
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791319218;
	b=scNe+ApX/HUvqkacbOuTR3cbIhY+85nD9EB+/26tdqeKF+M7f6vbH6Z75HNpGjsWb2lc
	 3O1lWY7WRH6sVKnDpsDUTYQLLQ6UhCh4XT8jXi+rA2jS7bEc1o9Nn+WccAE+9EQiBg51t
	 HRYIfwjUgLG7mmY+U6SQQUS1OUJVx50uU6FT4BJsea1dB1yInq69OvU3W+pcIPfignnAk
	 JBjp3qRqbmoXxf+KAn+4mZaElL57CFiDKDhI6cQCgYPDZVsIEYH33j4qmDAQ+B13gMpaV
	 ErgmklyP34bjSf4d0h3VYC0NmOpakgTJtVXvN1fGKkmeMmhzLf4eBr0+95+83w/HwLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791319218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:X-Sonic-ID:
	 Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 References:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0C4qhtabO7TnrHzU9/MtW3E54Fk7QG4+XvQCyVjlwow=;
	b=g2hqT2Dey8++q2FrU7Es3gjLw32kYkOYDpcj6yh97DnWVH34iFp9e20N2cXWB9PPKkId
	 RUi99ef6myu6WvcusrHr9F56gHuy/MByKv5QqV8kH5qSREB0geXDpmFt5T70kPEIKK6bI
	 5HZYjc+7R3wF/MBZCf+yfKcFSVWMQxaRSa40JzT72MQSzm/9fgUPBz7a5sOMi2QOub15G
	 /sJaPdkLEwzghcV07j0J+5lOHFw2yJFF7Tcn7np40FlmTjLcNvkzf5GsuQz40e9RFO2GF
	 B5hA0JOAee2O3Rj+1d/YSvehy8WrrFvgOZSdEvLVel61WY+Xv8w5X+xf26o73qO5W+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791319218;
	bh=0C4qhtabO7TnrHzU9/MtW3E54Fk7QG4+XvQCyVjlwow=;
	h=From:To:Cc:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ThgzDSNrWEdS5hljBj3UAP+/41b+bqPdB2no5Zx66w7BODhg4h6uORvd1xAdFgG/o
	 7kOxt35jEPIghkiSX8/845Zfz6+SxVKxutY7C1YLj6fT83M6AtGlV8E1f046NvWfOD
	 5dnc92IJmKdPSCEtuBaUKQ6SEWW53C4M7IBzfJPMuudqjoCXWhk0v5zc9rLQ4/OTbs
	 fyWRAT3EhEoYM70j+kMPlVCnLgKwRf6pCzp9XDgRadwXsyGcGkuCJjedgHZQewNNA1
	 xiwv175HispptyobmZSTY3Akx4RUcHkkbwe4iNVrmeMfLp7Ply61SKMkKuAPX2OX01
	 b/QTmvvgd19bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1694880F22;
	Tue,  6 Oct 2026 20:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 003D92AA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1A3A60873
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inPDKQ7vpm9a for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 20:40:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B1FF3607C9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=74.6.129.81
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791319210;
 b=sor1JcRBIWfxDfgg1pAq4Y7lUNt/YdFgbw/y5V0V7YsrKigqVQjyKtkGLId8tW6gutA+
 S8tC9/Mev2tzw2Iu3RDwmcxGM6WHUollPqm/fVvkdjcXq2JGEs3xD5QPhAtji2KsMuPEV
 c8G0yQVWRxx4YwBP1UIZfGDbulK7enK9k9ralij7wi7yThP/LeSUN+7hQruTjIoToHNHj
 YHGSp1zPlGq9A36OTwnVP1OGtchmmTgUoW+KCBVEBveUZqgVNR3c8z/tu0kSbnWp3npoe
 qRIetYfbkg7hF3LDUwAmpbINCYYo0y5g8XOaUvst4gGz3vyjozp+M6ozhSeksV7H0Ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791319210;
 h=Received-SPF:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-Id:
 X-Mailer:MIME-Version:Content-Transfer-Encoding:References;
 bh=0f3tmxe8LRv/hdiG6dhA8hUAiagkFln5w8JfMzDS/uw=;
 b=BDR9gXySJRXVK7NNM//AXCGBs+3hDNc4+qERVO7U5bzI7Di8y1ePCNEy9Z4SSwQRFbGW
 /UYtZs+5IWsnwv9ta+eGGEwG8xgu4gZEB7rHyvvnlVqGyU80JrtO/W4XTN+hFJrg+8Idg
 cp8CugDB48K5Ae4IJa8awB5ug+rmuVHuZuhbkeHYO7J20eLIbycmCpIVRQURa2Dm8UBw3
 wmZMUdGarAS6OqroUg5avTMdEIJEwvvEvZKLemLYPXA6Cn3GOhR5KpS1NdY3T/axIRB2s
 teQfoZMVyFlCrAacz7CTMuXyO+eC8+D9ogsKPHChADwmxsZcB8TALnTd2NmbEbNnArw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=jesse.tg; 
 dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=OW9bqpCA; 
 arc=none smtp.remote-ip=74.6.129.81
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=74.6.129.81;
 helo=sonic317-26.consmr.mail.bf2.yahoo.com; envelope-from=jesse@jesse.tg;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=jesse.tg
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=OW9bqpCA
Received: from sonic317-26.consmr.mail.bf2.yahoo.com
 (sonic317-26.consmr.mail.bf2.yahoo.com [74.6.129.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1FF3607C9
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791319206; bh=0f3tmxe8LRv/hdiG6dhA8hUAiagkFln5w8JfMzDS/uw=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=OW9bqpCAW5CwLd897c0aIPIjer7F2PPmacpdhxoBuAFlF2TWNdRwjUrt20EhM8VFgijhuza3StJQCBWHTwcPitIWLqn/O0FyiLFSbj0cqK4p2PSP7D/Ji5OH9X6xb5mAXe3x25ZJcW45yosFG/g7SIm5EsxDAfhXU8B72BawWWQgRH82OkyffjYW2xXsuu8zPQpaj8SiUppzuR4PL+kKETs+LUFV1M3l0dtuc4YBlNnTo2X1elX6jViO7k7ye+CZ3vDlkfubxASAxgtvjeo0YFJS0OjleLwtSdrq8ZbWqkPXx5x5cMuGzRIOiZKvGJigxT5mR/Lsbf6MHLMp7YKJ8g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791319206; bh=OrKjitS1Y0Ie411fUT3ThHQJ4UPL33HrE1FAYVRswCC=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=BM3LrsQKZLcUWUqQTPFxSBJ2u0b6rCwCngPtacmvQIqE6WSvqo+UspUbf5s5cZU+PBKlXCZDomkWzSErTf4GNVnSWrxQDsQ4lu0WaU1/r3BAw1HTE59BEpjGPVYJhQKyWtagcw/2QigNPR6oKrumrk5ZoRwJK2HZrhom/x9OoQH5Qhz/rv5Kx0pYfL7zYP0FO68NnRKPz1ptRFecsKyc4L2L5dZv4Oi1olmQq2M8s7jRPNfNGEYRxkyKAa8LneeOasMv2g+ag88Eb5jb25yW8x604w8h67yaSMtfrXmET61/7L5ZdwKRyrQQTvmSQKkZmEoqJxyZNxPhffNhytV01A==
X-YMail-OSG: GLzsl6YVM1md9ShMTEbY2e_CDrJSLzY7zkqlrhvBaSmVHxq9jSoYldeRZvUZdLA
 Xo8kIt0dgNqQag.a6V7IJot.oY.ZLw9Vfit9fBSztyT6rWZhC5l9Cpa_kefLTHNi1bbK30dJraQ.
 9J9Gua_4IC1jBOt9R9xKuHMjxnj5zY7ojFdR5oGdiTDR1FvnhajSTkcaMJSyN9HMTwTtc5tZIXAL
 Riww_Wi2wqOP.dfzrLF3KFV25uVYFApzUMLAWT99.rsYt38kh4EclW4kqIXW.6yriB66HGwdxyIJ
 pkwEgDKh17gLeeUnRQ_W9sdaxlbDm5dpg9VMhP1mn3aPMLQdR2VTF0GjpDGJJ3mQCHX5WHkbgH_P
 5iaoQNySXr6zQxfVCS3oqpZkE_WOMRpanbZwjsMsfvE8bvN7kaI8mMGBXmsfx7Q9Aq5n8wjlkY_F
 dd1h7q2q853flAWKi2OvoeP1aE5nhMSRCwHzqd.QiVdqDGo9dQNk.FOpm83b71Ul8tEzpqERYOb_
 3sd_M_hOV9_5nrW0sy2BngeW7l9nBcE8IzHBnB69EU7QFMThpDyGtee8HGvNjjOgsMqjCJW.XheC
 XeiPIJio8O.ToRIeCJE03N3O.82ix5VatrZgXZjOLFI36T9oHfOc9Hk1OMEQNHKiCS60eLhxy_wn
 sS03OkwIKpLzviiDoBN7SS5mYL0hx9T87DlAOKMsNCwNWkh3LsXgyflC.gpI4sB_ZiOmRNZNxzp_
 c6D1QMhZrskBRGNwndFx2nOcadupbq8FVfKfJ40Jwtw8qeCKjlPZS2UrWicVNYfYkHyAgiUlV5oW
 8ijrNtaR8y2ZAA4GHeY_Tx7XDUUQpKUj.0AaexzMf7OXE6A99ZfY16cMjye0zytTuOvgAAx12ukk
 FjyYToBWtd6CY3MAOJK6Fu36DMM6N.7expJqCL9YQiNI3BM0LbgsOeQO3DsFIiXVzP0.0oOhrpHF
 rARWxmdxGVMAoCx17O0BJ_urVzJGTM3V.9BMG4mxH14YCwH8eBdk_4gwMxbql6mWyKltPnFsaYSW
 YHQgmQweKf9InwaZnSlJq3.EnPwX9ZOzxWquJe_1MV6AcBChJtwZ4yW9RpmjnUO9cAPnROZmIuQu
 FTK9Te49U6sJNb5DEa8kE.TcpOUVwXRIzfxRvUtME5ob9Kg28AnHP7CfOaF.7XqKE7MJCwtskFa4
 rn.kK11PM5KSTw2JXcZ8EM9GlrAOhrbAmdXV6KOE8xZodPuvtZagtywQ8xZy4rMIirdhJcxe4WnQ
 vUPyUp1lIcfOP49J66E9FmryB6Ge6JPwNlM.jyoFHEBwFVC0HOmwgoM4e4qao0DEAQnHO86NgGB4
 eOqetWEcCpy3zbaztR8Y7Jib4RhR6qAArtXKlQPYJY8p2PsNqz140AJOHw1Pl6vqAXI9aXeT94.m
 xyqBQgnToON4osVNmnLHQLTiRigVO075mK_InhKP.OjomI46JA63CBU47WQUaoQPC2KQRQnenyfX
 Of.vtEJjBwa_cXWGET2GrdlbbH5mppqALd6bJq8hmSB3JcQumb0AogXP7izASE9Gdr1ktQxOdw3B
 BM_hPxszLParLEnrY_ZoTDEolNR_vTPbcPWBbkVt9WEYhEcyJynY4Dr2XykLNUmSHgOp6HlhOlTN
 djObqcEyVnoqWMOWF8AUykqW_PG69AkVzf6QLhwjGGW0hwCHIuRuJFK6KznPo63yt5XiWOgocC88
 40sKXpAtzbb2wGwTLKW_78TJ.qgejc8ZZPjykeC4iO_Plo2S5hsoofV1KTv72LJOYMKtR8WdNHSM
 y5co6todkLmj3p1Yb..7NxiMiK4W7pe1IhMzjBI2n5z2GnPBaYgrVGOa95RpaKYNh0CoQFns1BrB
 Ut_Z5KmP6pUfAX7Wu0hHfj4u3RrPyZknO3sIP6ZiHPdB03D_sBRyJnFlT30oFVGm7o7icS5xwrk7
 6kPB0tb4PKrfVgZt4H.UnbuamM5H9W_3ykz4J7nxP7F6FWAYddDCDfQOKRc8mLoJ27jxM.DJtIy7
 .XW4OX4sdjrSGPG_0bO11.7RJDgQE4LfXvClgMdRSKrr_fMg3tSgSmvvbklPmm0Py8z4QU1EBDFB
 yB8lCv.w9poaEjWJ8VrACWSsEwKyWujIiTNPCeGOV1OCJtdOlAKfxhFfDxdD6xB08VxiihvgIDFo
 fXPtqyELPI1o0cUSZiNXCPEE7GQOZoda2f.VtVuUdoBcbEM3F9wM4nqB8F1ZUg5RvMVp_o.fPXPd
 S90MzQzuv_27U.6uVw5ogXVLu42iyvJd75ZzfefV_4hLYd.RHJdOx56Y-
X-Sonic-MF: <jesse@jesse.tg>
X-Sonic-ID: 2505278d-34cf-4fd7-b1d9-b7bc81a3bf7a
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.bf2.yahoo.com with HTTP; Tue, 6 Oct 2026 20:40:06 +0000
Received: by hermes--production-bf1-6d6877594b-txhz8 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c2f743c0082f63cd6731c38f39ccacc1; 
 Tue, 06 Oct 2026 20:40:01 +0000 (UTC)
From: Jesse Talavera <jesse@jesse.tg>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Jesse Talavera <jesse@jesse.tg>
Date: Tue,  6 Oct 2026 16:39:51 -0400
Message-Id: <20261006203951.501419-1-jesse@jesse.tg>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
References: <20261006203951.501419-1-jesse.ref@jesse.tg>
Subject: [Buildroot] [PATCH 1/1] package/samba4: enable systemd support
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

`--systemd-install-services` just installs samba's unit files,
whereas `--with-systemd` enables samba's own systemd integration,
used to send status updates to systemd.
I needed this because an app I'm writing needs to know
when samba is ready to start serving files.

Signed-off-by: Jesse Talavera <jesse@jesse.tg>
---
 package/samba4/samba4.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index a9e1577e26..6f4a75f4b0 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -199,8 +199,10 @@ define SAMBA4_INSTALL_INIT_SYSV
 endef
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-SAMBA4_CONF_OPTS += --systemd-install-services
+SAMBA4_CONF_OPTS += --systemd-install-services --with-systemd
 SAMBA4_DEPENDENCIES += systemd
+else
+SAMBA4_CONF_OPTS += --without-systemd
 endif
 
 define SAMBA4_INSTALL_INIT_SYSTEMD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
