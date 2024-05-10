Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1A5C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCAEC4058B;
	Fri, 10 May 2024 11:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqiLN5MmtAJ1; Fri, 10 May 2024 11:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D896C42A4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D896C42A4D;
	Fri, 10 May 2024 11:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94AA71BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C1828457F
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQVZph3Dsuie for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D02F084574
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D02F084574
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:55:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B80B786E86; Fri, 10 May 2024 11:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 13:44:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ca56912abaae8ccfa77e744277315dde848234d
X-Git-Newrev: 1cc8a1b21143714440d1c5c8eeafd8fbf72830ce
X-Patchwork-Hint: ignore
Message-Id: <20240510115553.B80B786E86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsepol: bump to version 3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cc8a1b21143714440d1c5c8eeafd8fbf72830ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsepol/libsepol.hash | 2 +-
 package/libsepol/libsepol.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index c243aaae2b..1369d820e1 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  78fdaf69924db780bac78546e43d9c44074bad798c2c415d0b9bb96d065ee8a2  libsepol-3.5.tar.gz
+sha256  c9dc585ea94903d784d597c861cd5dce6459168f95e22b31a0eab1cdd800975a  libsepol-3.6.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index f7782542ec..6361cc66bc 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.5
+LIBSEPOL_VERSION = 3.6
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
