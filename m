Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1DCCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A3A613BF;
	Fri, 29 May 2026 08:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kcVjfWzJyyr; Fri, 29 May 2026 08:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0F19613AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043151;
	bh=r3aOQy1vc1/1jtPeQFYqEpgIEnvE3Gqq5cyYesJKm4Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=brP7EyIy/UMS/mXHagmR7Cj3MkXFR2G/FCLSKo3HTn5S0+M3AEl0H57O0vyMmjYJ5
	 7LRaysZenYB9xx1IV0RN5Pff8tjIVPMFpQiOzw8Sl+Yvwv6XjOOtReAPGfstlBxaEf
	 2TNNQr9sWsTkJ5IfcuabQwEqfMBtcxuxT1CHJTh9lCFjNZiZehaSjoU6zThYFdP3Bw
	 dvsAmue5EbGA5DC0rTyfRSw4TjOauDzBFRGBi6NJgpMdWqw2SF1I9FKqLI8cpEjvaw
	 tXC9IzichvbhHHzsPF4g1ypC4bN+/4XTKqLUOW4tl+v+PsJCpX5MIiWKNv8Cb7UfjV
	 4dnvNSUeNalXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0F19613AA;
	Fri, 29 May 2026 08:25:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 131AA288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A0CD41F7B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFk3NXdUvfRn for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F4D41F75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37F4D41F75
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBD9487171; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:36:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cfb43d9d382e167afcd1c05f56dbdce6d8e46b38
X-Git-Newrev: 1ed6a45be82b22093b280e3620da1457c2e8646d
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.CBD9487171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libargon2: fix
 pkgconfig version string
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ed6a45be82b22093b280e3620da1457c2e8646d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Current build generated pkgconfig/libargon2.pc has wrong version string.
    Version: ZERO

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 1ef471a61da87e356054d39e406edbb16878bd89)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libargon2/libargon2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
index b3f6e1b216..1f3acbe042 100644
--- a/package/libargon2/libargon2.mk
+++ b/package/libargon2/libargon2.mk
@@ -11,6 +11,7 @@ LIBARGON2_LICENSE_FILES = LICENSE
 LIBARGON2_INSTALL_STAGING = YES
 
 LIBARGON2_OPTS = LIBRARY_REL=lib
+LIBARGON2_OPTS += ARGON2_VERSION=$(LIBARGON2_VERSION)
 
 # GCC_TARGET_ARCH is not defined for all architectures, but libargon2
 # only uses it to detect if some x86 optimizations can be used, and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
