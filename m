Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EC3FD9E0E
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD2340788;
	Thu, 26 Feb 2026 20:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0dG6ttk8JQu; Thu, 26 Feb 2026 20:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B37407AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138740;
	bh=841Ujrm7ojMGBDsADgRmhBmWj1G+YhTXL+knJiEjvlI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tCN1yPHKMgbP9VQfROAt3+dVcG6S+toWaD8iSJ+pj2+CaklrU0CKOtGjOm8rSHhlz
	 JzOxYYkCuUfX8TVPXKjnK4RCYTnbFUYpBpMaoyKivTSK8pL94IB3H/X8wtlhXsqh+A
	 1cvEgTYxMpjIJbb3ibcPYXSS1Qfs4ebuC2vbg+rI7OrtUBU4VyiPKQcc0VZX3xVV1m
	 TBmqRw0rk7xGRUhsxFjV8iM9mPMnfcCjtzbeDc56SqeeLK+hif8zW3vETRggWWsRll
	 gd+4fK/hJNTkxbDDC6J2QRO1q1/xuDt2WozEHrBsinV3sxpYyF4Kuhau7htKTk5XX2
	 YCwdR+OXBN7RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B37407AA;
	Thu, 26 Feb 2026 20:45:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B41C1F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA14981195
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HL-AtDgVilR for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE03B81196
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE03B81196
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4DBC85784; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:37:42 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 558e05f6057f59a7f10db344b9fa44fa24cd8252
X-Git-Newrev: 9634c4d5843b3c8864eb76ecacf485935b748516
X-Patchwork-Hint: ignore
Message-Id: <20260226204529.E4DBC85784@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/netsnmp: add
 patch for CVE-2025-68615
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9634c4d5843b3c8864eb76ecacf485935b748516
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes the following security vulnerability:

- CVE-2025-68615:
    net-snmp is a SNMP application library, tools and daemon. Prior to
    versions 5.9.5 and 5.10.pre2, a specially crafted packet to an net-
    snmp snmptrapd daemon can cause a buffer overflow and the daemon to
    crash. This issue has been patched in versions 5.9.5 and 5.10.pre2.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-68615
  - https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d51117ccde04623b7e697d7e12f36241dcad522d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ptrapd-Fix-out-of-bounds-trapOid-accesses.patch | 32 ++++++++++++++++++++++
 package/netsnmp/netsnmp.mk                         |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch b/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
new file mode 100644
index 0000000000..a937b53644
--- /dev/null
+++ b/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
@@ -0,0 +1,32 @@
+From b4e6f826d9ddcc2d72eac432746807e1234266db Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Sun, 2 Nov 2025 14:48:55 -0800
+Subject: [PATCH] snmptrapd: Fix out-of-bounds trapOid[] accesses
+
+Fixes: https://issues.oss-fuzz.com/issues/457106694
+Fixes: https://issues.oss-fuzz.com/issues/458668421
+Fixes: https://issues.oss-fuzz.com/issues/458876071
+CVE: CVE-2025-68615
+Upstream: https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ apps/snmptrapd_handlers.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/apps/snmptrapd_handlers.c b/apps/snmptrapd_handlers.c
+index 6cd126f266..afd93ed0fb 100644
+--- a/apps/snmptrapd_handlers.c
++++ b/apps/snmptrapd_handlers.c
+@@ -1112,6 +1112,12 @@ snmp_input(int op, netsnmp_session *session,
+ 	     */
+             if (pdu->trap_type == SNMP_TRAP_ENTERPRISESPECIFIC) {
+                 trapOidLen = pdu->enterprise_length;
++                /*
++                 * Drop packets that would trigger an out-of-bounds trapOid[]
++                 * access.
++                 */
++                if (trapOidLen < 1 || trapOidLen > OID_LENGTH(trapOid) - 2)
++                    return 1;
+                 memcpy(trapOid, pdu->enterprise, sizeof(oid) * trapOidLen);
+                 if (trapOid[trapOidLen - 1] != 0) {
+                     trapOid[trapOidLen++] = 0;
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index a79c13c611..1c7e406a4e 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -11,6 +11,8 @@ NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
+# 0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
+NETSNMP_IGNORE_CVES += CVE-2025-68615
 NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
