Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FD3CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B9F881FF2;
	Fri,  5 Jun 2026 12:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U12RvIiI_cJF; Fri,  5 Jun 2026 12:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A6908202F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663187;
	bh=OtU8h7LU4COOHrdaYXltbdb1uBWF7Vyh/XZsr80wD3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pv6iwMw8k7snM//WTsHg/r+OOOl5IlaAjgUU94zMMCdVMbC7Qlo4F8VhelhLmh913
	 Xxntpeopj4VIQBlSeRE6PfsTNR3dJ/VpOFqVHXoUUI5MrSVYFsRxWDaILa1MClwDzm
	 K1TW/LYAP5g/hkCz0nUYbS4nZYlO4sNDPeiMkq0gHUNStihrxmE5Syl9LEPrT1S2wh
	 ZzjfSnB6gbhc5awySgPk5aiCISKv2BFezMjX7QZ4pXKnvMYjyK2drMJVehUARh8rUp
	 CbIAH1AvfpXO8OgMJZXh4l9i/dR0VnPDmRJRkpV+/mq71kHkgujC/Q5wnyE/hEfcKT
	 tG1ua92SCoMPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A6908202F;
	Fri,  5 Jun 2026 12:39:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD703B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B8034107A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a11Vo1jDd_di for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D200A40ECE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D200A40ECE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03AC987B2F; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:53:56 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 475048387bc3a21c2d2cfe14a4cbf8a8e62f5435
X-Git-Newrev: 4039ed47718b5b4721913283f3aea2c71a114dd2
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.03AC987B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/gstreamer1:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4039ed47718b5b4721913283f3aea2c71a114dd2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The CPE "cpe:2.3:a:gstreamer:gstreamer:*:*:*:*:*:*:*:*" is valid for
this package.

The previous vendor `gstreamer_project` has no CVE assigned to it except
"gstreamer_project:gst-rtsp-server" which target another package.

See the CVEs [1][2] ...

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-3085
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-3086

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4a5b7d733c7391f39097d76eb95a6b761bc09d97)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index e9299e9e93..535272ed25 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -10,7 +10,7 @@ GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
 GSTREAMER1_LICENSE = LGPL-2.1+
-GSTREAMER1_CPE_ID_VENDOR = gstreamer_project
+GSTREAMER1_CPE_ID_VENDOR = gstreamer
 GSTREAMER1_CPE_ID_PRODUCT = gstreamer
 
 GSTREAMER1_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
