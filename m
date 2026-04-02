Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909A2E7E369
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6693B81DE5;
	Fri,  3 Apr 2026 10:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7K6NB6jlBsJ; Fri,  3 Apr 2026 10:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7946381E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212120;
	bh=SzSOX2mvuaHMOYL1BKnsAzC6Jgqn8KJd7NWQephqQV4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d/tQvN3i8RkZ8X6OQ3YUiLv4lLMrIBbig/GLgSzCA1uoH253Xcf3Nw2123LCO8sSf
	 dls0t+eoZzMxNuYcBaaQyOoPeHPJsRaVPBis3mpOpE0BalyTKCSRhjB1bQ2VONZeLf
	 Ofq1Zn+FWiUZd0AdmmZ7ul1EGJtk/ubdqPjKuzJlmLJuRRNthwsdVP1dnVEVqzAu9c
	 2JxEClXJTkE0U60F65x8jMiXVFU7W0Slt5mMdsoNz4EmHT5/RfQVg5lYErNs/Kxnh6
	 AVFJT0jb9vM7mgkoR3U8snrQC4qy38CZlkrPJCnLQt2lLth1BidovG5TgQFZ34H96c
	 yPBZC9W36NiWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7946381E4E;
	Fri,  3 Apr 2026 10:28:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B156E2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF65140E82
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXCWI-3WBmii for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD11540E60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD11540E60
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 596F47FFAA; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Apr 2026 15:28:16 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 731cc7e2a3c07b8b2bcd56d82f36fae9163a5b74
X-Git-Newrev: 03ef4770e4131b77b4fa5c286805972aa670f4d5
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.596F47FFAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/asterisk:
 security bump to 22.8.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03ef4770e4131b77b4fa5c286805972aa670f4d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 84ece21e8482c98fc4d21f3a791cb516118bc169)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
