Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642A7CD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 18:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33DAD82013;
	Tue, 26 May 2026 18:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvR1w6UIeJ8f; Tue, 26 May 2026 18:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D1D182015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779820348;
	bh=ymsRkyLkFgXqFHzorxJKEcVj96o/5Kfz2weJewhH8bs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ijtSXk8OGoyL5Ov2wXN4nBNcIxQLISEf0wWOMoyTNtOoqxspOnguxyPbOT86jVw4O
	 LVNBsVN/BvqUu9p2r1gNC3OBd6R//qZYxdh39AlVyMbnx+0++fSOEi7lZuoPHkbNgK
	 PKtKSCK8grNXMjbf3jdLlzT08msMjo5p5iXpcwYtGN+EARLLl+KdfEInsBSxGzUS6l
	 2EdBnXLeRTjS1tmYEa38KWG2m2chl1uECehE0k36xh/UGSQWbPxHl7R5sQw4UMS/4Y
	 wUgwlp0kK0dbwu74gW7zJgnL2eSwelx19IAqNmmGwTKvia9JqcNnYu9E1RlHx5dJbV
	 u+KGv6I2/6mGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D1D182015;
	Tue, 26 May 2026 18:32:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBB6F265
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D86CE405ED
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzUvS-kIfRb5 for <buildroot@buildroot.org>;
 Tue, 26 May 2026 18:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3577040051
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3577040051
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:32:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1333F86F54; Tue, 26 May 2026 18:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 20:29:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f5ff9e3cca644ee9a8401cd3c950f80d8ea7b083
X-Git-Newrev: 26628470ffd7bc0a38e5e884f61999dcc74206d8
X-Patchwork-Hint: ignore
Message-Id: <20260526183215.1333F86F54@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/broot: bump to version
 1.56.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26628470ffd7bc0a38e5e884f61999dcc74206d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Changelog: https://github.com/Canop/broot/blob/v1.56.4/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 56168b5a38..b311fb3404 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  dde0da41fe9ee0f03c7f2895134360a4d2e003ed1ebc726c7394009dd9ad0f07  broot-1.56.2-cargo5.tar.gz
+sha256  ba989fcdc8a939e64c880208f6b491f6202f48b5d003a69f033469af91c37af1  broot-1.56.4-cargo5.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index dfd9629d12..4f21205bf3 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.56.2
+BROOT_VERSION = 1.56.4
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
