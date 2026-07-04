Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A627C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 16:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11EFF80F2F;
	Sat,  4 Jul 2026 16:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ep9MnNia8UbQ; Sat,  4 Jul 2026 16:12:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2967D80F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783181569;
	bh=Vo7f3F6Fg1nCHD+LRSGGwD+eZUEwM8sCRqHW9DwS8a4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pWKmab8KhQK+KLmKTXonKFpnnKkFQR+lnQIuIzcn0F7F1okKthK9FnTgXCS4O/lHF
	 cBHOyRfA5MjKSzbGeqpGNh4tl+pIhjcsgSNkcxGkL7FDZJOWou5N7EUwJ6sSVjG2RV
	 gFGDQdxCim+YZzFCLdZ43y56wjIKCAuN5+mFJ4TaWxzBuuh1DpTlnYe+Lg3GusLMiv
	 zV0fJd8hSy4tNU3dArq2T7U/rhpZWeSwgpKOOYg7VhXVtZXHcG/2h2ZEBh3m0HD/aC
	 wHsPLfx3w4ozxU5B6oY9rKwUAuYyEL7SJgBCa2e49A0CwEPV916S7k1Qc+J1JZqfsm
	 O2D71bUQv6J9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2967D80F32;
	Sat,  4 Jul 2026 16:12:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16553363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0829980F32
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArkaP_DUMQBH for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 16:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF5780F2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF5780F2F
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:12:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ED30883FE; Sat,  4 Jul 2026 16:12:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 18:05:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42d63edf4ca144c5522fbf988fb341b90163d462
X-Git-Newrev: e224289c147f316704c3672899f9964c5f1cdd9c
X-Patchwork-Hint: ignore
Message-Id: <20260704161217.3ED30883FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libevent: security bump version to
 2.1.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e224289c147f316704c3672899f9964c5f1cdd9c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable

https://seclists.org/oss-sec/2026/q3/7
"[None of the GHSA's list CVE id's at this time.  -alan-]"

Switched to sha256 tarball hash provided by Github, drop sha1 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libevent/libevent.hash | 4 ++--
 package/libevent/libevent.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
index 77574e784b..e047031f48 100644
--- a/package/libevent/libevent.hash
+++ b/package/libevent/libevent.hash
@@ -1,4 +1,4 @@
+# From https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable
+sha256  f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c  libevent-2.1.13-stable.tar.gz
 # locally computed
-sha1  cd55656a9b5bed630b08f05495230affb7996b21  libevent-2.1.12-stable.tar.gz
-sha256  92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb  libevent-2.1.12-stable.tar.gz
 sha256  ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670  LICENSE
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 355dfedcc1..cc8fb21915 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.1.12
+LIBEVENT_VERSION = 2.1.13
 LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
