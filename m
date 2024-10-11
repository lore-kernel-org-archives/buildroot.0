Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC241D0D786
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 12:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4311A61148;
	Fri, 11 Oct 2024 12:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaO1qgW4nTdu; Fri, 11 Oct 2024 12:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C5586114A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C5586114A;
	Fri, 11 Oct 2024 12:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C62451BF267
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 12:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF365424A5
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 12:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYk7M9RG2nUF for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 12:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 036AC4249D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 036AC4249D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 036AC4249D
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 12:45:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC63D24000B;
 Fri, 11 Oct 2024 12:45:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1szF1g-00A3Jb-0k;
 Fri, 11 Oct 2024 14:45:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 14:45:44 +0200
Message-Id: <20241011124545.2395991-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/zabbix: correct license info after
 7.0.3 bump
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b315dc5fbf40eb0a (package/zabbix: bump version to 7.0.3) updated
zabix but forgot to check the license info, leading to legal-info failures.

Both files have changed - COPYING now specifies AGPL 3.0, so adjust hash and
license identifier.  README is now just a oneliner stating 'Please refer to
README.md' (which also does not have any license clarifications), so just
drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zabbix/zabbix.hash | 3 +--
 package/zabbix/zabbix.mk   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index 4648ed8b71..843dc445d6 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,4 +1,3 @@
 # Locally computed
 sha256  173059f57f11716146da79345e5a6bc52eceee6a5c4410664b8500a955598b2a  zabbix-7.0.3.tar.gz
-sha256  f8fc3fd12521b60d53d8c5d48a883eb3c9c5ddec9de986a273e1b77f69d811db  README
-sha256  444fe54aecc95ac0f3314289c300afc73b3946a4dc9fbd7e022709b3e0924dd0  COPYING
+sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 07d92d0abd..dda60ef161 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -8,8 +8,8 @@ ZABBIX_VERSION_MAJOR = 7.0
 ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).3
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
-ZABBIX_LICENSE = GPL-2.0+
-ZABBIX_LICENSE_FILES = README COPYING
+ZABBIX_LICENSE = AGPL-3.0
+ZABBIX_LICENSE_FILES = COPYING
 ZABBIX_CPE_ID_VENDOR = zabbix
 # We're patching m4/netsnmp.m4
 ZABBIX_AUTORECONF = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
