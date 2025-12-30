Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A2BEE57C6
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 050BE812BC;
	Tue, 30 Dec 2025 22:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxTky_f42pEm; Tue, 30 Dec 2025 22:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2491D812BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133607;
	bh=bOSK6gP00+k+F+kd7IPHZ1JXQMvaeXPilQHiYnKtLxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kMtis0O6aklBIlEi/u6z7YXYw3XFwcEnUOKsY7Qg4dZS9ImULqJsMQifT+LUrRZz3
	 v+NbMUzVmpYj5HlwoH55vA7lAgO1rCJQAcYGr5qzw0Q0GmPD9sqtsyMjcXDUsCcc/u
	 +FcUAQ1RqfZKQUKqW5qOQwKe/g2lbwnlBKJRaaANpEs7HG4z+KkZDe8R8UgSdjhpqo
	 sooiAW52JBFX/jzN9Ourno24xTPXaEtGoCDt44ENzXWlcUcRoHcNw3lqaVvoWj0uhj
	 TC7zMR3wQkGSnagzZ9Y33wanEJdS3Lcx+NXQveBFqg/uysSmBSKwpn1clkKaLoj6Xj
	 M6+S96EOzedyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2491D812BD;
	Tue, 30 Dec 2025 22:26:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39745277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0752540424
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pex5Tk0B6Z7k for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA6C4038F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DA6C4038F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4786780714; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dd6908a4223aa624cacfe41cda4cf9b9f9bca97
X-Git-Newrev: 02d76e151227f1b4955ce231bdc7d74d15766a96
X-Patchwork-Hint: ignore
Message-Id: <20251230222629.4786780714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: remove trace of
 rpi-userland
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02d76e151227f1b4955ce231bdc7d74d15766a96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package is removed, having a trace of it in a comment is
no longer very useful.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0a1e29a04e..dd440e4062 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -400,7 +400,7 @@ $(BUILD_DIR)/%/.stamp_dircleaned:
 # argument 3 is the lower-case name of the provider
 #
 # example:
-#   $(call virt-provides-single,libegl,LIBEGL,rpi-userland)
+#   $(call virt-provides-single,libegl,LIBEGL,imx-gpu-viv)
 ################################################################################
 define virt-provides-single
 ifneq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),$(3))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
