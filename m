Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310F0C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0AC6418B9;
	Sat, 13 Jan 2024 13:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0AC6418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLjVd7yR4ZKU; Sat, 13 Jan 2024 13:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2816E41F82;
	Sat, 13 Jan 2024 13:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2816E41F82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B63E61BF2EB
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A094140119
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A094140119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQkFQfApfPpk for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B242401AE
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B242401AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7700F85FD9; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 14:28:49 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: c3a2dcadf0df7a14acca24e2744e45288ea06614
X-Git-Newrev: df930e56f37942ddc9d9f7d67563dfd203292f78
X-Patchwork-Hint: ignore
Message-Id: <20240113135200.7700F85FD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/faad2: security
 bump to version 2.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=df930e56f37942ddc9d9f7d67563dfd203292f78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

- Switch to cmake-package
- Fix CVE-2023-38857 and CVE-2023-38858

https://github.com/knik0/faad2/blob/2.11.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 358a379f47ad20b69dcb3c3dd8eeaad210ff5e09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/faad2/faad2.hash | 2 +-
 package/faad2/faad2.mk   | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index 3a9c36df00..b7813130fd 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c16c71295ca0cbf7c3dfe98eb11d8fa8d0ac3042e41604cfd6cc11a408cf264  faad2-2.10.1.tar.gz
+sha256  72dbc0494de9ee38d240f670eccf2b10ef715fd0508c305532ca3def3225bb06  faad2-2.11.1.tar.gz
 sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index eecab35af8..686e5045c0 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,16 +4,12 @@
 #
 ################################################################################
 
-FAAD2_VERSION = 2.10.1
+FAAD2_VERSION = 2.11.1
 FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
 FAAD2_CPE_ID_VENDOR = audiocoding
 FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
-# frontend/faad calls frexp()
-FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
-# From git
-FAAD2_AUTORECONF = YES
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
