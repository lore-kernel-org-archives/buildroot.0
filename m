Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D94C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E485640970;
	Sat, 13 Jan 2024 13:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E485640970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h26dlnDhbuh8; Sat, 13 Jan 2024 13:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1595F40978;
	Sat, 13 Jan 2024 13:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1595F40978
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 139CC1BF325
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D91B40978
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D91B40978
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79FuSIHPYfii for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4712440979
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4712440979
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 430C485E7A; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 14:33:45 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9432974081815daa43cda420a0a428dd54a49521
X-Git-Newrev: 84bc0dafe2a0ad07176307b4c070fdfd5aac194b
X-Patchwork-Hint: ignore
Message-Id: <20240113133412.430C485E7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/micropython:
 security bump to version 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=84bc0dafe2a0ad07176307b4c070fdfd5aac194b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Use official tarball
- Update hash of license file (some packages have been added or removed
  but the list of licenses is the same)
- Fix CVE-2023-7158: A vulnerability was found in MicroPython up to
  1.21.0. It has been classified as critical. Affected is the function
  slice_indices of the file objslice.c. The manipulation leads to
  heap-based buffer overflow. It is possible to launch the attack
  remotely. The exploit has been disclosed to the public and may be
  used. Upgrading to version 1.22.0 is able to address this issue. It is
  recommended to upgrade the affected component. The identifier of this
  vulnerability is VDB-249180.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1e12b7dd49d1c64a5195f226e9e4da21e84f5d0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.hash | 4 ++--
 package/micropython/micropython.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 7bff7de4e2..43551866b9 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  c980ad7e742491df0dc10db2958137dbbf9aa7a8009e102fc75f4c0cac2d6b5e  micropython-1.19.1.tar.gz
-sha256  0f678c2abd7fe2cfca36693630506bbcbdfc219bd04bf4a02fe3b094ae4c666f  LICENSE
+sha256  a042764f0b6f6d92b267454c5bd5afcb83fc3900119f2583672aac571e661924  micropython-1.22.0.tar.xz
+sha256  d9e0e0395867c899090e150213bc2b417e970c17355a8d48300089875b3c8037  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 5f687c73b9..e6eb536ea5 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.19.1
-MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
+MICROPYTHON_VERSION = 1.22.0
+MICROPYTHON_SITE = https://micropython.org/resources/source
+MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
 # Micropython has a lot of code copied from other projects, and also a number
 # of submodules for various libs. However, we don't even clone the submodules,
 # and most of the copied code is not used in the unix build.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
