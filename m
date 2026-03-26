Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4509510ED652
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE44416C4;
	Fri, 27 Mar 2026 10:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdqsR92hZAEB; Fri, 27 Mar 2026 10:01:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48033416D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605715;
	bh=MjBG/k4z0ejGdE7xCbCFVAYbsMg0oSD81OK1ZDkGH8A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TgcmuXCnUwDgWJ1/p1LZpyADEh3M33GagruUPCQX7HfU+Pv7VFoBBDyu4/gD2UjUK
	 G/392FaCdR3TxwSmNxW/I19OaddLNqetXrYUBsog1HJI9RM8LXmMzryxCcNb9Nq4c+
	 OntOCW2842ohJ/4Evg8skb+WjGHURZyYtvv9ftfE8JTpzBcOhbDMKWt1miyfXv3TYu
	 fSD5U4n0wz2bL2DTG9ArWXvWqf0FhXUcG9XOnX2DKUYDboTR4NfjinkE+PoNP12b9/
	 mQ65yiAEGyZaIdGn234p4v/2PWoxhd0kRANsmKEAoj/K3t1nqMTgAKVj//7mVibBqU
	 qichVc3KmFGIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48033416D6;
	Fri, 27 Mar 2026 10:01:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F7FD1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78E33416A2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMA0aspmCiWH for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B9641699
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58B9641699
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC6087FBBE; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:08:01 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: fdf1bdd0cf08a3327bcf2a8fbee879acd25c0939
X-Git-Newrev: 557e7816c2e03984bc1f877dd812648d62c8576f
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.AC6087FBBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/mpd: enforce tcp
 for options using http
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/557e7816c2e03984bc1f877dd812648d62c8576f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Prevent disabling of TCP if some option is selected that uses HTTP.

Fixes:
https://autobuild.buildroot.org/results/59b0be79b1ca1469477e7634205f3eaaebef7d5f

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ee324c5babe52ec24ee1569557b2be3509bf2830)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mpd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index d8ce930cc5..1b6815e904 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -204,6 +204,7 @@ config BR2_PACKAGE_MPD_CDIO_PARANOIA
 
 config BR2_PACKAGE_MPD_CURL
 	bool "curl"
+	select BR2_PACKAGE_MPD_TCP
 	select BR2_PACKAGE_LIBCURL
 	help
 	  Enable curl streaming (http) support.
@@ -258,6 +259,7 @@ config BR2_PACKAGE_MPD_AO
 
 config BR2_PACKAGE_MPD_HTTPD_OUTPUT
 	bool "httpd output"
+	select BR2_PACKAGE_MPD_TCP
 	help
 	  Enable httpd output support.
 
@@ -341,6 +343,7 @@ comment "io_uring support needs a toolchain w/ headers >= 5.1"
 
 config BR2_PACKAGE_MPD_LIBMPDCLIENT
 	bool "libmpdclient"
+	select BR2_PACKAGE_MPD_TCP
 	select BR2_PACKAGE_LIBMPDCLIENT
 	help
 	  Enable libmpdclient support.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
