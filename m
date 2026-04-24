Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8D3FED3FC
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 20:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7252811A9;
	Fri, 24 Apr 2026 20:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aj43vvqo9LL3; Fri, 24 Apr 2026 20:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD7D811AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777060925;
	bh=q7R0RoUXCJDvaIboMeBLZuB0qLAJqggAlBV/d9r4wGY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ny79d+BWupj+3NLmReJnE2ZCGZjLIzdqq6Qe/0sP0iGIuMj2OxMeaImusPMUwlCt9
	 m9taoYTk84Bzo89zZ4Zft1sj2bX2gSKbOm8aVJGwVBaKLaoq7fygwpTK7OfC5fZP+g
	 n+nKWAmdgP5I7o48/3zW0L5kPGM1O1TTvJX9m+DP3I+8nta+e2SYxv26f4t/N0RCLp
	 drVl2QBm3+eMP4o4j2ihrUJXnwDgRH28Y0RPsRWC+Y9XpxV7KN0CJsWAFcpX5yJy/p
	 dp8GtutCRGsZbdBvb0HE0CLfWzRwm9g+zeC4OiJ/KliKYAX0opycQB5yi+2F535F4g
	 BJg97rIPlM9/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD7D811AC;
	Fri, 24 Apr 2026 20:02:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D8F231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43AA94018C
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcfOmfm2xsj7 for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 20:02:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91D9640184
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91D9640184
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:02:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 376E982BBE; Fri, 24 Apr 2026 20:02:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 22:00:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e54d5fb928eeb7557bbec1e5ce72457ff1bff0b
X-Git-Newrev: aa3603d9df9834a43d5758cade8c633e1d52887d
X-Patchwork-Hint: ignore
Message-Id: <20260424200202.376E982BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.123.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa3603d9df9834a43d5758cade8c633e1d52887d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/4b5e60e1b567c823a2a9c3a218d7122868d3c4fb/doc/rst/releases/nss_3_123_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix release note link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 31c1315783..0f5ec9c8ee 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_RTM/src/SHA256SUMS
-sha256  2145113398a269779a7390515a1638800836b130248e33f93243268c026d4e49  nss-3.123.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_1_RTM/src/SHA256SUMS
+sha256  42065a3ff780a9710a3dddcd1cee9b9be2aa40628883cea851d562eb58b178b0  nss-3.123.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a09262e8ae..29b15d8a16 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.123
+LIBNSS_VERSION = 3.123.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
