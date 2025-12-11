Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F64D41C2E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 12:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA7640F82;
	Thu, 11 Dec 2025 12:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zYg8mOSjsPI; Thu, 11 Dec 2025 12:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81AAC40ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765456893;
	bh=A9KKnf4c0rcRxgOsWvwzyXHwn/E/gMpI5V/aPIDSOvU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WEfpAZLB79WZwNFvkDfHcsZY6ZusaXF/uT2VRlvo0ZMf/1yBY/mqDYKHkqslen/91
	 dfsv79PFbt+F9TCioKFzmbYbfTd55ejNRYffsXN+ewht5Cd3pBJqBPkxpnrJS1c8p8
	 0Yog42DwsGE26crAwEweUHllY/Qzoj4RQCieaddBAtalxT56Mc+M9Y9esvI+inR+hl
	 mn5t1pXyP8LhEFjUadzk3CvTFLHudKVAWdCceO0IxFafW/xCaYyp35pE648DBRO/Hw
	 90q5vXo65lUOEakdhGPBg6Lm5Oe39htzvC63fQv43TmBx+pzQRS/hQWid+0BrLkdjY
	 LKz7ULejCm0uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81AAC40ED2;
	Thu, 11 Dec 2025 12:41:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D490B2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB17F40515
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1k4oqfXAeGrM for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 12:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D706B4030D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D706B4030D
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C83D886A7E; Thu, 11 Dec 2025 12:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 09:30:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1edb6c9a86251f5adc103a4446fb279af789b79
X-Git-Newrev: a09176f8a9919c5b1222be6de16f1c01ccbb6bdd
X-Patchwork-Hint: ignore
Message-Id: <20251211124130.C83D886A7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.08.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a09176f8a9919c5b1222be6de16f1c01ccbb6bdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit b338a0ca2f78ec5b14ba737d86e2e3ea81bd9360)
---
 CHANGES | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/CHANGES b/CHANGES
index 7b06752252..6b3dc3c21c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -53,6 +53,37 @@
 	linphone, logsurfer, mediastreamer, metacity, mongrel2, ola,
 	ortp, procrank_linux, ramspeed, sylpheed
 
+2025.08.3, released December 11, 2025
+
+	Important / security related fixes:
+
+	- asterisk: CVE-2025-1131, CVE-2025-57767, CVE-2025-49832,
+	            CVE-2025-47780, CVE-2025-47779
+	- gnutls: CVE-2025-9820
+	- libpng: CVE-2025-64505, CVE-2025-64506, CVE-2025-64720, CVE-2025-65018
+	- luksmeta: CVE-2025-11568
+	- mariadb: CVE-2025-30693, CVE-2025-30722, CVE-2023-52969,
+	           CVE-2023-52970, CVE-2023-52971
+	- openvpn: CVE-2025-13086
+	- postgresql: CVE-2025-12817, CVE-2025-12818
+	- python-django: CVE-2025-64458, CVE-2025-64459
+	- python-startlette: GHSA-7f5h-v6xp-fcq8
+
+	Infrastructure updates/fixes:
+
+	- New script support/scripts/cve-check to enricht CycloneDX SBoM with
+	  CVE information from NVD database.
+
+	Updated / fixed packages: 18xx-ti-utils, asterisk, enscript, gnutls,
+	libpng, libroxml, libteam, linux-headers, luksmeta, mariadb, nbd, neard,
+	nss-pam-ldapd, open-plc-utils, openjdk, openjdk-bin, openvpn, oprofile,
+	pdmenu, perl-net-ssleay, postgresql, python-django, python-starlette,
+	redis, sane-bacends, sbc, sdbusplus, sdl, swipl, tailscale, thermald,
+	tmux, tor
+
+	Removed packages: bctoolbox, belle-sip, belr, linphone, mediastreamer,
+	mongrel2, ortp
+
 2025.08.2, released November 20, 2025
 
     Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
