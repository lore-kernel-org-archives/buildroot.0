Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C9FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 20:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E4D8416E8;
	Wed, 27 Apr 2022 20:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlTXs7TNxyMV; Wed, 27 Apr 2022 20:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A94418AA;
	Wed, 27 Apr 2022 20:11:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF59F1BF869
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBC8860E4B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WW2NBkreKlvn for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 20:11:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCDCB60EE2
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 20:11:13 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 bi24-20020a05600c3d9800b00393ff664705so1848146wmb.4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mBKSOrOKC0GPnUug4ppICt0vlt3EScxpOck/KuMxFRg=;
 b=U9qZiZcKv3x50h+a//IqCb15VXF1wF62c2eQGN8FiBRweWke8oRAk+tzgQp0HgrVVg
 IwESqy+hn7L+WQ3BGngj80Q4mUUVBHlhTihcbgb/I+0lixD8sevCAOW+I/Cpzi/UZlie
 efq3eUEjMRUbbxz67Ce+7I8Iv7T3r+PwSGNHxu+rPbF1pUONhGoBGkCBpWCCCXWSBs+6
 f41XvvIxTiI/dOAMDCVk7dJAasWGas9t3pcbvkuvPWaar8dbY2IOvug8aOOXAWP3Ppzw
 UNs+Ex/RWU62HzqHHvP2h5S+ZB1yKxvKpFsfFQIymS0dFEU+SC1RW+QsXaaKWATUUuSl
 DVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mBKSOrOKC0GPnUug4ppICt0vlt3EScxpOck/KuMxFRg=;
 b=NGs/RfrVzn/0ISP0+SKkJ/LSuYtZgK9E2c0bedaPfpLNylo1T81rZKwvyaKBIdeRwZ
 CDS5hAYub8ZQqinqBsv99Yi31STOBSbfqGSJLujopewTBZ5Z5AAbDo5V33fAAzgov2HZ
 UEnasmG4zsk7gR9LQzFOVkst2TzJ7ehawbOpwJyjpViCiaYPyDD7Si1nxSi+bS/Y7N5B
 Yq1on+cAuCxaXTnLrZqn1avAkMZ2yW45gTrqHjCI/pY9sN/Da4CBNU+YdhrUvGyctXI0
 7qztzOa9Dnas7tccv4w5BBYBM/YURWOj0Lr3L2SAXWxwYDV/c68CHqXSXgN7BKPjCNA2
 kOng==
X-Gm-Message-State: AOAM531hdc+SYrrhfdGaNHurAzgZV7m4/pqvODj7Cfc4LyLClZ8B6A5B
 raCZzlVf8oZw9HnEWokzhagb6T2mTIU=
X-Google-Smtp-Source: ABdhPJxHa09rSUS8Kks5Uwv2U4U6j2KFp8OtmZiypT5y5RdVQ/5b14fhx5m5wkCvETMYkGCGp8t2cA==
X-Received: by 2002:a05:600c:4347:b0:393:fbae:a5da with SMTP id
 r7-20020a05600c434700b00393fbaea5damr7951462wme.205.1651090271562; 
 Wed, 27 Apr 2022 13:11:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a1c2b03000000b00392a3e6280bsm2329748wmr.8.2022.04.27.13.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 13:11:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 22:08:38 +0200
Message-Id: <20220427200838.2896323-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bubblewrap: disable tests
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

Disable tests to avoid the following build failure on mips32:

[9/10] Compiling C object tests/try-syscall.p/try-syscall.c.o
FAILED: tests/try-syscall.p/try-syscall.c.o
/home/autobuild/autobuild/instance-11/output-1/host/bin/mipsel-buildroot-linux-musl-gcc -Itests/try-syscall.p -Itests -I../tests -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -O3 -D_GNU_SOURCE -Werror=shadow -Werror=empty-body -Werror=strict-prototypes -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=pointer-arith -Werror=init-self -Werror=missing-declarations -Werror=return-type -Werror=overflow -Werror=int-conversion -Werror=incompatible-pointer-types -Werror=misleading-indentation -Werror=missing-include-dirs -Werror=aggregate-return -Werror=switch-default -Wswitch-enum -Wno-sign-compare -Wno-error=sign-compare -Wno-missing-field-initializers -Wno-error=missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g0 -MD -MQ tests/try-syscall.p/try-syscall.c.o -MF tests/try-syscall.p/try-syscall.c.o.d -o tests/try-syscall.p/try-syscall.c.o -c ../tests/try-syscall.c
../tests/try-syscall.c:34:5: error: #error "Unknown MIPS ABI"
   34 | #   error "Unknown MIPS ABI"
      |     ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/cf0365354fc8c16e5871d561daae0fa5039d0bee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-meson-add-tests-option.patch         | 54 +++++++++++++++++++
 package/bubblewrap/bubblewrap.mk              |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 package/bubblewrap/0001-meson-add-tests-option.patch

diff --git a/package/bubblewrap/0001-meson-add-tests-option.patch b/package/bubblewrap/0001-meson-add-tests-option.patch
new file mode 100644
index 0000000000..32836f925d
--- /dev/null
+++ b/package/bubblewrap/0001-meson-add-tests-option.patch
@@ -0,0 +1,54 @@
+From 34ea0ad841d6f9167db391c08e6cd51471fed6be Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Apr 2022 11:27:06 +0200
+Subject: [PATCH] meson: add tests option
+
+Allow the user to disable tests, for example to avoid the following
+build failure on mips32:
+
+FAILED: tests/try-syscall.p/try-syscall.c.o
+/home/autobuild/autobuild/instance-11/output-1/host/bin/mipsel-buildroot-linux-musl-gcc -Itests/try-syscall.p -Itests -I../tests -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -O3 -D_GNU_SOURCE -Werror=shadow -Werror=empty-body -Werror=strict-prototypes -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=pointer-arith -Werror=init-self -Werror=missing-declarations -Werror=return-type -Werror=overflow -Werror=int-conversion -Werror=incompatible-pointer-types -Werror=misleading-indentation -Werror=missing-include-dirs -Werror=aggregate-return -Werror=switch-default -Wswitch-enum -Wno-sign-compare -Wno-error=sign-compare -Wno-missing-field-initializers -Wno-error=missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g0 -MD -MQ tests/try-syscall.p/try-syscall.c.o -MF tests/try-syscall.p/try-syscall.c.o.d -o tests/try-syscall.p/try-syscall.c.o -c ../tests/try-syscall.c
+../tests/try-syscall.c:34:5: error: #error "Unknown MIPS ABI"
+   34 | #   error "Unknown MIPS ABI"
+      |     ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cf0365354fc8c16e5871d561daae0fa5039d0bee
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/containers/bubblewrap/commit/34ea0ad841d6f9167db391c08e6cd51471fed6be]
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 6 ++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 5b63aa64..9277ac4e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -152,4 +152,6 @@ if not meson.is_subproject()
+   subdir('completions')
+ endif
+ 
+-subdir('tests')
++if get_option('tests')
++  subdir('tests')
++endif
+diff --git a/meson_options.txt b/meson_options.txt
+index 2fa3a8c3..a136a3c3 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -38,6 +38,12 @@ option(
+   description : 'enable optional SELINUX support',
+   value : 'auto',
+ )
++option(
++  'tests',
++  type : 'boolean',
++  description : 'build tests',
++  value : 'true',
++)
+ option(
+   'zsh_completion',
+   type : 'feature',
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 5875b0d6e2..81456e9e0d 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -17,7 +17,8 @@ BUBBLEWRAP_CONF_OPTS = \
 	-Dzsh_completion=disabled \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \
-	-Drequire_userns=false
+	-Drequire_userns=false \
+	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
 BUBBLEWRAP_CONF_OPTS += \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
