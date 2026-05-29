Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1369CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A4EF81E80;
	Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pn2ulcfimnmz; Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A629081E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663048;
	bh=EN79VVojxPaRveDtwt/ezjJvLo+WPmIfSRZ6xNQo4fc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rYIHYr1IdP7oL8Q2QRZN9qxqzvKR/C3CuV0SSOU6KRvc++zkZzKu68dSPrBSk6TSR
	 VeZJauFzwldJgzLlxIQQCGBDvVAqbF9eopxpOMumWDpBJLTHg7SmOFCFb/I/U/ctEq
	 2RFhTnRVrs0MAHgxexIO5BWE691aliVHNjETy7ezCTHXXLIXMje8Cj2uNbaAKNkaS1
	 RgACf0/g74kGBQX7cdLx4D2E8YDUhSiu0U0T6WqAWLJLMrxYqWcP5due5IwEa+5Tw4
	 GmsjXPWX1NPTEdoGpRQdPGRzFjEtBa2zHUNCiF/hhCUlL24DyLfN4g0R57Hlz0m1Ys
	 lBRP8y93H7EkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A629081E8E;
	Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56268F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C03B81E66
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBjdM3bY0PXq for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7AB81B17
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E7AB81B17
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36F9387B3F; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 17:12:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ba6cc945be10c1d8fb335f95eeebea3a016195e4
X-Git-Newrev: cc7f50bb22e408b43c02ddd4c7ef81bff8c0c0a4
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.36F9387B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/heimdal: drop
 INSTALL_STAGING = YES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc7f50bb22e408b43c02ddd4c7ef81bff8c0c0a4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

HEIMDAL_INSTALL_STAGING = YES makes no sense since the package was
introduced in 56258f491bf459cbdb2cee1db3267030340755f0 ("heimdal: new
package") since it's a host only package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d2d5014a8e10e82debc5f9222ab931a21edbf0c8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/heimdal/heimdal.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index f6c52f63aa..ed8826a741 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -8,7 +8,6 @@ HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
 HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt host-flex host-bison
 HOST_HEIMDAL_AUTORECONF = YES
-HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
 	--disable-shared \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
