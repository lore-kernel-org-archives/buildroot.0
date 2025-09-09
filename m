Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EF4CAC582
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 19:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFAA2606D9;
	Tue,  9 Sep 2025 19:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v11X0nIiuJpn; Tue,  9 Sep 2025 19:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB92D6071E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB92D6071E;
	Tue,  9 Sep 2025 19:51:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5928E1F
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 19:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B77A9400BD
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 19:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2U2VN-J16OhV for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 19:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECC6C400B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECC6C400B7
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 19:51:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E592583BAF; Tue,  9 Sep 2025 19:51:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Sep 2025 21:47:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0af159ae2b0363a90b8c5432cd4cb9bfd3476c5a
X-Git-Newrev: 7dacd0893af4730a72a1af55bcd420b557955672
X-Patchwork-Hint: ignore
Message-Id: <20250909195115.E592583BAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/{download,
 news}.html: update for 2025.02.6 and 2025.05.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7dacd0893af4730a72a1af55bcd420b557955672
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Re-introduce the 2025.05.x branch on the downloads page, which was
removed with the 2025.08 release.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 39 ++++++++++++++++++++++++++++++++-------
 docs/website/news.html     | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 7d208a9bd0..614a763951 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -69,31 +69,56 @@
             </a><br/>
             <a href="/downloads/buildroot-2025.08.tar.xz.sign">[PGP sig]</a>
           </td>
+        </tr>
+          <th>Stable</th>
+          <th>2025.05.x</th>
+          <td>September 2025</td>
+          <td>
+            2025.05.2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.2/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2025-09-09</td>
+          <td>
+            <a href="/downloads/buildroot-2025.05.2.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.05.2.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2025.05.2.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.05.2.tar.xz.sign">[PGP sig]</a>
+          </td>
         </tr>
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.5<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.5/CHANGES">
+            2025.02.6<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.6/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2025-08-11</td>
+          <td>2025-09-09</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.5.tar.gz">
+            <a href="/downloads/buildroot-2025.02.6.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.5.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.6.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.5.tar.xz">
+            <a href="/downloads/buildroot-2025.02.6.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.5.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.6.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 2c65113fb8..7276e15eca 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,44 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.05.2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 September 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.05.2 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.05.1 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.2/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/991181e1-7f83-411d-b10c-f29c4d9dfd64@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.05.2.tar.xz">2025.05.2 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.6 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 September 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.6 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.5 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.6/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/b051d400-debc-4269-975a-b2992eed8d61@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.6.tar.xz">2025.02.6 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
