Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BF1CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 22:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8360D42678;
	Wed, 27 May 2026 22:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfryqzibPxjT; Wed, 27 May 2026 22:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC82C42679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779922788;
	bh=oY7nVRxWy1m09ipPTOgPfaZsJwBr25J3/OvN/u4YFtE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QYAxodU82IClAVWhC+COfkjU4YpXLkM4THVtK9K+lzmC4dLFchWOd3IXFRAa6lzQg
	 R+EDt39SethWj/ug/sHflSTUigg90jtMUrRo0fQosLrhxix1XliTnioi3iAs6n0i/p
	 ZJbstlxwVPj0ipfYuW0IfENF6kavedpCbWjDCGXw71E68kA0i6FIOk4lWnbEBwjUZ+
	 NEoH4nCpY+NdFuLsvunI16QR6mnpXezyznGjs+WLTjekXzm0h1StXiLHBu73AFHOL/
	 Ts3Uht1lht76VlKYk+0dLsluGfk3B2UlmxbF7xzrToCs2FxRHMWBJC0rYmz2z5mR3A
	 Gvb3owyNz0rfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC82C42679;
	Wed, 27 May 2026 22:59:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F882E9
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 013CE61664
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2l-nZVbSluAO for <buildroot@buildroot.org>;
 Wed, 27 May 2026 22:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55ACB6155E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55ACB6155E
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AB1C8708B; Wed, 27 May 2026 22:59:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 00:52:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08f3757b0f2133b0ed50e1ef3d7a5a1d9c80de1c
X-Git-Newrev: 38358daba978181f08a0b135782116f87c73562d
X-Patchwork-Hint: ignore
Message-Id: <20260527225934.8AB1C8708B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: link with libatomic if
 needed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/38358daba978181f08a0b135782116f87c73562d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit d4b8a42fb253116befe539e5529ac4efd97ab421 bumped the
package to version 1.0.18 which introduced build errors on sparc:

/home/autobuild/autobuild/instance-21/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/15.2.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 ../libde265/libde265.so.0.1.12: undefined reference to
 `__atomic_fetch_add_4'

Fixes:
https://autobuild.buildroot.net/results/605/605dc19e86f113662cc35fe055c64c52698d70b4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libde265/libde265.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 8c2fa4a3c3..d7e3df83ca 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -11,4 +11,9 @@ LIBDE265_LICENSE_FILES = COPYING
 LIBDE265_CPE_ID_VENDOR = struktur
 LIBDE265_INSTALL_STAGING = YES
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBDE265_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
