Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F6ACDB472
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31FF46FAD7;
	Sat, 20 Jun 2026 09:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sub-pHy5uKtK; Sat, 20 Jun 2026 09:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3C46FADF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946410;
	bh=M0hyP9C3zBPyCSpDmfESVgBkpGaYjYB0ZisPeSn7LKs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HocoUuoIQC0/OpqCZum9+OZprSu10B2IK2wLm+bAzhwiirPImev39hL+MX0D4MY4e
	 CBUT5a3fHbkKEFdN935ohGQIxUU6ngxCbh543nXX8FoBojHiuup0VeimKPgW6zpGH+
	 z6WkYSFZuMoDkOmY+0xVeMKmw+IvaYvnv1MmCOzp/oSkq7XjHguw1cerCdQnkcbwb/
	 CWj/Bamns/vJwzN1qP4WJmQJw7NrrNvlRJ0rhumoKdcLKlvtmn80mSFGywAWxtMPr4
	 yGGZoXRwSzscb/L6nx2xo/RH5PIuAE+fomqLW6pQlgh8MDEolWMe03oOL5GRdj2ydj
	 fjgA596TmBFJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3C46FADF;
	Sat, 20 Jun 2026 09:06:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AF8AD06
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBF486FAB9
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 768MjhTkBTxd for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EED086FA13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EED086FA13
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E800581E45; Sat, 20 Jun 2026 09:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:44:53 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 9a327dc724931dcc67967ad24a140a2b6431d868
X-Git-Newrev: fd9b1c2521993f4b539158babea76a2780e38a92
X-Patchwork-Hint: ignore
Message-Id: <20260620090614.E800581E45@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/rsync: bump
 version to 3.4.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd9b1c2521993f4b539158babea76a2780e38a92
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Bugfix release containing a number of fixes for regressions introduced in
the 3.4.3 release.

For details, see:
https://download.samba.org/pub/rsync/NEWS#3.4.4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a9f7f918e06c16b8afa27526b0908c08f488aead)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 666bb5cf99..2deaed0674 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.3.tar.gz.asc
-sha256  c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3  rsync-3.4.3.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.4.tar.gz.asc
+sha256  bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96  rsync-3.4.4.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5b4345d036..5dd89a82d2 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.3
+RSYNC_VERSION = 3.4.4
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
