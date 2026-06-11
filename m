Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407FDCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 181994123D;
	Fri, 12 Jun 2026 11:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id od-m_A7WQb6F; Fri, 12 Jun 2026 11:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 349044123F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263475;
	bh=/6VWKr9kMWm7f5f6fvClUq7eOr7oCwfVIBWdpOv/rYk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rjeZEg5Xz1SOPgs9sycV0BshjVs6k/MfoAGFcAlgljwN0Zc4y1iaGMP5lB5ltFk9R
	 81eVY67BEyOZ+o5o6+qVCqJWMO3ELEtNL13DtJhUNtN5cygkDOsikxS5QZtfJPnb7R
	 No6bt3e8k5AYWPyFNJ96TK7GAPNIPDEXKMlZFbwrIMgTICm6m2M3WOx8ufJlrPCBGM
	 joemSXu4IrjkPVBOP22jyZVNsYb63Opy1Fe1L9OEVrUFOWDugrwKD9zwo3T3nEIf5p
	 5J9JPIN/fhqCYeR6AKhPs+5O23CIA9UrT7yhVyLA8E3erUbRpix/vkHdEK4yoxeU8U
	 AvmBij2H8bb5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 349044123F;
	Fri, 12 Jun 2026 11:24:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57452237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC8FB4065E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgoBug_yTUbJ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F031740673
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F031740673
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9ADD880EA; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:40:08 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1eb0e3f0d60622e8989fe32aacf8dd444471197f
X-Git-Newrev: bb11e239f060b65b4f3ee0bc35b8515ba9f8061a
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.C9ADD880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/lrzip: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb11e239f060b65b4f3ee0bc35b8515ba9f8061a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The CPE long_range_zip_project:long_range_zip hasn't been used since
2023. While ckolivas:lrzip got 3 CVEs that affect the current Buildroot
version [1][2][3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-9396
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-15570
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-15571

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2dce5a7844d061860810da4b77965d96d09eb2b4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/lrzip/lrzip.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 0375696414..03ad36c58b 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -9,8 +9,7 @@ LRZIP_SOURCE = lrzip-$(LRZIP_VERSION).tar.xz
 LRZIP_SITE = http://ck.kolivas.org/apps/lrzip
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
-LRZIP_CPE_ID_VENDOR = long_range_zip_project
-LRZIP_CPE_ID_PRODUCT = long_range_zip
+LRZIP_CPE_ID_VENDOR = ckolivas
 LRZIP_DEPENDENCIES = zlib lz4 lzo bzip2
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
