Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10711E8FDB0
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 545E64073B;
	Fri, 26 Dec 2025 18:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YA2LrfrT4jXw; Fri, 26 Dec 2025 18:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15394403D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773258;
	bh=gcm6P7FMJSKCKCpJbt+xvTQsXWXGE1RPQiWePzQocOs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iN0C8hcNA6za1QsKcmaig2McFhZ9xp4H1TcSA9JUh5bt1ijCqH8jJQ4X2xvkpgZDg
	 UfsuF/Unde81OARFflWXuEoxuE0e7CLXOg/mHhLLkHSCWdt5OgmBilD5NQnjH6pQoT
	 6Zg0A6myQszmQJ5GKXnp27joB+ZkwC05dHNbbNZWs9eI0HEOmsYIz9PU6D/9rOm9e2
	 yWK1GlgLZCYtaE4jrCj/EDIe6aATJt878d8E1DNwlWiZA7flhHtkCvGk2Nn720G7ri
	 URV1tmPv6zqyg8cg6TRy3n9SXMvkuYPct74dS6Kj7yhnOGoXxheE53BF8D1qs7ZV9x
	 1Hzp4kx9HL0+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15394403D4;
	Fri, 26 Dec 2025 18:20:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A5ED255
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CB2940327
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPmgTyO5WCyn for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A053440313
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A053440313
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F7B78768F; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bfed3cd886eac1065ac91142a7c60892e6baf2b
X-Git-Newrev: 2cd7a5059bbc51a6386fd287e06b8941fa8bb2ed
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.8F7B78768F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neon-2-sse: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cd7a5059bbc51a6386fd287e06b8941fa8bb2ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/intel/ARM_NEON_2_x86_SSE/commits/662a85912e8f86ec808f9b15ce77f8715ba53316/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/neon-2-sse/neon-2-sse.hash | 2 +-
 package/neon-2-sse/neon-2-sse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/neon-2-sse/neon-2-sse.hash b/package/neon-2-sse/neon-2-sse.hash
index f964d2fa61..828358e693 100644
--- a/package/neon-2-sse/neon-2-sse.hash
+++ b/package/neon-2-sse/neon-2-sse.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4567ca8c8cbc8ce0ea3ddb9dc0f158707eb85c631cb400fd7010cd299cdc5377  neon-2-sse-097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f.tar.gz
+sha256  bf46151b3b6dbf9e724d96e21f83f154251127bd1142e47cd0e1bf624cb579c3  neon-2-sse-662a85912e8f86ec808f9b15ce77f8715ba53316.tar.gz
 # License files, locally calculated
 sha256  7022f51b439a5915e933ecc270c83e24ca0cb2cceeb08b0132dcd4dbb03ed2dc  LICENSE
diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-sse.mk
index ee6f5446b6..20c4976f33 100644
--- a/package/neon-2-sse/neon-2-sse.mk
+++ b/package/neon-2-sse/neon-2-sse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_2_SSE_VERSION = 097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f
+NEON_2_SSE_VERSION = 662a85912e8f86ec808f9b15ce77f8715ba53316
 NEON_2_SSE_SITE = $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VERSION))
 NEON_2_SSE_LICENSE = BSD-2-Clause
 NEON_2_SSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
