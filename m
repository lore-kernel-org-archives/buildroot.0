Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D16C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 16:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B1AF823E3;
	Tue, 10 May 2022 16:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gR9T_6O4fRX5; Tue, 10 May 2022 16:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47FA981DA3;
	Tue, 10 May 2022 16:33:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1585B1BF3A3
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12A3D81DA3
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFgNtbwrOWnR for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 16:33:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E508819FC
 for <buildroot@buildroot.org>; Tue, 10 May 2022 16:33:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d5so24593235wrb.6
 for <buildroot@buildroot.org>; Tue, 10 May 2022 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gI4KI/bly+jmi93cd9zLGOTyhGdwhkp4NnQm5IwJ82M=;
 b=e3RGB2Dymt1TGQdLvgUuJ0w/6hIlR1oFY4bLuzlGEbZJRED91eCuZWpLoT4d5r2aO5
 vPwxfBWEtZV2hVcG5tPaNUELuvSJNXfNwPSiVTQTaW2Hs1wPhb0ewNYl60wsISBO+GLO
 C3XJSZB7rXgfLAu4GbELsvhcq+HQ1Q0qnuY0Xv//Xa4fzL+bScZLIgc3j++jiyPZobJd
 JwyXGxyz21bQ6LeTCSTMP9i0WyIH2E1VGV5Qs4MXc8MVy74akvq5uKvM2M97+T1vuQ5t
 nmSO2gloXzB6om6hAe1yPeqV06JNvfV1F97gOHRBD/aS9DUsmfogbrAFt6ivN4rdyfU3
 nezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gI4KI/bly+jmi93cd9zLGOTyhGdwhkp4NnQm5IwJ82M=;
 b=pgmVwr/+gLwyXF9o2fN6Jq8AO1PEn6dQY3bjAgFNkz4DXDNeCdHL8PoGCQDemGmKe/
 /49BYGwH9MFhZ6Q3LSmHAeYJs5N8UBX4nQ3tWr8XOQR4e6GLMQC7EMmKt3TrGCKhLy/g
 69WPAq6ih2FhmnNLZerAieZax+WYRQxEiHRbog7ikmAGuYhoz0u+YnmZ8NXMJIlH1Ca4
 sfxfVi+ih8FcsqZD8HEz2BdUfgObHx5diHDBODi/7JHjrYVioxfKrKwAra1jCqqymv4o
 r0jv63gILYbxuTyl915VZ2Qgd3p+0bwu+P+wkdYJgtCF6AxIHlEAQCGs4NRyrlr2aa7h
 QxMA==
X-Gm-Message-State: AOAM530o1cgL6NTK4ovlnBv+97KeXJ9nOK7ewASBMEQMc2uDeGGCvEZf
 zwOa9EZ6qgSPXuUdzqL1p5GMycgTyBQ=
X-Google-Smtp-Source: ABdhPJznhmUwCZ6dFzTfHMzbKd6fXWywD1gfU4JZLEnZua8cPQoOkoJLEJLM885WOOXMk+NzZZHw/Q==
X-Received: by 2002:a5d:440d:0:b0:20c:4d68:7fb1 with SMTP id
 z13-20020a5d440d000000b0020c4d687fb1mr18641226wrq.7.1652200380216; 
 Tue, 10 May 2022 09:33:00 -0700 (PDT)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b003942a244f53sm3260126wms.44.2022.05.10.09.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:32:59 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 18:32:48 +0200
Message-Id: <20220510163249.21272-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220510163249.21272-1-petr.vorel@gmail.com>
References: <20220510163249.21272-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/musl: bump version to 1.2.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/musl/musl.hash | 4 ++--
 package/musl/musl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 4ab18cebd8..e093a5358e 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# https://musl.libc.org/releases/musl-1.2.2.tar.gz.asc
-sha256  9b969322012d796dc23dda27a35866034fa67d8fb67e0e2c45c913c3d43219dd  musl-1.2.2.tar.gz
+# https://musl.libc.org/releases/musl-1.2.3.tar.gz.asc
+sha256  7d5b0b6062521e4627e099e4c9dc8248d32a30285e959b7eecaa780cf8cfd4a4  musl-1.2.3.tar.gz
 sha256  f9bc4423732350eb0b3f7ed7e91d530298476f8fec0c6c427a1c04ade22655af  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index b89945e3be..44c79da6f7 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.2.2
+MUSL_VERSION = 1.2.3
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
