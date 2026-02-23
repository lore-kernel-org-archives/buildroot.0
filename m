Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F093DEEF317
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C464B80BE7;
	Thu,  5 Mar 2026 08:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MB6kIVC2pslB; Thu,  5 Mar 2026 08:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D709481DE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697766;
	bh=KR3I35zJH31Mxfv+htxCg8ERexhGizQ0KxZTQwFJ6f8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nss5IYc85f2Ul8uJw9q07p4dGzYXViOav6jr7fGpd4DT5DzSgqSZrGgMNtNR8D+y2
	 u6MWGWT1JeRF8emawMLyTYdMvC237CYRJiSsS9RGAlsI+N+EOe5MYLf6PmtIBY7bwG
	 LxwQE1FFjklMVwK1wWi0lflBaKz2vA2a1HdLVRxdAiUMFEdtaXn+F10GRgx+2Jajy2
	 xEmgLi7RxJVWLs5Q2luQ6PdKzvvssOHIIXEiUS5dfzvae6E5IzYSowTII4rLvddaIC
	 ZXW73JSZeHP/SnySd1cODcOCKW9KvUmTMz0Qe2idGJkil+zjDMzJ6NhztzqB1J7HXY
	 Iu2JBQxy7bPYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D709481DE0;
	Thu,  5 Mar 2026 08:02:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FD734F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1F5C605F4
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Z8J-5VLT3qP for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40326060C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C40326060C
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D08A7863DE; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Feb 2026 22:31:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 347fd878d3071b373e90c194d6b394f08bcd4bda
X-Git-Newrev: 664daf6459fd0a867948ac78da3037386a2f5233
X-Patchwork-Hint: ignore
Message-Id: <20260305080207.D08A7863DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtalloc: bump version to 2.4.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/664daf6459fd0a867948ac78da3037386a2f5233
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switched license file to upstream provided one:
https://gitlab.com/samba-team/samba/-/blob/talloc-2.4.4/lib/talloc/LICENSE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtalloc/libtalloc.hash | 4 ++--
 package/libtalloc/libtalloc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
index 5577583881..c7223bf5bd 100644
--- a/package/libtalloc/libtalloc.hash
+++ b/package/libtalloc/libtalloc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  85ecf9e465e20f98f9950a52e9a411e14320bc555fa257d87697b7e7a9b1d8a6  talloc-2.4.2.tar.gz
-sha256  e01fb092aaed2b431be26674e2b791c77fb5984537c29b514e957582c6b31465  talloc.h
+sha256  55e47994018c13743485544e7206780ffbb3c8495e704a99636503e6e77abf59  talloc-2.4.4.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 676076b857..27d0778f6b 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBTALLOC_VERSION = 2.4.2
+LIBTALLOC_VERSION = 2.4.4
 LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
 LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
 LIBTALLOC_LICENSE = LGPL-3.0+
-LIBTALLOC_LICENSE_FILES = talloc.h
+LIBTALLOC_LICENSE_FILES = LICENSE
 LIBTALLOC_INSTALL_STAGING = YES
 
 # libtalloc is extracted from the samba source tree, and that has a workaround
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
