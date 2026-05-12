Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFD0CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77DAC41A6A;
	Fri, 15 May 2026 13:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cnbx5l5oY4on; Fri, 15 May 2026 13:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 916B741AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851721;
	bh=pPD0Eu/TGWFy+1DyjrGZzlErNKZ1cuWjXVfSnp6bgD8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qADII4Lma7EUvFio+lMWSZWnYJWoxeVbTZSEbvypEKXwhc/J+oGFeEzNEU1dvNwZ1
	 3MOGFz7i71j7B6zozE0bG2U2pUJtvu1tokve32WMiC7Pk+6xWAhEL/3OeWZEqsZQhy
	 /oHrRIijhaXkR8PybTPJQa7PEqUkKI8LnuMMdU6qTg1YY7PdnaeLLfSJehERyWX/4U
	 OqQ8FC0dlPcQvh8gWgrM6YoBM/8BaPsxxwvBrZNK2IaAN2Fr5FwCA2UokLc9RDQkcp
	 gFuqW72a6bGhFaQo6RXcdb/Y35usNkeWpS+MjH6IHOA5r/ykwRjR5yfWnRArVCZYO7
	 MQzSbJa10AEwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 916B741AA1;
	Fri, 15 May 2026 13:28:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1589636F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D586155A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etkURyZzY_9X for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E21206155B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E21206155B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4117586356; Fri, 15 May 2026 13:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:45:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 41581d3dc6d4090be68be65c8f72ee17c27d4c4b
X-Git-Newrev: 50ca1f4a6af9fe950bd4edfbf0c61da4b1c7b49d
X-Patchwork-Hint: ignore
Message-Id: <20260515132816.4117586356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcurl: security
 bump to version 8.20.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50ca1f4a6af9fe950bd4edfbf0c61da4b1c7b49d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://curl.se/ch/8.20.0.html
https://curl.se/docs/security.html

Fixes the following CVEs:
https://curl.se/docs/CVE-2026-7168.html
https://curl.se/docs/CVE-2026-7009.html
https://curl.se/docs/CVE-2026-6429.html
https://curl.se/docs/CVE-2026-6276.html
https://curl.se/docs/CVE-2026-6253.html
https://curl.se/docs/CVE-2026-5773.html
https://curl.se/docs/CVE-2026-5545.html
https://curl.se/docs/CVE-2026-4873.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8940fae6070eb064042b9e54b862523cc1b8d6bc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index ad34083745..549527b1af 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_19_0
+# From https://github.com/curl/curl/releases/tag/curl-8_20_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.19.0.tar.xz.asc
+# https://curl.se/download/curl-8.20.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df  curl-8.19.0.tar.xz
+sha256  63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896  curl-8.20.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 2fddfcb379..ac233fd939 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.19.0
+LIBCURL_VERSION = 8.20.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
