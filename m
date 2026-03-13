Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF31107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6062160EF8;
	Sat, 14 Mar 2026 07:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWgq-pOU_yQg; Sat, 14 Mar 2026 07:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87CEB60EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474579;
	bh=nFhlzixL5ooqj0USWNdD8y23k4K7Vh0NFHbqkVtzWlc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A1KXn3qqIPmPEq/2T0skmmSoH1SqDAxIgnATe+eoSvW2DnELtN+muIPTrlmibfgY2
	 uLLsGAc2W7T7kZGIQvmHFJPLT93dahrDjH4Usa+ZOR3XB2jKKjlZg6PqSADXU/cAyr
	 J5GJfwpbCJKGsNnpiCefoSBWWofY9E9uR6duMUGS+XFUCJl8Fssfppy+1qXlnhjAO2
	 vG4z7o+hafvZhqIrgBKbOi1N3axjhYZ9/TC/zdYNV85GY3tRRf8kz0pHjpA/ZtjWGo
	 HuDIKlvGB8dJh5Z/38tMgdmFaEfipbzoU7C4GBHL43JviXUAW4iiYjJuatZEaieGzs
	 4vcFC33s45wAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87CEB60EF9;
	Sat, 14 Mar 2026 07:49:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D542D786
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C1240144
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMGgy7y8Go97 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 996F640135
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 996F640135
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C83D285EE5; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:02:24 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 47addd38d26411a8ef4e02ea534a30fd92cedff2
X-Git-Newrev: 9f755efa4bc44c75dfd5dfe4b9b0a9f38809b8e3
X-Patchwork-Hint: ignore
Message-Id: <20260314074935.C83D285EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/clamav: security
 bump version to 1.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f755efa4bc44c75dfd5dfe4b9b0a9f38809b8e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://blog.clamav.net/2026/03/clamav-152-and-144-security-patch.html

Fixes CVE-2026-20031: https://www.cve.org/CVERecord?id=CVE-2026-20031

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d225a6ffad8d1b1a40976f9c49a04d5db33e0c47)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 807c8fc2ea..db50d77194 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  64fe4a16a5622c1d71efe9ed7f2c2fbd37f8f237da9f11ff66b73038df71db91  clamav-1.5.1.tar.gz
+sha256  f34018cf22f05bdd9d1a1574ca07193e3e030ca52050c3e5c220e23a32314965  clamav-1.5.2.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index bda714ea65..7f8008ab5f 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.5.1
+CLAMAV_VERSION = 1.5.2
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
