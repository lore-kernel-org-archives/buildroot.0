Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013C3C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 19:50:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81029610C8
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 19:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81029610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E86340983;
	Thu,  7 Oct 2021 19:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZ80s4jsI2RG; Thu,  7 Oct 2021 19:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0677408E6;
	Thu,  7 Oct 2021 19:50:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 345621BF9C2
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 19:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F7574011D
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 19:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTWtlc4a192t for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 19:50:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4480740104
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 19:50:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 57054934C3; Thu,  7 Oct 2021 19:47:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 21:25:37 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 039a7c4f3c669a5e4155ec195cf42760708b506c
X-Git-Newrev: 7c37b981091644827060b81da798b355f48d685c
X-Patchwork-Hint: ignore
Message-Id: <20211007194721.57054934C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/php-gnupg: fix
 build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c37b981091644827060b81da798b355f48d685c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix the following build failure with gcc 4.8 raised since bump of
php-gnupg to version 1.5.0 in commit
20ecd9c94222ef20b7804084acefb472b8e5deaf and
https://github.com/bukka/phpc/commit/8b5b1e718fbb2ba57102d1e9d844938038df310c:

.libs/gnupg_keylistiterator.o: In function `_phpc_res_close':
gnupg_keylistiterator.c:(.text+0x2d4): multiple definition of `_phpc_res_close'

Fixes:
 - http://autobuild.buildroot.org/results/d79/d79bc1b0f98d68eb8a7fe7d86af5ddcc75e42507/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 867521fed7cc0562aee2ff29ecd6cd257f128b07)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Remove-inlining-_phpc_res_close.patch     | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
new file mode 100644
index 0000000000..9b94cb7e4f
--- /dev/null
+++ b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
@@ -0,0 +1,33 @@
+From 887b0899d7e7423baec691255c2d8b56bb348ecd Mon Sep 17 00:00:00 2001
+From: Jakub Zelenka <bukka@php.net>
+Date: Sun, 14 Mar 2021 18:52:21 +0000
+Subject: [PATCH] Remove inlining _phpc_res_close
+
+[Retrieved from:
+https://github.com/bukka/phpc/commit/887b0899d7e7423baec691255c2d8b56bb348ecd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ phpc.h | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/phpc/phpc.h b/phpc/phpc.h
+index dc5887e..9206105 100644
+--- a/phpc/phpc.h
++++ b/phpc/phpc.h
+@@ -945,16 +945,8 @@ typedef zend_resource * phpc_res_value_t;
+ 	zend_fetch_resource2(Z_RES_P(_pz_res), _res_type_name, _res_type_1, _res_type_2)
+ #define PHPC_RES_DELETE(_pz_res) \
+ 	zend_list_delete(Z_RES_P(_pz_res))
+-#if PHP_MAJOR_VERSION < 8
+ #define PHPC_RES_CLOSE(_pz_res) \
+ 	zend_list_close(Z_RES_P(_pz_res))
+-#else
+-inline int _phpc_res_close(zval *zres) {
+-	zend_list_close(Z_RES_P(zres));
+-	return SUCCESS;
+-}
+-#define PHPC_RES_CLOSE _phpc_res_close
+-#endif
+ 
+ /* resource to zval */
+ #define PHPC_RES_PZVAL(_res, _pzv) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
