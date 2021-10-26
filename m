Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE10FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:35:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A8060F9B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86A8060F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6E280E3D;
	Tue, 26 Oct 2021 18:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXwcG3BwU50c; Tue, 26 Oct 2021 18:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD5D680D50;
	Tue, 26 Oct 2021 18:35:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DF831BF9AC
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70A774011F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bb64FdPrIW2C for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C3254022A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CA9F388E69; Tue, 26 Oct 2021 18:30:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:30:13 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 44c12a4ea16d70c7c66823b524256839b951a227
X-Git-Newrev: 5aa853dfb852a1ab5373373f1afdd02fd3827b5b
X-Patchwork-Hint: ignore
Message-Id: <20211026183005.CA9F388E69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libunwind: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=5aa853dfb852a1ab5373373f1afdd02fd3827b5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Don't override LIBUNWIND_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 794821faa339c4b7910bb3f4e9299f887acc901e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunwind/libunwind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index abdec86761..5f6b87b9db 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -16,7 +16,7 @@ LIBUNWIND_CONF_OPTS = \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx-exceptions,--disable-cxx-exceptions)
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
-LIBUNWIND_DEPENDENCIES = libatomic_ops
+LIBUNWIND_DEPENDENCIES += libatomic_ops
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
