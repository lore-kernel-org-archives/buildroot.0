Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDE9C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC308231C;
	Mon,  6 May 2024 20:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-DCHn4kZ7wH; Mon,  6 May 2024 20:15:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A49F182341
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A49F182341;
	Mon,  6 May 2024 20:15:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00BEA1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E19A782341
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPtTrRJz_Bcv for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E85E98231C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E85E98231C
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:15:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7615868E0; Mon,  6 May 2024 20:15:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:15:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20817818333acb9bbfb22b4b194a1b36fadf7648
X-Git-Newrev: aae8ebc9a5a0bc997d2ab986623f7b0fd9d86f85
X-Patchwork-Hint: ignore
Message-Id: <20240506201524.D7615868E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snmppp: bump to version 3.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=aae8ebc9a5a0bc997d2ab986623f7b0fd9d86f85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop non-v3 fix patch as this was upstreamed

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                            |  1 -
 package/snmppp/0001-fix-build-without-v3.patch | 43 --------------------------
 package/snmppp/snmppp.hash                     |  2 +-
 package/snmppp/snmppp.mk                       |  2 +-
 4 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 33d2b011ae..2118269003 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1466,7 +1466,6 @@ package/smcroute/S41smcroute NotExecutable lib_sysv.Indent lib_sysv.Variables
 package/smstools3/0001-fix-Makefile.patch lib_patch.Upstream
 package/smstools3/0002-fix-build-with-gcc-10.x.patch lib_patch.Upstream
 package/smstools3/S50smsd Shellcheck lib_sysv.Variables
-package/snmppp/0001-fix-build-without-v3.patch lib_patch.Upstream
 package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch lib_patch.Upstream
 package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch lib_patch.Upstream
 package/snort/0003-configure.in-convert-AC_RUN_IFELSE-to-AC_CHECK_MEMBE.patch lib_patch.Upstream
diff --git a/package/snmppp/0001-fix-build-without-v3.patch b/package/snmppp/0001-fix-build-without-v3.patch
deleted file mode 100644
index 4e81f7bfc1..0000000000
--- a/package/snmppp/0001-fix-build-without-v3.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-fix build without v3
-
-Fix the following build failure without version3 raised since version
-3.5.0:
-
-msgqueue.cpp: In member function 'int Snmp_pp::CSNMPMessage::ResendMessage()':
-msgqueue.cpp:263:34: error: 'version3' was not declared in this scope; did you mean 'version1'?
-  263 |   if (m_target->get_version() == version3) {
-      |                                  ^~~~~~~~
-      |                                  version1
-
-Fixes:
- - http://autobuild.buildroot.org/results/8ef3e4407a51c53c15e530606227338761dd905b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to katz.agentpp.com@magenta.de]
-
-diff -Nura snmp++-3.5.0.orig/src/msgqueue.cpp snmp++-3.5.0/src/msgqueue.cpp
---- snmp++-3.5.0.orig/src/msgqueue.cpp	2023-03-20 10:49:30.629000853 +0100
-+++ snmp++-3.5.0/src/msgqueue.cpp	2023-03-20 10:51:36.880664304 +0100
-@@ -260,18 +260,20 @@
-   m_target->set_retry(m_target->get_retry() - 1);
-   SetSendTime();
-   int status;
--  if (m_target->get_version() == version3) {
- #ifdef _SNMPv3
-+  if (m_target->get_version() == version3) {
-     // delete entry in cache
-     if (m_snmp->get_mpv3())
- 	    m_snmp->get_mpv3()->delete_from_cache(m_pdu.get_request_id());
--#endif
-     status = m_snmp->snmp_engine(m_pdu, m_pdu.get_error_status(), m_pdu.get_error_index(),
- 		    *m_target, m_callBack, m_callData, m_socket, 0, this);
-   }
-   else {
-+#endif
-     status = send_snmp_request(m_socket, m_rawPdu, m_rawPduLen, *m_address);
-+#ifdef _SNMPv3
-   }
-+#endif
-   if (status != 0)
-     return SNMP_CLASS_TL_FAILED;
- 
diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 74c6a3e98f..b66056ef40 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  43a433bd5f6fd67add5a26add6521ca664c41aead438405658ed57483664b4bf  snmp++-3.5.0.tar.gz
+sha256  034553f7cb75d7ce1fe70cb3ba06e88587b6bca4fa062d10344ce4555a1395f7  snmp++-3.5.1.tar.gz
 sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 9f1916dd66..966bb340fd 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.5.0
+SNMPPP_VERSION = 3.5.1
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
