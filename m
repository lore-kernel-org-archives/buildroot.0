Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEF1C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76AF28129D;
	Fri, 21 Aug 2026 15:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qL0AOjMrdKVr; Fri, 21 Aug 2026 15:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324863;
	bh=EJ95zby0bc4cWtnjf7sB3gfGHS3WVVz1JyrsJK8JMog=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a2Hn65emBmV6AJg3+n17ZChWmR2TXYEHjHdp5mFAVIg9QEkyFiVD7XqpF9sOYvPMh
	 OkEVCjsrddw1cowMskK8jn5ctjGLwcEeWl5R2cOMRqlzZxmkdNfN2wLfj/VBPJGsGz
	 IzRzGa6wpT4ufQ6rfIBfK3FZV9BpjcaSuo4hKkz6KIJIGjkTpE4ZhgmwQSHGWKQVSv
	 WHMZnaCFMfAVnRPkPjawsMN9K3/WlPfekYxGxBIsuAk5nxxHONU3CC+x50aT3YMVcS
	 gNvkI/xYWMMrBVYbQQP+8jzu9BvFvGx2kXotJQrDVHY4gJoy8QLIA/q8MWvzG5Q73A
	 51/KzhN6hIFxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E9A8124A;
	Fri, 21 Aug 2026 15:07:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E5332017
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C354403F6
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RroUJ1iHe63q for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4B10403FB
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64E4E8E127; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 305d15d8794b30c1613577f284ae71fb777ed84a
X-Git-Newrev: f8857ef48b109940f6432b8a42b9d9a0802bbda2
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.64E4E8E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/memcached:
 security bump version to 1.6.45
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8857ef48b109940f6432b8a42b9d9a0802bbda2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/memcached/memcached/wiki/ReleaseNotes1644
> Hot on the heels of the last security release is...
> another security release

https://github.com/memcached/memcached/wiki/ReleaseNotes1645
> So this is a lot of crash and security bugs.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b00c3b58b9ae37e239cb782a5e411e6ea4be9178)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 93480d338c..6a3de856e9 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,5 +1,5 @@
-# From http://www.memcached.org/files/memcached-1.6.43.tar.gz.sha1
-sha1  37307d13528f355fb282bc8841ca033272e44ac9  memcached-1.6.43.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.45.tar.gz.sha1
+sha1  45038980ea7045a548b9b5b5125ef7116312a768  memcached-1.6.45.tar.gz
 # Locally computed
-sha256  8042ee26e004efa0db41ca4a7c713f759c3280c2f8bee438579f13de1e509435  memcached-1.6.43.tar.gz
+sha256  d362c64e6d8d5287153501eabf7c85b4a761432fbf53f5d7b085d0bb1653c1dd  memcached-1.6.45.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index e297ca17ff..f86bd56006 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.43
+MEMCACHED_VERSION = 1.6.45
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
