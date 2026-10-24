Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62107606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nn8ebz3t;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=PuZprdRK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BD4C4070D;
	Sat, 24 Oct 2026 18:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtX_hUHfUnzL; Sat, 24 Oct 2026 18:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 41A9A40720
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866108;
	b=sejBFuyB2e+16y2OLE8/VQmW+DXAFPaNEY6EoV35Sb9S0FfBxG2Jk4M1pmJ5s7CAIir/
	 QIgjFyjjDA7lsNB5m77fdCrbRlcT9AdaWvyJpP4Gl9iqhBNASmHWNEVqiat2JfPdg1DnQ
	 DTrjoch+PQesgwBxxUNkSW4wnsMuPPJ48OGwk9pQ+emn5YTVFHXDVJ3E4IaCv8WDdqEP6
	 V5F8pKMM57ufqtAGG+t+QiDm9649h+RRKthSnFDI+7n2zIJQjQ+vNOHvezqFUJMpLHsXv
	 z4B1IZ6COhlMM2KE3lC6yRAdngjrM925Q0gMfC5pma4AnsHo/8WduAc+Mid1sKV2maQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PN4mLIPsd2/L/EcsReGzic/x/w+uXiiboFzuMAJXVUE=;
	b=GbVCjQwTvRdH8aTrgxKnKn+Ecwoz+TqCi6zLqZBQl8mjWuiHOUevIM5vXAxuuypmKV/V
	 IsvmkHTe0G0TQK1dB7DOK1HQhMlSq0giBzbikxk8oaaAcRhpRevy6rVgC0QMWUnjBuwyP
	 wJgwo/SG74KKA+g6fYot0ublUVv8aavCN6bIfW2UlAsnnnjBRI/7h1/9QlLeJPI2B7QQi
	 4JiLgrwbLU2PFMjw+U0/TQkhR53NmSEJLgbZBHZv0QBSVBs1yreIUEC//TL5b1LhisktR
	 n/v39NbCGURE8il1yXdzz9cGBh2SORGjGPltLnqih9EfzBTqGlkUXpUg3ejH5qNPSjg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866108;
	bh=PN4mLIPsd2/L/EcsReGzic/x/w+uXiiboFzuMAJXVUE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nn8ebz3tvtKalWoLs3GWFzPaJ3zAF90R5cuaVxltlGMy8KNtsRHtQeoTSQN36FRGg
	 ybNsj3vbtvGWRsRhTD7H17Cv4BkGGiySX1I5dhowkDqL7/YSEWQqIigFli2Cuum4sp
	 2IQ31WaARvG7ZQeAiSJsSQHx6w8u672N3Ee9pykvTk9rBbrGlRs3w4c7BO9mXUBKGK
	 UVbbZzCeRQwhjIu248IRFwPl3M1sd3sziwFTaQsdje8Fs6QhGnYJNSFAM69DWoadMo
	 mqmyCnO0p2a4H88yUbz0AuzhsYaQsLe/TRKzYSd8RtQAnJWqH0oxBJ8usrL5doducc
	 uKErAAwfgODfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41A9A40720;
	Sat, 24 Oct 2026 18:21:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE0893D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FC624009F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdAGxPA6xX_U for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:21:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 444C640049
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866105;
 b=FAZE9JIF6Qp1BytPnzZkTlLlnt/kMhq4bitBDFIKbHfnF5FNhPu3qcwqB4Wu9AYW3c2z
 9kT6mvDKVB8bDK2RjOHy8i2zlCxvJS/d7Cq9/F+C455tnCmMEqlOJFeSwEC1mLFGV2JJK
 vVbw7RMHcCLCN+NnRvEn1PdaC6Gu/TGSYZCk4QaDgTJc+hAWvjWFpk+EZ0mktPytm2MV6
 U14XSfUafkMCdfwNovK8xCaADad3M9Hri4HdH1yEPWa7UMPLOYAKFw3Zb6vvMXPfU1M/j
 V0scaRxbkZRJUhmTefKGo9jMqJ+D9rSyXHpv5xxA6/X3GEezD2t1xwlpaGKfNtRhsHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866105;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=erE6MA40Z2Kbw2Ydf7w3MVYorY4yQkDPahzosOqVGv0=;
 b=oCJFiyZICWHTnlDIY4BLYLkSBUVhBhNgeYlplF2iB7ZX4Gmpgv4Ky0cwdLfpHpx6ZqYY
 ACXK6nRUbxyAjbPV5qV86z7K9ahm+Hp+HFeWBdAIyj8bLhhFcFom6ZiXVCI848luyGLH3
 IU26oRDzIfVYedkGDgcnOWDACWpMopNW1KZl64cml9IKS4GlET8hhe1HQ1P3zQtiktawC
 OxjWwlAHo+/ES1ZuhYsC29oaDV7clGA69w5cvKtZCiTxST/f6n124NqlrzEbWqaBYOeJr
 9kHa3UhGMivwlcE6QdYLacoLEIL8RUDVM9v/ewXsHUZyClCjaUuUHct3IwgRXWNzJow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PuZprdRK; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PuZprdRK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 444C640049
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792866100;
 bh=erE6MA40Z2Kbw2Ydf7w3MVYorY4yQkDPahzosOqVGv0=;
 h=From:To:Cc:Subject:Date:From;
 b=PuZprdRKbMUNOT+3cfOeT0HnsTd7iCc9WwWFOwlrkK1aNnX7QWB+ntNWnh8cF9fFr
 xqDsAnLdDH5k/hrN1moB/GdHrh0QrnUBHWNqAUc5e6EG0l4UKQBkuKyVO5ciUxsml4
 /jBfFayCfTYs7xV76thYxRwCpCEI6wWuIXoz59gvjXkRnYGL7uKfApDBjlDqovDSYH
 demLjZKhkTJzkXSYitYjTqSGdwMjVnW/b5Q/6V8+Um3q4Ywaibmj6PATN8ugJz5ebv
 3a3eKlFYUf0FSmH8AhN7dG36XGe6q1NsI7BA6eSfT+FPQCA+WWqESLRH54u/JlNhWD
 Oz4nKexJiUOqw==
X-KAS-Sym: v3:f51bdf72230551df:DxOslTHEAY/NhNBhgtsSTh9ZX9KwDanaNuvu9IuBsTp0F
 v8h9kSMLNjQvrVXUgjnfulNVzFWfSnRr1/xW8OaU2cMMpVrlqsXwBDs1myx8dReiXzwJUgM/5OU
 KoaJh3f9JILY/QSCxXdrnNDBs1oL/2a3ffJb0qjCIQtHfdowGY4hErxtN46AVRYQYDcyqKvFzfd
 ugGyOk3DuFZL7A0gUNY2dqIjxDrL7SqxQYlxY1WuBVCGL3G3qC50Bl7+a+JWOKYkky1WyNAtIk7
 6cZQAVlsuWJYtbIWMOVpoxJKKF7Ad7ChZrzh70h/Oyc3jI0moXCzxyx5yaApbepQ5I4q9+4Q==:
 8GD4siq7jYCNFJ73y10ImStMScNdWzOSJggD2lEaFY4XUmfbChn0/Jjwi+bJ8CgW9wbz598zUtp
 Mt4689e0i21pqT6WBs9OITJ9X4ZtzzGtO5zAWg8ZJuu2WVsquoOwIJVLbSg4gPnI08HZHYlhi5k
 /0t61dXzyp9ZZv1oLPYO844seSZ4jcb0k+0QorPtz7IvAAaVP8UYKlCSRBwW0QdKZWUfW1VQYSv
 w2VA1cU44+raMezsfjcApqPSjbwwXa9xHIBe2UW/3BGId++JZLCc3IXnHE8qUMfHeHsXt0uEbcV
 ceQWrwX7Z+bctK9pDptFGNcFBTTVKsB6PAPstl6OG0K373VMxm1+nt3kTW9O5ffTa8DF6o47ivO
 k7GA9PtN2uITOXAXpjXSnG22y2YuE1jWg1xXVFip60wPJhmPOT/LjgYc6ZwAIl8esjYDefdY+ap
 MzW+mE+tSMdL7skwJPuU+rbAle95PUsYkLzsNXbsI/n9JrYOuaOrOTPan/sCxMFHKgQ7drDqdoq
 69/d69tNGx3W0QMzWFLHnhUkJduO0VRVTqeSVJMtizsmnKNB4SEG5B+Za19RZppj7HcIp5mfYeM
 K1s9
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05C74A4C6818;
 Sat, 24 Oct 2026 20:21:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33870)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKgN9-000000002u6-3oeA;
 Sat, 24 Oct 2026 18:21:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>
Date: Sat, 24 Oct 2026 20:21:38 +0200
Message-ID: <20261024182139.3264878-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/2] package/domoticz: remove configure option
 needed for CMake < 3.16
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In 2020 the fix we remove now was committed with buildroot commit
6e6bd863093605419044d6e376185ff3caed9fbe as build fix for cmake < 3.16.

Buildroot commit 53beb8fc1a4f3ba20ea6c856b4ec8506570f17c1 raised the
minimum CMake version to 3.18 in 2023 so this fix is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Building unpatched domoticz fails for target
bootlin-aarch64-glibc-old/build/domoticz-2024.4/.stamp_built:
https://gitlab.com/bkuhls/buildroot/-/commits/193b593de0c65a10581abe808368cd736c8f47b1

This patch passes Gitlab pipelines with the same build error
https://gitlab.com/bkuhls/buildroot/-/commits/f2f37f272b02ca379a429832d14abf42a9a39242
so this patch does not introduce new build errors.

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
