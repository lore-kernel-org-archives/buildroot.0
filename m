Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F9CD4F49
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56939615D0;
	Fri, 15 May 2026 13:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XclXhm1KoeAl; Fri, 15 May 2026 13:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80CE4615DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851809;
	bh=nj79Yy9aKMil0hxhvpv+WaQZty8tRU5g/T9WIG1buxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YTadKz1QsI1msycTbXD+K2tCEzsnebj3uldvPMaKhgcVIrFjXRq9AjNhQ7gmXHsOi
	 uW7HDfqSxgZj0hA/wPeh206409v2wly5FhOzQHIzksPCxDJclmeFbW1T28TGyr76F/
	 oTxsp+k7g0VJ3hkgt2l453Sl8Gfwhcg36kO+ReTBBWaV/iO1BmDNC6vtV08DhIcPkR
	 M17k2BtSi2q1bE05Rz0J1Jz/EegIt9i3lDN+So0/WUCcscPCLzkbov1ntvQE4p1t5Q
	 9xDppjfLn8O8+U3mnhEqpP8iuzlWq1JRJglfzl++KJn6SbvwtnN7XZV2SoV0AF8402
	 YeC6tmZV6AOiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80CE4615DD;
	Fri, 15 May 2026 13:30:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E17042B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A008741A69
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZZRDgpMOY7S for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3CB41A8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E3CB41A8A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B257986354; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:45:29 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 5751317898d3130b79929579994ea8ed64cdfd8e
X-Git-Newrev: 49091c120f01b706ba9e25bc856a679e9198e811
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.B257986354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libcurl: security
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49091c120f01b706ba9e25bc856a679e9198e811
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index 3d00a4a33a..94d7ec677c 100644
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
