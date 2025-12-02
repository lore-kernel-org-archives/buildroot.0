Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DF0D116F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 21:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AB406132F;
	Tue,  2 Dec 2025 21:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AluJXNem5I4; Tue,  2 Dec 2025 21:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7791D60880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764711243;
	bh=c49oxBUp4zS+AcJHUaKtASmWcH2f+zvl1hT7/g49aWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U39gZeGIL3E8xo9j1lT8xXcOF9vkMAEeU7KF+zOYTJ934+XETU4bTC3zuBenULrzz
	 qhTLgRYCx4ugTclKcJdWmrAfWIPec5cnXkx+mdy5LGFtAxA+0NgohOO6IegTPAraAk
	 ZYEti44tH8ct8XqmF6JxdTcNOA6caOW8/WRD6B3f1hzIqlp42JTRp8du2kxAurrwo4
	 +gtqwDI4tMGBzht1Zq251WCNmnxwHY4IQW5MslAkc1uksboZBQA24dB59tA+/kmHEH
	 mY/M11bzv0OKIugvvngHO2NqvTQqt+x0L2piCjL4g4rNnnkAAvLISBlC2QdZNGvroJ
	 svRmWeZ4Modyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7791D60880;
	Tue,  2 Dec 2025 21:34:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9024CE4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CE8A60880
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLPG5WKQl0mb for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 21:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD8D76083B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD8D76083B
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:34:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A2FE863E2; Tue,  2 Dec 2025 21:34:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Dec 2025 22:18:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b4ee4e72f9f0bdd8b1382bf5a2b02e3df89ea0e
X-Git-Newrev: f9f3e6ccc66cd4f2becfc29e6b2b74beaddf14e6
X-Patchwork-Hint: ignore
Message-Id: <20251202213400.9A2FE863E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats:
 check_url_status(): use HEAD requests to limit server load
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9f3e6ccc66cd4f2becfc29e6b2b74beaddf14e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gnu.org admins have been blocking the IP address of machines running
pkg-stats as the GET requests for the (many) packages with gnu.org URLs are
seen as abusive.

The resource body is not used, so use a HTTP HEAD request instead of a GET
to limit server load and bandwidth use.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cfea179458..c659acb80e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -469,7 +469,7 @@ async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
     global check_url_count
 
     try:
-        async with session.get(pkg.url) as resp:
+        async with session.head(pkg.url) as resp:
             if resp.status >= 400:
                 pkg.status['url'] = ("error", "invalid {}".format(resp.status))
                 check_url_count += 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
