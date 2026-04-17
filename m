Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903C6F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 560BA81991;
	Fri, 17 Apr 2026 15:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfp1MEEH1N7a; Fri, 17 Apr 2026 15:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B848196A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439389;
	bh=YK+yDAn4ojcfJ67ce0GRxJ2+NKYmcKNx7epxDcJf9T8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bOjeThHVQaDquLv6mei4mXXTFAcpsb40JElhiAeVogheHk2a99v4F0FGAWrh+QuAr
	 h21S9glR2WLRCp6pqbpZPnu3YaFdebYj0lZ7nWrnZM+98dx9pP9EkF6Lx8g8ySc/V/
	 UtA4vuxG3omOzAEcesEeglSo/eFYhwgRebfI+HgvxAtUPYss2p+pk0MoKVLAh15dgH
	 kAvRd5QQ3tu44T+S07Wy8bafx+H1qGhFCCY7n5KPUuKx2x2AlKtd4FE/+JhjrxUYfl
	 zfIKCiatQoSvRs2c2aWBq5QLQsmfytxna+HGEOAOF2TeiEXiRvJIICFApOScbJXe0/
	 1wQ7KgrtkQzHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B848196A;
	Fri, 17 Apr 2026 15:23:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1055396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DE4F40DF5
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtzbAkFgDsI3 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1DB40DEB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A1DB40DEB
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AEC681DD9; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:31 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 67f7393f1bb015ccde709df9b924dd8258b5f89e
X-Git-Newrev: e40a802ba30ae669549a12b8cf8898628e2bdcc5
X-Patchwork-Hint: ignore
Message-Id: <20260417152247.2AEC681DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/php: bump version
 to 8.5.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e40a802ba30ae669549a12b8cf8898628e2bdcc5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://www.php.net/ChangeLog-8.php#8.5.5
https://news-web.php.net/php.announce/488

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1014d8ffb6b6d4f20888c4cb62f4a05d1c63d04a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 7fdb76b01a..d400f8e0bb 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  c1569f1f543f6b025c583cdc0e730e5c5833c603618613f1aa8e75d1524b8c91  php-8.5.4.tar.xz
+sha256  95bec382f4bd00570a8ef52a58ec04d8d9b9a90494781f1c106d1b274a3902f2  php-8.5.5.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 220fb8c5c0..9976884001 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.4
+PHP_VERSION = 8.5.5
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
