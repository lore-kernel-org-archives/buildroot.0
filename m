Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93CBC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FD9983E2C;
	Fri, 11 Jul 2025 10:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdXUC7FstWLi; Fri, 11 Jul 2025 10:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A08481F7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A08481F7F;
	Fri, 11 Jul 2025 10:21:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 021E1199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0DD840EB8
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqW3dmRZkzsY for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE9AD40C6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE9AD40C6F
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC9E486337; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:34:49 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 5248c9b80a2de291eeb1878523d5d14f92c74b74
X-Git-Newrev: dd100567ed830d3186ba90e85659b98486cc1b75
X-Patchwork-Hint: ignore
Message-Id: <20250711102103.BC9E486337@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/net-tools: fix
 regression introduced by CVE fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd100567ed830d3186ba90e85659b98486cc1b75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Commit [1] backported an upstream patch to address CVE-2025-46836 that
included a regression.
Upstream later fixed this regression in commit [2].

This patch add that fix to correct the issue introduced by the original
patch.

[1] 323aaa9f54 package/net-tools: add upstream security fix for CVE-2025-46836
[2] https://sourceforge.net/p/net-tools/code/ci/ddb0e375fb9ca95bb69335540b85bbdaa2714348/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d3274210f9821cee8a2104bdcdd8e2b45b4ac6f4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...2025-46836-interface-statistic-regression.patch | 30 ++++++++++++++++++++++
 package/net-tools/net-tools.mk                     |  1 +
 2 files changed, 31 insertions(+)

diff --git a/package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch b/package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch
new file mode 100644
index 0000000000..60cae48aef
--- /dev/null
+++ b/package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch
@@ -0,0 +1,30 @@
+From ddb0e375fb9ca95bb69335540b85bbdaa2714348 Mon Sep 17 00:00:00 2001
+From: Bernd Eckenfels <net-tools@lina.inka.de>
+Date: Sat, 17 May 2025 21:53:23 +0200
+Subject: [PATCH] Interface statistic regression after 7a8f42fb2
+
+CVE: CVE-2025-46836
+Upstream: https://sourceforge.net/p/net-tools/code/ci/ddb0e375fb9ca95bb69335540b85bbdaa2714348/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ lib/interface.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/lib/interface.c b/lib/interface.c
+index a054f12..ca4adf1 100644
+--- a/lib/interface.c
++++ b/lib/interface.c
+@@ -239,12 +239,11 @@ static const char *get_name(char *name, const char *p)
+                 /* copy the digits */
+                 while (*p && isdigit((unsigned char)*p) && dst < end)
+                     *dst++ = *p++;
+-
+-                if (*p == ':')              /* consume trailing colon     */
+-                    ++p;
+             } else {              /* if so treat as normal */
+                 p = dot;
+             }
++            if (*p == ':')                  /* consume trailing colon */
++                ++p;
+             break;                          /* interface name ends here   */
+         }
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index a227d6477f..0468a00bf0 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -13,6 +13,7 @@ NET_TOOLS_LICENSE_FILES = COPYING
 NET_TOOLS_CPE_ID_VALID = YES
 
 # 0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
+# 0002-CVE-2025-46836-interface-statistic-regression.patch
 NET_TOOLS_IGNORE_CVES += CVE-2025-46836
 
 define NET_TOOLS_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
