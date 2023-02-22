Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5115CC6379F
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 09:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3EBD40B64;
	Wed, 22 Feb 2023 09:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3EBD40B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrwjDSs8kOvp; Wed, 22 Feb 2023 09:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B83B404DA;
	Wed, 22 Feb 2023 09:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B83B404DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46CB51BF3F9
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CB5740138
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CB5740138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1l9paAWs1Bj3 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 09:44:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7538404DA
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7538404DA
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 09:44:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so5695428wms.1
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 01:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNZFjpAeombdBwyNYWNbwB/zSTusAhB+pdw3i96Itj4=;
 b=VYpyw/rXo86UXB0F70DTnbGcTN99pvuYihIsAPe31x5uzvJRBK8n9ji399H7CnS15o
 IvEVAmhhjirA49CpVYGmet0BhCXCdZEcGhfeW/AdzhuRuIE29aa1Qw7PCnhOHofqN/mZ
 YvM08pq4qtQIiBMSwkmNwNgXVwM1HGhrRoVmSjgb+YsPuNNGYXDKsaQtLmtxTRDtRE+v
 GSJJ9WhJeE5gGO/bw3Uqin03PcSnbDyl9i+HX/Agr4M1ewc+qZ8sE0H7OdJpxHOaCcbu
 wgsrJkOxi8W1fXsD95TipYn/OC/uh4QX/pX1+O9f/xfYQsRRSLxhxFz5DPkL2wBJn0+C
 2jNQ==
X-Gm-Message-State: AO0yUKXlWI867EEJ7Qh9DAK4Xl48NlRNPGeT+UKFh4Fg/PSNNu5RVfuA
 LnPHCeT/+UsNoHN3p/0lCoZtdHkm7D4=
X-Google-Smtp-Source: AK7set+NpiHxsju3OGOV6Moq0hnak/kZB1fLAUXItGpkSb7yHrRc9OkJO54T0olcifULyAr0vDqn7w==
X-Received: by 2002:a05:600c:1818:b0:3e2:1fa5:98de with SMTP id
 n24-20020a05600c181800b003e21fa598demr6316569wmp.30.1677059088637; 
 Wed, 22 Feb 2023 01:44:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a5-20020a05600c224500b003dc1a525f22sm4593440wmm.25.2023.02.22.01.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 01:44:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 10:44:41 +0100
Message-Id: <20230222094441.439014-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hNZFjpAeombdBwyNYWNbwB/zSTusAhB+pdw3i96Itj4=;
 b=SI6C1fRW52k9D1/IeX7b7W152OPjUmhUj5ynwem+f+grjTm7kcDtAasxwejP9jxfUe
 fbrcix5MRMvHyIgppZCxcRrwetzeX7q0NxJJCm0MXIcwEgSUqm0XtXNPGVM3wfJX+EZH
 xF00e4usqCuoEE6GTYa2xiE6iwqo0Ar1HLQDsq+ecbvCwjDMeJ7WojdwtE1rw1lWcHlq
 THIdwstPmgIKfcZP+3rGXoizzKyEmKtU5Yh2zU1f+HUcaqUGdDsutVtH5mahSkqhlsgL
 RM1AAvCnjJAZGjjjzvQ/0PzsI/UoKcS++ChnIqSWRalcwBMlE41S+XuASx6QK7hKgais
 DeTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SI6C1fRW
Subject: [Buildroot] [PATCH 1/1] package/sudo: fix openssl static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with sparc raised since bump to version
1.9.11p2 in commit 9b7f8da96be549a52630cd87b30851d600f163a4 and
https://github.com/sudo-project/sudo/commit/9fbbca7b7a4cc60a8aa27d73de54278004a704c0:

hecking for X509_STORE_CTX_get0_cert
configure:21215: /home/thomas/autobuild/instance-3/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DZLIB_CONST  -static conftest.c   -L/home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lz -pthread -latomic -lcrypto >&5
/home/thomas/autobuild/instance-3/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
x509cset.c:(.text+0x108): undefined reference to `__atomic_fetch_add_4'

[...]

In file included from ./hostcheck.c:38:
../../include/sudo_compat.h:342:41: error: conflicting types for 'ASN1_STRING_data'
  342 | #  define ASN1_STRING_get0_data(x)      ASN1_STRING_data(x)
      |                                         ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8be59dd94e4916f9457cb435104e36e62a28373b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...onfigure.ac-fix-openssl-static-build.patch | 49 +++++++++++++++++++
 package/sudo/sudo.mk                          |  2 +
 2 files changed, 51 insertions(+)
 create mode 100644 package/sudo/0001-configure.ac-fix-openssl-static-build.patch

diff --git a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
new file mode 100644
index 0000000000..32edd148a0
--- /dev/null
+++ b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
@@ -0,0 +1,49 @@
+From 5cfc7e277d0b262a1d12e867c47a36301fb7edb7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 22 Feb 2023 10:01:25 +0100
+Subject: [PATCH] configure.ac: fix openssl static build
+
+Do not use AX_APPEND_FLAG as it will break static builds by removing
+duplicates such as -lz or -latomic which are needed by -lssl and
+-lcrypto. This will fix the following build failure with sparc which
+needs -latomic:
+
+Checking for X509_STORE_CTX_get0_cert
+configure:21215: /home/thomas/autobuild/instance-3/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DZLIB_CONST  -static conftest.c   -L/home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lz -pthread -latomic -lcrypto >&5
+/home/thomas/autobuild/instance-3/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
+x509cset.c:(.text+0x108): undefined reference to `__atomic_fetch_add_4'
+
+[...]
+
+In file included from ./hostcheck.c:38:
+../../include/sudo_compat.h:342:41: error: conflicting types for 'ASN1_STRING_data'
+  342 | #  define ASN1_STRING_get0_data(x)      ASN1_STRING_data(x)
+      |                                         ^~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8be59dd94e4916f9457cb435104e36e62a28373b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/sudo-project/sudo/pull/244]
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8eccad7e4..523d8e56b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3082,7 +3082,9 @@ if test "${enable_openssl-no}" != no; then
+ 		    SUDO_APPEND_LIBPATH([LIBTLS], [$f])
+ 		    ;;
+ 		*)
+-		    AX_APPEND_FLAG([$f], [LIBTLS])
++		    # Do not use AX_APPEND_FLAG as it will break static builds by removing
++		    # duplicates such as -lz or -latomic which are needed by -lssl and -lcrypto
++		    LIBTLS="$LIBTLS $f"
+ 		    ;;
+ 	    esac
+ 	done
+-- 
+2.39.0
+
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index c4eaafa6b1..3b5c898917 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -13,6 +13,8 @@ SUDO_LICENSE_FILES = LICENSE.md
 SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
 SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
 SUDO_SELINUX_MODULES = sudo
+# We're patching configure.ac
+SUDO_AUTORECONF = YES
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
