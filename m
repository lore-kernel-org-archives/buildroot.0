Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B875C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A647822F5;
	Fri, 26 Jun 2026 14:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0d7x2SoKKF7B; Fri, 26 Jun 2026 14:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 699C78232F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485540;
	bh=nrdbydMpyOjYa7xR40hzwPdkDZG2GhBeETLIFg+R7hA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=blcR3lISohPBQW9yntu7MdRviUNPhTaa4jZayeZP5PAsreX8fiOn79+9K+lBvl22g
	 /HG1U6f/KvfFsrQdR0UPJBPQOZ2VgGsmhI7BhbeoZBzPvdFR6fefa6RfjpFYNRssje
	 +Y1JyYbTPRo1sVx4Z+ffXovqCL4RVgUFeM77J4wtuhBTtfnGqEdZimbqsEfbxlOkRK
	 hmtmFFkzyBuYjXDcMfeWz3YaTd7vIqIoKK0dZ2dJA4SIUzIrzay4aPfHhAV/5EdYAx
	 okBpha2P6pPFyDYf9IJ394y4hIKxkbcpQiRZjJf+7otMNr6F6q8vg4gZjRMjPsPK7Y
	 AoCOMxbyvazlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 699C78232F;
	Fri, 26 Jun 2026 14:52:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88A133A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B4EF81188
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kb_n7nNwjA1n for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90DD1810E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90DD1810E9
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 910D0847A3; Fri, 26 Jun 2026 14:51:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:45:14 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 7059bb9c432883b4397d18dabb2f24ac19a1e8a1
X-Git-Newrev: eb8932bdde86363403650a2c9b14a26e3f42b234
X-Patchwork-Hint: ignore
Message-Id: <20260626145124.910D0847A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/passt: needs
 headers >= 5.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb8932bdde86363403650a2c9b14a26e3f42b234
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Upstream passt only documents runtime dependencies; and they advertise
being able to run on kernel 3.8 or later. However, they do not document
the build dependencies.

Since 2025_06_11.0293c6f, upstream requires kernel headers >= 5.9, as
they make use of linux/close_range.h, only introduced in 5.9.

Add a dependency to kernel headers, and propagate it to podman's passt
backend.

Fixes: 6a192b0d282cb85ff4272e26df082f5eacd8e3a6

Cc: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 113def36967926e6a401cf4ec3cdcdfbd6423cfd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/passt/Config.in  | 6 +++---
 package/podman/Config.in | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/passt/Config.in b/package/passt/Config.in
index a93a088670..fca1dff7c5 100644
--- a/package/passt/Config.in
+++ b/package/passt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PASST
 	bool "passt"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 	help
 	  passt: Plug A Simple Socket Transport
 	  pasta: Pack A Subtle Tap Abstraction
@@ -19,5 +19,5 @@ config BR2_PACKAGE_PASST
 
 	  https://passt.top/passt/about/
 
-comment "passt needs a toolchain w/ headers >= 5.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+comment "passt needs a toolchain w/ headers >= 5.9"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
diff --git a/package/podman/Config.in b/package/podman/Config.in
index a6554a3ddc..7884171380 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -72,11 +72,11 @@ choice
 
 config BR2_PACKAGE_PODMAN_NET_PASST
 	bool "passt/pasta"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9  # passt
 	select BR2_PACKAGE_PASST  # runtime
 
-comment "passt/pasta backend needs a toolchain w/ headers >= 5.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+comment "passt/pasta backend needs a toolchain w/ headers >= 5.9"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 
 config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
 	bool "slirp4netns"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
