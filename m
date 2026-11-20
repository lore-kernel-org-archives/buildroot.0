Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572DF606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GwpU+CQG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQdvu0qI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C9EF81115;
	Fri, 20 Nov 2026 13:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RZzm1Gc07Lz; Fri, 20 Nov 2026 13:33:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 482B7810A1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795181604;
	b=bste74ep0q5A20FNA+Mh30pFdndccrw7vjtGb6w/QuxSYxbZdrHG4eoHfYQtg2RqEsdd
	 +olVSuCWSmqJSsCk5BcceEuLZo9M7MXH4WPLHdsbPGLXTZ8sqM3jQV+bqtzoxLd3PD6G0
	 Q9/Q4iVQBOsccVfh/QImuLbk7x5xRAXGAETEBPFI/wAifK+GnapRda/mpi3t/f3rOTFPJ
	 JbXcztg1dQWNmbVo8DSDReRgNkxIgg5AaWUAVmLw0x7aLAEkdhDukeX1jgxkZ2x268cV9
	 dRl36wJ83d/yOfpGaqc/BFMGfL9qY+ulB+4OH6aL9bnJo020+49RKH+evupuJMnhzlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795181604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=DEBYpdldG7C7lMYGx8icQE9Erc5tM0RUTKlTeGfHv6c=;
	b=mi13XDbiKr0S0CYssSI9WKNGrwdDf4pMUrhz6g4piTmmpa7OyKMUDXdjlHLXS0+dkbq1
	 /csAIaywgI+Lq8zwyMETxPTBm4uPOrPI6E9vtVFDCJELUQg9gH7a0HuUiQy9L5GfH7Lyi
	 syUkHSxOJSpSpXCUOJaJiUg+rEXJtwPUsZLaU9EBbpfdsYPbVQECKBG+Vx9U+OIlHw4Ce
	 /1flDHGXBCwgPPzZ1lhvX09yAWHqCOzQacd6TmbuTOE/N/eHuAr6DT4mi2CiAyXvFdZKq
	 SmRSP45V1rmDJzSVQ+j1NgikFqLCef2rPjZQzjmONpuC9G6nZJZJvWaUROeSH7DsUVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQdvu0qI;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795181604;
	bh=DEBYpdldG7C7lMYGx8icQE9Erc5tM0RUTKlTeGfHv6c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GwpU+CQGZqtGNCOHcJEjWlMmwd28H/JiIraqc45wGZ4LjF1DTHWyEtgPgKGzw/Lhi
	 mf081+fr6nkyxKopjwEWwvIFB7dk163uLd5QgOpf+6En/kl0ug5rDr7jWKpGLo5zct
	 e2qtinzYumtsziT1xzedx3o4i7lyLdNrGh0qEJk2F022JvJmD29pWIHZrznz6ZtODT
	 A7a5dswzSRlVO4r2DFG6INgONVL7rK0JQg1Eb5vq9jPq1UB6CmpRtOmDro7xczZn/3
	 NRorGcKIdQew10zUCn1MDSCj5jp8EVrgCMDZia8nVx2Os9nRvYDAA1a9JX9zclCWbt
	 iL0+Olgrzf2Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 482B7810A1;
	Fri, 20 Nov 2026 13:33:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F85115D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C057810A1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id quBBQaE4gYRc for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 13:33:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5730481092
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=CQdvu0qI
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5730481092
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:33:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so6789455e9.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 05:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795181599; x=1795786399; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ti1BFgyOS31nZYXe4MIryCvHCdfwiCuY4NIO7Jdd5eA=;
 b=CQdvu0qI6xSly5fAhd9kcLKmtIfVpTI1ORri420tR/cVEkDFypa8P/7DrHt0m9z3h9
 6FxjNPIlvY/WdxnfyUQME7PQEafixLo8/87LcIDIhILHB09701ag9Fxsh8AjjjqaSgrn
 r31tKyeXLGeN1FrMT6qFm/skALnxSOJCGl/KXEE8n1SCoPoxfJK34FAYm4FojwcUeOh1
 YTSMgQFd+WE2Cp5Na8XJhArzVj323SPTxMSAWdv+0agZlfYQ1cgFyjXVR/DFOymYg/ur
 0j++7vOhg0u+V7JC+/nKt+rqA6nH19tRh8Xe1VrsULIUKktDBWYSlXMmMm22USOg850e
 i2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795181599; x=1795786399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ti1BFgyOS31nZYXe4MIryCvHCdfwiCuY4NIO7Jdd5eA=;
 b=RChSudpmc+Y2XnoA1AyIW+emeUpAWJtLUoIh1Iw7OZkBoKuRmDc1XS3v+P/3WtfAp6
 m+mOHEEtVT/Sti7LGq+w8GiP49icGiWHRW7l/tHdDWC/+KHzw42fmpckJW8MyO6kDe6Z
 dy3h2IYakGOyOny7l0sKnHHSPS/YHcJh9p8nrbFI9qyqDzlRkDBalf/B4/qHgOxshRSh
 UvZJh9kbDZbTppHo4CyTHL8QT12Q95z0vgFaElYPU+WC85SnJS8O9eP2Mhm6D4BH6jlW
 2uHHcdwUZau7E6atCeVNKAvaOW03lJCOy+lC0DLb97d4ug/JyZWZpXeUSKnUmI3NOI2Q
 bKbQ==
X-Gm-Message-State: APuU4Z/aFaIV/uK2Lp5VEM19U+mQsE2WMO+z+5c8TBUyyB6sFUDMe/jE
 w5HqRCnOO24nP0Cb+P2+b3gtqQrYhxuSmg0TowMybOUlfGj3yuMLjkhpxSQZ
X-Gm-Gg: AYBFou3mcYqMwTaxiUddjBWJJD+1h1lkqOMnGmlw9BJQMTj0LshWAzLoIOKfGTYFXlY
 /MQw90KiOgVlvW+JNeJ3i1BDF98AHzDKDejBdjS+e97eq2sH7A1QoMz0TbqOe4KiX0KiJ2T5sNs
 GKX21+u/1fjbpmTHWyzV0M8E1vMdvdITdcvYceszB6V+4gcazj0m5wGQh8VH1Xn0v6yVe1vZKkc
 S9ZT6IVM+2+IwPidfINF+DzOXR+cgL5CklRp7aWmgVC30iSi81us+rUmJkuTMOyu83GJOEewY2L
 xEgM/2mMHttNUTPonbFpSZe/pCD+Jsj1WC4IrhFtKO5vF3w0zfBzFQ9vDxUIRi3VyF/jVIoGMMY
 4izsfHPrtmk+n+Zsoh+c3f46p7in/C/K9Zpd2hkMc7PuTOaAcAIMNveDDjtMoMPHbPqUH5Bz/GX
 BEYw8HBL1xfzode0fj/g5zOt1AUWuhaFzgkC8xm//j0ZooxtxBQlkgx2VKZQ3Ue/t6g8kNnp5Dp
 XXXI37yvyd/0vwsJzsYpHwRP2rhVODMl61WITWCeiPS4QHBEkmYlfTGcsrVKYwipgGcy7HrGiWy
 L0mrSwh2NxxLTdddLouqeQ==
X-Received: by 2002:a05:600c:500c:b0:4bb:82f7:549f with SMTP id
 5b1f17b1804b1-4bb8881409bmr73748935e9.19.1795181598820; 
 Fri, 20 Nov 2026 05:33:18 -0800 (PST)
Received: from case ([84.199.255.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a3a3dsm78285585e9.10.2026.11.20.05.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 05:33:18 -0800 (PST)
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: buildroot@buildroot.org
Cc: Pieterjan Camerlynck <p.camerlynck@televic.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 20 Nov 2026 14:31:31 +0100
Message-ID: <20261120133132.2258440-2-pieterjanca@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120133132.2258440-1-pieterjanca@gmail.com>
References: <20261120133132.2258440-1-pieterjanca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/wlroots: add optional libliftoff
 support
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

From: Pieterjan Camerlynck <p.camerlynck@televic.com>

The DRM backend of wlroots can use libliftoff (>= 0.4.0) to offload
output layers to KMS planes. Now that libliftoff is packaged, build
wlroots with it when it is enabled, instead of always disabling it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
---
 package/wlroots/wlroots.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index cae2ff0c5d..5197dcf32c 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -26,11 +26,18 @@ WLROOTS_DEPENDENCIES = \
 	wayland \
 	wayland-protocols
 
-WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled -Dlibliftoff=disabled
+WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
 
 WLROOTS_RENDERERS = gles2
 WLROOTS_BACKENDS = libinput drm
 
+ifeq ($(BR2_PACKAGE_LIBLIFTOFF),y)
+WLROOTS_CONF_OPTS += -Dlibliftoff=enabled
+WLROOTS_DEPENDENCIES += libliftoff
+else
+WLROOTS_CONF_OPTS += -Dlibliftoff=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 WLROOTS_BACKENDS += x11
 WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xcb-util-renderutil xlib_libX11
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
