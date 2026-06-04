Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5A3CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27958212C;
	Fri,  5 Jun 2026 12:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yh7ohYAc82XO; Fri,  5 Jun 2026 12:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC76F82138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663203;
	bh=iAn7d0jpLK1JlG/7+AFVcWLodyM1QHatcP4BvrivKKs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O8Vsz8/i2xj+7m90fpX6EtrUwJFBTBUDLV2NtQkakb8+ZkW35zI/bgZcGUf6JMwV9
	 D/FrWA8pDv7p4P7niSW7qTbtBgrfxIOI2kYvEiZ259qdytUHhBhZ4DRsGb8HxIo08o
	 Sd9xvNrs99ak3ODREKU5+1ZUdREl9qsUhABJgypEGeCzT3PaIL6+VTttQYg9amCfgg
	 iDLoVoJKK/k4y2s41/SIX+elxhk8f1Ast2aMUVvl6FMtY/CDqpdPzaGeGFOP6H1CJH
	 sh691LC7ehw+n5+WQT46BXjnUJoqCOL7O4Vq5aAZLztrdSwCOJDhfcfcpjivoG3X+Z
	 0tSWC+pSzkm3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC76F82138;
	Fri,  5 Jun 2026 12:40:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F87EF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D60581FCC
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72svRckQpQFw for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A408481FE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A408481FE3
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD9F887B3B; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:53:34 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4fdde850df5abc654732e575d07987314bff78e9
X-Git-Newrev: ed8b0b51c803d25cbb8045e4dfc69af77f72f5e3
X-Patchwork-Hint: ignore
Message-Id: <20260605123836.CD9F887B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/cups-filter:
 update CPE vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed8b0b51c803d25cbb8045e4dfc69af77f72f5e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The CPE "cpe:2.3:a:openprinting:cups-filters:*:*:*:*:*:*:*:*" is valid
for this package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/OpenPrinting/cups-filters/security/advisories/GHSA-893j-2wr2-wrh9
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-64503

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2c3bc6609b1d08f0953f85f7101da68568d96e1c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cups-filters/cups-filters.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dcfb2e9500..f2b85aa9d5 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -8,7 +8,7 @@ CUPS_FILTERS_VERSION = 1.28.17
 CUPS_FILTERS_SITE = https://github.com/OpenPrinting/cups-filters/releases/download/$(CUPS_FILTERS_VERSION)
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
+CUPS_FILTERS_CPE_ID_VENDOR = openprinting
 
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
