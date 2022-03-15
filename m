Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA955C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 17:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48F4561006;
	Tue, 15 Mar 2022 17:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qmm5U2xI5hdo; Tue, 15 Mar 2022 17:33:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5509060D76;
	Tue, 15 Mar 2022 17:33:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD3971BF574
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 17:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A797E40A5D
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 17:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnlFX51FH4JI for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 17:33:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBA9F40217
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 17:33:33 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r6so29696432wrr.2
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ovv2OdwBwnR7DnWIt6K9GYql4NUPT90Ws+5JPLbh+h0=;
 b=UTQuoIlAejLZQwPfDnNhtPCTMBvxdD+hXJzW+MGFKxGgZh/LrLv+zLX3x0bXVrkedQ
 oWC7rgE3yz6iLMpSKr62UCNPbKFACctg9YW5u+/pow6E+/yCtqyvBAThUkKbIqW29HFZ
 +lQFuPm5kXCcqyCBSfPmrrd1mWWfvehSdZbJTCUF07uuUr2MTpD7YkCcDqNvA0pntaHe
 pHW+G2ApJ/gP4lEQLCFLMubKqTNqi5IkWwyXDQ6f4SwcqnYfo5iGlZJ+pDrGT8aaamoe
 P/uY0RcHsuPNm7jUrkrY7ti7JphvPhgqzzAUjn0/1p2zxWE3MMyluHDayDDEHVCMldJ+
 AiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ovv2OdwBwnR7DnWIt6K9GYql4NUPT90Ws+5JPLbh+h0=;
 b=XTMd0IqCzWHmhoh8e745vWRie9U4q1rgtdgmGDAhjut/tFnw2EOq8XHvDxQT/SwraZ
 5IBSK+XrABIgZ9gj0ielq0n11/h2xCOdGp2I/b1vaVfkrOL3YKSt0pyGIZavGc8/WS1R
 TrUYoQuvLnr/aeuViPkIh6QGIlRTeQYVmzzd8lVvaEVarcwl/Zj8GWZsqMoez2sf8c5x
 zYmRpg5ANhYqqSJKvhWfRmKYFtwbdmUubymBbh9pddpFArifhdrJOCfuhkvv6BjPUOHe
 etMuuPi6eKHJseAShyC922MIYWoBROhV+8d4JIYTfElrBu31arGbV+vXcsoWQuwBtYO8
 RWLA==
X-Gm-Message-State: AOAM531KNoJ9Pibf4Aq30W+IgbpKj+OwgcEf3465IJqwmm7f51bWvCxs
 d6Czu13+VJf6rjmJQSafUXl7i+SMWL4=
X-Google-Smtp-Source: ABdhPJwW/EKYJ+w9Bls78PUqkMejm+cJn0l2iwKpmj5ey2cCLyhtLvDNvDVSliv4bAw5uMvVmCNzYw==
X-Received: by 2002:a5d:4151:0:b0:203:d18a:7df4 with SMTP id
 c17-20020a5d4151000000b00203d18a7df4mr3734951wrq.1.1647365611705; 
 Tue, 15 Mar 2022 10:33:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm2838811wme.24.2022.03.15.10.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 10:33:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 18:32:31 +0100
Message-Id: <20220315173231.1943484-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/grpc: fix build with libexecinfo
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised on uclibc and musl since the
reintroduction of the package in commit
16ff948444c3978d63f483344a3d92d994c64312:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_stacktrace.so.2111.0.0: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/63ab2bc86cad03d5258492b17d1707078761d9b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/grpc/grpc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 23b92f1750..9138b4ea59 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -21,6 +21,7 @@ HOST_GRPC_DEPENDENCIES = host-protobuf
 # which doesn't do this.  These CARES settings trick the gRPC cmake code into
 # not looking for c-ares at all and yet still linking with the library.
 GRPC_CONF_OPTS = \
+	-DCMAKE_EXE_LINKER_FLAGS="$(GRPC_EXE_LINKER_FLAGS)" \
 	-DgRPC_ABSL_PROVIDER=package \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
@@ -36,10 +37,15 @@ GRPC_CONF_OPTS = \
 	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+GRPC_DEPENDENCIES += libexecinfo
+GRPC_EXE_LINKER_FLAGS += -lexecinfo
+endif
+
 # grpc can use __atomic builtins, so we need to link with
 # libatomic when available
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+GRPC_EXE_LINKER_FLAGS += -latomic
 endif
 
 GRPC_CFLAGS = $(TARGET_CFLAGS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
