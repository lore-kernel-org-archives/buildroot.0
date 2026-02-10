Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3FCEA8123
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 14:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C51B83E7C;
	Tue, 10 Feb 2026 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmiXPSVOn7on; Tue, 10 Feb 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B86ED83CCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770734803;
	bh=g5NFnYawfu976c9JkDWPNu1Uvf4KI0u61bC0mRVhGoY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lHhBqEXdbBdfWVuA3cbPLfzRWw2pE3MjtWbRWoeSVMAGiqSNHycoVR1iPtLVXJ79i
	 IqcU2UvUz7MZOSWXziyTJbJH++pLweRncYZjB7z9ULOKK9x/FvSCKrur9rZ/AMtva4
	 9HTrr5/V0knp1QiIlpStoCxxqSWucMicjDdxC+Ow4Bwdwzl5dPAt3f0o1xt/B5BoCS
	 YdS3S+EUytWKkAUDxy3tpgVtEoof/kKfj0ngJX+usJ1M6c/UlEcm6tknXnVCpJxrTd
	 /w0R+3VJDHKfDiWVNiLlVyX+p4AtaAsY4niy4vklfbwplwKS7B6hM9fbcB14sc5IPx
	 oGFNfhgFBrv0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B86ED83CCF;
	Tue, 10 Feb 2026 14:46:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F14F1A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 14:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84045407DA
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 14:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6ywTE7QUubB for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 14:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753444044A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 753444044A
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 14:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55A7A82860; Tue, 10 Feb 2026 14:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 15:34:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f4e61bff84fd601c45a00c72215deec8b513b39
X-Git-Newrev: 93811dd0f73d61426663650ed8a2123f46dd4b80
X-Patchwork-Hint: ignore
Message-Id: <20260210144641.55A7A82860@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.12.3
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93811dd0f73d61426663650ed8a2123f46dd4b80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ccache.dev/releasenotes.html#_ccache_4_12_3

Use sha256 tarball hash provided by upstream.

Updated license hash due to copyright year bump:
https://github.com/ccache/ccache/commit/ec039169a4d93f7bae3f3f99762bd0248c9d3bd5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/ccache/ccache.hash | 5 +++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index cd8a95f7a2..1c666c9293 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,5 @@
+# From https://github.com/ccache/ccache/releases/tag/v4.12.3
+sha256  c8e3ef79531966ecfa05bd1666c483b473df9af00896935cc468cb5ed573c16e  ccache-4.12.3.tar.xz
 # sha256 computed locally
-sha256  96ad53c76ecdb9c7a78e28a9bfdf2c95d7eece28546510fde7e16e5a13e2f7f8  ccache-4.12.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  fc33d985529cdb5ea484ee46d6df4de6a6bca25ebdd3f3211c9d15f1c59dc75a  LICENSE.adoc
+sha256  afe4bea7c75355e3a1c7bf6eec6f95fab01f2e8116d8e495e5af4c3a45513ae9  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 4f6a6bdece..30f87f7d90 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.12.2
+CCACHE_VERSION = 4.12.3
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
