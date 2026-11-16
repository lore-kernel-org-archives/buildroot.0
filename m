Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53BF606A886
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r0KiOAgk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcFCuDaT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7463560794;
	Mon, 16 Nov 2026 14:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6Mrun6FV8mq; Mon, 16 Nov 2026 14:15:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BBCE607B5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794838543;
	b=r86iVLQp6Y1BWfsaoMDZxkeOGrqkUqfKwgHiLxtL6naE3EX7IfsinJDil0quPCQ99aXG
	 bR7dME8wUiPNQ1iBgfe7kIB6wGc9G6ErUftPUBZEg+rckuj0CbhU5vlq95BbCnGyBcObB
	 nmtex/T9x3t66MmipEOOkHVl0dCHM2O4Jq5gPaUP1os8DbjonEmJEZhBOQ5gNq1k0KJIk
	 buEXe/eTBQyJAOdN4YFPlpupvL2QEJWMemaqUn7o6HbGZuXBjnS1tqgOF4PsprWJw6KfY
	 QqIhZcxOI7lckqPSYaBtQ2ZoW5fFK03dOh57nnJjxCH+47sHiAq3fZzabZcjTp394Ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794838543;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=z41lV/FGXOjWQNYgTHup/m/HB7JfmQvMdf9OSv+OWRk=;
	b=lZ9VoeJhyZDV5PP3eCn0zWRtlG79br169U9csBjVop4c3/iJsy+UUR3wzhmmHbIbGyXR
	 NWxfKPvDfD04ABwoSqBDeg5//1UfhGlnCFjztilpP73AgSRZZCM4kr+KivntfGG3x73jU
	 suHPyAIyHZtF3eb1l01Qd97pUoo7zTg1U3J8DE9JnpG0Cs/IbRyYKevgypNx2//evbe1d
	 5yCIYBflEPMgjTC35GruBug2g9jXariHXD188WprGanRYPz3PrDFuOZaYVxJ59TIlh5RZ
	 RQ0VAGa3uUFzRcTn2864Rd/f2pCOaFhfNtf2jZZdAY38y/IdYOmqTPaiGRQWjudlb0A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794838543;
	bh=z41lV/FGXOjWQNYgTHup/m/HB7JfmQvMdf9OSv+OWRk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r0KiOAgkbJ1I314Z1zkblT8DrpHAN3pvwOnca+SNbl5HXCPJX058nmKIQOqN/CCE3
	 aGCM3ZbSXK/uw9HtkoMVsXvmm4jk/38y3r2glJSDvI/SQUeko8z1aXVU9Dm85d8OMX
	 ZRts7gARPQQqB1Q3odjhGnX7kfp/8kRwSgqp6rjZal1zuPLeQiPoUOx8s53bkDLQ3s
	 Xr+IZ7x+OCGP7KV9bAfYqaOcxs2UzkzEgw/AWH2mswc1EY12ub3RQHNdFqwoSDpvGW
	 czcE/pdH9+H+h2nuBTk8gUXVVex0KoDORJqBOKwu69lWBkqQxdpmr8fY4hS4/HmCai
	 gY24MF1/Q3N9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BBCE607B5;
	Mon, 16 Nov 2026 14:15:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9C1528C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB70F4068F
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DY9lAzREtcGH for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:15:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80DA040685
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::130"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=gle8098mail@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=rcFCuDaT
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80DA040685
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:15:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5c10dc41270so3691698e87.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 06:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794838538; x=1795443338; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vMNugxPW/LULzdbWrsBsj5p0JWH1bzUQRwsKLjcRYRQ=;
 b=rcFCuDaT246OAp+oFnhavFVmU4NC25WLIgEJZY/6iVXE5TGxF/KiBSaWGthIdJLEa2
 nXMwti8aUfN4IKsiPwc02bx4EEknwKVmoKn7Fx6qHxuZrdqLp/KRLf3XCCisIrAG+vqa
 UJlHgegT6UARN2HADfLGO8fXVznhvORSvrQak7PxN/ZFQxfvqf0bMTJm9P0demdiaAhF
 JXrAhgRVwt+9dThJDTigwtPVAZAg44KOH5nqFzbSRiuiA4GFuT9blj/g4MG2ocIuppeN
 mQkySlfAGVJiLIKE4GUhanl4z+oWpzN8RT1MrE1A0ZJqHEehL9Ix7MYmkxWuxgPYzTbO
 HIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794838538; x=1795443338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vMNugxPW/LULzdbWrsBsj5p0JWH1bzUQRwsKLjcRYRQ=;
 b=vTlQrXLpfjMbJHZkugmMkwV69ihhNKCj1wD81meBoGdr114kHSufED0IfbcEyHHM03
 +giz9A9pRnJjShBq4FA8pV6/nyG+KVZjSEUa1k1qnaZZS1DmvzZd1UPAx9qlAS4l12tA
 6mqQaB19BQ91LeBgRL2gipuhLbuNqDx2i1/W9jkAk4d+KPx9Yr+UmuopCLavydikoqdP
 csf+kJ3GFAlLduqr3gV4SStrujbi4dALPPLR3SxhBKD/2PTq8IIeHVjC5FrIxIV0ApQb
 +5vxvIxTElqZBC6ug7NyT+1CydTVct7dWouCGwNz+7p9QOyJqlXHpESkOAb4bES5L2X3
 K1og==
X-Gm-Message-State: APuU4Z/GbvJnFV5JjE0AnAcsuYt9MkmnhEeaph7oY6Ww1fTMu98q9aH/
 tYNDMmHqb5kPYe7UVrgVYNd7/fsY+LVL/P0LpNR9A+8XmZVRojD7RkzCllchEsNvz1KzuA==
X-Gm-Gg: AYBFou0UDIvaY39GFwj0ru27W/oxZn9KIcLXvYZuZI2O5aEHg3mFa8IVoZ0/SeS2SVH
 1rSIML59qncywCRQuClDQevPta+UUGvvDcdPNt+UY7hbZUfdRxgYibhnc8gpdOFhQBofrerQMiR
 5RNvjMaax5i7Ka3MBLzxYZ/W8xwvcX84SzUnjxtxfXJKWSDSTnW74fyriE4vHKQl6usIyQkOAdm
 SiP6j6vWnosBzmPym8KxpcqV6wAKuRxcfX/aUNniUITIljkeLnO+nR6kT7S4WDXbzo0o59kA8cj
 +OxbBdhuxflHKAV0cjuylS/7UEv09NzQuv6RjwB2D/YJOUkT+WcRXBiH2eJTv06UKPYFklPxd1s
 2fqok9RPac0L0KoogT3sddjDI//iUfJB3WAPZ3QMLvQDL9HtwLk76mlv23wjGj0qbd8ndi5aWGd
 xWwhGPtU/6Dr2WirF+6gNvWRYYP3nYS1fQLvuHTqYCAVHMlcMhpN3F6TzxKudNte7Gy6hNly8XL
 fEo4pbG/rz9nQA8rNzTNCK8hEzXhqoDhhmovY1zVKrp0MgITonApRgYb0H7q7J75j6Ni0+DDUZZ
 +9CCnQXkrY3UealHWSbgF7wLk5u51vYIH5L1kJtjbGNrJ1rXcGgnUFItqYtzXBvC17K83lcpzDE
 FfIO00dSlBzzdJg==
X-Received: by 2002:a05:6512:2525:b0:5c1:57ba:cf96 with SMTP id
 2adb3069b0e04-5c17074640bmr3796434e87.9.1794838537935; 
 Mon, 16 Nov 2026 06:15:37 -0800 (PST)
Received: from LAPTOP-HO8DJ34O.sberdevices.ru ([149.126.100.146])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5c17134808fsm3309181e87.53.2026.11.16.06.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 06:15:37 -0800 (PST)
From: Gleb Stepanov <gle8098mail@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gleb Stepanov <gle8098mail@gmail.com>
Date: Mon, 16 Nov 2026 17:15:23 +0300
Message-ID: <20261116141523.64979-1-gle8098mail@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jemalloc: add option to enable heap
 profiling
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jemalloc's heap profiling is disabled by default and must be enabled
at build time with --enable-prof. This patch adds
BR2_PACKAGE_JEMALLOC_PROF enabling the feature.

To collect allocation backtraces, jemalloc 5.3 picks the first
available backend in the following order:
1. libunwind unw_backtrace() (disabled by default)
2. libgcc _Unwind_Backtrace() (enabled by default)
3. gcc intrinsics walking frame pointers (enabled by default)

libunwind has to be requested explicitly with --enable-prof-libunwind.
It is typically faster than _Unwind_Backtrace(), which is designed for
rare C++ exception unwinding, while libunwind caches unwind
information. Add BR2_PACKAGE_JEMALLOC_PROF_LIBUNWIND to use it, which
is available when libunwind is enabled and defaults to y.

Signed-off-by: Gleb Stepanov <gle8098mail@gmail.com>
---
 package/jemalloc/Config.in   | 18 ++++++++++++++++++
 package/jemalloc/jemalloc.mk | 12 ++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index ace3dccd1e..217ebbbad0 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -24,6 +24,24 @@ config BR2_PACKAGE_JEMALLOC
 
 	  http://jemalloc.net/
 
+if BR2_PACKAGE_JEMALLOC
+
+config BR2_PACKAGE_JEMALLOC_PROF
+	bool "enable heap profiling"
+	help
+	  Enable allocation profiling support (--enable-prof).
+
+config BR2_PACKAGE_JEMALLOC_PROF_LIBUNWIND
+	bool "use libunwind for backtracing"
+	default y
+	depends on BR2_PACKAGE_JEMALLOC_PROF
+	depends on BR2_PACKAGE_LIBUNWIND
+	help
+	  Make libunwind the preferred method for collecting
+	  allocation backtraces.
+
+endif
+
 comment "jemalloc needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 8ac661b9d5..bc77380524 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -24,5 +24,17 @@ endif
 
 JEMALLOC_CONF_ENV += CFLAGS="$(JEMALLOC_CFLAGS)"
 
+ifeq ($(BR2_PACKAGE_JEMALLOC_PROF),y)
+JEMALLOC_CONF_OPTS += --enable-prof
+ifeq ($(BR2_PACKAGE_JEMALLOC_PROF_LIBUNWIND),y)
+JEMALLOC_CONF_OPTS += --enable-prof-libunwind
+JEMALLOC_DEPENDENCIES += libunwind
+else
+JEMALLOC_CONF_OPTS += --disable-prof-libunwind
+endif
+else
+JEMALLOC_CONF_OPTS += --disable-prof
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
