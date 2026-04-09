Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7751FF364AF
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B40440AFA;
	Thu,  9 Apr 2026 20:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wW3sZqEmKJvh; Thu,  9 Apr 2026 20:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C3E340B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775764828;
	bh=dF4+MdvS736uaPQ3uFxzl2unJkg9VyTFrft4oyJ+SjQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V2+5Nciternf2pFsYQ5mBwdJMlsShYcijDPF4xZ4PcLHrfVw6nA08fW/XkwEsGgoY
	 Uu1SWvFAnSSHIRGl2PfC+3Yh469IsZBWc1T75IODFXs+ArypzlULVIqlR2DumURfhF
	 u8h6l0uMj+7YlxFXq9YeyJiVAiaR8JJg9onhimh6mmW+hum880wg/PgjRJnrGicGOr
	 dDdN7spDN1GtQQy3u0LwCEmvx8iKSrrvXrMoV0G4tHZaoM/028NikvzEJCZWt1dQS8
	 Y31SMaRdnoe58LW9cy6SiHZ4OMPubYQMINogy2rOw26dFhVrSdr78on60gWoqzIiDH
	 skpQvc4EdDOXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C3E340B08;
	Thu,  9 Apr 2026 20:00:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CBCB237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82B50404A1
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPQA-VNloAzr for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B43D2401B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B43D2401B0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:00:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E2D880F82; Thu,  9 Apr 2026 20:00:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Apr 2026 21:45:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f862711b1033ee3b0bd92f2aab9f16ee4035b603
X-Git-Newrev: 63d64fb09f03b4ca2bfbe582e5e21a5293110929
X-Patchwork-Hint: ignore
Message-Id: <20260409200025.2E2D880F82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: bump to version 10.3p1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63d64fb09f03b4ca2bfbe582e5e21a5293110929
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.openssh.org/txt/release-10.3
https://www.openssh.com/releasenotes.html#10.3p1

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 154464d68a..2d242b4a99 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.2
-sha256  ccc42c0419937959263fa1dbd16dafc18c56b984c03562d2937ce56a60f798b2  openssh-10.2p1.tar.gz
+# From https://www.openssh.com/txt/release-10.3
+sha256  56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4  openssh-10.3p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index bcbfc39755..607af7456d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.2
+OPENSSH_VERSION_MAJOR = 10.3
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
-OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
+OPENSSH_SITE = https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
