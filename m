Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCEEE83062
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 09:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B0AA60825;
	Tue,  3 Feb 2026 09:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkj3_gs_4kUU; Tue,  3 Feb 2026 09:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 134016083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770109357;
	bh=hvMS9a++YwwAWC87mG/Ilt+gEguhfmofA/h20vjILVE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GaUkD1f9l7jP+w8WsLM6wSDqm8B+/Unk8f2JHmtzr4eS6AHGKcNJvJ/3bPOhuEqRY
	 p+o0ORHB7VRYbsRn2xkQLq6+aFLIGH3949Rl2HnOGgMIi4pCUD0Zquj7SC6tzHjNLg
	 alI26A4TUa6Jti2iE8yo+tSAvXk4bGGldNlINTX490qGzrrJd6YyV6pAY+1Wil12Q3
	 MZJlYhLPd1nppwrMr2rjW57oiHSj3EOlU+aPIPzZwwv+qJnm7I2VUIO4drqQelHYL9
	 yERlJ+AQE03ZAJDErUwBIxMgjZUlDPmhH+Nf6V1ZcCftVyfuvz/lBUDpvx8P0e61W3
	 VmEAW/rmd5k7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 134016083E;
	Tue,  3 Feb 2026 09:02:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3846F1A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2035E40446
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yRiK4mmGMdg for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 09:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CA8E402DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CA8E402DD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4276D8658D; Tue,  3 Feb 2026 09:02:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 09:56:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abad652feef21d29760e0f4016806d380a725c52
X-Git-Newrev: e258607bc9dcc87ffb85e5679d2628967a8deeff
X-Patchwork-Hint: ignore
Message-Id: <20260203090234.4276D8658D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: bump to version 0.5.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e258607bc9dcc87ffb85e5679d2628967a8deeff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=a768fcc0aafbe50a37d2d06bba23eb6671d3a9b3

NOTE: Tag v0.5.13.1 has not been emitted.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Peter: fix sha512 hash]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 4697d958a3..85f8f3bf82 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,7 +1,7 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.tar.gz.sha512sum
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.1.tar.gz.sha512sum
 # After checking pgp signature
 # using key 9F9D45FE50AE361530983792C7271D0A49B18BA7
-sha512  428de1f65ab77d5fee88bbf4ba8642d77abfda223a4ede423d09db9faa4f0347199b3be841d63b93a7ed68f714ef54ff41b2dc936e4b7ebb19b74499ed4e6a01  dash-0.5.13.tar.gz
+sha512  6b3d67f76e74853349fe99121b2ee96d32da9863042744e03984eb6a01bf437eee2f2e81fbdd0436090abfecacc2f5589960820c3d0d5f3dd580948d38d5dc1d  dash-0.5.13.1.tar.gz
 # Locally calculated
-sha256  fd8da121e306b27f59330613417b182b8844f11e269531cc4720bf523e3e06d7  dash-0.5.13.tar.gz
+sha256  d9271bce09c127d9866e25c011582ddc75ab988958a04bc4d8553a3b8f30e370  dash-0.5.13.1.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index eb646e1a4f..78effa791c 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13
+DASH_VERSION = 0.5.13.1
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
