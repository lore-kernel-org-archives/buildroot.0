Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1E610ED651
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8325A61363;
	Fri, 27 Mar 2026 09:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqoDgDYUetAC; Fri, 27 Mar 2026 09:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CE6F61339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605579;
	bh=BDtxDRU1eqY91GV8IYacscDQ3XkCyRm6OVlzsd98U9Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JyGYeaOBlBp0lLyPpPFJpMBXD6EgZZOdiSxysUipy3Wn7PdyITJK76Ik6plD/OaK+
	 0irDEiTWoHt6ISNp53ZzELRUjWNIec87KlZENR6pxUahu5MC2D4FMEvR+X8Uu52NIR
	 pfarxp3l5tRGGtKEm8qmuFkDVnRGNWu0/0F0ZlxefwVyzWfZpU+0Q2ZpPWPUYoSUTV
	 oOqRMA1oN88ZeplzmvJVkpGawNoshlXmPO6YS6Aludj8Te/epBzE0/+XfqZvguBPXg
	 q0xI06gYR36t/pZ2BbqbWTWXnhc5wObNTwd3CSWO8aQyQJ2fwLGuhgu0WivZOVRYa/
	 DItYYtfTLYfjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CE6F61339;
	Fri, 27 Mar 2026 09:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23568249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 427A683D61
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghWBLOSeZduF for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C1183D93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68C1183D93
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC9947FB68; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:35 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5fb844a9d19930a198d13882c187d100adeeb611
X-Git-Newrev: 852aebbf8724697ea502d34f28f1f683120234ec
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.BC9947FB68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mpd: disable
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/852aebbf8724697ea502d34f28f1f683120234ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 2a35157741..756b6c847a 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -19,6 +19,8 @@ MPD_SELINUX_MODULES = mpd
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
 	-Ddocumentation=disabled \
+	-Dhtml_manual=false \
+	-Dmanpages=false \
 	-Dopenmpt=disabled \
 	-Dpipewire=disabled \
 	-Dsnapcast=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
