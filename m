Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5E9C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7838180B77;
	Wed, 31 Jul 2024 16:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9MpxowXi2Qs; Wed, 31 Jul 2024 16:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8188081A8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8188081A8E;
	Wed, 31 Jul 2024 16:55:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 824441BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6A1C408A8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntYBj83KLZn0 for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49CB440E1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49CB440E1F
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3242483771; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 18:31:25 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 0aa79675651636900bfb95d6673a50ac213010cf
X-Git-Newrev: 4ec45eda0ed47458e6e667f05e9dfb9aabf3bcb4
X-Patchwork-Hint: ignore
Message-Id: <20240731165429.3242483771@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/qt5/qt5webkit:
 fix JavaScriptCore parser error
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
Content-Type: multipart/mixed; boundary="===============8093473946622205802=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8093473946622205802==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4ec45eda0ed47458e6e667f05e9dfb9aabf3bcb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

qt5webkit build currently fails with the following error:

[...] parser.rb:587:in `block in parseSequence': undefined method `=~' for an instance of Annotation (NoMethodError)
  from <internal:kernel>:187:in `loop'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:586:in `parseSequence'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:654:in `block in parseSequence'
  from <internal:kernel>:187:in `loop'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:586:in `parseSequence'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:814:in `parseData'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:818:in `parse'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:780:in `block in parseSequence'
  from <internal:kernel>:187:in `loop'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:586:in `parseSequence'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:625:in `block in parseSequence'
  from <internal:kernel>:187:in `loop'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:586:in `parseSequence'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:814:in `parseData'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/parser.rb:818:in `parse'
  from /home/alexis/src/buildroot_min/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/generate_offset_extractor.rb:68:in `<main>'

This issue is due to =~ being marked as deprecated since a few Ruby
versions, and finally removed in 3.2.0 [1]. This now breaks the build since
buildroot has moved to Ruby v3.3.0.
The corresponding fix has already been issued in upstream Webkit project
[2], but qt5webkit version tracked in buildroot does not have the
corresponding webkit version pulled. Fix this build error by bringing the upstream
patch. The patch is slightly modified (exclude part about Changelog file,
which is absent from qt5webkit)

Fixes:

  http://autobuild.buildroot.net/results/21397b110fe02e5711ecb1d35be2108221751b0a/

[1] https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/
[2] https://github.com/WebKit/WebKit/commit/c7d19a492d97f9282a546831beb918e03315f6ef

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51ef6691ac3b18c3a6738535c7ec7c9e3a401bc1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...warnings-with-newer-Ruby-versions-https-b.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/qt5/qt5webkit/0007-Offlineasm-warnings-with-newer-Ruby-versions-https-b.patch b/package/qt5/qt5webkit/0007-Offlineasm-warnings-with-newer-Ruby-versions-https-b.patch
new file mode 100644
index 0000000000..c8e339c5f8
--- /dev/null
+++ b/package/qt5/qt5webkit/0007-Offlineasm-warnings-with-newer-Ruby-versions-https-b.patch
@@ -0,0 +1,48 @@
+From 47e03d4af292805bf304f09e34333b38a94c1789 Mon Sep 17 00:00:00 2001
+From: "aperez@igalia.com" <aperez@igalia.com>
+Date: Wed, 15 Jan 2020 22:15:38 +0000
+Subject: [PATCH] Offlineasm warnings with newer Ruby versions
+ https://bugs.webkit.org/show_bug.cgi?id=206233
+
+Reviewed by Yusuke Suzuki.
+
+Avoid a warning about using Object#=~ on Annotation instances, which
+has been deprecated in Ruby 2.7.
+
+* offlineasm/parser.rb: Swap checks to prevent applying the =~ operator
+to Annotation instances, which do not define it.
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk@254637 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+Upstream: https://github.com/WebKit/WebKit/commit/c7d19a492d97f9282a546831beb918e03315f6ef
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ Source/JavaScriptCore/offlineasm/parser.rb | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Source/JavaScriptCore/offlineasm/parser.rb b/Source/JavaScriptCore/offlineasm/parser.rb
+index b4451124521f..cd1cffaec6ed 100644
+--- a/Source/JavaScriptCore/offlineasm/parser.rb
++++ b/Source/JavaScriptCore/offlineasm/parser.rb
+@@ -584,9 +584,7 @@ class Parser
+         firstCodeOrigin = @tokens[@idx].codeOrigin
+         list = []
+         loop {
+-            if (@idx == @tokens.length and not final) or (final and @tokens[@idx] =~ final)
+-                break
+-            elsif @tokens[@idx].is_a? Annotation
++            if @tokens[@idx].is_a? Annotation
+                 # This is the only place where we can encounter a global
+                 # annotation, and hence need to be able to distinguish between
+                 # them.
+@@ -600,6 +598,8 @@ class Parser
+                 list << Instruction.new(codeOrigin, annotationOpcode, [], @tokens[@idx].string)
+                 @annotation = nil
+                 @idx += 2 # Consume the newline as well.
++            elsif (@idx == @tokens.length and not final) or (final and @tokens[@idx] =~ final)
++                break
+             elsif @tokens[@idx] == "\n"
+                 # ignore
+                 @idx += 1
+-- 
+2.43.1
+

--===============8093473946622205802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8093473946622205802==--
