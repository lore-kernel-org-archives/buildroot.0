Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6DEE7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 08:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 855BA83B69;
	Sat, 30 Sep 2023 08:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 855BA83B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBPfx-Nfjyez; Sat, 30 Sep 2023 08:25:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C72782347;
	Sat, 30 Sep 2023 08:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C72782347
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7009F1BF471
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4959F405B2
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4959F405B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ky4kvcn-isUp for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 08:25:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B95AC40180
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B95AC40180
Received: by mail.gandi.net (Postfix) with ESMTPA id 074FE4000A;
 Sat, 30 Sep 2023 08:25:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 10:25:05 +0200
Message-ID: <20230930082507.517920-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930082507.517920-1-thomas.petazzoni@bootlin.com>
References: <20230930082507.517920-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696062312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4grWAiYLqNL44yAKSOmYRViJ57cAuZVZ/8Csl8H4Bq0=;
 b=GvE+oGf1u76SraY8dwwnRSTfdVds/Jn/7xf9feXKpMmYGyC6Z8oV8N886cVb9oG+XjahuM
 b0XgJc+RZNBzxPGVxiXM7j4F9ANlZ686gkg92/volFo6g9fnNl9BvsPoudkpm8RHPViHtW
 qF/Y3A4ScGSEP/XmSDNzkZsG3NnTmxCm03n/qw7OMsDQ9ope2eN92MkNzSq11GyG0fL5Bz
 mJtV+U6JcWSgZePvSQQh5DIegwOqYnILOVP9qsRnkXUGKWfOBqACS/hdYgidHqG8NrAcL+
 fS+f6K7OEF9Y2F4F0aa+gtnHzkAyFwLOwg1ZIzqUN5JE48XoI5o2oQeuE7y4EQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GvE+oGf1
Subject: [Buildroot] [PATCH 3/3] docs/website: simplify section on Git repo
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that the snapshot tarball section is gone, the "Source code" block
has only one sub-block "Repository" which makes it look odd. So bring
the sub-block content into the parent block, and rename this parent
block "Git repository".

As this requires re-indenting the whole HTML soup, take advantage of
this to use <p>...</p> in a more correct manner.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/download.html | 78 +++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 44 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 91ad4c7547..f1c187bc90 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -116,53 +116,43 @@
   </div>
 
   <div class="panel panel-primary">
-    <div class="panel-heading">Source code</div>
+    <div class="panel-heading">Git repository</div>
     <div class="panel-body">
 
-      <div class="row">
-	<div class="col-sm-7">
-	  <div class="panel panel-success">
-	    <div class="panel-heading">Repository</div>
-	    <div class="panel-body">
-	      <P>The buildroot repository can be browsed online at
-		<a href="https://gitlab.com/buildroot.org/buildroot/">https://gitlab.com/buildroot.org/buildroot/</a>.
-		To grab a copy of the repository use</p>
-
-
-	      <div class="input-group" style="width: 100%;">
-		<input class="form-control" style="width: 85%;" id="giturl"
-		       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly></input>
-		<span class="input-group-button">
-		  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
-			  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
-		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
-		  </button>
-		</span>
-	      </div><br>
-
-	      <p>
-
-		If you are not already familiar with using Git, we recommend you visit <a
-											  href="http://git-scm.org">the Git website</a>.
-
-	      <p>
-
-		Once you've checked out a copy of the source tree, you can update your source
-		tree at any time so it is in sync with the latest and greatest by entering your
-		buildroot directory and running the command:
-
-<pre>
-git pull
-</pre>
-
-		Because you've only been granted anonymous access to the tree, you won't be
-		able to push your changes to the repo. Changes can instead be submitted for
-		inclusion by posting them to the buildroot mailing list.
-	    </div>
-	  </div>
-	</div>
+      <p>The buildroot repository can be browsed online at
+	<a href="https://gitlab.com/buildroot.org/buildroot/">https://gitlab.com/buildroot.org/buildroot/</a>.</p>
+
+      <p>To grab a copy of the repository use</p>
+
+      <div class="input-group" style="width: 100%;">
+	<input class="form-control" style="width: 85%;" id="giturl"
+	       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly></input>
+	<span class="input-group-button">
+	  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
+		  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
+	    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+	  </button>
+	</span>
+      </div><br>
+
+      <p>If you are not already familiar with using Git, we recommend
+	you visit <a href="http://git-scm.org">the Git
+	website</a>.</p>
+
+      <p>Once you've checked out a copy of the source tree, you can
+	update your source tree at any time so it is in sync with the
+	latest and greatest by entering your buildroot directory and
+	running the command:</p>
+
+      <pre>
+	git pull
+      </pre>
+
+      <p>Because you've only been granted anonymous access to the
+	tree, you won't be able to push your changes to the
+	repo. Changes can instead be submitted for inclusion by
+	posting them to the buildroot mailing list.</p>
 
-      </div>
     </div>
   </div>
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
