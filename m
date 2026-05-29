Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52D5CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C3C841ED;
	Fri, 29 May 2026 13:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YkPjv53S_au; Fri, 29 May 2026 13:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE2228422B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780063067;
	bh=gn4WAgbwmQmCk7PYdI1vobhcQY6Nh+0bFrljWWo+zUI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JDsVLqotss9LlAQMZP13Csv7HoI7fi4H05lERkowQx0leuqqhoLCH9Cf5589XUz8J
	 JIKTadcQMWYdan5k1PmwZwrcxo7i2Hpz1VaW6PvSuA9LVQ4x3QtOvePZxHe8NIv6zP
	 vnmpgwm302agrtiQh+GtqtGnUfRiq/ujN6b7ucM08yCL1tVXhbffzjow/IE+Zrt0Ad
	 y3nG3mlRlZf6Dso3CLvA3iFoecR9z/N0a/cPSbpcIMvXzdtK/BAGdA3WoGz5Dc170R
	 vO4JZZBdFuXZ3oLmOGZu4CRFL/xax0jxbug2W2mwHixYNQm0De8bU85UQ/SPvIE5Fj
	 GYu7KehhbYZ/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE2228422B;
	Fri, 29 May 2026 13:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC24CF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D4AE41FC8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30_WF8P67L7f for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA3E641FC0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA3E641FC0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4605E873DD; Fri, 29 May 2026 13:57:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:45:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31c1147bfdf5be700c1764056a1669b0992f16b5
X-Git-Newrev: 81e24e90bb98f7e3768ebd9e69808921bd0f2e2a
X-Patchwork-Hint: ignore
Message-Id: <20260529135733.4605E873DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: bump to version 1.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81e24e90bb98f7e3768ebd9e69808921bd0f2e2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Also fix the current build error with 1.11, because sway 1.11 cannot be
build with wlroots 0.20.0.

Changelog:
https://github.com/swaywm/sway/releases/tag/1.12
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sway/sway.hash | 5 +++--
 package/sway/sway.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sway/sway.hash b/package/sway/sway.hash
index 46f2bee753..2b8a8ee990 100644
--- a/package/sway/sway.hash
+++ b/package/sway/sway.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://github.com/swaywm/sway/releases/download/1.11/sway-1.11.tar.gz.sig
+# https://github.com/swaywm/sway/releases/download/1.12/sway-1.12.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  0e37a55b7c3379230e97e1ad982542b75016a0c7d6676198604e557f9b373dae  sway-1.11.tar.gz
+# Unfortunately, the keys expired on 2025-04-03.
+sha256  a7b1becc217433c11c6284d36bcea0687b87b77b0ed26a384565292ec321f2b1  sway-1.12.tar.gz
 sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index a497a2cbe7..56d18ef6f9 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAY_VERSION = 1.11
+SWAY_VERSION = 1.12
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
