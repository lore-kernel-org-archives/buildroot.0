Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD0FCDE00C
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 23:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1605480EAE;
	Thu, 25 Jun 2026 23:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEmKhtXRx76F; Thu, 25 Jun 2026 23:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93C7780E32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782428507;
	bh=rSRAo8jzElLTb774gZR/pUu9aN4gWt1jF5LiuGqcyAg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mc2p5rtbP4RKC7QyzfMred32tjNiJdn+KLbnN20PinsfHBqVsbb1yBgj4I76n1IWq
	 KiptKkT3PNN5fCjJuBv98NINk+/ZWBHmFqVIvdKS46u2GXJ+zeEu+DZUmx3/CouOat
	 XshXTLQsQguDTcOf2xgn/j11UWamXhVeak41jfMB2cG8Ttps/2MUjf9sty7EVZeRCj
	 5SRAE6TfEM8g8JxYwET5nZ0l1cm+4rqgaYcVLX762ts6uUGAc6YBjydbAZfc6rADRI
	 CKkk0VJl5smllYwbDIYzVXwWeCubm7GTKAQ7EcXIjjBE1ccLrREnjU7vw2YaIHSbpX
	 dMFzBXyfjbhSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C7780E32;
	Thu, 25 Jun 2026 23:01:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA935369
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7E4240E71
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a52-mmWp7Mdw for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 23:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D047640DB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D047640DB3
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:01:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28E3C85FAF; Thu, 25 Jun 2026 23:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 01:01:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50cc0d11d4b10d38d7975e9fdcf184eb5ea210d5
X-Git-Newrev: 70af49994fd84ac3d5bf0afbfa6aa5ce0ca950f6
X-Patchwork-Hint: ignore
Message-Id: <20260625230120.28E3C85FAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jose: version bump to 15
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/70af49994fd84ac3d5bf0afbfa6aa5ce0ca950f6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/latchset/jose/releases/tag/v15

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/jose/jose.hash | 2 +-
 package/jose/jose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jose/jose.hash b/package/jose/jose.hash
index 0bee7f46e8..016807c328 100644
--- a/package/jose/jose.hash
+++ b/package/jose/jose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cee329ef9fce97c4c025604a8d237092f619aaa9f6d35fdf9d8c9052bc1ff95b  jose-14.tar.xz
+sha256  1d055c445392aa48d709ecd6e56220384ae2b480496e270818bddf1f219c8659  jose-15.tar.xz
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 88050be5ed..486765aa9a 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JOSE_VERSION = 14
+JOSE_VERSION = 15
 JOSE_SOURCE = jose-$(JOSE_VERSION).tar.xz
 JOSE_SITE = https://github.com/latchset/jose/releases/download/v$(JOSE_VERSION)
 JOSE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
