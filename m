Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0C0C5B552
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C95C0615CF;
	Wed,  4 Jun 2025 18:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05pOnIaHv6hi; Wed,  4 Jun 2025 18:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAED8615E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAED8615E6;
	Wed,  4 Jun 2025 18:28:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 225271A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DEDB40091
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkecvyT6AKjd for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E5240207
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82E5240207
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81289876CD; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:29:57 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0b15b0faf39d890dcdc7854c6fa50448117c798d
X-Git-Newrev: bf96128043ec63bc04851a61c4fb64240fc3e79f
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.81289876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/net-tools: add
 upstream security fix for CVE-2025-46836
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
Content-Type: multipart/mixed; boundary="===============6535273218764390018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6535273218764390018==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bf96128043ec63bc04851a61c4fb64240fc3e79f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following security issue:

CVE-2025-46836: Stack-based Buffer Overflow in net-tools (get_name)

https://github.com/ecki/net-tools/security/advisories/GHSA-pfwf-h6m3-63wf

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 323aaa9f547f4925135874162f31323e88b0768f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...836-interface.c-Stack-based-Buffer-Overfl.patch | 93 ++++++++++++++++++++++
 package/net-tools/net-tools.mk                     |  3 +
 2 files changed, 96 insertions(+)

diff --git a/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch b/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
new file mode 100644
index 0000000000..0a02785f38
--- /dev/null
+++ b/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
@@ -0,0 +1,93 @@
+From 7a8f42fb20013a1493d8cae1c43436f85e656f2d Mon Sep 17 00:00:00 2001
+From: Zephkeks <zephyrofficialdiscord@gmail.com>
+Date: Tue, 13 May 2025 11:04:17 +0200
+Subject: [PATCH] CVE-2025-46836: interface.c: Stack-based Buffer Overflow in
+ get_name()
+
+Coordinated as GHSA-pfwf-h6m3-63wf
+
+Upstream: https://github.com/ecki/net-tools/commit/7a8f42fb20013a1493d8cae1c43436f85e656f2d
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/interface.c | 63 ++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 39 insertions(+), 24 deletions(-)
+
+diff --git a/lib/interface.c b/lib/interface.c
+index 71d4163..a054f12 100644
+--- a/lib/interface.c
++++ b/lib/interface.c
+@@ -211,32 +211,47 @@ out:
+ }
+ 
+ static const char *get_name(char *name, const char *p)
++/* Safe version — guarantees at most IFNAMSIZ‑1 bytes are copied
++   and the destination buffer is always NUL‑terminated.             */
+ {
+-    while (isspace(*p))
+-	p++;
+-    while (*p) {
+-	if (isspace(*p))
+-	    break;
+-	if (*p == ':') {	/* could be an alias */
+-		const char *dot = p++;
+- 		while (*p && isdigit(*p)) p++;
+-		if (*p == ':') {
+-			/* Yes it is, backup and copy it. */
+-			p = dot;
+-			*name++ = *p++;
+-			while (*p && isdigit(*p)) {
+-				*name++ = *p++;
+-			}
+-		} else {
+-			/* No, it isn't */
+-			p = dot;
+-	    }
+-	    p++;
+-	    break;
+-	}
+-	*name++ = *p++;
++    char       *dst = name;                 /* current write ptr          */
++    const char *end = name + IFNAMSIZ - 1;  /* last byte we may write     */
++
++    /* Skip leading white‑space. */
++    while (isspace((unsigned char)*p))
++        ++p;
++
++    /* Copy until white‑space, end of string, or buffer full. */
++    while (*p && !isspace((unsigned char)*p) && dst < end) {
++        if (*p == ':') {                    /* possible alias veth0:123:  */
++            const char *dot = p;            /* remember the colon         */
++            ++p;
++            while (*p && isdigit((unsigned char)*p))
++                ++p;
++
++            if (*p == ':') {                /* confirmed alias            */
++                p = dot;                    /* rewind and copy it all     */
++
++                /* copy the colon */
++                if (dst < end)
++                    *dst++ = *p++;
++
++                /* copy the digits */
++                while (*p && isdigit((unsigned char)*p) && dst < end)
++                    *dst++ = *p++;
++
++                if (*p == ':')              /* consume trailing colon     */
++                    ++p;
++            } else {              /* if so treat as normal */
++                p = dot;
++            }
++            break;                          /* interface name ends here   */
++        }
++
++        *dst++ = *p++;                      /* ordinary character copy    */
+     }
+-    *name++ = '\0';
++
++    *dst = '\0';                            /* always NUL‑terminate       */
+     return p;
+ }
+ 
+-- 
+2.39.5
+
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 03e1c73406..a227d6477f 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -12,6 +12,9 @@ NET_TOOLS_LICENSE = GPL-2.0+
 NET_TOOLS_LICENSE_FILES = COPYING
 NET_TOOLS_CPE_ID_VALID = YES
 
+# 0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
+NET_TOOLS_IGNORE_CVES += CVE-2025-46836
+
 define NET_TOOLS_CONFIGURE_CMDS
 	(cd $(@D); yes "" | ./configure.sh config.in )
 endef

--===============6535273218764390018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6535273218764390018==--
