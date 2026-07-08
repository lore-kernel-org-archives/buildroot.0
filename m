Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5A9C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD656069C;
	Fri, 10 Jul 2026 13:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ye-dsKnKkKLA; Fri, 10 Jul 2026 13:43:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0269360721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691000;
	bh=i+37b5/UFLzgiSZw1ei/w/N0dkxjeXBnKYuY/rsGC1o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=riC2sFlMJ4VWBf3AwJ3w98eufdjlGQ7+La4xkMrJYzvnC/v1Q6cv9COkta9nLEjWB
	 n0WH5l9X15inb0DkbdX+FgDyNtLXYEyZn84aLiqpanL76bdhetOFVnDlsVFFBRwZ2u
	 eeYL2VLVz1KCR0Rii63jMXY0gKeUG4xx+g0ROCkWjlb/fGa5r/uFgiH6aOsF4nBsSz
	 C1ID7iT0tz8U4EJ93i3ibWG+N7CjJWlndS6a2gtM1/rvgF5ka4JqI/JvWE+NW3jXTk
	 1CPSxFS1r2obC48Lkxh27Q+rObr5BlyjTsptg+HkBY9+6XKaw5je40rE0vFNxGtfuB
	 GlLHVoH3pQVyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0269360721;
	Fri, 10 Jul 2026 13:43:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F298E2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0BF9810B3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqmcZOfi329K for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B3D9810BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B3D9810BA
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0F8E8866C; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:54:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0dfac4dd3fda47baf4f60a0e570b27526dea9e59
X-Git-Newrev: 596b580f049d823e1090bd43c7d9a2d45e855392
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.C0F8E8866C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libevent:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/596b580f049d823e1090bd43c7d9a2d45e855392
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
