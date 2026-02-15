Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B12EF586C
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 09:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA3C60844;
	Sun, 15 Feb 2026 09:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hHddrO-liWM; Sun, 15 Feb 2026 09:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F03C60855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771147351;
	bh=06aTwm4mcSfU+ZrRzN266vjzvbAxAoeK+dsTX8pmj4k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oTSLgWGrlbPGr7zdtdHU6tE5OisoTbpUxQHDuslKsw/7O5Y78lhDyUsIe58fxNYFn
	 qz2qNCxYcYw6oKBwk1xcwE2wIIvzvCnMw3VoiWDsNi9X89kiEFlx1/SGhN73+WdrdN
	 0FcydH1NjHCmT8qRl5Q4k8/AdteW0o+kcnrPn0U7WGpbENP+AHgc9jrronLiaQdNjh
	 MBy425HGWGsZBde6gsLlSD4VdT9iFl0ZDYgzPbqvwInaXBimtoKHNlkvn9LXOfoJSF
	 Vxt8rYHKEv3sxFLkP3agcPfZxU+svcPYy2Mi0+0KUUUhJCvkFqns7MCltv/icOjtgx
	 sl1kEMHJ7hMew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F03C60855;
	Sun, 15 Feb 2026 09:22:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E12121EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 09:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5FD182B34
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 09:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5akt_JPrRPj for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 09:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2456882295
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2456882295
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 09:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 011FD86D77; Sun, 15 Feb 2026 09:22:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 10:16:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0433c8d02af803de90b41c42bb41bbc9f2d436ff
X-Git-Newrev: 0a24ac13074b180ffdaf547124e443fef26e7ffb
X-Patchwork-Hint: ignore
Message-Id: <20260215092229.011FD86D77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/{download,
 news}.html: fix date and url typos
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a24ac13074b180ffdaf547124e443fef26e7ffb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The Buildroot commit [1] introduced two small typos, while doing the
updates to announce new releases.

The version 2025.02.10 release date is 2026-01-20 (and not 2022).
See the original announce [2].

The 2025.02.10 archive link in news.html has also a missing dot.

This commit fixes those typo in order to fix the website.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/21dda0665e5de8ddb2a09f199679b2c4be1384fc
[2] https://lore.kernel.org/buildroot/9b9654f8-6cdd-4108-b932-79509e455148@rnout.be/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 2 +-
 docs/website/news.html     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 9078194355..6221cfe871 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -79,7 +79,7 @@
               Changelog
             </a>
           </td>
-          <td>2022-01-20</td>
+          <td>2026-01-20</td>
           <td>
             <a href="/downloads/buildroot-2025.02.10.tar.gz">
               <img src="images/zip.png" width="24" alt="">
diff --git a/docs/website/news.html b/docs/website/news.html
index 38599d66ef..00bb718940 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -42,7 +42,7 @@
 	  file for more details, read the
 	  <a href="https://lore.kernel.org/buildroot/9b9654f8-6cdd-4108-b932-79509e455148@rnout.be/T/#u">announcement</a>
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
-	  <a href="/downloads/buildroot-2025.02.10tar.xz">2025.02.10 release</a>.</p>
+	  <a href="/downloads/buildroot-2025.02.10.tar.xz">2025.02.10 release</a>.</p>
       </div>
     </div>
   </li>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
