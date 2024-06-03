Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D34FC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC3A441030;
	Mon,  3 Jun 2024 09:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iq5qlRQuDdyj; Mon,  3 Jun 2024 09:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 869414117C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 869414117C;
	Mon,  3 Jun 2024 09:20:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 160571BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20AFB4065E
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppIMvViTqBP7 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730BB40670
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 730BB40670
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6305B87988; Mon,  3 Jun 2024 09:19:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 11:11:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d946d31325af3ca388d4d3bbff4ad8f786fabb06
X-Git-Newrev: 3eb84214a177be4c939f1e158c43924a4a1d0fe8
X-Patchwork-Hint: ignore
Message-Id: <20240603091957.6305B87988@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncftp: use https:// _SITE
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
Content-Type: multipart/mixed; boundary="===============2074873150862293006=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2074873150862293006==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3eb84214a177be4c939f1e158c43924a4a1d0fe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============2074873150862293006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2074873150862293006==--
