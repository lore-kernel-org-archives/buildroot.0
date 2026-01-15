Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AEDCCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A087081E36;
	Mon, 19 Jan 2026 10:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ePULBphFmBE; Mon, 19 Jan 2026 10:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA7381E2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816864;
	bh=Rc2Ced5/TU8vzJJ87eUe9o/e8uN4LqwVV8FKlx257gk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XSXN2cmoE6BgyxUeVQSaeBzpnMhaVKJ61AjryXwdtOmx5h8Stx4IYTvpH2Ica70CE
	 xYVjsFfFcAXS+tVFM4DPqQxpxai9RW8GBEJby755Yry3j6iH5GgA4q+8f2WxtSV7Ww
	 qN2+Sm7HnGjIhBBlXzD1FfnppgBra52yO707QcNkIS716kgGyazdSZI8CxOv1cgwXR
	 +24+tk5wG3wGbI57N9CzGq6DRXCe1Joc6bV7SVI7HdxJGMm2Soy4hyBsevJqTgCMsC
	 6jvTo+TlG3yBD3E4UzGjaCYaeWbo9ZX749JzlG4rgIuHoxpLY1Vg6i9q96kEx6In1c
	 mg1FlX5xor+eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA7381E2E;
	Mon, 19 Jan 2026 10:01:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15744347
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4377406BB
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktBhUrgJ3pSk for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 069CA406DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 069CA406DD
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05B89885E6; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:32:31 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b9bb73c0eb282b9e7e1f6e425970a7b3a0255dcf
X-Git-Newrev: beb6064cd54fec71d90d7bad2e12a6b2ce6fe2d3
X-Patchwork-Hint: ignore
Message-Id: <20260119100041.05B89885E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/uclibc: bump to
 1.0.56
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=beb6064cd54fec71d90d7bad2e12a6b2ce6fe2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Changes in this release:

Julian Vetter (1):
      libc: kvx: add {get,set,swap,make}context functions

Waldemar Brodkorb (6):
      Add glibc internal macros for 64 Bit architectures
      fix verbose output with make 4.4.1
      nds32: add missing define for TLS
      NPTL: remove attribute_protected from function
      add gettid syscall wrapper
      bump version for 1.0.56 release

tinyusbboard .matrixstorm (1):
      avoid crashes in statical linked binaries when dlopen()

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f82f5fe177b7f884d424c7ce22aff670ed13f359)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 56174a33b8..6a96e57069 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.55/uClibc-ng-1.0.55.tar.xz.sha256
-sha256  5f7f3aafddb2ca08fb295be45561c0188407103d7446cfd264b9b822fed3ed2d  uClibc-ng-1.0.55.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.56/uClibc-ng-1.0.56.tar.xz.sha256
+sha256  23c9cab54c113e020fb20b9dc06be4a49560df791b78fcbc2ca899a6e8f213dd  uClibc-ng-1.0.56.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0c303d77f8..e1cf12fa68 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.55
+UCLIBC_VERSION = 1.0.56
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
