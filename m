Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB88CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8273341689;
	Wed,  3 Apr 2024 08:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfsImQSfSZzG; Wed,  3 Apr 2024 08:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 781B34168E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 781B34168E;
	Wed,  3 Apr 2024 08:40:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93B341BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 806CF82023
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hmu2XnQHwyOA for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DBAC8201D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DBAC8201D
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DBAC8201D
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:40:29 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4e692ca8c4so400710366b.3
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133628; x=1712738428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MSO/wzUslcv62V4oVoaG6VLY9LrIp0Tt3yliqdxexUg=;
 b=AfNKn40YCZ+BAbOlo/O55eQnsvpIYcsaPzPo1+aTOspEcI5eAw7jRFrByO+aY1vNSn
 uYkN7sOigoKD14SEzp2MSqfK5zLiXEaD/bhX4srpnUIQrNpbWxDuZOjSxj+w7OpMQSn7
 2AShSqnCtgOHGeiIxmaxf9i52gsmTJxjj+mxu3HwWfhz9KtGaDlnmjVmFuwVH3tVAEB1
 ileowFXTrNlUf2gNQAgkI7KLkNYA2XY6KRPoNRb6xfi1LvmpF44NANFp8f/FY5kuYSuX
 yVL56UJ6qbwJsbRWOtd6LecvN207mSTeFUITjz8qVnQRFR66q98vlylfiajS9N8Axc5K
 LhzQ==
X-Gm-Message-State: AOJu0Yyzu9gFm2fSR9xrRXCSVTNFY/3HMnsD5asCra4ApKWRArQe5JqH
 Ly7iiOSZZdwtgWdDmuwaut0RC97eMg1a+QmeZcjDVJtDgX/BZ40y7OnmRcGsPmrQHvJ9ZyE1ndU
 =
X-Google-Smtp-Source: AGHT+IH2T8qtm5kMsHEoOMLoJjL5GT4rgXXuzE39GAo3WiHyR9y8DPr2F3JoFv0aWUG6v9KGWPvKvA==
X-Received: by 2002:a17:907:1043:b0:a4e:703d:12a2 with SMTP id
 oy3-20020a170907104300b00a4e703d12a2mr5717365ejb.52.1712133627522; 
 Wed, 03 Apr 2024 01:40:27 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060e5000b00a47531764fdsm7448952eji.65.2024.04.03.01.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:40:27 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:40:05 +0200
Message-Id: <20240403084005.512267-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712133628; x=1712738428; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MSO/wzUslcv62V4oVoaG6VLY9LrIp0Tt3yliqdxexUg=;
 b=jWKFH87Dg7bqFTiB7UXc37VqVZ9dXm8TAE7Ytk44hO+TiJ5CSo82lsAdM8X1aQzaCp
 f6wnitvHTc6cC3IjE949nJVzGDsMqwivOMfbtePXRn7Drf3hLvYMxrFNTBEA3+IB8FMJ
 EyS7hlaOXbA+jebOvoO0dVJvlsDT1ibFU5JskIqe3zjsCNhJ3RphvEoOkYoYOmxLaAM/
 F1R8nXjXxCEWpnCg6QHlSk/TabdOUCC9KkGRPqUDZP2JCZ7AaAdoSa+6mGie98KeJyNv
 GnKRwTWdvUS4Jq8dkcTW3VKtqwEvqi4+c1Bl1zN29ck09IHrSb3ozF1cQ/idS7vY7VjA
 o7Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=jWKFH87D
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.52.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../pango/0001-Drop-Werror-array-bounds.patch | 40 -------------------
 package/pango/pango.hash                      |  4 +-
 package/pango/pango.mk                        |  4 +-
 3 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 package/pango/0001-Drop-Werror-array-bounds.patch

diff --git a/package/pango/0001-Drop-Werror-array-bounds.patch b/package/pango/0001-Drop-Werror-array-bounds.patch
deleted file mode 100644
index 45821e853..000000000
--- a/package/pango/0001-Drop-Werror-array-bounds.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e93dbd66973040f1e0afcba0dc7c712c27d75d59 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Mon, 1 May 2023 23:27:52 -0400
-Subject: [PATCH] Drop -Werror=array-bounds
-
-gcc has strange issues with this and produces false
-positives that recently started breaking the build of
-pango as a subproject in gtk.
-
-See e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105523
-
-Upstream: https://gitlab.gnome.org/GNOME/pango/-/commit/e93dbd66973040f1e0afcba0dc7c712c27d75d59
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 930f41082..2d30c0141 100644
---- a/meson.build
-+++ b/meson.build
-@@ -89,7 +89,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
-     '-Wuninitialized',
-     '-Wunused',
-     '-Werror=address',
--    '-Werror=array-bounds',
-     '-Werror=empty-body',
-     '-Werror=implicit',
-     '-Werror=implicit-fallthrough',
-@@ -132,7 +131,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
-     '-Werror=sequence-point',
-     '-Werror=return-type',
-     '-Werror=trigraphs',
--    '-Werror=array-bounds',
-     '-Werror=write-strings',
-     '-Werror=address',
-     '-Werror=int-to-pointer-cast',
--- 
-GitLab
-
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 3e609e6e0..69b6b0adf 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pango/1.50/pango-1.50.14.sha256sum
-sha256  1d67f205bfc318c27a29cfdfb6828568df566795df0cb51d2189cde7f2d581e8  pango-1.50.14.tar.xz
+# From https://download.gnome.org/sources/pango/1.52/pango-1.52.2.sha256sum
+sha256  d0076afe01082814b853deec99f9349ece5f2ce83908b8e58ff736b41f78a96b  pango-1.52.2.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 723e6d228..ec0f5127e 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).14
+PANGO_VERSION_MAJOR = 1.52
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).2
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
