Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C33BD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E78A34087A;
	Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bj3kU553276N; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54D0840896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808004;
	bh=WNJdoeIjQdqmwlMC1ykX8nkLwEC1U1eE/sZg8kPvO44=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J1hxlqsXT5FxVlhBGRZQYpcJi/0+dxT20VIayfFyYVI3Tx2HkramHGNbGTRyKZK09
	 twkYsfew8FzF6TyWkv99h6OteDDniaDxnKLOWkiQ1crEkY/MG5tUiXQhbxewBQ3Tye
	 aJT26i1WqTArQ5uyX33v6b4Ov0EGPxyjHIlQop0PuirKyw+mIyHyn5FUgPa6GUYSA6
	 f5GfIOFoC0axIiKJOnKjl02yovnAniMBUegjOwxFD7m5D3Pa42fPYsFzuGBenn31so
	 jrPRtRoR9KZapI2rGZrfkewN9QxBznK/cs7XeilmJOHY+Z14NTou2Zn5qSD2bAZh7E
	 Y0ti2evmW4ZDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54D0840896;
	Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54ACEA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47DD140886
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZyQH-t82jKf for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A7FD4085E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A7FD4085E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D17688367; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 10:32:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ccd8a00240c8d8a985c0bd24dff806879aab8caa
X-Git-Newrev: 9e030165a78f99dda2c9585d92e61494d06a2cf0
X-Patchwork-Hint: ignore
Message-Id: <20260107174640.5D17688367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libfcgi: security
 bump to 2.4.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e030165a78f99dda2c9585d92e61494d06a2cf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This is a security bump to fix CVE-2025-23016.

See:
https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.7

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 626bc1f199411df91108565432c496e1fcf0b897)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libfcgi/libfcgi.hash | 2 +-
 package/libfcgi/libfcgi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 348b0b6867..be9e3e8db9 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39af4fb21a6d695a5f0b1c4fa95776d2725f6bc6c77680943a2ab314acd505c1  libfcgi-2.4.6.tar.gz
+sha256  e41ddc3a473b555bdc0cbd80703dcb1f4610c1a7700d3b9d3d0c14a416e1074b  libfcgi-2.4.7.tar.gz
 sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index e0ef6da55c..da84ba6297 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.6
+LIBFCGI_VERSION = 2.4.7
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
