Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FA6D3B7E7
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C55582249;
	Sun,  7 Dec 2025 17:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TchUyXvlfjJa; Sun,  7 Dec 2025 17:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4DA48224A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127625;
	bh=ATWoDUFmSWJoXBx9kzKlSXj0wbqbCNdl+TGlKgx9ri4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MIWp8iILezDeX+9W2jOWYXE0wHJkUWxZzEnW5tKjl6tazM8k9JOAUgIAHy/bYYPV4
	 mnzAOTGLOhvboUyK5sIWKNFJ13wl9VU9PwMsQ0V8D7PY8slNKKLD3TLisGZD9+aREp
	 tXqzyXRlrYAKsfwVn0Fn1Qm0bZsixaj18K0N7KmKfWfpFDLuBvT8LPSyBPwFC5y4In
	 phYUNORO47aHvjznVGfXOeMK4NUKy+sHj/DBWRVo9DF2cTJNaHjCOFz5UKBW3Ib60b
	 7hNw7knIhGt9J/v92Y/6Ale0UmOpnD86b9/Aft3uesqngPYjJLFsMFnCTJMDfp5w9I
	 RCAjePqyzxq4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4DA48224A;
	Sun,  7 Dec 2025 17:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D82F8E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF64240449
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4r_u8PSDwBR for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B064047C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0B064047C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D262E867FA; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:10:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2b5cdf5a3b84612de3e51b210fd31c5152b057f
X-Git-Newrev: 9c12266739c52b0754ad1e185307273faa851b0d
X-Patchwork-Hint: ignore
Message-Id: <20251207171336.D262E867FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosh: update SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c12266739c52b0754ad1e185307273faa851b0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old URL returns 404, update SITE according to https://mosh.org/

Fixes:
https://autobuild.buildroot.net/results/c1c/c1cf4568c82deb118aad0171bda356c7f59f17dd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosh/mosh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index 3c41a17401..bc1f382a9f 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MOSH_VERSION = 1.4.0
-MOSH_SITE = https://mosh.org
+MOSH_SITE = https://github.com/mobile-shell/mosh/releases/download/mosh-$(MOSH_VERSION)
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
