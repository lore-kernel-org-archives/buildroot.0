Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF267606A6A4
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 21:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mL9QP/cl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmOhRHbh
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E8C81766;
	Fri, 20 Nov 2026 21:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD7P8Vh-oY0d; Fri, 20 Nov 2026 21:54:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A576381755
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795211679;
	b=UldI4IG7FZ+rnrgd5zLSP/kjnUmU88KeYYATmb/r6xt7jD+bn5ir2HsbN3TECnpu8BtE
	 2EVuumrJ01E/I7iEUVySPbqoIlmG2aIw1weSK9OSIxq4m/0O8RMZFzq4lc19S1Xlm1jhH
	 ftgaZ0ApppLkrAT7JX1HLQxM7a4pwnoB38lcVDDj2szMc2/4cYnJwN6H5L28MqK6b67JG
	 fGTEAdaKxQZVcQTD3lis+L2ed2CdEpFarncM6gJRHquIo/iRmUHUhOiP6Aw4q+143iUm+
	 gekJDoU0nuaoFEa6uNB96GXMiNXqqGLSRG1w07yKwsg2CevaYDJDZw90QRyLTs9ZKnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795211679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=cbOOr5gy5cyeAEVUGsTdrTbIkQ31RZ/mL/rMYyfVrvc=;
	b=lzm4IOSRVmDlhq4DMl7Drg36L8B1+7Gc/yJRqJ3wbau7KEiM3664Zk2QDg1OBa8HeLWm
	 +EJ17n2MUJWzYwFgVYYd6B/Wc19ruVq88Jt2x19Ul/7w19O/+2fZ+fdgU2QhqMa64seHd
	 nb2fZ7vNwY2NxjQUYAKM3pxzyF3xNARCUTHT3cvaLEaBeIKsS64NHQQC8dYRGDWrbzelM
	 CUKq/mkn85dM/AeB3U9eBtA7fHarQYlZz9frqSzG2Y6vqjFT2dsQ0UvbOQoCbxA6lM8wm
	 bgOl7N+l+eIAWidkVLzjeW2I1u3ucaNnF/BM6+oc8idP6gwnLJCaHLq9tuB7bbihDeQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmOhRHbh;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795211679;
	bh=cbOOr5gy5cyeAEVUGsTdrTbIkQ31RZ/mL/rMYyfVrvc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mL9QP/clyt4v3gagQNzIloZ+ZURdOy7DAuL94BuJhFTy9XSHqXaiDj812hkAxJn4/
	 0VnwS2N/Z4fSOuh/Zr71R79dOBWoTwkVxV3daXF1v1si6ZIcUoiUIdsbTHLlCCZNR/
	 5wfOo3MTSpMrSMowV8UHWv7ZwcCXizcpbMh4cCJP5vkMn8DGUqT5LMP3umlQca+68q
	 BsH6N4Ar58Bua7gMjy0+MzA57pXQfZS6Ba0DTbX+DchdNPIq74Ws0MLQc1I9g545s8
	 Jx2lCAHBmv8zpn+l7MvU0j2jDM+waGIn8LUzz7amKJNZYH/7uW/xgmLCwa+3ZNU7Sz
	 8nG4d9JU8w/Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A576381755;
	Fri, 20 Nov 2026 21:54:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7991A759
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 21:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 680F381755
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 21:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVLdIhG6xLDC for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 21:54:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5679681704
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=hmOhRHbh
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5679681704
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 21:54:36 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4bb6057b333so6112555e9.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795211675; x=1795816475; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k+VpslIx1GxtMhFfsIlOSPUz+1bcQg8K0z873DY8cqk=;
 b=hmOhRHbhnaufv6uEs3s8OafLtB5rMoNLCJGTqb0zp+qt/cSJWxFvz84pHBz0iZ6503
 S0Gioe52d4f3trAarAhqFIoixXrKRdZ0N8qgsCHW0i90PyFQVKF7dt6t4PN+uT7806Ue
 SubtyCjU5RI+1lXGtTSIEQjTw2ZmGbKsE9LfoxxkdQ7iYzMPMt9Jy1cr++SPyY3PzVkC
 xYI6DmuwTdKqZJFN4jNVpcC7OhyZ5fYSz20LQi1JUZA2JaL1LMb2ZDa0tUzHyD1/in1i
 1duTAQssCsuGfTjuztCT8zKiN1AF+p2nwKqADHuoExwXJzW0bzSWYgHeaHoWs+4FKv8y
 QPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795211675; x=1795816475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=k+VpslIx1GxtMhFfsIlOSPUz+1bcQg8K0z873DY8cqk=;
 b=vIQ3GRtES7+rROGJcQsTV+U2shMr3MlXoVRuvI2c1MJyT6zxb1OcLO0k3utW61W/Uw
 JrJ6f9YY44i2uOuj7tQOPwovDaMaK2I+q5LNUgNsjnfg7qGhi1/tbn+cy2Q8DhKQFTkG
 Jpbym5wlxqxIe6maee7HcA5/ohY8RX+2Yiz3xykPXyFzThhCFx6f/jGChJpRlDWU2wpf
 1hOcjQShu/jIcNqjgrz3XSTLcPvqjMrszhxfrfnRBoRLJrHz/xp2DCUp8zXiOCzRKMBO
 V9aisc64XAfo2Co9PNpK8tahN3tp29UkFdnVEFnALkEfWkNO4DxTbshUijqr5Oa8V9rn
 q4MQ==
X-Gm-Message-State: APuU4Z9qWY1gNsXeqJPNB8eSsfPBL6CJuu/djP5eLNMiIjklcyYG4W4s
 O93pj7y8p8tbUluSDWBlrVAX8OLqKJc9lofNMUIQ6URuWpmcLgIdFgsQi225bg==
X-Gm-Gg: AYBFou1J1Lnq0Bm/coiqSKpzkgfdpB8uhz/buwT+Nqo2IR+//jASTJtYWLqOBuDnodz
 ZvLrhZpM/hnmIMNY/3QCvhucp8Pjex/rUL9oApQIaD3izkFhapVXbzvQ2fv35zoccajscsBmd2v
 nOTsYT2sSC6jZV0mmyFsWZEpEBlzmbSVIj3x9e/sGSqyFYp407A8GcTYloR3JfSk+IMEAmDxDNH
 IJXW2bJ1V0bLwJU3slYxRMzNffHnbyDH3zTXt55tqYlIzfGL/wyQLH30bHiXq9yd3xN98sd2Tf6
 lt2C9Azz5rmCV0/cA1vfK/nX2b/bzUWDhxezxJe2ay79hHZ350zjE/mBMmVwc+JQijaPmVZ4UCi
 RKhohUUOsQPNVMtRvzNhfHmvlhvMHajdblCrPWmQkSTvuUTSPSpYyhl7NFRmzLqzXZdj/LTOeCX
 ONVDRnJNzh2rupUoJeAFRVjrJv747LHAbFF5ADujdhXOikCC6LETZ87LV1M1u8pPy4e5hd+CULr
 y7O7ZxGFB7Ey9GDfPVLaLyq3pME54ObN8PPBaZNqpoDyZeQNsxwZ/xO3nEOn33HYX8xfcgVokw7
 2CBcEwHN0ipMz9wwAFYMWkOFUGf+13WuEudbvyxNmuTSJjBp08k=
X-Received: by 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id
 5b1f17b1804b1-4bb88812200mr108451665e9.17.1795211674851; 
 Fri, 20 Nov 2026 13:54:34 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b2437sm219677465e9.13.2026.11.20.13.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 13:54:34 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>, "Luke D . Jones" <luke@ljones.dev>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 20 Nov 2026 22:54:33 +0100
Message-ID: <20261120215433.605054-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20230315085103.1671888-2-luke@ljones.dev>
References: <20230315085103.1671888-2-luke@ljones.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/sdl2: add PulseAudio support
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Luke D. Jones" <luke@ljones.dev>

Build the PulseAudio audio driver of SDL2 when pulseaudio is enabled,
as done for ALSA, so that SDL2 applications can play sound through a
PulseAudio server.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - drop the Wayland video driver: Buildroot has it since commit
    4662553088b8 ("package/sdl2: add wayland support")
  - drop the Vivante video driver: SDL2 builds it only with the headers
    of the proprietary Vivante driver (gc_vdk.h or EGL/eglvivante.h,
    from imx-gpu-viv), not with etnaviv. It needs its own patch.
  - enable PulseAudio when the pulseaudio package is enabled, as done for
    ALSA, instead of a new option. SDL2 only needs libpulse: drop the
    alsa-lib dependency.
  - rebase on master, where DirectFB support was removed
  - new subject, as the patch now only adds PulseAudio support

Supersedes v1: https://patchwork.buildroot.org/project/buildroot/patch/20230315085103.1671888-2-luke@ljones.dev/

 package/sdl2/sdl2.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 31f96d8e9b..e77234d938 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -19,7 +19,6 @@ SDL2_CONF_OPTS += \
 	--disable-arts \
 	--disable-esd \
 	--disable-dbus \
-	--disable-pulseaudio \
 	--disable-video-vivante \
 	--disable-video-cocoa \
 	--disable-video-metal \
@@ -157,6 +156,13 @@ else
 SDL2_CONF_OPTS += --disable-alsa
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+SDL2_DEPENDENCIES += pulseaudio
+SDL2_CONF_OPTS += --enable-pulseaudio
+else
+SDL2_CONF_OPTS += --disable-pulseaudio
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2_KMSDRM),y)
 SDL2_DEPENDENCIES += libdrm libgbm libegl
 SDL2_CONF_OPTS += --enable-video-kmsdrm
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
