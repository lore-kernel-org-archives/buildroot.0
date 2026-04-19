Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8E8EA719F
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 14:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0745B81097;
	Sun, 19 Apr 2026 14:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fewejxte150; Sun, 19 Apr 2026 14:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29F4C80FDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776609544;
	bh=MNSh5AlmywRF7WDPJUdH1EOnCUlbghB1Dj8cDWwvsqo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BMgR5GMzAHbGFSf2XjOymhMqohX7qOIB0v6lfXgDCiObToN/Zfmv7N1awPmkrxvhy
	 r05wskyovs90cosfCGQ3RxBGQcKFBNxZ7xK+SHFmQwalCMmRrZutUluZbHO9ysU5aD
	 KslT+C+xvX1f3KLRyVpAJjFwp8N/OezFqxxSRtn24pWaChzZpgKlXVKor+yC4tpsvC
	 c2L22/s4XGjfdeYEtNJr7wA1UsTQBJ1tyyIBCrjQJqLI0ANqL5MjQXHcodjEvaK9c4
	 id7BnE5UQ/1iPokO4e9V7p2YCzcjGryFTbv1dGrsbNlAqe+Z5mNLqfjSEJMQQTfGj3
	 6SnRkSYXn9xqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F4C80FDE;
	Sun, 19 Apr 2026 14:39:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF14524D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED12940266
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xX4EeEMO87B7 for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 14:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26081400AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26081400AF
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:39:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA9EF81E69; Sun, 19 Apr 2026 14:39:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 16:26:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8d6139f5b00fa204fdcd954efc7d37daaa4c3f5
X-Git-Newrev: a9bc1ef49a88515a24b880b5e71675c02584568c
X-Patchwork-Hint: ignore
Message-Id: <20260419143900.BA9EF81E69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf3: bump version to 3.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9bc1ef49a88515a24b880b5e71675c02584568c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/esnet/iperf/blob/3.21/RELNOTES.md

Updated license hash due to copyright year bump:
https://github.com/esnet/iperf/commit/010381c4b8fa19e236db571e787a246c31a414ee

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iperf3/iperf3.hash | 6 +++---
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index ee60d717e6..cce50581e6 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.20.tar.gz.sha256
-sha256  3acc572d1ecca4e0b20359c7bf0132ddc80d982efeee20c86f6726a9a6094388  iperf-3.20.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.21.tar.gz.sha256
+sha256  656e4405ebd620121de7ceca3eaf43a88f79ea1b857d041a6a0b1314801acdd8  iperf-3.21.tar.gz
 # Locally computed
-sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
+sha256  6c6e9abd761ff429c11189cd93bdee5bff7e3591253bd614b253a5f4fd30cbe5  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index bb8eece6b2..bff9a40865 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.20
+IPERF3_VERSION = 3.21
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
