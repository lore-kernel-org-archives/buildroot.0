Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77CEFCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C030460DFE;
	Fri,  6 Mar 2026 19:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sq17WUeYLNcJ; Fri,  6 Mar 2026 19:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C098613EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826750;
	bh=jF5fxsJjOaGzoMONPXLjfeng0KkWg4OYX9J6O/OWJk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NNL0o2Dm4PmMNxrVTrtsLAohqC97gHso1sE5ZHH/1Sv5Tdigl4vYA3VK/1MdxyY21
	 84AHfg8Dwm3jlCsEV4XQyIBkUvEIYqasXu7E0V0jFQ05nt4cF+5CZI3+6sFd45Zp4u
	 EvnAOGTiOZIKPXvL/iMsDNP2Va1B62L/fm2c9tiPRo3ODbHxExLoqFoeAtmUQ8qgil
	 DKD4lSPj1Jr2Ysn+mdAy67RyBx5oR/FAgr/iFmWfb3Xx8IRRoMsC23JEoxPvcEsl8J
	 pbjp5fmef5aBo9AEfbw3K8PYvv/tuakQ31Fs+lqhJODovAiZpqlQWAY2JN01eZWWMY
	 HPsUrYpLjjG4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C098613EC;
	Fri,  6 Mar 2026 19:52:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E4A2223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D4B241E66
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHyuhsSFJqz4 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9131141E48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9131141E48
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6B6B83582; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:49:12 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 89676178fd163e3130e4d4f673961405d8d39bdc
X-Git-Newrev: 094b53a414d6c03e068563135713fa35714acbad
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.A6B6B83582@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tinyproxy: add
 patch for CVE-2025-63938
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/094b53a414d6c03e068563135713fa35714acbad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

- CVE-2025-63938:
    Tinyproxy through 1.11.2 contains an integer overflow vulnerability in
    the strip_return_port() function within src/reqs.c.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-63938
  - https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit be07b5766ac92efc37b6e2cd49ccb7a43212e949)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...nteger-overflow-in-port-number-processing.patch | 41 ++++++++++++++++++++++
 package/tinyproxy/tinyproxy.mk                     |  3 ++
 2 files changed, 44 insertions(+)

diff --git a/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch b/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch
new file mode 100644
index 0000000000..3b14a58fb6
--- /dev/null
+++ b/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch
@@ -0,0 +1,41 @@
+From 3c0fde94981b025271ffa1788ae425257841bf5a Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Fri, 17 Oct 2025 22:57:39 +0000
+Subject: [PATCH] reqs: fix integer overflow in port number processing
+
+closes #586
+
+CVE: CVE-2025-63938
+Upstream: https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/reqs.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 52135a03..a562c68a 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -174,7 +174,7 @@ static int strip_return_port (char *host)
+ {
+         char *ptr1;
+         char *ptr2;
+-        int port;
++        unsigned port;
+ 
+         ptr1 = strrchr (host, ':');
+         if (ptr1 == NULL)
+@@ -186,8 +186,11 @@ static int strip_return_port (char *host)
+                 return 0;
+ 
+         *ptr1++ = '\0';
+-        if (sscanf (ptr1, "%d", &port) != 1)    /* one conversion required */
+-                return 0;
++
++        port = atoi(ptr1);
++        /* check that port string is in the valid range 1-0xffff) */
++        if(strlen(ptr1) > 5 || (port & 0xffff0000)) return 0;
++
+         return port;
+ }
+ 
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 6656a752a6..c5e975d8ab 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -11,4 +11,7 @@ TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
 TINYPROXY_CPE_ID_VALID = YES
 
+# 0001-reqs-fix-integer-overflow-in-port-number-processing.patch
+TINYPROXY_IGNORE_CVES += CVE-2025-63938
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
