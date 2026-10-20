Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01CC606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JsKyCkTd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCC3608C1;
	Tue, 20 Oct 2026 13:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFw2zcup9kcc; Tue, 20 Oct 2026 13:55:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C48F6076C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792504510;
	b=ioQe/ST4q5ONg3F43XglEfHDdqKTKpeyrM8hE6ioTXZzJZBv3KAb4ZMx395TuX/9rmsN
	 wrJblfZM841VFjPehk9Z0/EC4fsEFimj1a5ipFecfSvgSNE42wAxjnFWBSJFVYCTqHX04
	 lr4QzoVGuUN0iHqXMhVES5fizYkEuEnWvL5sY5nL/SUdJmbz3aIJtU0fsAz8HF8tJxUHm
	 VePRKTANyoDJG/tMlbVRCbyJXpzB1qfqEfj/Lp5x7r0O8N56Dkvpsr4VRsvt+CV2k4jli
	 nPdSp0VzV0B9N2Jgj45sDwW+5v3ABiN59jotpylD+aizR7r34+k28ONkbCuT+kx5Vmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792504510;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ukmwDljc/yNE+est52+GfoqR77YdSl/ffCN7hq1EEao=;
	b=FJ9ULDcmnh71IgJwnzCN0RYpMNXfSuAeNJyg6ql9yJlAoiziOvLSuEoOjCQELWcPMgKa
	 2FuzFc5EyuBlNg1RQ82f24jTpDyJcqvMXe9868Na4yzaREw8e+/v3sdZXAvwJzHDvg751
	 g2Bk0cRPV8yZRwnb4dUY/lsD1JT9lJtYj9cWiqCL2QS6dINTMuEE1sY+8wzQHB2ivQ3XV
	 u2uoBqBy3o1+eUlRXGZBxkl97Ft95Z8rB6AOEQF5aRt9c6Oo4K8frRR37bBezTCfjvdGh
	 LjPXdAb1gAooYZIwprgqlXa1tUfnN0FIJxy+h78KZnml2isEEDS1IzhauxJdcATg0Ng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792504510;
	bh=ukmwDljc/yNE+est52+GfoqR77YdSl/ffCN7hq1EEao=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JsKyCkTd9V5DjVhJWxxilpUqDn6K7Q4RA4tnc/fIu5vx5zNECDkn09wF63KZd5vZ+
	 0LljEkkj+zcVyc3NBwuAH9ijYDBmh+HA3sa7CBvPsNK2ua/DBOrmq4wy/Fmhn2E+E0
	 lQybc6eSFyny+eukWR7I23D52JqtKm437raTdpz01aHxaop7yQJf7XORkzOTwlwlEt
	 41As43xDxB/XUKvJIDurPLwJFbnEoaabTSuOYdSC5alrM5xFXmyGQvdc82Vgc0eyfd
	 2PKSymBr2tXNzncKRaVL18U+1KYV9b0S98+OGIfVvGCVEcb6uLSOLQvZM4iLJWBP1C
	 Pk1wejfNVhJlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C48F6076C;
	Tue, 20 Oct 2026 13:55:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1963255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87EAE40359
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3K5eQ7UqHD2Y for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 13:55:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E3A664034F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792504507;
 b=RA/kNMKTA0czCvGXW5fKVuLuluU0oewZ3ehB4xTtRVli2MADRMv3bdxkIwa/A+sVaHo+
 WmZ7pUOxOitThzfMEkWGFgVAeHTiNJutvTw8cUohL/bDLI1Lxcq95lXZaguU24yuOC+bZ
 zL7NVvPI2+UQmBiagBgkBAn0DKNZBXG1vN65CtzHqoqHMfl6hGxXgYTDAu95wienNCb1k
 A/dhDVcjNMX6qufpif5ejRGZjeQ41Y7GIGRpuMNtt/lbvHZvpOq2wslhB8z7g8majNPjo
 JXG5gVUFxDB+EdrmaxFKpt4EhYgjG/RALVR3mlapEiTLOg23uAOUrh52XAhToAFLt+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792504507;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=rWHEJLhcdxN2g0RRwGPWLANcyPwD/AyOzSflH+bkDa0=;
 b=C0ejnU2g/fRFB7sDutvrXAvMKhfoFRfN0x1JLrTjoEUfYv2jv/85hmjZRRCTjUj/AeWp
 /iWLgqeh+xmqN0QULzqSWz6nRM1t6YAQMvRibm/Blntk4fwKBgDSrQ2FL9CG5A1vT3cLi
 XtlIP2SQ+xee/EqZenpGpkB41leqDRmS49+vo9d9QLaSk4G+odTFdcfh+qObFcQFyTswK
 tnPwAAbxE11Vwerqe8Opev0xL9pVdjC6yo4jlHMWKOHXB9chAAl68xzwHRw4BPdXcRQoj
 gDE574mWZUz83bz543XP0hVpZ2teoE9pEC3MYFLEkmY8cZ2+opxCz/mH5A2X5moO9qA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=o3lqmD0O; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3A664034F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6A09C4E41261
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3745B60393
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BFBE610328D5A; 
 Tue, 20 Oct 2026 15:55:01 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 15:54:53 +0200
Message-ID: <20261020135455.1595899-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/network-manager: fix build when
 jansson is enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since upstream commit
e5d2c7cc6dd5f8146954d52855fff36febd03d5b ("meson: fix
cross-compilation issues"), which first came in release 1.58.0, the
jansson detection logic is broken causing the sysroot path to be
prepended twice, causing build failures:

../output-1/build/network-manager-1.58.1/meson.build:307:2: ERROR: Assert failed: Unable to determine Jansson SONAME

We fix this by doing a partial revert of the upstream commit. We have
submitted this partial revert upstream.

Fixes: https://autobuild.buildroot.net/results/104c0e15617d52ae73930fa1c439b7f426837e8d/
Fixes: 67cb61bea5876227226603e58d3f74e5032b734d ("package/network-manager: bump version to 1.58.1")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ial-revert-of-e5d2c7cc6dd5f8146954d5.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/network-manager/0001-meson.build-partial-revert-of-e5d2c7cc6dd5f8146954d5.patch

diff --git a/package/network-manager/0001-meson.build-partial-revert-of-e5d2c7cc6dd5f8146954d5.patch b/package/network-manager/0001-meson.build-partial-revert-of-e5d2c7cc6dd5f8146954d5.patch
new file mode 100644
index 0000000000..93810765fc
--- /dev/null
+++ b/package/network-manager/0001-meson.build-partial-revert-of-e5d2c7cc6dd5f8146954d5.patch
@@ -0,0 +1,50 @@
+From 57c96b61de76ab6fca79e075076c5d2e35fc1229 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 20 Oct 2026 15:27:21 +0200
+Subject: [PATCH] meson.build: partial revert of
+ e5d2c7cc6dd5f8146954d52855fff36febd03d5b
+
+Commit e5d2c7cc6dd5f8146954d52855fff36febd03d5b ("meson: fix
+cross-compilation issues") fixed some cross-compilation issues, but
+one of the change is incorrect:
+
+   jansson_libdir = jansson_dep.get_variable(pkgconfig: 'libdir')
+-  res = run_command(find_program('eu-readelf', 'readelf'), '-d', join_paths(jansson_libdir, 'libjansson.so'), check: false)
++  jansson_sysroot = meson.is_cross_build() ? meson.get_external_property('sys_root', '') : ''
++  res = run_command(find_program('eu-readelf', 'readelf'), '-d', jansson_sysroot + join_paths(jansson_libdir, 'libjansson.so'), check: false)
+
+This change is not correct as jansson_dep.get_variable(pkgconfig:
+'libdir') will already return a properly sysroot prepended path,
+assumming the pkg-config used is properly configured for
+cross-compilation (i.e the PKG_CONFIG_SYSROOT_DIR environment variable
+is set and points to the sysroot):
+
+The above change breaks the cross-compilation in Buildroot, which
+properly uses pkg-config with PKG_CONFIG_SYSROOT_DIR as we now have a
+path to jansson.so that has the sysroot path twice:
+
+  /home/thomas/buildroot/all/output-all/host/aarch64-buildroot-linux-gnu/sysroot/home/thomas/buildroot/all/output-all/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libjansson.so
+
+Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2575
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 5345a650a0..cc1460460c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -296,8 +296,7 @@ config_h.set10('WITH_JANSSON', jansson_dep.found())
+ jansson_msg = 'no'
+ if jansson_dep.found()
+   jansson_libdir = jansson_dep.get_variable(pkgconfig: 'libdir')
+-  jansson_sysroot = meson.is_cross_build() ? meson.get_external_property('sys_root', '') : ''
+-  res = run_command(find_program('eu-readelf', 'readelf'), '-d', jansson_sysroot + join_paths(jansson_libdir, 'libjansson.so'), check: false)
++  res = run_command(find_program('eu-readelf', 'readelf'), '-d', join_paths(jansson_libdir, 'libjansson.so'), check: false)
+   jansson_soname = ''
+   foreach line: res.stdout().split('\n')
+     if line.strip().contains('SONAME')
+-- 
+2.56.0
+
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
