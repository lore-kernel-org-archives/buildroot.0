Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27418FED3F2
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 19:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DAD80C17;
	Fri, 24 Apr 2026 19:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yP4bgor8sSWI; Fri, 24 Apr 2026 19:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DF180C33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777060209;
	bh=X8fvQEp84BYTAPNOSWrf2MbL5s8cTTqxSAn8H4L0PEg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nnoy45cfXctyzgG5+b3M4VkWW7zMybyyoj5tzjJi3eT6fllMCAGDoc3LjFApIr8ns
	 dGX6KUZehvdXTanVwQ+mUdyOLs5lTkEP0VRJXKBtRwx9ZNZmZqVjli0JA7USM/PxM9
	 KLSru1c6vmq56wzK6LI0untUludXYhF2TONPHTdvudz5VSh1kfNaKxWUYTbT6iGFBl
	 k0fCOOCAVmXjEIqc0JPhQk1JqvL+pT2ykFnxF/J7orB8lRDRMwXx1FYu7k5+jBkgT4
	 G3XO1aUu46I1T/x+XmjGTIx7dhV8OHztLaohpQIvGLje6KPnHNklgYNmcHrA4220oE
	 G1+Iilt5hXtSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6DF180C33;
	Fri, 24 Apr 2026 19:50:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0E2324D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 19:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F2CB40552
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 19:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQ-UsOa0flir for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 19:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88EC2403D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88EC2403D6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 19:50:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D33982B98; Fri, 24 Apr 2026 19:50:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 21:48:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 373f2b7d628251d689df082a5f96752e9b560608
X-Git-Newrev: 6e54d5fb928eeb7557bbec1e5ce72457ff1bff0b
X-Patchwork-Hint: ignore
Message-Id: <20260424195006.2D33982B98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpfr: bump version to 4.2.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e54d5fb928eeb7557bbec1e5ce72457ff1bff0b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update MPFR from 4.1.1 to 4.2.2.

Release notes:
https://www.mpfr.org/mpfr-4.2.2/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpfr/mpfr.hash | 2 +-
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index 4b0d14c9c2..56e662afa2 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d  mpfr-4.1.1.tar.xz
+sha256  b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01  mpfr-4.2.2.tar.xz
 
 # Hash for license file
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index c0c8c04646..2633084d73 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 4.1.1
+MPFR_VERSION = 4.2.2
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
