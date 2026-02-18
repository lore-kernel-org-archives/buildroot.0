Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC43CE9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B592781331;
	Thu, 19 Feb 2026 17:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AArkBbjHFWAj; Thu, 19 Feb 2026 17:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B063581315
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521883;
	bh=ofFcEnwh50nDuFreDBbbL766AVR1Nhq29w5Cdm+e7xU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TluUj0g2Ams+3A85WvcwMkbuAg/YtQAwvgg/GJvudAtvJuHkKwhkb4NtS09szxeMN
	 5ED9Vx261zPDK0KXEO3JqQRZ5C+c4y223O5EWBB6onrHlatm2TmEABdwf2mWaWREtY
	 aNNuttjogTISaghoPrGFJK2GAB1WsoV7ts9g8FELbGb/eMvnt+2pFYM3+dbwhM0D1g
	 r1EEDMvCd14Iy5rFfYRS7kDXQoNlhWbMUePMXL8qqhbkhQsrktbj+rDKykx4SJeFhZ
	 iLgAaqx1Lg5vDJn/qZeAAwm368HkbatOfkxKQg+hOV9Wynm/iKnQ1XgSR5Em08jVZH
	 gS7EUp/csyCvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B063581315;
	Thu, 19 Feb 2026 17:24:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F329206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 307DC40C6E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGkzn3mjws94 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38D4840CFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38D4840CFB
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36ACB84046; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:27:31 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d6f0cf14b05343857379e63460fd4bd12ffaf2ab
X-Git-Newrev: d6a0bfca7ee6b30b71a67e3e40809967cfbf3215
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.36ACB84046@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/frr: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6a0bfca7ee6b30b71a67e3e40809967cfbf3215
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The CPE `linuxfoundation:free_range_routing` introduced in commit [1]
has a single CVE associated to it [2].

By looking at the Debian Security tracker for this package [3], the CVE
associated are using the `frrouting:frrouting` CPE.

This commit update the CPE accordingly.

[1] c4c11c2e1a package/frr: add CPE variables
[2] https://nvd.nist.gov/vuln/detail/cve-2020-12831
[3] https://security-tracker.debian.org/tracker/source-package/frr

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 42a63f9eae72d4898ddfbad7a9dd320f548a409c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/frr/frr.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index e41ee33caa..072bc4cee9 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -20,8 +20,8 @@ FRR_LICENSE_FILES = \
 # tools/gcc-plugins/frr-format.[ch] is not enabled by frr's ./configure, so gcc's
 # GPLv3 does not apply
 #	doc/licenses/GPL-3.0
-FRR_CPE_ID_VENDOR = linuxfoundation
-FRR_CPE_ID_PRODUCT = free_range_routing
+FRR_CPE_ID_VENDOR = frrouting
+FRR_CPE_ID_PRODUCT = frrouting
 FRR_AUTORECONF = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c libyang \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
