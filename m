Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6123ACCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3971940819;
	Tue,  7 Oct 2025 19:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q40goxww6yDA; Tue,  7 Oct 2025 19:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76FD94082D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76FD94082D;
	Tue,  7 Oct 2025 19:21:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79AC1D84
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 606B960877
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJ3CIOyX_tVj for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F394860A52
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F394860A52
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:21:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEE2686A27; Tue,  7 Oct 2025 19:21:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Oct 2025 21:17:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 033fc7ca8f6417204f65f24644954dfa3ab71efc
X-Git-Newrev: fd4221092f76f84ace9b2f9dae0dbe47dd9fda53
X-Patchwork-Hint: ignore
Message-Id: <20251007192147.EEE2686A27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/4th: bump to version 3.64.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd4221092f76f84ace9b2f9dae0dbe47dd9fda53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/4th/0001-avoid-regen-during-install.patch | 2 +-
 package/4th/4th.hash                              | 2 +-
 package/4th/4th.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/4th/0001-avoid-regen-during-install.patch b/package/4th/0001-avoid-regen-during-install.patch
index 436cff1fd6..ea9cdffe7f 100644
--- a/package/4th/0001-avoid-regen-during-install.patch
+++ b/package/4th/0001-avoid-regen-during-install.patch
@@ -4,7 +4,7 @@ Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 --- a/sources/Makefile
 +++ b/sources/Makefile
-@@ -120,7 +120,7 @@
+@@ -122,7 +122,7 @@
  	ln -sf $(SHARED_LIB) $(LIBRARIES)/lib4th.so
  endif
  
diff --git a/package/4th/4th.hash b/package/4th/4th.hash
index 8a31263479..50b81170bf 100644
--- a/package/4th/4th.hash
+++ b/package/4th/4th.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f96ea74cdb2aadfdc3bebf8d6d2cf7b8976b5d56c1237387479bffaecede9fe3  4th-3.64.1-unix.tar.gz
+sha256  b9f422b910cf99c63315241fd7a72e652ace11b1f78adabbc99628f3bccfb358  4th-3.64.2-unix.tar.gz
 sha256  8c6111b645a02219579ea66e84aa8e78a0ed4f4dd80857ffb91bcda5528717d4  COPYING
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 08b3dbdebc..0153f2dd91 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-4TH_VERSION = 3.64.1
+4TH_VERSION = 3.64.2
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
 4TH_SITE = https://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
