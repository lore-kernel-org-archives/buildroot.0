Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA15E95A74
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D39DC4038D;
	Tue, 30 Dec 2025 10:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id woHBUqXr-SxF; Tue, 30 Dec 2025 10:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FDE640390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092259;
	bh=tJ+0cg5crefcW23W5ykFG9Gh1LLGS7wztYPkwA0fu7I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DADsC3j/5VsKGCR9IvQb7iKyng2XToBAuNo5WFHuNwHWuAIhgL+TuG8PYX57nrBcw
	 5BwKbA1G5qRnEKKMNUY0H056KP+XTDU+JvnArJ6AXu1s7sFwPlGRAZwsAmBDC2mM1M
	 2vNzj8f2fVue5FLqPifcneK13wfszzp+FTMOzeUuiNdhp3BiZuVXtdWQUeBJQ0h05L
	 oFojPZGYMMHRjC1NJMtGzJ2LrhNVK5CzHWQ42iMNXpbo6O3K+ELEK6wdI01XKdZ5Tx
	 AotGLAVMvqjAAa9zoyz/6EiWX4FfcQgQVu37vQOvtS98cjo/uA7hXRz8wwSR8uThQf
	 JqnIsuAi3O8Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FDE640390;
	Tue, 30 Dec 2025 10:57:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6160E372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 487F740386
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFvr8caTX1RF for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA9DA40360
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA9DA40360
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AD8C87BD8; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:54:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1ca8ca4ba4814dfa11e840cc94341d966a6e911
X-Git-Newrev: 5043af53edea237dab1d5334b263cc9245d44404
X-Patchwork-Hint: ignore
Message-Id: <20251230105734.9AD8C87BD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pixman: remove stale IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5043af53edea237dab1d5334b263cc9245d44404
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2023-37769 is then no longer matched to the pixman package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pixman/pixman.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 63d9ccd10b..d02bb0a260 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -26,12 +26,6 @@ PIXMAN_CONF_OPTS = \
 	-Dlibpng=disabled \
 	-Dtests=disabled
 
-# Affects only tests, and we don't build tests.
-# See https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
-# "not sure why NVD keeps assigning CVEs like this. This is just a test
-# executable".
-PIXMAN_IGNORE_CVES += CVE-2023-37769
-
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 PIXMAN_CONF_OPTS += -Dmmx=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
