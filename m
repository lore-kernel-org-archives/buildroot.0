Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01918FF8867
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C53A380F41;
	Mon, 27 Apr 2026 20:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCu9jq08gD6d; Mon, 27 Apr 2026 20:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFC6580EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777321815;
	bh=WW0e6xGDdquzh1pDUVCRyLTJQf4X2Z0nKDknGR9Wfig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F9ejOG7IPDJ52CNUTqvO1joFZfuqWgHy19avOWp2Jj3v/f1jUF5P7GeyR9XH88h8j
	 vYwl0zPo4r7q7qmP852/XyLn53CMF8IlK2TbN2qEF0Iu22PUMO3fk4mrUFsIvSweOG
	 Wt2GtjxOiHMWMe8qFm8QVuZxlBouWlhzI19/GlKg45LDtqwKb/IPo26GDN10MKhBoj
	 aLgKApyN199VfAhiUm85lArJn2lieadlISpkfvEuGSVPC29ifjUDRDjpilqQofeInF
	 Jd9HuUFw1fh/1wpRk7at0f/CwacYYDh7j8wsa3lAn8/zYTfose3PRtsEzvQifSKWge
	 6A6b+h/lQpoaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC6580EE0;
	Mon, 27 Apr 2026 20:30:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68E6A2DF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B1DC80EDF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LitvkrU9mez1 for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96BF280ED3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96BF280ED3
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:30:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57EC183764; Mon, 27 Apr 2026 20:30:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 22:25:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24827ae398db3b721eaff685bc3ee1f4bd5b7214
X-Git-Newrev: c409050184c743ebcf65640cc8eb5c56cc9f570e
X-Patchwork-Hint: ignore
Message-Id: <20260427203012.57EC183764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lcms2: security bump version to
 2.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c409050184c743ebcf65640cc8eb5c56cc9f570e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://littlecms.com/blog/2026/04/17/lcms2-2.19/
https://github.com/mm2/Little-CMS/blob/lcms2.19/ChangeLog

Fixes CVE-2026-41254:
https://security-tracker.debian.org/tracker/CVE-2026-41254

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lcms2/lcms2.hash | 8 ++++----
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index e2277ba610..0ff881158f 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.18
-sha1  3917db04b8d19b62ea6c9d8f4ff0404d145aca4a  lcms2-2.18.tar.gz
-# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.18
-sha256  ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347  lcms2-2.18.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.19
+sha1  bedb39ede32b76bc2cb24ee531d7433cf787b319  lcms2-2.19.tar.gz
+# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19
+sha256  49e7e134e4299733dd0eda434fa468997a28ab3d33fa397c642b03644f552216  lcms2-2.19.tar.gz
 # Locally computed:
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 4ffad41014..32a78a4f35 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.18
+LCMS2_VERSION = 2.19
 LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
