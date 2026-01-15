Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621D4CCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E08740D04;
	Mon, 19 Jan 2026 09:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94OO6-AaowzE; Mon, 19 Jan 2026 09:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CEB740CEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816738;
	bh=Zm/t1djvbJYd02XOCIyIdvAVBFFG2kSAXkCg4UZZj3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cOjQs3E+aHQ6p38qcwcRwSLlRvpuXGpPNESben9SobHasfIf2t2UCCCI1bIQ3PwYu
	 e1pPqYtYNz7yZfEojcbTtu6x+X1uuaLe4Rb78/9zx6OzToWKCrt4I0ARuNmqvOQzuf
	 mIv49MlLfk7kyJe8eBLkHVIbp0C1dmgPVM4NIEBbqssjzpGrYoUyIy96vLmChyd7YY
	 zpIWE+QXuzo/IKDjU9hM57eN183IfJFgkWOABIQm7fQuWawyxTVMKcoFTWn7auT3vo
	 EoInZWbF1MpvC3t7YKjCZhHjIAsjUx7ROur+hYLct8VVMjkjVoAiVq1PPEdaUH9E9I
	 n8iRVs1Ri9YQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CEB740CEB;
	Mon, 19 Jan 2026 09:58:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB43E160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAF0681BBD
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1Zzd8BNd5zU for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C7A81BC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94C7A81BC6
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8363288679; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:14:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 87ba95a92b828f9cd20b9196203fac3b4cb05a34
X-Git-Newrev: 259d9e0102007f65c94ee8b436a8f1f02c2e3056
X-Patchwork-Hint: ignore
Message-Id: <20260119095849.8363288679@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ssdp-responder:
 update S50ssdpd (move shellcheck comment)
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

commit: https://git.buildroot.net/buildroot/commit/?id=259d9e0102007f65c94ee8b436a8f1f02c2e3056
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

- S50ssdpd: move shellcheck comment to the line where needed

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0687bdeaaeb40dd80d72b80cc7c17b03d98dbeb1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ssdp-responder/S50ssdpd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ssdp-responder/S50ssdpd b/package/ssdp-responder/S50ssdpd
index 8654de4f26..7b8106dcc8 100644
--- a/package/ssdp-responder/S50ssdpd
+++ b/package/ssdp-responder/S50ssdpd
@@ -10,9 +10,9 @@ DAEMON_ARGS=""
 # shellcheck source=/dev/null
 [ -r "$CFGFILE" ] && . "$CFGFILE"
 
-# shellcheck disable=SC2086
 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
 	if start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS; then
 		echo "OK"
 	else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
