Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E43DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 10:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 105A24089C;
	Sun, 13 Mar 2022 10:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRxBRxI8dsoL; Sun, 13 Mar 2022 10:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3236B40897;
	Sun, 13 Mar 2022 10:38:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 396C61BF341
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 10:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35C3E812DF
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 10:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzsjeNHa2AXD for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 10:38:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 335018129A
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 10:38:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t11so19545693wrm.5
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 03:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YUl4tYzWgbtelr/za/hqCneypvaVGJlalLRonqjAO6w=;
 b=lQjXdX20AHZs+a8xd9Qo1E5Ss8/XYl4EmwAweBier2hm4lQG+bKIPxcnilDC3sVGxc
 m51nroxwNrLisb0O90V31a9Zm0uI/3dxYxXE7Pb37MpHxgn1uz1hAGUMQ4oNTJb5pzTy
 wXjM8s4Lh5OnztbB2pUN32VFSECZcEoNohspvFyImpc0kLlAr+g063yAcNnsSVWoKICS
 oLD6dmQi0CdVYIV9q1EXNpJ6Hieoye1M0KYWa95lXDw25PIQYK40SGjou4nYBNHlPftV
 4SnsdOtwJN+lGmsw6EwTxzFX3/kUWfXGeyvmGIA3Go2p34svJ+TFPDJdACUk3vGqQHWz
 d0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YUl4tYzWgbtelr/za/hqCneypvaVGJlalLRonqjAO6w=;
 b=IEi/Cwhv6oyFOI8WWGCuNXZNbqvHTz3l59xxuiHjyVzTzxnAEJiF08dUwaUDIjdJZr
 oTieRQIFUVWjFSemdQDopjOJUA9/fST72nNTTP5FPkngX+CPFWZc9JK1NMkhxpck/Es4
 7+hWq6zusRu593yi2aV/Y9dW7B+bj3XjiMOERUwg+G6hKH+u9+XW418gvowTQ5S45fCm
 MCNaoH3wJDvX7/80cMjG4gF6lQDI93BgkOGL9uDiQZ3iki26WMHg2blSJ2P/YsNmWzs7
 hUmg8lsKEUzNrLCbJ/SYegqC9BHRHodwxKecBgOZcRhhBmEUzPyhE85HhR5shuHSNGxD
 kfJQ==
X-Gm-Message-State: AOAM5329zZ1aNnMEGga344hpaHqXQhmUy/anxGm7J5vfR5HhkhN67uSJ
 dLwdL6r0dN192b9Ouiy9Wn6Edq9P/4M=
X-Google-Smtp-Source: ABdhPJw4nuyrFVqI8OH6oD73ctlQ3EhMHFe2EXyOYdiGu1x+qw4RioQnIkgE3OUWvYW7nXkmgfg/ag==
X-Received: by 2002:adf:cd02:0:b0:1f0:767d:b39a with SMTP id
 w2-20020adfcd02000000b001f0767db39amr13025731wrm.529.1647167915049; 
 Sun, 13 Mar 2022 03:38:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm19239301wmp.13.2022.03.13.03.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 03:38:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 11:37:36 +0100
Message-Id: <20220313103737.751528-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] Revert "package/ola: drop autoreconf"
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 66d348ae18c6e73d6ff9d935a241e55a65948be6 because
for an unknown reason, the build fails if autoreconf is dropped:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: warning: libolauartdmx.so.0, needed by olad/.libs/libolaserver.so, not found (try using -rpath or -rpath-link)
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: warning: libolaserverplugininterface.so.0, needed by olad/.libs/libolaserver.so, not found (try using -rpath or -rpath-link)

Fixes:
 - http://autobuild.buildroot.org/results/f8164c69da0b9fa38081e8b785d8234f0f297ae1
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ola/ola.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 1874350784..5090076175 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -9,6 +9,7 @@ OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VE
 OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
 OLA_INSTALL_STAGING = YES
+OLA_AUTORECONF = YES
 
 # util-linux provides uuid lib
 OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
