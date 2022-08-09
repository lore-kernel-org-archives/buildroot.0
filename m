Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D969C25B06
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 19:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A667B4018B;
	Tue,  9 Aug 2022 19:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A667B4018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Gg9XjjNr3E0; Tue,  9 Aug 2022 19:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9FF94016B;
	Tue,  9 Aug 2022 19:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9FF94016B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5291BF31A
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 19:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3338060AD1
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 19:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3338060AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwpkdJ1yy4oq for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 19:09:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2308C60ACF
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2308C60ACF
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 19:09:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 ay36-20020a05600c1e2400b003a4e30d7995so9364204wmb.5
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 12:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=4bDg0hGRFwJ4RNLy+4NqSN+rfoFRBNScYBNY5M5goxo=;
 b=IJzkCj//xsGbV+7st4M8m8o7uB/0U67fmysoBwYLwGdeExdq/tFVmH0ttBHrKfK5SJ
 SyyjDhXopWUu+fUf+YwoMUt0rG/o2lECBbd0Fc81lOBxMaSyMRiSU4JK3M2t/VVMVYy/
 YAI/9L9PkBjaWZ6jeG4rNvHFIEzw4Tzxo/KR1tnShfY1aLzM9TrtzntbxjOse5h86akW
 rZXKXHuocNa1eyJqZq1YxhROSHhRLjglySAnWKIGBWszIJwi66EhpNb/LtSWsxumVqcP
 4+roS0zq3EJjbLKvjxFVM8sn2SYon69UM4rJOHlBc9ejU52InySxDKZSgxWUpJ4mWt+C
 qqlA==
X-Gm-Message-State: ACgBeo1sT2MmPcj2i5PHNQCIMfgOEBYD09N6hvefTE8NBmj+/ZbLn1qq
 VnP0Itm/WYa7GDjPqKqVVNZ3HOUASJ0=
X-Google-Smtp-Source: AA6agR4qeUvgrHNyG2yEaJ3XxPZpZFb4hmr6adHLaXgmrNlf5nQG6J36sCtog4alfDJ/2f1+D8bsUA==
X-Received: by 2002:a05:600c:a47:b0:39e:f953:84e2 with SMTP id
 c7-20020a05600c0a4700b0039ef95384e2mr20992688wmq.202.1660072183144; 
 Tue, 09 Aug 2022 12:09:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a7bc452000000b003a53da4ef8bsm7826051wmi.16.2022.08.09.12.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 12:09:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 21:09:26 +0200
Message-Id: <20220809190926.2535336-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=4bDg0hGRFwJ4RNLy+4NqSN+rfoFRBNScYBNY5M5goxo=;
 b=EVemq1wbRLH+76VBSrXmYL2spnIEBqMTw0n5b2l3GT0VdHbk8U1zzV/55KIeBkIwfv
 yGOTflI0DYXxiqTqAWCCIx/Whu+OwIk03W9ERtUh8f8CtWvS4Tq8YTU5vAJnTDiUZCGh
 uf6D4mxN+FJmSQxSlZOm/B4sxvXOxnw+mtIVdqJhYwU7+XEP5Bb5qdlnr7XnvIgSk8ij
 1U/NAZdHCJbQxMtxq4KuxSVHajibBLHWvNeMjYUbK/hGSWYDaRITgL3YQ35+9p2KbszA
 DXi2t5ImKuV8iuUIMC2I8wWHECANzEN4ljP6j4cJh3k0ZHhBhGf63omvCqv4yZhpdlkX
 6sVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EVemq1wb
Subject: [Buildroot] [PATCH 1/1] package/gauche: fix build
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
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 9.12.0 in
commit f2eb56459ed3d8f5fdb026a31fe85e8df7d3b42d and
https://github.com/shirok/Gauche/commit/9601603db7aea7bb6e075b4f7f09210a919a35b5
which deleted the internal libatomic_ops:

configure: error: libatomic_ops is required.  You can either install it on
                  your system, or fetch and unpack a recent version into the
                  source directory and link or rename it to libatomic_ops.

Fixes:
 - http://autobuild.buildroot.org/results/4c7a1b690d1b12e39b6b24f8cc8a144f79c73711

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gauche/gauche.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 7c43bd4573..b635c488fe 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -12,7 +12,7 @@ GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 
 HOST_GAUCHE_CONF_OPTS = --without-zlib
-GAUCHE_CONF_OPTS = --without-libatomic-ops
+GAUCHE_CONF_OPTS = --with-libatomic-ops=none
 
 # Enable embedded axTLS
 GAUCHE_TLS_LIBS = axtls
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
