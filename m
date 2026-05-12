Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8E8CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C3084219;
	Fri, 15 May 2026 13:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJ3-NdvkwkKx; Fri, 15 May 2026 13:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1BD8422A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851801;
	bh=FT6ITa0cG+kiECKAp+lh/Y71Zkv+Thn3Ih+DSOn8dYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PcDDQiPfMgsog+AVApVTJ9No/PijuOq/0KKYaCb/pfOYohdjPRwWXXA0SH3ER5PfI
	 wP+7fGW4pcGhycsiHQttitUKnKPaqTQ+uVS+5lG1rYUVLtibKunFf2ArzfSqN0HRgW
	 PE2DfVcBIhnMLtEJ/TNSTnfml+zEewDlT2wE21rHcMkDmnO2Az1XL1dYrg9N8eIgZT
	 g6LB8mqEfjj9LGA2jlfMGInlCA2oSWG2izBicSjD1QXh+PfXWWhyoASatpgB+HiKfy
	 BRPyNiqmkhkwls3D/Fq4pluTKCtt47nJYlra3MPGR9B+D/TJ+IaHTlY75NPI5bGcur
	 +jcSc1SqsNg3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1BD8422A;
	Fri, 15 May 2026 13:30:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B50E42B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D97540E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IofL8Vyu4DcJ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D1D440E32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D1D440E32
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A119D86365; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:44:39 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: aa938fe6977dabc070d2da01b30f17b3aa3d4012
X-Git-Newrev: ccbf9130c548cecf8ac194540bc9e5dd0bee738b
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.A119D86365@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/rsync: security
 bump version to 3.4.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ccbf9130c548cecf8ac194540bc9e5dd0bee738b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://download.samba.org/pub/rsync/NEWS#3.4.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2f9fff2234506cbe975d69ac315fdd15737ca2e2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 5feacd0663..933d330323 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.1.tar.gz.asc
-sha256  2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52  rsync-3.4.1.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.2.tar.gz.asc
+sha256  ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315  rsync-3.4.2.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e4c02a756f..3282a759c6 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.1
+RSYNC_VERSION = 3.4.2
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
