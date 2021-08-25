Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD77C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:24:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80558610CE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80558610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59FF0605CC;
	Wed, 25 Aug 2021 20:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9jkX9ensuau; Wed, 25 Aug 2021 20:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6834605E4;
	Wed, 25 Aug 2021 20:24:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C31871BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0588881ABB
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWHxVcr2Xb07 for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:22:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F0B0819D5
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 20:22:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2145B89066; Wed, 25 Aug 2021 20:21:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 21:45:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc16e06f28025a36992c9c1a39a36e72b7a19df1
X-Git-Newrev: 2463bebe471f071a0453dccab1851e11d61d4ab7
X-Patchwork-Hint: ignore
Message-Id: <20210825202152.2145B89066@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libffi: disable use of static exec
 trampolines
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

commit: https://git.buildroot.net/buildroot/commit/?id=2463bebe471f071a0453dccab1851e11d61d4ab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TestGst1Python test segfault since the libffi bump to 3.4.2.

Apply the same fix from Yocto [1] disabling static exec trampolines.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1522848331

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=dadfef3950fae4e93ce4c13ab91a2a7f41b3702e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libffi/libffi.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 0ef2786988..85b4ab5b84 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -13,5 +13,9 @@ LIBFFI_INSTALL_STAGING = YES
 # We're patching Makefile.am
 LIBFFI_AUTORECONF = YES
 
+# The static exec trampolines is enabled by default since
+# libffi 3.4.2. However it doesn't work with gobject-introspection.
+LIBFFI_CONF_OPTS = --disable-exec-static-tramp
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
