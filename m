Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFC4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 546AF408C8;
	Fri, 13 May 2022 21:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QbVUekGDFhmJ; Fri, 13 May 2022 21:17:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A0CA4030F;
	Fri, 13 May 2022 21:17:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 520FF1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40543402EF
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PpMGyMoVlkFx for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:16:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCE694027C
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:16:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w4so12880532wrg.12
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R6IStgn6KjCTymRctLEwFoFhbByoSB7gs0PZA7pW2dg=;
 b=Q30iXrrAik0DS/aKA2QQoc1l+WIEl0qDTetdsnT72KBEybjTBwsNuBGTULPZcLGDKS
 DsF5zIHjtnOS7S/o/ivdaGV6KKjkL5OMBa5s8chZoA+Zq5lr9GgXgGAg99mavDj9roRK
 0urcsFb6s8YhfoKP0Q06FewOSUzkd/0QMfiD7SAyYwjPZ+1KjmL+mO48qRAeLDGkwxZZ
 4IbgEgEuFUG4txq3SF6KTX4dW1F3LHreqWgMdIemORwB5eeQfbyoDc+dm8ouC2Hf9h9a
 wZomc8PfgRfeyyLRiD8m37brpe1qKQEUyf3k8Pl9XFfqeVnSkeoyQKg1Ohlel1Labr5u
 oC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R6IStgn6KjCTymRctLEwFoFhbByoSB7gs0PZA7pW2dg=;
 b=qQoBfP35Oy6pZNKDk1DrwaoM3vIKZ+doQIgxjY7aBh8Pa7aO/vfXIrjfIsPaI/iujQ
 fiFtWlJneeRDWWwR5DLQxynP4W7bG9tbAo8OLKRlyFLQ1bf5TXkc4dx7T/J4DI0R3/dR
 +rYZmUPuomvXfLXEpFNhfb++ygFbuCjXMH7W2tPENZJ4ufcJR/nKsB3DaO071aIyQB9q
 3QymL4hBT+te8JUUCB/8dAn8MCUh8UjtB9s6zXcQpwgIzSadjjFRETyQG1AdDRnxkpOy
 +5BmzdaK7zZuTDegMrAEEzVaPYdH0vvKJ2zm9sp2XsbWBHs/qMaEQxZTnJrIOLkcgAs8
 5ktQ==
X-Gm-Message-State: AOAM533Iiyink0Dg4gbqmPS/9eoUXp6/gR3bfjcx6QpbZeTlkdPVksUV
 KRG+OQiUuAPgzEIsxgB6z4VwELN33Bk=
X-Google-Smtp-Source: ABdhPJwbm5CKujVOxn9GeBodyRZW0J7+I96cLdtNbWiz8SbRrHIiX8F3cMV9eAkzVfldCmdJzTEDqA==
X-Received: by 2002:a5d:4f8d:0:b0:20c:ba84:2388 with SMTP id
 d13-20020a5d4f8d000000b0020cba842388mr5361396wru.487.1652476616774; 
 Fri, 13 May 2022 14:16:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adf9dc4000000b0020c6b78eb5asm2932800wre.68.2022.05.13.14.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 14:16:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:14:20 +0200
Message-Id: <20220513211420.942633-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to version
 2.7.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-24882: FreeRDP is a free implementation of the Remote
Desktop Protocol (RDP). In versions prior to 2.7.0, NT LAN Manager
(NTLM) authentication does not properly abort when someone provides and
empty password value. This issue affects FreeRDP based RDP Server
implementations. RDP clients are not affected. The vulnerability is
patched in FreeRDP 2.7.0. There are currently no known workarounds.

Fix CVE-2022-24883: FreeRDP is a free implementation of the Remote
Desktop Protocol (RDP). Prior to version 2.7.0, server side
authentication against a `SAM` file might be successful for invalid
credentials if the server has configured an invalid `SAM` file path.
FreeRDP based clients are not affected. RDP server implementations using
FreeRDP to authenticate against a `SAM` file are affected. Version 2.7.0
contains a fix for this issue. As a workaround, use custom
authentication via `HashCallback` and/or ensure the `SAM` database path
configured is valid and the application has file handles left.

https://github.com/FreeRDP/FreeRDP/releases/tag/2.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 28e733aa2f..2b7aa25999 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.6.1.tar.gz.sha256
-sha256  e4b3b93d102bc03164f592d26d7a06d6de648bf78b1e3dcbd8d62941431c1f28  freerdp-2.6.1.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.7.0.tar.gz.sha256
+sha256  89000728b6e66ac37db018d6dc5f0981b530fd550ab748877ff42892dd0c166b  freerdp-2.7.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index a1791b27f0..f4636724d3 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.6.1
+FREERDP_VERSION = 2.7.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
