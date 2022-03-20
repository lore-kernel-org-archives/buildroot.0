Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83408C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 16:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30590408B6;
	Sun, 20 Mar 2022 16:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OL6vma0cxVDO; Sun, 20 Mar 2022 16:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38095408AE;
	Sun, 20 Mar 2022 16:59:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBE341BF215
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 16:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D97EB60585
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 16:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0dfmGWV43FM for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 16:59:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A92716003C
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 16:59:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j18so8287898wrd.6
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cNmgauOT4RpGQZdk3Q/Z4XyKNOPrRYbmSQb+F5wWz8k=;
 b=Lv70IsEIA1xP5iGPpZKSWW8CfrrEDdtAm0loNrDJMdvHIMDZJQ6db1qnwEn3af6OOI
 LF6X7+7+536PiOzaA7GJ0Ppk670NkbOrFkWH7/Do93unW3eMDlzwQa2fYVg5oPCEtUON
 O3Q1zCzi+Ym0s3bgx0ovRP2k3F5TEcR60r2RuN8ShD/eHy6mf4O741ohLau+wKBaHu84
 ZBaOI+tNScog9lAaNt73uk1EALiD8AFad8d58ssMIQyktIm8DC744BleNjisPpLj6GnE
 P0Go0wWZi/p2RQqlIZogWdlxgu10KMhm0wiZCQ5eqdL8h3W18V8JDIRgiQQ1gK10rvHD
 9gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNmgauOT4RpGQZdk3Q/Z4XyKNOPrRYbmSQb+F5wWz8k=;
 b=kNQvsE5YxeAut8WhVOon0IOOHZ0I6aImeQ0Sa5u2uQHo+6kxgn3R6kHZFdc8Zb1KSX
 02qbSM95Pyozj0cwf6/kNqM94ErP/Wqm9XH7nS4Ork1oS2CmGwb+U69S/9f/PisfCWqe
 u+yffL6MjKYqqAoMMYZ33LECPc5H1knJbb08w41eOA16C0FgHeiparkqrHjMxj5umqN7
 Pub5ppMaWShC+tLl0h5a4S5BCJ/6sOW+JSQWHa8GRKOhsotZPnSbez5mXEbnfCRBxfEG
 EYX70G88audlz0KF/oJ2Oe3u7sfEb+hsjkHRCuV1yD5Xt7Xv8W8esCTL8L/puF8QPfL4
 MnWA==
X-Gm-Message-State: AOAM532+dpw9ipJfm6CbDNseT3vNtgeBP08BBEUS4Nzd1UVnylxPt0Eo
 XfNLgFbn5dyoXIKyy6rhgtPHk/PONps=
X-Google-Smtp-Source: ABdhPJy62tx6bwSvj1DTo0BRulE0lgyWmNn4DcbGtQBRWh2htHzFoBxyoyL4e5sq3ta+rRojKV7EWw==
X-Received: by 2002:adf:eb48:0:b0:203:f854:86cc with SMTP id
 u8-20020adfeb48000000b00203f85486ccmr9203545wrn.102.1647795559510; 
 Sun, 20 Mar 2022 09:59:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r186-20020a1c2bc3000000b0037bdd94a4e5sm11925842wmr.39.2022.03.20.09.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:59:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 17:58:02 +0100
Message-Id: <20220320165802.1584746-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320165802.1584746-1-fontaine.fabrice@gmail.com>
References: <20220320165802.1584746-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/agentpp: bump to version 4.5.3
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (not needed anymore):
"Fixed: Allow compilation without _SNMPv3 defined."

https://agentpp.com/download/changes_agent++.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-Fix-build-when-SNMPv3-is-disabled.patch | 102 ------------------
 package/agentpp/agentpp.hash                  |   2 +-
 package/agentpp/agentpp.mk                    |   2 +-
 3 files changed, 2 insertions(+), 104 deletions(-)
 delete mode 100644 package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch

diff --git a/package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch b/package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch
deleted file mode 100644
index f16c2b4b77..0000000000
--- a/package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 2a0fe384eec254643ca2176ccfcbbd036a5aad06 Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Tue, 14 Jul 2020 10:30:10 +0200
-Subject: [PATCH] Fix build when SNMPv3 is disabled
-
-agentpp has ifdefs to disable v3 code when SNMPv3 is disabled. However it
-is missing one and it has a few ones in excess. Fix them.
-
-Upstream is aware, says "will fix in later version", but thinks to make v3
-mandatory. See discussion at
-https://forum.snmp.app/t/agent-compile-fails-if-snmp-has-disable-snmpv3/326
-
-Upstream status: none, upstream is not welcoming contributions.
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
----
- include/agent_pp/notification_log_mib.h    | 4 ++--
- include/agent_pp/notification_originator.h | 2 ++
- include/agent_pp/snmp_community_mib.h      | 4 ++--
- src/notification_originator.cpp            | 2 ++
- 4 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/include/agent_pp/notification_log_mib.h b/include/agent_pp/notification_log_mib.h
-index ddac05e515d9..8fd8cfec32ca 100644
---- a/include/agent_pp/notification_log_mib.h
-+++ b/include/agent_pp/notification_log_mib.h
-@@ -22,7 +22,7 @@
- 
- //--AgentGen BEGIN=_BEGIN
- #include <agent_pp/agent++.h>
--#ifdef _SNMPv3
-+// #ifdef _SNMPv3 // This file deos not look SNMPv3-specific
- #include <agent_pp/mib_complex_entry.h>
- //--AgentGen END
- 
-@@ -688,6 +688,6 @@ protected:
-  */
- 
- 
--#endif
-+// #endif // _SNMPv3
- 
- 
-diff --git a/include/agent_pp/notification_originator.h b/include/agent_pp/notification_originator.h
-index 95e8b4e1836d..6f50cd52625b 100644
---- a/include/agent_pp/notification_originator.h
-+++ b/include/agent_pp/notification_originator.h
-@@ -307,7 +307,9 @@ class AGENTPP_DECL NotificationOriginator: public NotificationSender {
-          */
-         virtual nlmLogEntry* get_nlm_log_entry();
-                 
-+#ifdef _SNMPv3
-         virtual v3MP* get_v3mp();
-+#endif
- 
-  protected:
-      
-diff --git a/include/agent_pp/snmp_community_mib.h b/include/agent_pp/snmp_community_mib.h
-index 7d5c4558f36d..d9eb2b4a87ec 100644
---- a/include/agent_pp/snmp_community_mib.h
-+++ b/include/agent_pp/snmp_community_mib.h
-@@ -49,7 +49,7 @@ namespace Agentpp {
- #define oidSnmpTrapAddress               "1.3.6.1.6.3.18.1.3.0"
- #define oidSnmpTrapCommunity             "1.3.6.1.6.3.18.1.4.0"
- 
--#ifdef _SNMPv3
-+// #ifdef _SNMPv3 // This file deos not look SNMPv3-specific
- 
- /**
-  *  snmpCommunityName
-@@ -346,7 +346,7 @@ class AGENTPP_DECL snmp_community_mib: public MibGroup
- 	static void	       	add_public();
- 	static void	       	add_public(Mib* mib);
- };
--#endif
-+// #endif // _SNMPv3
- 
- #ifdef AGENTPP_NAMESPACE
- }
-diff --git a/src/notification_originator.cpp b/src/notification_originator.cpp
-index d7d566869998..39ddbe08cdeb 100644
---- a/src/notification_originator.cpp
-+++ b/src/notification_originator.cpp
-@@ -237,6 +237,7 @@ nlmLogEntry* NotificationOriginator::get_nlm_log_entry() {
-     return nlmLogEntry::instance;
- }
- 
-+#ifdef _SNMPv3
- v3MP* NotificationOriginator::get_v3mp() {
-     if (mib) {
-         return mib->get_request_list()->get_v3mp();
-@@ -244,6 +245,7 @@ v3MP* NotificationOriginator::get_v3mp() {
-         return v3MP::I;
-     }
- }
-+#endif
- 
- 
- bool NotificationOriginator::check_access(ListCursor<MibTableRow>& cur,
--- 
-2.27.0
-
diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 11b23c8ee2..f8399963e5 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9b45123df45e803198a1181540b37a4ccd0e63c68df6e826702e2ba49167edac  agent++-4.3.1.tar.gz
+sha256  bcfc014cc7ce37afdd6eefb71b59f1eabf23984525905546aa363c2a2c498c79  agent++-4.5.3.tar.gz
 sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 8982d9e564..f30e75ef9c 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.3.1
+AGENTPP_VERSION = 4.5.3
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
