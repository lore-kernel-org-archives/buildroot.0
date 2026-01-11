Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644FED2502D
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15DF98136D;
	Sun, 11 Jan 2026 17:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBN6u6lps428; Sun, 11 Jan 2026 17:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E79A7812E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152420;
	bh=cqIn0h66ils1wZ6V6+qIuN0yg8PenUCWMKpcV9Nlol0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VC5VgOW0AJMyuo8uL7aGo3LpEBwcZAvhMYbj3R05q2/T+mGw55L/w+Ish+Iqkvdnq
	 Dku/iGGMajXjLhyOPI1WJeJPqwuLFqAzRj7JL7UkBTSYIRzW744xosPVaPYnBlSHKA
	 rawqd8ICuymRcje9teUBRr1gK24rQLFUFb6xnjb1x/H6Njl3vlP+mKr+Y7VXho+uSz
	 V8btYk/pwyirENI8Z78YHKHuSSEk4zqimaKx/onH83gswHvvR2hf/ULPeFcO75yhIp
	 u39Iil5jZ1U6fMPiRbttwdnniytRhZG30f7fg2WZh8m6iAIDSDx9Zrx+XqukvjQUHW
	 L3pBr/cz95QKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E79A7812E0;
	Sun, 11 Jan 2026 17:26:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6483D1CC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B71F4035A
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqvfkTDCGvGO for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E93EE40275
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E93EE40275
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAEE6884A4; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 18:18:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eff2064c05db70eb97a2ef19f41d614f71e232ea
X-Git-Newrev: 8ddd1462c4fdc0dc3206dbc4bb93edec1703748d
X-Patchwork-Hint: ignore
Message-Id: <20260111172649.DAEE6884A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: bump version to
 1.2.15.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ddd1462c4fdc0dc3206dbc4bb93edec1703748d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.alsa-project.org/wiki/Changes_v1.2.15.1_v1.2.15.2#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index ee47d43ab9..5f6ecc2be6 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327  alsa-utils-1.2.15.1.tar.bz2
+sha256  7aaaafbfb01942113ec0c31e51f705910e81079205088ca2f8f137a3869e1a3a  alsa-utils-1.2.15.2.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 9af2d0136e..9eeec1d50b 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.15.1
+ALSA_UTILS_VERSION = 1.2.15.2
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
