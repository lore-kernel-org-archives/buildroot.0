Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC846606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZwdGP04l
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E9A140441;
	Wed, 21 Oct 2026 18:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVvODMyc59vV; Wed, 21 Oct 2026 18:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 99750405F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608881;
	b=HRw7HiXBSQ/DjP7IxLLN2G9qvRqv/N0dVpYTAHTUo3NMVvqyB29MrrUm1YRBVLoXCGUx
	 oi3JJBE6Si/v73/0NDiFULIBznKAp8tELow7w1I0jv3SjPg5uHP6a+AkUcQU1OkAtIQYs
	 gDgoA+Ltg69QadyC341FYO/jqQfIa5+iwFIzOy/QCXUIjzYBZU85uE4TjiBGBj51KKJqI
	 GJw4qjwEx4fzu+J1bnQGcqGxrS2+5Ek1qGimp10MfLPPj++07Bskvvl66LZ4peOCkvRST
	 TV57S4Q+XcHvQtH+VwoOwB6eJbEH8zqD0552bevMqRYZJ2TSRgWC+NDMKQPPMh0Mc5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SrU6fEcSx7M5D/85opmeDEsWlBWPv/ODCD2ciLhVu+s=;
	b=qgMgtH2jM5i4UBkctInpaJbmtcnTSN6aptXXeAuKzeB7kPuD5pF5b2ZaSeAkLEZ8WooS
	 xAznBSXTSo1+7L+EUlx0xxeN5HvZm0KsS2eqA7EoMwpx4VffCyWP+HUFvHnhLCKM+HV69
	 jkgdVLEJlCBWvUhtet2x4pxMh+PjgSY4Mjn+chofVPZe97wVi/MQG1UMbJclak4dmjS0v
	 qYsu0eZ7+UjMXIH/Gdb1P5ZyPkXUSAwPP7YnbNHtIgjDrxTZXs2pqKmOpKXjnlqwb+7W+
	 bTIKOLfTj2OlGASlwpBt1XjB4cdIG+UfX3WlnnCErduNIq9TjKfHFWCG9CzvRIPZumQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608881;
	bh=SrU6fEcSx7M5D/85opmeDEsWlBWPv/ODCD2ciLhVu+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZwdGP04lybQtgTUEFEQ7wIORabHfzyKbII7Llg9ZZRzm3vqIG3vNJZE9xiE2Mp7V9
	 xcODIQ5xQvWftSUQDZBI8nt5jb+9n5BCFaytV4XOSZDmo9UkW3UN6lBqa8zYxLUo76
	 y7hNap8bAuGjhZF7etn7VwkvUsldZLNiwKb/BTWLspBzersyTeH607ZZgGFwfG929U
	 zvkIRc7f9SDVgXWba0AG/U0aEFx2pOmE7j3EwWl5IrVbknsACnL5RkAUwqUZh0Frv+
	 clJz4QSAbcqYKeFYGGEazivaTI7lJXUFVkCnCXpwNB1PjJtnsKhWPO+R0fS41J0Y1L
	 WqrzbEObunhZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99750405F4;
	Wed, 21 Oct 2026 18:54:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F309769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D574740C55
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVJvmWDRIpYW for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:54:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F27F3405F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608880;
 b=ZC4z7LrFZ+ckn9K7cdlCYxfH8w/93Qg5raqJDrtbWhkZxG1+rCaOU6KHpGcrivfqZYo4
 xTOsQ+ZIODwGPEQQFv4sgAN/pGpoDP6VZ4Sbu2C6GZWus9VXkUg2jPBpHC3eidTPz80da
 t1LCxsBtxQhTm8mZ7mvRj9KH26jU/pH/Axv2iiNsajGWLmPWLpAQQWwysaueQAMMha5DS
 YPiLTRWUf2UnRHkkxFkbxJ+cDiFm/tpCDBvmYxNnGkfVRRhM/W1i7m0FviEvh8wtam8uP
 zOMoLY6Ww/MXY44xUkwbH0RL2iqx+GDFN89mjPA03HyXgNvSO9lV1JFO1g0rEmNFrrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608880;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QJKc9CveEW1djN6j2DlEVVRXsrtrCZ4MysZCHwvoz2c=;
 b=R8Pd4FuHsz1J8krALLiQeoKFbkFWJ/6JJBlL0ANHma9TlDtS0zXV+bvzfK8K+HMRZXCn
 yCkar7DAtAbs8acnOfpDdf7JP0axGGgtBhTS/FctpmUYue+Pdn2JRZL3EGa7/dp1IkTFw
 5y9BXVZVziMMu5FYwDT6c2sKTFl0I7joAKOeysXN9/W24PQCr4LmwSUyEqS//lnkoF40E
 KIBo8ToXqQFkPea/NWFq3njFJeJHilyhZzdKErO1j5jnXwCiFxREsguChTVxkIOMjz1EB
 y1/DolWafEdpsLZnwY8OsmOtcezcTbXquOBwgvqUiKZBfOibClqXy9gPdY05c3NotCw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F27F3405F4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:54:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DA7199A76; Wed, 21 Oct 2026 18:53:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 20:54:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e1d973a205771ffdeb03543bcba1c55f464bbb8
X-Git-Newrev: 4770bb547aeedbd9d0c7d0e414471c1815735587
X-Patchwork-Hint: ignore
Message-Id: <20261021185316.4DA7199A76@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qrtr: fix static build
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4770bb547aeedbd9d0c7d0e414471c1815735587
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

qrtr 1.2 declares libqrtr with shared_library(), so it builds a shared
library even when Buildroot asks meson for static ones only
(-Ddefault_library=static). With BR2_STATIC_LIBS=y the tools are then
linked with -static against libqrtr.so, which fails:

ld: attempted static link of dynamic object `lib/libqrtr.so.1.2'

Backport the upstream commit that declares it with library(), so
default_library decides. It is not part of a qrtr release yet.

Fixes:
https://autobuild.buildroot.org/results/d5f669f99f72ee68433bc8a1b1197594f46e8882

Fixes: 81bec84bfce986a49b799384c3d0c540fda5367c ("package/qrtr: new package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ib-meson.build-Don-t-force-shared-libqrtr.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/qrtr/0001-lib-meson.build-Don-t-force-shared-libqrtr.patch b/package/qrtr/0001-lib-meson.build-Don-t-force-shared-libqrtr.patch
new file mode 100644
index 0000000000..05cf46faf7
--- /dev/null
+++ b/package/qrtr/0001-lib-meson.build-Don-t-force-shared-libqrtr.patch
@@ -0,0 +1,41 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Luca Weiss <luca.weiss@fairphone.com>
+Date: Thu, 16 Apr 2026 09:08:41 +0200
+Subject: [PATCH] lib: meson.build: Don't force shared libqrtr
+
+Allow the build system to build a static version of libqrtr when the
+user requests it.
+
+As per meson manual:
+> You should use this [library()] instead of shared_library(),
+> static_library() or both_libraries() most of the time.
+
+Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
+Upstream: https://github.com/linux-msm/qrtr/commit/f83bb6c1a87a4a030e36796b4ca9240b0321e15d
+---
+ lib/meson.build | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/meson.build b/lib/meson.build
+index aab46cb..faaf7d1 100644
+--- a/lib/meson.build
++++ b/lib/meson.build
+@@ -3,10 +3,10 @@
+ pkg = import('pkgconfig')
+ 
+ libqrtr_srcs = ['logging.c', 'qmi.c', 'qrtr.c']
+-libqrtr = shared_library('qrtr',
+-                         libqrtr_srcs,
+-                         version: meson.project_version(),
+-                         include_directories : inc,
+-                         install: true)
++libqrtr = library('qrtr',
++                  libqrtr_srcs,
++                  version: meson.project_version(),
++                  include_directories : inc,
++                  install: true)
+ 
+ pkg.generate(libqrtr)
+-- 
+2.53.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
