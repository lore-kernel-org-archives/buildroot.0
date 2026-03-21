Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCEEF483E7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DF0822CA;
	Mon, 23 Mar 2026 19:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iaDgtgq-tsR; Mon, 23 Mar 2026 19:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 456EC822D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295292;
	bh=1DdQVw+ECY6mZ53+QJlytVi5EZAsW9EsGomS0FrcnuE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N73aLPXF4tOG3AuuL0HyscgczGMpyhLI+guXl9Bd+EtD0YlEm34lHk8QIxsK8nDzW
	 C1pMSxKVzDjzXz6Q7mvt8XgcpROclkyTZ0CitMXV+VSdPiNDPa0s49sRCxFMYozS9F
	 Cgiou6YfWb7aZH33YNOjhnaAJWn2t3l+x0dKDlAymwzwhePeOFkpkWIJW81qzM541/
	 K48zsPjS7C5kkPwHTjOeMiiJ1aqHTiOaAQUDn39tgScosp/vwMZlRNIJAmRS4kppxp
	 o08pqOOHIu5jkbT+Fj2tkaiO14COOjhHTDF8IzMIBvUzHZxLVFxMZgDNE6uLBXOIpM
	 ZcV6X9YNT9RBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 456EC822D0;
	Mon, 23 Mar 2026 19:48:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9878AF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EC1C40281
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDGKLXHqao5S for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E2E94007D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E2E94007D
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0F3884C70; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 22:59:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee324c5babe52ec24ee1569557b2be3509bf2830
X-Git-Newrev: e7e2050d54b9059ecc205e580b11e1fd38521dcc
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.D0F3884C70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: disable build of manuals
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7e2050d54b9059ecc205e580b11e1fd38521dcc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The documentation feature was introduced with version 0.22, but is not
used. Instead two other options (also introduced with 0.22) control
building HTML manual and man pages. If the tools needed are not found,
the documentation build finishes silently.

Save Meson some effort by setting both options to 'false'.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 3df6276a11..c8107be128 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -19,6 +19,8 @@ MPD_SELINUX_MODULES = mpd
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
 	-Ddocumentation=disabled \
+	-Dhtml_manual=false \
+	-Dmanpages=false \
 	-Dmpcdec=disabled \
 	-Dopenmpt=disabled \
 	-Dpipewire=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
