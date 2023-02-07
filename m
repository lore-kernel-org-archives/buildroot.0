Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586FEC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF93B414C2;
	Tue,  7 Feb 2023 10:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF93B414C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfreh7vkVJZ6; Tue,  7 Feb 2023 10:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A79A41748;
	Tue,  7 Feb 2023 10:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A79A41748
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D68B61BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B13D581444
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B13D581444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOWe5Djzq9KU for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:39:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3E2881442
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E2881442
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1F0C84034; Tue,  7 Feb 2023 10:39:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 11:39:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ff52ac09b1c21fdce65deae39127b31d47858e9
X-Git-Newrev: 537daa143b237e88f2e272056bb05771db7f48d1
X-Patchwork-Hint: ignore
Message-Id: <20230207103959.C1F0C84034@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mcelog: bump to version 191
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

commit: https://git.buildroot.net/buildroot/commit/?id=537daa143b237e88f2e272056bb05771db7f48d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create .os_version to specify the version since there is no git
checkout available.

https://github.com/andikleen/mcelog/releases/tag/v191
https://github.com/andikleen/mcelog/releases/tag/v190

Signed-off-by: Jordan Speicher <jordan@jspeicher.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mcelog/mcelog.hash | 2 +-
 package/mcelog/mcelog.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index e0350b085d..23fd4e50f3 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30364d134ff416f3f9469720add84bdccea226268d334f06022110f484550cd9  mcelog-189.tar.gz
+sha256  b3b2616acde7afba4752d4dc447a2c2ad5a75da65e7496e0da30f8f8d2015cfa  mcelog-191.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 8b5876d32e..9f7194e376 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 189
+MCELOG_VERSION = 191
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
 MCELOG_SELINUX_MODULES = mcelog
 
 define MCELOG_BUILD_CMDS
+	echo "$(MCELOG_VERSION)" > $(@D)/.os_version
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
