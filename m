Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20944F483EA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9CF6078F;
	Mon, 23 Mar 2026 19:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBK0rvO--1G7; Mon, 23 Mar 2026 19:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ABE06083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295283;
	bh=c4bCF4lPBafc7T5F86iiSfAOsoh/IqhIW0LenDJV4us=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bSpqL+AX8qnrvuSaalu6xDxTyuUN8jlEPS8/HO3pb2alYbQLdwjda9brijypfK/Z8
	 mnojMbOmnhNyU0MEewpm1QTc0VWsBXDI9WInH9woyDIRs2xkc/d7asjl2GY/J6PRmL
	 gOUjWJNzMo+5+goed+qOg1PiQWgDTzykodiJu0wRaHrhNp7JGK9jqMFfHlpuHc2Y7p
	 tRfQcZ8al/cMap2Qfm6gjTErFlr79iiaglsHEKws8R1Tx1MwEFQHXwKpFy9x24b3uc
	 QhSnDESO++m3l28CitihWRPmwYNfczR5wvg4hFDEJY5C79vO140I1BhzFFol9DMItu
	 +jET3sYxUEIsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ABE06083E;
	Mon, 23 Mar 2026 19:48:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 277CC353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2551A40287
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibwhtHg-35-o for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69FAF4027F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69FAF4027F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3F5D84C4A; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 22:59:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98d42291fcb2a67ce4eee9dc747338dca63c6df5
X-Git-Newrev: ee324c5babe52ec24ee1569557b2be3509bf2830
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.C3F5D84C4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: enforce tcp for options using
 http
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee324c5babe52ec24ee1569557b2be3509bf2830
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Prevent disabling of TCP if some option is selected that uses HTTP.

Fixes:
https://autobuild.buildroot.org/results/59b0be79b1ca1469477e7634205f3eaaebef7d5f

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
