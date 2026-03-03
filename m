Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CF5EDEBF1
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 21:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA74F40BAB;
	Tue,  3 Mar 2026 21:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VESIVlOesXRE; Tue,  3 Mar 2026 21:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26FFC40B9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772574532;
	bh=FMDm6HWV8V1r3whTSCQthc18W7jgZFR0Y2U8+g/jwqg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HtEJ4U2izCg9sSyRYiUuIH3VwqSF2kKh7Uweo/4Yy8rLhjgChGvZfwjJM8clyXmum
	 vWU4u9WRYSN1MBttVMVXdTtHhfQkjVzjpC9mszPuBHOHNHJTL2yhvH4Yee+O8I9Vw4
	 krPLcEpsh+zcG1KI1KqnCN6yyjkXhUvR4crIq26ezo263FytNDG+CJHquhic61PBN7
	 YxNMyWS2Q07SkITfYbCF1wFDP8fzHuLQgP3Ev+f6pOuifW2vQhvDSe0w9haFqOyQxj
	 KHOY+4UyLENBwRPuXmgIgDI0r69lQj+mFwXxpOfz384Z1i7TL0qLSXJTlSh7G0rgxi
	 qHmquNOfrv5pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26FFC40B9F;
	Tue,  3 Mar 2026 21:48:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 713E125B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5730A60719
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryWCsMKg6lze for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 21:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A66E60703
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A66E60703
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D273860CA; Tue,  3 Mar 2026 21:48:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 22:48:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64083817deddf7bda0cc4cb47adf08c82a13d51f
X-Git-Newrev: 346d6667febdbec9a3c57e47009ab21e121b5b1d
X-Patchwork-Hint: ignore
Message-Id: <20260303214850.9D273860CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: disable zjit for all builds
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/346d6667febdbec9a3c57e47009ab21e121b5b1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The zjit option introduces a rust dependency and due to that not
being handled appropriately it can cause build failures if this
feature gets incorrectly autodetected as being available.

This feature was introduced when ruby was bumped to version 4.0.0
in f594f86f9d6f6a3b8dcd03d486b0c30a1381e7bd.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 5d5a34c096..5e8b40a556 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -26,10 +26,12 @@ RUBY_CONF_OPTS = \
 	--disable-install-doc \
 	--disable-rpath \
 	--disable-rubygems \
-	--disable-yjit
+	--disable-yjit \
+	--disable-zjit
 HOST_RUBY_CONF_OPTS = \
 	--disable-install-doc \
 	--disable-yjit \
+	--disable-zjit \
 	--with-out-ext=curses,readline \
 	--without-gmp
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
