Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3CAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 21:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9AF660E70;
	Tue,  5 Apr 2022 21:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_0unCWBcoI2; Tue,  5 Apr 2022 21:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E73D860D5D;
	Tue,  5 Apr 2022 21:59:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 169031BF20B
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3E4B818D4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTn6npdGHqiW for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 21:59:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD799818CA
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 21:59:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so509254wme.0
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 14:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tvzwxnc8rJ8gTdIFNHOZsyUSGYh2fLYbMWWblITQAgM=;
 b=A5buo9VGF1SkE5k49ex8M8OUu/UcKaqWWaZ9LaDnYvrXjZYow4jBMRhLLX/3m1Hgtf
 mgxs06/S9Dz9BCsyjagA4TM0/YNAZR/J/0AFPd8JN5IVE8FAO1FI3oXrt5+vlhYTQVZL
 f9YngCcB6Hcmufh7lfrIXdzkEg1+ggwk6Wh+YRfKopl373HBMHz39Lti5TBkwCcA/Rj1
 azDVt5g7DeVss/6xSyMxaDVM/in7mKRAYSjS2E36xF1g9mYucw3lbFxt76T3js3zI2ke
 5bHur3rqraI3q0bCjoyq3eO/y1EazRV8O/ZT1fqKeLsn8hoThLTqYtQzVn1ZQyX7F7Im
 kglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tvzwxnc8rJ8gTdIFNHOZsyUSGYh2fLYbMWWblITQAgM=;
 b=wzmxX0X9yiOBPuWk3IS4MNOdEIKcuKEgMLGPPqMSq/jTxG/gIn7CGNTPzNp7bw8hi1
 O6sP/odcPkJTDmSuFhpPZxKqCmWI3CFcMn/n4Z+yMzUwiiOcUYNAdaEUu90zHI3ZOxSZ
 sXVpsmH20Yt6t3MH5GMrdn2oqX+FojXRJo5S85PDtl5Wv9y7AmizkgTmh+3axMCfatq1
 uAJ3szde85LGaF9Au0znWXqdotBkbnp8kRQg3zNyZUAk6yOZrqrh71YvVQPZ71TQ8y2F
 Fe3SUatLgtX1WGmSzNWTcZgNqAYDYai/c+UGYuk8qS/+59Z5EMtSa7TMVoHJZaQKewCL
 07NA==
X-Gm-Message-State: AOAM531uJcMZS6YW2yZl0f7dI7DsdaiasVEoTxVCMYSF2SCFmA2ECn4/
 WM1MF88pAA54vRMMquEBejhIDWrw9iI=
X-Google-Smtp-Source: ABdhPJwpw6OmOIjnyz+9+IvKvX4E5OlNn5zMgaqc+Q55EROM2CPNHrXczSG1v+rhKfrdAcGNOJN6Pw==
X-Received: by 2002:a05:600c:510e:b0:38e:346f:8a46 with SMTP id
 o14-20020a05600c510e00b0038e346f8a46mr4651835wms.153.1649195970753; 
 Tue, 05 Apr 2022 14:59:30 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 61-20020adf8143000000b002061d8d807esm2992944wrm.87.2022.04.05.14.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:59:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 23:57:52 +0200
Message-Id: <20220405215752.2803676-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/postgresql: fix build without NPTL
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without NPTL raised since bump to
version 14.1 in commit c9bd02911565819789120370178e82da5dfbacc0 and
https://github.com/postgres/postgres/commit/44bf3d5083e151d772c5d6f656e3e162f573dced:

In file included from pthread_barrier_wait.c:16:
../../src/include/port/pg_pthread.h:31:3: error: conflicting types for 'pthread_barrier_t'
   31 | } pthread_barrier_t;
      |   ^~~~~~~~~~~~~~~~~
In file included from /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/bits/uClibc_stdio.h:114,
                 from /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:71,
                 from ../../src/include/c.h:59,
                 from pthread_barrier_wait.c:14:
/home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/bits/pthreadtypes.h:135:3: note: previous declaration of 'pthread_barrier_t' was here
  135 | } pthread_barrier_t;
      |   ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/70acbe121236ef0905c4466d4f7a0839723d2c49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index c389246f80..1dfb20b58d 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -38,7 +38,7 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
 endif
 
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
