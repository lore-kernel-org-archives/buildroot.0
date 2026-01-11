Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EB5D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD6488125E;
	Sun, 11 Jan 2026 17:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMDmkErV8F2A; Sun, 11 Jan 2026 17:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACCC4812E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152414;
	bh=37BjbmmeFMeJ3GkGbILg80iMYbcngEGiapi0+/XihqA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fYxZeuKXFZDmoSU9bAeVEnDXmclH7MXCoxwCDd6zA0zHhSAWK6xx8cYES9uKC+hBv
	 yRYGw7JK4amhHVJ/Wkznh9jACFOdPLEPsoC2YmtIUaLpURnofow34H0jsKyMIB3hxx
	 2z20LOawtbo0DQ6BEoESg3oMbGlSG8aT1q8UB7QKXZKUyZ2pfxXzgkoBIZ/T0fGiUE
	 CLkGpht6umc3DIrSW2qK9OmxD1R2rOzKuLbeqfoZDqlpKtqW8DHA65s8/VXTohAFqU
	 PuNlNjyPK16Lhd4L+FfE74+GsWLy4OVblqJM4/qvdf9j5WAT1qkK+JAcHSXO6t0lVm
	 GwdWRjxqFc+OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACCC4812E6;
	Sun, 11 Jan 2026 17:26:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C794D18D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEE048114B
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9V4UqYpCJfh for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052D080E1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 052D080E1E
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAA3F884A6; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 18:22:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13c3e723cee2a2c892c51dee9a10c37dc38d873d
X-Git-Newrev: a57a35bdd08ec7ff778823efea4c383ef9694040
X-Patchwork-Hint: ignore
Message-Id: <20260111172649.EAA3F884A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwdata: bump version to 0.403
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a57a35bdd08ec7ff778823efea4c383ef9694040
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/vcrhonek/hwdata/releases/tag/v0.403

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 6a0b931aea..eee3eaa555 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  e390fe2f5f5ef7ed9ccbe62eb7cd40d4ee2b57389e7869c0dc96433c81812e7a  hwdata-0.402.tar.gz
+sha256  77d0a69e5558d16d33bbb510a09093deaf11c882baf9ef6ec5f18a8ef96e2c13  hwdata-0.403.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 8a8e399c21..c185358bf6 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.402
+HWDATA_VERSION = 0.403
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
