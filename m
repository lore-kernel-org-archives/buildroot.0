Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C2BF483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CA181F93;
	Mon, 23 Mar 2026 19:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUihKcFS0eI6; Mon, 23 Mar 2026 19:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74ACF8214A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295947;
	bh=fCkY8vs58q3vMJLvmn+dgfcVp0cxXSbAcfcuXew69vA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=edJlwnQzXur65s0lKqN9H7EyreldvHeEAQtPyMbpppbIy2q0PeKPHv7zWJi6yL4xT
	 y3iE2e7OpzEEDbNShBvTt2bdwGSpiC13dr4Cu9DV0iufLjTGpOvDfrNQ6eePLeto+h
	 ZM22xuVHmzNw+urN7VjYohr+gJGW0RgTw1vU3a1CHj3gyK47Xp2FwZH0BIRzDiElW2
	 xySOOeLEaU95MAE9+kVOnBk0u0pfOYw8RRsG8gcUruK7JqKpkeb2rzHdgvMekjevTK
	 tSs+H+ktTmzglPtvPJ8s8Xrv/ljH8lTeNHuurdkQQemNa1YMwhEib8ZEcCf/+zDnp9
	 wKA937uKjTLwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74ACF8214A;
	Mon, 23 Mar 2026 19:59:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9013353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE9A54027F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLsxEh40buTO for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD71F40262
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD71F40262
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:59:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2490D8469E; Mon, 23 Mar 2026 19:59:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 20:51:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20c3eb6eb68432c37d5db69963be266b7f2d23f7
X-Git-Newrev: 84ece21e8482c98fc4d21f3a791cb516118bc169
X-Patchwork-Hint: ignore
Message-Id: <20260323195904.2490D8469E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: security bump to 22.8.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84ece21e8482c98fc4d21f3a791cb516118bc169
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for detailed changelog:
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.2.html

Fixes the following CVEs:

CVE-2026-23739 / GHSA-85x7-54wr-vh42:
Asterisk xml.c uses unsafe XML_PARSE_NOENT leading to potential
XXE Injection
https://github.com/asterisk/asterisk/security/advisories/GHSA-85x7-54wr-vh42
https://www.cve.org/CVERecord?id=CVE-2026-23739

CVE-2026-23741 / GHSA-rvch-3jmx-3jf3:
ast_coredumper running as root sources ast_debug_tools.conf from
/etc/asterisk; potentially leading to privilege escalation
https://github.com/asterisk/asterisk/security/advisories/GHSA-rvch-3jmx-3jf3
https://www.cve.org/CVERecord?id=CVE-2026-23741

CVE-2026-23738 / GHSA-v6hp-wh3r-cwxh:
The Asterisk embedded web server's /httpstatus page echos user
supplied values(cookie and query string) without sanitization
https://github.com/asterisk/asterisk/security/advisories/GHSA-v6hp-wh3r-cwxh
https://www.cve.org/CVERecord?id=CVE-2026-23738

CVE-2026-23740 / GHSA-xpc6-x892-v83c:
ast_coredumper runs as root, and writes gdb init file to world
writeable folder; leading to potential privilege escalation
https://github.com/asterisk/asterisk/security/advisories/GHSA-xpc6-x892-v83c
https://www.cve.org/CVERecord?id=CVE-2026-23740

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: add CVE details in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index f1573f6575..3a8274b458 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4f30af0695a0131fc091d85e7b91e22504609434b3fbd263898c7354d41959c9  asterisk-22.8.1.tar.gz
+sha256  6669a8d2e50481a3b70c6099a21a100ab7d7ae9ac00e2182eabb94c68c94bcc9  asterisk-22.8.2.tar.gz
 
 # Locally computed
 sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index b59f2bf5aa..e2fdb189fa 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.8.1
+ASTERISK_VERSION = 22.8.2
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
