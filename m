Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B11B606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H6rSgq/x
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DAE4089D;
	Tue, 20 Oct 2026 16:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05wWDcchmYVs; Tue, 20 Oct 2026 16:40:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9BBF740782
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792514404;
	b=MEnkoPYSEb2XHKyFX69bjQlb6N+SAQdkKek3Q0E+yFBjhyrC+TA4Cq/k4CODzoZvlYzn
	 q5JGt6w/KaDwT+vWOzCcwVueRCchyYQbPjTaOs51iH9HfAtcn+3Ewfno3DoIvR2imCseH
	 5+5PUw1IxV8cbOYM0qkDDtqj4xXf8YVpSRsJgDXROO9SmliDUYqtR204dQRuGQSu1fool
	 5hU+uxO5R5j/kjuudcmQJOy7l18OPjlNbjmk0wui/7mliaInzYdl4Eqqq5ISIZjpFQWXF
	 ulByoWt+TxnwpcY2UIDXnkFN5m4aZlsRFfoVFxmDoflWuMrafNGhA35Yw6ngyhnxjgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792514404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=vjyek+hVCzX5YbWHmzK3JQ5JS+HaOyeAwy3LsUvKGvU=;
	b=O5eRnby7JVICXROl9fFYT0lK8BbS6uLzvD0IS+ClniDNFzoaDJp3DFRmP4hINiCe9X3f
	 F+d9A0W9oQ7IXfgTsn+Z60l4FHOTiERAsnDhLLWNdZDmc3MlW0HhW4RvpIj6ndErQyH5B
	 PqGpjvkxyuN+d0bVp65NYSGKMdTWMary5hE/oPgi+CvSozEQgqxp/koZcKCxdU7ZBgEnI
	 Pb/ZMXySp80SEkJepDfNXonEw2XGVx8hXLJEM54jh9dp1OGmRNrgcL9bZIS/9YJc9q8HX
	 oVMxgsTigkc1EIIkGS/jO3PSaITT/TusXOVuDoxFaR5OBP/hEEh9OlXspcabh5u6YCg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792514404;
	bh=vjyek+hVCzX5YbWHmzK3JQ5JS+HaOyeAwy3LsUvKGvU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H6rSgq/xAo1adYWGv4Z0MsFkk1H2qjC1C2ip9hmKnxeM6RK85D/cDFiuN/jSlVyVo
	 7SDDl74eNjonM3Pf8/Vw/nBWChp7cp1dqpoGGdeNJM1fQTYugLkV/Sd+DPUimdGyLB
	 gci8krHuXmJTtlZBbFuU8GGa9C/S5feS7Neig2mpZo0Pc+sB/ubawqRc0sXByL15f+
	 MEFewC3VJ8NvQ5kNm8leyNCf5W/NVkF8mTN4AXs/baX1rQNZ7u1n3qJt0q23oL7mRM
	 GEO3BMXxtopFYSWFw7zT7i4r+7bKKEst+2LbrLrWDaQ2PuesMAQoQAGVfSPsG8Yu3e
	 dEsNonhLKPGVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBF740782;
	Tue, 20 Oct 2026 16:40:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFEAF3A4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1362810FB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2EfRXBgetvM for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 16:39:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B28408109A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792514399;
 b=jWFKX193AE4FJkUay4pR4nBeYro9hEI5p7gzq3q+P/uucki09oKXwt8wMUmif9K3TAbe
 XKt696ib6AFTzb7NNQBVtJ5/H8pTigK+8fkPlAYUqODceDJhcfK10RtJxGIjlcbcodqmh
 jjW9MXUIRoQvpsAPYjkLJmE7ricxnE70o1i23+p3AbIaR8NSZ4Y1EYU4nXlLLECCAy5bO
 1EqJPSr82iEy3iXlyNDvf2mTlAuY1yIxgk31y1kwPxuzhAYUy8IbBNdtFSADINtcX9AzW
 MGulyhYbk+O3mTWm3DBKnLVT0abfUWHX7GuBwoBOQKl9dOEYG/qL2uz7tR1VCtqiSPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792514399;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=C4wHCH8OQL71peeD7PnjD55ahC5Rm/A6MH4qFwlFvWQ=;
 b=gTkW3YUONKfu9gvJ4XAHG94G4AKS8BKickXJyWciswGpKE02HtW+5FsqAbRrFUXu8FZg
 +mjPgmpAnKzQEi9JQGTNSrtKq69V45wZq6PJYMBlBQgOPE+evGGpxSG10zdHaJlegLj+h
 kKsn/emJIsFD/5Kl9fT6C1GjLSMiEST8x36JCJIJcv+wuJ31niak7slnTGfpv0YPHe8qL
 t8QXBhM1/a9KDUepBfr0/QjmrGvBWMMa1mY1u+GSU5V1UETRjEmZYZ0IvzAgjC1MeaPmQ
 B7ViB/stYBfSBqrN0G4iYfb704lPtBaG4Uwy/sUBTuAmXFCYyVaDEYjRopsHXbqyzqA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B28408109A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:39:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 963779990E; Tue, 20 Oct 2026 16:38:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 18:38:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 600ce3a71e8284b55d4c385015136c2c5ccb4079
X-Git-Newrev: 623e94b061d78a2589d73cbae03be1b9d3a87500
X-Patchwork-Hint: ignore
Message-Id: <20261020163836.963779990E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: fix build when
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
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/623e94b061d78a2589d73cbae03be1b9d3a87500
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-partial-revert-of-e5d2c7cc6dd5f8146954d5.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
