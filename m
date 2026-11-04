Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7086606A86E
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dWvGb4rE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5cIGau1
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB514095E;
	Wed,  4 Nov 2026 21:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgOMbLdrCl27; Wed,  4 Nov 2026 21:19:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D43234095C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827150;
	b=krTUqt6sW07q3JGfHXnMaIuM/t7RNIt+pT+rxfl7I1NOl1Yyy76BWMKuTgLnKFYqhWKL
	 AplwApK/yNe6ae5rKpAAP1D0miKq0sXNQknt3+gr4rErBgkvgspCVh3658NJw7+vVltp1
	 WBYvbSDPT7HGQ1u4i5IDyJ6Op/UdTprnW8J2QPq2vWGslw+2/5mV3B9wak0d0xbKxzsHi
	 18nW1BhQOLsO8ALXNI/+GSS7G3drii/ne41JR91VwguzgMTDyBP1Aji5Igd/WicIk3USj
	 gEQw7Zbl+zEpoQq4MAWNDOmV4LHV100wBr4GhdlXpQl57NfVuSgF8I3y55u4IXzx0HA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827150;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zIk4jIciAe5ouSDLUbpGIPzQLnE8uIZ//PTafaIkF/E=;
	b=pws7Q8Nr9i5VURsl2TXn9W7lyKQjwC4PHpMr2uZGoCSEOOPbveFeD4cIbWIdN3b+lHq5
	 9VjeCpSCshJKSOEX2teNLGJNfpu1XiwSmkLWFX426J+r+/vXCk6Lpx41ov+KVGShfBTpR
	 EMSc2S07AMDejtLzE9/qxmvj7RnxDisGNQn9zhXHn+q0/37nCl3cW104YvaFo3VjMwKf4
	 1m3nU4AH5plRK8qekVShfk3OXvKLsZxDrmUY+u41BlKcz+BL1wID1s0lgP0wZeQMiGyDW
	 X8MZkg5MtHgm3yDkROBaTrEDNUCwkD0v5zIXXZSr6Aoy9LJTV7YAAMgdrI/P/dPz9Vw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5cIGau1;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827149;
	bh=zIk4jIciAe5ouSDLUbpGIPzQLnE8uIZ//PTafaIkF/E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dWvGb4rEMPXgWYRw7+KVaL7UgguK40saBcZ3ohC7rUsebHxWtd1uIIED0GVx8PpCV
	 n5G4I9Q1G+B77P5Zgj/RzNa+P6q+zvXJ61SoCh9t3qAwiPNAOznDEjI2lleFtszJIW
	 1UocPW0M0+EXS3KV1IIZknUoupR5x1FCLlrHYrFYMuEqfVAIEbbfSiL1vSrtRxh4CO
	 jr1CNhhu6/1wjxgHaFR6AYvURS37Rggbg9gAgGLNleNLkzf6vk3CcvqENjHJAErho+
	 SCAw3zDbOASLaMd+l+wTicjtwYrut1yosxqgey1nRMsm+16ufyOXDolE5tA7P/xxQ4
	 J+OVgU+ppQM8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43234095C;
	Wed,  4 Nov 2026 21:19:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B89AFC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06EC64094D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bbMmFo2rJNA for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 22F2340917
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=L5cIGau1
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22F2340917
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:19:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso997441f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793827146; x=1794431946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=m7dIr15YqP3zMG/Ju3Soy9+NVdzGIehsxkC417KLrRk=;
 b=L5cIGau1SuBGTdGf780fBC+XG7Nlw4NuzwsGRYe/t65a9wRcQHajRJ8OCarH/9IMes
 MYFnm9uSw931fjWr5IinGZhH/aQB9/i+YLPZRlXYsuz1cIZRmMH9kUBLSoNuJR4rQjlo
 TGBVlwBI+uTSXLMajftR+ThbdbDD0xFpogaTvJzdP1NYQIJuKubCcOV/il8VOnymhOCy
 W2YlLDv+9ogcf8KncJqbew/VbHmVGE9lbaU4YvlPIX5FCI2gYbW1Y7r7CWuHOcf+/C/O
 nj50pPdQgF/dVKVLIrfHLwT+X/tlRIAMG2jWMcgODZjkmXKTJOuSv3eWwXHYzakn5hUR
 UIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793827146; x=1794431946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m7dIr15YqP3zMG/Ju3Soy9+NVdzGIehsxkC417KLrRk=;
 b=hhRxYJpio/4OgtZIhK+xWWjua9BPqMsZGJ6dlcSi6GlIB/lq64QLdvKZw5dNm0ARcI
 b5GJWNxORrl+cvJhL8T+3wlKj/8klLn3JKajzWU3spv+5AXiOudIwlAN31OU34WglchC
 NgaUF/SBIA+5JDgCTk+GKd+hcKuS+Pj6a0VFTz3hymk9Cm9fgNNoJyR14iATNt97ML9A
 ohkQrySyIS45obFoKN/7mD6eP+Ex63AJ8TNaCUFXRQp5VI6ztHKZExOxp6Xzxlz9Rapr
 i30UY3It+kndhmdML7dmhBwlIKGsSruD8uxF/BBIwgQVuG1IUvctRopasnp9LRpBA4uH
 rg9Q==
X-Gm-Message-State: APuU4Z8RmTFXg0BFObdBO9XfOJmSNoY2FwViZmowCM3Abu1EL8Kx3LqM
 +vGEvg5IIJWThHaGPM6Lh2N9TTqcbiEhGTcL+mFoXGcZLcLYzzzTFSwW42nwAA==
X-Gm-Gg: AYBFou2PnNKED4/fVfdwhdxvBy7TzxgL7/kiJUwMXINi6Sn0QP4PnT+B+y/43BX9UGV
 n2o7jSyFTRBl3RMb/p4hxLhtcBDMP4JzevFLm3wkttFjLCsQNWTQ0qmE0yGKeK2iWCO1M9K5N2E
 KGONWkXqD9pZg+HSk/rLkFrdOqXt2AHsTdP99FWCvDrkMYeDgD86Y9lYKKPclD4CRduJZrF+gwT
 joc/MqqMVleq7cwXlHFJlBVP6+8tgiMLui996C/yTFIX1GU4R8em+S7qulzotUqSmRbpzqheovH
 7nvNi+AQf5bOuDXY21nv6FPOlS0Vw3VjKb+VHCT8jALnH8ak3a3CDK70KFkyFEtEoRAMSplEXYI
 /eTbC2z4O7hi4M70DIPAP+/s6TNuNHgpRo2SkWXoyTIyq3Nwuxzc5L/jTaPCbT9gEIz+nC051XD
 bAm+EkilDwsHsPohUWVR9v7Vuxmf+KZmAfIQdqaQMO3Ui+Ba7NzyxGgMOxRBY0T65VuGGXbHCIw
 E+LWMxDP+0sphMA7erP8IiHBVXR7Mk02h6IgIErMWVDLd6/UG51lwaUA1UfheYn0r4a+nayp/6Q
 XTSiFHAzGfDAcQ3Rg/DtC0fTrOEx8KB+s4rf3+9XJ8eDSe83cMly6A==
X-Received: by 2002:a05:6000:2403:b0:48b:59f:db9c with SMTP id
 ffacd0b85a97d-48e6e514746mr35199059f8f.53.1793827145695; 
 Wed, 04 Nov 2026 13:19:05 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feda2007esm5707400f8f.47.2026.11.04.13.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:19:04 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:19:02 +0100
Message-Id: <20261104211902.3623831-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Jesse Van Gavere from qt6
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jesse asked to be removed from the qt6 package, his only entry.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7ce992a683..1f86c777c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1663,9 +1663,6 @@ N:	Jesse Taube <Mr.Bossman075@gmail.com>
 F:	board/freescale/imxrt1050evk/
 F:	configs/imxrt1050-evk_defconfig
 
-N:	Jesse Van Gavere <jesseevg@gmail.com>
-F:	package/qt6/
-
 N:	Jianhui Zhao <zhaojh329@gmail.com>
 F:	package/libuhttpd/
 F:	package/rtty/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
