Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E785C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22EBA401C2;
	Wed, 24 Jul 2024 16:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PgKloPbxT1W; Wed, 24 Jul 2024 16:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0D03402F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0D03402F2;
	Wed, 24 Jul 2024 16:38:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED521BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CA976067C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZpfToqPXU7j for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CFEA60622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CFEA60622
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CFEA60622
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:38:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-427db004e36so37797755e9.3
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 09:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721839088; x=1722443888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MfdqVS8H6ntZxIVvVUkIfWJAv5MZASwD6FTRO7Vr5+8=;
 b=rEMPeMxo/Ua3zez7B3Hke9HOkPTi9t/k9GLxj3Cu8xMgQxWPfYAnTfJlIlcBjpuPs9
 nfCg7Gik6KQTbpeciPgNmz+9dE2Banmu3gwcJ7e5WIPiYryXj+HZA/nxJ6lF4ilkwwAO
 7ljGy786IURY5jynVtAQim6FSCm2eVVJ77YrE2P77+8O52dEsPx3SMw4aGpgUS/OAyhW
 TG6LNUS1kf3a4cYmZesPRaNhH9v14wRmspCRXoF9OrOCc9KqyhLXK5BbvfH7qVH+8+JK
 0o95j+QU+CGKes47XGZL7weN9P0BDVYPSKZaalos7q2miTgH0LtN3i6wBbJoLogemigc
 XEWg==
X-Gm-Message-State: AOJu0YyXrJOD/b5sYsTNeZtjV20/fomQUWQcqECrP7KylbflPlaAaWWf
 3ulq+P1zsLj3I6znrdiUfhA0zrelMlTrvWju6DT0dh04yvpqhNgGIESf/w==
X-Google-Smtp-Source: AGHT+IGgLC0vBQkfVHFbSf/v1gDVA550RmZEEeRi8cZ0zdtDrntIwvjtEjPm8vhqX9ICBn7E7tFM0w==
X-Received: by 2002:a05:600c:3acd:b0:426:6f1e:ce93 with SMTP id
 5b1f17b1804b1-427f95b36e9mr19023805e9.33.1721839088304; 
 Wed, 24 Jul 2024 09:38:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f93a6426sm34865475e9.30.2024.07.24.09.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 09:38:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 18:38:06 +0200
Message-ID: <20240724163806.262384-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721839088; x=1722443888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MfdqVS8H6ntZxIVvVUkIfWJAv5MZASwD6FTRO7Vr5+8=;
 b=DAlZiZkys4u6lh62v+0WZ7BX8pHcFl93LqT2d5mkcae26OcLGNVIRhhqbNchSsKPDo
 zDtL8WmYVIax/zaRKt4y9B8ujwudVaIr5vaNjEjjmorMISR9K/P/zQtqepwweZ2YU/60
 16fwZc/oWJ0HTU9/ZIcClf3GxySNfozNZ+2Tlmh5YxK1GCrS+oyNFyx9/IrgnVeGQxHq
 xT7MYk1TYR7jUcafu2GkNzAwcsTV4R7nXI4Xfcr3aHFBhtErWjO8gw1/O+hLLhkRw16k
 C1JlqZOT4MJ4MPz8OaupQRRrSsBfUrSIx6bKUtCdUJviWUZfbzEflhAL05oKVebwY5nc
 ew1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DAlZiZky
Subject: [Buildroot] [PATCH 1/1] package/libressl: fix powerpc64 build
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

Fix the following build failure with powerpc64 raised since bump to
version 3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:

In file included from /home/autobuild/autobuild/instance-23/output-1/build/libressl-3.8.4/crypto/rc4/rc4_enc.c:61:
/home/autobuild/autobuild/instance-23/output-1/build/libressl-3.8.4/crypto/../include/openssl/rc4.h:75:9: error: unknown type name 'RC4_INT'
   75 |         RC4_INT x, y;
      |         ^~~~~~~

Fixes: 21eca49ed5110872407b76ab9337d2877c4cda24
 - http://autobuild.buildroot.org/results/2533f8f642f435b40ce687b6df482c51a3fa0250

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ists-txt-Fix-HOST-variable-for-ppc64.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libressl/0004-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch

diff --git a/package/libressl/0004-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch b/package/libressl/0004-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
new file mode 100644
index 0000000000..8da8fedae2
--- /dev/null
+++ b/package/libressl/0004-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
@@ -0,0 +1,26 @@
+From e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d Mon Sep 17 00:00:00 2001
+From: OPNA2608 <opna2608@protonmail.com>
+Date: Fri, 19 Jul 2024 11:41:46 +0200
+Subject: [PATCH] CMakeLists.txt: Fix HOST variable for ppc64
+
+The code here defined HOST_PPC64, but the rest of the build system expects HOST_POWERPC64.
+
+Upstream: https://github.com/libressl/portable/commit/e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c496ad97b5..670aa9a1a0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -373,7 +373,7 @@ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "mips")
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "powerpc")
+ 	set(HOST_POWERPC true)
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
+-	set(HOST_PPC64 true)
++	set(HOST_POWERPC64 true)
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "riscv64")
+ 	set(HOST_RISCV64 true)
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "sparc64")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
