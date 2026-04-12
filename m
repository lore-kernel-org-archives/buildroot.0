Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFA1E937EC
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 16:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F17A42394;
	Sun, 12 Apr 2026 16:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVy7zLBqUA-l; Sun, 12 Apr 2026 16:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 861C14230E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776010971;
	bh=PK+y0GMgi/0sCyrrYNIJzVJmPI0+FAOthZciWFdB7oo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fXgRa4W+5XA2+KG17U9KzjzD7KrELpFx4iZanhnlO7XPe2rfKYyobjT2QHblv3njY
	 TnHftWnEXKohtONV5F6t9YJgBBRJDoVbD0j3bJRX/2OWhpjU4JLVPMU+3FLAE1JtEl
	 bWye9SmDjjdNBB/f1J5LPcHENsrEguEttI0su8RCeUWbRO3E1BgUHn1nG49etqANYR
	 xDR7KB/tjt1CEh3djIFP+kdGBjABzfEM46asaE33eiCtZ4zXm35VwhrTYVes5uVcmF
	 eCp1QCcc3Csi8356GNQiXW6j/Q88KZiliuGpXjsoZvH67kKiKrklj96iQE4i7XVnrY
	 jfGxbFyVxNfmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 861C14230E;
	Sun, 12 Apr 2026 16:22:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8493237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A9A84562
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n49SHajCyEo6 for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 16:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4F284559
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF4F284559
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:22:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 870A4810E5; Sun, 12 Apr 2026 16:22:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 18:18:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19370808a2aa8243c18d2ed1712057686e3c9640
X-Git-Newrev: fa6f9a922e5ca1562b1f5bdcef1ef14b6026f859
X-Patchwork-Hint: ignore
Message-Id: <20260412162249.870A4810E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-httplib: bump to v0.41.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fa6f9a922e5ca1562b1f5bdcef1ef14b6026f859
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:
https://github.com/yhirose/cpp-httplib/releases/tag/v0.41.0

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index eb2b77bcd8..be9967f1e2 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b52ecaebf0f94086c8b3305650412359d920c5267f6d9ce87f883198783af678  cpp-httplib-0.40.0.tar.gz
+sha256  6d38a6b74ea33ac3133b8352f2b55b557c1d42f36e1ed0c01f852e3218329d39  cpp-httplib-0.41.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 5cc60565c6..c4a77b869d 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.40.0
+CPP_HTTPLIB_VERSION = 0.41.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
