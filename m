Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1497C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 06:20:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510BB60EE7
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 06:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 510BB60EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BFD360620;
	Tue, 10 Aug 2021 06:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nof8-uqappWw; Tue, 10 Aug 2021 06:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F2F6063A;
	Tue, 10 Aug 2021 06:20:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 408D91BF30D
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 06:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DC6182538
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 06:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3ACpbwhU4dV for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 06:20:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D854282468
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 06:20:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2BA3F8D374; Tue, 10 Aug 2021 06:19:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Aug 2021 22:14:42 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 98aed626ba1dc1f5822c8c3701779916f24637b6
X-Git-Newrev: 04ce5e9d35deaa04ecd4667c17044a8a20cf1e11
X-Patchwork-Hint: ignore
Message-Id: <20210810061954.2BA3F8D374@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ruby: fix
 RUBY_VERSION_EXT
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=04ce5e9d35deaa04ecd4667c17044a8a20cf1e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Correct RUBY_VERSION_EXT after commit be9783951d1d44 (package/ruby: security
bump to version 3.0.1):

ls output/target/usr/lib/ruby/
3.0.0  site_ruby  vendor_ruby

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 73e570a290374602814d53f8d3b2ca21079ad71a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 7e0266c6df..2434ce946b 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -6,7 +6,7 @@
 
 RUBY_VERSION_MAJOR = 3.0
 RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
-RUBY_VERSION_EXT = 3.0.2
+RUBY_VERSION_EXT = 3.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
