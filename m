Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2AAC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 15:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85B594054E;
	Sun,  6 Aug 2023 15:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85B594054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqspaH1OZraD; Sun,  6 Aug 2023 15:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D02754028D;
	Sun,  6 Aug 2023 15:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D02754028D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC321BF5DA
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A443401F1
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A443401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaaA-AqaoF2i for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 15:41:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2682E4028D
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 15:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2682E4028D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15FE08452F; Sun,  6 Aug 2023 15:41:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 17:40:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b1bc64d924e386466d715637a4a09228322beef
X-Git-Newrev: 7efd8e3c0b584a1d743db2c0005bf9b85f521ae9
X-Patchwork-Hint: ignore
Message-Id: <20230806154142.15FE08452F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luvi: bump 2.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=7efd8e3c0b584a1d743db2c0005bf9b85f521ae9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lua-openssl (0.7.8-0) bundled in luvi 2.13 fail to build with openssl-3.x

test-output/TestLuvi/build/luvi-2.13.0/deps/lua-openssl/src/lbn.c:28:27: error: expected ')' before 'SHLIB_VERSION_NUMBER'
   28 |       "based on OpenSSL " SHLIB_VERSION_NUMBER
      |                           ^~~~~~~~~~~~~~~~~~~~

Luvi 2.14 include an lua-openssl update to 0.8.2-0 fixing TestLuvi.

See:
https://github.com/luvit/luvi/releases/tag/v2.14.0

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561386

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 9621ef4d03..3518a2dc85 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  da25c74a30a3fe2fc75e9797a6fa0717ebb05ceb7e6ccb61301f80c7dd436b73  luvi-src-v2.13.0.tar.gz
+sha256  4be4468d01657100967a9c696f503aa3c30de6f23af39050c1aae909fbf0aaf2  luvi-src-v2.14.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 5266281ffc..4a8072dee5 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUVI_VERSION = 2.13.0
+LUVI_VERSION = 2.14.0
 LUVI_SOURCE = luvi-src-v$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/v$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
