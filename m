Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E10110ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24C43416C3;
	Fri, 27 Mar 2026 10:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZN-NtMT4siX; Fri, 27 Mar 2026 10:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F83416D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605719;
	bh=qHP0X1K0xweGtVZLoqcvjdEELDHZ2TQZ3E344XNfmSQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cor0quhB8wTfAdTX/UlN2pDNiuoEsdcnFIkw2GBErXlNDUlNllkWpCjlB8XaJkZHc
	 dQ/D8ICiO5Vdyzz6nJQYbVH5gU1AtZiHV9a5oRrW9r6QcJa9zgV9r1g19oPMqVgZTs
	 004fuLT8qZbpGF61ir/AX/nc22P6Ai34+pmiIbmYOk3Eo0LqdSQki4JghsDSTsqCSz
	 BHP/xyOVOx331HDK4umreQt9+T9G2X8FLyFUBI5pjV/0JKMp2t4Y27ckx/fNDxByvk
	 01GeilFqDAlk+6+CeGv/AwtvElJYtqFEfLDNfaHL6xv/6oWTQ30SccWfr3mo7i8fpa
	 uKywJUsidcJlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F83416D5;
	Fri, 27 Mar 2026 10:01:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F365F1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81C6F405EB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcIFOUVVF0hk for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 664E540BE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 664E540BE2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B76047FBBB; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:08:03 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 557e7816c2e03984bc1f877dd812648d62c8576f
X-Git-Newrev: 4712caeeb67f292bb985973aca6bf319ff672a81
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.B76047FBBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/mpd: disable
 build of manuals
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4712caeeb67f292bb985973aca6bf319ff672a81
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The documentation feature was introduced with version 0.22, but is not
used. Instead two other options (also introduced with 0.22) control
building HTML manual and man pages. If the tools needed are not found,
the documentation build finishes silently.

Save Meson some effort by setting both options to 'false'.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e7e2050d54b9059ecc205e580b11e1fd38521dcc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mpd/mpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 94decd8460..a8e30f714c 100644
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
