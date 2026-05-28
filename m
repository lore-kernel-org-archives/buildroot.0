Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D5FCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB7D41F5E;
	Fri, 29 May 2026 08:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZkEzwSaGuLa; Fri, 29 May 2026 08:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8BE541FEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043152;
	bh=I26naLKIaTWWAzaB3oEtOMDqVJxQffYnJV8xSBbnnTo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E9FfJ8XEiuZgbIMmt+JgPJGWVAA9uF9rfTptok78f6uAbiSuCvoS8Dtk0ogAyoCSW
	 px0mqlIHGiedgJu/6kCmADBuuK9DDeo8ch9Zwh8p2r6f5hfayX6jbmUxfxH9zJP/Cf
	 5Q/V5sENp+7bWej6vDkciDUrlKPumO417l7Juv8Ft/PeAbtjCSeedLqLyKQRMu18dN
	 UwOC/0oUx5sl0uO3x3/xjoj+8OhjiURRYT3PtxidoCdUUu+N1J2DjwdPYyU727QzmN
	 hDTTBsIyX/lNQA/szSkx0WaL871C0lnCXHOcecFAeV7rgUYGtDafDtUYTWvy826U0b
	 eqUmwDs6LMZHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8BE541FEC;
	Fri, 29 May 2026 08:25:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1982928E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB63241F75
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLh1vIwWGHoc for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C97C41F6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C97C41F6E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B07FB87171; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:29:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1dbaf66ebc2a9a93fa4214fb87d484874851a624
X-Git-Newrev: 79f3bb7fe9068c574231550ad37951cb47021f43
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.B07FB87171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zic: bump to 2026b
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79f3bb7fe9068c574231550ad37951cb47021f43
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release notes, see:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 721a44f935d80bb3daaa8240ffc6c3f5a01107c1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 7fe7582f10..75242a306f 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
-sha512  d14bc0680b9cb33d6526a2c0e483f2abafc2593cfe5fbfe7dcab940aafdc1baaec065dbaa1bb58b03586a8631ffdf43ebb22ff5a70503298b6ea2cf061d82c16  tzcode2025c.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
+sha512  55b44d52a83c9db151be32c3d78376ea7f9d4311ef15ed6fe34b855b08fc546531e51309d178d9c175a6d5d7d0b058440e45a55d200ca8925e3798dac9bc739f  tzcode2026b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 06d8ebaf15..43e74e64c8 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2025c
+ZIC_VERSION = 2026b
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
