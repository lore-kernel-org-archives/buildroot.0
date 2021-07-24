Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9792EC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:54:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CF560E97
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61CF560E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 401B183B48;
	Sat, 24 Jul 2021 07:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iyh52Zkx_6q4; Sat, 24 Jul 2021 07:54:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9694A83B42;
	Sat, 24 Jul 2021 07:54:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0003E1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E394B40581
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sydoA9mdl2x for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:54:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38C5C4060F
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0AD22888F1; Sat, 24 Jul 2021 07:19:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:53:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 950a09fc56e76499258a843472d4fd5d1a08bf25
X-Git-Newrev: 05a248571c19d52f11a46c669322e3aaa9713444
X-Patchwork-Hint: ignore
Message-Id: <20210724071939.0AD22888F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proxychains-ng: fix build with
 xtensa
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

commit: https://git.buildroot.net/buildroot/commit/?id=05a248571c19d52f11a46c669322e3aaa9713444
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure with xtensa raised since bump to version 4.14 in
commit 35953d1e61aa8581be09c9dca39365955b10590e

Fixes:
 - http://autobuild.buildroot.org/results/9320d9b2c69882e23bbe7b30057eb8bee0c9d2e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-configure-fix-check_link_silent-test.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch b/package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch
new file mode 100644
index 0000000000..aadfef9cd9
--- /dev/null
+++ b/package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch
@@ -0,0 +1,41 @@
+From 4a557f242a76c6a2a3134acf1d3279818f8ab371 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 23 Jul 2021 09:50:36 +0200
+Subject: [PATCH] configure: fix check_link_silent test
+
+Replace -o /dev/null by -o "$tmpc".out when testing with
+check_link_silent otherwise test will fail with some bugged binutils
+(https://sourceware.org/bugzilla/show_bug.cgi?id=19526) since version
+4.13 and
+https://github.com/rofl0r/proxychains-ng/commit/35a674bdbc294730429a1007c9e7ce01e65b49b5:
+
+checking what's the option to use in linker to set library name ...
+cannot find an option to set library name
+package/pkg-generic.mk:249: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/proxychains-ng-4.14/.stamp_configured' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9320d9b2c69882e23bbe7b30057eb8bee0c9d2e5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rofl0r/proxychains-ng/pull/387]
+---
+ configure | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 8b21b97..cfe19e7 100755
+--- a/configure
++++ b/configure
+@@ -49,7 +49,8 @@ check_compile_run() {
+ 
+ check_link_silent() {
+ 	printf "$2" > "$tmpc"
+-	$CC $OUR_CPPFLAGS $CPPFLAGS $1 $CFLAGS "$tmpc" -o /dev/null >/dev/null 2>&1
++	$CC $OUR_CPPFLAGS $CPPFLAGS $1 $CFLAGS "$tmpc" -o "$tmpc".out  >/dev/null 2>&1
++	rm -f "$tmpc".out
+ }
+ 
+ check_link() {
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
