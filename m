Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B3CD0D78D
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 13:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662326119C;
	Fri, 11 Oct 2024 13:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsafe3fT3iMi; Fri, 11 Oct 2024 13:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BC0C611A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC0C611A1;
	Fri, 11 Oct 2024 13:07:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3DF1BF859
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A9D86117E
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUMQ3Hk9P8s6 for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 13:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABCB860D77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABCB860D77
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 13:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98DB185D60; Fri, 11 Oct 2024 13:07:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 15:00:51 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: e4990b58c94ef6262b00c33f7f071d594c3d7dd3
X-Git-Newrev: 15e4ee06c3d56bceb961ac4800c67301827bc170
X-Patchwork-Hint: ignore
Message-Id: <20241011130719.98DB185D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] utils/check-package:
 require exactly 1 TAB and 2 SP on help text 1st line
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

commit: https://git.buildroot.net/buildroot/commit/?id=15e4ee06c3d56bceb961ac4800c67301827bc170
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Test that the first line starts exactly with one TAB and exactly two
spaces before the text.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f9e6d39e8e0615d3a71ea1aef9d0d1e206f4c42c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
