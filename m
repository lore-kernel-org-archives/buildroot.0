Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEF2CD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 19:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23DBF40C5A;
	Thu, 11 Jun 2026 19:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLy3upVsn0YS; Thu, 11 Jun 2026 19:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3769740D0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781207218;
	bh=W/Hw5/pEVysYe0vDEIA0kkVMblv9JEeQfmUt8cS1Cgw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Up164+Xsxamg9HAbSpaGtvcDAxbkzBQP05yKXs016GPbJm5UjDcEjBPc5P8QBCGAo
	 odj6eNaREDafGMBAml2tq4MqTpSy3MCWBdKR9sFKQtk1zJdF22q82x9Ckg+CCwGfOi
	 oJsj9f260ULg0yxf4tyiAVFhRbNEGOxUHvfb9+sx1HD0JGTOqoNDBoO1purBoLlikB
	 e/icES/exoyAiDRgwtmlfu7GznrazzaNR+fJEmCpvsWJ955FOBgLbH7aXA//o24NlH
	 b/PYHv6aWOTigLkLCbIuSUPmilxUeoa990qdgfxCW6tIILmUbq/5a/e1VnjE6HjFKc
	 xS0M+oofp89dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3769740D0A;
	Thu, 11 Jun 2026 19:46:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A24D912F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9259A40468
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrNaOqEeaOlq for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 19:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D063440074
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D063440074
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:46:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5AE488033; Thu, 11 Jun 2026 19:46:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 21:43:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e6e611fd52579a187f5c142f5b63cd43f167adb
X-Git-Newrev: 7c8d5a98a9aa689a31edd5d6c12a22e5a0a011e7
X-Patchwork-Hint: ignore
Message-Id: <20260611194636.E5AE488033@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sigsum-go: bump version to v0.14.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c8d5a98a9aa689a31edd5d6c12a22e5a0a011e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://git.glasklar.is/sigsum/core/sigsum-go/-/blob/v0.14.1/NEWS#L1-30

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sigsum-go/sigsum-go.hash | 2 +-
 package/sigsum-go/sigsum-go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sigsum-go/sigsum-go.hash b/package/sigsum-go/sigsum-go.hash
index b032e1839d..4e3cbeb2d2 100644
--- a/package/sigsum-go/sigsum-go.hash
+++ b/package/sigsum-go/sigsum-go.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9056406413868fe68a3fcc6415dff5a0045b35baa2242a17fea7a697b1c68e3d  sigsum-go-v0.13.1-git4-go2.tar.gz
+sha256  01ff9b579012bd36715de96f5474c8bfe7778daf4cb04d3049004797fa6cb5e3  sigsum-go-v0.14.1-git4-go2.tar.gz
 sha256  6a1e3378dcd18baade08ac30ec4ba33b72d1b1697c00226ef85b9c9cefdb4e65  LICENSE
diff --git a/package/sigsum-go/sigsum-go.mk b/package/sigsum-go/sigsum-go.mk
index 4f01be56a5..cd99e786b7 100644
--- a/package/sigsum-go/sigsum-go.mk
+++ b/package/sigsum-go/sigsum-go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGSUM_GO_VERSION = v0.13.1
+SIGSUM_GO_VERSION = v0.14.1
 SIGSUM_GO_SITE = https://git.glasklar.is/sigsum/core/sigsum-go
 SIGSUM_GO_SITE_METHOD = git
 SIGSUM_GO_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
