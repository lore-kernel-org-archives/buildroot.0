Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DB1C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 20:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A1FF81E9E;
	Tue, 28 Nov 2023 20:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A1FF81E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WExsF1Y339S; Tue, 28 Nov 2023 20:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81AAA81ED5;
	Tue, 28 Nov 2023 20:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81AAA81ED5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 090871BF38E
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1AC84011A
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1AC84011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzpY_8XDtotg for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 20:56:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA5494048E
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 20:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA5494048E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99CB387531; Tue, 28 Nov 2023 20:56:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 21:54:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bd302c631f88698763a3cf3fd6d0a9b3f0a17c8
X-Git-Newrev: e5af07dce9eb2333a863b09ac1c06eb35f3adb70
X-Patchwork-Hint: ignore
Message-Id: <20231128205643.99CB387531@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: security bump to version
 2.11.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5af07dce9eb2333a863b09ac1c06eb35f3adb70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-45322: libxml2 through 2.11.5 has a use-after-free that can
only occur after a certain memory allocation fails. This occurs in
xmlUnlinkNode in tree.c. NOTE: the vendor's position is "I don't think
these issues are critical enough to warrant a CVE ID ... because an
attacker typically can't control when memory allocations fail."

https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.11.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index cad19f930f..78c1ddc6a2 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.5.sha256sum
-sha256  3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6  libxml2-2.11.5.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.6.sha256sum
+sha256  c90eee7506764abbe07bb616b82da452529609815aefef423d66ef080eb0c300  libxml2-2.11.6.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index fb7767297b..c93a4aacc5 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.11
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).5
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
