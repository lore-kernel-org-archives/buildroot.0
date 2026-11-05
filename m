Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCCC606A330
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 17:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OO41CpXb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 855F08114C;
	Thu,  5 Nov 2026 17:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_SGIiMMeoyu; Thu,  5 Nov 2026 17:02:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E6D3A8108C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793898173;
	b=gIyVk5NDZRma7ZEflRK1oVdi5uk5WPQ1PlJLVeKrmq1gpatdaifDAINj+04nxeuIF7Fp
	 4Qr5neGv3spMaPSSrGRDOOskhhuzs33ZphH4lSomZc+fPElr1HxasdqnTQk+H8nytrHar
	 XliXOVd0eK3V4QfAaXaihBuVqYGtnR8fWFpg3aMLxUholAXDUMoco+tJMonYMyccS8NIg
	 oBMaPFUyeCuEmlh5/wCFsiD+sMtI8T4+7sfORc1Xj4ikzyd5kQxnUxkP4aexdhsFyH9aX
	 EeVS26NQLzb5aePTHI0Iv1aGpCThAkrChyU2NhvsyJhPPLMOngZDw48teryMLGEA9rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793898173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HxIluc+bH1ztJcYpKL2sozoNubPDH/aPJ/8iJXtt09o=;
	b=ZTJH7Y9oBjBNdCjKVZ0x4GxdojrvbkZtlkFjw0YCeCXoj5va6lkeNNdh+ARpSoRZV+Qm
	 B0+PJWFVuYAJq8q0rKPGP7juDNGO5AJca/eqjlc3X0pGTFl/EN24EKhim0EF7/HgIIpVp
	 TqczaGhOFeEhyo6KnMrQWaosG0Bz85ZCWglXvTMpknTbCWHYl9zPTFONNw17lq8ekvU7H
	 muJFloIySRlKbm2WGmQeIOofsB/KyNSP2Vwygj/N2o3FTuFMTPV+2h4oCYW8oE8iYggcY
	 fnY6RB1WjbUewF4Nrn6wLl1C2UsoCRyVOX5gBeZy7skf5xX0nwnCRJreZMRrIFa0pCQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793898173;
	bh=HxIluc+bH1ztJcYpKL2sozoNubPDH/aPJ/8iJXtt09o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OO41CpXbg6VPOmFwJj1rXAbfvxjcK2wWXAo0HmUq7iGFiYMp4hnaUpauj0NuqCluM
	 zLU8jstYGt/KaNA+UfjRyKt1NCoeEbv5SuMuFeksSJFeZttPGVQTRHAeSJL+4WunvD
	 NP/moGG4q0op70+zi4UChDAkEGyLgDtLyRRFateCQFgHmYHCKtjBqVtWA0eRSoFG1k
	 ma7EEIJafjvA1KOtGp7+mK+KN8FIL4r06uSMZ+G2MZXe1BSpGdIpRDulcNimbo1fVa
	 juHLjtDH3k6W/2f530zIxgynxV6qoiKPheCLXnKrrV8DNroiW+P2ELLE1j/5T0uP/x
	 b5FjDaAT0PtFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D3A8108C;
	Thu,  5 Nov 2026 17:02:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA8831F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21A63607D5
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_KSKaIHusGr for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 17:02:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DE72F60697
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE72F60697
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:02:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4A619E02D; Thu,  5 Nov 2026 17:01:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 18:01:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1fad27e965805c0e4e201994021cd9acf48b0a5
X-Git-Newrev: 87eceac257b679d95c14768d2896d128f8e02e76
X-Patchwork-Hint: ignore
Message-Id: <20261105170117.E4A619E02D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump version to
 10.6p2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87eceac257b679d95c14768d2896d128f8e02e76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Security fix listed in release notes:

> sshd(8): avoid password authentication bypass that is exploitable
> through sshd(8) that affects some Linux systems when built and run
> with PAM support disabled. We consider the root cause of this bug
> to be outside sshd, but it is exploitable via sshd and can be
> avoided there.

Plus a few bugfixes, full release notes:
https://www.openssh.org/txt/release-10.6p2

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index a53ae817a4..615223830d 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.6 (base64 encoded)
-sha256  a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39  openssh-10.6p1.tar.gz
+# From https://www.openssh.com/txt/release-10.6p2 (base64 encoded)
+sha256  9ae44872090cf2f06b3cf9ff147e7f16f309671340763ed2f99248398ae29d5b  openssh-10.6p2.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 27cd5fb169..3ffc2328aa 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENSSH_VERSION_MAJOR = 10.6
-OPENSSH_VERSION_MINOR = p1
+OPENSSH_VERSION_MINOR = p2
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
