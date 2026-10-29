Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7AD606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rXHeA8cn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C9E38175F;
	Fri, 30 Oct 2026 14:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4d38XA5MW3W; Fri, 30 Oct 2026 14:20:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4A45381779
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370031;
	b=afWS4RUIeajifByPYTeOM/r1PXEJpjDqzZtUZW17ZVlKSDMSstZZ8owgB+A4zDrbIGoo
	 TPRryqDQTwhFFeS1GoD1zNz+Uv3h3hqCoBNpts5yWIJcOuL2m0CdJBUtWVrMeqxJ9Ok4n
	 Ii4v5ZP+SJ017e2icyo8We66g++waZuXVZnXrd3hFWPnsnvMlzvihOb1eru1zwTw1r8Gs
	 ozZZF0Keo9hMM951rLw93RweLvIqUs+EhiUUCIkjY6LETuffPkvbFY9Ili59wk7ScaX83
	 gCPbujajGo7hl0jvJ2M28v7Hfr/8qD1ByLdTa9RFOj64oExvseHI/KCcpC7fynGT22Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370031;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ID9za9Y7q3CjC5XOsKO1jB7tus690Z9kfDtVTPa4gGU=;
	b=nfCvQ5A6CE45qIsT/18ltaajq/Eue/92JBeerA2ijQ8xmUBtdOVaNoZCZDkkG6u52xBk
	 WFw2zwzY1sJIgQOcUWX8R25oGy4mz9DbW57mBntIIP031pRAqS2cXjSzpr606mq55MANb
	 kEGhZGxq9v6GWOoH3ie5oXQ01wgkQBKJQLSu63Ku6cX9Ynr/yaczvosNzKGrKgeKWCaF5
	 s/AH9q2Ymk1tR7BD/HGTocitc4zbF2FgPQswDx9BIkSZBnP5w+W3CPsjVrXqYiFojX5lj
	 JLMxlACsHvxD4N181FJGvosGcUX7gx+sfAx0zMZ7Nnja0+QELOcONCnBRBGt2BQVKKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370031;
	bh=ID9za9Y7q3CjC5XOsKO1jB7tus690Z9kfDtVTPa4gGU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rXHeA8cntCba47E5cghwToo+LtAlhoXlUwjvnCptl12A7ejZU74vUwdA+qDUcvho5
	 1yaf8Z7IGaT1PD840sUmvYdK8yHxTxm1htkr22pn6CkugvvaFsDFCyFHE9PTWT/9cl
	 Rop08qVn1Te49Z6Y7vAAiGTm0wp+ufBTUsfrM+JgX4g4PNeN8IASIyRIfT9JP1qrZH
	 2imiKYciYcjetdJuj8vOXwQMRitBOZBJGfQiIEijFXYyGLXH0q+jjTeNB6Z+LAuh4G
	 iNS58KlDjoxAnktoPL+k8YRwg7LbfKqkiMkpwCPzTUThcDrNtZuF/lI5PxFhMFSPG0
	 HavQWBSah8MgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A45381779;
	Fri, 30 Oct 2026 14:20:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0127D362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9662812F5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du-vlWGS9VEz for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 49BF8812CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=SsaYpjcCCnPrGkDDrkviqN4Cd+08cnKnF/P+nJcpYjhTG/aLEG7BQubd90W5kI45CvR6
 uu8kwjiQAUnfWWQYszBMOKlb+fo4IOUl9G87nAXjLRespo1dlJn0Cg3lHo/95Wc60MRyU
 eHnAANf05jPCmiV940wh439g6MU13vh1FNNf4EYs9Y4T/gwR88kOU7l9HFW9j2s2YMLg9
 DQ1yYaOf07uco8vf6faPh9zFMBZ0zk7acxCYv1ywuG6NYbTPpQsqvU4VhN5meRCT371DJ
 yNn1SlzZ8uIbAOup36wDwX6yrrAWVsJE/pmCgTPtK50O0gIe8K/YzRXdtb0SW5/f02A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EXp6TIlSxqVmwQhPt42XriZFDymkyTGtbDGnZu6ozds=;
 b=OaCcFoPrjcK9H49Jzq2sIvP/gdrdXatWjORHpFyNmtTV5hZ0Mz+wTLF6qB8LtqTykdr5
 m1DaZfSV9Wk/qO3xaquu2A7XZ9JsGmxR6YT85tbdkah3OQBQYk9YFo+cdhJNT6XWx+ykc
 42Cayx669JBV7Vplhd8ssf9uq/cfpyhhg892k+aKP7/ng6/9+9At+toN4I96ozY8nGctz
 Fc+MDvZEL+E4qdpcqYNcPJeIGRBPClZM9+fJrD9z/LEGQGCHe5yP/OMiqC7S3GwNd650C
 GKPLtH+8UpsbLtAdQAtM+LGy72gHAMnKes3XWLl1FdO6XLfyEKywEWKOsJe7XFnDySA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49BF8812CA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 684B49D388; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 60dd511d7a478996a85285d90a1137fae92dc852
X-Git-Newrev: 3c0e1ce4180e4bd26b7e14a658288eb6fa5fd4b8
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.684B49D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libarchive:
 security bump version to 3.8.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1189989744134118419=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1189989744134118419==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c0e1ce4180e4bd26b7e14a658288eb6fa5fd4b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/libarchive/libarchive/releases/tag/v3.8.10
"Libarchive 3.8.10 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1889206b35aa8e272e5a325cb037fd9d0982ae45)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index acd4b9ef22..cd5943ebb2 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.9
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.10
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.9.tar.xz.asc
-sha256  888c934f9d95648ecb9163dc8e23ab80a476ecb81a8f1154704a227b5b676dde  libarchive-3.8.9.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.10.tar.xz.asc
+sha256  56cad765459d5ee25a3b761f90c47d99379d28297fbfb72d908880d6b875fb96  libarchive-3.8.10.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 88dbf2a48e..75cc034f6d 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.9
+LIBARCHIVE_VERSION = 3.8.10
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES

--===============1189989744134118419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1189989744134118419==--
