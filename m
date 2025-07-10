Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02421C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C716E83F03;
	Fri, 11 Jul 2025 10:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6X0De_TEFibU; Fri, 11 Jul 2025 10:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70FBD83F10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70FBD83F10;
	Fri, 11 Jul 2025 10:21:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C6A61E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0585E40C49
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjDraxQVRe88 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C7FE40DB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C7FE40DB3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A93486353; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:38:41 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 52e5a733f89811e043ae1a3afb4c778a1cae2d1b
X-Git-Newrev: 73b95a01163bc33fb2ed66a4728bef3981d42da4
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.3A93486353@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/sox: ignore
 CVE-2023-34432
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

commit: https://git.buildroot.net/buildroot/commit/?id=73b95a01163bc33fb2ed66a4728bef3981d42da4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Commit [1] introduced a patch addressing CVE-2021-23159. Since then,
CVE-2023-34432 ([2]) remained the only unresolved CVE reported
against the sox package in pkg-stat.  This patch adds CVE-2023-34432
to the list of ignored CVEs for sox, based on the report from the
Debian Security Tracker ([3]) and the sox issue tracker ([4]), both
indicate that the patch introduced in [1] also resolves this CVE.

[1] 14aa0f5ec1 package/sox: add fix for CVE-2021-23159, CVE-2021-23172, CVE-2023-34318
[2] https://nvd.nist.gov/vuln/detail/CVE-2023-34432
[3] https://security-tracker.debian.org/tracker/CVE-2023-34432
[4] https://sourceforge.net/p/sox/bugs/367/

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
[Julien: change commit ref [1] to use commit id from master branch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e868b974a799073428b7565925507697e049df0a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sox/sox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 3c9c939e8c..9fd3f2151c 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -67,7 +67,7 @@ SOX_IGNORE_CVES += CVE-2021-3643 CVE-2021-23210
 # 0007-hcom-validate-dictsize.patch
 # This entry is NOT stale, those CVEs are not reported by pkg-stats
 # due to the change of CPE ID to sox_project:sox in the NVD database
-SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318
+SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318 CVE-2023-34432
 
 # 0008-phere-avoid-integer-underflow.patch
 # This entry is NOT stale, those CVEs are not reported by pkg-stats
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
