Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CF3E85388
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C408329A;
	Fri,  3 Apr 2026 17:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nnDyoeun0Li; Fri,  3 Apr 2026 17:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FF0282EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775238248;
	bh=eEXTHFiPnWdL/6nReZPrZyK5uQbUqcC1Xfhz/qHtIIQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k5S8fdD03EAtI041PxP2u78ZC8I+o08WygUq2sW3ZyBeIgR0WtGceQn7MKIymXJlW
	 KQHZAvJR9Nr0KCqan/EigqsPPO+MqsaLNoSChtQN3iES3hWhwN1jOSeraphiWYhysB
	 W4P4+jcSd6tLA7YyPhZpazYN6+lztvZx7EwGNEOH2pGk9ex6r8It5xad8AIgGZ3Zuv
	 +bW73zte6sppEwtTJIRXqh/UueneWQY9KNHbDkMigqCtBN6QOStCvm+KaIcBGJGmBV
	 1NoPEKdKLK4sIwu2HbNvTSo8phnSLdOPPDbv2wcd0CnbaAb38jXo9TW2jmkGjcrWpw
	 kGLFbZcuQNsOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FF0282EE1;
	Fri,  3 Apr 2026 17:44:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2B1D1AF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2DD082F98
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njGH1yl8tfXL for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 736B2825D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 736B2825D3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:44:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D260080175; Fri,  3 Apr 2026 17:44:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:42:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fb10c689c3a731988330ae52dc29f19b8dc4201
X-Git-Newrev: 16c02a4ec43d8fe3cdd579f928acf320cbc41219
X-Patchwork-Hint: ignore
Message-Id: <20260403174404.D260080175@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwdata: bump version to 0.406
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16c02a4ec43d8fe3cdd579f928acf320cbc41219
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/vcrhonek/hwdata/releases/tag/v0.406

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 5d0014d4eb..b7323fe117 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  13605519e72e46aa13d5eede1901a07a6c83cd25ef866a86e7458047b5c81ce5  hwdata-0.405.tar.gz
+sha256  1ccfd1ca723595b1fe8794f4157ec5635be1ebedb5d13769b4be75d0b75bc199  hwdata-0.406.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 879eb51322..e12ce7efb6 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.405
+HWDATA_VERSION = 0.406
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
