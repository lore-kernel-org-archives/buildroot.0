Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A60EA8535
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 16:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DC44189E;
	Sun,  8 Mar 2026 16:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkMWN3cjN8Uf; Sun,  8 Mar 2026 16:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 494BE41860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772988831;
	bh=H/+TEQ3Hr2t65YS40ldpczI43Jc8Db/TGKW46johCaY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W4FtwipqGWGal1CvkNV/3pEecXKd9aW0fVa8dPP7upWx3hPGlIkgxXjRGKzRep4hY
	 LLH+mPW/DHjah4Cetjc0NfF1FvYPjpFTtG/kqRIyYkGjDMmdD+n3UrUTrWZBGwkItH
	 OIYNQDMhZHMpLkcy2YHmnXdAZT8YMCWwKOfgMXTF7EzJCHSOeOji768Bs7co2WG8ep
	 GQNjyClEJNxHILGmxIsEevcoGxfSXAft+3/v3e/Nctl5TlPIqygp5LnPDbXB34QFOu
	 MQ2sxO1nbtO9aQa5AMDwwAMV/cP8Z5vWz5m2x9uWFNlhj8doyac4FaNOodMTxzwFw8
	 ngT+dUDQZcu9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 494BE41860;
	Sun,  8 Mar 2026 16:53:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D2B158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E893C60857
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMZoakzP1RK1 for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 16:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CEF56083C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CEF56083C
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:53:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56D2985E81; Sun,  8 Mar 2026 16:53:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Mar 2026 17:46:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 227378b5930b681c79a13476ae60a98753a98a03
X-Git-Newrev: 994af0d35b03e4a5abdd32f5bf6f92bdcf8b39c4
X-Patchwork-Hint: ignore
Message-Id: <20260308165349.56D2985E81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuv: bump to version 1.52.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/994af0d35b03e4a5abdd32f5bf6f92bdcf8b39c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libuv/libuv/blob/v1.52.1/ChangeLog

There's no newer release of uvw, and the current version of uvw
continues to build with libuv 1.52.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 8becf44d50..366296fcdd 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2ceca1a7577633cf92794db5bf5512370f6cd45a5746d6e14f8c20aeab0a547b  libuv-v1.51.0-dist.tar.gz
+sha256  c5f14915e2fa7b83b6111c3bc477920559499e10d95f852707420c8725b82d6a  libuv-v1.52.1-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index b38f3c62ac..b0a538c625 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.51.0
+LIBUV_VERSION = 1.52.1
 LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
 LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
