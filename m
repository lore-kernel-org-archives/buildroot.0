Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F732C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 183A640C93;
	Thu, 11 Aug 2022 11:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 183A640C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tz3mx6kxZfsf; Thu, 11 Aug 2022 11:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F4A440C95;
	Thu, 11 Aug 2022 11:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F4A440C95
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44C0C1BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20F6E40C86
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20F6E40C86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmY4m8jNQU4G for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EC0840382
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC0840382
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 331008713C; Thu, 11 Aug 2022 11:34:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:45:08 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 90323515c5a6e3082c6c2714916936f993ef9884
X-Git-Newrev: 236db8c55dee55384944693bf02e965417aed93e
X-Patchwork-Hint: ignore
Message-Id: <20220811113404.331008713C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bayer2rgb-neon:
 fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=236db8c55dee55384944693bf02e965417aed93e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure:

/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/10.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: ./.libs/libbayer2rgb3.so: undefined reference to `__bayer2rgb_missing_convert_dumb_implementation'

Fixes:
 - http://autobuild.buildroot.org/results/69a637b7f1422ce2bf04dda573abb09388b9a02d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c70601762104d6d2beba51bc5804fcd204bd6bd3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-src-convert.c-remove-have_cplusplus.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch b/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch
new file mode 100644
index 0000000000..71a6291a3c
--- /dev/null
+++ b/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch
@@ -0,0 +1,56 @@
+From ca68dadf585aadb8adf582cd94f8fcdd4592e09f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Jun 2022 10:31:49 +0200
+Subject: [PATCH] src/convert.c: remove have_cplusplus
+
+Remove have_cplusplus function for simplicity and to avoid the following
+build failure:
+
+/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/10.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: ./.libs/libbayer2rgb3.so: undefined reference to `__bayer2rgb_missing_convert_dumb_implementation'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/69a637b7f1422ce2bf04dda573abb09388b9a02d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/convert.c | 19 +++++--------------
+ 1 file changed, 5 insertions(+), 14 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index c852a14..83d631d 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -27,25 +27,16 @@ static bool have_neon()
+ #endif
+ }
+ 
+-static bool have_cplusplus()
+-{
+-#ifdef HAVE_CPLUSPLUS
+-	return true;
+-#else
+-	return false;
+-#endif
+-}
+-
+ void bayer2rgb_convert_dumb(struct image_in const *input,
+ 			    struct image_out const *output,
+ 			    struct image_conversion_info *info)
+ {
++#ifdef HAVE_CPLUSPLUS
++	return bayer2rgb_convert_cc(input, output, info);
++#else
+ 	extern void __bayer2rgb_missing_convert_dumb_implementation();
+-
+-	if (have_cplusplus())
+-		return bayer2rgb_convert_cc(input, output, info);
+-	else
+-		__bayer2rgb_missing_convert_dumb_implementation();
++	__bayer2rgb_missing_convert_dumb_implementation();
++#endif
+ }
+ 
+ void bayer2rgb_convert(struct image_in const *input,
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
