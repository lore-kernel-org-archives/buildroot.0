Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6977310AB81D
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 20:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6416F60EED;
	Thu, 26 Mar 2026 20:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzYL_L1NPCew; Thu, 26 Mar 2026 20:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C75960E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774555276;
	bh=DeJaLqgESHqkJNdUKA9nVJzyVrY0TFWCE0wxSbZX7is=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DboV3SnSx4lKBsxpBMvZFGE7UgGj6j1x9hjDAuwhMGoH6Ak5pvOj3nzvbBd9cJTFF
	 5oCcNoq9IFAYjncwI+H0StFMW4Nco05ee1xOZ/9PYPxLjC5QV4W2CwLMPMrA84nkBH
	 BqYPMwp5k3KA/9elunTEQZ7jdD2RQXxdKGJkw3F5Q0ykyLfETYnM97v3Iq9ErAqrFr
	 Z+z3RQ5vdHZvuJvvK4EF7NaWrNksy9J7Fvm0DXzkhBJdFPDSBxrCPKlJaBlDoY9RoB
	 PAF2cFrlO/pXh54q/qj05db4AvdIXIBxYBnZT/eSrbx5UQzw7C0iiSCe6LkyTZlz6o
	 XEq86OSMLWlZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C75960E9D;
	Thu, 26 Mar 2026 20:01:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B31473A5
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 996A7810CE
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dx91SvhLEUzI for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 20:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 912FC810CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 912FC810CC
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC0C47FA66; Thu, 26 Mar 2026 20:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 20:36:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a2037d2b812da16965e29d32f64430312a74c60
X-Git-Newrev: b20972e0dfc09f4446d4856f0a29bcbc113c8749
X-Patchwork-Hint: ignore
Message-Id: <20260326200109.DC0C47FA66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/sponsors.html: move sense to past
 sponsor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b20972e0dfc09f4446d4856f0a29bcbc113c8749
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Sense is no longer sponsoring LTS for the year 2026.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/sponsors.html | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index c15802257e..f7ccbbedd5 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -43,30 +43,11 @@
 	      <div class="sponsor-body">
 		<a href="https://www.openhomefoundation.org">Open Home
 		Foundation</a>
-	    </div>
-	  </div>
-	</div>
-    </div>
-
-    </div>
-    <div class="panel-body">
-      <h3>Bronze Sponsors</h3>
-      <div class="sponsors-container">
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-lts-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://www.sense.com">
-		  <img class="img-responsive center-block" style="width: 100%;" src="images/sense-logo.png"/>
-		</a>
-	      </div>
-	      <div class="sponsor-body">
-		<a href="https://www.sense.com">Sense Labs</a>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-      </div>
+
     </div>
     </div>
 
@@ -140,6 +121,23 @@
 	various companies, that we would like to thank below.</p>
 
       <div class="sponsors-container">
+
+	<div class="sponsor-entry">
+	  <div class="panel panel-default panel-lts-sponsor">
+	    <div class="panel-body">
+	      <div class="sponsor-title">
+		<a href="https://www.sense.com">
+		  <img class="img-responsive" src="images/sense-logo.png"/>
+		</a>
+	      </div>
+	      <div class="sponsor-body">
+		<a href="https://www.sense.com">Sense Labs</a> sponsored the
+		LTS maintenance in 2025.
+	      </div>
+	    </div>
+	  </div>
+	</div>
+
 	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
