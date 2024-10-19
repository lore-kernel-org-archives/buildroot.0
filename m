Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50B0D3C909
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 11:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38DD1606BE;
	Sat, 19 Oct 2024 11:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6t9QlA_4k4P; Sat, 19 Oct 2024 11:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BAE260706
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BAE260706;
	Sat, 19 Oct 2024 11:39:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A440C3F2C
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 11:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9261C6070C
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 11:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLEVPEr0a6je for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 11:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEDD96063A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEDD96063A
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 11:39:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9A2185087; Sat, 19 Oct 2024 11:39:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 13:38:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ad7035fce67cbe91db9dea7d81e6a4bc0691ad1
X-Git-Newrev: 914bf050d2dbf1f1e276f229f5afaeab5dbf9ed2
X-Patchwork-Hint: ignore
Message-Id: <20241019113921.A9A2185087@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: correct license info after
 7.0.3 bump
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=914bf050d2dbf1f1e276f229f5afaeab5dbf9ed2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b315dc5fbf40eb0a (package/zabbix: bump version to 7.0.3) updated
zabix but forgot to check the license info, leading to legal-info failures.

Both files have changed - COPYING now specifies AGPL 3.0, so adjust hash and
license identifier.  README is now just a oneliner stating 'Please refer to
README.md' (which also does not have any license clarifications), so just
drop it.

Fixes: b315dc5fbf40eb0a (package/zabbix: bump version to 7.0.3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
