Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AAEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:38:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150E061165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 150E061165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1A7E40155;
	Wed, 13 Oct 2021 19:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Po7tSf3Y8YNk; Wed, 13 Oct 2021 19:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED0F640219;
	Wed, 13 Oct 2021 19:38:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 143D91BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0393340800
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hPejX9jWje_g for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:38:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56B68407FC
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:38:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 99BFD95B2D; Wed, 13 Oct 2021 19:35:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:32:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7633915abb0e86599cbadbf88caef9b9884bb8fa
X-Git-Newrev: 1c10095945b2b9a0168e2a8f98a5c6a396b2c0cd
X-Patchwork-Hint: ignore
Message-Id: <20211013193533.99BFD95B2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: depend on python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c10095945b2b9a0168e2a8f98a5c6a396b2c0cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although the package claims to support both python2 and python3,
there are some places which contain python3-only code (mainly
asyncio-related).
We can try to tweak some of the files in order to make it work with
python2, but it doesn't worth the effort since python2 isn't maintained
for a long time.

Update the reverse recursive dependencies accordingly.

Fixes:
 - http://autobuild.buildroot.net/results/356c6b09566c6020dc320eb89da791581571cb7f/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-configshell-fb/Config.in | 4 ++--
 package/python-urwid/Config.in          | 1 +
 package/targetcli-fb/Config.in          | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
index 90a295fc8d..a0326e9150 100644
--- a/package/python-configshell-fb/Config.in
+++ b/package/python-configshell-fb/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	bool "python-configshell-fb"
+	depends on BR2_PACKAGE_PYTHON3 # python-urwid
 	select BR2_PACKAGE_PYTHON_PYPARSING
-	select BR2_PACKAGE_PYTHON3_READLINE if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_READLINE if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_READLINE
 	select BR2_PACKAGE_PYTHON_SIX
 	select BR2_PACKAGE_PYTHON_URWID
 	help
diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
index f584a9258d..8fd2cac694 100644
--- a/package/python-urwid/Config.in
+++ b/package/python-urwid/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_URWID
 	bool "python-urwid"
+	depends on BR2_PACAKGE_PYTHON3
 	help
 	  Urwid is a console user interface library for Python
 
diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index 24ff3145f6..04c6a1ac09 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -1,9 +1,9 @@
 comment "targetcli-fb depends on Python"
-	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
+	depends on !BR2_PACKAGE_PYTHON3
 
 config BR2_PACKAGE_TARGETCLI_FB
 	bool "targetcli-fb"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3 # python-configshell-fb
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
 	select BR2_PACKAGE_PYTHON_SIX
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
