Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE9FCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7EB360A97;
	Fri,  5 Jun 2026 12:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhaydLGMX3cD; Fri,  5 Jun 2026 12:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D07F960D97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663176;
	bh=7At7AVaOSRrw4vn43zYXsc+U0byB0r0UwX4TuwlNEyo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MoFn0vQ386QRNLMOCfJTW8Z49wXHS7Mtm1VFEtXXbtKwow1CR7hp/Nk2BoRbBpJYm
	 idQH7q+P9igqNRckMyXQFuHwGj/idiAMJBjQ57rmH+MvTQChoOplk4ZhDzcpznLDSj
	 lafnsK+lYUNGpUDgpvEJB08vkgN85j1EOCNnMsUzuDC7mE/5DhJbRXg9yFvX64k++D
	 pGL1g45SuH8oyEI9qCNDVt/+cadOwoRZBzOcxz6g/OlyM9Bd0/wrjKcFwyUDQZ9lZm
	 IPUASTK31RszWUy4FvZZSYB9twfA7D6QuTnJw+6KDTt0zjb4A4ekppr9SXFfqyYHlp
	 JYnDqUpxnMR8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07F960D97;
	Fri,  5 Jun 2026 12:39:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 115A53B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B31181EB9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ykI9xD5iicP for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0058B81FDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0058B81FDE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 295D087B05; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:04:04 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ed86091d62f5eb96abcc1f237f363f407829ce40
X-Git-Newrev: 5ecf3744f31d0746f7b1de8f16a3ed1d164ec593
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.295D087B05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ecf3744f31d0746f7b1de8f16a3ed1d164ec593
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
