Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB3BCF887F
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 22:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7807828DF;
	Thu, 20 Nov 2025 22:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOjtp_8upFIO; Thu, 20 Nov 2025 22:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F588382D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F588382D;
	Thu, 20 Nov 2025 22:13:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA3C122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DBC882690
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQfGMmRZC_gA for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 22:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C84E8237A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C84E8237A
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C65C85CC4; Thu, 20 Nov 2025 22:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 23:12:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ebf1cc2ec9d7792334840dc7481762581d7b457
X-Git-Newrev: 7c8edc1b402efcd7bba2dabfe0b3be877adaed7a
X-Patchwork-Hint: ignore
Message-Id: <20251120221348.0C65C85CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/{download,
 news}.html: update for 2025.02.8 and 2025.08.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c8edc1b402efcd7bba2dabfe0b3be877adaed7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 54 ++++++++++++----------------------------------
 docs/website/news.html     | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 40 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 5c915e64f4..0d7bc6a017 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -47,76 +47,50 @@
           <th>2025.08.x</th>
           <td>December 2025</td>
           <td>
-            2025.08.1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.1/CHANGES">
+            2025.08.2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.2/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2025-10-11</td>
-          <td>
-            <a href="/downloads/buildroot-2025.08.1.tar.gz">
-              <img src="images/zip.png" width="24" alt="">
-              .tar.gz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.08.1.tar.gz.sign">[PGP sig]</a>
-          </td>
-          <td>
-            <a href="/downloads/buildroot-2025.08.1.tar.xz">
-              <img src="images/package.png" width="24" alt="">
-              .tar.xz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.08.1.tar.xz.sign">[PGP sig]</a>
-          </td>
-        </tr>
-          <th>Stable (EOL)</th>
-          <th>2025.05.x</th>
-          <td>September 2025</td>
-          <td>
-            2025.05.3<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.3/CHANGES">
-              Changelog
-            </a>
-          </td>
-          <td>2025-10-11</td>
+          <td>2025-11-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.05.3.tar.gz">
+            <a href="/downloads/buildroot-2025.08.2.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.05.3.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.08.2.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.05.3.tar.xz">
+            <a href="/downloads/buildroot-2025.08.2.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.05.3.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.08.2.tar.xz.sign">[PGP sig]</a>
           </td>
-        </tr>
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.7<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.7/CHANGES">
+            2025.02.8<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.8/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2025-10-11</td>
+          <td>2025-11-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.7.tar.gz">
+            <a href="/downloads/buildroot-2025.02.8.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.7.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.8.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.7.tar.xz">
+            <a href="/downloads/buildroot-2025.02.8.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.7.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.8.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index c23b868e51..e6dbe51428 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,44 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.08.2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 November 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.08.2 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.08.1 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.2/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/4ec5e145-5c9e-4934-9074-32ddcfa8fbbc@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.08.2.tar.xz">2025.08.2 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.8 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 November 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.8 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.7 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.8/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/f35f9987-0ba1-4a4c-904e-85f8552f00a3@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.8.tar.xz">2025.02.8 release</a>.</p>
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
