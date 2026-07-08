Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA09C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2806C40B64;
	Fri, 10 Jul 2026 13:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0La4DF2FNwiC; Fri, 10 Jul 2026 13:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 196BD40532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691121;
	bh=ABskrVVrIy5otZvLg2iObpkFgTvVVLxWJCtVqxRR2Rw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NE2tCjd7nzhvu4yR8M7oGBXURs9K69TI9Dwjn9RZFVibjjzNVpmLMqgnU0vQUEvC9
	 DbYEUZcJYRl0a9d3qmEPD6ZWsXmcXHSNlgiif/CBmHtjKg6IP/FDwOgFlFyXSDD6cF
	 zy7XvHH9OEQSi5n8LA3nv9P5op+4ZFbz9YA17NkijZeLuR79V8pvU/j93voSpicSHu
	 kDJKTulc1IDTjuq2iH4N8XJHRZD0GcsRGtt/nN+vqzzQqKz58l0D/Hs/nNipr3UmOC
	 3FmaKBBkfeJAkyBkHZvbg7ZbvVY0qQ4n4Ng4u1DN+7MigqERIx7KpSrHP05FrsRJ2J
	 tLGIJ3XUPgxnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 196BD40532;
	Fri, 10 Jul 2026 13:45:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 135F1FD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC47140AD7
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3WWiLO3cpGa for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57DAA40768
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57DAA40768
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C42D8867A; Fri, 10 Jul 2026 13:44:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:54:50 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 57216f1a906e7748575835a3f6b21dda27e47872
X-Git-Newrev: 0f22ac88aca3e0d3792256519dd946d5b819dd40
X-Patchwork-Hint: ignore
Message-Id: <20260710134419.7C42D8867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libevent:
 security bump version to 2.1.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f22ac88aca3e0d3792256519dd946d5b819dd40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable

https://seclists.org/oss-sec/2026/q3/7
"[None of the GHSA's list CVE id's at this time.  -alan-]"

Switched to sha256 tarball hash provided by Github, drop sha1 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e224289c147f316704c3672899f9964c5f1cdd9c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
