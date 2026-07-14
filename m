Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9B8C44507
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 10:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6514096A;
	Tue, 14 Jul 2026 10:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qf4vujAmi6mK; Tue, 14 Jul 2026 10:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81519408AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784026728;
	bh=lSe9zCdgRBiJOY7OXakfP2Joe8fijIlgm4M3/l+JxbE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VwuR8WrdwvGp/sQfY4C1AGrUlxTw8k5dT6aVPtUw9WirwH03Jk6TjwIxsP+xWJv8c
	 HVJJ7bP1zLJdRNXDtyPPLy/Be2IGXWFFM8zGh/fhuZIRbEmbsgC246LH/pyLXGFeQQ
	 Kp5vGnIpmWmgv9HTll09fynP45FlX/DLvvpC5pYbJ6EaSf1qFreJCoOm11yurbjy0R
	 O6CmCEXtDyvtTcPhplW6Rk9zzqGZDyQ44sUFAkYnwKdO2kHhm5joKTem6gzC7fobtE
	 eCxKeWjqhGsshX4WWwUC75lb9dHlytIRwMCI088LVXy1f6EgNA8oa4/GSH+77dKxNy
	 8LRcnsnG29Rig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81519408AC;
	Tue, 14 Jul 2026 10:58:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E15AD96C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7018401FD
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0hjG4mUkXdw for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 10:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12809401D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12809401D2
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEB1588896; Tue, 14 Jul 2026 10:58:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 12:39:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f25d7056cb13af64133eccd4a6aa3d808d770492
X-Git-Newrev: 38a341d79a8813c228aa37652d97fa9bc06a5730
X-Patchwork-Hint: ignore
Message-Id: <20260714105809.BEB1588896@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pugixml: bump version to 1.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/38a341d79a8813c228aa37652d97fa9bc06a5730
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/zeux/pugixml/releases/tag/v1.16
https://github.com/zeux/pugixml/releases/tag/v1.15

Switched tarball hash to sha256 hash provided by upstream.

Updated license hash due to copyright year bump:
https://github.com/zeux/pugixml/commit/710052066cc0a7210d7f554196ae43bd1cd9da3e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pugixml/pugixml.hash | 5 +++--
 package/pugixml/pugixml.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index 2446788d89..1ae3aba32d 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,3 +1,4 @@
+# From https://github.com/zeux/pugixml/releases/tag/v1.16
+sha256  4cee1ca4aad395170f4c7a07824f3bdd41f28316c6e1e1090a1425b278ec0b4b  pugixml-1.16.tar.gz
 # Locally computed:
-sha256  2f10e276870c64b1db6809050a75e11a897a8d7456c4be5c6b2e35a11168a015  pugixml-1.14.tar.gz
-sha256  01e13f39d058cca09968f18d423912a18f8bf61b9161c65f8e5bcc418a8aba28  LICENSE.md
+sha256  90974fbb120e966b452654eaae3ba6ee55f3647db3b28918a7649733ee99da97  LICENSE.md
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 3935526af6..aada1fb6c0 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.14
+PUGIXML_VERSION = 1.16
 PUGIXML_SITE = https://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
