Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311ECC3ABC9
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB6360BAB;
	Fri,  9 May 2025 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dVRizHy85La; Fri,  9 May 2025 21:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC40C606F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC40C606F6;
	Fri,  9 May 2025 21:20:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5B3515A
 for <buildroot@buildroot.org>; Fri,  9 May 2025 21:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB4D54163E
 for <buildroot@buildroot.org>; Fri,  9 May 2025 21:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5l3Do9cFdmp for <buildroot@buildroot.org>;
 Fri,  9 May 2025 21:20:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 751554162C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 751554162C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 751554162C
 for <buildroot@buildroot.org>; Fri,  9 May 2025 21:20:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A969343A84;
 Fri,  9 May 2025 21:20:22 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  9 May 2025 23:20:19 +0200
Message-ID: <20250509212020.323351-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509212020.323351-1-thomas.petazzoni@bootlin.com>
References: <20250509212020.323351-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeduffduvefhhfefhedvleethfefueetueefueeuvdeiteehgfffteeuveetfeeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdpshhouhhrtggvfhhorhhgvgdrnhgvthenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegpdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiii
 ihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746825622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ByoLU10yTCNh6rNochwSXuYHm6IK3Yz/OA0oUSsPRU=;
 b=cl3x6kKomab1ao7YRxYTCgWrt05j5X9wPToulBc4pSwwU8RhJ1QTYX6EiaMZEZ4zMOzEll
 UyauXYUO5IXspCAOVFXDCqB16fYENsnNh/Z7Iz7ecGw9zi1wwAp2eNzqwgzbOgui95gHYv
 aLrDSl2sBda2Bm5td+r+mBvX7sh/5UbjpgJRTjrd2aoixBDOYenYo2Cgolkz967iXIhYk+
 uUGH4cve/zYMrfx+5ujiNF4dNmcr/9UiQ6L2LgQ89l4iW3fYQhoBr4tZvTv73tJkYNEGiM
 RGPk4IA/U5aBHdsVHZg0g5cSGdziYnlPJSrjcfwjfs72E28L2CXUu65+xsIUuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cl3x6kKo
Subject: [Buildroot] [PATCH 2/2] package/netsnmp: bump to version 5.9.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes 5.9.3 to 5.9.4:

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
---
 ...compatibility-parsing-proc-net-snmp.patch} |  0
 ...agent-disallow-SET-with-NULL-varbind.patch | 72 -------------------
 package/netsnmp/netsnmp.hash                  |  6 +-
 package/netsnmp/netsnmp.mk                    |  2 +-
 4 files changed, 4 insertions(+), 76 deletions(-)
 rename package/netsnmp/{0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch => 0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch} (100%)
 delete mode 100644 package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch

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
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
