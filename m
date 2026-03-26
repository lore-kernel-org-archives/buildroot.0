Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6798F10ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F3B741699;
	Fri, 27 Mar 2026 10:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNqGQkms4WMH; Fri, 27 Mar 2026 10:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EFED416AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605707;
	bh=qIXCkZ5op7seqVQzD3GmNLBlYaZZvns2Xa+IITUf8cE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gNh3sYJgGkAN7iO43y5AEShs8fjCNNPWvkPjIgIDBJBfrdns54NbYcJ33lwDkaTe+
	 AMOt3dleqGQjAXEO5nm3HHCQnWfe06Y+ylElB/eP/V/NlD58iHrI5PYSCD30Co9H/O
	 h16Frqp+TWqbvMhMEbV0oL+dp3eEMZPZdr8i10TzRwy7wmsEGJcfaUoRN4WE9Tk90a
	 6sbm6QquDWvLxt+yjkRcqlN9ChbeZP04q+1FwpHQ91D0TxPedsusZElxH0DYI4MShL
	 TRW6q5+fJaDdpwL7QMj5SAdMqZwS3qBwfaVsv/PTB+IC0ReiWysg4ApxBNIo4WwVa6
	 wjZYSI2zv71kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EFED416AC;
	Fri, 27 Mar 2026 10:01:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFB8B249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B209D40BE6
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvJ6HnnuzOse for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E98CA405EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E98CA405EB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 477D17FBB8; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:07:39 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 75c2df66f664428abb39836fe9b8bf5b9cfcc2a1
X-Git-Newrev: a533d160c02f4c617ed947f0218a03661832e601
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.477D17FBB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/uclibc: bump to
 1.0.57
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a533d160c02f4c617ed947f0218a03661832e601
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Following changes made it into the release:

Joris van Rantwijk (1):
      Fix adjtimex() with TIME64

Waldemar Brodkorb (8):
      sys/stat.h: remove _STAT_VER/_MKNOD_VER
      fix gettid() declaration
      add statx syscall wrapper
      sparc: add optimize build support for leon3
      sparc: sync with Linux kernel definition, fixes gdb compile
      fix compile error on earlier Kernels predating statx
      select: fix compilation failure with very old kernel
      bump version for 1.0.57 release

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 84bc50c82d020b09e55ac866a929c86247b73455)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 6a96e57069..e0dba1b6b4 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.56/uClibc-ng-1.0.56.tar.xz.sha256
-sha256  23c9cab54c113e020fb20b9dc06be4a49560df791b78fcbc2ca899a6e8f213dd  uClibc-ng-1.0.56.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.57/uClibc-ng-1.0.57.tar.xz.sha256
+sha256  8bc734b584e23ff6ae3d0ebb4c0fb1d1d814c58c82822b93130d436afa7ace8b  uClibc-ng-1.0.57.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 69eb73510e..0c91a176fa 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.56
+UCLIBC_VERSION = 1.0.57
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
