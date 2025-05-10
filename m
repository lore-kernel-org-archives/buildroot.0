Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D154C3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 17:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F49D80EE3;
	Sat, 10 May 2025 17:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFPlJ3S5uyUc; Sat, 10 May 2025 17:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6E6481751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6E6481751;
	Sat, 10 May 2025 17:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1D707B1
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97BC960825
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFXac0jOTMBm for <buildroot@buildroot.org>;
 Sat, 10 May 2025 17:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 917146079F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 917146079F
 for <buildroot@buildroot.org>; Sat, 10 May 2025 17:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8178286545; Sat, 10 May 2025 17:07:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 May 2025 19:05:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af674f3ecf44d45f92c35af8508077aa138e13f8
X-Git-Newrev: 1799cfebfd5ea1312cce74b3807d4aad044bce67
X-Patchwork-Hint: ignore
Message-Id: <20250510170757.8178286545@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsnmp: bump to version 5.9.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1799cfebfd5ea1312cce74b3807d4aad044bce67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes 5.9.3 to 5.9.4, from:
https://github.com/net-snmp/net-snmp/blob/v5.9.4/CHANGES

    IMPORTANT: SNMP over TLS and/or DTLS are not functioning properly
    in this release with various versions of OpenSSL and will be fixed
    in a future release.

    libsnmp:
      - Remove the SNMP_SWIPE_MEM() macro Remove this macro since it is not
        used in the Net-SNMP code base.
      - DISPLAY-HINT fixes
      - Miscellanious improvements to the transports
      - Handle multiple oldEngineID configuration lines
      - fixes for DNS names longer than 63 characters

    agent:
      - Added a ignoremount configuration option for the HOST-MIB
      - disallow SETs with a NULL varbind
      - fix the --enable-minimalist build

    apps:
      - snmpset: allow SET with NULL varbind for testing
      - snmptrapd: improved MySQL logging code

    general:
      - configure: Remove -Wno-deprecated as it is no longer needed
      - miscellanious ther bug fixes, build fixes and cleanups

We can drop patch 0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
because it's upstream as of commit
4589352dac3ae111c7621298cf231742209efd9b, which is part of the 5.9.4
release.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: add link to changelog]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-6.7-compatibility-parsing-proc-net-snmp.patch} |  0
 ...snmp_agent-disallow-SET-with-NULL-varbind.patch | 72 ----------------------
 package/netsnmp/netsnmp.hash                       |  6 +-
 package/netsnmp/netsnmp.mk                         |  2 +-
 4 files changed, 4 insertions(+), 76 deletions(-)

diff --git a/package/netsnmp/0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch b/package/netsnmp/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
similarity index 100%
rename from package/netsnmp/0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
rename to package/netsnmp/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
diff --git a/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch b/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
deleted file mode 100644
index 3a6321d7a7..0000000000
--- a/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From b07627fa67c686b07d1eab123cf3e4887a2a93aa Mon Sep 17 00:00:00 2001
-From: Bill Fenner <fenner@gmail.com>
-Date: Fri, 25 Nov 2022 08:41:24 -0800
-Subject: [PATCH] snmp_agent: disallow SET with NULL varbind
-
-Upstream: https://github.com/net-snmp/net-snmp/commit/4589352dac3ae111c7621298cf231742209efd9b
-
-[Thomas: this commit was merged as part of
-https://github.com/net-snmp/net-snmp/pull/490/commits, which fixes
-https://github.com/net-snmp/net-snmp/issues/474 (CVE-2022-44792) and
-https://github.com/net-snmp/net-snmp/issues/475 (CVE-2022-44793). The
-other two commits merged as part of this pull request are related to
-adding a non-regression test for this, which is not relevant for the
-security fix itself.]
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- agent/snmp_agent.c | 32 ++++++++++++++++++++++++++++++++
- 1 file changed, 32 insertions(+)
-
-diff --git a/agent/snmp_agent.c b/agent/snmp_agent.c
-index 867d0c166f..3f678fe2df 100644
---- a/agent/snmp_agent.c
-+++ b/agent/snmp_agent.c
-@@ -3719,12 +3719,44 @@ netsnmp_handle_request(netsnmp_agent_session *asp, int status)
-     return 1;
- }
- 
-+static int
-+check_set_pdu_for_null_varbind(netsnmp_agent_session *asp)
-+{
-+    int i;
-+    netsnmp_variable_list *v = NULL;
-+
-+    for (i = 1, v = asp->pdu->variables; v != NULL; i++, v = v->next_variable) {
-+	if (v->type == ASN_NULL) {
-+	    /*
-+	     * Protect SET implementations that do not protect themselves
-+	     * against wrong type.
-+	     */
-+	    DEBUGMSGTL(("snmp_agent", "disallowing SET with NULL var for varbind %d\n", i));
-+	    asp->index = i;
-+	    return SNMP_ERR_WRONGTYPE;
-+	}
-+    }
-+    return SNMP_ERR_NOERROR;
-+}
-+
- int
- handle_pdu(netsnmp_agent_session *asp)
- {
-     int             status, inclusives = 0;
-     netsnmp_variable_list *v = NULL;
- 
-+#ifndef NETSNMP_NO_WRITE_SUPPORT
-+    /*
-+     * Check for ASN_NULL in SET request
-+     */
-+    if (asp->pdu->command == SNMP_MSG_SET) {
-+	status = check_set_pdu_for_null_varbind(asp);
-+	if (status != SNMP_ERR_NOERROR) {
-+	    return status;
-+	}
-+    }
-+#endif /* NETSNMP_NO_WRITE_SUPPORT */
-+
-     /*
-      * for illegal requests, mark all nodes as ASN_NULL 
-      */
--- 
-2.41.0
-
diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index e1e9d10898..7898941271 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature at
-# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.3/net-snmp-5.9.3.tar.gz.asc
-# using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
-sha256  2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a  net-snmp-5.9.3.tar.gz
+# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.4/net-snmp-5.9.4.tar.gz.asc
+# using key 6E6718AEF1EB5C65C32D1B2A356BC0B552D53CAB
+sha256  8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544  net-snmp-5.9.4.tar.gz
 
 # Hash for license file
 sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 6575ff1afa..499e1d9477 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNMP_VERSION = 5.9.3
+NETSNMP_VERSION = 5.9.4
 NETSNMP_SITE = https://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
