Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4A2C3ABD2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 09:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2428E40572;
	Tue, 17 Sep 2024 09:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjtfyDcO5AtO; Tue, 17 Sep 2024 09:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E603A4058B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E603A4058B;
	Tue, 17 Sep 2024 09:28:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E660C1BF2A9
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 09:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E26A36146E
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 09:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8BtuZbZzGvM for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 09:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C355B6078E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C355B6078E
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 09:28:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADF56839A5; Tue, 17 Sep 2024 09:28:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 11:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e783314d7299c0d1627f0aa650506133ed9cb4a
X-Git-Newrev: 06397d26a0cef5ddce0b04919acac8f4d63dacbf
X-Patchwork-Hint: ignore
Message-Id: <20240917092810.ADF56839A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/docs.html: use HTTPS for
 nightly.buildroot.org links
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=06397d26a0cef5ddce0b04919acac8f4d63dacbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Browsers nowadays complain about HTTP downloads (E.G. manual.pdf) from a
site served over HTTPS, so also use HTTPS for the nightly.buildroot.org
manual links.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/docs.html | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index 85b005004d..ee3eb3d065 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -26,7 +26,7 @@
 
 	  <h3>HTML <br>
 	    <a href="/manual.html">Stable</a> |
-	    <a href="http://nightly.buildroot.org/manual.html">Nightly</a>
+	    <a href="https://nightly.buildroot.org/manual.html">Nightly</a>
 	  </h3>
 
 	</div>
@@ -45,7 +45,7 @@
 
 	  <h3>PDF <br>
 	    <a href="/downloads/manual/manual.pdf">Stable</a> |
-	    <a href="http://nightly.buildroot.org/manual.pdf">Nightly</a>
+	    <a href="https://nightly.buildroot.org/manual.pdf">Nightly</a>
 	  </h3>
 
 	</div>
@@ -64,7 +64,7 @@
 
 	  <h3>ASCII <br>
 	    <a href="/downloads/manual/manual.text">Stable</a> |
-	    <a href="http://nightly.buildroot.org/manual.text">Nightly</a>
+	    <a href="https://nightly.buildroot.org/manual.text">Nightly</a>
 	  </h3>
 
 	</div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
