Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A660958CA
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ukc1OQPD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC3D740937;
	Wed,  4 Nov 2026 19:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH-awfj9Yzcx; Wed,  4 Nov 2026 19:52:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 099F340939
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793821942;
	b=bbcAWyvQiaqXBxDnyi6ku9VYrxgEw0cH26XRw8W/wnudw8gK+5sh6DM8ipZuIJhjq+bd
	 l9g238HLQhM3haaQND5vdEuJ9/NhIjq8+fNrKEzKWZCLzavSI+B+j6DIIu1rum5/lG8zr
	 fWYW8no5zR6il0ZfbFvBRwSLDHkh3MQGeJVPYQJ1ZUFFVQou1fhll9H/6GRotjXeA2xyY
	 br4koCOp2fjDCFgqBeHPbRv1/N8yCwYu3BfbG5M6x4JUQ3MJMeFLKIz5UpsUrdo4zcWiv
	 AURKozfD6i53eqPUCxH9LW7rtE8cx2wU9BAZrGOjFR7+Wrr56pc8BnWyId3qJsB7bkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821942;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QtgWxzG+xgc6xorIIWxEsxsKvReHZC3HzbLRiee5xVY=;
	b=AjvsUlVqSB4+QiL6aMc7ccAeESHi8sZum72KOxpEQvYLiWlTdPjsUuq8aXWDTzKAAK3x
	 s7mLZnFknY6PUuVmDPIychM38CE7+K5pgeEjs74Q1si9BeQvEDeHsSe9vN6EkloQNk1dK
	 KR2T61lbpIX6kfnhZ6DENOHueqKE0kijixSdSJvqKamSXGqyokF63ggNq0iD7LqDJOlME
	 vBPdLeNwnMrZ6qacIuqvN6ACW8n3mKMuev9IH1a1/VpDn34eDuJ5Wrp+9UuB8eVRnp+l6
	 4MAupYU817VjqLoQgtVL9gm1IOo0WFVGMgC9j6ZpUzFjykU4CK9I7jE0WHKnlReSQbA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793821942;
	bh=QtgWxzG+xgc6xorIIWxEsxsKvReHZC3HzbLRiee5xVY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ukc1OQPDwNp21nHtDrdKSaZRjGOAHPNO/AMqLEuDBHgZcpOJY+Fl8irLggsZB32MF
	 mcIy5T7/qYzCGzlPlhUhEr+qLjlYx60Db0opD9Ht3MoluawBxwbne/InVWgBCDkRXf
	 1vsLWVbdEGg23JVl2e81qGnv6MwfssGY8DKOZAwKW+8P6pJ7aORUg0Gozj9e2LQEXE
	 4IUveIAYV4WRX/C6Bh0qoX2QpvKZUyUjwlE0Fe8U+/J84naBsO82+YUh9dNf7l8xp/
	 S9TyuOBM5UubL0VcFTshTvBkwgf+WD+4K6rftgDFnhhibxUQh9PDrd+mscAN5KmNQt
	 Hqc0/kgOk+Heg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 099F340939;
	Wed,  4 Nov 2026 19:52:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65FA49C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 539F340083
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0ZslwRxNDNL for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AE86E400B3
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE86E400B3
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE0D49DD49; Wed,  4 Nov 2026 19:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 20:46:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 445fb0d067f5675c3525982049f3bee7f017abb4
X-Git-Newrev: 0ba6700c471cc486718f67a4e258ac321b0d0a4f
X-Patchwork-Hint: ignore
Message-Id: <20261104195044.CE0D49DD49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website: fix the copy tooltip and anchor
 scrolling in buildroot.js
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0ba6700c471cc486718f67a4e258ac321b0d0a4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Show the "Copied!" tooltip of the git URL copy button using the
Bootstrap 5 API and hide it after a while, as it otherwise stays
displayed.

Also take the sticky navigation bar into account when scrolling to an
anchor, so that the target is not hidden below it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/js/buildroot.js | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index e115ca4810..3eb83d7bbf 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -69,20 +69,13 @@ function google_analytics() {
     s.parentNode.insertBefore(ga, s);
 }
 
-function showTooltip(elem, msg) {
-    elem.setAttribute('class', 'btn tooltipped tooltipped-s');
-    elem.setAttribute('aria-label', msg);
-}
-
 let clipboard = new Clipboard('.btn');
 
-$(function () {
-  $('[data-bs-toggle="tooltip"]').tooltip()
-});
-
 clipboard.on('success', function(e) {
     e.clearSelection();
-    $(e.trigger).tooltip('show');
+    let tooltip = bootstrap.Tooltip.getOrCreateInstance(e.trigger);
+    tooltip.show();
+    setTimeout(function() { tooltip.hide(); }, 1500);
 });
 
 $(function() {
@@ -92,7 +85,7 @@ $(function() {
       target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
       if (target.length) {
         $('html,body').animate({
-          scrollTop: target.offset().top
+          scrollTop: target.offset().top - $('.navbar').outerHeight()
         }, 1000);
         return false;
       }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
