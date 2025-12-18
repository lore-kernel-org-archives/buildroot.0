Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D483D6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C58240402;
	Thu, 18 Dec 2025 16:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHRyb-VuG82I; Thu, 18 Dec 2025 16:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5941440431
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075711;
	bh=JaNJ+/NV6YIWfxZp0hMUSAK2PUUT/PGsdX237j/eQfA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A8e4NVrmDDbAM/YbfzsKTHzHppkzKe0CiRi1pASIyXqIMb2jMRE0124dDLj6EmZoC
	 ersa29TY3vBVs84kVUtKPH7DACWwUHD+CV4IC8z/H7H1Dse7ZATcGgS9NcYNzZ1Oru
	 8dC5M8xtVU1cpl82tLQraBErdAaWq0F9jDR5/qLqZk3Xg99bc4gIVEE68g6VnIH5Z0
	 tshUS92EYMtW7BCSg8Zrdurf1xyuLwqfmGm6hUonB5OzeNe3FDxeLwQ9x4wV5NLeRi
	 aegQnSoaBhQpWUFxAsB/Fzg0y2p1QYVj0kdPLSUuZwDkB+5TZYKML7spPvEdl59VWn
	 f6fg1K73GCBfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5941440431;
	Thu, 18 Dec 2025 16:35:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEDCD375
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1ED141090
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hn0mGfB2y8Fx for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA9540431
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA9540431
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C564872FB; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:52:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 256befeb4277b343a69e521f4090985118011f6a
X-Git-Newrev: 42b17eaa92e1ae309c8d9d3c774406979a98f5bc
X-Patchwork-Hint: ignore
Message-Id: <20251218163507.5C564872FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpng: security
 bump version to 1.6.53
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

commit: https://git.buildroot.net/buildroot/commit/?id=42b17eaa92e1ae309c8d9d3c774406979a98f5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.53/ANNOUNCE
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.52/ANNOUNCE

Version 1.6.52 fixed CVE-2025-66293 (high severity).

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-66293

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 52f83ccfbca8497d58eb624ac7b59d5195565f3d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index fc4aeba85a..1e57e1dc33 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.51/
-sha1  8fd6ff93769fac269ab9197c106d4e0808521b04  libpng-1.6.51.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.53/
+sha1  90672f16e545e4931abd50d372edef50596a1d46  libpng-1.6.53.tar.xz
 # Locally computed:
-sha256  a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2  libpng-1.6.51.tar.xz
+sha256  1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4  libpng-1.6.53.tar.xz
 sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 96b97d134f..6fc3744963 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.51
+LIBPNG_VERSION = 1.6.53
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
