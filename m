Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D0BFA3724
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB16D60B08;
	Thu,  1 Jan 2026 21:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSzMO-J9O89W; Thu,  1 Jan 2026 21:53:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2239560B24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304385;
	bh=VcI4yY7wSxNwmxfZRjTzquMGxQ0cQA82Gev4ljgUghc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gx1wPmXsTeYA/NUKBqLi85SZw4Euxio7tp6VVax1TTV3ker8bwWfyar2p3a+H7QD+
	 OBOQykTvXvAQ+1zGf4w0BO75Er2LS2kAyY+WTFNXRQk7RzbpDgichcG48fFuk34V7I
	 X4fPTHTGjC6mpqn7nEMe/85vx4etFZNAvUPu62LtaWMYk3o90tJjfOGScDSvNzYQiy
	 ZG7S1aYoCFHYLKNgh8wDc2x2StY9uLjb78mRFqmG0p4dSqDEEvgFCTC5pdMG6ejafA
	 aTfEKpfHOXPYSVyjMugs+T2Q9uPAzdYBV5zsG8iO1oC/bW7pMsLYiezkuhsdblSd9i
	 oGpBnxicFNm6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2239560B24;
	Thu,  1 Jan 2026 21:53:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03C3C440
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF62A80F16
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1-rJSpugKhV for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0888380F19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0888380F19
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 061BA87E4C; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9038a4e06dfe3e3b6f35d31324b973111fe39b26
X-Git-Newrev: 6f226b2923a478326f56052310c59ca908402a19
X-Patchwork-Hint: ignore
Message-Id: <20260101215252.061BA87E4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/duktape: move submenu
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f226b2923a478326f56052310c59ca908402a19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the introduction of duktape in [1]. This package has been present
under the "JavaScript" sub-menu.

This sub-menu was mostly used for JS libraries and programs so duktape
should have been under the "Interpreter languages and scripting"
submenu.

Since duktape is now the only entry in the JavaScript submenu, move this
package to a better suited place and remove the JavaScript submenu.

[1] 387ff26b6d duktape: new package

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 643072b71e..5a19ef6016 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -656,6 +656,7 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/4th/Config.in"
 	source "package/chicken/Config.in"
+	source "package/duktape/Config.in"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
@@ -1866,10 +1867,6 @@ menu "Hardware handling"
 	source "package/urg/Config.in"
 endmenu
 
-menu "Javascript"
-	source "package/duktape/Config.in"
-endmenu
-
 menu "JSON/XML"
 	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
