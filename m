Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F72C55184
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 10:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DECFA4185D;
	Fri, 20 Feb 2026 10:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPjl0Rud0Y1h; Fri, 20 Feb 2026 10:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 600E941841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771582253;
	bh=+yfiv93vIeObsCZiNeu3wf1ADoyN4PiLwKyIkMd5CBg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z+4dN0haluseLj7P6IornXe2/oFShXQjhORy+1Vq9oXideMcQaMZYts0d0hK4FaTE
	 /OqF8+g73AlCcK5MnSWsEP753HeEeq0t8yIgBqFBxpzKs/bRUl53NW7/qeWAq7Gk4X
	 lF9Uv9ihvmTV4s96SCxYwvAV7j8NBaj34txbIG3GMgrtNApkf3ahcyzm5ySm3H+bpI
	 foBxQ+IAGRHqkZUeEXM+F5+PScR1FLv+NZE50LY86cOtSiF6809WwoabnKrmbihqCb
	 78v2sfXu0/1ot96EjIzNLj8usbjEoy2D6qjl1frMF6bdVNEEu47fXBMc7Jxzn9YN7h
	 OmjiHP6YBcgEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 600E941841;
	Fri, 20 Feb 2026 10:10:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9382206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 10:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACE2983E0B
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 10:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ou1vdD6Pilj for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 10:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 897A083E09
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 897A083E09
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 10:10:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77A518705B; Fri, 20 Feb 2026 10:10:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 11:10:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ea50235a2ead1f65fcb8069fdc8a606bd45c3e4
X-Git-Newrev: 47eced3d05ada115f6cfdd5797eb70488b6f3ab5
X-Patchwork-Hint: ignore
Message-Id: <20260220101050.77A518705B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/download.html: correct 2025.02.11
 / 2026.02-rc1 entries
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47eced3d05ada115f6cfdd5797eb70488b6f3ab5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 2026.02-rc1 release forgot to update the series and date and the
2025.02.11 release forgot to update the data, fix that.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 9048927bda..e80fc11c34 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -18,7 +18,7 @@
         </tr>
         <tr>
           <th>Candidate</th>
-          <th>2025.11.x</th>
+          <th>2026.02.x</th>
           <td>June 2026</td>
           <td>
             2026.02-rc1<br/>
@@ -26,7 +26,7 @@
               Changelog
             </a>
           </td>
-          <td>2025-11-20</td>
+          <td>2026-02-17</td>
           <td>
             <a href="/downloads/buildroot-2026.02-rc1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -77,7 +77,7 @@
               Changelog
             </a>
           </td>
-          <td>2026-01-20</td>
+          <td>2026-02-20</td>
           <td>
             <a href="/downloads/buildroot-2025.02.11.tar.gz">
               <img src="images/zip.png" width="24" alt="">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
