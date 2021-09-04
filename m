Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5BFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:48:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10AA60ED6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D10AA60ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C16607A3;
	Sat,  4 Sep 2021 20:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkfAy41RKv8u; Sat,  4 Sep 2021 20:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63BE60790;
	Sat,  4 Sep 2021 20:48:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 840401BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BBAB40460
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gh2nzrLZzrZN for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9013F40463
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:46:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2126F884AB; Sat,  4 Sep 2021 20:44:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:32:35 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 37edb86fa62fb73c40313d8438048abc402db4af
X-Git-Newrev: 28c2796c2392105ffd15d6b485d39fe184c34729
X-Patchwork-Hint: ignore
Message-Id: <20210904204450.2126F884AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/sylpheed: fix
 CVE-2021-37746
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=28c2796c2392105ffd15d6b485d39fe184c34729
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

textview_uri_security_check in textview.c in Claws Mail before 3.18.0,
and Sylpheed through 3.7.0, does not have sufficient link checks before
accepting a click.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 634dcbd50dd5cf4b25153689e61bcba45163c841)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...arden-link-checker-before-accepting-click.patch | 37 ++++++++++++++++++++++
 package/sylpheed/sylpheed.mk                       |  3 ++
 2 files changed, 40 insertions(+)

diff --git a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
new file mode 100644
index 0000000000..fe3375bc91
--- /dev/null
+++ b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
@@ -0,0 +1,37 @@
+From ac286a71ed78429e16c612161251b9ea90ccd431 Mon Sep 17 00:00:00 2001
+From: Paul <paul@claws-mail.org>
+Date: Sun, 23 May 2021 12:16:40 +0100
+Subject: [PATCH] harden link checker before accepting click
+
+[Retrieved from:
+https://git.claws-mail.org/?p=claws.git;a=commit;h=ac286a71ed78429e16c612161251b9ea90ccd431]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/textview.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/textview.c b/src/textview.c
+index 62ad46eaf..3cdf5d911 100644
+--- a/src/textview.c
++++ b/src/textview.c
+@@ -2885,7 +2885,7 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
+ 	gboolean retval = TRUE;
+ 
+ 	if (is_uri_string(uri->uri) == FALSE)
+-		return TRUE;
++		return FALSE;
+ 
+ 	visible_str = textview_get_visible_uri(textview, uri);
+ 	if (visible_str == NULL)
+@@ -2922,6 +2922,8 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
+ 		if (aval == G_ALERTALTERNATE)
+ 			retval = TRUE;
+ 	}
++	if (strlen(uri->uri) > get_uri_len(uri->uri))
++		retval = FALSE;
+ 
+ 	g_free(visible_str);
+ 
+-- 
+2.25.1
+
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 2f8a7aeff9..a7c7adade3 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -14,6 +14,9 @@ SYLPHEED_CPE_ID_VENDOR = sylpheed_project
 SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
+# 0001-harden-link-checker-before-accepting-click.patch
+SYLPHEED_IGNORE_CVES += CVE-2021-37746
+
 # Remove the -I$(includedir) from the Makefiles
 # because it refers to the host /usr/include.
 define SYLPHEED_PRECONFIGURE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
