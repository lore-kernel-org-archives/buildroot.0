Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1054CD128A
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 07:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA594044D;
	Sat,  6 Apr 2024 07:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zu7NRhorBTtG; Sat,  6 Apr 2024 07:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8295414C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8295414C5;
	Sat,  6 Apr 2024 07:43:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56B0C1BF390
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 436E440444
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11tDeFgl-gUh for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 07:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775C54042A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 775C54042A
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 07:43:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E9F88455C; Sat,  6 Apr 2024 07:43:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 6 Apr 2024 09:42:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0bbfaea0e983c1ce42a9c3085f3ca3dd796852f
X-Git-Newrev: a4011ec1e13baa1190a41d949ad2cd945a9ecbe2
X-Patchwork-Hint: ignore
Message-Id: <20240406074344.6E9F88455C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: explicitly disable lerc
 support for host and target
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4011ec1e13baa1190a41d949ad2cd945a9ecbe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
