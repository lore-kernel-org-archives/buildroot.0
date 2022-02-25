Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF3CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 23:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D29BE41847;
	Fri, 25 Feb 2022 23:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XgFIOzK01Bbu; Fri, 25 Feb 2022 23:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8058415E1;
	Fri, 25 Feb 2022 23:18:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98E561BF2A7
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 23:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87C9D415E1
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 23:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mq631snDjxPw for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 23:18:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39C26415AE
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 23:18:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 6-20020a05600c024600b0038125fa8e43so1501186wmj.0
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 15:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LESDUuTHkyj+R1n+OUavQWSrOipQJC/bMqnfvhgIE5g=;
 b=HnrNCTJvDybQDsUP42794aAzJp8I7gQlkk/nFnF80QVjxCy6n6IaUC2mvNv93FaTFg
 H3YHEmzNly+pIgtGY5fFD3lIdf/wOLa7vYTw0rR87I+OsrYdepDixhFhKxxvJX3kd3Gz
 8C2XzOQN78PV5Y2nhd67CCSf5K1YyaqN+1djzhz7LqqD9msj8Jo2pGXIhcjwX5bb2QYI
 BE6uIErUkVhFeEjfgCW0bHlKKtqOfsVFpdblcwpwYU1Sv74M5nAeB2Mmn3EiHv9L3QCA
 MxnIO14ucaOTkHirAYWRnhFRZ30L5ELtA2dOlk1OzuSeOmwKJwPqEm5yhFLxdjfQKXM/
 mKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LESDUuTHkyj+R1n+OUavQWSrOipQJC/bMqnfvhgIE5g=;
 b=3gYto9l3P4pYyHgB3zP8FxS8hlq4XLPfBBLAu6EeTi41CyGLOQ9B6Qtr2WVbITStZl
 N1iPmvnaH0ECQssdArmDPjCicXw1/GUqOdPIf+4pgh3RwaXis1tTbIDbaMnYMuZO0e6z
 4AKr06BO2IFD2aZnm7dEdn0hvtCGTdPR5WOGmo0WAk5uG1XsDvefBZkf6L8uDBkvnaBs
 3R7vo8ERl5q/IOxwWEuyF6mNDFPeLbP5IKoB0bTJVHlGx4q/y9k8M2WiHctE6uLtLgY6
 T9F96a88cr9VZdaSvZeNC5VbYvc+DN8nxxSUDCgG+zEXpK7t6HUrT+Dmjf5VAHsqeh9d
 KZ/w==
X-Gm-Message-State: AOAM530NNvv49Keq9Ks6Un46nPt2fRxb02Ic4zf7eBwDNX4lCx3OYOB7
 354pXLtHdhEwb2IJ+zH1FiuELE54ihw=
X-Google-Smtp-Source: ABdhPJyufglLi9W5P/76ogoce5/PEJeJoPk70zkfv8r2khqbLr1OkW5S3P0zElzDH5+83Nu0jwUXRg==
X-Received: by 2002:a05:600c:4615:b0:381:c68:e8f8 with SMTP id
 m21-20020a05600c461500b003810c68e8f8mr4516550wmo.117.1645831109020; 
 Fri, 25 Feb 2022 15:18:29 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfaac6000000b001e7f9a9498asm3633259wrc.50.2022.02.25.15.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 15:18:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 00:18:16 +0100
Message-Id: <20220225231816.1648877-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump to version
 8.9p1
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

Security Near Miss
==================

 * sshd(8): fix an integer overflow in the user authentication path
   that, in conjunction with other logic errors, could have yielded
   unauthenticated access under difficult to exploit conditions.

   This situation is not exploitable because of independent checks in
   the privilege separation monitor. Privilege separation has been
   enabled by default in since openssh-3.2.2 (released in 2002) and
   has been mandatory since openssh-7.5 (released in 2017). Moreover,
   portable OpenSSH has used toolchain features available in most
   modern compilers to abort on signed integer overflow since
   openssh-6.5 (released in 2014).

Update license (md5crypt removed, bcrypt relicensed to BSD-3-Clause:
https://github.com/openssh/openssh-portable/commit/a5ab4882348d26addc9830a44e053238dfa2cb58
https://github.com/openssh/openssh-portable/commit/158bf854e2a22cf09064305f4a4e442670562685
https://github.com/openssh/openssh-portable/commit/c0459588b8d00b73e506c6095958ecfe62a4a7ba)

https://www.openssh.com/txt/release-8.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssh/openssh.hash | 6 +++---
 package/openssh/openssh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index aab3dba09c..dd123c1bb6 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.8 (base64 encoded)
-sha256  4590890ea9bb9ace4f71ae331785a3a5823232435161960ed5fc86588f331fe9  openssh-8.8p1.tar.gz
+# From https://www.openssh.com/txt/release-8.9 (base64 encoded)
+sha256  fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7  openssh-8.9p1.tar.gz
 # Locally calculated
-sha256  432abf7480fb31473a6706627212913fc70032e3fb71b90fecb28ae26a2d741d  LICENCE
+sha256  d6807e99f3d159145c659060f57c3fa74e109faa39326dbfc38674cb550fd104  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4145bfd8dc..0e0d59e6ab 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 8.8
+OPENSSH_VERSION_MAJOR = 8.9
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_LICENSE = BSD-4-Clause, BSD-3-Clause, BSD-2-Clause, Public Domain
+OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
