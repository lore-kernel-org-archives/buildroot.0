Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E01CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDAE985628;
	Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGAJmmpNQAPi; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C50858560F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010102;
	bh=QC1r3GWYzIFtJ0ZJwJ9NFuUOM1f3VKw7ZsyAhR2YqqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nw7JqY0wadNeAHiKsy1gnxggTMK5e2M5r7KAhFAzl66hdthMgz51wsHXFZgBMSIZ7
	 +szhDFtlABgpFnM879m08yAVryLOAjtcNf7Scm8e80WgPn7EUfLlVATfc48XXD2J0A
	 z4IShytT8AUIDnBkSaULxrDiks7A+voFwfnWcwewUmC/VnDe8NT9NsaBbfi4q69WWf
	 oluUOOUVxk+tSLK0Lke/GNAbwknPQ1CbMNOvIp76W2p/ADUhUaFUj3cJBNpJ4oWEVx
	 UBpwGsmKkYvZ6L84Bnr8kGveF6N0402/FcElhigSOJ5Wy+6gaV0JhNzzEiinnH4Z5t
	 YzFHj7VD+oi1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C50858560F;
	Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7509F196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C1C85555
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQRCMAxmZcHz for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88DBF85588
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88DBF85588
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C34D187E7E; Tue,  9 Jun 2026 13:01:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b77485f2016908b14e4e6f9721801abcf57c2bf4
X-Git-Newrev: c522110685426cd9dc8bf246998abfb7d8b7b86a
X-Patchwork-Hint: ignore
Message-Id: <20260609130107.C34D187E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: bump version to 0.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c522110685426cd9dc8bf246998abfb7d8b7b86a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/libssh/libssh-mirror/-/tags/libssh-0.12.0
https://www.libssh.org/2026/02/10/libssh-0-12-0-and-0-11-4-security-releases/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 5a103eb593..8c40dea2e5 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.4.tar.xz.asc
+# https://www.libssh.org/files/0.12/libssh-0.12.0.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  002ac320e3d66c9e100ec6576e3e84aa0c48949efde3bf5b40a2802992297701  libssh-0.11.4.tar.xz
+sha256  1a6af424d8327e5eedef4e5fe7f5b924226dd617ac9f3de80f217d82a36a7121  libssh-0.12.0.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 56de66d6ea..017ff2c197 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
+LIBSSH_VERSION_MAJOR = 0.12
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
