Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4059CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9635E41F65;
	Fri, 29 May 2026 08:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWrKJjumvXN0; Fri, 29 May 2026 08:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A2C4200D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043162;
	bh=Y/FcMc5xQ7EPKcZAT+ro5lMR1q0/fwYRBMJflqb4ljI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q0ihPNJkZQff3xh+dJa0ifizoaz59/klfcwz2j3kb5nDh9H4DLy20HG1/J49DYot6
	 HgJ01UxuSMJlxf1PBzfwzzru7X3Qij5FkRDWP2l3avHiNj5IqYgIUSeX4ia6Vmih/w
	 5oV6y6GqUXjiSm6F1l62e2DgK0xx30VPu3WltuKlxUftqccvTYdls1EdRdeUqx7jnV
	 +H/As13/e6Id2/hF82DJGJLYA52TdhsnWd1OxyDIyG8yypp8B+8yQDbaQN8EIiK6Ps
	 Ie01kNLGPR9swbiCr2qqcnwSY8xyuS73jW0w01h7dco3gTqBTtfuA/x811Xl5a9k0M
	 XtA2hJrVdVrug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A2C4200D;
	Fri, 29 May 2026 08:26:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A3E28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C58D541F7D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqkXsSBwOGk8 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92AD241F81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92AD241F81
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3265987334; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:47:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 304f893561beeacb28537212757761f6853c70b9
X-Git-Newrev: 81faf63cb48440257e8ce596d7e696f5bb187a93
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.3265987334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/memcached: bump
 version to 1.6.40
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81faf63cb48440257e8ce596d7e696f5bb187a93
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes are available here:
https://github.com/memcached/memcached/wiki/ReleaseNotes

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 63f2d211381344127b03f39eff535de5b3042a7f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 781897b6b7..fc6ad5eb88 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.29.tar.gz.sha1
-sha1  a9699aed111d86b6e37b3ce5e6ef4e7539582d5f  memcached-1.6.29.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.40.tar.gz.sha1
+sha1  f2513db7079ee4c6558eb11fabb55e1adf1fdf38  memcached-1.6.40.tar.gz
 
 # Locally computed
-sha256  269643d518b7ba2033c7a1f66fdfc560d72725a2822194d90c8235408c443a49  memcached-1.6.29.tar.gz
+sha256  a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd  memcached-1.6.40.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index a01d5aa9d6..d3ec9d36d7 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.29
+MEMCACHED_VERSION = 1.6.40
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
