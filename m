Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF86DECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 07:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5432A60A80;
	Mon, 12 Sep 2022 07:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5432A60A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wRdSL54S_Ng; Mon, 12 Sep 2022 07:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 894206080A;
	Mon, 12 Sep 2022 07:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 894206080A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E045E1BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 07:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B836481DCB
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 07:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B836481DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFvXFI2Fn3g1 for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 07:28:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A50F981DAB
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 07:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A50F981DAB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8FFD683685; Mon, 12 Sep 2022 07:28:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Sep 2022 09:28:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddedf5e785956d37bd971f1f804f8333cd9cc592
X-Git-Newrev: 1616816e13fbd95934e7647cce3e3acdbe1b072a
X-Patchwork-Hint: ignore
Message-Id: <20220912072837.8FFD683685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paho-mqtt: fix merge from
 next
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

commit: https://git.buildroot.net/buildroot/commit/?id=1616816e13fbd95934e7647cce3e3acdbe1b072a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In master, we backported a patch from upstream, to fix running on python
3.10. But at the same time, on next, we bumped the version, where that
change was present.

Now, next has been merged back into master, and the patch obviously does
not apply anymore.

Remove the patch, it is no longer needed.

Fixes:
    http://autobuild.buildroot.net/results/b76/b76b1ab80bdf1b7731731f2f561c5b64e9716513/
    http://autobuild.buildroot.net/results/f9e/f9e07621d345a9bca0be1b0a53bdb21e363d2e90/
    ...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-publish-for-python-3-10.patch         | 37 ----------------------
 1 file changed, 37 deletions(-)

diff --git a/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch b/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
deleted file mode 100644
index aad6b5d723..0000000000
--- a/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed Mon Sep 17 00:00:00 2001
-From: Brishen Hawkins <brishen.hawkins@gmail.com>
-Date: Tue, 9 Jun 2020 00:18:39 -0600
-Subject: [PATCH] Fix for Python 3.9 moving Iterable to collections.abc
-
-Signed-off-by: Brishen Hawkins <brishen.hawkins@gmail.com>
-
-Backported from: e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed
-Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
----
- src/paho/mqtt/publish.py | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/paho/mqtt/publish.py b/src/paho/mqtt/publish.py
-index f9f1986e..dcb34ff1 100644
---- a/src/paho/mqtt/publish.py
-+++ b/src/paho/mqtt/publish.py
-@@ -21,6 +21,10 @@
- from __future__ import absolute_import
- 
- import collections
-+try:
-+    from collections.abc import Iterable
-+except ImportError:
-+    from collections import Iterable
- 
- from . import client as paho
- from .. import mqtt
-@@ -124,7 +128,7 @@ def multiple(msgs, hostname="localhost", port=1883, client_id="", keepalive=60,
-     proxy_args: a dictionary that will be given to the client.
-     """
- 
--    if not isinstance(msgs, collections.Iterable):
-+    if not isinstance(msgs, Iterable):
-         raise TypeError('msgs must be an iterable')
- 
-     client = paho.Client(client_id=client_id, userdata=collections.deque(msgs),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
