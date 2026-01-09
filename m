Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F71D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DD683CCE;
	Tue, 13 Jan 2026 19:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlYYfKttUMM6; Tue, 13 Jan 2026 19:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E30783C5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333041;
	bh=N5VcQkVZdqdHQPc7BjLZORLX8KbT5VoNgcspWb8D8jc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gxvpzXoJC6WKSKS/KQqsYhQm/PsLQ8TO4y+Xr3sNzFnpxdj203sUhf20Pu6F/aJTs
	 JYwXkR+s+tGq2eFJefDDZEj2duvLGvP/U0xDfZL1omgAF4jYF9d/3PS36iWprNpBoo
	 gXISu3w3E1VNXCwFs7/T5VGO8I0jLCSEFloyg6PdqijpQm5J1XehbyboT8/bnDjdPX
	 U6lDm6mxwsxhkvYAud8nNsk0i4xi0DRBwe1WKS1sfzQS0svEr2J5aLq7uqYfoNSBH/
	 asAoaHngaoV1i3gl+lW7Q4QxsMGDrGXinLlNCC/4N0kTh4qdJRb8GMuePTn1q2X22M
	 vKt9v0bKMG2bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E30783C5E;
	Tue, 13 Jan 2026 19:37:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D28231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6316F82DD9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoCVRm_PFWOu for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA7782BED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAA7782BED
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E932686E71; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:19 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 12a5bd91eb11b7fcf82c9eac73655806696f9323
X-Git-Newrev: 5b550746bccb21592d18bba2c9e9bf8d0858bc6f
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.E932686E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/perl-dbd-mysql:
 update dependency comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b550746bccb21592d18bba2c9e9bf8d0858bc6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql:
drop virtual package"), we no longer have mysql as a virtual package,
and therefore perl-dbd-mysql directly selects mariadb. As part of
that, the comments related to the dependencies have not been updated
accordingly. Fix that up.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 65fcceed89baf36a0ed9290aeb1f94bf94e5c921)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/perl-dbd-mysql/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
index eff76f5b61..b430e44027 100644
--- a/package/perl-dbd-mysql/Config.in
+++ b/package/perl-dbd-mysql/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PERL_DBD_MYSQL
 	bool "perl-dbd-mysql"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_INSTALL_LIBSTDCPP # mysql
-	depends on BR2_USE_MMU # mysql
-	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	depends on BR2_INSTALL_LIBSTDCPP # mariadb
+	depends on BR2_USE_MMU # mariadb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
 	select BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_PERL_DBI # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
