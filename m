Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD4C10F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 19:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD5E961097;
	Fri, 27 Mar 2026 19:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pm-RQZJZQyqR; Fri, 27 Mar 2026 19:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1212860AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774638606;
	bh=pOJAei3ukk5cHS1liM6w9ljcXQ9YgWJQyaVuIYAn1gQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A43yLaRA0IQt/dNWW4Q0J26GMRjDObEnFgA2hF9amBzdjcjSt8+vnVk6QNnfrLiKa
	 0ZACH3YBNgjBVBUsLGWj7wLZyJAKBlsA0/8yRCWqcb6iDLmyZgKga6g4ch2ZgVJLWO
	 1esArB34OIIw9OMAwuIGBklcMDb38n5mxEVDRELua6KgptdA2/b4VUhmIzjEEptlBL
	 LTvOmGzdv1Iw3KYXhu8nBYxJbFn3gs7dXwmTKrx/E8cZh1Gr3TQ4Kpv6oEwzgsBCQq
	 n0JqCAwrmhlvyTVVh8uFe7ELZXEUvQMLQLmGtXUM0Goxw8LV//UO7jmbUKSplWDO+T
	 rZLbSE7fOuO3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1212860AFB;
	Fri, 27 Mar 2026 19:10:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9BB52AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 19:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB3CD805EB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 19:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpCy3kGdKC57 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 19:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32785805E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32785805E7
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 19:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68FCA7FB6C; Fri, 27 Mar 2026 19:10:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 19:58:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22e4440eaed6330401ac4c87b2eee7e0f0d19ba9
X-Git-Newrev: 6e4a136363260458a1a15c487f1903f233e80795
X-Patchwork-Hint: ignore
Message-Id: <20260327191002.68FCA7FB6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: security bump to version
 1.15.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e4a136363260458a1a15c487f1903f233e80795
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issue:

CVE-2026-34155: Improper Signing of Plain Bundles Exceeding 2 GiB

RAUC bundles using the 'plain' format exceeding a payload size of 2 GiB
cause an integer overflow which results in a signature which covers only the
first few bytes of the payload.  Given such a bundle with a legitimate
signature, an attacker can modify the part of the payload which is not
covered by the signature.

Bundles using the recommended 'verity' or 'crypt' formats are not affected.

For more details, see the advisory:
https://github.com/rauc/rauc/security/advisories/GHSA-6hj7-q844-m2hx

https://github.com/rauc/rauc/releases/tag/v1.15.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index ea537c63b6..edfefb5a7b 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  603dafa5085b6b964c74d5f57a154a1489af2b415dd20c6ff1447815d02c094f  rauc-1.15.1.tar.xz
+sha256  127a24cde208c65b837ae978c695a00730f1094ee8b6c7d48cf58ef846eae340  rauc-1.15.2.tar.xz
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index ba30c70dad..54974abc09 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.15.1
+RAUC_VERSION = 1.15.2
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
