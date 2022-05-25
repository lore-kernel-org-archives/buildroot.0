Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3153CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 22:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE57C410BB;
	Wed, 25 May 2022 22:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJUFwDfCKvv3; Wed, 25 May 2022 22:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 431D540AF3;
	Wed, 25 May 2022 22:05:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB2C1BF406
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 22:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17DD741D00
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 22:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fl5AruBPq_B5 for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 22:05:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F295C41CFD
 for <buildroot@buildroot.org>; Wed, 25 May 2022 22:05:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id f2so31923049wrc.0
 for <buildroot@buildroot.org>; Wed, 25 May 2022 15:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vv+LBpAdOvh/bMwfn5W+gZUSTVbwqlzI2iAUtojsIcM=;
 b=CYoZHS/bhCNhoRqcMcKQ25PajfR/DWE9AWzuJ3E6/tB0PxqlsxVdSkEiePUg8zpJkH
 suAR/OniDgOWKI8wlEb6JDYasPdA0pXaFRh4viGkKbuqFUfZvpOW8H2Qh0x+HIb3N6MV
 qRtlDj/euPAkVOTmH46kFc8USCNU5kmPuiQkCvJfSjVee8aLoiod2iInuTU6vV0h1hHj
 HWM+PjWadKaWt/sxYmNeS2/AcFlN9JrJys7/WWdiqJXq/Q1STm4aLXNGXqUf5c6p4mXH
 GN9u0OKWKD03HY99f3WnF7H7/BQjCEdp7zHKQOglhyQDLYQqL12SlLDkp1Iu+z4QijpV
 GLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vv+LBpAdOvh/bMwfn5W+gZUSTVbwqlzI2iAUtojsIcM=;
 b=RWBXCrwRu6PMYH5Hf9Ti9esTBOxq+lbjKgVv8xsC9Nv7d6cpL8o1FiNDMabuKu+scA
 JrkHtUzcCt5NMZdF5UHNyWPiaEy89uoO7D8t5KAN80s00ii5DPRhJuwBjaEG24zEEgW5
 Z0GZNEiMCrwOLVNYk4SUWV6N9h/fsW3AXzQdn2MahVX+dGd+Cstow+3VxfVCk63Szr3O
 Bf2HF3wRYN7PLfr7BtE0VDE0IkuGVFcBxcEEmbSYM47GWt0bf6MoC17WqJ/ZUwpCnNwb
 XWvXWAXcel1Lz0HXBAPzyWVV5pLIT8QFF+1dqg6divVZ/wpjvTXvltGktF7TAQny4Q0Q
 MY5g==
X-Gm-Message-State: AOAM531S3tlv0bwjDB9vNgqk738EqoyeFy73YWtfvHSw3n5rkh72Bl7t
 0dc4UwvfA6aKkzPWTs+y3/k3oreN6ko=
X-Google-Smtp-Source: ABdhPJzyCYrC7TuBm5EhIMHhgLuScHVn8VOE2ByqJxkbO4blnJZQ6/ILuwg9kgsqJjc4go8jENEGZw==
X-Received: by 2002:a5d:6b8a:0:b0:20f:f515:98d6 with SMTP id
 n10-20020a5d6b8a000000b0020ff51598d6mr7283376wrx.527.1653516313685; 
 Wed, 25 May 2022 15:05:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a056000188b00b0020fcaba73bcsm36586wri.104.2022.05.25.15.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 15:05:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 00:02:02 +0200
Message-Id: <20220525220202.357390-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dhcp: fix build without atomic
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

Fix the following build failure without atomic raised since commit
fde21979427ffeb4fe9c0068310be195f2dec5ec:

/nvmedata/autobuild/instance-25/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: cannot find -latomic: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/db6/db6923915e36bcdb2953a3cdd2b450fa10794631

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcp/dhcp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index cbc95cb152..9628ffbe2a 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -62,6 +62,12 @@ else
 DHCP_BIND_EXTRA_CONFIG += --without-zlib
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),y)
+DHCP_BIND_EXTRA_CONFIG += --enable-atomic
+else
+DHCP_BIND_EXTRA_CONFIG += --disable-atomic
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 DHCP_CONF_ENV += LIBS=-latomic
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
