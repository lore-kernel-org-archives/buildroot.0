Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB9DCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADFF4421D0;
	Fri, 29 May 2026 08:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkPsJPx4uNBj; Fri, 29 May 2026 08:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCBB7421D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043325;
	bh=z8V2TdLrxVmR/B8iiWeyBICin5KotjblZDw6xaJJ95U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sWrI51dHo6wM39pXzzyKrp/cr6wJrGgkMI7eOlCbxBI0eABK0psUlkaE8dN9PDFbS
	 GaKdmFSppgBiUZqasEhK4MKugaijVcJHwp1Ymo+8GYyo37yFWg/aLYqX/9wXKqvMrc
	 QfyDbPYedJfyzG2lT6XsZDNK+uTDMRtOyB+Ny1RgToAVeYbg3H4YSDMvM1OgOYFVGd
	 4IcPcqTfnecQnP8GnLNjZvT15ApgYvFnJ9u5gnIa9mQBu/yCp2Qz346SZC/3Gm+4BC
	 YnF9ks7qS3ja33izdrVfjCDK3Wau9s4nTAvKLAwjx+s0PieluYWnP9kHFWD/YH6tgs
	 yXNf4jxP7ntNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCBB7421D1;
	Fri, 29 May 2026 08:28:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F99728E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D88BF61356
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ilkmu-0oYYO for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6944761452
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6944761452
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 061B387334; Fri, 29 May 2026 08:27:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:38 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 347d2116fa32308eb7a07d6f9c5f6227bbd34547
X-Git-Newrev: b6169edea58a22c970c7295f314d2926e8581c57
X-Patchwork-Hint: ignore
Message-Id: <20260529082749.061B387334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libargon2: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6169edea58a22c970c7295f314d2926e8581c57
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
