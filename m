Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B469EDEBF1
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2E078193E;
	Tue,  3 Mar 2026 20:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gie8N5gCxiXm; Tue,  3 Mar 2026 20:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6014814C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772571179;
	bh=Cg1Q8cQrnhX8WyUZcvF9ndNUERt4GgERlV4RZ9aalL8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FeX7R89q1dQh40D9gDb1R9e62qFhIQBrCj33iPhAZIpzVQ46FyL/Qfm1+Bht9LH1u
	 s502Qij317r0M9iwhJ566kyxHAOlKueftTnoc9s40W4XIcBhYnzLQLBGaw63RYUnfC
	 GuvsAebIsw/sMuWmD77qN6NuB5bQDFMiLvlQlJz4Tn+WTVzZeCDE3mHYhbF/Xy2VGi
	 3gydKFuB/uzVSM5ACMBFkev0xD7ZEOI5gx/KuHNlIUCtyl9BNykbZzN/ZT/qtUTOL5
	 mhXLtjKm8k9XmhsXSj9+9PN7VnKSmcD9WahelcEkoIXuWphwzhuUMvn7UXnOEEWDOW
	 eW6d98EVINolg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6014814C7;
	Tue,  3 Mar 2026 20:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C616C25B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8079409AB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOkEDciVaLjo for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D274096B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07D274096B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:52:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F31E685FB8; Tue,  3 Mar 2026 20:52:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 21:46:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f9f9caa4516be5ca291c8da834710fe7cd0dc23
X-Git-Newrev: 166ef8a12c7672c6928859ae1aab6ceb6dce575a
X-Patchwork-Hint: ignore
Message-Id: <20260303205256.F31E685FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: fix extension dependency
 after bump to 4.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/166ef8a12c7672c6928859ae1aab6ceb6dce575a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 127f36b406 ("package/ruby: bump to version 4.0.1") adjusted
RUBY_VERSION_EXT, but ruby 4.0.1 still installs its extensions into the
4.0.0 subdir:

ls target/usr/lib/ruby/
4.0.0  site_ruby  vendor_ruby

So revert the RUBY_VERSION_EXT change to ensure the unneeded extensions are
correctly removed.

Signed-off-by: William Sherrer <william@sherrer.com>
[Peter: significantly extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a9668e36f1..5d5a34c096 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -6,7 +6,7 @@
 
 RUBY_VERSION_MAJOR = 4.0
 RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
-RUBY_VERSION_EXT = 4.0.1
+RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
