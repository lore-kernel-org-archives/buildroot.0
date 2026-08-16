Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E8DC5DF6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 11:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F0DD80E8F;
	Sun, 16 Aug 2026 11:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bC_MROOSu8J; Sun, 16 Aug 2026 11:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E9A80E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786880232;
	bh=JlzlsnQxNiEiEuocn3bQe9xFKD4dj8zAMLEAWatv5PU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oUr04R1rj7TvF2wO0TYs+i8akjGN8U7cegoQth0bAwOy5L4gleXymzwv7Rk1gkGUT
	 JPFlCn3XAEzqiI2/ijgFBPlnzF4sG2/eCNbqgHWOPf0aX8JZHf48r3duAnPxgGgCGR
	 +SuQZcEp3EtT4DNK6uTCpQQxUsJHGbDdKiD8BSW656ONmypTiOtWJ5csXMrMdFZ/uR
	 zXuvMtssky4CV+biW9tvxz3GOFiokVean7vg7Eb1L06puEaCNi++mq5wBn55ZTlaZR
	 VIO98dnVa9iHznOccoEnICgrZCe0AD1ul/iHnHeUOOCzgO5cqJZ+fJgjwamKcEtQ0i
	 UCBpNg/zO+9pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51E9A80E82;
	Sun, 16 Aug 2026 11:37:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED431336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6800406EC
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8eNu_nhA-Gv for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 11:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F33F4406BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F33F4406BE
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05D608DA79; Sun, 16 Aug 2026 11:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 12:52:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c4b5e31df0a8fcbc45c88cb9d0ca4546254d7a7
X-Git-Newrev: 4c5039b80ebbe42db35af189afcff7fb7d5cace6
X-Patchwork-Hint: ignore
Message-Id: <20260816113619.05D608DA79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: enable FENV support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4c5039b80ebbe42db35af189afcff7fb7d5cace6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable FENV support unconditionally when a hard-float toolchain is in use.
Useful for packages as quickjs and chawan.
Adds 24kb to the C library on aarch64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uclibc/uclibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0cee106014..c19328e87a 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -286,6 +286,7 @@ else
 define UCLIBC_FLOAT_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_FPU)
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_FLOATS)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_FENV)
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
