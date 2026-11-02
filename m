Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92560703AB
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SFy6b/Ak;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFMyLDE5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 491F560703;
	Mon,  2 Nov 2026 16:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaERkcx_u6Yp; Mon,  2 Nov 2026 16:05:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 348A8607E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793635516;
	b=SfcdTF+iui3Oc8ccKsRxX+J/mVwMOfo/rFzokJ327j2dzbE8Ie+58paBG9H9a8gjGxtp
	 0bWEa4sIIt4sVLzq8gXxf/AgztgEsTeRnW9BLJxa4v9Effg2hMgy6ZSgbjsBge6FsVV4X
	 EexEZrvDVAzrzlACErSY0AC0v/7Y++XzBmOEpyZNS8mM0KQNMNK0aeC629FZkC1fSMEUD
	 Rhk3wUk/7jh4KAj7jmYe009Ltty1VURQfM6OssyUAD+yiZDAG+BOXafcOjuAjED+4t3V+
	 XUWClJU+fz4tTyBYDEUZyqGuONIxfEHpYt43UPwCafqjrhyWNymvaSTNborXSXZktkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793635516;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CcKAjdPM76VNuj8ENPhdwMCui6PUPi+B9NMXSFWClZw=;
	b=CgFar27DxByGoaIFej6WD4N6kZsKX46YUJewDsW+5cc+Eg6N2KJcxE1FPC9PqiLnwcPy
	 CXbyTdvYHs5BpzoWMBitSKQ2wYbkDxKgJHEuQ9Z5WM4BGOwih5VAbKGKMX0aMq+KMxmT6
	 DipMw7siM/Ye+QMb41UG1hDWz4MZskBew9mNBqb4tgJXy2wj9aMZ1jCkdedNe25+VqTQq
	 K0bPxkIQWpksKAI5ODFglQAZWB8IF5VVgLD049p7pfqA3+lpfYzpak7e9kTUxwOpCEZbs
	 adxkty43qmBo2E+VMEuY1OGjMkGJtcl+mJfYjhZFUyye3cZuhi+ZiXdVbwJOou57h5g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793635516;
	bh=CcKAjdPM76VNuj8ENPhdwMCui6PUPi+B9NMXSFWClZw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFy6b/AkKvvBrTYtGGboA6SlcLYzWUDHZCOKaNH7Ega5mxZivNHabf+NhniVmLBEc
	 OgzFNzN1yO/vZRbRkxFnDjbv97HgjLn1Sr+Q5Dy31wwD7MeEN5VaxUK7SCv9kk1rjl
	 kOPvrGlMe7rFdOVzXCgV/XUJYwqEsjWq0MpW19Nr1CKngWKomEKF1vN4AvHjZuPxi+
	 xQ/9d1ETnK3NDXkc8cxmIuQt0s2lzNKC5+PpYVwxigAPP5LTQ1z7YRhWukmt62dTmS
	 HtFX6cQVaoHJoPHOPi0cTv6lB2i/LTEvWUioId8iUHnPXyzHopI/iMdTTOyrXTsBJs
	 S2IgrpYt1dQVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 348A8607E6;
	Mon,  2 Nov 2026 16:05:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA33D4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FEB98108D
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJt5b1cxLwM1 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 16:05:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F2A7E8107C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793635513;
 b=PjJqanpaftt4JhyMnRfyNLbPgd9nIDI7ZRbFByZzI/kxXDpAU+Fs9hlQCHvCcs5tLsXT
 trROAdmG9DlbDCDSJZafffQQRyQhanXgRMl/WFPwWf23fqNnOxyIt67Pwwtr2LPVn0KB4
 7ua/f7FoW1vJqVDDnCsS4DzFmQwxVqJuqA2PTVSo8i3C1jhYi06wpeRSZZyEMO2P/EWEE
 eLsjxAuXsAfUw2/aARs5ufw7TpmsLIQNMHt/FtFenY7BXU6c8JpaRL22VfPx8RDOxRwh3
 LclbY6djr6uld8nmHl71z9woznw83cJjVV4GK/qW1O3C0CmjtO71YDXB7nV+dRLzbiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793635513;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=OXhs/NepZ3yjioWgZptEjWb0rL8sP+K5tt6MmdS0dsE=;
 b=gKAIwbGeuBWXD0DDjeChb+VCx+Gup+CAE2MlQg4PTBvu8JnAN/PIiyw71fkfAXPh3Oqi
 p8U+3fE7k05089M1cQEKYPJO7JjI31UdgymU/VfvaieNtIOgJjOoeooUeWGu9HFYUpsaf
 Jov+dincPS64Yfwz1dRHZfAkBdYHuxfVibxP4sR9DT6RqdK9zk43tpmgTTRvvjVAOYwP+
 HqT/rQ0ABU6vdPfHy7S0H0lwkabQe1/ysAvJ4vRULoBHrowugQo8GDzWcApPDtVJDhKJP
 190OiMLfQOTBl4YlEaHf786jjvXE0URym3OeUUfcHd0TuxKD+7Wn4As8/UN/xewvToA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=GFMyLDE5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=GFMyLDE5
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2A7E8107C
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:05:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48e04773687so938215f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 08:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793635511; x=1794240311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OXhs/NepZ3yjioWgZptEjWb0rL8sP+K5tt6MmdS0dsE=;
 b=GFMyLDE5IxyOuJbqPQZDzhvV7LDDZO98IJLD1DlorcLQsoXGXOAenaoeoxeim1d6kF
 JFwMF6Zc6GGW2IMyH8pf1SONMG1KgSS6JTbwZ4Xy01DWpFV8cv7tCsY7aGD8sLRJ8jWi
 BRZIRwkAAUf97kzuLi+09dUtJ438ZRAC9b7u3NUHxk6Gez9uuzjs9B2WAaPGr+F+IxZW
 tU4wyD4AHhVBYaPsoKOz4GQP5bfbTYm+09quCvSFBQa7CfR2w0ay8gXW/adZypY7176r
 aSnOlrFzV+G+cyG8NJpLiiQF9jHYIVTUU0DME9LbuEZ7lv9LKunjrhZCiFGJuh67/hJ7
 Kl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793635511; x=1794240311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OXhs/NepZ3yjioWgZptEjWb0rL8sP+K5tt6MmdS0dsE=;
 b=nink3TAyPzCZEI7xR512bExL3tDzrhMBWsZiQ1a807riKQuZmDxHmDtvtCWNb/qbxP
 fYvMKq9qTC7TwRvJ/f8kA/BKFqcSbBDlb0jwzH3S+/WNiCQ/ym+z0gBmfBPuGa5R0JtX
 A3NiX2s6hv0DiFerVaF8Tn6WhwIPxVFn8129qnZLfx5uZyukLrLcWPVJagIj8VbAMaMA
 O8DmpY9m8148+6FOF5MUDUWk9/FQ4tM9TfuET5zrGZ5Gt/o0NCKYXVCJHL30ndAeKv7v
 uI9YU86Xa6MOcR/8sMEFe6wFBkJJIplupRoc9msunQe1ieD4Lqst09RPahcpi2u6QNJD
 xgOA==
X-Gm-Message-State: APuU4Z8sfFcu5WjEGkkH8WjakJvDmfCo+FYA1h5XnwBJPpOGNauVIMKG
 dHgUFoeSLWFmfe/MBVZmkD9HeMCiWfHpAHpXxxv2q1EyBN6k1hGJ5a1x5C2k4Q==
X-Gm-Gg: AYBFou1O41GNC/+VSOuFrm9m15PL5OsSrTdbAJfdq+1ayPsxtjRdo3ReMQI1Yv8XsM/
 aHEN/hrvbs3INkruRQyhoHKX2fj9WcGAOLVy+xjV/CJ/4iUIf/pnnGMAHvBMvYYisAb0VROJOMa
 XolnJCKmNateNBAt7ZcSLa13brA6cIVJwN556EDfDtFQttRiM6kMYThFQwJ/YtU0d9w8h+QtnDn
 wPuTJAXVx/3utikscD88zogXRDKk9ysJPCO4H9vEwCQLlZIb8QeByoDu760khFvkpjPOMwhZk+0
 tX7B4qwwBiVJDjQFhTVTw8QC6vy2IC71urN8yctVmhgiB14FKh7j2bfO1oXepE8bgZho3eSy0B+
 QkG94HYzhFU0iJy7V4dgAZN6PSjPGb9bh4l1W4b71+yvTVOw0g5U6qhIHpBvhfnj3K/gWIMD3IO
 g6W3zGlzyJ/YZHuNg41MssQ2gPC1ax4r+XctnKcuxVeOrGcahJdHc6mRaaQeZopyxF8np+PsKPA
 YpikgVfbgmzBBy3Tdabj5eI+SF5o/b3TBOwq+IkAhQLP/IZ2pfEC8ng0+9R8ZJ2Ry/bOyMSgcFy
 dfEsKauXaTVp3I1wh1l2Au/Yp3G6/3M4+N5BumQ3Fxa4zNkbR6JOvaQOrR6l9kbrQ1v1+VjcZFa
 x3viFDIRF9S+vWAQWrMHqqgXIocz79oSuPzXNGJyFo+qIyuhUCwDleN+L9gHxOoLMT5VEAY4Q3W
 4LgxwsT7S4EK7dyXyealhjzAc=
X-Received: by 2002:a05:6000:46dc:b0:48d:f5c6:1a0d with SMTP id
 ffacd0b85a97d-48e6e302309mr16119517f8f.15.1793635510208; 
 Mon, 02 Nov 2026 08:05:10 -0800 (PST)
Received: from KORLIN40066.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-48e71b9eaeesm20789169f8f.49.2026.11.02.08.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 08:05:09 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: fontaine.fabrice@gmail.com, thomas.petazzoni@bootlin.com,
 thomas@devoogdt.com
Date: Mon,  2 Nov 2026 17:05:04 +0100
Message-ID: <20261102160505.1754919-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102160505.1754919-1-thomas.devoogdt@barco.com>
References: <audrTUDPjZfZpyNG@windsurf>
 <20261102160505.1754919-1-thomas.devoogdt@barco.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libgtk4: bump to version 4.24.1
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Devoogdt <thomas@devoogdt.com>

Changelog: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.24.1/NEWS

Highlights of the changes since 4.21.0:
 - librsvg is no longer a dependency, as GTK can now render SVG
   images natively; this also drops the rustc host requirement
 - New GtkSvgWidget for displaying (interactive) SVG, used for all
   SVG icons and GtkSpinner
 - Wayland: support for text protocol v3.2 and
   xdg-session-management-v1
 - GSK: 10bit image formats support, rewritten cache allocator,
   clip masks to reduce the number of offscreens
 - Session saving support is back

Drop librsvg from the dependencies, together with the host rustc
architecture requirement that came with it.

Also add a patch to fix the build on uclibc toolchains, which lack
fenv.h.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: split in two commits, see https://lore.kernel.org/buildroot/audrTUDPjZfZpyNG@windsurf/
---
 ...fix-compilation-if-fenv.h-is-missing.patch | 119 ++++++++++++++++++
 package/libgtk4/Config.in                     |   3 -
 package/libgtk4/libgtk4.hash                  |   4 +-
 package/libgtk4/libgtk4.mk                    |   5 +-
 4 files changed, 123 insertions(+), 8 deletions(-)
 create mode 100644 package/libgtk4/0001-meson-fix-compilation-if-fenv.h-is-missing.patch

diff --git a/package/libgtk4/0001-meson-fix-compilation-if-fenv.h-is-missing.patch b/package/libgtk4/0001-meson-fix-compilation-if-fenv.h-is-missing.patch
new file mode 100644
index 0000000000..475453a6bd
--- /dev/null
+++ b/package/libgtk4/0001-meson-fix-compilation-if-fenv.h-is-missing.patch
@@ -0,0 +1,119 @@
+From e0f3bec0fdf037dffb0bd6570c00a6de37c1fef3 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Fri, 15 Nov 2024 08:22:23 +0100
+Subject: [PATCH] meson: fix compilation if fenv.h is missing
+
+../gtk/gtkcssnumbervalue.c:29:10: fatal error: fenv.h: No such file or directory
+   29 | #include <fenv.h>
+      |
+
+Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7925
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ gtk/gtkcssnumbervalue.c | 59 ++++++++++++++++++++++++++++++++---------
+ meson.build             |  1 +
+ 2 files changed, 48 insertions(+), 12 deletions(-)
+
+diff --git a/gtk/gtkcssnumbervalue.c b/gtk/gtkcssnumbervalue.c
+index 1181c1a802..03cf30262a 100644
+--- a/gtk/gtkcssnumbervalue.c
++++ b/gtk/gtkcssnumbervalue.c
+@@ -26,7 +26,9 @@
+ #include "gtkcssstyleprivate.h"
+ #include "gtkprivate.h"
+ 
++#ifdef HAVE_FENV_H
+ #include <fenv.h>
++#endif
+ 
+ #define RAD_TO_DEG(x) ((x) * 180.0 / G_PI)
+ #define DEG_TO_RAD(x) ((x) * G_PI / 180.0)
+@@ -1846,13 +1848,25 @@ gtk_css_dimension_value_is_zero (const GtkCssValue *value)
+   return value->dimension.value == 0;
+ }
+ 
+-static double
+-_round (guint mode, double a, double b)
++#ifdef HAVE_FENV_H
++static inline double
++_round_fenv (int mode, double a, double b)
+ {
+-  int old_mode;
+-  int modes[] = { FE_TONEAREST, FE_UPWARD, FE_DOWNWARD, FE_TOWARDZERO };
+   double result;
++  int old_mode;
+ 
++  old_mode = fegetround ();
++  fesetround (mode);
++  result = nearbyint (a/b) * b;
++  fesetround (old_mode);
++
++  return result;
++}
++#endif
++
++static double
++_round (guint mode, double a, double b)
++{
+   if (b == 0)
+     return NAN;
+ 
+@@ -1880,14 +1894,35 @@ _round (guint mode, double a, double b)
+         }
+     }
+ 
+-  old_mode = fegetround ();
+-  fesetround (modes[mode]);
+-
+-  result = nearbyint (a/b) * b;
+-
+-  fesetround (old_mode);
+-
+-  return result;
++  switch (mode)
++    {
++    case ROUND_NEAREST:
++#ifdef FE_TONEAREST
++      return _round_fenv (FE_TONEAREST, a, b);
++#else
++      return round (a/b) * b;
++#endif
++    case ROUND_UP:
++#ifdef FE_UPWARD
++      return _round_fenv (FE_UPWARD, a, b);
++#else
++      return (((a/b) >= 0) ? ceil (a/b) : floor (a/b)) * b;
++#endif
++    case ROUND_DOWN:
++#ifdef FE_DOWNWARD
++      return _round_fenv (FE_DOWNWARD, a, b);
++#else
++      return (((a/b) >= 0) ? floor (a/b) : ceil (a/b)) * b;
++#endif
++    case ROUND_TO_ZERO:
++#ifdef FE_TOWARDZERO
++      return _round_fenv (FE_TOWARDZERO, a, b);
++#else
++      return (((a/b) >= 0) ? floor (a/b) : ceil (a/b)) * b;
++#endif
++    default:
++      g_assert_not_reached ();
++    }
+ }
+ 
+ static double
+diff --git a/meson.build b/meson.build
+index f8a6d35e3c..ca8e63b93d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -198,6 +198,7 @@ cdata.set_quoted('SYMBOL_VISIBILITY', get_option('symbol-visibility'))
+ 
+ check_headers = [
+   'dev/evdev/input.h',
++  'fenv.h',
+   'ftw.h',
+   'linux/input.h',
+   'sys/mman.h',
+-- 
+2.43.0
+
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 13494fb692..e06df5b487 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,5 +1,4 @@
 comment "libgtk4 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
@@ -14,7 +13,6 @@ comment "libgtk4 needs an OpenGL(ES) EGL backend"
 
 config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene, libepoxy
 	depends on BR2_USE_MMU # glib2
@@ -36,7 +34,6 @@ config BR2_PACKAGE_LIBGTK4
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_TIFF
 	# At least one backend is required
diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
index dff32c57b4..ffa90911e5 100644
--- a/package/libgtk4/libgtk4.hash
+++ b/package/libgtk4/libgtk4.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk/4.21/gtk-4.21.0.sha256sum
-sha256  f52475c5041dfd02cc4eed22ee94f12ec310c16a68fda9203dc54ffd5daa6e6f  gtk-4.21.0.tar.xz
+# From https://download.gnome.org/sources/gtk/4.24/gtk-4.24.1.sha256sum
+sha256  e98abe720e16129c8c0f50761dee0a2e9ae2478055e31018f6cf977fcf6513e9  gtk-4.24.1.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 395e850de0..001cfc00ef 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK4_VERSION_MAJOR = 4.21
-LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).0
+LIBGTK4_VERSION_MAJOR = 4.24
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).1
 LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
 LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
 LIBGTK4_LICENSE = LGPL-2.0+
@@ -27,7 +27,6 @@ LIBGTK4_DEPENDENCIES = \
 	libfribidi \
 	libglib2 \
 	libpng \
-	librsvg \
 	pango \
 	tiff \
 	$(TARGET_NLS_DEPENDENCIES)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
