Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961BECCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6064281E0D;
	Mon, 19 Jan 2026 10:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH5kwP7gOSrV; Mon, 19 Jan 2026 10:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5CB781E54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816872;
	bh=pclJPDgl9B0PdvnzTsnpRZfwPcbQbw1wJ5+CLHx3CjY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aVxeq9sU2EvoKULoTgfOYnRZrmIfi0xKjHIhTpjPe/dM/rznJUN9SUqK5vAKny9E4
	 8YtxPJOz0QrCMDOpf9YEqwvvwH0XVx499AdRhLbnNAPlGsU03Ibt6jsGlDIZOIywhj
	 1ylsay4oLPj2D1EM6SRdcK1YDXTnMJ4kmXVkmCrKWB1mzbpwDaBjQQSjGeikOrkKE5
	 A7ocFtpDPjix5rLOxIQ84Sto5yq0cgS9Fq9u5Ju67Vn+9sUuBKfgOAwBNTXERRpECi
	 +627dH2Roh0csu6zDAhVqEw4+QVQQBRTdHXZyHZTLX8SqAmBXEF3opYy0U9yJ9xLT1
	 RBx9uLb/bEEOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5CB781E54;
	Mon, 19 Jan 2026 10:01:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47FFA2CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FDB9406D6
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GD-Q7ZALHwWl for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67D87406CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67D87406CA
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5887C885F0; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:14:05 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d0a755cfe210249e8ac086a86ae64b9dfe0c36e1
X-Git-Newrev: c4ac35c600121aeebfee87e5821140b00fa0523a
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.5887C885F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/ssdp-responder:
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4ac35c600121aeebfee87e5821140b00fa0523a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
