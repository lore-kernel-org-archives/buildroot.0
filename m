Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCB9C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A6AB60C01;
	Wed,  8 May 2024 16:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6x_-YiLn_Qm; Wed,  8 May 2024 16:31:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ADFA60C2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ADFA60C2E;
	Wed,  8 May 2024 16:31:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCAB41BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D630681882
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTZTdp6PZlwF for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13379817E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13379817E4
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:31:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F302E86AC1; Wed,  8 May 2024 16:31:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:31:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f44b46c47bd6d961fdc0e0aa9476d32f508e091c
X-Git-Newrev: fcc6ece8f4d423f28599e0664d3a29dcf85a8deb
X-Patchwork-Hint: ignore
Message-Id: <20240508163154.F302E86AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/agentpp: bump to version 4.6.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fcc6ece8f4d423f28599e0664d3a29dcf85a8deb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 4.6.1 and drop the linking without v3 patch as this
version integrates the fix for that

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-Snmpx-fix-const-nonconst-type-mismatch.patch | 51 ----------------------
 package/agentpp/agentpp.hash                       |  2 +-
 package/agentpp/agentpp.mk                         |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch b/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch
deleted file mode 100644
index 07981eff3e..0000000000
--- a/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 7e541e6dba8d4976bbb490838a09b569f38b047d Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca.ceresoli@bootlin.com>
-Date: Mon, 26 Jun 2023 17:45:00 +0200
-Subject: [PATCH] Snmpx: fix const/nonconst type mismatch
-
-Fixes build failure:
-
-  snmp_pp_ext.cpp:1176:28: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
-   1176 |     status = snmpmsg.load( pdu, community, version);
-        |                            ^~~
-
-Fixes:
-  http://autobuild.buildroot.net/results/e8abd6bdc62a028955915706b03d72239786c703/
-  http://autobuild.buildroot.net/results/24441fb679fbf5f913c9b6431c98aec596ead587/
-
-Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
-Upstream: sent to katz.agentpp.com@magenta.de and support@agentpp.com
----
- include/agent_pp/snmp_pp_ext.h | 2 +-
- src/snmp_pp_ext.cpp            | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/agent_pp/snmp_pp_ext.h b/include/agent_pp/snmp_pp_ext.h
-index 7c5a6783ee70..d8a46060db98 100644
---- a/include/agent_pp/snmp_pp_ext.h
-+++ b/include/agent_pp/snmp_pp_ext.h
-@@ -807,7 +807,7 @@ public:
- 	 *   SNMP_CLASS_SUCCESS on success and SNMP_CLASS_ERROR,
- 	 *   SNMP_CLASS_TL_FAILED on failure.
- 	 */
--        int send (Pdux const &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
-+        int send (Pdux &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
- #endif
- 
- 	/**
-diff --git a/src/snmp_pp_ext.cpp b/src/snmp_pp_ext.cpp
-index 54a29ec8ea28..b61cbf056246 100644
---- a/src/snmp_pp_ext.cpp
-+++ b/src/snmp_pp_ext.cpp
-@@ -1203,7 +1203,7 @@ int Snmpx::send (Pdux &pdu, SnmpTarget* target)
- 
- #else  // _SNMPv3 is not defined
- 
--int Snmpx::send (Pdux  const &pdu,
-+int Snmpx::send (Pdux  &pdu,
- 		 UdpAddress  const &udp_address,
- 		 snmp_version version,
- 		 OctetStr  const &community)
--- 
-2.34.1
-
diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 527414eed5..7c94f4b1b0 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e09dc2d40277d468c18f1539ad18f43e0c3a95b10fad8a02184e9ace8bac0d67  agent++-4.6.0.tar.gz
+sha256  3287218cf6eaa3744b3788afd1e7d72e7a9508d45741243178404f6b47edd86f  agent++-4.6.1.tar.gz
 sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 7616d3eb0c..3756d0ca28 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.6.0
+AGENTPP_VERSION = 4.6.1
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
