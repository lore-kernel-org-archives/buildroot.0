Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFB1606A32A
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B5vE/U6A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kEtu6wgb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A16EC40D69;
	Thu, 12 Nov 2026 15:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpcAK3128omt; Thu, 12 Nov 2026 15:08:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D281640D08
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794496130;
	b=D4EC1Al99A1e+czGXamQqAnRhqRx/N+LzXJPq3yfNq6DL2UN6jJvMrr8cEFhCJcyFRL/
	 akXjwjt0NDmSGaxrcla7O+LZI1TiXlnjoks5rcUZRkUTwYpPHywevERJA+namZwEBeF7n
	 F9oQvR6+myTuVKXWhMiDTCX9zM3Q5KlU9suJ0B8w6Ldk3GctxavOoMzp/y+E+BLcJ8Zyg
	 m00O0VJiMH4Z8tQfn3pdJggA8Hdy7SF8ojG/srArA3MyypOs3uwBdUyN1FwO9sRZ5D4AZ
	 lnMHES3rkpfvyrYgi03+Vo1KRKNmWsfTP+pF9avkLvOsJHgM9lINJZAWA8MlPgX+3Hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794496130;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MN7Bi6pFHMsJjzG1EK9FfyLTTSJEM9QOVitdmThKqqM=;
	b=BPMnT5oqKanz5gEprx07H01LorrSWMkqzTxm/5ifn0U2Z4CMIYRuzau6nsYJC5Bl/5ek
	 YvdJaDNRoVKPjfu8cr1cCAkRrujuj66JzkhWzzBJi1EP9AdIoKVWkwTdGi0CWMdYStP/Q
	 mMbtOhyo2eBbNsyGoDL07MONB8Srn6avwOJudwBZuOO88DShW4ZpkZp6Bvht2mnM12C2s
	 5OyLav2q8k6rOqHiDU9RtvwyT8mRjjIcb+GaVWSjFWuZx7vOQ+bZEEbycMTP3ilvmZMQq
	 9pQhkKGhTcvWtrRzSLYIzGq2wc7Ag5fwU8zFTC8G0PvmVsaYNfpgt/lYpCqOJST7NXA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794496129;
	bh=MN7Bi6pFHMsJjzG1EK9FfyLTTSJEM9QOVitdmThKqqM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=B5vE/U6AyWddegckOdgYPNLgZY1abgQogvyzp6pv2+eg6pFYFM83dATgZFtu3eiAI
	 AbAPDzM03sDu0bb+Aw7cEkynute9DuuvrWEA/88HJXaae521Md/huerSZpUbP0dEf1
	 t0wNYG0dUoweEv5fBYUKugOfgPZM4GtR1sEmUQo5y1RlRgOr/K/p3Uus4K0xn1KoRM
	 DBIPSKxbFXx0RrXEypFz/Htfdv3cj72uVcdVwGgz/Jafc/hse9611f7xJ7ldvy6XgP
	 D5J3/sdcoyn0EoGNA2RidId/dCifhMDeV4iz3+Mq9FVEjOGLJ/7oqb3gMv1kIkNW8C
	 eg4ZLgIoVZugA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D281640D08;
	Thu, 12 Nov 2026 15:08:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6534F156
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 15:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AE5E60751
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 15:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjlccIRpS6yq for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 15:08:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C7D06076A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=kEtu6wgb
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C7D06076A
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 15:08:46 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-49a92144733so711077f8f.0
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 07:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794496124; x=1795100924; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=j+upC8m9qlD8A44RlHt3LcTpnIlhCHQcuvsL2sYYUPY=;
 b=kEtu6wgbLLuyAiuL1NQdoZlYIhYAfADtW1vzG9oOPbwcoY6Sfnf9G5rEGNuzxC1Hp4
 SvzMwf7OSWZXCZZ7ib0FGjjDpH/L/UCxv38YM27L3/BVBRAU7sh/jINHKYDXUdyCY2SL
 RaGzveeLrwdsXRX+Q8CUAaoYoacaDV+Nw1LCrKycBKTfUGFlekWonR+BSsHmX05zlCB0
 Dug6OWwqyJL7r0qt5xzbmVdOKAi7dbJLmAybCZ0LR6V4VO4wCa73r1Kb+B1RtK7h9KuJ
 UTvCZN35doytfDr8y2C37Ep3h1Z3BDZiX7pUwho4lehyeLoBacYxT6fdEgW6IUFOxiSz
 Gkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794496124; x=1795100924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j+upC8m9qlD8A44RlHt3LcTpnIlhCHQcuvsL2sYYUPY=;
 b=BKFh2EPBP0v3V+o2eQLJ23bsQmnVCAaAJwVrdCDQmHR4Wot85nmzVxZdxq7L8oZZ4/
 HvbzA2YjvalDbjLcb0W6hzBCS6HNvqckGUMjiwNx25DKo6cPcd5MZUEhAM158fI3HHN8
 KOJJPGCay6qAAYWybwG1A1dS2o+C5pmjgPS/D0lKfshYTq+/PW5I34uMbV56o7ixm1Sa
 ZtkzZd2yeQrvu/tyQERI5zszWmFvE7kEAx4fiaT0DC4OOQyoasp0O00aui30d/gQ+dtm
 D27l6vCEu0sw2zvLC6l296YVBiPxBtRL/KSA1sgjC5/TjH8ASkEcq9GtlmOpBWbhvbqB
 IXCQ==
X-Gm-Message-State: APuU4Z+GinY/2CPTV4MJgRl3vx+DI6vIUoZegrFomhoil/OsIhilUcTY
 SnD5vhsuR2Ex5v8do2n/dSLuth6kbu9gycOQCxVOWZQ4Nh5+G12PPEOcu3Be
X-Gm-Gg: AYBFou2YLPOxtQs7WSHSf3uXlgYh1tyNLbrlFDoaGdiaCb3Dywr2YqKr9JIJtponxzj
 zOY6OUQl2yvPD+oJ/kmJV0cOBkozZvO/Epb3VUw+DTC74QudMhXQulvisfXcQuG1MWL4UZvm7LE
 MIhi8wcSMm/YUQqzOU2FHpbKaU4BEo+gYfTqeyzmb2ZI0Jn2q/M8ufvVqu62ZsNEEsGUUa90vDz
 r63BSb9VOP7kp8BVjGkb8WH2bHZ0Bt6ulVlLhgeM+nxsQwezi9kpHD7IwSphJI6RM7skcOptqVa
 bzKp+X0cWsGFBqs7NnGGuRmWyrtPX/p0VwFWDgWTMP40DURQoOBnCOvj5Ods8C9wnA94BoqVAYd
 YWYz+Tl08PCH+yFFNEClh0O3OunCyalTwZsnUCKvQbicl9ncb8FgZPVpLxptNE5/A46YXj2vMBh
 f19UD0qNbyozItZbbzkRpNJimJXjIzpzbv+iIA0gbbFsmO+e7Yf7QYOmCvr74oRnniRl8BDlpGW
 sz2isWFL61KetbGSDYUfIGITyCORAbiTgQePsjzy3FPHg0VOSFOOxQ3N+X8uPTlNwozwuUROpf2
 Rv7NnJlLfQT0ErM/u2M2
X-Received: by 2002:a05:6000:2411:b0:48d:ee59:3a30 with SMTP id
 ffacd0b85a97d-499c7a25c2cmr10335026f8f.22.1794496124253; 
 Thu, 12 Nov 2026 07:08:44 -0800 (PST)
Received: from case ([84.199.255.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49835858f26sm17833175f8f.18.2026.11.12.07.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 07:08:43 -0800 (PST)
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 16:08:26 +0100
Message-ID: <20261112150827.4113279-1-pieterjanca@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/linux-firmware: add support for Intel
 6E Bz architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, Arno Messiaen <a.messiaen@televic.com>,
 Pieterjan Camerlynck <p.camerlynck@televic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Pieterjan Camerlynck <p.camerlynck@televic.com>

The AX211 (GF RF) paired with the Bz MAC, as integrated in Lunar Lake,
loads the iwlwifi-bz-b0-gf-a0 firmware.

Note:
The first file matching the pattern "iwlwifi-bz-b0-gf-a0*" was
introduced in commit [1], first included in version 20241210.

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/commit/60cdfe1831e8ad39f7644693b1d6da01e4e80e2a

Co-developed-by: Arno Messiaen <a.messiaen@televic.com>
Signed-off-by: Arno Messiaen <a.messiaen@televic.com>
Signed-off-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 86c6402cb1..a9879b36be 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -699,7 +699,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
-LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-{so-a0,ty-a0,bz-b0}-gf-a0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
