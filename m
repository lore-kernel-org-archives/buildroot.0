Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C186CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 609D66F4E3;
	Thu, 11 Sep 2025 19:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72zYFu1KCwWm; Thu, 11 Sep 2025 19:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68D456F4C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68D456F4C8;
	Thu, 11 Sep 2025 19:01:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13CF5E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4F7E407B6
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQ1alb_UM-XT for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA10F40847
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA10F40847
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7260842A2; Thu, 11 Sep 2025 19:01:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:15:33 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: ac924169fc5a23a4d1f7af4c847b9e6ca7c8f729
X-Git-Newrev: e7669f94b50927ed23dd9b42ceedda678ec28280
X-Patchwork-Hint: ignore
Message-Id: <20250911190108.E7260842A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/firewalld:
 backport Python 3.13 port
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e7669f94b50927ed23dd9b42ceedda678ec28280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The module pipes is no longer part of the Python standard library. It
was removed in Python 3.13 after being deprecated in Python 3.11. The
last version of Python that provided the pipes module was Python 3.12.

Our firewalld 2.0.2 version is now superseded by several releases
(up to 2.3.1) that include this patch (since 2.1.0).

[1] https://github.com/firewalld/firewalld/releases/tag/v2.3.1

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422466 (TestFirewalldSysVInit)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cd0b373314017c4579e319a824e7cda3df5dfe6c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-functions-don-t-use-deprecated-pipes.quo.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch b/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch
new file mode 100644
index 0000000000..0deacbcca0
--- /dev/null
+++ b/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch
@@ -0,0 +1,42 @@
+From 0bfa4eb3e15d8df8a68a8c3429505905afae112e Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Fri, 7 Jul 2023 18:13:10 +0200
+Subject: [PATCH] improvement(functions): don't use deprecated pipes.quote()
+
+Since Python 3.3, shlex.quote() replaces it. This avoids a deprecation
+warning.
+
+Upstream: f7f5613b76c044c62c876ae87c6b85f5a41acb2a
+[Romain: backport to 2.0.2]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/firewall/functions.py | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/src/firewall/functions.py b/src/firewall/functions.py
+index f7133d71..6213e778 100644
+--- a/src/firewall/functions.py
++++ b/src/firewall/functions.py
+@@ -34,7 +34,6 @@ import socket
+ import os
+ import os.path
+ import shlex
+-import pipes
+ import string
+ import tempfile
+ from firewall.core.logger import log
+@@ -607,10 +606,7 @@ def checkContext(context):
+     return True
+ 
+ def joinArgs(args):
+-    if "quote" in dir(shlex):
+-        return " ".join(shlex.quote(a) for a in args)
+-    else:
+-        return " ".join(pipes.quote(a) for a in args)
++    return " ".join(shlex.quote(a) for a in args)
+ 
+ def splitArgs(_string):
+     return shlex.split(_string)
+-- 
+2.51.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
