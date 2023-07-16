Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABA0EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64FCE60B9B;
	Sun, 16 Jul 2023 16:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64FCE60B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFvi1REOxMPl; Sun, 16 Jul 2023 16:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907CD60B8B;
	Sun, 16 Jul 2023 16:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 907CD60B8B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC5A1BF35B
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 012FB60B8B
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 012FB60B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emVRapQlrUoa for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26D1760B13
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26D1760B13
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1445E86B16; Sun, 16 Jul 2023 16:01:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 17:59:08 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9af2e541e301892f7edb66179cf3160b4081a060
X-Git-Newrev: 0741fd01fa2f76a89f45b9b8a99aac508dbd128b
X-Patchwork-Hint: ignore
Message-Id: <20230716160107.1445E86B16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/agentpp: fix
 build error due to type mismatch
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

commit: https://git.buildroot.net/buildroot/commit/?id=0741fd01fa2f76a89f45b9b8a99aac508dbd128b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This was supposedly fixed by commit 5f06ecf5e151 ("package/agentpp:
security bump to version 4.6.0") but has kept happening so far.

No public place for contributions, thus this patch has been sent to private
e-mail.

Fixes:
  http://autobuild.buildroot.net/results/e8abd6bdc62a028955915706b03d72239786c703/
  http://autobuild.buildroot.net/results/24441fb679fbf5f913c9b6431c98aec596ead587/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d68f6e3042d50139f773950d679a0f83f9bb94c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Snmpx-fix-const-nonconst-type-mismatch.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch b/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch
new file mode 100644
index 0000000000..07981eff3e
--- /dev/null
+++ b/package/agentpp/0001-Snmpx-fix-const-nonconst-type-mismatch.patch
@@ -0,0 +1,51 @@
+From 7e541e6dba8d4976bbb490838a09b569f38b047d Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca.ceresoli@bootlin.com>
+Date: Mon, 26 Jun 2023 17:45:00 +0200
+Subject: [PATCH] Snmpx: fix const/nonconst type mismatch
+
+Fixes build failure:
+
+  snmp_pp_ext.cpp:1176:28: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
+   1176 |     status = snmpmsg.load( pdu, community, version);
+        |                            ^~~
+
+Fixes:
+  http://autobuild.buildroot.net/results/e8abd6bdc62a028955915706b03d72239786c703/
+  http://autobuild.buildroot.net/results/24441fb679fbf5f913c9b6431c98aec596ead587/
+
+Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
+Upstream: sent to katz.agentpp.com@magenta.de and support@agentpp.com
+---
+ include/agent_pp/snmp_pp_ext.h | 2 +-
+ src/snmp_pp_ext.cpp            | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/agent_pp/snmp_pp_ext.h b/include/agent_pp/snmp_pp_ext.h
+index 7c5a6783ee70..d8a46060db98 100644
+--- a/include/agent_pp/snmp_pp_ext.h
++++ b/include/agent_pp/snmp_pp_ext.h
+@@ -807,7 +807,7 @@ public:
+ 	 *   SNMP_CLASS_SUCCESS on success and SNMP_CLASS_ERROR,
+ 	 *   SNMP_CLASS_TL_FAILED on failure.
+ 	 */
+-        int send (Pdux const &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
++        int send (Pdux &, NS_SNMP UdpAddress const &, NS_SNMP snmp_version, NS_SNMP OctetStr const &);
+ #endif
+ 
+ 	/**
+diff --git a/src/snmp_pp_ext.cpp b/src/snmp_pp_ext.cpp
+index 54a29ec8ea28..b61cbf056246 100644
+--- a/src/snmp_pp_ext.cpp
++++ b/src/snmp_pp_ext.cpp
+@@ -1203,7 +1203,7 @@ int Snmpx::send (Pdux &pdu, SnmpTarget* target)
+ 
+ #else  // _SNMPv3 is not defined
+ 
+-int Snmpx::send (Pdux  const &pdu,
++int Snmpx::send (Pdux  &pdu,
+ 		 UdpAddress  const &udp_address,
+ 		 snmp_version version,
+ 		 OctetStr  const &community)
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
