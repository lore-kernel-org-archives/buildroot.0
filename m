Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8B2C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDDE78217D;
	Sat, 23 Dec 2023 20:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDDE78217D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0qyFfc9Fvxz; Sat, 23 Dec 2023 20:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E9BF82173;
	Sat, 23 Dec 2023 20:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E9BF82173
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95A051BF32A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C022405A7
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C022405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WdmrI6F_ALQT for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:01:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948CE40591
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 948CE40591
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F1F58229C; Sat, 23 Dec 2023 20:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 21:00:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ebbfeff38770876e48a4d38741dd9fffc001a42
X-Git-Newrev: 4873799fe761ed3ac97c4f54f8079edbfd4047ef
X-Patchwork-Hint: ignore
Message-Id: <20231223200111.7F1F58229C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openrc: bump version to 0.52.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4873799fe761ed3ac97c4f54f8079edbfd4047ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The runscript and rc binaries have been removed in this release. However,
Buildroot does not use those binaries, so only a simple version bump is
necessary.

Fixes:
  - cgroups being inconsistent
  - Start-stop-daemon did not work correctly on Linux 6.6

Tested on Debian 11 and Fedora 39 with the following command:
./support/testing/run-tests tests.init.test_openrc

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openrc/openrc.hash | 2 +-
 package/openrc/openrc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
index 698acf4978..c1c16a8c45 100644
--- a/package/openrc/openrc.hash
+++ b/package/openrc/openrc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4ec46f2729c77c4387146b491c4d121f5cba48bff2f0aeaff99895dcda5cea85  openrc-0.51.tar.gz
+sha256  0b911eee4e64ad5e6945c6fed572220d537dfd0108838fa6d6797a2d7ff9f052  openrc-0.52.1.tar.gz
 sha256  6ac2bf77510808fbec7dc86cbfbca98dfc4c6b47dc99e4ca77b5370e097d8e70  LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 63aec7615e..0dd6a5d1ac 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENRC_VERSION = 0.51
+OPENRC_VERSION = 0.52.1
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
