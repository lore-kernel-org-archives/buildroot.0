Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4E606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PBqheHu9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7289980F72;
	Thu, 29 Oct 2026 21:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGe42MAXi-Is; Thu, 29 Oct 2026 21:35:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 14A6880DAB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793309745;
	b=IBYS3X5EChmdUy4y39idMGlMPNkFzzdwnNeMtETWagtW/YfX4wibcl8PwmoCKFL3cyOg
	 3ZME2NIGUXTdbEKGuhlytjMoXAJDXQulG3kiqd+RyXwyre97vgJKklrsOev/C9seAsDye
	 tdhvtiD3RQu0VU4/bwJ7RsE40KbTM25Ze41a7rKQgDroT8imkRkFHAry5AoGf+ZONDlRo
	 xgTfC9o3khPZ4OzSVfM84F9ZvPmvrEnmEtwGgyI/tQQQPyyzpHNnOJXI4HpDWecsEi4gm
	 VI5rcrvOza9Hp8BA1KDSlLHIuNViwolmBD3yOIa1+kHqeNEqg0VsLchCLg0+FaQd+CQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793309745;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p6km4zRDhLEf1DVwQsi09CVweBHvB1jAbE7MzRrHAfc=;
	b=XX9s5PjEC92JCixZyAkow/u0AHF0z2OLcuRyxTPori9d1VjjpGC9IihoEY8+MoUQ0yBs
	 PqvApss+hzWAI5C9Ykp+82IVfGTkudYdKLnA7XjKQ6BrpUFktqlCn+E74T1l+iJZ0jXlC
	 8IvRLGqiA3yR8T2/pTvJ+VUy3uAf3CnamIhz3DhfOxqSJJLvMqyrWHuGdr5DVXcInjtUM
	 V4OgLTvb80Lywv4ZcWnd8G0YoVP3zfUMJml4atbd0zEQQWKEY8opGrIijOGXws4r1aFYN
	 LnsSuaT9iGSUNPs3uO7yBt8k/KbNrecuj2CUJGtG8vH7kSNKZuLMvDMnj5oYq4b7fuA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793309745;
	bh=p6km4zRDhLEf1DVwQsi09CVweBHvB1jAbE7MzRrHAfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=PBqheHu9jlDg83N3Yg1o3DfnXyvopahKk+7QnA6dUkY5uC4Q21xtw85oZ+Iq5QuAe
	 6k8c8K2TyjaU9ehAkesCkxWM6lGiwhVQGB36e/l/xjBzkRO5Cmj2TM5yxRs/xTs5HF
	 uYWj9Y3mXgFZ6vKUISLm6J+FLPsT8Y+At8iR9X3Kvr8yINZeBW8iuJiFdIodmiBgIK
	 SSiFWldI8sWzmMwXT3I1VwIAqVLkEfRZ8KecHmT8eow4Burk/hpL9YFJxEW/zoaSnb
	 D4kNvIV5u2sFvYEC3xO/NBWCMh4BYeqPuEA49k/2tI5SRPUnqlrt6WLoIcWLTOn3yi
	 8L9lLj3Gl0pog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A6880DAB;
	Thu, 29 Oct 2026 21:35:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 354D41DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2768480DAB
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Glh5eR0wxdC for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:35:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A54E680D1C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793309742;
 b=m45UxcydaGhKMfZA4S1XfaU0nc4jaD3+SnmacKLFk67G3BZBf14rd31Aj84ZXlC3RD1n
 n60/8RV4zMyVj9jMPB0Acj3U3CdQy5nkvfcAeo6XX/sxRXXExYkLaX6R/Nt8wriCvyT5G
 zZIG69NkH0W/99r9CvHnxCuNRDvVUPFt/rGAjr+XfOE5n3b0daHxY8StfLX0aQuvF5lA8
 YounpBs7h7p/zHXYc6d+NyNzlUi2nr7NaXNAC5L0M/tfM/tRLE2hnY3yXfw90Ztk9jgli
 iaohnTUvEfdegGgHqZkigl6ZTrasg203ZFeCQOSmWY888Q+ogOmyKJ975Y2YAc86b4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793309742;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=v41WA/CjlfW2h6tV4FjXqjRvstyW01bGMfipj8Qdark=;
 b=qq8Uwr9v8RoFzXTY+nDOU0RjRfbnqijts0r29uwnh2+jjI1fDxg1i5asqtF9iXdS++El
 t5RlbJT0tMSzxM4k+qeRcwb13aFLtpKi/gpLDAL+h1ju4VzmM7BJMsH+P7mHu3WczbiZn
 SzaTmza3IvIoIjnwuHqi9qPRGlOuURb0dm9DewFfjPG0t43zD2VbRiwQurLOiUIwo+hEx
 WYoVQW01LlTBKgF9k/p3b3S84jq0WpPmc/sb7B+JBhL1fNus/iga3LdNAGH8srazndpma
 LeZxXyoECRcoGmSwwp/D6rl7Ugpor5yZlcWmOKGOHkBz1b9AduC+Eg+TIcZMxIgnCJw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=ffNFnSo8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A54E680D1C
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:35:41 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c498fa2f365so349931066b.3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793309739; x=1793914539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v41WA/CjlfW2h6tV4FjXqjRvstyW01bGMfipj8Qdark=;
 b=DH2KJwIfZx4ZAJybQIrnEw7ZShbKx+07vKFQMs7rlyla6D8FGTM8Yt3qCHOmTD+njd
 pxJvBP/oo8Othy/5/3hTD74XOqwxGjviD0ekxN/V8h4iwvmH/RUoxZLma3ylpXrWF3R+
 FUL0Vxi68PEvAWkbwsb50F9zhj/s4JJh05H94OZDCDoA/RLK4gszWeurRLpRm94Q9+Ur
 oHA/uuq1O/QQxJVQwgL3fbvZT0gXeYhSqfTG+egxL54L4Wod2xCNaDFHTgLBgbzSpJ+y
 mT6jRACR8XfhPrWf1ICgEAnHuHTz1XmsxU25PAVni7e14Cc87soCYsER40qg0tPMs+EY
 rcDA==
X-Gm-Message-State: AFq9FYJZ7OQJZLIf6moIlrgTw9Bpj2jV4YdASEIDK2VBxkfhSY5b+U/b
 5nwKsU7t23caNTG7rwpYIiyUDhkC3LlqeYQYU8r1riV0lcHs7YxzUrxC0eNPgg==
X-Gm-Gg: AYBFou3WUVywCp/kjWiuOZ8zhgr+FcXLXCx2iwBjMU94jvPvwWNtbCLK+hZnlfXI1m/
 LPCB6UtngcVtKTKDSl2nv0XaXVqTKk797CcYgYR70K5cqhAqUW933wgpuaSOZpa5uIHS0x5W70f
 XKChLj4go8F0SFIqYXPJoWfkblWdVAS1oXEh164/Rg8A1LV8Wb19LN/VRkrCX1zyuKHZAY+LvDy
 gJCSiLCzlFPe9o4GXYb4PYHW2ENzS0FQpeZ4+qkf1dBO1Quo0DX8aYu0UInL/anWN8YTHMepux8
 UFpJeL6/KVUyoTRxdidnN8kUgtDr2l3OeA1IUOIxq1uJIAZKnOocLa17ZjkH2DsrrxSX7ttoUFB
 Xiwxg1fc+3+kW9r4jD3qjVLgpIaTJa2Eys6tvE0RaaMX074zVCcW0xSMfx/24f135/KlfXPKf18
 0cygbkIDhO4RE0/xlPlaAgrSlPKGrrXGbq72ed9FkI36G9Jcu27olLJET4BaLshMmdAJ8kRRLGD
 mrWNH2GQaJEeLbqW0my4qwYrNcSHHPQXYIwlaWTOlQ7iFpLq1dyZlVTaQnTh3JX5ulY0pcCvuKQ
 EfpqUUc1HsRMKV1k/ajrsnaxs3naQHmumPgo6nGVXEfGhbQzf9+j2tBIczYIwfDC0f+x20i26z5
 m6MJFvFRu
X-Received: by 2002:a17:907:6d0f:b0:c26:1649:47ad with SMTP id
 a640c23a62f3a-c4ca7a9ef61mr31540266b.35.1793309739047; 
 Thu, 29 Oct 2026 14:35:39 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4caa377dbcsm1115466b.39.2026.10.29.14.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:35:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 22:35:38 +0100
Message-Id: <20261029213538.690273-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mraa: remove package
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
Cc: Pieterjan Camerlynck <pieterjanca@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mraa was mainly meant for the Intel Galileo and Edison boards, which
have been discontinued for years. It has not seen a release since 2.2.0
in 2020, and its listed developer no longer has access to such boards.

As discussed on the mailing list, remove it.

Link: https://lists.buildroot.org/pipermail/buildroot/2026-October/815154.html
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  8 ++++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 ...de-Declare-gVERSION-global-as-extern.patch | 30 ------------
 .../mraa/0002-mraa-Use-posix-basename.patch   | 45 ------------------
 .../0003-cmake-bump-minimum-version.patch     | 46 -------------------
 package/mraa/Config.in                        | 23 ----------
 package/mraa/mraa.hash                        |  3 --
 package/mraa/mraa.mk                          | 44 ------------------
 10 files changed, 8 insertions(+), 194 deletions(-)
 delete mode 100644 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
 delete mode 100644 package/mraa/0002-mraa-Use-posix-basename.patch
 delete mode 100644 package/mraa/0003-cmake-bump-minimum-version.patch
 delete mode 100644 package/mraa/Config.in
 delete mode 100644 package/mraa/mraa.hash
 delete mode 100644 package/mraa/mraa.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index a8c1baacbd..a5b8951f4c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -601,7 +601,6 @@ package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch l
 package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
-package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
 package/multipath-tools/S60multipathd Shellcheck
 package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 29c9b7f9e7..764411f806 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_MRAA
+	bool "mraa has been removed"
+	select BR2_LEGACY
+	help
+	  mraa has been removed, as the Intel Galileo/Edison boards it
+	  was mainly used for are long discontinued, and it has not
+	  seen a release since 2020.
+
 config BR2_PACKAGE_MESA3D_OPENCL
 	bool "Mesa3D OpenCL support is now provided by RustiCL"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b4ada4e1f9..72a57eb954 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2838,7 +2838,6 @@ F:	package/libvips/
 
 N:	Pieterjan Camerlynck <pieterjanca@gmail.com>
 F:	package/libdvbpsi/
-F:	package/mraa/
 F:	package/synergy/
 
 N:	Qais Yousef <qais.yousef@arm.com>
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..3c343de1db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1900,7 +1900,6 @@ menu "Hardware handling"
 	source "package/libusbgx/Config.in"
 	source "package/libv4l/Config.in"
 	source "package/libxkbcommon/Config.in"
-	source "package/mraa/Config.in"
 	source "package/mtdev/Config.in"
 	source "package/ne10/Config.in"
 	source "package/neardal/Config.in"
diff --git a/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch b/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
deleted file mode 100644
index 110c020a62..0000000000
--- a/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From aaa0a5cd4e401bde4fb3691dd4e6c70a5c61e031 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
-Date: Mon, 13 Apr 2020 20:12:11 +0200
-Subject: [PATCH] include: Declare gVERSION global as 'extern'.
-
-Fixes build with '-fno-common'.
-
-Signed-off-by: Thomas Ingleby <thomas.ingleby@intel.com>
-[Retrieved from:
-https://github.com/eclipse/mraa/commit/aaa0a5cd4e401bde4fb3691dd4e6c70a5c61e031]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/version.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/version.h b/include/version.h
-index 47366ef6f..3a567a1d5 100644
---- a/include/version.h
-+++ b/include/version.h
-@@ -11,8 +11,8 @@
- extern "C" {
- #endif
- 
--const char* gVERSION;
--const char* gVERSION_SHORT;
-+extern const char* gVERSION;
-+extern const char* gVERSION_SHORT;
- 
- #ifdef __cplusplus
- }
diff --git a/package/mraa/0002-mraa-Use-posix-basename.patch b/package/mraa/0002-mraa-Use-posix-basename.patch
deleted file mode 100644
index 3c5c99f031..0000000000
--- a/package/mraa/0002-mraa-Use-posix-basename.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 47c3850cddd63cebd9dc48e411963314449118f1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 31 Dec 2023 19:16:35 -0800
-Subject: [PATCH] mraa: Use posix basename
-
-Musl has removed the declaration from string.h [1] which exposes the
-problem especially with clang-17+ compiler where implicit function
-declaration is flagged as error. Use posix basename and make a copy of
-string to operate on to emulate GNU basename behaviour.
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream: https://github.com/eclipse/mraa/commit/47c3850cddd63cebd9dc48e411963314449118f1
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/mraa.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/mraa.c b/src/mraa.c
-index 653ea1fa7..b556d0455 100644
---- a/src/mraa.c
-+++ b/src/mraa.c
-@@ -12,6 +12,7 @@
- #endif
- 
- #include <dlfcn.h>
-+#include <libgen.h>
- #include <pwd.h>
- #include <sched.h>
- #include <stddef.h>
-@@ -341,9 +342,11 @@ static int
- mraa_count_iio_devices(const char* path, const struct stat* sb, int flag, struct FTW* ftwb)
- {
-     // we are only interested in files with specific names
--    if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
-+    char* tmp = strdup(path);
-+    if (fnmatch(IIO_DEVICE_WILDCARD, basename(tmp), 0) == 0) {
-         num_iio_devices++;
-     }
-+    free(tmp);
-     return 0;
- }
- 
diff --git a/package/mraa/0003-cmake-bump-minimum-version.patch b/package/mraa/0003-cmake-bump-minimum-version.patch
deleted file mode 100644
index 8cad2b7ba1..0000000000
--- a/package/mraa/0003-cmake-bump-minimum-version.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 92a1337e110464bbb3aaba2b3ede77dc13b3f175 Mon Sep 17 00:00:00 2001
-From: Alex T <alext.mkrs@gmail.com>
-Date: Sun, 2 Nov 2025 19:06:06 +0100
-Subject: [PATCH] cmake: bump minimum version to address a deprecation warning
-
-This fixes the following warning shown while configuring:
-
-  [cmake] CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
-  [cmake] Compatibility with CMake < 3.10 will be removed from a future version of
-  [cmake] CMake.
-
-We don't have a clearly defined supported distro/versions list, so I
-took Ubuntu 22.04 as arguably the oldest one we'd want to support for
-the reference point. It has CMake 3.22, released in July 2022.
-
-Signed-off-by: Alex T <alext.mkrs@gmail.com>
-
-Upstream: https://github.com/eclipse/mraa/commit/92a1337e110464bbb3aaba2b3ede77dc13b3f175
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 10 ++--------
- 1 file changed, 2 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7a13eeb81..34ded2b75 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,15 +1,9 @@
--cmake_minimum_required (VERSION 2.8.11)
-+cmake_minimum_required (VERSION 3.22)
- project (mraa C)
- 
- FIND_PACKAGE (Threads REQUIRED)
- 
--if (CMAKE_VERSION VERSION_LESS "3.1")
--  if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
--    set (CMAKE_C_FLAGS "-std=gnu99 ${CMAKE_C_FLAGS}")
--  endif ()
--else ()
--  set (CMAKE_C_STANDARD 99)
--endif ()
-+set (CMAKE_C_STANDARD 99)
- 
- option (BUILDCPP "Enable C++ (needed by FTDI4222 and tests)" ON)
- 
diff --git a/package/mraa/Config.in b/package/mraa/Config.in
deleted file mode 100644
index c845fe9f99..0000000000
--- a/package/mraa/Config.in
+++ /dev/null
@@ -1,23 +0,0 @@
-config BR2_PACKAGE_MRAA_ARCH_SUPPORTS
-	bool
-	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_arm || BR2_armeb
-	default y if BR2_i386 || BR2_x86_64
-	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-
-config BR2_PACKAGE_MRAA
-	bool "mraa"
-	depends on BR2_PACKAGE_MRAA_ARCH_SUPPORTS
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  mraa is a C/C++ library with bindings to javascript & python
-	  to interface with the IO on Galileo, Edison & other
-	  platforms, with a structured and sane API where port
-	  names/numbering matches the board that you are on.
-
-	  http://iotdk.intel.com/docs/master/mraa
-
-comment "mraa needs a toolchain w/ threads, dynamic library"
-	depends on BR2_PACKAGE_MRAA_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/mraa/mraa.hash b/package/mraa/mraa.hash
deleted file mode 100644
index 321b6409ed..0000000000
--- a/package/mraa/mraa.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  076669bee8423ffef3065735b293a329020be86630fea457174dbfcc67a0554a  mraa-2.2.0.tar.gz
-sha256  fac52622ed3badd86b34857b21777ab90296d6ccbc2ac0fd457c09fdeefa9ef1  COPYING
diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
deleted file mode 100644
index 47178a423b..0000000000
--- a/package/mraa/mraa.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-################################################################################
-#
-# mraa
-#
-################################################################################
-
-MRAA_VERSION = 2.2.0
-MRAA_SITE = $(call github,eclipse,mraa,v$(MRAA_VERSION))
-MRAA_LICENSE = MIT
-MRAA_LICENSE_FILES = COPYING
-MRAA_INSTALL_STAGING = YES
-
-ifeq ($(BR2_i386),y)
-MRAA_ARCH = i386
-else ifeq ($(BR2_x86_64),y)
-MRAA_ARCH = x86_64
-else ifeq ($(BR2_arm)$(BR2_armeb),y)
-MRAA_ARCH = arm
-else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
-MRAA_ARCH = aarch64
-else ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
-MRAA_ARCH = mips
-endif
-
-# USBPLAT only makes sense with FTDI4222, which requires the ftd2xx library,
-# which doesn't exist in buildroot
-# Disable C++ as it is used only by FTDI4222 and tests
-MRAA_CONF_OPTS += \
-	-DBUILDARCH=$(MRAA_ARCH) \
-	-DBUILDCPP=OFF \
-	-DBUILDSWIG=OFF \
-	-DUSBPLAT=OFF \
-	-DFTDI4222=OFF \
-	-DENABLEEXAMPLES=OFF \
-	-DBUILDTESTS=OFF
-
-ifeq ($(BR2_PACKAGE_JSON_C),y)
-MRAA_CONF_OPTS += -DJSONPLAT=ON
-MRAA_DEPENDENCIES += json-c
-else
-MRAA_CONF_OPTS += -DJSONPLAT=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
