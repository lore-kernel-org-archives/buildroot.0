Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2230ECD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25DF407C1;
	Wed, 20 May 2026 19:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlMfV57UHG-G; Wed, 20 May 2026 19:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A7CB418AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779306428;
	bh=MJGjbJ1GMzzkVbQWFkObUL6qAVx7OScUbM+I5OilJwU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dti4O6oXvYXF68G4dElXam0lTqW6GgIQgJr9vILEtVGHpMzKAmUe5h9t5RpWJ/pqr
	 IVoNy0wxioJzbRQWQzuhAxQfNjNhStZwLONg/c28xfdvfbB2d1K0qyWw02gagmmzWw
	 8S8Zo3DCPNQMTs1UHPcniP9sliS9Gk+/DPqZh3IrjFXOjVAYv8M2RuOgrno7gxCJfa
	 cwlExyOTLnOY8UnpVu3c+KsiVV+wjW1sRJ0UVqG+JTTS4m5+UbwQZuofZzJRnw/utG
	 Ysym9hJZpllxW79s2IuCoPPPEEmDvz6aF1jdKNAgu/qQLkJzvFZaWnnRyMfBu95VZC
	 MsPlNOXCW6ERg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A7CB418AD;
	Wed, 20 May 2026 19:47:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBEAA1B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB56E613B8
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3a9ZFgFJRRMF for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 072BC613B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 072BC613B6
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:47:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0DFC86950; Wed, 20 May 2026 19:46:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 21:43:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88a83019df0f7006f8add38df0e6990ead672ad5
X-Git-Newrev: d08416a5a27006b287395fa32037c20076002089
X-Patchwork-Hint: ignore
Message-Id: <20260520194657.C0DFC86950@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: security bump version
 to 1.6.42
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d08416a5a27006b287395fa32037c20076002089
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/memcached/memcached/wiki/ReleaseNotes1642

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index fc6ad5eb88..f241723111 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.40.tar.gz.sha1
-sha1  f2513db7079ee4c6558eb11fabb55e1adf1fdf38  memcached-1.6.40.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.42.tar.gz.sha1
+sha1  de453f58745238c70091fe243549c406aabdc3c5  memcached-1.6.42.tar.gz
 
 # Locally computed
-sha256  a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd  memcached-1.6.40.tar.gz
+sha256  50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7  memcached-1.6.42.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index d3ec9d36d7..a164e82a51 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.40
+MEMCACHED_VERSION = 1.6.42
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
