Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD72C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F085160767;
	Tue,  4 Aug 2026 16:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zx8LMqbFL3r; Tue,  4 Aug 2026 16:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 277D16076B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785860794;
	bh=s/DaT5+qOTbgmTQx1unskdRuz7WkAixzc3nO06P8HdI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B5/c4xyj2LFqHpiN5HruH7jVcvkiNpKWiLkqcWGvN7yqZCFWIuLidP+wLEvhOcGgn
	 c3A7Rh6IuZITNz2fXMN83uhRSxZUhTSX6hfIX15TeDCNSfLU8MkRHFe2og2ulZTSqM
	 sHaEAYJQ3aXOVXZx6p0we2Z9xPzAei3TJoG9f29Q/hEeemNMIR3inyH60jc37mvXnH
	 9CssqEocldCEHhr/YhXlYluZADaqybzOVV2C0tWUHNI+6UaqeuqRiyCOM6B7ympaSQ
	 Ib0lrh6tlZDE73bml2rhkDkrH57c8kyWapZx8mlhnNRLUq+zISnZWR91SrXZKETlJW
	 MAhcd47R0lUsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 277D16076B;
	Tue,  4 Aug 2026 16:26:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87974218
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AFE780C8D
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YviJ96JDWhj9 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93C7680C8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93C7680C8B
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:26:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67F5F8BE99; Tue,  4 Aug 2026 16:25:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 18:26:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8aca1f26c103043e5a542eb5713235e760ef320c
X-Git-Newrev: c01426fe964207a60ece28704e060495731b4f91
X-Patchwork-Hint: ignore
Message-Id: <20260804162546.67F5F8BE99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librsvg: update project URL
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c01426fe964207a60ece28704e060495731b4f91
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
librsvg project on gitlab.gnome.org instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/librsvg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index d74359dfc9..9f5c2f388e 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_LIBRSVG
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
 
-	  https://wiki.gnome.org/Projects/LibRsvg
+	  https://gitlab.gnome.org/GNOME/librsvg
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
