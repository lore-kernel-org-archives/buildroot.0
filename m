Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A11DEF4EC8
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4403E60669;
	Mon,  6 Apr 2026 08:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKnom9G4vmxT; Mon,  6 Apr 2026 08:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C6CB608BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775465878;
	bh=I+FnxNsHrTyKR081nALnfG0MOy5UNycfWPZMqSi+pdc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nahwzzp0NSdfwjiq84GdoZNtppVtlSk0A4y95oLWMjjiAvS/nGaZ41Qh2GEcdqAQ+
	 gsF6w+/0FlS9GPkJWJ9ELK4ShO8OFUNRP0mfL5eMYkyXXcO4PMc1dcuyzinNgTTb1l
	 k80F51OS3ck4GhC6YhE/4vF3Yx7yW04wtAE2NgeSoAtj88+B+8AOUEvTxtIFGp2ib1
	 Yr1IFCEFSCd8lVjxJ1g8QcUfD4j/EsyxpRtW4gtdbN2jSj2japQLcJyWsLYTKYD2BN
	 /R8Zj2j5QuxOWEhEv8LS50oNOrlLYF6ihBmWn7jjiL4AdDhCO1qgbqmkThmbCB5Hpf
	 CkFmMCsBGWvAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6CB608BD;
	Mon,  6 Apr 2026 08:57:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB2BE2EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C12FC4025C
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sc3nxqo_Fc1a for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0764A40084
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0764A40084
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:57:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E8EF80420; Mon,  6 Apr 2026 08:57:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 10:46:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4450a8e1a6f79546f90046d273975d5c259de181
X-Git-Newrev: 52f9930e64066fc622381066ae4a5fb218c590a6
X-Patchwork-Hint: ignore
Message-Id: <20260406085754.7E8EF80420@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proj: bump version to 9.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52f9930e64066fc622381066ae4a5fb218c590a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://proj.org/en/stable/news.html

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 4ac7b444f4..38b4d81337 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from https://download.osgeo.org/proj/proj-9.5.1.tar.gz.md5
-md5  07c44ca4a65a0664ce823c8448707c78  proj-9.5.1.tar.gz
+# Fetched from https://download.osgeo.org/proj/proj-9.8.0.tar.gz.md5
+md5  f04335154621e9ce9a5800ea08c8d96a  proj-9.8.0.tar.gz
 # Locally calculated
-sha256  65705ecd987b50bf63e15820ce6bd17c042feaabda981249831bd230f6689709  proj-9.7.0.tar.gz
+sha256  a8b493b00cf4d08b712b9e063ed5e53e2be90fcde46770e9dbd773341f378f43  proj-9.8.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 4840824f69..5e74f377c4 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.7.0
-PROJ_SITE = http://download.osgeo.org/proj
+PROJ_VERSION = 9.8.0
+PROJ_SITE = https://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
 PROJ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
