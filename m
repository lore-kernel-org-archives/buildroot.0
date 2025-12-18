Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700ACD6E2B1
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24641410A9;
	Thu, 18 Dec 2025 16:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KkCX1-ZYNBU; Thu, 18 Dec 2025 16:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D47A1410A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076240;
	bh=FdI6lkJiDtHvvLiK/6iYiT9kaGJpJ9HULp6xO7AWaks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G7I2RM7I6bhhvUa+hHdoR7n3UfICtLQkaL7FzpybH+zxvVzoIXH2Jk73aA7KEDRkM
	 P/wEMNHOPKYo4ukI3+QxhaBqNFYN2x1aqntw8S7DSq8eik5XZdoftihh4II/98aRpZ
	 h/YL6+hMk5SmYkN/Vxzi6BIusChx2MDK3F3dvyx45rrogJKnF+9Rxvt6nMdmefsxr0
	 LqfHfgCKezXVyV65nTbuGcj9K04swbtL0U1M1tmdtwJltqwy9T1gAUIEXatRCgMR6u
	 /p62FBIWjcFRjq1ojESmV3mck8UxHOWb4GDFMoe9oD3i8abWUCyEgXYX8boyC+iMrw
	 8D4MGQaIslyOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D47A1410A2;
	Thu, 18 Dec 2025 16:44:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B744361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1957F83E7B
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdVKDLFLPS7P for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B2D083E6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B2D083E6C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46814873D5; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:55:42 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 08d71521d3da98939ce29dc0c673a21c8dc9277f
X-Git-Newrev: 0580d6a0b1e8a0248b7f58ca33cdd7e0b4e05d3f
X-Patchwork-Hint: ignore
Message-Id: <20251218164358.46814873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/dependencies:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0580d6a0b1e8a0248b7f58ca33cdd7e0b4e05d3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
