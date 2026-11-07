Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87259606A32F
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hhy8+qi7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 575EE80FA9;
	Sat,  7 Nov 2026 10:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMHMDUQiVXBn; Sat,  7 Nov 2026 10:52:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7E42F80F97
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794048776;
	b=TLsbX+LLc2MMOSXjynYVtp+o4T8TQHRktPadxcoGNbqsw7kEpfFr3fqCg3C6PBQtp7fW
	 EHocYvvDb9jMpUZNMW+LAcByTtTkEl/0GmNvn/p3Ums6VEZz+MsKy6YOeAGvpvzKhVd5A
	 hVmCFhoJmKBtC3dNq4MyHkCe+SlgnRtVB9ix2n8bDEw7bS/ANrDKeIUOnG5OgAR9afE9x
	 iXUod4ILqq8pwQPja1l0FWA00e7eI225zVR6HMp4LWMdLcO7e09/6uqIR+tipEi+Ucos0
	 s76Xf4QRoB9UApMAh6namfKGJpOakTZxdoil3S0IY5xujlpt4njlL244yjhrGFVq+0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NmAceX8hR6rwm+aa103jrsMYrDeR8hA8dJNRPkwasYM=;
	b=ZgA/Jc0vJxSrJWhNpJeilNrRL4JWrublOj23x2LYg4SbAgT8GAW9gXEBSuJws29ZDNNJ
	 0Mulo6/0zT6PkALKPSCqMYAd01Xj7cKWfP+NyEnVvQx/k09PRK34/Q8S9Y6QIWBuH8Y7n
	 RwgXVAIScCtjNBk3w9YQheEKMq+M4+GnHLWOBYUsTBceR/MXDJlBN+xgqIFFxW7sb2ORg
	 nTtCEDrD30Lh6wpBTfGUaGlfcCFY9XXRfdxa2sHmmcwpwMUSTD3D+G4M81ZzchKYe0r3N
	 vuzw6Ug0WdGQGC0n8EkpBlJG9lcFmS49xZBpdVqACBwU0JphW0Nnovs/VyRExt3V3bw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794048776;
	bh=NmAceX8hR6rwm+aa103jrsMYrDeR8hA8dJNRPkwasYM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hhy8+qi7+kMzqotaxyPvJXuiq27tgL4v8/Mbx7J4Uz9excFlcPbVY7bO+LdFAI7s0
	 9Rb5ng25j+z0VkXkp/9Q0SQI7igvs+xr4bDpbgjrR6d6wU+YRLMWPOTbDqgJOD3y3C
	 9Xld1Cp88ARCDcRrULrWhnAuXLs9uUYeeQmmLVEd06KJ2vYEoyWyhPrDF53Lg036nL
	 Fr+ERJi2VFm0cecUv4oAq3fu59WScYEdxm9AFOG2WGuLbhh3ZaEbGn96EKk0Ublpak
	 Ee6d0N7oHEAAjAXvUVFuTmN1O1wUbrtQx0E1XuQ/tuhnKwH8rip+NF7YrwepfD4ueV
	 XMHEa6d72fu2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E42F80F97;
	Sat,  7 Nov 2026 10:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFBE91C6
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0F3580F97
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1oVA-dryO5m for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:52:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A9DDE80F8D
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9DDE80F8D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C3A48398C; Sat,  7 Nov 2026 10:51:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:32:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea4951bd704605eb99e87fd8e43a73aac0aec899
X-Git-Newrev: d87bb13720370ec06b9686d48f07218b6dd6ca5f
X-Patchwork-Hint: ignore
Message-Id: <20261107105121.6C3A48398C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump version to 262.2
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d87bb13720370ec06b9686d48f07218b6dd6ca5f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is a stable patch release, no changes to options/services.

All changes:
https://github.com/systemd/systemd/compare/v262.1...v262.2

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 047cfac3c4..2bc539d60d 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  100fc873b848b9b0297d8a705e8e2ed326256c8483d9960ee1ffe264c8a5c3e3  systemd-262.1.tar.gz
+sha256  116432ee9dce9bfef4c7da7963c6de41899ab44197f2876ee99545707a5c7c1f  systemd-262.2.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 05aefb40cc..b162b1f948 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -21,7 +21,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 262.1
+SYSTEMD_VERSION = 262.2
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
