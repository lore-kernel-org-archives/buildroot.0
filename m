Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60D9C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F54D4032A;
	Sun,  9 Apr 2023 13:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F54D4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FINen_zm919; Sun,  9 Apr 2023 13:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A8644014E;
	Sun,  9 Apr 2023 13:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A8644014E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 798A01C38DE
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53A5C60B29
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A5C60B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dolp9EWK6sUg for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:38:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C74260757
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C74260757
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B9EF83968; Sun,  9 Apr 2023 13:38:11 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 15:36:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97f8cc355b164ce023cd6a098051ce63c7a25f9a
X-Git-Newrev: 95b8e7245d018b1f12bec43a22071a0a9f81df68
X-Patchwork-Hint: ignore
Message-Id: <20230409133811.5B9EF83968@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: Fix builds with
 musl-libc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=95b8e7245d018b1f12bec43a22071a0a9f81df68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream commit ca6546fe521360fcf905bc115b893f322e706cb2
("shared: define MAX_INPUT for musl") to fix builds with musl-libc.

Fixes:
- http://autobuild.buildroot.net/results/3fd24a604a29eff70e20f82690e3f058f04903f9/
- http://autobuild.buildroot.net/results/bd57f1813be699cd5ce2ae94f5f511a71fe10428/
- http://autobuild.buildroot.net/results/90d528cc18a367af2f68e1c0673d962fe399e1ac/
- http://autobuild.buildroot.net/results/552b700ee129e1c7f651de13f6766eae5325dcbc/

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/bluez5_utils/0001-musl-max-input.patch | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/bluez5_utils/0001-musl-max-input.patch b/package/bluez5_utils/0001-musl-max-input.patch
new file mode 100644
index 0000000000..8612bac07f
--- /dev/null
+++ b/package/bluez5_utils/0001-musl-max-input.patch
@@ -0,0 +1,37 @@
+From ca6546fe521360fcf905bc115b893f322e706cb2 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Tue, 31 Jan 2023 05:52:58 +0000
+Subject: shared: define MAX_INPUT for musl
+
+musl systems don't have MAX_INPUT. Just define it to _POSIX_MAX_INPUT
+which musl does have if it's not already defined.
+
+Note that on glibc, the values match anyway (as of glibc-2.36), and
+indeed POSIX_MAX_INPUT has the same value on musl too.
+
+Bug: https://bugs.gentoo.org/888467
+Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=ca6546fe521360fcf905bc115b893f322e706cb2
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+---
+ src/shared/util.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/shared/util.c b/src/shared/util.c
+index 2f0ae0e86..b466fb001 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -28,6 +28,11 @@
+ #include <sys/random.h>
+ #endif
+ 
++/* define MAX_INPUT for musl */
++#ifndef MAX_INPUT
++#define MAX_INPUT _POSIX_MAX_INPUT
++#endif
++
+ #include "src/shared/util.h"
+ 
+ void *util_malloc(size_t size)
+-- 
+cgit 
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
