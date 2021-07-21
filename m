Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_NOVOWEL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978A0C4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:21:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 582C760F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 582C760F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 365548434D;
	Wed,  4 Aug 2021 00:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOQx8VDaje5r; Wed,  4 Aug 2021 00:21:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E67A84348;
	Wed,  4 Aug 2021 00:21:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9D71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA64941481
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8bOzao9fOZVx for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A313440F21
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 040F081469; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:58:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 17e7cb481eb11c44f476d70d0a619855298ef294
X-Git-Newrev: 8189dc03ad4890842d4764cf7aa4f4856d94d4ba
X-Patchwork-Hint: ignore
Message-Id: <20210803211014.040F081469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxmlrpc: bump
 version to 1.58.02 (code/advanced@r3119)
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8189dc03ad4890842d4764cf7aa4f4856d94d4ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog ([1], [2]):

  - Build: fix bug: won't compile with --enable-libxml2, introduced with
    Release 1.44 (December 2015).

  - Build: update config.guess and config.sub so Configure can recognize
    newer environments.

  - Build: Fix link failure in several tools because they fail to link the
    Curl library. Don't know how long this was broken.

  - Build: Eliminate compiler warnings with GCC 6.3

  - Code cleanups - trailing white space, compile warnings

  - Abyss: fix bug: wild memory reference when server times out waiting for
    request header. Introduced with Release 1.44 (December 2015).

[1] http://xmlrpc-c.sourceforge.net/change.html
[2] http://xmlrpc-c.sourceforge.net/change_advanced.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxmlrpc/libxmlrpc.hash | 2 +-
 package/libxmlrpc/libxmlrpc.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 679098d8df..5d42dc0558 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  08af4372ef92cd33ddfe0d68a351f3c5c0702e39bcdaa3263f2c249d5c3eda96  libxmlrpc-r3120-br2.tar.gz
+sha256  626e36295f43b320082bc7bdd961b46f39fbe2719535b5a417975a8e50c8f7f3  libxmlrpc-r3119-br2.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 2853edc2ce..833dca5065 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# 1.54.03 (code/stable@r3130)
-LIBXMLRPC_VERSION = r3120
-LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/stable
+# 1.58.02 (code/advanced@r3119)
+LIBXMLRPC_VERSION = r3119
+LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/advanced
 LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
 LIBXMLRPC_LICENSE_FILES = doc/COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
