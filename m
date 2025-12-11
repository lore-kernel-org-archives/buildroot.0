Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8EBD3E79C
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 08:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE8140EFB;
	Thu, 11 Dec 2025 08:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqlopcklvRaS; Thu, 11 Dec 2025 08:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF1840E51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765441754;
	bh=ItZzeMiO9D0uqCsM9NR1kuL8v/GdhAuaXgpBI8GH63E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ijUFxu7aRD2Cvb9QiFC3DoW0422D6xdQc/g4HFJ5Y7iIP0vlKAVDaoYjCvvay8Urg
	 yhmrEiU2X8pE3hFN9jz4B42kES1o0jYKeQECP0ulZVHKoRoxnF2mB6bdqVaoPGwNgA
	 yGVBEdi9xf/RBuFS8Pl5P838ICBShIlCNf5ysbEdTERk/KekjDtzfEo0bdqsotmgaw
	 Zi60PX4jqVdDk6v5sXMScB9FNdQyDBr9wJedMvFjav8ZsTHjyapuJIpgg7M4VR93m3
	 e/H5f16GSlK5Lj4Sq/1ERTkIL+0xV3C3XV8OH+apLBMAr5Qth73h7gD4ixEt5264IY
	 Hxd9wth+H/pDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF1840E51;
	Thu, 11 Dec 2025 08:29:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC41F2E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDE6D40BE5
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRa6jctL2mKS for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 08:29:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F397740BE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F397740BE3
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:29:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E521586999; Thu, 11 Dec 2025 08:29:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 09:18:56 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 3e19283d9bb285c780d512c08610a1dbdb978a99
X-Git-Newrev: b338a0ca2f78ec5b14ba737d86e2e3ea81bd9360
X-Patchwork-Hint: ignore
Message-Id: <20251211082910.E521586999@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] CHANGES: update for
 2025.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b338a0ca2f78ec5b14ba737d86e2e3ea81bd9360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/CHANGES b/CHANGES
index ba03a83d04..e092639c71 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
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
