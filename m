Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3D2C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 14:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9E0161ACE;
	Fri, 17 Mar 2023 14:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E0161ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0LxUCEOPgG3; Fri, 17 Mar 2023 14:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D4361AC4;
	Fri, 17 Mar 2023 14:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03D4361AC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73A871BF2BE
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 14:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A68940993
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 14:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A68940993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Es04rMEoFb4q for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 14:50:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27219409F3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27219409F3
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 14:50:07 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id ay8so3522067wmb.1
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 07:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679064606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hfYIQjSYMxangAZRXL8r38h1DjJd82j2ZfN5GYnNpGQ=;
 b=JCqHId5LRHMzefbwhvooP7Qc2EVaAiJAWPWPILgBJsCDjuPjXglEbrhFkXqVwoCO0r
 ZndMj+FVUDAVo8oo3YmVHoePPnRJJOTFaev4tM7Ys8w2tRxKYH4T4zrNMh+YFildN9Ge
 r+MqMFLn2l6WKmhx88lC7WYVznnZQiKPfcwRUa28UCMWVXRzBnUojc9aYgi0cdix8hBL
 MjqGOOlC9NW4VxiPN+ZvaorhH3e3YNHVHsASKzAgpfnGD8rIXJvrczLL/mQF63SaQCVi
 xFlxfwaoHmVnrfbBr/IGYvcloHdxF1jbO8myGlAUbtGsuRvIAkBCB1oZvMrm69lVZdir
 Waog==
X-Gm-Message-State: AO0yUKXZOU7qAhvaJsdumjansIK1zCAHHfFSfmKBOpiX5RWO0/0Jin3b
 u71OuyroglFcyX/OMp/XXRlOVOfYl8DCZ13j8q0=
X-Google-Smtp-Source: AK7set+zRToq7I6kTELl/VisuNThQGsNQvLntx11TdNWwvDFzxRkUcJ7k7+X8CvyrKhaAZe79mAN6g==
X-Received: by 2002:a7b:ca41:0:b0:3ea:f75d:4626 with SMTP id
 m1-20020a7bca41000000b003eaf75d4626mr24664072wml.38.1679064605700; 
 Fri, 17 Mar 2023 07:50:05 -0700 (PDT)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:536:f783:8f4c:a6f1])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b003ecc64edf7esm2193659wmi.39.2023.03.17.07.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 07:50:05 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 15:49:59 +0100
Message-Id: <20230317144959.1237604-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230317144959.1237604-1-sebastian.weyer@smile.fr>
References: <20230317144959.1237604-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679064606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hfYIQjSYMxangAZRXL8r38h1DjJd82j2ZfN5GYnNpGQ=;
 b=nmke8XCLm++IbXTQ6/xC24nusxV8bHh6hSqUID48av53cRsB4gQZE4eEm32oeBbewi
 RU1oompjGa0VJS0jdNnp9SYI36GsR2Ul/LKx6kIoNc4gmgsYmMptXfjRiDBaAXC8ICJt
 TcIzPC5lDvHucNE9Rie2XJD1Yy5RFGkQmEbheI7pfvEMmoj64CFEjpS/XeT8YODxphzh
 QVT55XIePWAn9qHcmSDMZ1oYFFCrNoJgjlBYDOY6ZPJH157IxSHUmZfVT0A0tneeC66J
 a7+lg8sPXrkkc26bCbv02WNKM6eO5PWmbBOpYsIJET/DCd0SxojiodVUFKKPkrgl3qCG
 OzsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=nmke8XCL
Subject: [Buildroot] [PATCH v2 2/2] package/uutils-coreutils: remove
 creation of autocompletions
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 ...emove-generation-of-auto-completions.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/uutils-coreutils/0002-GNUmakefile-remove-generation-of-auto-completions.patch

diff --git a/package/uutils-coreutils/0002-GNUmakefile-remove-generation-of-auto-completions.patch b/package/uutils-coreutils/0002-GNUmakefile-remove-generation-of-auto-completions.patch
new file mode 100644
index 0000000000..bf817e9a79
--- /dev/null
+++ b/package/uutils-coreutils/0002-GNUmakefile-remove-generation-of-auto-completions.patch
@@ -0,0 +1,44 @@
+From 4e5169a59f5c7e8dab407a5bb2587fea9c1a7b58 Mon Sep 17 00:00:00 2001
+From: Sebastian Weyer <sebastian.weyer@smile.fr>
+Date: Thu, 16 Mar 2023 15:58:25 +0100
+Subject: [PATCH] GNUmakefile: remove generation of auto-completions
+
+The install step of GNUmakefile by default includes the generation of
+autocompletions for bash, zsh and fish.
+
+There are 2 problems with this:
+
+1. In a buildroot context we don't always have bash, zsh or fish
+   installed and therefore we probably don't need these anyways
+
+2. These autocompletions are generated using the compiled binary. Therefore
+   if desired it should be generated on the target itself. Otherwise it might
+   not be executable on the host.
+
+Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
+---
+ GNUmakefile | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index faecf420b..1c44cb3c6 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -346,14 +346,6 @@ else
+ 		$(INSTALL) $(BUILDDIR)/$(prog) $(INSTALLDIR_BIN)/$(PROG_PREFIX)$(prog);)
+ 	$(if $(findstring test,$(INSTALLEES)), $(INSTALL) $(BUILDDIR)/test $(INSTALLDIR_BIN)/$(PROG_PREFIX)[)
+ endif
+-	mkdir -p $(DESTDIR)$(DATAROOTDIR)/zsh/site-functions
+-	mkdir -p $(DESTDIR)$(DATAROOTDIR)/bash-completion/completions
+-	mkdir -p $(DESTDIR)$(DATAROOTDIR)/fish/vendor_completions.d
+-	$(foreach prog, $(INSTALLEES), \
+-		$(BUILDDIR)/coreutils completion $(prog) zsh > $(DESTDIR)$(DATAROOTDIR)/zsh/site-functions/_$(PROG_PREFIX)$(prog); \
+-		$(BUILDDIR)/coreutils completion $(prog) bash > $(DESTDIR)$(DATAROOTDIR)/bash-completion/completions/$(PROG_PREFIX)$(prog); \
+-		$(BUILDDIR)/coreutils completion $(prog) fish > $(DESTDIR)$(DATAROOTDIR)/fish/vendor_completions.d/$(PROG_PREFIX)$(prog).fish; \
+-	)
+ 
+ uninstall:
+ ifeq (${MULTICALL}, y)
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
