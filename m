Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A16BCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7B742188;
	Fri, 29 May 2026 08:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Va5j6mLzXgFK; Fri, 29 May 2026 08:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1F4421B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043319;
	bh=u4HvfQQAW9IK0Cap8oYzyBxA5M5rEp2zDW1fGrFsB18=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a1xYhbjUnv6k+0inGpTFnfRGsYcMG/qB0Y///AVxA3liylopvXOo3w+9NPYkmztqg
	 MQoJY2u/Q80DytI9jko9ULfsd9SGIrHFHOf8G79aZ0LT/LIZSkUubuG7rNatpVkAXX
	 FWMwJXgwQO/HIoP3scQsnPpH7PPg/mqj8Km73pK+W71P+A6oZJWxwgvMy8Ftu7osyF
	 303kJE2KbmRWDCyVNJF02bbmFztoR8AdSEIribDt/Ny83TvJONsnFEmhR0thsQQjsZ
	 QelezHv98Bt6Bcj8Mx9YLp6gvxi8yNtFcaUx0Lq9K4h1jr0eQWKMgs5eelX702pkcY
	 pJciwe8u2xG1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F1F4421B4;
	Fri, 29 May 2026 08:28:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11702288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 082596145D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PIy4YA79sIz for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF4F6142D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EF4F6142D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0E4D87334; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:30 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 5712f79b8741f07437bfab5aabc751a832ed3891
X-Git-Newrev: 18dd343da4383ccf8cc9c8e31669a60855c0665e
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.C0E4D87334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/tzdata: bump to
 2026b
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/18dd343da4383ccf8cc9c8e31669a60855c0665e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

For release notes, see:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit b2e35216855d61020d6fe205a1c2c109b8f154cc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index fcf7bffd24..4d4d410ce1 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
-sha512  1e33f7212fd0ae2ad3c16e68f0c1fc7a6ad26a126b8406c379a5768d79604c6a816054bd0fe3a63228d70cd6a1fc2b1bae2a9f8014e102d3727eb9d21affa1f1  tzdata2025c.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
+sha512  a44882258c0a7fbe587e8b73d6bb3cd5be7d4788976ea742adbbf176eb3b33e5bd7d1714b2fffe2972b1a42e7335eac39ed0bd63e819bb421550f8cae1df4f2f  tzdata2026b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index a7b6dd8f65..71f8fc3ac1 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2025c
+TZDATA_VERSION = 2026b
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
