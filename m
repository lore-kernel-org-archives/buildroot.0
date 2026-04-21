Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F44CF327D4
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 17:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A7FA411C0;
	Tue, 21 Apr 2026 17:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuPGX-cy8U77; Tue, 21 Apr 2026 17:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DA4D41082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776792193;
	bh=eJ/vl+RV49VwBw934kmUu/kE8fQKswOQuRoRzJ+t9rI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FOoL5b9JnCcEIVeSH3bkZeI38rAR0YxOMP6SyVXAbYeBosWJwIaiG6+z268lsKIP9
	 FgS+UfNFSLTYYAguOABMqozHIoH3jbuix29drkTq5q1IEd3DbFAzQGOb+gYJ1dAyis
	 abcVbOK4jm4bGMemtrmRk/t0efnS4C+oyk/Y1RBoFUmrx8ZoTweNtUcj31hOOxzeQ9
	 mY4JxicMdNHg03GJFaqhO7TijIYgwSqxBYC//zzXeSociiqLdb8w4091oPKowEH3qx
	 YTKIk71syKpdw8hI0FaBdVrLD+GLsyWa8GN+W78D+r4rdOSfx8/3T21vw0CImoNHdj
	 oectxHmKJkSTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DA4D41082;
	Tue, 21 Apr 2026 17:23:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28A0F257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2641083F14
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEvRM2KB9q0M for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 17:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6913583EFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6913583EFC
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A6C9821E6; Tue, 21 Apr 2026 17:23:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 19:20:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5a678a1ce776efd87a7d18a046a5896c380ac24
X-Git-Newrev: 591e28a557e5693d955013a5d9b9f3078fe47ccf
X-Patchwork-Hint: ignore
Message-Id: <20260421172311.0A6C9821E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boinc: bump version to 8.2.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/591e28a557e5693d955013a5d9b9f3078fe47ccf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/BOINC/boinc/wiki/Client-release-notes

Updated license hash due to upstream commit
https://github.com/BOINC/boinc/commit/44742026e2e30e1c97fa846796236cbb73e43521

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/boinc/boinc.hash | 4 ++--
 package/boinc/boinc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index 3955cffb31..ee3168b148 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e577072b06f590d3230c25c94b221dba528b0938681e645bbd870778f8958077  boinc-7.20.2.tar.gz
+sha256  0697781686bd99f0294d639d19d7184f884e5d8b11ae8fae720b855f58bb3f5a  boinc-8.2.11.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 421c8a1455..6227d464d2 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BOINC_VERSION_MAJOR = 7.20
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).2
+BOINC_VERSION_MAJOR = 8.2
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).11
 BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
