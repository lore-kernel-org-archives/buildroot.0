Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9C2EFCE49
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6358380B83;
	Wed,  4 Mar 2026 21:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4yAvCx6gKsl; Wed,  4 Mar 2026 21:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5141780EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772659939;
	bh=DQcbkYNeD4fSMBgLFwQQLClpUy1ne9LFJ1c/YtlM7BY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jOZnkcgsd9nXbBu4wyGP835Am3OsY2dQwxWJJgj1i9Xs6JL8NTjbNdbmp8ftkfgof
	 ue/MxxBoXpN2V6W7L0g7Xa/SckQjjVQIqRCkcqnZCqyThjnDJ2SDU0RoJ6kuBFdv5I
	 I7ZQXGqvw6gQcHBEdXibcnrfJUvkGlFoeaufBtpJKZ9hLV+C85a7xj8avUH8IkJeKD
	 RS/y7XqGIH6CrDcGNNvlHfxu0l99eaNvJSeuhvKd6VMIcuyY/Yz7ncj7hvV4PsUFip
	 KjDxxyjyvIqWgs1VubOjUSpSINozt1xBLUN9SEFBCfAH+lA6geM6Aqf2PqW5LzWtI1
	 0NaDT/0ODDlgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5141780EAF;
	Wed,  4 Mar 2026 21:32:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5591125B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4688C6087D
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElBura2_W8z6 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9221B60683
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9221B60683
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:32:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89EAD86213; Wed,  4 Mar 2026 21:32:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 22:27:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c3933d14bc6b8622733f1ada788c168ba9f8775
X-Git-Newrev: 1c3aa5f977a8748f363e64b1225cccfcc848629e
X-Patchwork-Hint: ignore
Message-Id: <20260304213217.89EAD86213@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exiv2: security bump version to
 0.28.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c3aa5f977a8748f363e64b1225cccfcc848629e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://exiv2.org/whatsnew.html
https://github.com/Exiv2/exiv2/blob/v0.28.8/doc/ChangeLog

This release fixes three low-severity vulnerabilities:

CVE-2026-25884: Out-of-bounds read in CrwMap::decode0x0805
CVE-2026-27596: Integer overflow in LoaderNative::getData() causes out-of-bounds read
CVE-2026-27631: Uncaught exception: cannot create std::vector larger than max_size()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index 1c85f2e1db..7c497cf0eb 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5e292b02614dbc0cee40fe1116db2f42f63ef6b2ba430c77b614e17b8d61a638  exiv2-0.28.7.tar.gz
+sha256  ea51b0609f58a9afa063b60daa1539948b62247721e154f4fff0ad3aec9f9756  exiv2-0.28.8.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index e5b55ecde7..d45acae34e 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.28.7
+EXIV2_VERSION = 0.28.8
 EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
