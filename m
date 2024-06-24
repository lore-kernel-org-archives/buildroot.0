Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EB3C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8239F60B49;
	Mon, 24 Jun 2024 20:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzkn_CbIqE8w; Mon, 24 Jun 2024 20:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF5A60B4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF5A60B4E;
	Mon, 24 Jun 2024 20:02:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04D701BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D66E81D72
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPqHjnAOqMyF for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B4F81EA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66B4F81EA0
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 637F282B63; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:38:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e1800c7e477548117a39717c42d06c884046419
X-Git-Newrev: 1b6144a9adba4f46d6a64ac7d698bfb64359eb74
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.637F282B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: update the patches to
 be applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1b6144a9adba4f46d6a64ac7d698bfb64359eb74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libopenssl/0003-Revert-Fix-static-builds.patch | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index 149ad54fc5..b4b78c97fc 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -1,4 +1,4 @@
-From 847a7b744e31b9f57d2a3de495187db1dc0ee6d7 Mon Sep 17 00:00:00 2001
+From a048522f64dbbe90cf77aea0c3f47cccdad50742 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd@kuhls.net>
 Date: Fri, 21 Jul 2023 19:30:40 +0200
 Subject: [PATCH] Revert "Fix -static builds"
@@ -8,17 +8,19 @@ This reverts commit cfd7225fbb9507b2e443a494459bdaab5236d29d.
 Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-817209126
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Configure | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Configure b/Configure
-index 2c17f4186b..94cab4c3c4 100755
+index 2a5e58805c3b..0e8c1ce5cc74 100755
 --- a/Configure
 +++ b/Configure
-@@ -1377,10 +1377,6 @@ foreach (keys %useradd) {
- # At this point, we can forget everything about %user and %useradd,
- # because it's now all been merged into the corresponding $config entry
+@@ -1466,10 +1466,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+         unless file_name_is_absolute($config{prefix});
+ }
  
 -if (grep { $_ =~ /(?:^|\s)-static(?:\s|$)/ } @{$config{LDFLAGS}}) {
 -    disable('static', 'pic', 'threads');
@@ -27,7 +29,7 @@ index 2c17f4186b..94cab4c3c4 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1671,6 +1667,10 @@ if ($strict_warnings)
+@@ -1764,6 +1760,10 @@ if ($strict_warnings)
                  }
          }
  
@@ -39,5 +41,5 @@ index 2c17f4186b..94cab4c3c4 100755
                                ? @strict_warnings_collection
                                : ( $_ ) }
 -- 
-2.39.2
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
