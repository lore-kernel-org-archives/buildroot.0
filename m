Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F81DD111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 567FD41497;
	Thu, 27 Nov 2025 20:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IwP3zdHhu1G; Thu, 27 Nov 2025 20:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 962294149F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 962294149F;
	Thu, 27 Nov 2025 20:08:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D694708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5F7184426
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTm5p3DCOMVZ for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 246C984430
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 246C984430
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 223A8848DA; Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:44:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ef962fc4f6107694dc1d60074e6b01799c4dd8d4
X-Git-Newrev: ac0a735d99ddc9f595bc46d763677f6627a5c510
X-Patchwork-Hint: ignore
Message-Id: <20251127200757.223A8848DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] docs/manual: add
 information on CycloneDX
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac0a735d99ddc9f595bc46d763677f6627a5c510
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This patch adds information on how to generate a CycloneDX SBOM in
Buildroot. It also mentions how to track CVEs with that given SBOM.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Peter: reword slightly]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e09bf9e9511c28f5d35e3a5ae7a09f1aec57874d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/manual/common-usage.adoc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
index 43caa3a9bc..7437a7c3c0 100644
--- a/docs/manual/common-usage.adoc
+++ b/docs/manual/common-usage.adoc
@@ -180,6 +180,34 @@ a newer upstream version for those packages.
 make pkg-stats
 ----
 
+=== Generating CycloneDX SBOM
+
+Based on the output of +show-info+ Buildroot can generate a SBOM in
+the CycloneDX format. While it doesn't offer any additional
+information, CycloneDX is a format specification that can be consumed
+by other projects.
+
+----
+make show-info | utils/generate-cyclonedx
+----
+
+For more information check the help of the +generate-cyclonedx+ script, the
+script call can be tailored to your project.
+
+----
+utils/generate-cyclonedx --help
+----
+
+Similarly to +pkg-stats+, CycloneDX SBOM's can be enriched with vulnerability
+analysis from the NVD database.
+
+----
+make show | utils/generate-cyclonedx > sbom.cdx.json
+cat sbom.cdx.json | support/scripts/cve-check --nvd-path dl/buildroot-nvd/
+----
+
+For more information about CycloneDX see https://cyclonedx.org/[].
+
 === Graphing the dependencies between packages
 
 [[graph-depends]]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
