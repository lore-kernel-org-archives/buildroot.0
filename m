Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE89606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 10:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f1RO9k1G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tOUfRKad
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E220E60A97;
	Sun, 25 Oct 2026 10:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2VSuZi2eDhC; Sun, 25 Oct 2026 10:34:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 919086089A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792924442;
	b=QTjNxcK3tTi/yav/sxWox9biIzFnndmzpbEJfC4iWDUOGcTSs4MqgDVp9gj60MiFQrGZ
	 +S1Jz/DJ51oCVaHM/M2nbXOUwUcNPAYZFsAbdasNOVNlmxvCMDlQtb0sJbYT2b0BhbvT1
	 s4RFLtsat3JXmpy2iSNKLPr2Y4sDZrD77gP8LsQOFbamKER0ZtFbyz0PbGbE9HcTbcctB
	 cK9VlMG4Yknjkdbetum2vJXlw2TRkJC2IzXIfmiqv0lMKxJGFHCEn5L23Hc0RwYtIs+Fk
	 QaH+uyb+5eSLkXMqDAfCNz2QD8OyTlA8OVr2Tf0BcKVuaH+Dp3IKLs6QHzbm8E+mogw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792924442;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OaLEDXandVagL7pY/s6fhi2e2uMqZyPTo4Dy66vF22M=;
	b=A0SmbJJH21dwuftwriXgnURP+NcVpdZws7u8x+TdKdIbBtqAEix7/uEtpq1Fg/H+XIpc
	 V8SWpQl+5enbUgQIWc7AuILHUoCd//bcoVW3fgaiG9FsIjm0dvF6uCn7jlV79t5T4rNfA
	 kI4RrsPFolMsKhuam7+vppXn/YSLYEGo+C/Rm95Gq7V3uAOVhgi4qC2ZQjrbcL/xVEZ9N
	 XBj0yALKQdYt+MFfWSwInckZngAUnclVsQxOaSuPsFDYcr9ZqrbLOzZdhp/TllCMntiIu
	 lyMLV58HYkwddrPIxDpBHaZ487w4kX3Lg1ZD7iA1r5dpIn5ogOouxcFsol4A6ZOfFvg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792924442;
	bh=OaLEDXandVagL7pY/s6fhi2e2uMqZyPTo4Dy66vF22M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f1RO9k1GW/z3HcHWC2XZSKhvydujBOe8npewcivz4kAq8Up51UnfBnYVL++qrcZQy
	 0BdQEy99Q0momLNeOlyAV+notVGGllvRI2XeCNOkSWyMxuK1oGyWBw3Z4TowKQTe0d
	 HLYu0QmzpbOSl/k1S3O7PpK388+kLQ3EZYQlIfDuBp7J/L4Lje+vdciDKwb+JFb7OC
	 Oi2v7QhvCE3dRrJ9bbC1QQ8ASahlvLey6ghIiB+HLmf8CCnwtigA6Gy0sbs5j18bhL
	 ai5+Z0WXVVU2hJGA5z3JZ03kfiNWXzsp+WJVzan6yLszU3OSh51AERa2ySa4EA+3QP
	 0FdSstzU9CmUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 919086089A;
	Sun, 25 Oct 2026 10:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0B5E3AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A72A980E26
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gkWHF3TuPG0 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 10:33:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 070F480E21
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792924439;
 b=GVCCa6cJ9x+3IK/MjaYX8x0v0YthnX2S/CDjYFxCi0KtsVQSq/+bfI2KCFfShQhZyo7f
 sQLd/BytbQY2l9CcCTZRdKfiFTvqfnPSyUTScK0Y+zCdWJl0iVHQDAufCEUF3Fi0vJhSM
 6ZdKHeq0LicLedUqNZjI8UHWQ8pKStKcJ3jY6i2aVo8mBckKgrCNQZe6USNrLcffSodgK
 HFvx6cXc2SHpDPAVarogU1Q463hjS2DfgzAPlUEnqxWoALtPZ4SgpoHLVc20lyAty0l4o
 5g4XKZwLYqrglyZ/nSQKNT3ux/cidHO0oJYklPd8GMgHjj3qCbCu4sQBxC2FS0Zl6FQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792924439;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/sr3v7g/lh6nCXetp/8XPvjz/IDjrpqosrjWT5BYcTw=;
 b=NrprFjYDuRGxEhbi3XRtWVv8Pq2Lv1zJcwHFc3VOgdbENy2Zh/Qi7gcuFXIZumlqCwh6
 d+AfzFv+/XpJQPu8yAnG4ZgpNMoWgJ6JXQ9AFKxDaqPV4ZT5BuO3m8FYccTyPBKuRUL99
 gvjv37o34d42UehiE4G62P+nUow0y6VWMAq3BZrdN2BH8gcSrVXZMQABogjAdyY2PoAEf
 wdtNLgMRgsVoGXZ6pBL5V3rW/vxkHFjR0M4KgJHz0ldgle0TAjjkY6vUNL9mQHhW/azfH
 Jjm/JMzN2k78oyPJp2rXWaCUb9ipNIpl2u0+c50ta0A/kbq/I2aWitWh+zYenspAFYA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tOUfRKad; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tOUfRKad
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 070F480E21
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792924435;
 bh=/sr3v7g/lh6nCXetp/8XPvjz/IDjrpqosrjWT5BYcTw=;
 h=From:To:Cc:Subject:Date:From;
 b=tOUfRKadZLvwXFmrT9YNCYtPd6v8OcEP/xMhFObgdXX5EDrs3Twv3vvuCZbPwjkoX
 qfMlDkAJmTRKeZvxWnZmF8aS+sdNxNr1NWQFSO7uyuHnBQgwno4E1ji2/aY0Fkkqeb
 MGS1cKt1iqmpk533M4fU+yUnedP3qpfRFW98y7RJogfrYifDbGJWcHWmXZRM6NlLfm
 BTCIWf/METpIHgls9B3+j7LeVyp588SlqSkyiHjf2ShP5WvgIA5XrFO0/q+Ox/KB8X
 nt+sqm5lI7YmPQJXpm1Cwo5NGbmPZI3IqIsEyrvNp6UWBSfk4FLRpbMGCIos/n2YaZ
 x9++oFNXD7ljQ==
X-KAS-Sym: v3:f51bdf72230551df:h91RXDM6rDSzIbp1tdbpuE24/5StJkjAdS7bHgR0xgFB6
 2vnUhb4epjBr5MIC4z8K4+J9S18xQF1OzQnuN+9AiJNaEJFlZvbLNeohyMt8KAwgHsb2qGDKPQg
 VehfxDfRrbtLZRsGZ13OdF9b6GAHg1Hb+gO0LF/cPeyEoO/Ib7+QXUP7v4Y1c0hfde6R0t/RLA4
 xFk4x0O5tKSkG1rUNcciMXpQQpak5ZrLtcYR8vSc0PRpT3rfVtmtS7YXbKsUjJYPdcscUcqABhf
 EdLmxQwVdBhhIFCFPFPphiZJQZQG36SscEdoM54w8q4w5xTP/+rN3HeZuLB0oC7Fc/jB9UXQ==:
 QnsCdO2cE/v9M34RqfyKjEyS5PKapKjs+UNlSU/Yu3BP8JB4QJtna32ntqRR9C3UiXXrducGLNW
 TW2YP/wgfkmAKKdKoUmTpoFJGwX85ntPuEDNMTp1fyojK6SfL3DMMX89670gPwSZIPMQ4vGT/1v
 AagbgIUQ85+ChJP5mSHMD1OEU8dyXKkj46fUQu9KvbONRvhGnsTrjcdiK4CiF4sBJqeC/ykCMld
 Hzd/RIYQMyjksvcMsRucbuZKRvDDMC2NzT16cnAaVyaG1y5lInA6syC3MWF1vRmKNA3j1Jm5MpC
 z5SCJIbyVbxeuk7mVzajQ72JZ+uEciuB/1dKkPLF7o36hoNtMtQ9TEEDB/xkNmV+DieBuOlcWn4
 gq+4EFZORa8VPk6D0+W2zKmAKo1/Ms2lOxj8V88qiwUcBp15JkrpZd3xJkztonSQhT7GY1pkmzo
 fkemhpRKBv8C4CdZKTJS7MmB6N7L/P1+Ei0BRc+ha4D+YxKe+tEuaAKf29BtE0bC/a2zigWOL+9
 gIUorleDF2KJvxEnu673OXWtqNHFlYlx88n470UJkDLY+awpK6wH5Kbo5ioea/qAW9q4wPQdaaK
 lvKckBhq
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 873EEA4C2EBA;
 Sun, 25 Oct 2026 11:33:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39472)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKvY3-0000000063n-1igJ;
 Sun, 25 Oct 2026 10:33:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Christian Stewart <christian@aperture.us>
Date: Sun, 25 Oct 2026 11:33:54 +0100
Message-ID: <20261025103355.3701150-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/docker-cli: needs NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pthread_unix.c: In function 'x_cgo_getstackbound':
pthread_unix.c:96:9: error: implicit declaration of function
 'pthread_getattr_np'; did you mean 'pthread_attr_init'?
 [-Werror=implicit-function-declaration]

Fixes:
https://autobuild.buildroot.net/results/756/756ceb50b78218ac6085e0143d9f358f97d9568d/

The build error occured already in 2023:
https://autobuild.buildroot.net/results/c0b/c0ba9647824dd2dc811c31e7b999167f04d0be49/
A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-cli-buildx/Config.in     | 6 +++---
 package/docker-cli/Config.in            | 6 +++---
 package/mender-update-modules/Config.in | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/docker-cli-buildx/Config.in b/package/docker-cli-buildx/Config.in
index 486f1196c3..d1f9bc2804 100644
--- a/package/docker-cli-buildx/Config.in
+++ b/package/docker-cli-buildx/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOCKER_CLI_BUILDX
 	bool "docker-cli-buildx"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # docker-cli
 	select BR2_PACKAGE_DOCKER_CLI
 	help
 	  buildx is a Docker CLI plugin for extended build
@@ -10,7 +10,7 @@ config BR2_PACKAGE_DOCKER_CLI_BUILDX
 
 	  https://github.com/docker/buildx
 
-comment "docker-cli-buildx needs a toolchain w/ threads"
+comment "docker-cli-buildx needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
index 52e7f7c871..2befb87578 100644
--- a/package/docker-cli/Config.in
+++ b/package/docker-cli/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOCKER_CLI
 	bool "docker-cli"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_HOST_GO
 	help
 	  Docker is a platform to build, ship,
@@ -20,7 +20,7 @@ config BR2_PACKAGE_DOCKER_CLI_STATIC
 
 endif
 
-comment "docker-cli needs a toolchain w/ threads"
+comment "docker-cli needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 1fd7384f59..7c5a7e4442 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -76,7 +76,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
 	bool "docker"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS # docker-engine, docker-cli
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS # docker-engine, docker-cli
-	depends on BR2_TOOLCHAIN_HAS_THREADS # docker-engine, docker-cli
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # docker-cli
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
 	depends on BR2_USE_MMU # containerd
 	depends on !BR2_PACKAGE_CGROUPFS_MOUNT # docker-engine
@@ -98,11 +98,11 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/docker
 
-comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 5.2"
+comment "docker support needs a glibc or musl toolchain w/ NPTL, headers >= 5.2"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on BR2_USE_MMU
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
