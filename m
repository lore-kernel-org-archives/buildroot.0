Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2CFC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 19:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C1344004A;
	Tue, 23 Jul 2024 19:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ma703QQ8YF0P; Tue, 23 Jul 2024 19:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0FE340B2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0FE340B2B;
	Tue, 23 Jul 2024 19:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFFCF1BF289
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 19:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD83060622
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 19:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBT5wS6fIPDp for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 19:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 913476058C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 913476058C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 913476058C
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 19:33:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4266eda81c5so51770325e9.0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 12:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721763197; x=1722367997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tgyx2DNGsdP1C52hqZN5LLL/9uQf/pgtc9G74RTExLw=;
 b=EuoPBP3Txx+3uUAadN+EQYRC7FgjOfLDZwI2Y1t7pOvtoWYjk966by2HEW0NVLkUbP
 v0EJf7FeFjtr4XNCJhYl7VQW942ShLeZVIp+BB+Tf+BPrPW6tjQx2sqNjWeB1Y9XkdQu
 2KiRThYF9VxZuWLvJhXh9Y86I8BFoyjHH/ibUNlO3att/oU9INAjjOJ/kNR/CuhrqWbQ
 JZJgJ9v5w8ycJGgM2FV+UPJVOWeQvm/ez3JGtNrmMLJICYjEFnq3q6tWMpMbg/yTIYzl
 BbQu8cSv2FMVGmJ+gVi5PzH4wrJlGYoC/x9/PvNraTdDucmBfCCE2zVeNYQ6nsDY0DJs
 +s8Q==
X-Gm-Message-State: AOJu0YxMv1sgFqE2RYpMA7DZheduAdk0+y4KrDRECO5BApr10eTDGTKB
 xnC9H5FOmgCKpDJf7vd1IeW+EFksCYOPESyJf/NaMPcH2bCph3r38tU3Pw==
X-Google-Smtp-Source: AGHT+IH43jKZhX40G7gMANX85XJhdEjjU6hg3iwIT6Ff9YkNMLy++tbJLN4rb57yz/zXPQvMU2VYUQ==
X-Received: by 2002:a05:600c:a05:b0:424:aa35:9fb9 with SMTP id
 5b1f17b1804b1-427f7ab64c7mr4047135e9.2.1721763197203; 
 Tue, 23 Jul 2024 12:33:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868bb00sm12342920f8f.43.2024.07.23.12.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 12:33:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 21:33:14 +0200
Message-ID: <20240723193314.333631-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721763197; x=1722367997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tgyx2DNGsdP1C52hqZN5LLL/9uQf/pgtc9G74RTExLw=;
 b=incfnvPGX+CJva2Xkn/LnLuLGCCg6YVNwgQbrFp9MgZuSRyum3wJqyzPTkIIWESu0b
 hXfRYkzXbrnVexv+2Dn4oAaf46mKTFOaIAgXTm2dMAvkVijQX8laTNeguOjum7gPi/JI
 mOBnNZmiEWNLoX9E6IR/GO2/ReP/QH7Fjssxkd4MTR5+wzUYnDA1EDqz81JDRzDE0F6y
 XIdzIPw0Sxbl/Rr2xSMxms5IJ6lZJ1NWLA+frcNkPky/LRX6R9cSuFL+5swMn3l5g4QU
 dRV3e0IuizxfPKMWPWgpT4i2HQmtc+hhTLTd6Xq0cU+oEgPro0bILJvWOPLYLCMLV41v
 hRCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=incfnvPG
Subject: [Buildroot] [PATCH 1/1] package/libdex: needs ucontext
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libdex needs ucontext since its addition in commit
70319b47f646f74f407ed3355baf5b581a10518a:

/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: src/libdex-1.a.p/dex-fiber.c.o: in function `dex_fiber_context_init':
/home/autobuild/autobuild/instance-11/output-1/build/libdex-0.6.1/build/../src/dex-fiber-context-private.h:131:(.text+0x30c): undefined reference to `getcontext'

[...]

In file included from ../src/dex-fiber-private.h:34,
                 from ../src/dex-scheduler.c:25:
../src/dex-fiber-context-private.h: In function '_dex_fiber_context_makecontext':
../src/dex-fiber-context-private.h:108:3: error: implicit declaration of function 'makecontext' [-Werror=implicit-function-declaration]
  108 |   makecontext (ucontext,
      |   ^~~~~~~~~~~

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/5f23b0e41f2957b0562c5d168f35e42f13bdad0b
 - http://autobuild.buildroot.org/results/67d958e9a8e1dfb147ac7be4fcb74fcafbbce987

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdex/Config.in | 10 ++++++++--
 package/libdex/libdex.mk |  5 +++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/libdex/Config.in b/package/libdex/Config.in
index f10bdac46f..38382dad78 100644
--- a/package/libdex/Config.in
+++ b/package/libdex/Config.in
@@ -3,6 +3,10 @@ config BR2_PACKAGE_LIBDEX
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2, gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBUCONTEXT if \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Dex provides Future-based programming for GLib-based
@@ -12,6 +16,8 @@ config BR2_PACKAGE_LIBDEX
 
 	  https://gitlab.gnome.org/GNOME/libdex
 
-comment "libdex needs a toolchain w/ wchar, threads"
+comment "libdex needs a toolchain w/ wchar, threads, ucontext"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
+			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 7c652a0409..360b389255 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -22,6 +22,11 @@ LIBDEX_CONF_OPTS = \
 	-Deventfd=enabled \
 	-Dintrospection=disabled
 
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+LIBDEX_DEPENDENCIES += libucontext
+LIBDEX_LDFLAGS += $(TARGET_LDFLAGS) -lucontext
+endif
+
 ifeq ($(BR2_PACKAGE_LIBURING),y)
 LIBDEX_CONF_OPTS += -Dliburing=enabled
 LIBDEX_DEPENDENCIES += liburing
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
