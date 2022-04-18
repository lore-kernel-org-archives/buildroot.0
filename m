Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333A5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 21:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B22A641E4B;
	Mon, 18 Apr 2022 21:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggUA5e5OKb8O; Mon, 18 Apr 2022 21:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 726D541E14;
	Mon, 18 Apr 2022 21:56:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56D3D1BF2F1
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 437EF41E14
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlhCnw6qiVNX for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 21:56:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A7B941E0F
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 21:56:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so239761wmb.1
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IV/YSh8MWrRu7Wj5+QzvRGuqvFoCSfYmAlIzkG+xvUU=;
 b=SvuPgLswhLRp53acxkmNtK0tSWNNmPhSuSvH6UnqnmbbVUgdUXV7dByL58jU35fcXe
 2X8gn0oSyYTo+sQy9RX7qSvNW4X/HbW3lDvdKjg6pyzC5aHGeSIWLzFJSZHU+6jk8FJC
 3bhWuw3lxTfH7O3Ndcv+SRmL2VJiti8AbN3NzYXviAKDQd0EjLI7D09iy7FSzdCSEFQU
 WyICE6pA9oQ22Dz1llrkIzNYZKwtVToZOd63532lDNlDXpFfURhUe/gSyKeFooG4gv8L
 gfIRFaIYpWXUWe1ePs1a4mzI0f+emjw2jkpviftxWcWh+z91I2wZDSNeXgK6fpQmKBWs
 l5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IV/YSh8MWrRu7Wj5+QzvRGuqvFoCSfYmAlIzkG+xvUU=;
 b=QfbeFOYySd3aomPnbw1gOzP1lP3beYWILIO/Yh7534/8FELgFVtJO0+qtJtnJnv1mL
 ylC5gpvNEqBiVkuLxktKQXtrcXHDUlN9UKUEvob/VWSraQBYnDxctwe2X72JvBq7M8CL
 9U8GnZOkebNry1RPLOuc+Ga/V5aupr3L8wzOL8itxb6inwSW65vYg2uD8l6aRw7gAbls
 6RLMMDCo9La706fReCNEnsVmcJhMmQEEWQRYzVni3NJ9e/lMJOX0PcAJkBYRQSZtWsCs
 4uAIen4lJy6bNyn6NEPBqntnYX8aEw+Lry9ToaYx5sf0pPOGVEK82tATF9lJ3XtH/HAs
 RRnA==
X-Gm-Message-State: AOAM530chiTGvQYYDrN2IK69yER3QiH63vrk2K5S45Uh3dldLkwRL9Fq
 4dvPZwcLLI+QMdA9EYpgxH5Q5jNTSBM=
X-Google-Smtp-Source: ABdhPJzat7JjUTPUSWCA+MA7/JR4M+2UBTvumS2+zP4XlksDMjwyepJSBhRBFQYtkFZHhSTVAl+zOw==
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr17007302wmb.29.1650318968104; 
 Mon, 18 Apr 2022 14:56:08 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600002cb00b0020a88c4ecb5sm6625751wry.3.2022.04.18.14.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 14:56:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 23:54:12 +0200
Message-Id: <20220418215412.892842-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 1/1] package/mariadb: fix build with libressl
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

Fix the following build failure with libressl:

CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
   LIBRESSL_RESULT (advanced)
   LIBRESSL_RESULT__TRYRUN_OUTPUT (advanced)
For details see /nvmedata/autobuild/instance-27/output-1/build/mariadb-10.3.34/TryRunResults.cmake

Fixes:
 - http://autobuild.buildroot.org/results/cbdbfcdae4b89ac678e1bf6bcded96872c7223ab

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Prepend "LibreSSL " to $(LIBRESSL_VERSION) as
   libmariadb/cmake/libressl_version.c prints LIBRESSL_VERSION_TEXT

 package/mariadb/mariadb.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 4eb9c71827..18667e7e70 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -60,6 +60,12 @@ MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 # Explicitly disable dtrace to avoid detection of a host version
 MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
 
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+MARIADB_CONF_OPTS += \
+	-DLIBRESSL_RESULT=ON \
+	-DLIBRESSL_RESULT__TRYRUN_OUTPUT="LibreSSL $(LIBRESSL_VERSION)"
+endif
+
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
 MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
