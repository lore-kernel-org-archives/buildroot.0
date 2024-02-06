Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B07C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 20:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B01BC82D0C;
	Tue,  6 Feb 2024 20:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWoRPhC9_aWY; Tue,  6 Feb 2024 20:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A484982F51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A484982F51;
	Tue,  6 Feb 2024 20:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31C191BF2B7
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E82C82CFA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJLLqp9lrNMg for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 20:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D104B82C8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D104B82C8E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D104B82C8E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 20:12:24 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4EC4913F8AE;
 Tue,  6 Feb 2024 21:12:19 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 21:12:13 +0100
Message-ID: <20240206201213.187788-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707250341;
 bh=2v9orfxHSgiANafeIR0jAkcgUfzVoRMBkXjSyvmTnEM=;
 h=From:To:Cc:Subject:Date:From;
 b=ZnnWR0HKUSopbfmO5FLfQuOMeTADkvn0RpSj5pB1V+MKpQdfHUXmBdmvYgC/rAEk5
 o+vB13FaFSAKwQmQ0c1Os9SLP6OatP8irwtFFhZK10ZP5epH+pnrH4ziD4tv0GBGSb
 nFsY9+NeStULC6w/E1auC+c1AgF2vhB/pBkMXSJvlfK8q3KrEMqNDWgnZ/BRvHS9D1
 73AK/96pcxzIqkdkwHW5nrSpJp8jKaDE5SpdaN5vMF4O89+l+m6Xigf2c+2vEgSIms
 UTn27y9iViyYqMElKSSR84uMiwMcM+jxBA0CTtw/LxsgxxhycnwcEXrTmtNA/9fBLN
 B8DA4G+jC7ppg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZnnWR0HK
Subject: [Buildroot] [PATCH 1/1] package/acl: bump to version 2.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announcement [1].

This commit also updates the _SITE variable to match the download URL
published in the release announcement in [1]. The package homepage is
also updated to match the one published at [2]. The main motivation
of those URL updates is to switch to https.

[1] https://lists.nongnu.org/archive/html/acl-devel/2024-01/msg00012.html
[2] https://git.savannah.nongnu.org/cgit/acl.git/tree/README?h=v2.3.2#n4

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/acl/Config.in | 2 +-
 package/acl/acl.hash  | 2 +-
 package/acl/acl.mk    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/acl/Config.in b/package/acl/Config.in
index 92f2251878..056a31baa8 100644
--- a/package/acl/Config.in
+++ b/package/acl/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_ACL
 	  directories.
 	  This package also provides libacl.
 
-	  http://savannah.nongnu.org/projects/acl
+	  https://savannah.nongnu.org/projects/acl
diff --git a/package/acl/acl.hash b/package/acl/acl.hash
index 32e904baf3..a6094fb985 100644
--- a/package/acl/acl.hash
+++ b/package/acl/acl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  c0234042e17f11306c23c038b08e5e070edb7be44bef6697fb8734dcff1c66b1  acl-2.3.1.tar.xz
+sha256  97203a72cae99ab89a067fe2210c1cbf052bc492b479eca7d226d9830883b0bd  acl-2.3.2.tar.xz
 
 # Locally calculated
 sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  doc/COPYING
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index c898421dc5..a5371e1aea 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACL_VERSION = 2.3.1
+ACL_VERSION = 2.3.2
 ACL_SOURCE = acl-$(ACL_VERSION).tar.xz
-ACL_SITE = http://download.savannah.gnu.org/releases/acl
+ACL_SITE = https://download.savannah.nongnu.org/releases/acl
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 ACL_CPE_ID_VENDOR = acl_project
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
