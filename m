Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FD5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88CC840270;
	Wed, 27 Apr 2022 20:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4K91jdpUrdy4; Wed, 27 Apr 2022 20:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E0E400A5;
	Wed, 27 Apr 2022 20:53:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A51E1BF869
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37604400A5
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTbcGlmcJFpj for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 20:52:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1ED240088
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 20:52:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso3139875wmq.0
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 13:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktmgbgV7RfzLA9reVWy/418t1+dWcsHI5NTe5pZ9AWQ=;
 b=DVIRk4Ip14dKRauYVo9yF93isoP8gge1sSHzjhE11uthpH+z5+6bc+HSGsnRrE5UaL
 /Br16jXmkChI/CMHr9BInc6DV0lM93BdkohrrUjF16uL9k/RRZFIiEB8bb4JDSXQ8xOC
 bmREdWFx0HBVSVpCKtPuX6AN6rNpP4AriYgp81CyQuur6wiKhwfLHzRNClVAPt7+Zlp3
 Gg+1EXsKQzXOGf/PU66fWNxNoDyDrnC4ZUo/D9aYfqTV1+CW/beIwgpM0HfLWf3SLLbD
 oImlJjM8FC6WlmKKLNhYXVeCpMoC8PrMbULKUk4FDbJELPUAK3vTP8Ritw4vHQbDLuPI
 VYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktmgbgV7RfzLA9reVWy/418t1+dWcsHI5NTe5pZ9AWQ=;
 b=wX80yLrGuOb370tLIC5xE/QT73YkQq4uvVkuXhp+XPjOcHmAiwQgLpoNTTLXAqNfnM
 Nt9neSfqHhTdWlAqavMWbwQyVj6w5y3mTRG7aiOh7hu9sIM/6OK19HfcZTEFmPbvV7A/
 xKxhzKs5s5fbIxe6lr6d1Qje2vI+3kjQXDhmIG/u40IVHKXBigx74bG9ydX+eq/MpcGW
 HzojF83VYDZc4dRypkoLe7A6fyn9cGf+dWouFn7i0+7NRkP1t2wD2xTBENBttafNotYG
 oAJpBdlOSuioUnm4iq5Y2yVd511tBz04UE7SsTlnLa56rJzkcL+jLoKmZJcURl6nS4pf
 FCmA==
X-Gm-Message-State: AOAM531aZG05S4ffUJ4tLuHVkstQL/gpVSEy1HvUQy9p1tpSq4+c7E3K
 /Sza7R2Pi7/ajbcGUlWdcROu3hThIkE=
X-Google-Smtp-Source: ABdhPJwmWMmjIPVgW5nclW5SZH/beEBhrkekop1ObrUmwZKQZlnoEdLEEmTWwHg8QcJauSGrLR1Z4Q==
X-Received: by 2002:a1c:35c1:0:b0:38e:c4f6:1931 with SMTP id
 c184-20020a1c35c1000000b0038ec4f61931mr27391645wma.161.1651092776459; 
 Wed, 27 Apr 2022 13:52:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a056000178900b0020a9f995a3csm15341784wrg.24.2022.04.27.13.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 13:52:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 22:50:57 +0200
Message-Id: <20220427205057.4044072-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/numactl: needs atomic
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

numactl unconditionally uses __atomic_fetch_and resulting in the
following build failure on microblaze since commit
4ed540ddf59bec4b389be44d7f42820d2466904f:

/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/microblaze-buildroot-linux-uclibc/10.3.0/../../../../microblaze-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v1':
(.text+0x2a34): undefined reference to `__atomic_fetch_and_1'

Fixes:
 - http://autobuild.buildroot.org/results/e225cb83dae390d9dc543d4da85c52180efbd40a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/numactl/Config.in  | 1 +
 package/rt-tests/Config.in | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/numactl/Config.in b/package/numactl/Config.in
index 23cf7facb0..325a05d609 100644
--- a/package/numactl/Config.in
+++ b/package/numactl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NUMACTL
 	bool "numactl"
 	depends on BR2_USE_MMU # madvise()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	help
 	  numactl allows you to run your application on specific cpus
 	  and memory nodes. It does this by supplying a NUMA memory
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 8efa3d194e..ccfa040d70 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # numactl
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU # fork(), numactl
@@ -32,6 +33,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 
 comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 4.5, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
