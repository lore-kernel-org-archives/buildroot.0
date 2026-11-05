Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867D0606A33B
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LVgEpwsN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65B0160A6A;
	Fri,  6 Nov 2026 16:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PNHM-8N4PfT; Fri,  6 Nov 2026 16:09:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 76EAF60A65
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981369;
	b=rHN08SeEYoGVoYFjcdQKG/3UwaaWz/xxybyg8OU2Cy1ZvYz14trpRaxNxs3pSQgBjdwp
	 G2Um9KSrddMWtf7MMmSNfV8Y/+A3AZiRS5C8OWZGqXH9pSPj7oNx/s8WaNrzKElou5Zn4
	 e1562yOydoXBfRsoc9IZ9wudr+7oVxCiFJTlRZQH9b10rTsg5cDpyAYrAevLxCZ/dKy3W
	 NCoyWl1tRM4VnziltOEMcYTtABMVz6kzqXNTfyCyKtDJnHAGZN9aV1P82mO4HxDXN2O1o
	 bLrnubGW4Jy+wa7iyIm6g/bvfGI96L2Th1XB72ROYzXiSHjPMT3Y/MWxB9J/XtKd6AQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sQSuTUvul1+gWu8kf7/vkD4IpMdFUoECwMKMEpLuWUE=;
	b=aagMPKthZjlRFI+Yfw744a1CXg3HqBnut4qsTlCrIlOXs35lKoZAxdj2FY61XISdy6H6
	 rkrlZS7ZCEzysLgpuf1I74Bv556DgXQilwiAqZe2OHPWDgLRenkYoh8Jg5ip1Pawr68qZ
	 Mr+k7iUfjGCrC5x4yApOWZCSQ/BnKAecI2LMCKgIKp/aN1oGTOUHAJCMD4sT0/CGQEtli
	 GniAuSxS+338Jw8xPyR4YGY0ek1SXUWzil0GoD9QrxuHedzC0OrsTupQMcL/haLehI0W/
	 M5/zx+2sQ3bM9LbdUQRDjtDvUtz69/L/BfncDmTMBhahdxQRcueSoRFxuPMdYtpaAyQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981369;
	bh=sQSuTUvul1+gWu8kf7/vkD4IpMdFUoECwMKMEpLuWUE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LVgEpwsNkgFtG4srL64tHhArRrBxyLOjC5l6OIiuyoh6+rwbSDE9fognhHJmjMSkR
	 SchHDag/e3Ii8InSLAALXRt7lAA96XhdmrqHySQHvdmiYrFYzXw5tNBMV0rOEj1588
	 EqmzcXqcaAND1Drz3WCDkeSYypwz9KRuRctUqsdrkjcAfXS5fc8rI5k2ipZbEW/6Hk
	 oH6AZAQZj9T9bsYMwhwiarhB0bw8SD3ZaFXdVgm8sk/q4DOnnw4EIz0t5rumvvpSCm
	 lBz2vjYKzttHpso37QPz5MMBtjPIRAm085G9v51ggXYytlSauvoUVIRMrQ5gT2EMOK
	 H9mbPkxaUz1hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EAF60A65;
	Fri,  6 Nov 2026 16:09:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F98F2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 859F5403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvDHFlJ3iEcZ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D454D400AF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D454D400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AB359E0B0; Fri,  6 Nov 2026 16:07:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:31:00 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6d814913ce2d49fce06ccef4903ec584859ad508
X-Git-Newrev: 7920ba9853021c6caa8254680dc4111ad9fa8a0b
X-Patchwork-Hint: ignore
Message-Id: <20261106160712.0AB359E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/linux-tools:
 perf: explicitly disable BPF skeletons
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8299283078347592802=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8299283078347592802==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7920ba9853021c6caa8254680dc4111ad9fa8a0b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

perf builds its BPF skeletons by default whenever libelf, zlib, libbpf
and openssl support are enabled and a clang >= 12.0.1 is found in the
PATH. That clang is the host's one, and it compiles the BPF programs
against the host's system headers, so the build fails (here with
linux 7.2.6 on ARM and Ubuntu's clang 21.1.8):

/usr/include/linux/ioctl.h:5:10: fatal error: 'asm/ioctl.h' file not found
make[6]: *** [.../tools/perf/bpf_skel.mak:87: .../tools/perf/util/bpf_skel/.tmp/bpf_prog_profiler.bpf.o] Error 1

Without clang on the host, perf silently disables them, so whether the
build works depends on the build machine.

The perf tool does not depend on host-clang, so always pass
BUILD_BPF_SKEL=0 rather than let the host's clang be picked up.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d2f3cd8cbe3316484d6953f73db4a31277adcf7d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 08aeafd9d7..a21e6190d5 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -29,7 +29,8 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
-	NO_SHELLCHECK=1
+	NO_SHELLCHECK=1 \
+	BUILD_BPF_SKEL=0
 
 # We need to pass an argument to ld for setting the emulation when
 # building for MIPS architecture, otherwise the default one will always

--===============8299283078347592802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8299283078347592802==--
