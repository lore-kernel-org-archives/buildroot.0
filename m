Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA54EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BBB884838;
	Fri, 13 Feb 2026 19:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ekyGPCr1Dhr; Fri, 13 Feb 2026 19:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE7A884833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011529;
	bh=Wzxamx9y/3j+1EOXfJdxnyuxgng/CNgFUdQwjCqoOjs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d5FoYzxIqXYd5i6/9huylI7HcaP9EFnyl9cMhxKPHMoIK6IKMUFST+r7luZJKtavI
	 gFx4DfCTL9xjE9hlZf53mXi3eRJaDLlbrmEGH6gfwXV6F8xcz7oamZbS8YnsexSuJz
	 V3dMOnUovSIgU3UBLNa5QRsLpKbpcbYBWKuEwSOTp3l3XByVrTyrpdryvSa+xTrV6Q
	 HYRHkZ0rGh+mIEHtJmmnjTG8bCH9vNlcMhtsJoMWLpXV/kbU8+7TyTMuaxNMzQSR6o
	 4E1S2FQCEI3+XHT9hRzd7AbnrmQveQMOarpwFhoKoD9cA02JBjFJCf/cgMd93Sg80B
	 N67sEkZXJUnew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE7A884833;
	Fri, 13 Feb 2026 19:38:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7318B69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85484412F2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkfVx5bCmK1z for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C9B9412A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C9B9412A6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 222BF83593; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:55:39 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: bdc77eddfec4256741f2dcb1de3e5053936670c2
X-Git-Newrev: 41fbe94c7073973d1d0ee1c9ca6390e16921fbf3
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.222BF83593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] Makefile: add
 check-package-external target
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/41fbe94c7073973d1d0ee1c9ca6390e16921fbf3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The new target provides a convenient way to run utils/check-package on
any external trees, using .checkpackageignore files from the
respective trees if present.

While .checkpackageignore should be used as little as possible, in a
few cases adding overrides for false-positives to the affected files
is not feasible, a practical example of this is a Markdown file
misidentified as Python by libmagic (likely due to code blocks).

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Arnout: set ${ignore} explicitly to empty, in case it exists in the
environment.]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit fe489050806f2a0e7c2d14d9a5835fde9c71c7d5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 600dfd58ca..8036521075 100644
--- a/Makefile
+++ b/Makefile
@@ -125,7 +125,8 @@ endif
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean manual manual-% check-package
+	print-version olddefconfig distclean manual manual-% check-package \
+	check-package-external
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -1255,10 +1256,29 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
+# $(1): br2-external path
+# $(2): br2-external description
+define check-package-external
+	@$(call MESSAGE,"Checking packages in $(2)")
+	$(Q)if [ -r "$(1)/.checkpackageignore" ]; then \
+		ignore="--ignore-list=$(1)/.checkpackageignore" ; \
+	else \
+		ignore=""; \
+	fi ; \
+	$(TOPDIR)/utils/check-package \
+		--br2-external $${ignore} \
+		`git -C $(1) ls-tree -r --format='$(1)/%(path)' HEAD`
+endef
+
 check-package:
 	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD` \
 		--ignore-list=$(TOPDIR)/.checkpackageignore
 
+check-package-external:
+	$(foreach name,$(BR2_EXTERNAL_NAMES),\
+		$(call check-package-external,$(BR2_EXTERNAL_$(name)_PATH),\
+			$(BR2_EXTERNAL_$(name)_DESC))$(sep))
+
 .PHONY: .checkpackageignore
 .checkpackageignore:
 	$(Q)./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
