Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F41C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 17:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6548941C68;
	Fri,  1 Mar 2024 17:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igbXSeF5UTQG; Fri,  1 Mar 2024 17:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2311C41C6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2311C41C6A;
	Fri,  1 Mar 2024 17:49:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4CF81BF2F7
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 17:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DDCB41C6A
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 17:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRFVt4RHTszo for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 17:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B48041C68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B48041C68
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B48041C68
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 17:49:41 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51321e71673so2729113e87.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 09:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709315379; x=1709920179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P5EM4wVPOwF4OFfPxBKUXLobFxJYv0V4RKVy2xHPTxY=;
 b=EH5KBar9+hXNKahuytjWfOwWonWT6yOAkj2ktNSO0c8bzBV1EWqNXU6l6cBTYJL6iP
 /PFSUCPmZKI9cCoV9kzzwcPU5Iq6YkpGNYyvwFnHefDDoyUtGIGWRXnbTGNB9QLSBnn0
 Fla/uHGOmsdenM6ks0THApg9uC8D7nefFwINR+9Al2EO7ajyTSQ8sO86jgIQTBbA1JPJ
 c0/pbSfNBMp01Z+1+H5BhF9nJfPFz61U7i6ro8jp0koWlZvGTV71lHL1JV8+A+3RBSE7
 7CySxtJIwpbLlcf8juTE6iA8JmT6jqPj0dHcpaMIGpWPr2k/hv4mOYX8Bgjtpp22dqK/
 9qLw==
X-Gm-Message-State: AOJu0Yz4uw0dbZ0VEDskXsy6ooFFE598fkXbw8s43/m3juzwx7VqmMAD
 eUNv5hPbFFBO+CcIfMnojYvbZQZCnn3cjI0/FBj49ivDbUSlxKgj16AmQDdn
X-Google-Smtp-Source: AGHT+IFU/B05c9QCALIHa/mbQidLFC2oR+wHQOFLgN+ByYHWU1ZSAbrhweD/G1F7k1trKgG+kdT6cw==
X-Received: by 2002:a05:6512:200b:b0:512:ee1f:b5af with SMTP id
 a11-20020a056512200b00b00512ee1fb5afmr1591606lfb.41.1709315379289; 
 Fri, 01 Mar 2024 09:49:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g3-20020adfe403000000b0033af3a43e91sm5127301wrm.46.2024.03.01.09.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 09:49:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 18:49:34 +0100
Message-ID: <20240301174934.785286-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709315379; x=1709920179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P5EM4wVPOwF4OFfPxBKUXLobFxJYv0V4RKVy2xHPTxY=;
 b=c2io166RG6VwLN9GCPDb7pXebQozhrK+vJP/XOlIn9XuNrePNqdBnF0uBl8Ly8XdM+
 840WOPZDrBHlC7JYsKz64/4hKp6vSMFAc8gMhoY1znKX9kd0kg5R+zRXe5K1WvGvF0OU
 9bI0YXrYf66wqFrA0wY5pFU7s0LkWlWrPXlVZjMCj7ExzH4ZuW6JaMr/iwFCki8szrih
 K9+gjmFP5yUBaM8URurMWhU5MEY9GVwouxtKB3A0PM3MZ18ZoFeckvsm1S6qjS7/gORh
 a+FgIPzVXsFaYsoJgZb1AbDTmdqGMfuTY8eZb6xoRisH/U62QCi8uO/fOAIQ9Nfa2Rfv
 tuqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c2io166R
Subject: [Buildroot] [PATCH 1/1] package/rhash: fix NLS build
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

Fix the following NLS build failure raised since bump to version 1.4.4
in commit f9b465c66c42e936a80292f7854f605d4c88564e:

./configure: line 879: -lintl: command not found

[...]

/home/buildroot/autobuild/run/instance-0/output-1/host/bin/xtensa-linux-gcc calc_sums.o hash_print.o common_func.o hash_update.o file.o file_mask.o file_set.o find_file.o hash_check.o output.o parse_cmdline.o rhash_main.o win_utils.o librhash/librhash.so.1.4.4   -o rhash
/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: calc_sums.o:(.literal.rename_file_by_embeding_crc32+0x10): undefined reference to `libintl_gettext'

Fixes: f9b465c66c42e936a80292f7854f605d4c88564e
 - http://autobuild.buildroot.org/results/f8dd8ea6c0c9cd428355e3720e679a078b8e0f8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ct-assigment-in-the-configure-script.patch | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/rhash/0001-Fix-243-Incorrect-assigment-in-the-configure-script.patch

diff --git a/package/rhash/0001-Fix-243-Incorrect-assigment-in-the-configure-script.patch b/package/rhash/0001-Fix-243-Incorrect-assigment-in-the-configure-script.patch
new file mode 100644
index 0000000000..4a9a81dbf5
--- /dev/null
+++ b/package/rhash/0001-Fix-243-Incorrect-assigment-in-the-configure-script.patch
@@ -0,0 +1,24 @@
+From c804982d1b24c6533118b3068d2cfdca685076f3 Mon Sep 17 00:00:00 2001
+From: Aleksey Kravchenko <rhash.admin@gmail.com>
+Date: Mon, 7 Aug 2023 01:00:37 +0300
+Subject: [PATCH] Fix #243: Incorrect assigment in the configure script
+
+Upstream: https://github.com/rhash/RHash/commit/c804982d1b24c6533118b3068d2cfdca685076f3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 39ef8c1..63cbd8d 100755
+--- a/configure
++++ b/configure
+@@ -877,7 +877,7 @@ if test "$OPT_STATIC" = "no"; then
+   RHASH_TEST_OPTIONS=--shared
+   test "$INSTALL_LIB_SHARED" = "auto" && INSTALL_LIB_SHARED=yes
+   test "$INSTALL_LIB_STATIC" = "yes"  && RHASH_BUILD_TARGETS="$RHASH_BUILD_TARGETS \$(LIBRHASH_STATIC)"
+-  RHASH_LDFLAGS=$RHASH_LDFLAGS $GETTEXT_LDFLAGS
++  RHASH_LDFLAGS=$(join_params $RHASH_LDFLAGS $GETTEXT_LDFLAGS)
+ else
+   LIBRHASH_TYPE=static
+   LIBRHASH_PATH="\$(LIBRHASH_STATIC)"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
