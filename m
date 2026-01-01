Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3FEEEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA4081EC6;
	Thu,  1 Jan 2026 09:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaciDKu4ZvFG; Thu,  1 Jan 2026 09:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0412E81EFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260588;
	bh=vMVe5w5XC8jV8/XLtIQmV77qkAwgWGdUX7GtNTIMn/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KGELMJR8i/FffiLE2FA2p3FHguBigl1Tr50cF+lF8ZRoTluaJV24vhImuQ73wLawe
	 rTOdAETY73bxkFb9hqMdMZUJq/VAIUYbNtutVtuE4kvKFv8P0pyCeeYsAQn+/sfVvV
	 lM1Llwwu4v6feboqKu51SPOymT3Lf7IcseD5taKUaevtTv2fMay3oM3eMgEJjYpU6u
	 Bi/WOTUpF8KYomPe/wjz38AldVVc93s44BdjOkhZ6Elmz/Sbj+rpDLx1yY4+fwxmbM
	 weqFa6zrIyenvhqpUjG817pIA9dctuJvT/XQ/ZYJ6idVslXQHhlbGq3eM9fyAuX3Q6
	 K3U8S3tLiFZwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0412E81EFD;
	Thu,  1 Jan 2026 09:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D406351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BEA88154D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtP9psfAlUT2 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 758018144D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 758018144D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7394486FB6; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e16d67445fc12267f8e1634320998586a449eeb
X-Git-Newrev: 13e9170610821ae9bb6481f6bff81f173bed635c
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.7394486FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump to version
 2.0.45
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=13e9170610821ae9bb6481f6bff81f173bed635c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 6b7351f6ce..cfc42fd77d 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  7659edd862c2b507f9fc4b466d319a4d  sqlalchemy-2.0.44.tar.gz
-sha256  0ae7454e1ab1d780aee69fd2aae7d6b8670a581d8847f2d1e0f7ddfbf47e5a22  sqlalchemy-2.0.44.tar.gz
+md5  9df94d7a8629cf43d2190d5e511fa47f  sqlalchemy-2.0.45.tar.gz
+sha256  1632a4bda8d2d25703fdad6363058d882541bdaaee0e5e3ddfa0cd3229efce88  sqlalchemy-2.0.45.tar.gz
 # Locally computed sha256 checksums
 sha256  9821720b58d4a565b61321007a8ad43ab6991a3959e66cd5db4dd9eae69c7dfc  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 0a7371188e..cf5440a715 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.44
+PYTHON_SQLALCHEMY_VERSION = 2.0.45
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/f0/f2/840d7b9496825333f532d2e3976b8eadbf52034178aac53630d09fe6e1ef
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/be/f9/5e4491e5ccf42f5d9cfc663741d261b3e6e1683ae7812114e7636409fcc6
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
