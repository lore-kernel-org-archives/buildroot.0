Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48603EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B9B84664;
	Fri, 13 Feb 2026 19:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qs9qEUrs5Icn; Fri, 13 Feb 2026 19:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DAAD84660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011396;
	bh=zf/WJeTjE/QIJ+arNyXLY6VGFzW1SVd/hbdENAP3ViU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GctrzcFTUcUNgb15l9onMfT/LkD+4+yEHejiaTg5cBSRpka2FUQEWlG+nRfF19FaK
	 ujNE4ShOa/0+tHzkesQZGKmDi9zNGoH01oahpC1JwiMa7IYOMOCflwUFprXLyuKC7h
	 YcswPcoDzGh9525GRaCLaPuu2zdDH3xafTgjIg5LRmj8Xa77tePCvxpMOmxPz2gw4U
	 P+UckFdj9PT0JCdzqaeERU00Givn3L4Dbu+MgOq1YV5FfXQI8P47MY8oc+e8PoQUnu
	 S/xLk5zDy5uVoqDmsMc3Kl1Y4dJsGzIpkViidxl5U0XJ0toCQK+RHCvVnsOvtLdR84
	 Fex6Nbb6/iY5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DAAD84660;
	Fri, 13 Feb 2026 19:36:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F19EEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D619C41E32
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oZlrglsztFs for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31ED141E3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31ED141E3F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26E0383A48; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:20 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b70b6a5ac46570e6afa73a0c66eba75300f64e20
X-Git-Newrev: 8dc1732b6f790fbcc0d3e3be8a66912ae2c3ddba
X-Patchwork-Hint: ignore
Message-Id: <20260213193530.26E0383A48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/swig:
 swig-wrapper.in: handle symlinks
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8dc1732b6f790fbcc0d3e3be8a66912ae2c3ddba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes https://autobuild.buildroot.net/results/e656684298b0462f8044667e7384c64d6508f22f/

Use realpath when constructing the path to the real swig so the wrapper
works even if it is called through a symlink (E.G. the swig<version>
symlinks).

Reported-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2b3b25a7dcfb4d0dbd99cadd8d898e3b7ecc790f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/swig/swig-wrapper.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
index 61c885fc90..e6cf2df134 100644
--- a/package/swig/swig-wrapper.in
+++ b/package/swig/swig-wrapper.in
@@ -5,4 +5,4 @@ if [ -z "${SWIG_LIB}" ]; then
     export SWIG_LIB="${0%/*}/../share/swig/@SWIG_VERSION@"
 fi
 
-exec "${0}.br_real" "$@"
+exec "$(realpath "${0}").br_real" "$@"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
