Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C28D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2111D4027E;
	Sun, 28 Dec 2025 22:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ryV-IrGToU0; Sun, 28 Dec 2025 22:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F6E640293
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960743;
	bh=j4h4vH22bWE0mj3xsSqPm2dfkfrj59SoVoWCzLWTg3I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HVJ+3vlILTbA839hbVR4DMgWKK/1JkqSFh/oBzST92KpU81Y8FqJ0K2Ho6TA7WLnt
	 vFTsmgGWwQYFfltiR+2WQ7faT5lu33rN5Tmr1Ma4+LrJxcIF5bxHrp4Km/h4Nf/WEh
	 KhjnDwYRB6dLwhQ/FjXLQzeFktraC3VGmAtBbA1snd3F3qY7A/ZpiHRM2V/G+mpFxn
	 ayd65Z4TmBlsBQEGtuUU2jC7MrMOYqJ41CJvwqTHehPm7oWplpPfUDmdA8y6xbikT8
	 vbANsGUizlkBE3wUFCY/xCgcS07sI2hHwBLLpXx3NYytosC0r7cBft88dkwN4BaIZi
	 c2gsFP+HFuPaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F6E640293;
	Sun, 28 Dec 2025 22:25:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D68EB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FF8340056
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jv5jRAYoBvsY for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5837F40489
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5837F40489
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51E9E87A24; Sun, 28 Dec 2025 22:25:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:21:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 443307ef50e0a5b14b095178b7c8d59ad3639ab4
X-Git-Newrev: 213e67d6f02030f7690f0c8aa241bfe0e7f5e63f
X-Patchwork-Hint: ignore
Message-Id: <20251228222541.51E9E87A24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvmtool: bump to git version
 7ad32e5514
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1692610690643589857=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1692610690643589857==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=213e67d6f02030f7690f0c8aa241bfe0e7f5e63f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the commit log, see:
https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/log/?id=7ad32e5514aca2b6d19398fd3ae5a7c5e0e1ce24

This commit also removes package patches which are now upstream.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...o-include-libgen-h-for-musl-compatibility.patch | 48 ----------------------
 package/kvmtool/kvmtool.hash                       |  2 +-
 package/kvmtool/kvmtool.mk                         |  2 +-
 3 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/package/kvmtool/0002-vfio-include-libgen-h-for-musl-compatibility.patch b/package/kvmtool/0002-vfio-include-libgen-h-for-musl-compatibility.patch
deleted file mode 100644
index e75ede6af1..0000000000
--- a/package/kvmtool/0002-vfio-include-libgen-h-for-musl-compatibility.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ba6830eec0f5ab734b093657b16b555e0437b927 Mon Sep 17 00:00:00 2001
-From: Thomas Perale <thomas.perale@mind.be>
-Date: Sun, 29 Jun 2025 22:22:21 +0200
-Subject: vfio: include libgen.h (for musl compatibility)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Starting GCC14 'implicit-function-declaration' are treated as errors by
-default. When building kvmtool with musl libc, the following error
-occurs due to missing declaration of 'basename':
-
-vfio/core.c:537:22: error: implicit declaration of function ‘basename’ [-Wimplicit-function-declaration]
-  537 |         group_name = basename(group_path);
-      |                      ^~~~~~~~
-vfio/core.c:537:22: warning: nested extern declaration of ‘basename’ [-Wnested-externs]
-vfio/core.c:537:20: error: assignment to ‘char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
-  537 |         group_name = basename(group_path);
-      |                    ^
-
-This patch fixes the issue by including the appropriate header, ensuring
-compatibility with musl and GCC14.
-
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
-Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
-Link: https://lore.kernel.org/r/20250629202221.893360-1-thomas.perale@mind.be
-Signed-off-by: Will Deacon <will@kernel.org>
-Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/patch/?id=ba6830eec0f5ab734b093657b16b555e0437b927
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- vfio/core.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/vfio/core.c b/vfio/core.c
-index 3ff2c0b0..8f884898 100644
---- a/vfio/core.c
-+++ b/vfio/core.c
-@@ -3,6 +3,7 @@
- #include "kvm/ioport.h"
- 
- #include <linux/list.h>
-+#include <libgen.h>
- 
- #define VFIO_DEV_DIR		"/dev/vfio"
- #define VFIO_DEV_NODE		VFIO_DEV_DIR "/vfio"
--- 
-cgit 1.2.3-korg
-
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index 8df6f929df..6a4219372f 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  18841c414e82b405a0bd6f5c546bc088becd298c1145a2bac97563e699231925  kvmtool-1117dbc8ceb21abc6e8cd9861450695995852290-git4.tar.gz
+sha256  655f7691fc80416161b1d832575abfcd1223fbefa2900653ed5ddaab3ee738ec  kvmtool-7ad32e5514aca2b6d19398fd3ae5a7c5e0e1ce24-git4.tar.gz
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 58ca2d3642..80248807e1 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVMTOOL_VERSION = 1117dbc8ceb21abc6e8cd9861450695995852290
+KVMTOOL_VERSION = 7ad32e5514aca2b6d19398fd3ae5a7c5e0e1ce24
 KVMTOOL_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git
 KVMTOOL_SITE_METHOD = git
 KVMTOOL_DEPENDENCIES = \

--===============1692610690643589857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1692610690643589857==--
