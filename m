Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9114B606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KPBGB3h2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5C3811BF;
	Fri, 23 Oct 2026 12:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrzB4v-6Vani; Fri, 23 Oct 2026 12:24:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7065280F5E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758261;
	b=apodVIXYTdQkfxFLxUiV7u7nPwkHUF40iQcQNtC+wP6JahE98XiYOWiFs2JA2+Fq0CxA
	 aV4gAqJzl05dc8uGSGthftp1p4x2NwkSrSIu8dLNgh9CgNMDDyIF6UHU1ZH0AQfpyLfnv
	 7xlGGKx6eJFt/ef0vqd1yahrjU7or5XkhhC6rgwxrSfFjPy++5BN7idHNKPTE6zcdOXFy
	 DPNf0ZrYA7us6T31l/ileU42Zp8eG7psX0G7g36iKgmZ42VJUW1C4V18dR/4YZFKUczSN
	 IbmLlPfQOuztofS5PiK9FfNmxgSsJx1uDcKkfE8+EzzA2BHuhba6jXelDYYvRvd7MTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=w4CAJgwen2SD4Za5jDHCVscJgPe8PaoM++8zo0DZ6X0=;
	b=dVvHX4yg8fuF10keCvHRtcNLSaGDp2k2ZYGNvN7Y+kr1aAyBdCrtzb6GB033K5GfPZ0t
	 MKIlljbY7ivrvvwlnei9KkDKRW/We0bdgqGyRRIeu4eCAAaIQraBpnJLy92etzFpDQVxm
	 KJ0kWOvP4drQov27s4V1Z2gsI5O0BKx5R6Aa/pnLNcLiz9ImNrgIfKUi/m73bGxr+5/SJ
	 KY1SBG+NtLEBvJD9udM5lsh4N2U1WZVmQmj+7nQxwsOv8JnbaucRtvWfvxx5aoZP9Nwvg
	 icyGNxjKyKKMNqlnWQE1XdEzOiMcgHr8805baGO1FT1K6f1N9bMgThCsupb9jnm+eyg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758261;
	bh=w4CAJgwen2SD4Za5jDHCVscJgPe8PaoM++8zo0DZ6X0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KPBGB3h2egtjHvHQM47DbAjKiMLlGrvsw40XwS9cZGdBHNuvWAw5qshNDqDVAFU3r
	 C08GVqokv5MX0iJJa2jZp1WTEHGpK+wr++8K0UBzGIheBkrEgoSiczkBl0xXv77M42
	 9Rao3zELxfChG9LLe6/H1t9znpaM1HzzFJXaeYFrd6wLSu7gDv0BeKh4iW6dFhqnwg
	 99d+al4r3V8RaGdijq0TwwG7guaworC8zEKt7Hh7Zq6PHlmLBJPQVCoGkktNgNZU4h
	 lmKPYzvqALCAWLDPOsVEfzd9uE2o26Edzo5gcBDugiRiu1g6jDkO2BjsG4xOIj/3C+
	 p6g9/Lcgb/hHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7065280F5E;
	Fri, 23 Oct 2026 12:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C21B02
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E1BA4072E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5k-66ErXA5z for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2193240782
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758259;
 b=mAvIp3dhmjncuVvrTKRX25mTM/PS6s6zG/+WE5RtsRn0WqgwoFNGkhpBfj3ZfM0iUSdP
 amxTzINCH1AvzcfvE5Fx3WhVjHBduhBWItLhhcQsLvPnBmYSAQ1FfxEit8pIFC8G2kNJR
 MUU5XRzW+V15bwoNA6lgmET7XOYfxcK0anYuzbPSRyUIvbbIs3PXgQXCTnuY1B9Fj9K/K
 U0+YnEDsu5g8KR9JO6tS81eScLu3GhbebW/60L3Xxwd63+a9qYQBye/YRJXhbIuVaERJ/
 d15P3Jz0CPiyhIWlG/+yYhwaDZy9CeH2WCL6QSWoFmz3Kexh3u4742dY5Y6+wnevUDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758259;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PgJRBrXPJUqkp5ApIDGdPj0Lxyw/33ZM5zwHTiBMx8Y=;
 b=mlni3O4xLjsPL1fHlXlcz20GE8xBHKCnMutcp6V2VFOefEdEPgN7wOFvK67FIQ/RS/be
 Kab07RP7RLk6jqFy0sRr3q538z/1hyX44NjcBONN53s9yVc2A//RpNXE2vYsGPnN+Lnon
 t8kJEAICbDWIqPFwI471o+I5Kf0YFuhbmJ1wGS9qYpE0dyP1rXM+GUbNkE4ei7I3vSEQ8
 xevwf/i1BeIhdZtSLMYXqn17bLMSiUhAQKDZ2ksKpTpNTPzMQpNSzHjoprSg9JMgIZ0N8
 VvTu/7S+msuc1edH8Ov9S9jRVJLKmrwoGJ049zNzFoGS3PR/ZjxijhaMU0GbIe7GWcw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2193240782
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EE259B9AA; Fri, 23 Oct 2026 12:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5aed48c019945adb895116c155aa9f7d01f9b5c0
X-Git-Newrev: 4f5b0a9d8df3ebc4dc1fd5055a1893f8c97f9bc7
X-Patchwork-Hint: ignore
Message-Id: <20261023122254.8EE259B9AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: patch to
 remove pthread_atfork dummy for noMMU
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
Content-Type: multipart/mixed; boundary="===============1304989563898630488=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1304989563898630488==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f5b0a9d8df3ebc4dc1fd5055a1893f8c97f9bc7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For noMMU pthread_atfork() is only a dummy.
This causes build failures in util-linux: the configure.ac script
detects pthread_atfork() presence because the symbol exists, but the
build fails because the prototype isn't there.

Fixes:
 - https://autobuild.buildroot.net/results/936/93637dfaabad0a1f11a94488421f6cc73882817f/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 107e7f54ae047cfed1aa844680f17cbc5e645f7e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...linuxthreads-add-dummy-for-pthread_atfork.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
new file mode 100644
index 0000000000..66605aa657
--- /dev/null
+++ b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
@@ -0,0 +1,43 @@
+From 2e902dccb925f1f185836bbad2284e2879550cb3 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 11 Oct 2026 16:25:53 +0200
+Subject: [PATCH] Revert "linuxthreads: add dummy for pthread_atfork"
+
+This reverts commit 9e38e0aa45cca21d5023d0af94377f0e1e41d2f4.
+
+As reported on the uClibc-ng mailinglist by Thomas Petazzoni
+this dummy without proper prototype is breaking util-linux
+compilation. My usecase in 2017 was curl+libressl. Since then
+I moved from libressl to libopenssl and that works fine without
+pthread_atfork(). Tested with curl in Qemu for RISCV64 noMMU flat.
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/2e902dccb925f1f185836bbad2284e2879550cb3
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libpthread/linuxthreads/ptfork.c | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/libpthread/linuxthreads/ptfork.c b/libpthread/linuxthreads/ptfork.c
+index a1bad3d54..74d630830 100644
+--- a/libpthread/linuxthreads/ptfork.c
++++ b/libpthread/linuxthreads/ptfork.c
+@@ -150,16 +150,4 @@ static pid_t __fork(void)
+ strong_alias(__fork,fork)
+ strong_alias(__fork,vfork)
+ 
+-#else
+-
+-/* We can't support pthread_atfork without MMU, since we don't have
+-   fork(), and we can't offer the correct semantics for vfork().
+-   But instead of failing, just provide a dummy */
+-int pthread_atfork(void (*prepare)(void),
+-                  void (*parent)(void),
+-                  void (*child)(void))
+-{
+-  return 0;
+-}
+-
+ #endif
+-- 
+2.47.3
+

--===============1304989563898630488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1304989563898630488==--
