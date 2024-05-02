Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E3EC25B10
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E91914159C;
	Thu,  2 May 2024 08:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnPsQMbu4NO6; Thu,  2 May 2024 08:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6651441596
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6651441596;
	Thu,  2 May 2024 08:37:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6D811BF47A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4C72414C2
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IA1O3aY4E6x for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBC14414D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBC14414D6
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:36:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D61CB8660A; Thu,  2 May 2024 08:36:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 10:29:47 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f658e8c9f8ce715a225318fa6c58feeaace30d44
X-Git-Newrev: b788c8cd0ae3a36d9f1cc3cd325b5e0e6d38f977
X-Patchwork-Hint: ignore
Message-Id: <20240502083654.D61CB8660A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/tiff: explicitly
 disable lerc support for host and target
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b788c8cd0ae3a36d9f1cc3cd325b5e0e6d38f977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

We do not have liblerc in Buildroot and it may cause linking issues for
host-tiff on build hosts with liblerc:

libtool: link: /usr/bin/gcc -O2
-I/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/include
-Wall -W -Wl,-rpath
-Wl,/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/lib
-o tiffcp tiffcp.o
-L/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/lib
../libtiff/.libs/libtiff.so ../port/.libs/libport.a -lLerc -ljbig -lm
-Wl,-rpath
-Wl,/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/build/host-tiff-4.6.0/libtiff/.libs
-Wl,-rpath
-Wl,/home/dragon/src/ft/ftcommunity-TXT/output/build/rootfs/per-package/host-tiff/host/lib
/usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to
`deflateInit_'
/usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to `deflate'
/usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to
`deflateEnd'
/usr/bin/ld: ../libtiff/.libs/libtiff.so: undefined reference to `inflate'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a4011ec1e13baa1190a41d949ad2cd945a9ecbe2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index e384e8b814..8ec53d4fe1 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -16,6 +16,7 @@ TIFF_INSTALL_STAGING = YES
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
 	--disable-contrib \
+	--disable-lerc \
 	--disable-tests \
 	--disable-webp
 
@@ -24,6 +25,7 @@ TIFF_DEPENDENCIES = host-pkgconf
 HOST_TIFF_CONF_OPTS = \
 	--disable-cxx \
 	--disable-zlib \
+	--disable-lerc \
 	--disable-libdeflate \
 	--disable-lzma \
 	--disable-jpeg \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
