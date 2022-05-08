Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0391C433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 19:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0703240930;
	Sun,  8 May 2022 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0joW71RLOdXs; Sun,  8 May 2022 19:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EFD340469;
	Sun,  8 May 2022 19:15:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EA491BF3F2
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 19:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A12960B98
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 19:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_fwp4H4fhx8 for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 19:14:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 450B360594
 for <buildroot@buildroot.org>; Sun,  8 May 2022 19:14:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p189so7292009wmp.3
 for <buildroot@buildroot.org>; Sun, 08 May 2022 12:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cCHOMG2A9zf+B7wOgIk9Q76SLa608xbc48eqOTWwk2s=;
 b=E6JQt5ppo3OFhXenxpEa7YNS9HzWJo0f4bq8oAWw5KgsvYTtqWcRDmvjCdkyjMk/Qu
 JlEfIAxihyyshVSojZ8CTc6cWlyLGNED+28qsAMyJO6+W37rAexj7ENu86QKeukYRL9B
 YVKeR3cN9qNtoKM09i4Z45TaYR52eqU8Ey0haQwvCwOVUHfHdoqZNK5mEm3DzWGjwW85
 194RphRs7q+UY8rK3Rpz/w9Qfci20TLS2ySjI3mDvvsR1f0D3/nw2VFOkxrHRgKNqvsV
 2AZgzgK0RDtayMgwJNisy0aUFK3wvBA7nkRlmQfmT9en9RqygSPjvkKUXv4FiIX+jB+Z
 F/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cCHOMG2A9zf+B7wOgIk9Q76SLa608xbc48eqOTWwk2s=;
 b=a31H/lLJSQ/OyzaTDq84BaqLUnSjYS4ljE0wa3UNDb1Zq4bawzCg3egpqDz68PQKo7
 3yz3s0kcgiFk5QafydHTOno7eApsinQhB0rQS+1wSa/DmVWrXORjuAbDhqle6ZSF1Ww9
 SboJc2ZPkETlZNwzhfTYEFFkK5p0Xzy47mbMqNk+nBy4cd6MVDty2BIHv7KiS/XdwVsN
 VOkmWBKycYqR8Uhf7fQlJ+193DUIMVoMW+MVROjvaZat0EY7iYY06r0+caIweZ0PGU1p
 AFE7WK0HQ/YjBNjbmEi3J4FYyHMW8fopf1/IGPl5wVUOG18StQO3Y02Qa2/jRIMdphl5
 OmQQ==
X-Gm-Message-State: AOAM532Maj2cbCYIDHrtyaN2TgP9z/a/6Up+2mKTw9tIrUbUrZRRjqa9
 T7+S03oJ6588hPLE4xGZKFXXIv9Zzdg=
X-Google-Smtp-Source: ABdhPJxGoyyGNXF5dY2+6zomRetPrhB2eNNLnZIOSbm5hlBZ6fJxtDEfARZ4V/NcE9of3yg4MEMPrw==
X-Received: by 2002:a7b:c017:0:b0:394:5631:62bc with SMTP id
 c23-20020a7bc017000000b00394563162bcmr19556475wmb.190.1652037296267; 
 Sun, 08 May 2022 12:14:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c024d00b003942a244f35sm16394435wmj.14.2022.05.08.12.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 12:14:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 21:11:41 +0200
Message-Id: <20220508191141.1270350-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/numactl: needs atomic
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
following build failure on architectures that need libatomic to provide
atomic intrinsics (e.g. microblaze) since commit
4ed540ddf59bec4b389be44d7f42820d2466904f:

/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/microblaze-buildroot-linux-uclibc/10.3.0/../../../../microblaze-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v1':
(.text+0x2a34): undefined reference to `__atomic_fetch_and_1'

Fixes:
 - http://autobuild.buildroot.org/results/e225cb83dae390d9dc543d4da85c52180efbd40a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Reword commit message

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
