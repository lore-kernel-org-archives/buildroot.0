Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC24F5510A
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6ED960EB3;
	Sat,  7 Mar 2026 21:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpXtQ87tsmeb; Sat,  7 Mar 2026 21:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9C5D60DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772919227;
	bh=/1tBxKT4wRK9nMfCwkqHp5ckgFSA64EhAs7lj32m63E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xp7hpMWgbYBZ1S4MZgYbK1eNMQbujFsWiIVQk5yeRwE9E8XqGbwxLF/hOg4216AAo
	 tlQ0RvnDUf/F4FJKFWnuoGs+v+zeNTZbMtZwxPE1Ar3BkjccS9TDvS+Cbz5Fw/OjVs
	 XDeR73D3KrowpcfzFMYrbO+vXyMd2ON72EfSlwGrco3GrOhNd1iScJ+5/Q8zRzY2MC
	 D3Q5qnzIfV3CqpERFn9o5kW+cqslCPZ7/epEXq/eofqN7Gi4pNp2UOVYSak+yKWsqG
	 jN+BAGTmpyg/bakv9Udsy6N5NC7mSNYz3TMd9H1eUya15E12iaDpdRiUNbqIQzklfX
	 K4KpvI4hLcGLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9C5D60DDB;
	Sat,  7 Mar 2026 21:33:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79E77158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77A32403FA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zR_hV5MPJhHq for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D4840075
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1D4840075
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:33:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9FDD85E18; Sat,  7 Mar 2026 21:33:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 22:28:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d94039e770d0b3849d30f69ae55c52e5eef416b6
X-Git-Newrev: 0b00d540bfff89583a58267b7c055c387d136e80
X-Patchwork-Hint: ignore
Message-Id: <20260307213344.C9FDD85E18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-jiffy: bump to version 1.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b00d540bfff89583a58267b7c055c387d136e80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes:
https://github.com/davisp/jiffy/releases/tag/1.1.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 7c314694e7..b5cbb99f0e 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f43bafc1ae5c9c1a7843a4c6b2d0b7ef57188e567381bf734035ef9701a7458f  erlang-jiffy-1.1.2.tar.gz
+sha256  44b93897b0ca4f085b9424d8673b3a78ff85daaaca4d055a40e2a03a8cf4587a  erlang-jiffy-1.1.3.tar.gz
 sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index b3f7cf82c7..b0839210d6 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 1.1.2
+ERLANG_JIFFY_VERSION = 1.1.3
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
