Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26280606A325
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LpSUxgGl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 067156080E;
	Tue, 20 Oct 2026 07:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56Df6SJMkPWl; Tue, 20 Oct 2026 07:27:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F1626080B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792481259;
	b=paIiZStv7ML3PoI80zPVJXOCxtv/kcygZZSSSH4XjbjicmJL3qU6iLvn8c4i7glu79l3
	 dAosCILfDTVpDNJCZmV/mL5XcnsmhH9ybU/cgb7meLNztV7o/HqRXk0AfEZ7BDHWIZV28
	 iMM6zlm0/f/doZVyQKwq3GBmIY71j56jZ9HSYFy9jdRfNIz5QpiP01u36Sa1nVuibKztD
	 Ut/yEpVigVrtm70Vef6S5Bo554+aw/xRCQ2djsghHtlErhN/BTZUe5OE6VAh5beB9kKfT
	 AM/j62LKjcPne1U5o/EgOdOpADdqY+4lq83blKRp+quKsFrSK4s8gyalOLeRKozWCEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792481259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qlk+W0rSgrMmIFRxILYA9lDbir1yVtpcVwQdSMKUxbw=;
	b=h2EZKc/uCKyWqFBCdS395p/rEIt/n++6ooMsGByMQjoX1OQ25ftbaRT/QRTHr/YW4os+
	 hq0RCEIIbT46KMk+Z98tf0JfDtVClFn2+9L3sDbXZ5jRCVQfT29KujMiOL0rhZxqzFQ1+
	 PrkHGlg4dKVinE3nJGqvKJF9pA21PPyjX2mJsMueiOvsojeWmYsFIyyQsjqVtwae2Bnm7
	 wNEXBD8FRSsNdjdeubescbVwc1n5mgWYwxZZldzsOvF/6lop2D4HIgKDkYCqosaCIIsHw
	 kFyvZ46gHM6OXSF2dqB7i/MfjicobGA3pUKbb2oyCPIC7jOwgyC8oJhICimHgXT2N9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792481259;
	bh=qlk+W0rSgrMmIFRxILYA9lDbir1yVtpcVwQdSMKUxbw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LpSUxgGlXVgtRwvmQhWSob7Gyh4bRF2sjoe7w8nO+Y3nswCptvVVJSVaqkeQ5ZtaH
	 hT96QNg6XcjtZZTmpWZ7XdwDIPwZrizmPt+IhpJbOoEf2TTAVRXlSgdWrXzZns2Av2
	 9keQrbkdeGhNlC2DBfhFD3bNkp+zzv7MTuomNAQXNAVY7PmSDq1EYNy5gtdUznHT99
	 9VPauflJvMZaq3r6rtAaCNLKzluuRwnNaIJudlraz15Dd6SytN/prFbZO2SOxrMKjb
	 MnDev3S3NNnKUBR+6h4GLTFrgTrnMqzxMAPwEgV9T67vY8iSoMYZbGla4lWG84zkp8
	 dJ2yJQfWs+s/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F1626080B;
	Tue, 20 Oct 2026 07:27:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DDC1465
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F1836080E
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsIjknxRyVvF for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 07:27:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B07566080B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792481254;
 b=YiImTPuK+PRIQXqkRItnnPlDO8VuYfJzMIgTXJeXqNdgfwBc0C+wYrwRF2GVNxsYnNE7
 KWTA3jID/ClQhf9zwFuraHxyxZT4BJRfVPxc/JU3BT+xNGxQ81VERYQXBOg+6KxtTukA+
 hn3x+RHfGWC5pzyeZpT2hELNhMBkKZ0NT1QUCBtn561BAKG/B/ZDdi9aagymVEA6FzHCb
 Op9V5+6M0Q4/HQAsp7hTQQx01C2FAI+2YlXZrMZYRGbl5DoIRHxLWdMFRTrGHdiQVwBOr
 JyPsieYDzFC6oJwxMyLoUOiyrlJm0YfU3LGtlRCkErsyM0z3qsulEaW7QinSEYXM71A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792481254;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5q1d4MRgR1HTToQdTBEasmDj5eNyborvNg2GckhuT6U=;
 b=k2LrOo9+bnCB4o+1ORMTDeXhuChMzQdeOGCBdH04hc5A9l9tNJYHDIlX8/oA7X6ndtYv
 ADfiJuaLn9NJ327l2m4pA1GNo4xVtNP2Js1Otl3EA6bMZXZeZSKXb+BaKbXhjqnKlhowC
 dzl7JIrdMf3Oi/xwU0oUHsG28KGeXiGSUxwBvvrESMOwVbmtpveNZp/fa4Tw4x0nmU+np
 9dlv4CZ+ljyBlwdWZFoxzZvqZbkXFgLWfLusHgiwGXmTOGxJwCJW20K+sv7QWK+Q58WJo
 TgxL3/1Lurv4DEj6QKrdYiXqZgNhI9gc26/o7i/+/QDmPh5FQcrrwJWWBRCGuTPv6gA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B07566080B
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:27:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3BE2996AF; Tue, 20 Oct 2026 07:26:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 09:26:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59f3ebf60ae7d980ce2bddcfbff5b2e14d6e059c
X-Git-Newrev: 32a2510317091c91e265650864d368b72507d29a
X-Patchwork-Hint: ignore
Message-Id: <20261020072611.A3BE2996AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btop: fix build failure on ARM
 Thumb-1 target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/32a2510317091c91e265650864d368b72507d29a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add a patch to add CMake compile test for -fstack-clash-protection, only
enabling the flag when the test succeeds.

Fixes: https://autobuild.buildroot.org/results/573e0fc3178f8c9a0583bf86a678caa775410ef2/
Fixes: a7d47860f323 ("package/btop: new package")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-add-compile-test-for-fstack-clash-protec.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch b/package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch
new file mode 100644
index 0000000000..b26a550698
--- /dev/null
+++ b/package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch
@@ -0,0 +1,56 @@
+From f7b5ba16d3662ca036c6b1724fe741b28f29106a Mon Sep 17 00:00:00 2001
+From: Fengwei Tan <tfx2001@outlook.com>
+Date: Sun, 18 Oct 2026 16:37:11 +0800
+Subject: [PATCH] build(cmake): add compile test for -fstack-clash-protection
+
+On ARM Thumb-1 targets, GCC front end accepts -fstack-clash-protection,
+but fails to compile actual code:
+
+  format.h:960:36: sorry, unimplemented: '-fstack-check=specific' for Thumb-1
+
+Add a compile test with large stack allocation to trigger the compiler
+to emit stack-clash protection code, verifying whether the flag works
+correctly.
+
+Apple Clang ignores -fstack-clash-protection and emits a warning, so
+skip this flag on Apple platforms.
+
+Upstream: https://github.com/aristocratos/btop/pull/1918
+Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
+---
+ CMakeLists.txt | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3398196..0be6365 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -134,10 +134,23 @@ endif()
+ target_compile_options(libbtop PUBLIC -Wall -Wextra -Wpedantic)
+ 
+ include(CheckCXXCompilerFlag)
+-
+-if(NOT APPLE)
++include(CMakePushCheckState)
++
++cmake_push_check_state(RESET)
++set(CMAKE_REQUIRED_FLAGS "-fstack-clash-protection")
++check_cxx_source_compiles("
++  int main(int argc, char *argv[]) {
++    char buf[16384], *src = argv[0], *dst = buf;
++    while ((*dst++ = *src++) != 0) {}
++    return buf[argc];
++  }
++" HAS_FSTACK_CLASH_PROTECTION)
++cmake_pop_check_state()
++
++if(NOT APPLE AND HAS_FSTACK_CLASH_PROTECTION)
+   target_compile_options(libbtop PUBLIC -fstack-clash-protection)
+ endif()
++
+ check_cxx_compiler_flag(-fstack-protector HAS_FSTACK_PROTECTOR)
+ if(HAS_FSTACK_PROTECTOR)
+   target_compile_options(libbtop PUBLIC -fstack-protector)
+-- 
+2.56.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
