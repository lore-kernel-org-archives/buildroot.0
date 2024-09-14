Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D50AC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C911180BC9;
	Sun, 15 Sep 2024 21:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 124hqhLBoqBx; Sun, 15 Sep 2024 21:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5252814B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5252814B6;
	Sun, 15 Sep 2024 21:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8F51BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27CFF4059E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBDrZ_FRQ8VI for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23A9E405A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23A9E405A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20EB883685; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:24:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 064ddfc99742c9e8fe688faf8a9c92d4c905f455
X-Git-Newrev: f9e6d39e8e0615d3a71ea1aef9d0d1e206f4c42c
X-Patchwork-Hint: ignore
Message-Id: <20240915213637.20EB883685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: require exactly 1 TAB
 and 2 SP on help text 1st line
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f9e6d39e8e0615d3a71ea1aef9d0d1e206f4c42c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test that the first line starts exactly with one TAB and exactly two
spaces before the text.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/checkpackagelib/lib_config.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f26ca0d898..bf975d7a3b 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -154,6 +154,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
 class HelpText(_CheckFunction):
     HELP_TEXT_FORMAT = re.compile(r"^\t  .{,62}$")
+    HELP_TEXT_FORMAT_1 = re.compile(r"^\t  \S.{,61}$")
     URL_ONLY = re.compile(r"^(http|https|git)://\S*$")
 
     def before(self):
@@ -170,12 +171,18 @@ class HelpText(_CheckFunction):
             return
         if text.strip() == "help":
             self.help_text = True
+            self.help_first_line = True
             return
 
         if not self.help_text:
             return
 
-        if self.HELP_TEXT_FORMAT.match(text.rstrip()):
+        if self.help_first_line:
+            help_text_match = self.HELP_TEXT_FORMAT_1
+            self.help_first_line = False
+        else:
+            help_text_match = self.HELP_TEXT_FORMAT
+        if help_text_match.match(text.rstrip()):
             return
         if self.URL_ONLY.match(text.strip()):
             return
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
