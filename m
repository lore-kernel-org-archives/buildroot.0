Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D69CC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B05A84C17;
	Sat,  8 Jun 2024 19:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MvKjK-QJD9i7; Sat,  8 Jun 2024 19:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD40584C30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD40584C30;
	Sat,  8 Jun 2024 19:16:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37CEE1BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 700F7413B5
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_6jGR_NyAJ4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60B00409A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60B00409A4
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5512887C6F; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:08:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8c03a60b3a78f13fe2aeea815b5653c63f32eb29
X-Git-Newrev: a8485982aaf721f0b71cdb3ae85967a746471672
X-Patchwork-Hint: ignore
Message-Id: <20240608191501.5512887C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ncftp: use
 https:// _SITE
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
Content-Type: multipart/mixed; boundary="===============3313572604386320677=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3313572604386320677==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a8485982aaf721f0b71cdb3ae85967a746471672
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The ftp server does not respond, so change to https:// instead.  Here the
3.2.6 version is under older_versions.

wget ftp://ftp.ncftp.com/ncftp/ncftp-3.2.6-src.tar.gz
--2024-06-03 08:10:44--  ftp://ftp.ncftp.com/ncftp/ncftp-3.2.6-src.tar.gz
           => ‘ncftp-3.2.6-src.tar.gz’
Resolving ftp.ncftp.com (ftp.ncftp.com)... 209.197.102.38
Connecting to ftp.ncftp.com (ftp.ncftp.com)|209.197.102.38|:21... ^C

http redirects to https, so update the help text to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3eb84214a177be4c939f1e158c43924a4a1d0fe8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncftp/Config.in | 2 +-
 package/ncftp/ncftp.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 6a939aa88c..c8870a3dde 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_NCFTP
 	  application programs implementing the File Transfer Protocol
 	  (FTP).
 
-	  http://www.ncftp.com/ncftp/
+	  https://www.ncftp.com/ncftp/
 
 if BR2_PACKAGE_NCFTP
 
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 676a9c5895..d380ebae02 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -8,7 +8,7 @@ NCFTP_VERSION = 3.2.6
 # use .gz as upstream .xz tarball has changed after the hash was added for
 # 2017.02. Can be changed back to .xz when version is bumped
 NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
-NCFTP_SITE = ftp://ftp.ncftp.com/ncftp
+NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp/older_versions
 NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = Clarified Artistic License
 NCFTP_LICENSE_FILES = doc/LICENSE.txt

--===============3313572604386320677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3313572604386320677==--
