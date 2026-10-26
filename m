Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129D60A260B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 14:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 343C340660;
	Mon, 26 Oct 2026 14:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LF8EG9DDWklW; Mon, 26 Oct 2026 14:15:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4A44B405B5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793024130;
	b=cmxgUtgrejuOrf2d6cFPCPk53KyITUYvXnydKhpr/Tp6he4I8CjUDACmoKaCrhjQ6H6x
	 6XNLEpYO1/WXwYoK5skbl8PbkviTC83bgdu1DOVsK0K2e0Q/DxFGl4fxMM1h0hnNtjGmq
	 ULsHK/wATb5vk1nW0CQ06ec5KoSmlLlS5+S+rg4Jfx0fJtjA8PcxC26rjO1Vbq9BceGqA
	 AjrkcnbV7vglKaXkwYkrnGDhNO5kZpjvZblXAVABHvCGU++GjdB811SGcuOdmtUFeEPMz
	 JZbi9VYlWjgZk5SmCww4fUOxJZ73BRWqB8oLmmk7ueiY2+PCilkkJgaU2G+yeKTBzkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793024130;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qhvjLjoSrnWJfCBW4Y1N6SWo4A5kWdi93ToH0DQ+zi0=;
	b=CktMz8SFm3ibYiIZAKazqfcwdQjbXbwtQZrB5dfRH47U1fwZD/Ra0fnoiHxvXgBopO8E
	 cdPGEsufPIhvWGZfRVo7qk35XXiW1L+5/YRWGENzDZmrWDbF/uQrxnbjPmaLo6xTOkvZr
	 xCZcamIlLI0PpzdRduKO1RJjLIGiVwr+Zt7fOSVAeEuZzyR1lHAToeqyrOgSS+pqNklQT
	 OGMvA4ecYEcwrSCH0wrjeEUYTq+JO5kPMRfytYY63O92jHIjr9OtzqLU8I6yCpF4V0RLq
	 qmYIo130dx3gO6fBM33F47hBCdr32xkE0J2vx5qWrJtndrk/zLRaUAnyUebOfmizCLQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793024130;
	bh=qhvjLjoSrnWJfCBW4Y1N6SWo4A5kWdi93ToH0DQ+zi0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=a0o3roPl1iU70ckOsVn9Cln1sdLFV5LG/qblLxAadsH/c6REQZL3OwrTUsQ4RuiJ6
	 U3b18O8toUfxOtWqjXZ2HGuZloTS9vb0gxkLbCf+/K8HRqW9XG6RJAIAxLXPC5bfyQ
	 UAaPwfyL89CWWYydN83sIEadpOVQr+EKpst/V9sEb2oT7KLCbWczQXuocdTruBGfol
	 +pxWBeVxcwnTOSEmmF95k7Fxuh0CqTl7e59ws5PF53CTB09XnepHEZvYeHU9eY75q0
	 +PCwtcL27GYO5FCqYM46Hbx4Z+SCbS3vSHuLvjCSMS0CoapRQ81T3QA0M7LkYVG4wr
	 Oej9zHeKP3d2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A44B405B5;
	Mon, 26 Oct 2026 14:15:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24203279
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B62405B5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AR4dBPpGICuS for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 14:15:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E8FE9405AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793024126;
 b=DmMqHWT0wSEVZ89brqjEaI+kJ/Z+uqnAt9arlknYkl0dEdPrSoNQKc+g7uextNb6xAMB
 hiSOsNwGyvaBIw16SYIQ2HFOrzdjyHfy5ihtBfwEsVz4GjMRLavYgIthSg+LDHpavSMZ9
 k/hUPOp0RaVdHovj1GJayVkbDFm8bQ4MI6TA2YDp6F10wdQzUoWQTMs/TJIHvTMsUi5Vw
 TFUSCw6lD5jgxaeK0czVD1wAZaWw+T7jTVLOszwCt7zBG4ljIQaLqmE2YZLgLt81kPnOD
 NNfektymD8rxm7W5ygpkmMK66+olhIbx6D9lmgH4UZrvp9ysxcBlK526Fkcc4CKmCIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793024126;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XEUH7qTztsVvi6ola2P2OEoXQutJnBp9MNI5L10oteE=;
 b=GM5omyQPJFGaWokG5poeEwDiIx0faSV4qRK1Nar51mYD5FS/k9CzK1Do4Qk9gGoWvURu
 PPwWM8EK3BcEieEc7/3oNZqzlhzHQ6dhQ5gdYODbK0Ggi3BSeoYtQIfZCVyKZISWyZaYO
 +EdmyjAP+ZohoPZ+3XD2GHoc/FmhIEDelcIFaT6+dB1E7OzHLTWIWXFklJ7AFP0XJt5qs
 HGANW4M5fJP1IDFj4TOqG2zVGPPCIzPD9+JfGFkROuYlZY5+Fjl1GkDPxypEWsFB/4+q+
 NJAkCyxTRPF7BhzpLipoeMc4zYmZT3FyK3i1LYpB21JVLakW1a/hMzoPqIR0P1i32OA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=RqPC2SYz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8FE9405AE
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:15:25 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c4301e334ceso184097766b.1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 07:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793024123; x=1793628923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XEUH7qTztsVvi6ola2P2OEoXQutJnBp9MNI5L10oteE=;
 b=inNU1WXgVH1RCcYst4WEXzgDuVDHv1EWuQQqD3MbqdLtfQKh8zy9DUKnHgcvh44stg
 pDIPjouPcQFHF8WQH2hogT+SahO+b/nWk9zbVlSBVc1vnro8E7AzjvAzKEx6eANUFgQ6
 +6jn2aco5L4zZuaM6mh2PZGz+gmqdb1WhhtroY8ivZSr1ZGYj0tAmZt63SkX8MCYMVKA
 +BqVNuGv6HA+YRa3LQdhVyx24d7KivkEzXVXnpzpejTBPLJSTgoSWjK1B11msw5sLYjV
 eYOBZT6u2Lov3Wao1vSfRpkuLb+hDJ1hvBnQwCvYTTVY5Hkl0+GXLiJQfj1jB3aHrVPe
 ftRg==
X-Gm-Message-State: AFq9FYK90mQxoKS3VgxXp0c9im+9V362P4l28NQhw+fUVbSHbiPjZw8x
 kCJB5vxhM/gdJUnSy1fAy80H4B4qjWBYdl7jeGs4B2FyY9oNbOL9ktKip8FaJw==
X-Gm-Gg: AYBFou3RnPFMmyEoG8BCIpxoINCtpyogZpk5Y916skEpzgMwnz1xLyfEe4z/yrv3XZf
 kB3rGuvBIbXY85qK27yQ+XQliukgZE8PaaKcCDIJPdChk/UEJIF8/Z1utaDNKcnwaats1YLiMt5
 1eLpnLsIm26SHNho9caYjaDG8uX2j8Ru5BnbCHbWIQgtO48BC641ZoaWSf1hFxbFLxyGC6VfqJl
 WWzgad63KM3IGha51L4xiU9JUnK7qXv+Ti3Alc+jB2wH8do+UPkVhAzVg4L+quVrMObaBih25KT
 o7ZDOgd8OSO//1dEphivcrEKQhiCllydQlm41BjHm+xIWt6+uGaOUN7mGsP82AT4Nl5YxWGphFK
 lnxI17lsZMA7hQGXsRBynPHugGZSfo1Yr6oXnIDyvNIwnxRR3Ay8pr15+CnIEaWlnCZNEx9RY/N
 7liapoaHluKhpK6oKnh3oz8EjWJgC9iCkNmpyGxwX7KdsQpVoVygXzQpt7ihAKcnp9avZa877zY
 SdEDek8B4p2SAbfEIkqABjHNx+hOrvYe8/gZvEWoFOo6Yk+X/wlhYkZUV/rDMZBvQm0ox2aXGmc
 /iUxd9Yh/Ene2GszXdtiUmED1AZuiA5e0RJbdEXez/7ilCzccz4qLaKW
X-Received: by 2002:a17:906:c141:b0:c46:b3c3:cc4c with SMTP id
 a640c23a62f3a-c46bdaa8004mr896930466b.2.1793024123201; 
 Mon, 26 Oct 2026 07:15:23 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd4eabadsm329549566b.14.2026.10.26.07.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 07:15:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 15:15:21 +0100
Message-Id: <20261026141521.1906205-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dante: fix build on musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 1.4.4, dante's sched_setaffinity configure check defines
_GNU_SOURCE before including <sched.h>, but the actual build only uses
-D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE. On musl, cpu_set_t
is only declared with _GNU_SOURCE, so the check succeeds,
HAVE_SCHED_SETAFFINITY is set, and the build fails:

  ../include/sockd.h:1604:4: error: unknown type name 'cpu_set_t'

glibc declares cpu_set_t unconditionally, so it is not affected.

Add a patch that defines _GNU_SOURCE on Linux in compiler.m4, so the
build uses the same feature set as the configure check. This also
keeps CPU affinity support enabled on musl.

This issue has been present since commit 7d95c34d6450 ("package/dante:
security bump version to 1.4.4"), which brought in the modified
configure check. It therefore affects 2025.11 and later, and 2025.02.x
since 2025.02.8.

Fixes:
https://autobuild.buildroot.org/results/0706b54c06cea6269d584bde2abeb8ee030e476e

Fixes: 7d95c34d64505214d56e452abc1f3502323266af ("package/dante: security bump version to 1.4.4")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
This supersedes "package/dante: fix musl compatibility issues"
(https://patchwork.buildroot.org/project/buildroot/patch/20260413181614.371652-1-chakrabortyshubham66@gmail.com/),
which fixes the same cpu_set_t error by defining _GNU_SOURCE in
common.h. This version fixes it where the flags are set, in compiler.m4,
so the build matches the configure check, has been sent upstream, and
leaves out the unrelated egrep and pselect changes.

 ...piler.m4-define-_GNU_SOURCE-on-Linux.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch

diff --git a/package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch b/package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch
new file mode 100644
index 0000000000..c2ce03422d
--- /dev/null
+++ b/package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 26 Oct 2026 14:58:11 +0100
+Subject: [PATCH] compiler.m4: define _GNU_SOURCE on Linux
+
+Since 1.4.4, the sched_setaffinity check defines _GNU_SOURCE before
+including <sched.h>, but the actual build does not. On musl,
+cpu_set_t is only declared with _GNU_SOURCE, so the check succeeds,
+HAVE_SCHED_SETAFFINITY is set, and the build fails:
+
+  ../include/sockd.h:1604:4: error: unknown type name 'cpu_set_t'
+
+Define _GNU_SOURCE on Linux, so the build uses the same feature set
+as the check.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: sent to dante-bugs@inet.no on 2026-10-26 (no public archive),
+  Message-Id: <20261026141309.1892005-1-yegorslists@googlemail.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ compiler.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/compiler.m4 b/compiler.m4
+index afd1939..3546f87 100644
+--- a/compiler.m4
++++ b/compiler.m4
+@@ -28,6 +28,8 @@ case $host in
+     *-*-linux-*)
+ 	CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-D_XOPEN_SOURCE=600 -D_XOPEN_SOURCE_EXTENDED"
+ 	CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-D_BSD_SOURCE -D_DEFAULT_SOURCE"
++	#for cpu_set_t on musl, matching the sched_setaffinity check
++	CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-D_GNU_SOURCE"
+ 	;;
+ 
+     *-*-aix*)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
