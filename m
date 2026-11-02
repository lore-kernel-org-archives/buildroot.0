Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782DD606A327
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h24UjQNt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463CF80ADC;
	Mon,  2 Nov 2026 22:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrhGUy072uQs; Mon,  2 Nov 2026 22:49:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 464C0808BB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793659775;
	b=CBB4bVnAks9BZGC/LxD8J4+i3uEBb/y59U+2MTeRkffCbMPbPtDpPIlt+SLm4+gs/QbQ
	 +xdU+oTVhzyOA6PdE7g9lYHG2yNnS2RW9q/WoVcMSJ36udxFhhYVf3l8dbuMvqLxgHxYw
	 OlU3k/75yma0KbO/FSbZEmKdfNPyn56wLDmbX+70z4Y60DhM6Q/6Jpqk6d8BBv6IrxLRc
	 lE25+/bQct7e9VQEB2NbQJzEVNQzF9tGuXSk0lCTgCU+jjncx8nU/kSq9QVsSLXlRlsOw
	 37Qtdwv3e6MipSwWiZ8MMpQE6SqJaE3zT89T7dLZj/3H9bMHy0J4oLjCkYj4g7vmZZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793659775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fZI1fE0uBq5islmaJ1MFbquEUu9D8CO6dZccEB5nVR4=;
	b=DibdAlz2uVOe/uCjc7qGtL6EoP7Dure1/o+UBZuqbbZDBNtvFvsG4XsJVVpfhEws9vUg
	 iwdgrzRWnQzyXqbFjAsIYgNHOsMtCWe/6Z/JnPtE2WXjLp7kF3nv9qsnHK/RRd2A5PRa9
	 o1W40EeaaM/ngDGSUyzFqT1S2oJnl9Yj063X2iVnofhQByEIGsU6mteT+/KOja/QgUQT/
	 sqHs9k8tEJwpRuGTPPDekWZYFIHZw7qeanwjK28edSa37VZ86sjipZCeTtopTqjCprKfI
	 frGoqlfyJbqykfyq6k5zuPkmuNpMILDBrjtsnOkPgAYNIJl4c73Z+TF3sok3K18wjtA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793659775;
	bh=fZI1fE0uBq5islmaJ1MFbquEUu9D8CO6dZccEB5nVR4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h24UjQNtRp/va42RBP68A5fD71Pl54WVHNlF1M84OHMvy5toxYd7DGrYWYts5vchQ
	 w0thRdmQM52Fj5Frz+k2mRdPeW8fOIY/H8SaqHnd1nbRktDOeV2aFgX4V3jwU8lLwX
	 u8dqC5SsFl+rdUs02+W6fiZKg+96HrYI2SbqYvdD9+rOLXzFC3jLpIdw2aB9MhJNHl
	 9DnscWhkVdqSO5A3eqvFqznaQ/YZmIQpyh9b22co/iBto9jVkktgHiEFzz8/T4SaLC
	 vHfS/CEIFF6qS/3zP0Vd/nx7LTk1SmowKm5kcWhNzxn4fjJvXzC8mJR/iCkLyvuiAw
	 +S9AQ/ZFzJ/sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 464C0808BB;
	Mon,  2 Nov 2026 22:49:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 692E8411
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6681740512
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mipFk8PWajQv for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 22:49:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 92AD940513
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793659771;
 b=Qny5KTdDlrhlK1RNCSbaVBe6ef31uQcDovoPwbHKw7HRfCPbNRWf30VExMns33m92Fms
 VLyspEMjfMgX/wJ7cAbQmVcViutiZbpLqHTRbKamEp/QWGPYNovZNAgcIHX7GZS8Szc6b
 mU22DS/akDIrhqGcc0GCPiZ/MKHNiV/ThdaxxehO5HKTh2Bp+Rn2JHUMvLB+qnbNeSEB/
 0bmw47axOnZ51wUN043S5zgTihuTAQpuEzahEaLO3ey0Rk3NmQ3X88vuBtESTTEZm6Cpe
 B7MjK1vHdDa443+03WlQyqGA8pKUoRheguEj1nVTVGLZDQmK1JovTp/XeNOdQX7OftA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793659771;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zTfdFRQaMMQtRIPhob7SgN/AVVcD6A53X2u4fIb7awg=;
 b=OUek9BrvU2tnoRZNuiWaFLCsuW85F3VGS8wPehnQ5YgXTlyzzxNIycGM/315nU9kpS6I
 YL+iRobaHKPp5XUs21LzCU9mn3rdmk9sZnDgLRVtA/W4O1gqC1fvrfsrfIk+tp5X0w8wo
 +Hg1YezXlKXV5IuiwX9m2We4qgCCOhemJwkVlIwdKcEXts4M8O55sbKEDM2nzy9QAZUga
 7F3l88lAzgfV6iC1T0sJRtZvH/zLluljMNRl/dHrrZ5urJvYGj46yYoEiUat0p6AXofUy
 6DM2BIqnD7PZmD718GUm31fErKvvJTzM7BcQ3ZKl4EWDh4DdAedP/JbYkcBGBKHFXTQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=telaak.dev;
 arc=none smtp.remote-ip=209.85.128.174
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.174;
 helo=mail-yw1-f174.google.com; envelope-from=jttelaak04@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=telaak.dev
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92AD940513
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:49:31 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-8ac4806e210so29840137b3.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 14:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793659770; x=1794264570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zTfdFRQaMMQtRIPhob7SgN/AVVcD6A53X2u4fIb7awg=;
 b=yLEBxeJuOcAtbsDxSs2seaR+MoQBh65qHa9J+kXDCfIyCcLc9oKLInVCIuJDuHdO8s
 ZWtyoBcn4ql5AyHc0y8NuJTS2Otnf79I6fbIvMXotXE1/5p4FhDafhD6aq0eqkZnuc8t
 GT/SDWQWspB8YWvWmPnjo5YO/njLK3HEqzm9THxWhS9NbnBVdR9fS+1h6QZUtjZCWP1I
 IIaw/VAxts0s78XJm4tKt0FIJEVWJ7IWmvgORdfRGZ1Pwg4lK07c2V3wlpS9s23vanSu
 hDy6sWn9Bocg49qGnM+4p0fP27q24SuTyTVJ3wSWT6D14jdV7k0b2NuQepPl6wqHHTHK
 JpbA==
X-Gm-Message-State: APuU4Z9vRydKUDyJvu3LuPWyuRz3pMtV8WHsRwjarSmsmsBka03zbgsz
 eImOVuOlIgbB8lywUchJKRQWMeewNh4GuwFqKSYUN9i47qW2HX0l/b8Dl8hZOxp5b6M=
X-Gm-Gg: AYBFou35NM3B5z30AoWYyQgMK47zf7IX/51jO6KOdmARGeu41c/WIIipVpnIIsi8+VP
 Yl4zJj74SUhDEq7AEzbKLrCameJcBsXRBet18OdJHCDTndxPxppzb3ekaj3/N75XJH22+deT0Iq
 JTAa1du0K55j2lHb2FHgEBom6KEqT8GeIDe5w7/1HuYHPTL/HXkUeaFcmql6SXpPxAXbHOioCmu
 ByKrorSw+rsGcPG3cjdgN3hwJWqhjRDM9hG6LSK310zaUoRmRX3MvrpDpI1Cpqz/WKpsKE7xaB0
 KSrlVHn7lqEXfDtKoFEF14SyD+twbhD9McqrM2WjHw+Kc2CH73rezyOq8xBkhHINYCjmiT7JeL+
 w1WUlP56gMmXtRFsOfC3584yo6S+aj++ydcJgkxMOcph5yqyMmUIzYvF/ZXS5wKe6uzK5ZRYZI9
 gZrhDIbCDztVQ0yItVNXcFO3DO9DlpgV6sMy9Wo+u/M0Ooj7Pc4a4llqwRASHkGMEFOsuQpD68W
 8ysRwcpH5+i4ILn8haDA9+i80RQs6GeH91ycYhrTpXd4jlyCCabtAKz/b2iTTb0d+CY6qAcOXoi
 sVSt8HWkLRVOE+SR7nKM1veXDkmW3dWq2uV0czNQ+pJ9g7+Mrty3pw3y6mR9NJyG8W+ywMUH4x7
 xXWsOaHqrQJAlqhVvUeFF18QmzXXTz1Y=
X-Received: by 2002:a05:690c:ec9:b0:8b0:9e22:2651 with SMTP id
 00721157ae682-8b2b65d5bf2mr85797637b3.7.1793659769799; 
 Mon, 02 Nov 2026 14:49:29 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b2b71641aasm61638357b3.25.2026.11.02.14.49.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Nov 2026 14:49:29 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon,  2 Nov 2026 17:49:14 -0500
Message-ID: <20261102224915.69302-2-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102224915.69302-1-joseph@telaak.dev>
References: <20261102224915.69302-1-joseph@telaak.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/wpewebkit: add missing libxkbcommon
 dependency
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WPE WebKit always needs libxkbcommon: OptionsWPE.cmake has an
unconditional find_package(Libxkbcommon 0.4.0 REQUIRED). Today it is
only pulled in indirectly, through libwpe, which wpebackend-fdo
selects. That path goes away once wpebackend-fdo is optional, and
WebKit 2.52 can be built without libwpe at all
(ENABLE_WPE_LEGACY_API=OFF). The WPE Platform library added by the
next patch also links libxkbcommon itself.

Select it and add it to the dependencies directly.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 package/wpewebkit/Config.in    | 1 +
 package/wpewebkit/wpewebkit.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 91de3868..c624c697 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -54,6 +54,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBTASN1
+	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index c424a3c4..ce4d1ad9 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -17,7 +17,7 @@ WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
 	harfbuzz icu jpeg libepoxy libgcrypt libgles libsoup3 libtasn1 \
-	libpng libxslt wayland-protocols webp wpebackend-fdo
+	libpng libxkbcommon libxslt wayland-protocols webp wpebackend-fdo
 
 WPEWEBKIT_CMAKE_BACKEND = ninja
 
-- 
2.50.1 (Apple Git-155)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
