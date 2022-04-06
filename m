Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E35C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 16:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7886111C;
	Wed,  6 Apr 2022 16:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7s4GlBT4YOV; Wed,  6 Apr 2022 16:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA0DC60EDF;
	Wed,  6 Apr 2022 16:39:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79BDA1BF593
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73A3F833AF
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1YApWnUBHlQ for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 16:39:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 784F18338B
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 16:39:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso3994307wme.5
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 09:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NOPJMjg4o51qe0Dm+T81+pLFKK8m21zffz88kxmBNbg=;
 b=o8tiH4Rczj/BnB9Nth76cxG3FrvpMEoL5uCAir3w70BAQIBABvEUD2IBJeP4IJ+jVa
 uBJKYoibqRqEe1Satocj6sXHm3B+hafeNUebPW6tiuyQY2O39ree5lJaznYbywr+Rlg4
 W5CN+YYdktLfa33O4cKjgIxlaPgKoDCfSBGUcWPs+zb7c/wr8uJ5yzKnTHT8KO0AQAv4
 jzd15E4jhYpm5prfIPYbpiM2BZzqqYrtirtaq6+VCbqnc29app5vW8BJon0V5kHRxgWB
 1G6RXqtuGM2nC8WanjwN/ei/D+0UaT8yytgL7vFaXhLNtBReaUDI/kgNm3y8MmoAtuPt
 1/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NOPJMjg4o51qe0Dm+T81+pLFKK8m21zffz88kxmBNbg=;
 b=dOuTLKilD4kjbDk/0fhfX+23ArekUANJuxL9ODByz/XM9IcWfA+9hoRZJH64eOkSsZ
 9EgXSn95gSFzqEr2YkHOmoB2o1Pfig4pjG8AWvJQR6rWJidIasc7Rzv1W2KkmD1cIW/E
 FSUNZzqYEJG2ISZwa6JXcUNIQrPe+wtBVmbMNTNxwZ2WC3NBkWObPFTME3tP/o62v5uk
 V9B5hdFWcrSNWg7uLH16XfTp2oRKbJV6LXyR6Z0n/jXC2Aonp2EEgn+AlvbnXIHGKyU4
 ZvQSKNFvyck3aGkwEAXKN+XssIY1i4+BdRlWcBCKtMcGq0Qsn4QZHlBiFJdkahZO0cVo
 Poow==
X-Gm-Message-State: AOAM530WmeKs1QbwHMZ5UVufGfAehEB2VmAGK49PiFE7/Imqs7kyLZt4
 oxpyMvo7aWQLHzY4ysfNgtO2ArGoITk=
X-Google-Smtp-Source: ABdhPJz3pt0qHKDZToMocWr6vwUNDSb9B+rshnPBA7n8hJ7NsS+aqUmK0Or25b7n0LRA5OzPPtV9VQ==
X-Received: by 2002:a7b:cb83:0:b0:37e:bc50:3c6b with SMTP id
 m3-20020a7bcb83000000b0037ebc503c6bmr8500908wmi.67.1649263153433; 
 Wed, 06 Apr 2022 09:39:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n66-20020a1ca445000000b0038e785baac7sm5238264wme.11.2022.04.06.09.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:39:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 18:37:29 +0200
Message-Id: <20220406163729.4007517-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix build on kernel <
 4.11
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

lsns unconditionally uses NS_GET_NSTYPE since version 2.38 and
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=de72df79d72fa906e71e2ac922d8745ff22deee5
which is only available since kernel 4.11 and
https://github.com/torvalds/linux/commit/e5ff5ce6e20ee22511398bb31fb912466cf82a36
resulting in the following build failure:

sys-utils/lsns.c: In function 'add_namespace_for_nsfd':
sys-utils/lsns.c:719:25: error: 'NS_GET_NSTYPE' undeclared (first use in this function)
  719 |  clone_type = ioctl(fd, NS_GET_NSTYPE);
      |                         ^~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/572ecf8e37ac733a4e4265f4f78f35230337278e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...improve-dependence-on-NS_GET_-ioctls.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch

diff --git a/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch b/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch
new file mode 100644
index 0000000000..8e79b8d4d3
--- /dev/null
+++ b/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch
@@ -0,0 +1,34 @@
+From fc686823b008bc95e2ebe904c706a117a03e2754 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 6 Apr 2022 10:38:43 +0200
+Subject: lsns: improve dependence on NS_GET_ ioctls
+
+Fixes: http://autobuild.buildroot.org/results/572ecf8e37ac733a4e4265f4f78f35230337278e
+Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=fc686823b008bc95e2ebe904c706a117a03e2754]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ sys-utils/lsns.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sys-utils/lsns.c b/sys-utils/lsns.c
+index 1a7e9f333..75625b3a6 100644
+--- a/sys-utils/lsns.c
++++ b/sys-utils/lsns.c
+@@ -40,7 +40,9 @@
+ 
+ #ifdef HAVE_LINUX_NSFS_H
+ # include <linux/nsfs.h>
+-# define USE_NS_GET_API	1
++# if defined(NS_GET_NSTYPE) && defined(NS_GET_OWNER_UID)
++#  define USE_NS_GET_API	1
++# endif
+ #endif
+ 
+ #include "pathnames.h"
+-- 
+cgit 
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
