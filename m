Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A4DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2B1B81751;
	Mon,  2 May 2022 22:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUPmFc-_pwqO; Mon,  2 May 2022 22:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF8988144B;
	Mon,  2 May 2022 22:31:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9F31BF963
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98688416C0
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HcdGcXr00zkO for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 22:31:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6009F416BF
 for <buildroot@buildroot.org>; Mon,  2 May 2022 22:31:43 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id s14so2558818ild.6
 for <buildroot@buildroot.org>; Mon, 02 May 2022 15:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4mLXUM8dmYWO3lDOg23BmkOLQhUwgW2RbTJoG/xLYQY=;
 b=Q5PqykLlzDKjG9BRhBn4jpxDgyjG38G7UbcKwYBLnx/iTgljWI+45QM4Xt3coFUJsc
 lA3hns0nK4GPfyTrNuaITc+WGpSz2rlkSBV4Fz9TnEks1G3p1bpdT/To/nyuSnaH6qWt
 dIwGGHuD/crti+Mi+3zvHA4KhU575Auf9+f/ACUTexeEz2t3lYmH2w2UjegiImrnLO9A
 KiOzHxJ+o0Tuj1he5x+758I5MhFj/cKN/If9TO2hzEMme1BKU376u6+MuLR84vn9HPvf
 JwddTqfSbppxMVbtmqjPaSeHwadUE4SSq0dme/mg7XTLF+Nxe7UdbGZ/fu8i8iMa+CjA
 HFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4mLXUM8dmYWO3lDOg23BmkOLQhUwgW2RbTJoG/xLYQY=;
 b=Wvoaxi+IYrvaOQ4bpvk4zNr9uNtMsTQAr4Ra6BKpRH7DcVlcY22IYjhQ0ZIfORPUBL
 clcrVwk0kzWt3Gb0VjIHP+rszEgLsK3WvUYjW0SKODfwY/KHMITkZFV+H7jWMJzqKrzT
 ajcyqU6vexmijqu6DrM/M4qH7KzLVEcwaej9juBIEEPD/0CgMt/kECx9Xj1mc63Q61lQ
 E0Flzowbpt447WzibSVZq4QQ44PSzoyxP1cm2kNIND+YCfEC0d0lX6ZaD3Lhu8RQVNlR
 NuAim4Fvx5SfJwJuMkVEx5Rp11zv32I6fclnLmnqzsByj/au6Ga1xzLcD0IiDR8VUm99
 4pKQ==
X-Gm-Message-State: AOAM5333Di6EqEjXVVQuPpMI1O5NUjeMVgX/eTsQFwkLmDP9cn9IF8Ik
 TrOMwzqKUAJkELf/ucXwZZtX+APFLno=
X-Google-Smtp-Source: ABdhPJwzEGfljgYIJGz+49WNzfUx5oE1BHArJbj8mNYlOXJrqOAkMRBVpvpLzSghOyfQrc+OWEpKHA==
X-Received: by 2002:a92:c26a:0:b0:2cd:9acf:c42d with SMTP id
 h10-20020a92c26a000000b002cd9acfc42dmr5494891ild.143.1651530702094; 
 Mon, 02 May 2022 15:31:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 w9-20020a5d9609000000b0065a47e16f44sm2465885iol.22.2022.05.02.15.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 15:31:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 16:31:40 -0600
Message-Id: <20220502223140.3820989-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zchunk: fix unsafe header/library
 path
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch from upstream to fix:
unsafe header/library path used in cross-compilation: '-I/usr/include'

Fixes:
 - http://autobuild.buildroot.net/results/825/82517abd49dcf82c17fabaf9680353d5a6cc4279

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...rgp-standalone-wrap-and-find_library.patch | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch

diff --git a/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch b/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
new file mode 100644
index 0000000000..6c9cdba3ad
--- /dev/null
+++ b/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
@@ -0,0 +1,106 @@
+From 473c97cda44b95f5cea08a0cdd566e602df564db Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 21 Apr 2022 14:24:01 -0600
+Subject: [PATCH] meson: fix argp-standalone wrap and find_library
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+473c97cda44b95f5cea08a0cdd566e602df564db]
+---
+ .github/workflows/main.yml       | 27 ---------------------------
+ meson.build                      |  6 +++---
+ subprojects/argp-standalone.wrap |  7 +++++++
+ 3 files changed, 10 insertions(+), 30 deletions(-)
+ create mode 100644 subprojects/argp-standalone.wrap
+
+diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
+index c49806f..35667af 100644
+--- a/.github/workflows/main.yml
++++ b/.github/workflows/main.yml
+@@ -35,25 +35,11 @@ jobs:
+     steps:
+       - uses: actions/checkout@v2
+ 
+-      - uses: actions/checkout@v2
+-        with:
+-          repository: wolfv/argp-standalone
+-          path: argp-standalone
+-
+       - name: Install mamba
+         uses: mamba-org/provision-with-micromamba@main
+         with:
+           environment-file: .github/environment.yml
+ 
+-      - name: Compile argp-standalone
+-        shell: cmd /C CALL {0}
+-        run: |
+-          CALL micromamba activate zchunk_test_env
+-          cd argp-standalone
+-          meson setup builddir
+-          meson compile -C builddir --prefix=%CONDA_PREFIX%\Library
+-          meson install -C builddir
+-
+       - name: Compile zchunk
+         shell: cmd /C CALL {0}
+         run: |
+@@ -75,11 +61,6 @@ jobs:
+     steps:
+       - uses: actions/checkout@v2
+ 
+-      - uses: actions/checkout@v2
+-        with:
+-          repository: wolfv/argp-standalone
+-          path: argp-standalone
+-
+       - uses: actions/setup-python@v1
+         with:
+           python-version: '3.x'
+@@ -87,14 +68,6 @@ jobs:
+       - name: Install meson and ninja
+         run: pip install meson ninja
+ 
+-      - name: Compile argp-standalone
+-        shell: cmd /C CALL {0}
+-        run: |
+-          cd argp-standalone
+-          meson setup builddir
+-          meson compile -C builddir
+-          meson install -C builddir
+-
+       - name: Compile zchunk
+         shell: cmd /C CALL {0}
+         run: |
+diff --git a/meson.build b/meson.build
+index 1c6b32d..aa7dd25 100644
+--- a/meson.build
++++ b/meson.build
+@@ -58,10 +58,10 @@ endif
+ 
+ # argp-standalone dependency (if required)
+ if build_machine.system() == 'windows' or build_machine.system() == 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); return 0; }; void main() {}')
+-    if fs.is_dir(join_paths([get_option('prefix'), 'include']))
+-        inc += include_directories(join_paths([get_option('prefix'), 'include']))
++    argplib = cc.find_library('argp', has_headers : ['argp.h'], required: false)
++    if not argplib.found()
++        argplib = dependency('argp-standalone')
+     endif
+-    argplib = cc.find_library('argp', dirs : join_paths([get_option('prefix'), 'lib']))
+ else
+     argplib = dependency('', required : false)
+ endif
+diff --git a/subprojects/argp-standalone.wrap b/subprojects/argp-standalone.wrap
+new file mode 100644
+index 0000000..14c0b63
+--- /dev/null
++++ b/subprojects/argp-standalone.wrap
+@@ -0,0 +1,7 @@
++[wrap-git]
++directory = argp-standalone-1.4.1
++url = https://github.com/argp-standalone/argp-standalone.git
++revision = 21855f34ec9997c37e1a08cd69497336513a5800
++
++[provide]
++dependency_names = argp-standalone
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
