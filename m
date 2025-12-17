Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09FDD66BA5
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC6C40F46;
	Wed, 17 Dec 2025 20:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNk5pOWKot5r; Wed, 17 Dec 2025 20:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9719D40F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766004334;
	bh=Ln+tbvoNDV3L428o4vnIHLj8IuVSVFTivD8v9XeYkCs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iqy0j3fvV7xy2UOqiO0BIhCwZxj9vaH1pqLAP9jYgOdPieCE+3gzA2Ol0X2lHvzZL
	 XBAM3W94amCjYkyzgvu+XBsQwmyUUnMzXiLHwDQm23rvKg6iLl50xF0OnOaaD/CMGI
	 IeWcXrcmsvMG883iYRKEbufy61sbJiWs7T1wx/t5BQiR/J+kbQXVDIWWaOPOAwKMdd
	 yO7JdqPCIM3/XXv1RYvFaXa81H6+gZDiZhaEuChdcoCR+bWBBRk+bWsXIUpxSHntIm
	 BKgku2vbK5/ZZ7vVMiiUGdzaL6d6avALAU1B/gJfv+yT4h9m1GD1prrbFDuMR4MdSm
	 El3qskbEr3Shw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9719D40F3B;
	Wed, 17 Dec 2025 20:45:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC7135B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADAE740F3B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8mo5adi2_9Q for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02A2B40F26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02A2B40F26
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E705487111; Wed, 17 Dec 2025 20:45:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 21:35:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79f5c7267476ff32b4f7809278087373c961d9fa
X-Git-Newrev: c958889b10fe377942493ffa87f05ee9d582bc4e
X-Patchwork-Hint: ignore
Message-Id: <20251217204532.E705487111@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiosqlite: bump version to
 0.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c958889b10fe377942493ffa87f05ee9d582bc4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/omnilib/aiosqlite/blob/v0.22.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiosqlite/python-aiosqlite.hash | 4 ++--
 package/python-aiosqlite/python-aiosqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
index eed222f80f..b47cdaf6a2 100644
--- a/package/python-aiosqlite/python-aiosqlite.hash
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosqlite/json
-md5  693b491a6ad7caa281618a83bf83ddc6  aiosqlite-0.21.0.tar.gz
-sha256  131bb8056daa3bc875608c631c678cda73922a2d4ba8aec373b19f18c17e7aa3  aiosqlite-0.21.0.tar.gz
+md5  1277d7c460a278cc165ae52be14f8fa9  aiosqlite-0.22.0.tar.gz
+sha256  7e9e52d72b319fcdeac727668975056c49720c995176dc57370935e5ba162bb9  aiosqlite-0.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
index bdb222001e..208960954d 100644
--- a/package/python-aiosqlite/python-aiosqlite.mk
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSQLITE_VERSION = 0.21.0
+PYTHON_AIOSQLITE_VERSION = 0.22.0
 PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
-PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/13/7d/8bca2bf9a247c2c5dfeec1d7a5f40db6518f88d314b8bca9da29670d2671
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/3a/0d/449c024bdabd0678ae07d804e60ed3b9786facd3add66f51eee67a0fccea
 PYTHON_AIOSQLITE_SETUP_TYPE = flit
 PYTHON_AIOSQLITE_LICENSE = MIT
 PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
