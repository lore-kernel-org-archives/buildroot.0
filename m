Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6696CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E41C82118;
	Fri,  5 Jun 2026 12:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0fld6Ut0i3X; Fri,  5 Jun 2026 12:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5024482119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663196;
	bh=fuLVARvPNzrS4C0mN2LVv/lvEV4AIc/xE4kEVLwIIio=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GpkvCTKLwn+Dqun4CScWUEDN7DkSu0XzE54ItGNHhC0f48wAQvmAjvznrRnMS2q80
	 sQ1/c6UP1QP0ZCtRpivMNY7oTT2eR++2hNQtUhVsxNzS+5mNn0h9tyenpZPhuGry37
	 WJ9QDNvUw+dHjHzMKb3eNXf0uwIUWGeSpFR+DG4KnM62uvObXWUarIYV5+AMgGWaLw
	 2y3aUO7iVqgzZTR9EyaRVbgTtldS4I7p5sD6YKfd5ElypWPOuth2McDYVaxYBPMXrx
	 jFcUFxsYZTbllJYVuuhwNUWTiCp8Je5WqhXu75nOEdzGYt5OqmXYY93fDxt7agbLEd
	 9yQeiWp4so0Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5024482119;
	Fri,  5 Jun 2026 12:39:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E36FF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F16A81FEB
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phmUX7xEUCeK for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B34681FEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B34681FEE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74B8187B3B; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:48:52 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ae710096ba890f51c5d4f8fccb8a7ff43dda3921
X-Git-Newrev: 94c6d957e36cc0735f5e88a2484bb1da427174f2
X-Patchwork-Hint: ignore
Message-Id: <20260605123836.74B8187B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: add entry for
 Shubham Chakraborty (unrar)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94c6d957e36cc0735f5e88a2484bb1da427174f2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 232f8b5ca7aee3af04632df6616aa6919bd36d0e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f3eacf182f..5de690b9db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3013,6 +3013,7 @@ N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/dos2unix/
 F:	package/pv/
+F:	package/unrar/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
