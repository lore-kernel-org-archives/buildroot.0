Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B15DC5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C85740BD8;
	Wed,  4 Jun 2025 18:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vV9yPMZyjTQU; Wed,  4 Jun 2025 18:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A63407BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98A63407BD;
	Wed,  4 Jun 2025 18:28:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1425C1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9668440086
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppAr8u9Clrlv for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E28964007B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E28964007B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D48E6876DC; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:25:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f2f16ca63c72a25f19070682beb8ddf3b93e7663
X-Git-Newrev: 78f544b69d49abb179be427b7a792f4ea19f89ac
X-Patchwork-Hint: ignore
Message-Id: <20250604182757.D48E6876DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libopenh264: drop
 stale ignore CVE entry
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
Content-Type: multipart/mixed; boundary="===============5228184427761896963=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5228184427761896963==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=78f544b69d49abb179be427b7a792f4ea19f89ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The NVD entry for CVE-2025-27091 was not correct, but thanks to having
been reported by Raphaël Mélotte, the issue has been fixed on May 6,
2025:

  https://nvd.nist.gov/vuln/detail/CVE-2025-27091#VulnChangeHistorySection

The ignore CVE entry is therefore stale and can be dropped.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 38abba37037e3336271b4e0ee069fbb72eba6164)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libopenh264/libopenh264.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 9ae996fee1..f9a50e4c61 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -12,9 +12,6 @@ LIBOPENH264_CPE_ID_VENDOR = cisco
 LIBOPENH264_CPE_ID_PRODUCT = openh264
 LIBOPENH264_INSTALL_STAGING = YES
 
-# The following CVE is fixed in 2.5.1, the NVD CPE is not up to date
-LIBOPENH264_IGNORE_CVES += CVE-2025-27091
-
 ifeq ($(BR2_aarch64),y)
 LIBOPENH264_ARCH = aarch64
 else ifeq ($(BR2_arm)$(BR2_armeb),y)

--===============5228184427761896963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5228184427761896963==--
