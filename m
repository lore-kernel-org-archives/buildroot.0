Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78F3EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A217142280;
	Fri, 13 Feb 2026 19:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXOGSfgPG0hb; Fri, 13 Feb 2026 19:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC35740AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011606;
	bh=GIeAMtyDAlcLfRF0uVZTMKNtgkv5PHEdlSTT6u+uAms=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U9AQeS+TNKWZqyv66Lep2oY1dkcTfQWdXD6+deYgTer8jyROhcXJqNuqN2s1mHVhT
	 q0JgUn+qzcpbBHn/WpkhCR2hoACDpilf1oWNPHk7goEmnBgVEOqk3mVONDBlyo4AoP
	 /b8I4Rk3iaGqrY7ofaPFtuI8LXJM4sEmI4gYrBVJGuQE3pBpl3dhUGW1QCpd6jQQL0
	 KuZP+bzC+6VHvjdlAqcBzFFHP7M7Lcmvn0dJuVSlzl9hImCFd4miHUDdswO+Pd/A53
	 oe6UvoYBdmwLeTeLYszZuG+5BpXJOsud31g575ZSuTfecVAxIujY4qFe4X4ZGS538l
	 l74ouWumjYZVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC35740AB1;
	Fri, 13 Feb 2026 19:40:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45082283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A77C8412DE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4oF9yrspRNm for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A17E8413ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A17E8413ED
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9627083593; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:41 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 38021502fb30d171b7863decb3063e819f10099c
X-Git-Newrev: 95ba97009cd0b66e5b1b552d8a0980012cea58e4
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.9627083593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/webkitgtk:
 security bump to version 2.50.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95ba97009cd0b66e5b1b552d8a0980012cea58e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

News:
 - https://webkitgtk.org/2025/11/19/webkitgtk2.50.2-released.html
 - https://webkitgtk.org/2025/12/04/webkitgtk2.50.3-released.html
 - https://webkitgtk.org/2025/12/16/webkitgtk2.50.4-released.html

Security advisory:
 - https://webkitgtk.org/security/WSA-2025-0008.html
 - https://webkitgtk.org/security/WSA-2025-0009.html
 - https://webkitgtk.org/security/WSA-2025-0010.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 39d8525edef2662044136462a68ead5f2053b5a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 90304074ac..3c2f7aedbd 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.50.1.tar.xz.sums
-sha1  b599be86497f57fc5b2eb8b5d60ff181fc651752  webkitgtk-2.50.1.tar.xz
-sha256  33e912ee6e3cdb4b9803715f50686af85a60af47f1cf72a6acc6a2db1bb3d9fe  webkitgtk-2.50.1.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.50.4.tar.xz.sums
+sha1  719c304539cecca945846700cefebc7339eb5924  webkitgtk-2.50.4.tar.xz
+sha256  d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5cd141b46125bd8e4  webkitgtk-2.50.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index fecca3529d..d9aa48f024 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.50.1
+WEBKITGTK_VERSION = 2.50.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
