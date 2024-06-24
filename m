Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D32BC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2A4C60ED1;
	Mon, 24 Jun 2024 20:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CL1X99DI2I6m; Mon, 24 Jun 2024 20:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1770B60B20
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1770B60B20;
	Mon, 24 Jun 2024 20:03:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38BA21BF95D
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E3A5608FB
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYNbXNzZOacu for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A09660A77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A09660A77
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 593A082B84; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:37:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cbbe1d6e3142e3b34cb9262ffd826a385f3a28d
X-Git-Newrev: 7e1800c7e477548117a39717c42d06c884046419
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.593A082B84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnl: update the patch to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7e1800c7e477548117a39717c42d06c884046419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

While we're at it, also fix the upstream status to the proper Upstream:
tag.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Arnout: add proper Upstream: tag and update checkpackageignore]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                   |  1 -
 ...dd-musl-workaround-to-the-libc-compat.h-copy.patch | 19 ++++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 807cee1a08..b28846cd55 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -869,7 +869,6 @@ package/libmpeg2/0004-fix-sparc.patch lib_patch.Upstream
 package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch lib_patch.Upstream
 package/libnfc/0001-autotools-make-example-build-optional.patch lib_patch.Upstream
 package/libnids/0001-libpcap-use-pkg-config.patch lib_patch.Upstream
-package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch lib_patch.Upstream
 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch lib_patch.Upstream
 package/liboauth/0001-Fixes-build-issue-with-OpenSSL-1.1.0.patch lib_patch.Upstream
 package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch lib_patch.Upstream
diff --git a/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
index 57d1c8747d..227769da28 100644
--- a/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
+++ b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
@@ -1,4 +1,4 @@
-From be07fdbc9658de19304defa7538f219cd3f21ec0 Mon Sep 17 00:00:00 2001
+From 5c984c942e2f9dca4a8380ed782519d9cb0f554d Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Sun, 12 Mar 2017 08:52:20 +0200
 Subject: [PATCH] Add musl workaround to the libc-compat.h copy
@@ -12,26 +12,27 @@ definitions will be needed. See the Buildroot iproute2 patch
 package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: libc-compat.h is a local copy of a kernel headers. A proper
-musl fix must go to the kernel first.
+Upstream: libc-compat.h is a local copy of a kernel headers. A proper
+          musl fix must go to the kernel first.
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  include/linux-private/linux/libc-compat.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/linux-private/linux/libc-compat.h b/include/linux-private/linux/libc-compat.h
-index 9bed5b6ae4d9..e2562a819464 100644
+index a1599911e7a9..f6df7193b8b4 100644
 --- a/include/linux-private/linux/libc-compat.h
 +++ b/include/linux-private/linux/libc-compat.h
-@@ -49,7 +49,7 @@
+@@ -50,7 +50,7 @@
  #define _LIBC_COMPAT_H
  
  /* We have included glibc headers... */
 -#if defined(__GLIBC__)
 +#if 1
  
- /* Coordinate with glibc netinet/in.h header. */
- #if defined(_NETINET_IN_H)
+ /* Coordinate with glibc net/if.h header. */
+ #if defined(_NET_IF_H) && defined(__USE_MISC)
 -- 
-2.11.0
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
