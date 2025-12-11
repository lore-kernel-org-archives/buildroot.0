Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D474D41C02
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 08:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1042340F3B;
	Thu, 11 Dec 2025 08:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHCYo6VAbwsS; Thu, 11 Dec 2025 08:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF9F40BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765441685;
	bh=Pz70vANat3eVNdmT0iiB7ZBOh2mxCpjR1JJ+dlBLhaI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EPS6vVOHXZnm5itWXtaBhpduOYq6Sc5Y5jaWX89d7XZUnIKrTVXonhcS1IkRfN6vh
	 +hGlkcMBH5AIc6oewCgextGL0McQFx4JTzpBARvQinKEU9gUtC4bt0MYJQqE96yQcd
	 kPICtNAifxCNx+d4AOrM6qWVRnyH6+wx52N1HgD5lCTMpaTXJkvy9bOGdiuW3+VxUN
	 G/0QbNeKLKwAXEURaWwKAHr+QUQ3SK3ILSqkOqbjFW57Mc9Ho3HL0GpfI15YChcxrK
	 I5557Ff6RVJFCF+dfRdhfD6UXt6Ef1SMFjWbymhP9T4zHln4G405x4K29gaOnw1KX0
	 fWLMlDISPh+2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CF9F40BE5;
	Thu, 11 Dec 2025 08:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF3A42C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1A7D40BE5
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwcfhi2a1kDl for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 08:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1364640BE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1364640BE3
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:28:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A614868B2; Thu, 11 Dec 2025 08:28:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 09:12:37 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 81fd6056f10f94012e0b234ee04da22b6355b2b5
X-Git-Newrev: 15e090190926b0288f2ae4dbcb08c7093961cc3b
X-Patchwork-Hint: ignore
Message-Id: <20251211082803.0A614868B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] CHANGES: update for
 2025.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=15e090190926b0288f2ae4dbcb08c7093961cc3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/CHANGES b/CHANGES
index cd6600af72..238e852e88 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,33 @@
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
