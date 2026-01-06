Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1952CEFD16
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F72B40935;
	Tue,  6 Jan 2026 22:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WM6tBffCTYO2; Tue,  6 Jan 2026 22:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9988840936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767736804;
	bh=7Iolb3SkMD9TTg152fB0dhb3FHL5qywOrxz+L+KWBno=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LLyX8y/qdtWuw2g5C/wuEXLpM34zsPUCJPp09hbma/xy/4ToVsRh0WBEF5TfrUJdD
	 KWWvCVFD/M+AOkFmrrPW2+1yck4N5Sd+kMZx66WX63Kz8ROZX4q5eoBXBScgWfjoBn
	 6sKk45RUR+gZPk0Q11mK3i+ncZT2A7t3G/HDdtxg5lCGHuDatortZHu7D9X4azzqDY
	 tKe2RrI21g6uWlr6WL8bmXI2zoq6AvvjmHZTd4hQjX4TAiYIGoUW9C34gkIq15HJo3
	 nYcbdEPt9wB/hS6UMQAep/GK46ZMAnEzgs8BJRvJd0kqMQykXUMRHNRhRxaS8syT+O
	 kZwhH8KXthIew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9988840936;
	Tue,  6 Jan 2026 22:00:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B5D9A3E
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A2AE40107
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJLfpE5dVNUE for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 21:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F317400E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F317400E3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:59:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A9D3882F8; Tue,  6 Jan 2026 21:59:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 22:53:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdc6981e42d6d1a1a095da69091ec0a5cf720dcc
X-Git-Newrev: 58a19f3240e765e4c8fc60d830fe67e48989c054
X-Patchwork-Hint: ignore
Message-Id: <20260106215958.7A9D3882F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: update S40iwd (use long
 options)
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

commit: https://git.buildroot.net/buildroot/commit/?id=58a19f3240e765e4c8fc60d830fe67e48989c054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- use long options (as suggested in [1] example)
- drop '-q'/quiet option from startup

[1] https://nightly.buildroot.org/#adding-packages-start-script

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iwd/S40iwd | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index 7858ff3e42..de5a1efb6f 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -10,7 +10,8 @@ IWD_ARGS=""
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	mkdir -p /tmp/iwd/hotspot
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/libexec/$DAEMON" \
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/libexec/$DAEMON" \
 		-- $IWD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -23,7 +24,7 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
+	start-stop-daemon --stop --quiet --pidfile "$PIDFILE"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
