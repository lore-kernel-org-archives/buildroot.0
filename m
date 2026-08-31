Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED09C624C6
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E778C80A55;
	Mon, 31 Aug 2026 20:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVJHCyKMZoom; Mon, 31 Aug 2026 20:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788208843;
	bh=8WtFBr0bP/thNJoZsllSkeVlhcXpoZZAUN6ffQ0fxcU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l1xeTOnKTVBkochn1MX+zb2pzgiM8loDK2aTXXvofagzblmo/i916h5PP+dDqz5bv
	 HfEs7x/aIf0hwuMLENNNYgYmOYrAsNJHwJNFwfx6MSITCscTp9EUB1RJrvjQqeD0mv
	 HP4vWLxHm4w6uKdpzDkuHyYr6ho7bwJjtY5buXCwpfWtxd3oRzTv7LQVnPdgqwvOc8
	 TgW2FWP5pyothMpz6wpAZH++doRv/q2y7+BNSjz6kGgadGEfWelqpvrfaJ3q4VjwFH
	 zXqeG5eaDqeBO+r0qbyn+jHY4fqeS5iSpyKleIjaE+NfjJsCBtkdVwVCPkoi+/3bes
	 1VuG+lgojt0WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36B8E80A5C;
	Mon, 31 Aug 2026 20:40:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69EC8363
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DC3560634
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APlGFTrVG420 for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A60FB60627
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:40:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E10A19341F; Mon, 31 Aug 2026 20:39:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 22:39:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88a4958afaacf74bc513dfaef21c611ccd861f5e
X-Git-Newrev: 8dea6e7c089cb5d4fa7bd788fc6e07c9f19f70a8
X-Patchwork-Hint: ignore
Message-Id: <20260831203940.E10A19341F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: apply perl-cross patch only
 on target perl
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8dea6e7c089cb5d4fa7bd788fc6e07c9f19f70a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit [1] (package/perl: fix build issue with musl)
introduced a patch that is meant to be applied on top of perl-cross,
which is extracted on top of perl only in the target variant.

Since the patch was introduced as a normal package patch, the Buildroot
infra is trying to always apply it, even for the host package variant.
Since perl-cross is not extracted for the host variant, some patched
files are missing. In that case, the host-perl is failing with error:

    >>> host-perl 5.42.3 Patching
    Applying 0001-configure-keep-_GNU_SOURCE-in-build-flags.patch using patch:
    can't find file to patch at input line 46

This commit fixes the issue by moving the package patch in a dedicated
"perl-cross" subdirectory, to make sure it will no longer be applied by
the infra. We apply the patch only for the target package variant using
a _POST_PATCH_HOOKS hook.

Fixes:
- [1]
- https://gitlab.com/buildroot.org/buildroot/-/jobs/16185948610 (TestPerlXMLLibXML)
- ...and few other tests requiring host-perl

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d950fff290b1318fd72c7f09fedbd1b87b96155f

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure-keep-_GNU_SOURCE-in-build-flags.patch         | 0
 package/perl/perl.mk                                             | 9 +++++++++
 2 files changed, 9 insertions(+)

diff --git a/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch b/package/perl/perl-cross/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
similarity index 100%
rename from package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
rename to package/perl/perl-cross/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 912445ccc8..43820cfcc3 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -32,6 +32,15 @@ define PERL_CROSS_EXTRACT
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
+# We need to patch perl-cross, but perl-cross is extracted over the
+# target perl sources only (and not the host variant). So we apply the
+# patch only for the target case using a post patch hook.
+define PERL_CROSS_PATCH
+	$(APPLY_PATCHES) $(@D) $(PERL_PKGDIR)/perl-cross \
+		0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
+endef
+PERL_POST_PATCH_HOOKS += PERL_CROSS_PATCH
+
 # Even though perl is not an autotools-package, it uses config.sub and
 # config.guess. Up-to-date versions of these files may be needed to build perl
 # on newer host architectures, so we borrow the hook which updates them from the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
