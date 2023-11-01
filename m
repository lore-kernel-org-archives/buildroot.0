Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C17C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4917416E6;
	Wed,  1 Nov 2023 21:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4917416E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdgUb-7Bfhmf; Wed,  1 Nov 2023 21:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F922431C9;
	Wed,  1 Nov 2023 21:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F922431C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 136811BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D832F4EECC
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D832F4EECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bBrknDxNMtM4 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:53:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 595CF4EEC9
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 595CF4EEC9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35AE0864C6; Wed,  1 Nov 2023 21:53:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 22:53:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d8512bf04762754b2243df3d2658d75cf7f9d31
X-Git-Newrev: be9f72278f6b6826b75af4536b62743c5b37b737
X-Patchwork-Hint: ignore
Message-Id: <20231101215342.35AE0864C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .editorconfig: add editor-agnostic
 configuration
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

commit: https://git.buildroot.net/buildroot/commit/?id=be9f72278f6b6826b75af4536b62743c5b37b737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

EditorConfig [0] is an editor-agnostic configuration file, to set
preferences on how to edit text: tabs vs. spaces, tab width, indentation
size, line endings...

A large number of editors support EditorConfig, either natively [1] or
with the help of plugins [2].

Add a basic .editorconfig that provides defaults for most of the files
used by Buildroot. More can be added in the future if we can find more
matching patterns.

The values are chosen a bit arbitrarily, unless we already have a
(un)written rule about it. Notably, indentation defaults to using 4
spaces, and only a set of files for which we require TABs (Makefile,
essentially) or have already settled for TABs (Kconfig files, init
scripts...) are configured so. The traditional width of TABs is 8 char,
and we pair TAB indentation with TAB size.

Trailing spaces are usually useless, except in asciidoc source where
they can be used to force a new line without a new paragraph.

One of the limitations of .editorconfig, though, is that it matches on
filenames (e.g. *.py), not on the content (e.g. no use of mimetype, or
libmagic, or such). Still, this is enough to cover a lot of files in
Buildroot.

[0] https://editorconfig.org/
[1] https://editorconfig.org/#pre-installed
[2] https://editorconfig.org/#download

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .editorconfig | 29 +++++++++++++++++++++++++++++
 DEVELOPERS    |  1 +
 2 files changed, 30 insertions(+)

diff --git a/.editorconfig b/.editorconfig
new file mode 100644
index 0000000000..4acaf3486b
--- /dev/null
+++ b/.editorconfig
@@ -0,0 +1,29 @@
+root = true
+
+[*]
+charset = utf-8
+end_of_line = lf
+indent_style = space
+indent_size = 4
+tab_width = 8
+trim_trailing_whitespace = true
+insert_final_newline = true
+
+[DEVELOPERS]
+indent_style = tab
+indent_size = tab
+
+[{Config*.in*,linux/Config.ext.in}]
+indent_style = tab
+indent_size = tab
+
+[{Makefile*,*.mk}]
+indent_style = tab
+indent_size = tab
+
+[S{0..9}{0..9}*]
+indent_style = tab
+indent_size = tab
+
+[*.adoc]
+trim_trailing_whitespace = false
diff --git a/DEVELOPERS b/DEVELOPERS
index ca812b3ae6..e7e4a59e94 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3171,6 +3171,7 @@ F:	package/zisofs-tools/
 F:	support/download/
 
 N:	Yann E. MORIN <yann.morin@orange.com>
+F:	.editorconfig
 F:	package/gpsd/
 
 N:	Yegor Yefremov <yegorslists@googlemail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
