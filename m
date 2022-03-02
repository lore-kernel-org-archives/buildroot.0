Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BBBC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 21:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0356282690;
	Wed,  2 Mar 2022 21:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MfOmP45p3FDS; Wed,  2 Mar 2022 21:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC5F823C6;
	Wed,  2 Mar 2022 21:27:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 056421BF3F2
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E892F60B42
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jL7pYIDtUKzz for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 21:27:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F08BD60AF2
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 21:27:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id n14so4794571wrq.7
 for <buildroot@buildroot.org>; Wed, 02 Mar 2022 13:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QvJHtxAaJ68fYVh3CSfaC/plUpmPVwUR0X4LNKHL8Ow=;
 b=GaTO69sZItp4RQ74jze4u3nr3Uxe3VAr6S+rHZNdkmP4RtOFCPYN3ZlqkhBS141MSp
 7IGj2NTJiC2nbD55oG8alnzk41J3hVXpJ1QuT4Npr6gZE0ocG+PhjYleLRBx1uo3x1bP
 q76yAjHt53ORzI9axsWPhO+8gxOgbJWmFZ4nSaFnKyG++HnLeOFiPgqnbUb0sLnQ36OB
 O+Yu4OjJY67F2s8V8mK7o37nCYl4UFFYuf9iEy/drV27Fzs9H9MtGBLmljmh4JSkPAO4
 5jqbt2EWEdv8aXmxB3sTQq8rXHS3hSAIdnDdVhw73oujmT2BDMJvOi03fCX6lP46jqpN
 9HiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QvJHtxAaJ68fYVh3CSfaC/plUpmPVwUR0X4LNKHL8Ow=;
 b=VqiTYV8RCjRr6lpoC/P6lo0rFmCwRxE6+2JHxcYvZKNdwJhyS0HRbcZbyPKTGJkuNN
 GHa2m19AQ2tAm5zB7Z64wCAe5QS4nvgLDxvmJv/71kLCKnh0vnSH2g24XfGdTRQKpNTw
 6CRqk5xgMQ3goSvfIvKSd0tdbhzKoaiangju+hJUw/YOI0lyeu3ac9R260nLoDGlc/Hv
 vv0iXmnsitDufB2CkmZDqJNNBI/yD+3cEYKjctJ3r0FxpE0+K0j+sj+Nc9jKI+t2mEbs
 Rf7cpOM/ZdW1PjwrLee56s0rV6bc45foHKH7nzgVg9oC2lf9ZO1xQiyHnvDa/pRCXyTr
 xFbA==
X-Gm-Message-State: AOAM532Ffv61vrjjqU/v6zX//+PK1cotfZl+dwLo19BIJx0/CNGk+Ban
 YkKimqJv7ICcp4uslFmnGmq+WYikhTE=
X-Google-Smtp-Source: ABdhPJy8NMwlR+gOtm/IuokP2Dx7dauMdOPzClRqG1ulejacnaXQiDOiDskRX3GA0sZiu1/wjOqjiA==
X-Received: by 2002:a5d:500e:0:b0:1f0:2509:ee3f with SMTP id
 e14-20020a5d500e000000b001f02509ee3fmr4575244wrt.381.1646256427878; 
 Wed, 02 Mar 2022 13:27:07 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a05600018c600b001efe4a49566sm122315wrq.78.2022.03.02.13.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 13:27:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 22:26:21 +0100
Message-Id: <20220302212621.2357671-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/libss7: bump to version 2.0.1
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

http://downloads.asterisk.org/pub/telephony/libss7/releases/libss7-2.0.1-summary.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libss7/libss7.hash | 4 ++--
 package/libss7/libss7.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libss7/libss7.hash b/package/libss7/libss7.hash
index 8e1d6635db..442422fcd9 100644
--- a/package/libss7/libss7.hash
+++ b/package/libss7/libss7.hash
@@ -1,6 +1,6 @@
 # Hashes from http://downloads.asterisk.org/pub/telephony/libss7/releases/
-sha1    7112a0717293fc273d5d488e1387ad28abe4e9b3  libss7-2.0.0.tar.gz
-sha256  5af00853cfb2bc6bcf050947804db132ae6872db0cd2ab24b5378828f78eda52  libss7-2.0.0.tar.gz
+sha1  301fd3eff4387db6407cbc72c3fec9aed5bc3860  libss7-2.0.1.tar.gz
+sha256  091f1c14dcf13a094021334218cde363041816fa5b5037caee38719e4e6891c7  libss7-2.0.1.tar.gz
 
 # License file, locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/libss7/libss7.mk b/package/libss7/libss7.mk
index 151b6a61b5..faa147c78e 100644
--- a/package/libss7/libss7.mk
+++ b/package/libss7/libss7.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSS7_VERSION = 2.0.0
+LIBSS7_VERSION = 2.0.1
 LIBSS7_SITE = http://downloads.asterisk.org/pub/telephony/libss7/releases
 
 LIBSS7_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
