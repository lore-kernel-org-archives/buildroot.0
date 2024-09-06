Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BC6CE7AA3
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 12:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCDC184166;
	Fri,  6 Sep 2024 12:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74o3Z7QpCzFz; Fri,  6 Sep 2024 12:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9071284129
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9071284129;
	Fri,  6 Sep 2024 12:00:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94B5B1BF355
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 12:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8245440C67
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 12:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nt7GXRAxP3dQ for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 12:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71E9D40BFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71E9D40BFB
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 12:00:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D78186EA0; Fri,  6 Sep 2024 12:00:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Sep 2024 13:51:52 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 253bbaae01a4ee200072d3851e7d37887086065f
X-Git-Newrev: e8ba4ef9bb594cf6719f220b9950089ae390b198
X-Patchwork-Hint: ignore
Message-Id: <20240906120008.5D78186EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/aer-inject: fix
 build error due to missing basename() prototype
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4187979885680504064=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4187979885680504064==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e8ba4ef9bb594cf6719f220b9950089ae390b198
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fixes:

  http://autobuild.buildroot.net/results/e613fc777051be6325d7e3c088d5f723fab518fa/

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2a700617cc1aa14deb9f4e4f5c63e19c77901389)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aer-inject/0001-libgen-basename.patch | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/aer-inject/0001-libgen-basename.patch b/package/aer-inject/0001-libgen-basename.patch
new file mode 100644
index 0000000000..0762f5e305
--- /dev/null
+++ b/package/aer-inject/0001-libgen-basename.patch
@@ -0,0 +1,35 @@
+From 197f51d29a01f46750fa6928409301aa8f1163d7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 09:04:40 -0700
+Subject: aer-inject: Include libgen.h for explicit basename prototype
+
+The prototype for basename has been removed from string.h in the latest
+versions of musl [1]. This absence of prototype is flagged as an error
+by some compilers, such as clang-18. To resolve this, include libgen.h
+explicitly, which provides the prototype for basename.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[sathya: Updated the commit log]
+Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/knsathya/aer-inject.git/commit/?id=197f51d29a01f46750fa6928409301aa8f1163d7
+Signed-off-by: J. Neuschaefer <j.neuschaefer@gmx.net>
+---
+ aer-inject.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/aer-inject.c b/aer-inject.c
+index 74e7f72..eed1211 100644
+--- a/aer-inject.c
++++ b/aer-inject.c
+@@ -11,6 +11,7 @@
+  */
+
+ #include <stdio.h>
++#include <libgen.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <fcntl.h>
+--
+cgit 1.2.3-korg
+

--===============4187979885680504064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4187979885680504064==--
