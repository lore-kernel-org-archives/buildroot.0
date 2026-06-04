Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E16CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15C7781EF8;
	Fri,  5 Jun 2026 12:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNtNUoq2qQa1; Fri,  5 Jun 2026 12:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 321CE81E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663071;
	bh=8YPnQHRFWWaLnyIc1bA0O0mddAio2lRTOJvus6Tqd4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sDzfqz/1P1K1oh3Zck1mTzZlKjJwcKrYZdEfaupob139HRmIVNW6wS1HPtf0XfBeP
	 q42zxib3MaSUYSM7aFEen2+oHG6sInBIzOmfx3puAF3VPCemYZF5037a5rIRDSb3R1
	 43H7YLe2+3mZ7rTBP2EmMPvKhztduleaqEDB1XIcAfH/A0rg4hV1fiUSOK/pkEgg85
	 7jF8mniR2CSV4nNfbpYJKcOa4wk3UTQ0818nryqgAke/bhP4ALz4dQmz76ME1R0vZh
	 fqpW+4kE37lY06ZzyfiZ1PYC0IBakvbkSmu55I8sNCB+YUPVnD+DuVQ+jsP4nAhLcq
	 hgXQJvq1cZgZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 321CE81E98;
	Fri,  5 Jun 2026 12:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10253F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 287D881E56
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dxp7dkIz_unh for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 074DE81E5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 074DE81E5B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31CD287B41; Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:04:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4835cac7891c96524c7d21434c14c1995f98d360
X-Git-Newrev: 1021ab9746515faca649143a5e5a0139f4ace28a
X-Patchwork-Hint: ignore
Message-Id: <20260605123711.31CD287B41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/cve-check: remove 'bom-ref' for vulnerabilities
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1021ab9746515faca649143a5e5a0139f4ace28a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The 'bom-ref' are optional and since we don't reference the
vulnerabilities from anywhere else in the SBOM they are not necessary in
this case.

In the following commit, cve-check will potentially emit multiple
vulnerabilities that have the same id. So using the vulnerability id
as 'bom-ref' won't be correct as the 'bom-ref' needs to be unique
unlike the id property.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit af55c1a39b34a4359edf9cc6f65244ff6a0738ee)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index 0d0ad833a2..4d01fa5f23 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -147,7 +147,6 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
     [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities
     """
     vulnerability = {
-        "bom-ref": nvd_cve["id"],
         "id": nvd_cve["id"],
         "description": cve_api_get_lang_from_list(nvd_cve.get("descriptions", [])) or "",
         "source": {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
