Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB33ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F5C984329;
	Sat, 17 Sep 2022 12:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F5C984329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SW0qB5rdnl9j; Sat, 17 Sep 2022 12:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 973E884307;
	Sat, 17 Sep 2022 12:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 973E884307
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BC931BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64F6E40493
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64F6E40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKZDIj6Icj4Y for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:51:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8530040239
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8530040239
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7474E8429A; Sat, 17 Sep 2022 12:51:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:50:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80323a534b12803fa25d55e3c5e2c8a527ca5863
X-Git-Newrev: a422f407610fc9c11ccd9cf5d9fc383e084e3d38
X-Patchwork-Hint: ignore
Message-Id: <20220917125110.7474E8429A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snmppp: bump to version 3.4.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=a422f407610fc9c11ccd9cf5d9fc383e084e3d38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  - Fixed: Winsock has to be included before windows header.
  - Fixed: Added SnmpTarget::version_to_string() function
  - Fixed: Fixed compiler warning on MSYS2 g++

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snmppp/snmppp.hash | 2 +-
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index db3a4b5f4f..6dc3d39ced 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7c0aaf4ea21db082453f880cc2062a86dcbbf0ee6c8d47c72beb8e0c77c26b6c  snmp++-3.4.9.tar.gz
+sha256  d7a77fd05ecd99b25c51cbab08dfeef22a5edf2677875695c213631af59d5bae  snmp++-3.4.10.tar.gz
 sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index bc05cad583..005a5a9f35 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.4.9
+SNMPPP_VERSION = 3.4.10
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
