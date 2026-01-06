Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3630CEFD17
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB08060C2E;
	Tue,  6 Jan 2026 22:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KO4jRJY7_FZt; Tue,  6 Jan 2026 22:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C06A860C21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767736802;
	bh=IwfyHFt3xRCifUgw+x4A5KWlmrZD4rYs05GjeVjrpG4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E7rxYvyLJSRALpHYjWnQWzcGEp/qdR9tySLcWoIEyk4/g8rMaO/0ZOriCuC+/vy1L
	 k+3BmGW8VwcMmLXE2zQ1ySmS+EjgJ+efnDGPSBdxj5F4kTf2B3ox+6g0fKPPzMEBB/
	 TS2SgupPlk+dZ2erUxQ5JvDLr1KmKC9egsN6cZYoxd3bnoyLpm848HN2jSlqDqVpC+
	 60zy1YIMW/jlGcktBPOX/CrdaHG/rIpoMvd/SPIByCSCCFNio7wo09J8MG0tXmk9AU
	 Gv86cFlUQ3i6oLYFhevVus78rIkaoLk50wA+FaCKZL7PpD8yIS42RGmsJ2vZNMukI0
	 cvUKFb9kC694g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C06A860C21;
	Tue,  6 Jan 2026 22:00:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6468A970
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5217060C17
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMroezn3dBiX for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 21:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0A4160C13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0A4160C13
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:59:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BB8688321; Tue,  6 Jan 2026 21:59:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 22:53:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f38453f00e9f7852ad4132d2aff5a9f6f2fab684
X-Git-Newrev: 0687bdeaaeb40dd80d72b80cc7c17b03d98dbeb1
X-Patchwork-Hint: ignore
Message-Id: <20260106215958.9BB8688321@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ssdp-responder: update S50ssdpd
 (move shellcheck comment)
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

commit: https://git.buildroot.net/buildroot/commit/?id=0687bdeaaeb40dd80d72b80cc7c17b03d98dbeb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- S50ssdpd: move shellcheck comment to the line where needed

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
