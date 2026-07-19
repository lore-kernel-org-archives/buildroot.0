Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF8EC4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 11:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6214A80906;
	Sun, 19 Jul 2026 11:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyMV7UJqUJFC; Sun, 19 Jul 2026 11:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492FA808C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784460884;
	bh=aZJnwi0YA29Nq4Zl2JrgxQtkJ51gzadIT/zV2ix20/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jyidZRsfBQLV18j49Ru65RcA6Zrv9FfY95+vkCI4mCKUiP4k+rXboW5jcZqUfN2nK
	 bd0NHTA50rYMGhdUmFpsQbFSBxnYX6TUpTk6D3dD1MPewDbU674gRkoSnPXPpm60Me
	 aq5nJU9c8ySs3rs3Kz1YprPzTYjXiLOXIOtYeKzHKN6ZqNNaO86KwNZQoQ2Nwf70og
	 rEDDBv90fjy1fWDoiqZEILHQ6RE8ExkT2Zzk9evT9w8nm2YNuM2kdkbLxOk89CVdhs
	 JRwZUAryA9KyhEqSqJRH8XuFDHK50UIx/mLso2kea/7ep3l9BTctNPcizxOrSTAn+E
	 bnhLSg2IE/Ocw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492FA808C7;
	Sun, 19 Jul 2026 11:34:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBF671F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4478808C7
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4msblej-4SLq for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 11:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD20808C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DD20808C6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33B5B88F80; Sun, 19 Jul 2026 11:34:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 13:08:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cd5559163131e105b837d80389292e1bb6d0fc7
X-Git-Newrev: f8eeb68b129f93ce40bf66929d5980560426b2cd
X-Patchwork-Hint: ignore
Message-Id: <20260719113404.33B5B88F80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: Fix static link of
 libevent
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8eeb68b129f93ce40bf66929d5980560426b2cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit fabcd7c8cc44e7e03c68bfcd2b4e2d10331a93f6 bumped the
package from 28.0 to 30.0 which includes upstream commit
https://github.com/bitcoin/bitcoin/commit/b619bdc3303217f4415342fe60e586e18fa48308
that was first included in version 29.0 and changed the linking of
libevent libraries.

This causes build errors when linked statically due to the wrong order
of libraries. To fix the problem we add a patch to change the order of
the libevent libraries.

The patch was not sent upstream because libevent support was removed
from the master branch with upstream commit:
https://github.com/bitcoin/bitcoin/commit/35d2d0679782581cbbf05babc59f0f28858a9b72

Fixes:
https://autobuild.buildroot.org/results/80e05370b6542ba2f5d2908bad7f420f76dc6831/

The oldest build error of this kind dates back to Dec 2025:
https://autobuild.buildroot.net/results/6bb/6bbd822d55dfcf3862e8b713323e0f34f65990ee/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../bitcoin/0001-Fix-static-link-of-libevent.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/bitcoin/0001-Fix-static-link-of-libevent.patch b/package/bitcoin/0001-Fix-static-link-of-libevent.patch
new file mode 100644
index 0000000000..8c8e95bd0f
--- /dev/null
+++ b/package/bitcoin/0001-Fix-static-link-of-libevent.patch
@@ -0,0 +1,36 @@
+From 28c3533e5fb350fe1c27cf06dee6928825bc7bf2 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 18 Jul 2026 07:46:09 +0200
+Subject: [PATCH] Fix static link of libevent
+
+Change link order to fix build error
+
+/home/thomas/autobuild/instance-2/output-1/host/lib/gcc/i686-buildroot-linux-musl/14.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
+ /home/thomas/autobuild/instance-2/output-1/host/i686-buildroot-linux-musl/sysroot/usr/lib/libevent_extra.a(http.o):
+ in function `evhttp_connection_retry':
+http.c:(.text+0x1f7b): undefined reference to `bufferevent_socket_get_conn_address_'
+
+Upstream: Not applicable (libevent support was removed in master branch)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index ad18115bbc..8e2a7bfcce 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -355,8 +355,8 @@ if(BUILD_CLI)
+     bitcoin_cli
+     bitcoin_common
+     bitcoin_util
+-    libevent::core
+     libevent::extra
++    libevent::core
+   )
+   install_binary_component(bitcoin-cli HAS_MANPAGE)
+ endif()
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
