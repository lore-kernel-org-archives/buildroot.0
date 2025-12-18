Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36ECD6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC463410AD;
	Thu, 18 Dec 2025 16:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aL2d3HXTk00q; Thu, 18 Dec 2025 16:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 534C7410A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075712;
	bh=wtAlntRz36R4hvCym6h/v23pk5BKSycu22Y05GyDoV8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=euidyn9GGz8i2Ic1BwLQDFQCe1nbYOtXvexic8rwL0AUI5njnZ5fNbeR+L/qSniN0
	 P0SZ1vuptSKAhBERDjDKfM2PDbAl4A11iwtYi8E0oVSDBOPeqmRNhpkcqEyrIwdMzI
	 MhoPFiVgyK32uxp2gxoVUbxZhp4o0OaJU1B2V3nz7vLwKRpx0L6LvIgdH7QfW5LCSE
	 J9mFZFuyh4QM6lZXSqMpJ20+K9DZIcPoM5B27QkjkoiefmMD+cKh33bG2SMIGk8Ou9
	 r9dVzMoQV0E7aDv9mZzcGqum60ewvYEBWQAM6pdmw3SUFaWQBu8Llxmjg9yIbwkpxR
	 AHRARO/INLg4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 534C7410A2;
	Thu, 18 Dec 2025 16:35:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9915431
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8B7F611AA
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3shNyrH8jlb for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB016115F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFB016115F
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE474872FB; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:55:39 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 701e9685f7effa9cbd3b4088106951b7936a84ef
X-Git-Newrev: c16034f1de34953e07c5c17c0b47d72b36d7e3c6
X-Patchwork-Hint: ignore
Message-Id: <20251218163507.BE474872FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/dependencies:
 improve error message
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

commit: https://git.buildroot.net/buildroot/commit/?id=c16034f1de34953e07c5c17c0b47d72b36d7e3c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

"Fix you PATH" not only has a typo, but isn't very clear. Turn it into
"Fix your PATH environment variable".

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/151
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f59bf34164de2bd3573f758844282a85ffb3cf3c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 2843e3c5d5..9c2aeaf23f 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -41,7 +41,7 @@ case ":${PATH:-unset}:" in
 (*" "*|*"${TAB}"*|*"${NL}"*)
 	printf "\n"
 	printf "Your PATH contains spaces, TABs, and/or newline (\\\n) characters.\n"
-	printf "This doesn't work. Fix you PATH.\n"
+	printf "This doesn't work. Fix your PATH environment variable.\n"
 	exit 1
 	;;
 esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
