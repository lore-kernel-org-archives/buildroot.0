Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4449BCD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 14:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C411440C12;
	Sat, 16 Sep 2023 14:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C411440C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BRB0_MszFhFd; Sat, 16 Sep 2023 14:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C2D640CA1;
	Sat, 16 Sep 2023 14:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C2D640CA1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89CBA1BF40D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7137840C2A
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7137840C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2O11YY6hGyk for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 14:10:56 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2543940C12
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2543940C12
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3200257b9a3so309914f8f.3
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 07:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694873454; x=1695478254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6glQqdyKkSSvNLO900715GaGNHa1XSWI4iJNxCuevew=;
 b=qD9H5nFj/tkxWI8IhXYaVuP59ISqVEq73uoAKI2PFPNIDbWqPK5dJgy4//BWoG7gY/
 xDXRcbDDiQfU1GFvGJlx6X0Vl9Y3hdqNy0tKgVYT3erHbETn5L6ac97KGcVZvdpYWUV4
 ZvNCJj/YKjXqSak0SwoO+uAwlrp6EZKXolWpL2i7atA4273d/GeFWN9W4yYp+Sr3xAuX
 qp/tDuICE/kPbAmVGLM0ANgkTIYbCksY0KYF0QALQUBr6P8uyfh8VeRdHQLaw6L5qJO9
 IDZLs81yuC9HhpkuEGMxh/I8/LAbs2M06g6FnSYeNIefBo6DQ/Yk6jxBvSBqVJLpV/o4
 ZVIg==
X-Gm-Message-State: AOJu0Yx7A+IfiKtJWHDvhLf7PDv9SQMVkp8BuDh1be9airbrX9q7B9FG
 mQf64D85940Y8JnOZo8PeO1mxbwsH5s=
X-Google-Smtp-Source: AGHT+IEyrcp0CHeC/URSRlF1Lbgmco0uH1CY/Lx6CwPf9jWv8qTEYM3vWzE8CIzV74+t7vGS7sOIrQ==
X-Received: by 2002:a5d:508e:0:b0:31f:e1b4:5846 with SMTP id
 a14-20020a5d508e000000b0031fe1b45846mr3487037wrt.53.1694873453649; 
 Sat, 16 Sep 2023 07:10:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7344246wrw.0.2023.09.16.07.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 07:10:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 16:10:51 +0200
Message-Id: <20230916141051.326427-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694873454; x=1695478254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6glQqdyKkSSvNLO900715GaGNHa1XSWI4iJNxCuevew=;
 b=E2EHsw4RLxmmtHRApg9WFEZ/hc7I6RDe1GW/+nrXUjvgWMQQw0ahgsBxrizHsvh/Ep
 N1lyXZi8wvrgrKiYfELJx7oz2ak2O5kp1xNXQNd01XHEpxz7mDTGTf5/BSvXOUe7xl5k
 v9KDasn1U8ueFx57p1BI9tsvwD32/Hisfp63YaHkYtwdDEpaRAvShSHmpkwG2WmRlPcs
 dTVoAJfMxvdfeJYEejx9pslZQ+EGB9ktX8nPifnuGz2fCbC3Eo7yjV+0uF/bUFVVwwOx
 PmH3C4Og+/Malo8zxxlw95ANzQy+oWEG0B6OZMaZ/7rYrWxrawiOEvbutlO+gz+BU9VS
 1bCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E2EHsw4R
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: link with -latomic when
 needed
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

Fix the following build failure raised since bump to version 1.5.3 in
commit f8147e27cdac8f998ec6644a09ce4e8d62b6433c and
https://github.com/linux-pam/linux-pam/commit/a35e092e24ee7632346a0e1b4a203c04d4cd2c62:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/11.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: .libs/pam_keyinit.o: in function `pam_sm_open_session':
pam_keyinit.c:(.text+0x824): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/52c51b5ad5930ed783b88fb33932297379fd4429

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-pam/linux-pam.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 21e5decb9c..92d8c952ac 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -21,9 +21,14 @@ LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES)
 LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
-LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
+LINUX_PAM_LIBS = $(TARGET_NLS_LIBS)
+LINUX_PAM_MAKE_OPTS += LIBS="$(LINUX_PAM_LIBS)"
 LINUX_PAM_CPE_ID_VENDOR = linux-pam
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LINUX_PAM_LIBS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LINUX_PAM_CONF_OPTS += --enable-selinux
 LINUX_PAM_DEPENDENCIES += libselinux
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
