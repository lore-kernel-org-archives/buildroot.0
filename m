Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A9F606C58C
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qcnkx00S
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45C24607AC;
	Wed,  4 Nov 2026 19:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4_jw7CdnF6v; Wed,  4 Nov 2026 19:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A860607D5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793821945;
	b=A2oVtS/xu6uiSC46JX7JahwHwbO0TWByOudT9jX9XslSfQe+TQU9x/McDf1Ld8EwbQMl
	 i0v5uk3Kek+MyAGrVkvTcoAXB6NlEyQ9PNB8yTX1K+lCicwcqkbJyoEh9j1N3Iu0QEVdD
	 ODLYH3aXW845XcUaLeFWqsJBbvHEnhJ193V+W0o8WLxgyxvFqjjPRi59xz84YbELACYKX
	 SpyiAzAlKHNpNT2hzKXC0LxNaouMqcfTb7Y8MfJTQLvkss5ai5cPSlllXLlbcG2xsfJvk
	 pbBW921FySUYaZuJ3oQMn++vi8J65ypd/AoppD4911Z84vcsbygy7wMPxGoZyVyg5ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821945;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yQ1eorODJktihuiSLYveSvq9/PqvMHVswq/Xm6g7FSQ=;
	b=gaocWjSSr8wBhV2oY6KyJsspBwbKhJkZtJnq08b4+HX8xwrsorqUU55FiLaGt/CyuGyu
	 FcZtmEMOm3pQuCacEzY7gCR9u4XwxdPnfK2NdPJ+lET7doNBoAd7m8PbNmjo1Nse0Fo1M
	 KlLszam0itT4Q7SiZzYPbN38PRxT481fOVDi7jaLaSpBGgehhEVTFvPNtwwhXS830aL7+
	 aI7OBxncyFUg9x9b3s/gtU6vHaevOdZe7RgZtjckaozY8Qf7ovtaW0hmsu6epPNEFY0Ly
	 YS4rOLLZDXwDwYBKxnizt3A61RdM2gJ8RhcCtY6LJXaSa6wLpCdz4BON27Y143ptGpw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793821945;
	bh=yQ1eorODJktihuiSLYveSvq9/PqvMHVswq/Xm6g7FSQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qcnkx00S9UHG/R7ys1oCt47HPIwyRiLNVsVpiw+TLg+bE12RDjuJQuiPUX+pE72j7
	 eevyNXCjtFq+YEWFa3bjY/J57P0mmP0JW9Exb9w2IX2p3FT3jCSO16JYYopa/ejp77
	 T9nhmP9yzBchcykd0uU5n1Zct4O8ZkKK+t6lBj8V5xnh6P+diSkUn3K32HE0GgKh9j
	 GUQ6ExAzT5cCf/ADlZZurGYdJy1ZvLL1s1ITrF7ny2tZah8xSR7Phdno5fhllw4stY
	 bHqV3DVKRvML8Id0LAvbOtiKxyJybKyiUHTKHlQN0Z5M3JZkoqoXchm14u8AK4VMK5
	 JkMDl3pbOMfQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A860607D5;
	Wed,  4 Nov 2026 19:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84F819C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76E56813C9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rzb8yjpJybKG for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 96610813C5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96610813C5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C08789DD98; Wed,  4 Nov 2026 19:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 20:45:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e4e0086b2656fdc899a05ed3eb396a594042a14
X-Git-Newrev: 445fb0d067f5675c3525982049f3bee7f017abb4
X-Patchwork-Hint: ignore
Message-Id: <20261104195044.C08789DD98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website: fix the recent activity in
 buildroot.js
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/445fb0d067f5675c3525982049f3bee7f017abb4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The recent activity code is broken: commit notifications are not sent
anymore to the mailing list, so the feed never contains "git commit"
entries. This leaves the container variable undefined and the script
fails on every page, so the recent discussions are not displayed
either.

Rework it:
- load the recent commits from the GitLab API
- parse the mailing list Atom feed directly as XML, which allows
  dropping the x2js dependency
- only load the activity on pages having the matching containers

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/css/main.css    | 10 -----
 docs/website/footer.html     |  1 -
 docs/website/index.html      |  4 +-
 docs/website/js/buildroot.js | 88 ++++++++++++++++++++++++--------------------
 4 files changed, 50 insertions(+), 53 deletions(-)

diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index 28d13d2fa3..ca11d11d45 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -82,13 +82,3 @@ a {
 	-ms-filter: "FlipH";
 }
 
-.ellipsis p {
-	margin-bottom: 10px;
-	white-space: nowrap;
-	overflow: hidden;
-	text-overflow: ellipsis;
-}
-
-.panel-box p {
-	height: 1.5em;
-}
diff --git a/docs/website/footer.html b/docs/website/footer.html
index d9f4f75196..ee0a6d0c20 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,7 +1,6 @@
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.0/jquery.min.js" integrity="sha512-8LENNbXmzI/Gbj+OwXmqR6V4QaUAw0/porPzy1+dQoJqC0JPHedWoe0DDOTL2uHA5XXJyIsPtiMHH86pVlay6A==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js" integrity="sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfhrbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
-	<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha256-RbFvov4fXA9DW/RzOAcIC0ZHIDmghGdsoug5slJHMMI=" crossorigin="anonymous"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
 
 	<div style="text-align: center">
diff --git a/docs/website/index.html b/docs/website/index.html
index 17bf092abb..c1a5d90483 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -154,14 +154,14 @@
     <div class="col-sm-6">
       <div class="card mb-4">
 	<div class="card-header text-bg-primary rounded-top"><a class="link-light" href="https://gitlab.com/buildroot.org/buildroot/">Recent commits</a></div>
-	<div class="panel-box card-body ellipsis" id="commit-activity">
+	<div class="card-body pb-2" id="commit-activity">
 	</div>
       </div>
     </div>
     <div class="col-sm-6" >
       <div class="card mb-4">
 	<div class="card-header text-bg-primary rounded-top"><a class="link-light" href="https://lore.kernel.org/buildroot/">Recent discussions</a></div>
-	<div class="panel-box card-body ellipsis" id="mailing-list-activity">
+	<div class="card-body pb-2" id="mailing-list-activity">
 	</div>
       </div>
     </div>
diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 9b2d8e1f89..e115ca4810 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -1,51 +1,58 @@
-function display_activity(result, activity) {
-    let loaded = 0;
-    let nb_display = 8;
-    let container;
-    if (result==null) return;
-    for (let i = 0; i < result.feed.entry.length; i++) {
-        let entry = result.feed.entry[i];
-        if (activity==="commit" && entry.title.toString().indexOf("git commit") !== -1) {
-            container = document.getElementById("commit-activity");
-        } else if (activity==="mailing-list" && entry.title.toString().indexOf("git commit") === -1) {
-            container = document.getElementById("mailing-list-activity");
-        } else {
-            continue;
+const NB_ACTIVITY = 8;
+
+function display_activity(container, items) {
+    if (container == null) return;
+    for (let i = 0; i < NB_ACTIVITY; i++) {
+        let p = document.createElement("p");
+        p.className = "text-truncate mb-2";
+        p.textContent = "\u00a0";
+        if (i < items.length) {
+            p.textContent = "";
+            let link = document.createElement("a");
+            let d = new Date(items[i].date);
+            link.textContent = '[' + d.toLocaleDateString() + '] ' + items[i].title;
+            link.title = items[i].title;
+            link.href = items[i].url;
+            p.appendChild(link);
         }
-        loaded += 1
-        if (loaded > nb_display)
-            break;
-        let div = document.createElement("p");
-        let link = document.createElement("a");
-        let d = new Date(entry.updated);
-        let data = '[' + d.toLocaleDateString() + '] ' + entry.title;
-        data = data.replace("Re: ","");
-        data = data.replace("[Buildroot] ","");
-        let text = document.createTextNode(data);
-        link.appendChild(text);
-        link.title = entry.title;
-        link.href = entry.link._href;
-        div.appendChild(link);
-        container.appendChild(div);
-    }
-    for (let i = 0; i < (nb_display - loaded); i++) {
-        container.appendChild(document.createElement("p"));
+        container.appendChild(p);
     }
 }
 
-function load_activity(feedurl) {
+function load_commit_activity(apiurl) {
+    let container = document.getElementById("commit-activity");
+    if (container == null) return;
     $.ajax({
-      url: feedurl
+        url: apiurl,
+        dataType: "json"
     })
-    .done(function(data){
-        let x2js = new X2JS();
-        let result = x2js.xml_str2json(data.documentElement.outerHTML);
-        display_activity(result, "commit");
-        display_activity(result, "mailing-list");
+    .done(function(commits) {
+        display_activity(container, commits.map(function(c) {
+            return { date: c.committed_date, title: c.title, url: c.web_url };
+        }));
     });
 }
 
-
+function load_mailing_list_activity(feedurl) {
+    let container = document.getElementById("mailing-list-activity");
+    if (container == null) return;
+    $.ajax({
+        url: feedurl,
+        dataType: "xml"
+    })
+    .done(function(feed) {
+        let items = [];
+        $(feed).find("entry").slice(0, NB_ACTIVITY).each(function() {
+            let title = $(this).children("title").text();
+            items.push({
+                date: $(this).children("updated").text(),
+                title: title.replace("Re: ", "").replace("[Buildroot] ", ""),
+                url: $(this).children("link").attr("href")
+            });
+        });
+        display_activity(container, items);
+    });
+}
 
 function google_analytics() {
     let _gaq = _gaq || [];
@@ -99,7 +106,8 @@ jQuery(document).ready(function($) {
     url = url.split(/[\\/]/).pop();
     $('.navbar-nav a.nav-link[href="/' + url + '"]').addClass('active bg-light');
 
-    load_activity("/new.atom");
+    load_commit_activity("https://gitlab.com/api/v4/projects/buildroot.org%2Fbuildroot/repository/commits?ref_name=master&per_page=" + NB_ACTIVITY);
+    load_mailing_list_activity("/new.atom");
 
     $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://bootlin.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
 });
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
