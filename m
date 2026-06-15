Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5981CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 18:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74CAC614A1;
	Mon, 15 Jun 2026 18:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9tpjnQe0kfV; Mon, 15 Jun 2026 18:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9838E614A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781547628;
	bh=KRlE5mlAPrSdprIpjeSxtuZNcGiqNmhjz1hIzxtCrYY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ciaGuItIsLILETBMhGef6zx/gpttu0c7q80qnqMUEZ3IelQVqSWLfQa2tp0znvJpK
	 rcz8zoT2iigIcvbNmOA/JcAgiLOP7qoCGDwtXSsyncsMIxKmidUO8KX3WulxRR9X9L
	 r1dTnkwz+/0eJCHLh0Q7vVXBforqsRiTMv8g1ray7mwo4npAHL8fqpFy0GcYW79ONc
	 gOnp0+odf1K+z4XgBpphBBHY//XwbPq9yAItk8WIvzBDPDOui0RJEb539KHuON6uMU
	 SngqcFqCgRM/vuLp9n07skQomuDgAYGwiRLudDA+SHgKpJ86IbAMBvlrnnQhIaS2jH
	 8e6BNnO8Rxc7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9838E614A2;
	Mon, 15 Jun 2026 18:20:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C9442B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7251D84148
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qk0jzzC8rO11 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 18:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A3583E5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0A3583E5D
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:20:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD68688351; Mon, 15 Jun 2026 18:20:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 19:57:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ad755143bfb63244d912492a38a1c3756ddde94
X-Git-Newrev: c2f607a19bc0b466e4a511396ab326364ae883c5
X-Patchwork-Hint: ignore
Message-Id: <20260615182004.DD68688351@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-jiffy: bump to version 2.0.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c2f607a19bc0b466e4a511396ab326364ae883c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes:
https://github.com/davisp/jiffy/releases/tag/2.0.0

On version 2.0.0 it's been used https://github.com/kolemannix/ffc.h
that is covered by Apache-2.0 so let's add it to license list.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/erlang-jiffy/erlang-jiffy.hash | 4 ++--
 package/erlang-jiffy/erlang-jiffy.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index b5cbb99f0e..615bd02104 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44b93897b0ca4f085b9424d8673b3a78ff85daaaca4d055a40e2a03a8cf4587a  erlang-jiffy-1.1.3.tar.gz
-sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
+sha256  d4ef3fe9a231f4fa3d2f5b4be905c2d2a116b96d56433c66b5d7bd2dace5d52c  erlang-jiffy-2.0.0.tar.gz
+sha256  2d1a98e412143fbcdfdaed110614017b267b007252e1b4e121f9fc921edf9ec7  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index b0839210d6..b07db71a09 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 1.1.3
+ERLANG_JIFFY_VERSION = 2.0.0
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
-ERLANG_JIFFY_LICENSE = MIT (core), \
+ERLANG_JIFFY_LICENSE = Apache-2.0, \
+	MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
 	BSD-3-Clause (tests)
 ERLANG_JIFFY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
