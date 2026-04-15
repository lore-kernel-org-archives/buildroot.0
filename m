Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCA9F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23DC8817A9;
	Fri, 17 Apr 2026 15:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgBLKJhD0jEC; Fri, 17 Apr 2026 15:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23DAB817B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439235;
	bh=FzbAARyLzr0j0LUOZpRfVtYWenvRty4UJe0QSKdL1M0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nYNpgiK31fcwijhZiUtB2fMMkIDjjRCBqXi5T7ot82o2gnuIJDHDIJor5aHovI02l
	 56y14xuXiCx2dfXwyAVlFmEdiG7wIbk9WaWE5pIPxugpwEeKxTtIkEmwGCukgs3lEG
	 p9oan0Ul6pgfckioijhci1/kMAqhSHIhq43NyJ0ox05HQv7g21hxAiY4+XDNdSo+Nb
	 qrv7EJMgvIHJsNp7HE9z7A4k6YUVcJDnGtK6aeUm4v0ISktrZziJhHAODrfjo7BjVx
	 1MsrLC/64kJA+HKVPR2mL74yXIcqqEWOwSa05/kjbIN/R6fORdF6oVRCBE8ii7dFrQ
	 m3YfyTIQnOHlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23DAB817B1;
	Fri, 17 Apr 2026 15:20:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C1D3259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A3CA40585
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrwdvZS2eY1j for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC8A4043C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FC8A4043C
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1165B819B4; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Apr 2026 12:51:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 13d132b340994f2710b4d5cb1eab2f475f631664
X-Git-Newrev: 474c124db19c84b0609d52acdd10c1ad4f6f9fcf
X-Patchwork-Hint: ignore
Message-Id: <20260417152008.1165B819B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libopenssl:
 security bump to version 3.5.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/474c124db19c84b0609d52acdd10c1ad4f6f9fcf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

fixes CVE-2025-11187, CVE-2025-15467, CVE-2025-15468, CVE-2025-15469,
CVE-2025-66199, CVE-2025-68160, CVE-2025-69418, CVE-2025-69419,
CVE-2025-69420, CVE-2025-69421, CVE-2026-22795 and CVE-2026-22796, see
https://github.com/openssl/openssl/releases/tag/openssl-3.5.5

fixes CVE-2026-31790, CVE-2026-2673, CVE-2026-28387, CVE-2026-28388,
CVE-2026-28389, CVE-2026-28390, CVE-2026-31789, see
https://github.com/openssl/openssl/releases/tag/openssl-3.5.6

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Reproducible-build-do-not-leak-compiler-path.patch           | 4 ++--
 .../0004-Serialize-install-process-to-avoid-multiple-make-dep.patch   | 4 ++--
 package/libopenssl/libopenssl.hash                                    | 4 ++--
 package/libopenssl/libopenssl.mk                                      | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
index 9353c1ae90..d283d8b329 100644
--- a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
@@ -12,10 +12,10 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/crypto/build.info b/crypto/build.info
-index 2c619c6..49ca6ab 100644
+index aee5c46766..84d94aa623 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -115,7 +115,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
+@@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
  DEPEND[cversion.o]=buildinf.h
diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
index 344b8d07b7..176375c000 100644
--- a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
+++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
@@ -23,10 +23,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index e85763ccf8..b671723813 100644
+index 5bf397eba0..806084ac0c 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -661,7 +661,11 @@ depend: Makefile
+@@ -662,7 +662,11 @@ depend: Makefile
  # Install helper targets #############################################
  ##@ Installation
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index e78b664aa5..781701532d 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
-sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.6/openssl-3.5.6.tar.gz.sha256
+sha256  deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736  openssl-3.5.6.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 2f844fd44a..837c3f0346 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.4
+LIBOPENSSL_VERSION = 3.5.6
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
