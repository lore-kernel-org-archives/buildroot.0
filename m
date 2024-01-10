Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085FBC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 17:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8984483A6E;
	Wed, 10 Jan 2024 17:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8984483A6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJaRQa5r2gKs; Wed, 10 Jan 2024 17:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9E5F83A57;
	Wed, 10 Jan 2024 17:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9E5F83A57
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 932A41BF5D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CD7A40130
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CD7A40130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2p8JZ9kvCt1J for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 17:47:51 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B48A4010F
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 17:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B48A4010F
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e43e48a16so41415355e9.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704908869; x=1705513669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rV6ubs2qQawlxuCrt6zGI54uIWOevtKi9tQjL+Wd5YI=;
 b=QQuUZVv6UpuHHlYyojJtHgP/G7brX651sJCJ5WTNKpLbIJRKYx9YbwWbwd9WN4ORx/
 My9+KKeBip0V0Ti5VY0upEsbB1jYIcmVtrjs7wvmsFBfp2eH8yajjkrjYBJQhU5Hk1I8
 6kjR0qMYayrxtbgCE/saOCx3TRylNPD5Yz6/Q/3hnaH0F4h4FfT00gVKPPwVEyeU6F+e
 mrtgko1y94xoZe/02XYxfl38EjoJuymJ6zDvvPpenJ9yDizPvJIgiIjyjB5ng+V/qdbd
 KXoIu8Shc5loaaCCJ1GpIthyujyFaB6ey8X35ZmAv4Dn0PKyr7bQ4oEmOmq74rk0ruyH
 iFsQ==
X-Gm-Message-State: AOJu0YwoG9xrw7MPE5Oi1+M2gHynCNEQ4gwXDD7O79oO2NsiM9H5tsw+
 tzGGlElQTmiuHoekONPQfqaEGw8S+AU=
X-Google-Smtp-Source: AGHT+IHK06F34IdeVHh5Ka9bsvKzC9bb1HNabKpRVQCPo3ERJkveFcqxZW/2DfukkFL/oZ+GXNK8mQ==
X-Received: by 2002:a05:600c:519b:b0:40e:49b2:2c9e with SMTP id
 fa27-20020a05600c519b00b0040e49b22c9emr815885wmb.34.1704908868930; 
 Wed, 10 Jan 2024 09:47:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s15-20020a5d424f000000b0033743c2d17dsm5403428wrr.28.2024.01.10.09.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 09:47:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 18:47:42 +0100
Message-ID: <20240110174742.1130350-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704908869; x=1705513669; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rV6ubs2qQawlxuCrt6zGI54uIWOevtKi9tQjL+Wd5YI=;
 b=RPwJporwxhJWg+48Fc+ItKox7h1nhxIJZB0l9JUc1Gv2QlRtEKAO/rt+wlNOeTaUnr
 dxahksDj88RaJqUsU+FbJ/q5T/QYwaURXe0GJIYvlX1pVfJVBTqzDAodrv4aYhdR9xEY
 karvFRmq7gC32CQwHvq+YziX7GAlidFQSYc6gtHmucZ1UT8tHNVyPHGRHVTxnNVcVQiH
 SgW5fwdqE+8AEL3TwvLbOK9mpEsmrOs0SkKOBBd+wODMA8ohSYyWZkIcoC2KlprEHbIk
 rpbubNvGXQzRSyyM+7KTCFDsluyneVyKP9zEaNnUayNv2Ci7YQEs7grse2E06+lOeBac
 T2YQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RPwJporw
Subject: [Buildroot] [PATCH 1/1] package/sispmctl: bump to version 4.11
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to https to avoid a redirection because of HSTS

https://sourceforge.net/p/sispmctl/git/ci/release-4.11/tree/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sispmctl/sispmctl.hash | 2 +-
 package/sispmctl/sispmctl.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sispmctl/sispmctl.hash b/package/sispmctl/sispmctl.hash
index e22efcfbed..f6cff1910b 100644
--- a/package/sispmctl/sispmctl.hash
+++ b/package/sispmctl/sispmctl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6a9ec7125e8c01bb45d4a3b56f07fb41fc437020c8dcd8c0f29ebb98dc55a647  sispmctl-4.9.tar.gz
+sha256  74b94a3710046b15070c7311f0cacb81554c86b4227719cc2733cb96c7052578  sispmctl-4.11.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
index b6e156c66a..df39793845 100644
--- a/package/sispmctl/sispmctl.mk
+++ b/package/sispmctl/sispmctl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SISPMCTL_VERSION = 4.9
-SISPMCTL_SITE = http://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
+SISPMCTL_VERSION = 4.11
+SISPMCTL_SITE = https://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
 SISPMCTL_LICENSE = GPL-2.0+
 SISPMCTL_LICENSE_FILES = COPYING
 SISPMCTL_DEPENDENCIES = libusb-compat
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
