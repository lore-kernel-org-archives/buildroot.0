Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C3BC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED85480F7E;
	Sat,  8 Jun 2024 19:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81NEZ5OBzllp; Sat,  8 Jun 2024 19:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C164D84C24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C164D84C24;
	Sat,  8 Jun 2024 19:16:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68A671BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F6DC403B8
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEP_Q5fPhI8L for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5C83403D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5C83403D6
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9E7387C6F; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:09:06 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4b0050f7507693a1bc4e183528c42a19b417e3a5
X-Git-Newrev: d88d2ccd3adf638816677b7dd641da70422c8faa
X-Patchwork-Hint: ignore
Message-Id: <20240608191501.B9E7387C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ulogd: use https
 for _SITE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=d88d2ccd3adf638816677b7dd641da70422c8faa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

http redirects to https, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0ec558208ef7d799ec0db9b02fb64029e74754e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ulogd/Config.in | 2 +-
 package/ulogd/ulogd.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
index e0e199961a..6631076ae7 100644
--- a/package/ulogd/Config.in
+++ b/package/ulogd/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_ULOGD
 	  ulogd is a userspace logging daemon for netfilter/iptables
 	  related logging.
 
-	  http://www.netfilter.org/projects/ulogd/
+	  https://www.netfilter.org/projects/ulogd/
 
 comment "ulogd needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 2ebf076d9a..8ef8ec5701 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -6,7 +6,7 @@
 
 ULOGD_VERSION = 2.0.8
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
-ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
+ULOGD_SITE = https://www.netfilter.org/projects/ulogd/files
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
