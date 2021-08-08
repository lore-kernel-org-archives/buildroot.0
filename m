Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428ECC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:49:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB9060F39
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECB9060F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE50C40147;
	Sun,  8 Aug 2021 07:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMrGaFCwnUHD; Sun,  8 Aug 2021 07:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22ADE4015B;
	Sun,  8 Aug 2021 07:49:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 922D61BF5A9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DD7A401EC
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KP5YZ8pFF7HG for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 07:49:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54B81401CB
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 07:49:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3172D8D1D2; Sun,  8 Aug 2021 07:48:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 09:45:43 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 02e2100e8ee82a85eec69292898c3f7cc64d5030
X-Git-Newrev: f6a9eb795ed715df9deea085f6bd57c0eb684be4
X-Patchwork-Hint: ignore
Message-Id: <20210808074843.3172D8D1D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/fluxbox: fix
 build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f6a9eb795ed715df9deea085f6bd57c0eb684be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure with gcc 11:

util/fluxbox-remote.cc: In function 'int main(int, char**)':
util/fluxbox-remote.cc:76:32: error: ordered comparison of pointer with integer zero ('unsigned char*' and 'int')
   76 |             && text_prop.value > 0
      |                ~~~~~~~~~~~~~~~~^~~

Fixes:
 - http://autobuild.buildroot.org/results/6e718bb662aa4961ea264eb81e4b7e7b20485e30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b1fce2f871c472de1acf25ae2a663e61f4e921f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluxbox/0001-fixes-bug-1138.patch | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/fluxbox/0001-fixes-bug-1138.patch b/package/fluxbox/0001-fixes-bug-1138.patch
new file mode 100644
index 0000000000..9c02e93350
--- /dev/null
+++ b/package/fluxbox/0001-fixes-bug-1138.patch
@@ -0,0 +1,25 @@
+From 22866c4d30f5b289c429c5ca88d800200db4fc4f Mon Sep 17 00:00:00 2001
+From: John Sennesael <john@aminking.com>
+Date: Mon, 2 Nov 2015 15:14:32 -0600
+Subject: [PATCH] fixes bug #1138
+
+[Retrieved from:
+https://github.com/fluxbox/fluxbox/commit/22866c4d30f5b289c429c5ca88d800200db4fc4f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ util/fluxbox-remote.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/fluxbox-remote.cc b/util/fluxbox-remote.cc
+index 59852e6a..504015b5 100644
+--- a/util/fluxbox-remote.cc
++++ b/util/fluxbox-remote.cc
+@@ -73,7 +73,7 @@ int main(int argc, char **argv) {
+     if (strcmp(cmd, "result") == 0) {
+         XTextProperty text_prop;
+         if (XGetTextProperty(disp, root, &text_prop, atom_result) != 0
+-            && text_prop.value > 0
++            && text_prop.value != 0
+             && text_prop.nitems > 0) {
+ 
+             printf("%s", text_prop.value);
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
