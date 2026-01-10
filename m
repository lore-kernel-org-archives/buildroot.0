Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F201D277EE
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 16:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 205C3405E0;
	Sat, 10 Jan 2026 16:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCRrN-ysubkf; Sat, 10 Jan 2026 16:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C61405FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768063349;
	bh=FTRtEjw5lQfW5r4dUEXy5bY8HOTkIiaMW5StMGhgjes=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JNuGEsiRMlBQuuLUDWr+9O2MPTGZqpXPOvxhcadblChSnqpD0W920Spols+e50Bxt
	 Mc6WbeQdwidrMpq8zVVBPCBJ4Vj7zS2devhGtpr9h1q8KhEit7k/2VoBnK2Idoz8OZ
	 T8+sy7OgkicWQlJBAPLj1xQgQicijG/UTC74U19t+rLB+mA92XLhO1bLE3Tdzhv974
	 bO9SqMQzJkV6LOlI7t4jDPMNQCbuuqYfmkfm/G0yXoJfmVq92InVv0DPynYBqL2W1x
	 EaugS91VcguNV30f6lbmn85uzuKo5kJlZS9grNtDE96wW8/JoeSi975CrMB3Q1shi7
	 mzBYNSwl1mVwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47C61405FD;
	Sat, 10 Jan 2026 16:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A3CA131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 16:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50E33405E0
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 16:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkC1-wvbMgvE for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 16:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFC2C405CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFC2C405CC
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 16:42:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE24881840; Sat, 10 Jan 2026 16:42:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 17:11:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5db217e51e9a23f7d7a4c8dc33e1b8bb7093a422
X-Git-Newrev: f82f5fe177b7f884d424c7ce22aff670ed13f359
X-Patchwork-Hint: ignore
Message-Id: <20260110164226.DE24881840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: bump to 1.0.56
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

commit: https://git.buildroot.net/buildroot/commit/?id=f82f5fe177b7f884d424c7ce22aff670ed13f359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
