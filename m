Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93996C3065C
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 20:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 611F1400F5;
	Mon,  1 Jul 2024 20:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6PgfbzfWGRg; Mon,  1 Jul 2024 20:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F26641365
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F26641365;
	Mon,  1 Jul 2024 20:49:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BD0E1BF361
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25C6C413D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Qawff6T8yXj for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 20:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05B8B4019A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05B8B4019A
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 20:49:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1A628386D; Mon,  1 Jul 2024 20:49:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Jul 2024 22:47:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 720177da9cd7532f2e5e8484ff7f2cfe2a324242
X-Git-Newrev: bf24725ee3fad62c389eb3219b19cddb74044c0c
X-Patchwork-Hint: ignore
Message-Id: <20240701204926.F1A628386D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sylpheed: fix patch fuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf24725ee3fad62c389eb3219b19cddb74044c0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, sylpheed fails to build with output:

    Applying 0001-harden-link-checker-before-accepting-click.patch using patch:
    patching file src/textview.c
    Hunk #1 FAILED at 2885.
    Hunk #2 FAILED at 2922.
    2 out of 2 hunks FAILED -- saving rejects to file src/textview.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...01-harden-link-checker-before-accepting-click.patch | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
index fe3375bc91..46b4505837 100644
--- a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
+++ b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
@@ -1,4 +1,4 @@
-From ac286a71ed78429e16c612161251b9ea90ccd431 Mon Sep 17 00:00:00 2001
+From 876c54b2927e48ab6900e5e6b9395742f75e840e Mon Sep 17 00:00:00 2001
 From: Paul <paul@claws-mail.org>
 Date: Sun, 23 May 2021 12:16:40 +0100
 Subject: [PATCH] harden link checker before accepting click
@@ -6,25 +6,27 @@ Subject: [PATCH] harden link checker before accepting click
 [Retrieved from:
 https://git.claws-mail.org/?p=claws.git;a=commit;h=ac286a71ed78429e16c612161251b9ea90ccd431]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Julien: rebased patch on version 3.7.0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  src/textview.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/textview.c b/src/textview.c
-index 62ad46eaf..3cdf5d911 100644
+index e55eea9..6fbb8a1 100644
 --- a/src/textview.c
 +++ b/src/textview.c
-@@ -2885,7 +2885,7 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
+@@ -2689,7 +2689,7 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
  	gboolean retval = TRUE;
  
  	if (is_uri_string(uri->uri) == FALSE)
 -		return TRUE;
 +		return FALSE;
  
- 	visible_str = textview_get_visible_uri(textview, uri);
- 	if (visible_str == NULL)
-@@ -2922,6 +2922,8 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
- 		if (aval == G_ALERTALTERNATE)
+ 	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(textview->text));
+ 	gtk_text_buffer_get_iter_at_offset(buffer, &start_iter, uri->start);
+@@ -2725,6 +2725,8 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
+ 		if (aval == G_ALERTDEFAULT)
  			retval = TRUE;
  	}
 +	if (strlen(uri->uri) > get_uri_len(uri->uri))
@@ -33,5 +35,5 @@ index 62ad46eaf..3cdf5d911 100644
  	g_free(visible_str);
  
 -- 
-2.25.1
+2.45.2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
