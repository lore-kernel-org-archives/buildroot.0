Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8A2EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 06:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D8C822E3;
	Wed, 12 Jul 2023 06:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D8C822E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6ACe-NKEX-L; Wed, 12 Jul 2023 06:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A801822C2;
	Wed, 12 Jul 2023 06:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A801822C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4FF61BF47D
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 06:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB8A560B69
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 06:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB8A560B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JDVrttbRslm for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 06:46:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7332A60B2A
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7332A60B2A
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 06:46:02 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-783546553ddso210462939f.0
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 23:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689144361; x=1691736361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5OLoL51+c13hVnZUHwbXJ28BYDEfRzAeuIr3Z48fSe4=;
 b=bui4YCWCds8+Ai/roK7wQSM7fJIbjhk5uUMUcpKKMBOlSjE4NWfnollWQg2JNs8f2G
 uTRp/LABBopTvO//+0cG6cWDZI7zMoRnKAMRJP+8ifyDkDvBEla0jwLag1EK725eG1Ek
 62A4btN/ooaXh02tfunRgmXAAe+ra3oVLKoOhKnwr033E8HyJh0qQ9VkhB07xz/kuOSF
 Vmri+hBaOzhoojXKA97Wq/R8aCZCA3w3Js7cN7aVDr6lR29Q7QWoOMNPbKBSyXGqHg15
 owhVN224Y+7xPJHC2z63qzOgRFH0utTmyulnlOUlxEBJFNjnPT0ggHS8OYiz6aFP9Cyp
 RCZg==
X-Gm-Message-State: ABy/qLY+BadcyoxZEBReDCm4avPfNYuf5ox6aUmLWsOLSVQ5axfTaEaA
 VLs/g/PWXB9GbtpTq+4V2NdG8s/L12Y=
X-Google-Smtp-Source: APBJJlEgnybb9cTdHRN42rPgrpZiz942KZEAON7rwL/TQMw+C7lRYvd/X0s20ax8Lc8DiR+e+YvBKQ==
X-Received: by 2002:a5d:9c97:0:b0:786:e966:5694 with SMTP id
 p23-20020a5d9c97000000b00786e9665694mr13239429iop.3.1689144360986; 
 Tue, 11 Jul 2023 23:46:00 -0700 (PDT)
Received: from james-x399.localdomain (71-218-225-212.hlrn.qwest.net.
 [71.218.225.212]) by smtp.gmail.com with ESMTPSA id
 gv20-20020a0566382e5400b0042b144abf71sm999650jab.179.2023.07.11.23.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 23:45:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 00:45:57 -0600
Message-Id: <20230712064557.1371058-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689144361; x=1691736361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5OLoL51+c13hVnZUHwbXJ28BYDEfRzAeuIr3Z48fSe4=;
 b=L36Ez7WAzpfN0AyFcsi9kLFyX3SCgOa4qOCQoqzbZitdt/hSDXuSIPZPwC57QLCbXc
 w22B+tPe7QvHochlAFoQ3kmpwQR+Z1+JSqStcw6VfXGnURX2+C8rXtuWd5xbk9uluI0t
 cbZfGPEGwYYvTWHaYUxZEqFyh/FGWcVbvLVw5dXe3aKUHXoG+lya96ZtzTjfzLjCcVRl
 qpUhqQxQAZtVfBfyWrjrOw6Bdo0fr0z3+u9FMZwso6FCAnkU98ewG63b2k858zpZks8C
 baglOfaHGQP4meFyj+uUVoL1Ks3pc4a6VCmQavGHu+1cNgAjTR2qH+WlOVIjC0LBkq3O
 OFsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=L36Ez7WA
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: bump to version 2.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/zxing-cpp/zxing-cpp.hash | 2 +-
 package/zxing-cpp/zxing-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index 4018e95fde..6c6917ed86 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  12b76b7005c30d34265fc20356d340da179b0b4d43d2c1b35bcca86776069f76  zxing-cpp-2.0.0.tar.gz
+sha256  6d54e403592ec7a143791c6526c1baafddf4c0897bb49b1af72b70a0f0c4a3fe  zxing-cpp-2.1.0.tar.gz
 
 # License files
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index b11814d114..8256b1a254 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_CPP_VERSION = 2.0.0
+ZXING_CPP_VERSION = 2.1.0
 ZXING_CPP_SITE = $(call github,zxing-cpp,zxing-cpp,v$(ZXING_CPP_VERSION))
 ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
