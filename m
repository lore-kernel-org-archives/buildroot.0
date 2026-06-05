Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38862CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BBCB82416;
	Fri,  5 Jun 2026 12:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKO_E4F54qrc; Fri,  5 Jun 2026 12:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 524C982400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663529;
	bh=+FPcbV++zqN4Dm+j0PfHL5FAG1kASc6k1ucaARWHGn8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cUbzNaGzZfLK1hxtOBmxngKuJ2EztnXiSVQ5UTU17S8QVVUVlMvxPJZt5Tm3KTtb8
	 2V5kRHhDGvjUZYBPQsZQkLbklu/uRw8c8KTBfFqCCxF5VGghZEQuMwwd0HOV0dRRDm
	 OOIaGQBZ/pBCGVHX9MI36nCX7LtQnf73rD6HHOPSbKpXQYDWjTqxL1nh6aXWnnzXFi
	 uiv5bRy/T1i+YZf88D/Y3UDynXYwVqgoR3Oltlxyt1nGRacQ4QXBI9GYmQrHi/bpzh
	 +Va7NZI91E3+rJAsxMkjrffuUxJf2uPvJ6qaZguP7l+bGK/pmBgDej0iZbNdYzTgUb
	 tz9qkmgVhkybg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 524C982400;
	Fri,  5 Jun 2026 12:45:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E7D13B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151AE82400
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRhnpL5sUuBm for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59BC081E6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59BC081E6D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:45:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F4FA87B3F; Fri,  5 Jun 2026 12:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 14:40:16 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3fbf04200d5b0c1d3cc2f9159752eb9481bf6fc4
X-Git-Newrev: dee8d1caffa052f56aba9f07139ad307139f2130
X-Patchwork-Hint: ignore
Message-Id: <20260605124510.7F4FA87B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/pkg-generic: Add
 /usr/share/info/dir to $(2)_DROP_FILES_OR_DIRS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dee8d1caffa052f56aba9f07139ad307139f2130
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

This is the file the original commit d8898380984f ("package/pkg-generic.mk:
Remove Info documents dir entry") wanted to delete.

However, it only works for host packages. Target packages are (usually)
installed with prefix /usr, so the info dir is /usr/share/info. Simply
remove both of them, even if one of them only exists for host packages
and the other only for target packages.

Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit e5a723f35d57d25a084a9e907e07d281cb17d3c0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e5e0d49a16..09d6e5b20b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -870,7 +870,7 @@ endif
 endif
 
 # Globally remove following conflicting and useless files
-$(2)_DROP_FILES_OR_DIRS += /share/info/dir
+$(2)_DROP_FILES_OR_DIRS += /share/info/dir /usr/share/info/dir
 
 ifeq ($$($(2)_TYPE),host)
 $(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
