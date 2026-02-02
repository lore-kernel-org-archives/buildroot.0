Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AF5E7315B
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 957068375B;
	Mon,  2 Feb 2026 11:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIic33RO928I; Mon,  2 Feb 2026 11:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D698379C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770032338;
	bh=e3G0GhehfZ40T5v2byVQ2O91nrdln3ecg9M6vTFO1Tk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QtVgz/oJugVTI8Ok/A5GqNVhzlcAJBymt7dkMaC/g5PknIQen+WbN4ieQuGeGVJP6
	 h8oEVr91o5Fyx4F0W4lwvWv8fsyAha13PJLQ4wK0gABMNKSVe1tCuf4ttbXAWxJCyy
	 o7XkCp1Zd/d5nztF+N5pzdR947S0cWHqDsHE4PxyEZY2PenKm/3K7U271VNjrNHlT2
	 Wo4cL4kwtM9IWZmYl7QzhBGCwZERghEj+RZFGXlOGAILZqxvfircTdgZJK70+JDkOg
	 Lr+nyFrdc36tQnqQ644Pdk+VCSWJJSJW1G/qnMZNXC1hfTQ6/+RMECYTP6BB7GSg+V
	 uVBWhMciJFD7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93D698379C;
	Mon,  2 Feb 2026 11:38:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95FC41E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84ACC40A5A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd2whT5ctelt for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 360A54099B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 360A54099B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:38:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D8498630F; Mon,  2 Feb 2026 11:38:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 12:38:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9a8f187e029ffeb040327d082dacf1fa373cc7d
X-Git-Newrev: a0081aa1f8c332d5fb6dbb19de9e46cb39be4931
X-Patchwork-Hint: ignore
Message-Id: <20260202113856.1D8498630F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: security bump to 1.28.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a0081aa1f8c332d5fb6dbb19de9e46cb39be4931
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for changes:
https://nginx.org/en/CHANGES-1.28

Following security related issues are fixed:
    *) Security: processing of a specially crafted login/password when using
       the "none" authentication method in the ngx_mail_smtp_module might
       cause worker process memory disclosure to the authentication server
       (CVE-2025-53859).
    *) Security: insufficient check in virtual servers handling with TLSv1.3
       SNI allowed to reuse SSL sessions in a different virtual server, to
       bypass client SSL certificates verification (CVE-2025-23419).
    *) Security: processing of a specially crafted mp4 file by the
       ngx_http_mp4_module might cause a worker process crash
       (CVE-2024-7347).
       Thanks to Nils Bars.
    *) Security: when using HTTP/3, processing of a specially crafted QUIC
       session might cause a worker process crash, worker process memory
       disclosure on systems with MTU larger than 4096 bytes, or might have
       potential other impact (CVE-2024-32760, CVE-2024-31079,
       CVE-2024-35200, CVE-2024-34161).
       Thanks to Nils Bars of CISPA.

Update patch 0007, which does not apply cleanly.
License file was changed, year was bumped to 2025.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch | 11 ++++-------
 package/nginx/nginx.hash                                      |  4 ++--
 package/nginx/nginx.mk                                        |  2 +-
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch b/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
index c10fcd11c9..4656634bd3 100644
--- a/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
+++ b/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
@@ -10,11 +10,11 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/src/os/unix/ngx_linux_config.h b/src/os/unix/ngx_linux_config.h
-index 2f6129d..4244086 100644
+index d99358c93..612935524 100644
 --- a/src/os/unix/ngx_linux_config.h
 +++ b/src/os/unix/ngx_linux_config.h
-@@ -55,10 +55,12 @@
- #include <crypt.h>
+@@ -54,10 +54,12 @@
+ #include <sys/ioctl.h>
  #include <sys/utsname.h>        /* uname() */
  
 -#include <dlfcn.h>
@@ -27,7 +27,4 @@ index 2f6129d..4244086 100644
 +#endif
  
  
- #if (NGX_HAVE_POSIX_SEM)
--- 
-2.8.2
-
+ #if (NGX_HAVE_CRYPT_H)
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 77220665f3..7b79036b20 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa  nginx-1.26.3.tar.gz
+sha256  40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e  nginx-1.28.1.tar.gz
 # License files, locally calculated
-sha256  f19c4caea60247490199c5a6d0134281e3fb20b3d7577e6873c628597f5381d9  LICENSE
+sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 6ca1ac2075..41490caee2 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.26.3
+NGINX_VERSION = 1.28.1
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
