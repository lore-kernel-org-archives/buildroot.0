Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E93C5CFDB
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA59260677;
	Sat, 15 Aug 2026 09:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAY-brRkrG_F; Sat, 15 Aug 2026 09:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B63276066E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786787367;
	bh=o7dK5nXTZWIMzPZPfM7gPmQ86DsRjLGFPwOvl/tACVc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ElK9wW6HUYttEmPRvseQM15pvf12b7oyzamTnKm7JuiMBuZ5/ChQuqav6HS8txB3U
	 O3NEnkehVwqdWsjx5dhsugHg4UZmzU5FPA0du1G7gRAeVGxOtFH+bqdgr22+4YBfF3
	 iiZM+/+33oqvCyF4EymmHgUGTpSTDwnIZTilT0aClLY/LhWUjRt8P+WksGlJtwnF/d
	 4jmPm77dJAs6S7HimsfoMmed9p6xWZEWHFC66jkodRSj7cBCav1jushP6g095rdO12
	 9okeIcM2zEFDGEue4ycg7e9ke8uByjb0y/EUzOI+PR5SJtFy8iUUUu4jP2FGXX4HVP
	 Mq8IZLmVMYrMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B63276066E;
	Sat, 15 Aug 2026 09:49:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4D6A392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA7F580D00
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpgGW21nXt_c for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1347380CF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1347380CF0
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:49:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9240B88468; Sat, 15 Aug 2026 09:48:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 11:38:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 949063f92b3b492e731f856cd513fb9251c60ddf
X-Git-Newrev: dc500671dfa6e25e8ff3b4d82904f5e5806a9368
X-Patchwork-Hint: ignore
Message-Id: <20260815094834.9240B88468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/assimp: bump to version 6.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc500671dfa6e25e8ff3b4d82904f5e5806a9368
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

6.0.3 Changelog:
https://github.com/assimp/assimp/releases#release-v6.0.3

6.0.4 Changelog:
https://github.com/assimp/assimp/releases#release-v6.0.4

6.0.5 Changelog:
https://github.com/assimp/assimp/releases#release-v6.0.5

Sadly, it doesn't fix any of the four CVEs currently affecting assimp
according to https://security.buildroot.org/master/component/assimp.

License file hash updated due to:

-Copyright (c) 2006-2021, assimp team
+Copyright (c) 2006-2026, assimp team

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/assimp/assimp.hash | 4 ++--
 package/assimp/assimp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 93c081351e..4ede41dfd9 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d1822d9a19c9205d6e8bc533bf897174ddb360ce504680f294170cc1d6319751  assimp-6.0.2.tar.gz
-sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
+sha256  edf3749559c2b7d1f758ffb66fc5bec62186221e623b7f2e8969f17ee46ecb6f  assimp-6.0.5.tar.gz
+sha256  21195d410708b82757d3e34c3a40c427f6e59339da862e9480d4fcdc79b7a1bd  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index dd61b69ca2..cbacf181d2 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 6.0.2
+ASSIMP_VERSION = 6.0.5
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
