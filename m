Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D9CDE000
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 17:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C91382171;
	Thu, 25 Jun 2026 17:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7q1pOE3JYKS; Thu, 25 Jun 2026 17:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E05682177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782406803;
	bh=Ship5buzd0Sp3VLj0Lh2sDTPx4yN4voiDD/2LfGslT8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lke2eV5kp3AtDp6s29S8bc4wLMzpTC/uUMw8HRpbaUbmfxM5TWpSrHwFCjHwLKQjW
	 AGp6JHGPLnXhBaPax6hKJIIAeHu7SkqK5G7DFkbgaxtk5wxL90ugQ/FWVK1BaROY4z
	 xqx0Vq+1B3K3H2QYa1XHjIFZdjyxpQRoAFblcHy2mRWNVi4q9TJE3tf3SOzCk9MysI
	 8jE1Eqa5vM1/U3/of23eTkZkQqOD+CZ9Xau6rv4KnqS6jm4s03R9/aPN9F5Huiu4tP
	 /uRDH2B98fszMxw+rX17Y2L8r70b3tHm/dGSF3W3vHOrddipiUoC3cqbJ5itmvjWxP
	 fjATUxWR4Uehw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E05682177;
	Thu, 25 Jun 2026 17:00:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 944EA2C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7707F61056
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0OeJEu-DCeQ for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 17:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A310B61057
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A310B61057
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:00:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E3BB85A61; Thu, 25 Jun 2026 16:59:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 18:57:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9998130badb6101cdf6f6da0bbd1228d79825b63
X-Git-Newrev: 614c32d2dd21eee612830e2608adc7aff3bef64d
X-Patchwork-Hint: ignore
Message-Id: <20260625165935.0E3BB85A61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-httplib: security bump version
 to 0.48.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/614c32d2dd21eee612830e2608adc7aff3bef64d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/yhirose/cpp-httplib/releases/tag/v0.48.0
- this bump includes a security fix for the Mbed TLS and wolfSSL
  backends which are unused by buildroot
https://github.com/yhirose/cpp-httplib/releases/tag/v0.47.0
- this bump includes a security fix for the Mbed TLS and wolfSSL
  backends which are unused by buildroot
https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.1
https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.0
- this bump includes a security fix
https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.1
https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.0
https://github.com/yhirose/cpp-httplib/releases/tag/v0.44.0
- fixes CVE-2026-45372 & CVE-2026-46527
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.4
- fixes CVE-2026-45352
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.3
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.2

https://github.com/yhirose/cpp-httplib/compare/v0.43.1...v0.48.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index f3e05951e9..842b96f3eb 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  000832a5b50b67b82a77845c09d832f6e492011cd0ef1d4f72f808eb6a4fbeb3  cpp-httplib-0.43.1.tar.gz
+sha256  d9ed142d319c6e19a961f477257e67f846909ce15288502188df2281941be84e  cpp-httplib-0.48.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index e8bc0a56fe..94f270df94 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.43.1
+CPP_HTTPLIB_VERSION = 0.48.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
