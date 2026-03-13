Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FCF105F7B0
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7758440FE8;
	Sat, 14 Mar 2026 07:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGkEvORIgmdy; Sat, 14 Mar 2026 07:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 960F440FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474586;
	bh=BldjbKX8x6m3G4BfGP3OxeaKJazYUaAbd6/SbxS42sQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CTw8aRVjqvBEJA6dOeHZ57RrvTAzXz3y5Wex9/zBm5WzOrpicwmZKmDVY0b5tfELZ
	 DvzmoHeDuKho39w13QC+1PEgjXPQWzf0z6N+HGU60i90RDHtWJcSkLh/b8bUnCHQLG
	 Q6vTUgmOfMGk7fcKVedZezcqJtp8E5P+LOwXXZ6nMZC4WYxzI/iH15DekzqsDEbwNi
	 NHePDEeoucmWaYTr79EWmxJ5N/cs+sjPwSmCWj647Djap+oU1SHelOpX0TsnVJ3yg7
	 IEQad+b34yjVQnDnZG+a7LDXTEoAAED1xJXnppSf4m8Bu8uQ1W32X4/1DeN4XngaYF
	 WPo3+HFknr3KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 960F440FFA;
	Sat, 14 Mar 2026 07:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01826201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA8AC40135
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcM5dbv8BDhi for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 967C8400A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 967C8400A2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE02585E16; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:01:53 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 69c4221f25fc7f854e440eebe381540193438890
X-Git-Newrev: 47addd38d26411a8ef4e02ea534a30fd92cedff2
X-Patchwork-Hint: ignore
Message-Id: <20260314074935.BE02585E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/exiv2: security
 bump version to 0.28.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47addd38d26411a8ef4e02ea534a30fd92cedff2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://exiv2.org/whatsnew.html
https://github.com/Exiv2/exiv2/blob/v0.28.8/doc/ChangeLog

This release fixes three low-severity vulnerabilities:

CVE-2026-25884: Out-of-bounds read in CrwMap::decode0x0805
CVE-2026-27596: Integer overflow in LoaderNative::getData() causes out-of-bounds read
CVE-2026-27631: Uncaught exception: cannot create std::vector larger than max_size()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1c3aa5f977a8748f363e64b1225cccfcc848629e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
