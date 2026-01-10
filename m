Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554ACD25022
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 20:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3007B812FE;
	Sat, 10 Jan 2026 20:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Vy7r1-vrEP2; Sat, 10 Jan 2026 20:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A16D8127C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768078368;
	bh=CSao/sTzfUpOgoVQxeDV2vGGZE5jdfixCSfxE9OGLkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qYYjzBehSWdA5GJ3SYNuX/I1JHQmB2i+HT2y154OzBQd69YYjGmZq5YtEcqx5zwax
	 0SeWXHuNs5Svyc5HGvvnVhfyUW68CPdeBGzsl8cCtQxkGFc1IycwP3Wx/DdUjriUcE
	 TltQ5nAQAJC4EwtRy+XNgDrkpQWIDp/c/3D3Snb74SPg3KNqEyHMKHpDYz0EoFoVky
	 o6HQkCm3GPRRjjUfLLtnNXoKa+u2Duvu3rshIKgTGrsH+/rFUxyJtGWZVtu/RirRP8
	 Y1/4lDSWyqFJuz7JifSBi71peKjTUTkj/rKYCJ/k+9yKGpPVq1b6o4HeR6EsEeF6EN
	 X8Cj9CoqOfngw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A16D8127C;
	Sat, 10 Jan 2026 20:52:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6B4131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB2A68127C
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 20:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JA3h4682ZMqQ for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 20:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E563B8103B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E563B8103B
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 20:52:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D994D884E8; Sat, 10 Jan 2026 20:52:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 21:31:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f82f5fe177b7f884d424c7ce22aff670ed13f359
X-Git-Newrev: 39aaf317d5f6f511faa3459ca54e021f72b5d0f2
X-Patchwork-Hint: ignore
Message-Id: <20260110205245.D994D884E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: security bump to version
 8.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=39aaf317d5f6f511faa3459ca54e021f72b5d0f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://curl.se/ch/8.18.0.html

Fixes CVE-2025-13034, CVE-2025-14017, CVE-2025-14524, CVE-2025-14819,
CVE-2025-15079 & CVE-2025-15224: https://curl.se/docs/vuln-8.17.0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 786d030171..de3f2402e9 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.17.0.tar.xz.asc
+# https://curl.se/download/curl-8.18.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  955f6e729ad6b3566260e8fef68620e76ba3c31acf0a18524416a185acf77992  curl-8.17.0.tar.xz
+sha256  40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd13100e2c9a91946  curl-8.18.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6924631735..e1e5a7facb 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.17.0
+LIBCURL_VERSION = 8.18.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
