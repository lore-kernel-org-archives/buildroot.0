Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE995C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 11:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 621C68401F;
	Thu, 21 Apr 2022 11:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vh_28XTAQj71; Thu, 21 Apr 2022 11:57:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5538083F3D;
	Thu, 21 Apr 2022 11:57:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D15801BF9B5
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF61160C22
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCakp2q3uFkb for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 11:57:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A06BB60881
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 11:57:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id y21so3048905wmi.2
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jp8jY3iIvAFv1Hgz2zvUcN+rXGHwoMGnWHCX/DdQxcI=;
 b=PZkSabC0Wm4/5i8vCPpRSOR+47oXYq/Ref9KDFbE4VWENOxJVldN7T/fmMFRDM2v8k
 KWHExj66KklBLtJ04rFNNKi1O8Qxm6PCBgf+5uIaEz/8D7TlOrzkL0IUPigYZZfGFc2C
 xe9LXUxez1vXFSksRqCsIyZZPGTj2tXK0scfHVgUMrxsB32jVs7ansMPL4JQIOkLRAfA
 tUbNWqyQoysOiTRrndCt5ZoDaf82ANtRaDSGnVIUzVX2hnLwihi8PJp/UNuuFNJSqrNc
 BskrxSirpVda9IZWtdmSbTXWbJE+hAmX3OE/O9nvV3h8rCwhhTsRwUhxm86pbWLXk+3M
 cJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jp8jY3iIvAFv1Hgz2zvUcN+rXGHwoMGnWHCX/DdQxcI=;
 b=iBoaRoJI9EgLbNBXYegDV1qR7OpfkebejN/y0y+/UM6mjlht+DsbreSLEvrdpkSUOK
 47V+ueoeX19Yfx/9jaOGm/qJ6YKsjE4+/nleC2n/y/d4UQbilb2j0M7q/GP50Bhhcudu
 18Qxvt/rWB5C5ldaZX1vJHIWJWesRndacA5rLoC9kRrpSoz2eLNr8wnKjTkRCcrh17wB
 T8ecMbaztCR/dKfLT03Rxvitv7DLfW4Jfh7xjl+04qiH1i8Dq9LG6RczgILfb4TzoAS8
 h2KggJNtOcURbn720vPG6rTDVPT21MBF2dUWBcmVgtZ/nvqBKsRUhxk+bVlCkaayVC3V
 g1yg==
X-Gm-Message-State: AOAM533kJXzmoOP3AfELJ5VgWAkOzLejyefuDNT2gj91fdZLR7axPRqQ
 9yakqNaEhHVPpFZk7a24x3LHy8y9CnA=
X-Google-Smtp-Source: ABdhPJzFbKiecRFTPyAgCINX5l/AnXcMbfzbG6m+KUqYqt5Cmt7mVCvYdDhqKeiDZXGWR5VKxUJsIw==
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr8093060wmc.94.1650542255385; 
 Thu, 21 Apr 2022 04:57:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05600015c600b0020a8f950471sm2698427wry.115.2022.04.21.04.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:57:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 13:55:29 +0200
Message-Id: <20220421115529.2625137-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/arptables: fix build with
 BR2_OPTIMIZE_0
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

Fix the following build failure with BR2_OPTIMIZE_0 raised since the
addition of the package in commit
efc10eb6b87884f1f7917462d78af6953fcd99e3 and
https://git.netfilter.org/arptables/commit/?id=369afc14de1d89ff5627ff4c5f72f6f839244b50:

libarptc/libarptc.c:48:21: error: redefinition of 'arpt_get_target'
   48 | #define GET_TARGET  arpt_get_target
      |                     ^~~~~~~~~~~~~~~
libarptc/libarptc_incl.c:16:1: note: in expansion of macro 'GET_TARGET'
   16 | GET_TARGET(STRUCT_ENTRY *e)
      | ^~~~~~~~~~
In file included from .//include/libarptc/libarptc.h:7,
                 from libarptc/libarptc.c:26:
.//include/linux/netfilter_arp/arp_tables.h:196:43: note: previous definition of 'arpt_get_target' was here
  196 | static __inline__ struct xt_entry_target *arpt_get_target(struct arpt_entry *e)
      |                                           ^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/730dce4101e7afcee233067e2870603cd64b8a48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tc-libarptc_incl.c-fix-build-with-O0.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch

diff --git a/package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch b/package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch
new file mode 100644
index 0000000000..29f2d714e2
--- /dev/null
+++ b/package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch
@@ -0,0 +1,49 @@
+From 7d8285ae92253017a15282dd25f76d76eed49518 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 21 Apr 2022 13:43:23 +0200
+Subject: [PATCH] libarptc/libarptc_incl.c: fix build with -O0
+
+Fix the following build failure with -O0:
+
+libarptc/libarptc.c:48:21: error: redefinition of 'arpt_get_target'
+   48 | #define GET_TARGET  arpt_get_target
+      |                     ^~~~~~~~~~~~~~~
+libarptc/libarptc_incl.c:16:1: note: in expansion of macro 'GET_TARGET'
+   16 | GET_TARGET(STRUCT_ENTRY *e)
+      | ^~~~~~~~~~
+In file included from .//include/libarptc/libarptc.h:7,
+                 from libarptc/libarptc.c:26:
+.//include/linux/netfilter_arp/arp_tables.h:196:43: note: previous definition of 'arpt_get_target' was here
+  196 | static __inline__ struct xt_entry_target *arpt_get_target(struct arpt_entry *e)
+      |                                           ^~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/730dce4101e7afcee233067e2870603cd64b8a48
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libarptc/libarptc_incl.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/libarptc/libarptc_incl.c b/libarptc/libarptc_incl.c
+index c4d5de3..441f2de 100644
+--- a/libarptc/libarptc_incl.c
++++ b/libarptc/libarptc_incl.c
+@@ -11,14 +11,6 @@
+ /* (C)1999 Paul ``Rusty'' Russell - Placed under the GNU GPL (See
+    COPYING for details). */
+ 
+-#ifndef __OPTIMIZE__
+-STRUCT_ENTRY_TARGET *
+-GET_TARGET(STRUCT_ENTRY *e)
+-{
+-	return (void *)e + e->target_offset;
+-}
+-#endif
+-
+ static int sockfd = -1;
+ static void *arptc_fn = NULL;
+ 
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
