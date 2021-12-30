Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED901C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 23:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88854410AC;
	Thu, 30 Dec 2021 23:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnBvccF8875k; Thu, 30 Dec 2021 23:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAE50409EE;
	Thu, 30 Dec 2021 23:00:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4366A1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F1A540178
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0T9oZbpFpYo for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 23:00:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A5F040373
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 23:00:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a9so52932930wrr.8
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6Myc2devEZ2FuK7696oa0DCIbg4zxOqwlO5uG9Hu2E=;
 b=SJZ8dKy60BvT4hMkhTp28pf1JrvXI+7OZr7vlxPGfombzSguybntpfWSRIxb9h5YIz
 fiaVdkNqpbquqYa6n5hsGHMXk6LxwmQPf/8+5Vq7n16GEGX48VZGPeEn7kfut8ZFENF6
 dIEv8Nc5YPxdctkUMU6XQO5Ej0MQN7xuUzIaGpsgVYq5yNKdWOcZq9Das52Wc7/2UYk+
 eNsmkzhJEATwzy3/Ksbe7RjT8eBZR/VYDZ3ZabkckOg/WynA9UykuG6d7pyDMTPALcar
 lA1c8tf16D1ZJQRgJGjFzGj3lREgHuvV1paScxCygdlQD0avoFj/kxhDs5vdZ9GBr8sJ
 mieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6Myc2devEZ2FuK7696oa0DCIbg4zxOqwlO5uG9Hu2E=;
 b=xebPEkdW33VjNhyUN6qOyV8T7ntl+wmZfEUauptGzZe1govIfwrwY6ESVwe21OvYX4
 eJddNc44Gvn/nxCqQgRC4dssyUyfizd/P6FQg+B8VfiN7/z89EjAney/AzRPp+h/su+I
 lXYQyltLGorsNo90fl82DbGqxkNsgmObTCH/MRnVVBNFltM1FxovDvc0Ka13YlOEh5as
 SgdALuKfFpAmTYLzvpc1GdiKROQJn3NvmBfGHBjVl0qhOcSe7XzZU5wMgZZ2z5We2XOC
 +VF38nevNwkOOLskccSyZ6H0jNe2Vso4GiCM9JCjGHCbyJLAZVnWWSMtSMpM5sQMPVK9
 BEvA==
X-Gm-Message-State: AOAM531R5DP1KtmTtEuOt5ChiYoYECkhGybYD4cf3ZEXLNL0UUoVrGru
 /+Rtc0sLRGgsjscBp6OPLEvKixEtutA=
X-Google-Smtp-Source: ABdhPJyhs+2BXPBjco1sSV27/cKdzz0INgyWo/jjEMuKo2xg76QXYiNzu0o8BFEwJRx26aAVyuRizw==
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr26400784wrx.569.1640905245358; 
 Thu, 30 Dec 2021 15:00:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id o14sm24613934wms.4.2021.12.30.15.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:00:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 23:59:58 +0100
Message-Id: <20211230225958.3089672-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gawk: bump to version 5.1.1
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

https://git.savannah.gnu.org/cgit/gawk.git/tree/NEWS?h=gawk-5.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 91e506607e..894c939c5b 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.1.1.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd  gawk-5.1.0.tar.xz
+sha256  d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2  gawk-5.1.1.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index ae2bbe5422..b55c74d00a 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.1.0
+GAWK_VERSION = 5.1.1
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
