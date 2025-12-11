Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E02D41C2F
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 12:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7630E61C8C;
	Thu, 11 Dec 2025 12:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFQGnQyR0bgW; Thu, 11 Dec 2025 12:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D5E861C75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765456894;
	bh=S34kVPnw+Z/Au2jUpZ2aNfYU5jjoYBSAnLhYYJKlvmI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=afUXT3KEqQU3i6D00rf0dru2640fg2gLcrq8iWOtrzh3WJT1Ep2BHDY0TourlORzB
	 044E/hLKrGLdOVC5CtErgzKTFxOcVoh6H1llxclpvk47jn0/5UcOt5+RwMZZsNQqba
	 azOXOl/NCAAalvJZ1O/kbewbQ0b2zPu5VpFJ6ldfvK6T6FXAJc22X5zu+Ql7BnPSmf
	 OE7Jk2uMIHDmWsq2sB88ZYorvDTayLow3w9+Umjn8LPy9cqLz9AFKQs//i0k0y7xpO
	 nUp24kpdpv5en9wX8XZKySKGWLjxkSGzWi4G0deJgVDiOk1+fHMsX3l6fVKjoK0G54
	 lYBIQSh3mCHtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D5E861C75;
	Thu, 11 Dec 2025 12:41:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4ECE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61C1184F59
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Mk9WbQP3gaK for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 12:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD4184EF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAD4184EF7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B966186A6A; Thu, 11 Dec 2025 12:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 09:29:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d655b6e4f1acda1e76f9c7deb5e0bdfd888d62cb
X-Git-Newrev: e1edb6c9a86251f5adc103a4446fb279af789b79
X-Patchwork-Hint: ignore
Message-Id: <20251211124130.B966186A6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1edb6c9a86251f5adc103a4446fb279af789b79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/CHANGES b/CHANGES
index 65fc88d475..7b06752252 100644
--- a/CHANGES
+++ b/CHANGES
@@ -633,6 +633,36 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.9, released December 11, 2025
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
+	Updated / fixed packages: 18xx-ti-utils, asterisk, gnutls, libpng,
+	libroxml, libteam, linux-headers, luksmeta, mariadb, nbd, neard,
+	openjdk, openjdk-bin, openvpn, oprofile, perl-net-ssleay, postgresql,
+	python-django, python-starlette, redis, sdbusplus, sdl, swipl,
+	tailscale, thermald, tmux, tor
+
+	Removed packages: bctoolbox, belle-sip, belr, linphone, mediastreamer,
+	mongrel2, ortp
+
 2025.02.8, released November 20, 2025
 
     Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
