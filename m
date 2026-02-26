Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4A8FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77EEE4079A;
	Thu, 26 Feb 2026 20:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gxhx1mRR9cy5; Thu, 26 Feb 2026 20:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BD8B407A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138649;
	bh=ENOhrMWnCAEdd7jBregdtggrcv9rKIlMCNK+YAkKDwA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X65iUud5eHCm64cQl7Ze8hTtYfT1ArsLXEe7kQHvkkz1gRaKX9LzqYQC/qea0BNg2
	 Xv4LWpvh+mmuAgiEZ/3T44fWFrMlulYNjLr2lNhOhbL4JhbrfauFv4oo+uyO1bemk+
	 kda/AqSqIYuguB2glZTon1e8W3zewPfjxsR8/G+4OzBbl1tTffd2jkTGPf0/pXePO0
	 u1TyNyQmwqNIfLDW/KxM1mSJZr4GrJuveeAAQfegm/6v1L+OUAD8YYtYmZTxx7PXZi
	 I2bVcZmnSMcQnlUU562aYajnKOVcZP4kJUUSEXXJSE2frsXWVtFnMThh3DfI0dFIKr
	 FppovIAO1xTqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD8B407A8;
	Thu, 26 Feb 2026 20:44:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 267BDA48
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C31FA80DFC
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxQFqMmKpS-C for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0443A80DFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0443A80DFD
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEC0987506; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:32:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8fa5da48d65dd5fee9b3473ee882f50a30655ccd
X-Git-Newrev: 87499e35c446721cde2526a7322f7332904e0621
X-Patchwork-Hint: ignore
Message-Id: <20260226204356.EEC0987506@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/netsnmp: add
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87499e35c446721cde2526a7322f7332904e0621
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

diff --git a/package/netsnmp/0003-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch b/package/netsnmp/0003-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
new file mode 100644
index 0000000000..a937b53644
--- /dev/null
+++ b/package/netsnmp/0003-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
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
index 6575ff1afa..32d3b1aac0 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -15,6 +15,8 @@ NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
 NETSNMP_IGNORE_CVES = \
 	CVE-2022-44792 \
 	CVE-2022-44793
+# 0003-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
+NETSNMP_IGNORE_CVES += CVE-2025-68615
 NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
