Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E2CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAA2441F24;
	Fri, 29 May 2026 15:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPptxP80wBOx; Fri, 29 May 2026 15:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07B0841F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780069112;
	bh=REuqGsg5zPXhhA+CoT7LM1P+BRXAX/fO4DNWKAQwHSQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jCOmcUheY1qDz8E5jd8gPgBhKiPOUdIhGRY1t8lVmFXmqJ59NTiMSBMKthObukJIN
	 KRdivAv8PlUOtUWUquZ3elBIOx2qT5vuWBXGox5gfjPTZwavulUsFKakEapFMiUiqJ
	 59VREdBMGXaC0yVdhF9NjhUIgNf5THA3DbbXPZ/kqrbbzPstEsevOcz+FRueMFnqo1
	 th4HDWCntlibkjbxOPOhfq9yVfDkWf85mhYywY+9zxS2lykrEIYRQ4XS9W/DNjHBTT
	 P0rF2PDWxahWLGXgNFov947Vbe+23MDzOVfMTyrdv6YbKe2F9iM+5tyXIeDEbkQFmk
	 rTd4xEYefmquw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B0841F5C;
	Fri, 29 May 2026 15:38:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03C9FD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D871061306
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsJenN5P4Oq3 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37B0F61323
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37B0F61323
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 941B7873ED; Fri, 29 May 2026 15:38:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 17:36:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 646356162b321df8bf20f622c98e0b8495ed86fe
X-Git-Newrev: af55c1a39b34a4359edf9cc6f65244ff6a0738ee
X-Patchwork-Hint: ignore
Message-Id: <20260529153817.941B7873ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve-check: remove
 'bom-ref' for vulnerabilities
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af55c1a39b34a4359edf9cc6f65244ff6a0738ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 'bom-ref' are optional and since we don't reference the
vulnerabilities from anywhere else in the SBOM they are not necessary in
this case.

In the following commit, cve-check will potentially emit multiple
vulnerabilities that have the same id. So using the vulnerability id
as 'bom-ref' won't be correct as the 'bom-ref' needs to be unique
unlike the id property.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
