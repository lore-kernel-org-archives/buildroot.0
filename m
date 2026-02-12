Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15A2EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82EC6845C2;
	Fri, 13 Feb 2026 19:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdhhxJdc8QDR; Fri, 13 Feb 2026 19:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 583558458D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011368;
	bh=t3036qgfRUo9rmep49R5JaGtR4Pueh1oehrgYZbysMo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vv0vHqNcuct0Wk+qzYVlGyOOluhi88rUyXXPUukNaFGgMHet/nL0gcHVd8Dd2GiJo
	 6zXTDwE+c7Mu3t8jft6oru2S49bxNk04YcYMm4LP0u1Utj53ug9McQmpuAe9oS7hkJ
	 0mFmQ9dpvnjB7lhvld8msLyiQ6r9GcKBtgUCAMv6bx+cm1Z5NxnG420wNiJz/rsLxi
	 K+qlWeQXPA3CvVFsL36loATzK4hMgRPg3/4zycc0k2IK0nRtO4SsWJkO28QuQ21utP
	 UhDt4EIGXU7Z4WogQcF0Ek1NNDUYoUzqsbLYG+rSJN1TuGjSkFxI6G8SNNZGaTmO7v
	 YCC8oQsQsLZFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 583558458D;
	Fri, 13 Feb 2026 19:36:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C8D283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B70D441E4C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwnEDFk3zMwi for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3CA341E29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3CA341E29
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B872F8268D; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:05:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e7cde76895d22e2fbf99425d9b8b237a20344bdb
X-Git-Newrev: 2fadc8245431c616ce63aebd518f9434cf6c6a78
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.B872F8268D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php-lua: add
 comment for lua dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2fadc8245431c616ce63aebd518f9434cf6c6a78
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 995196ea5ada97a76cf05cce4556ed8284f8063c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php-lua/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/php-lua/Config.in b/package/php-lua/Config.in
index 923de2d799..9f43533fad 100644
--- a/package/php-lua/Config.in
+++ b/package/php-lua/Config.in
@@ -6,3 +6,6 @@ config BR2_PACKAGE_PHP_LUA
 	  OO-API to lua variables and functions.
 
 	  https://pecl.php.net/package/lua
+
+comment "php-lua needs the lua interpreter"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
