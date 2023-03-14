Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD87C7618B
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 21:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D00540B7F;
	Tue, 14 Mar 2023 21:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D00540B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6cGm5E8rdPY; Tue, 14 Mar 2023 21:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9DAA40B7D;
	Tue, 14 Mar 2023 21:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9DAA40B7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABC731BF38B
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 870FA403D6
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 870FA403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22YLjbgn9ExO for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 21:57:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B29A840B56
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 21:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B29A840B56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A227F8733A; Tue, 14 Mar 2023 21:57:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 22:55:05 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 0cafa277ed9b0d4daf9c3c45f1188976941243da
X-Git-Newrev: 56aacb8249c735ac4c76edfd7c989cad28543b9e
X-Patchwork-Hint: ignore
Message-Id: <20230314215728.A227F8733A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libcurl: bump
 version to 7.88.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=56aacb8249c735ac4c76edfd7c989cad28543b9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Bugfix release fixing a number of issues introduced in 7.88.0:

https://curl.se/changes.html#7_88_1
https://daniel.haxx.se/blog/2023/02/20/7-88-1-the-second-final-one/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eb566be8dc0e3a36270fe76d669fe51379d498f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 714b02acb0..32b3d0b5e2 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.88.0.tar.xz.asc
+# https://curl.se/download/curl-7.88.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  fd17432cf28714a4cf39d89e26b8ace0d8901199fe5d01d75eb0ae3bbfcc731f  curl-7.88.0.tar.xz
+sha256  1dae31b2a7c1fe269de99c0c31bb488346aab3459b5ffca909d6938249ae415f  curl-7.88.1.tar.xz
 sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index eb481e4782..1a1594a45e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.88.0
+LIBCURL_VERSION = 7.88.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
