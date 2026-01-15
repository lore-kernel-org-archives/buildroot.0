Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD28ECCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F04781E37;
	Mon, 19 Jan 2026 10:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QA6lYKQ10LgY; Mon, 19 Jan 2026 10:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E23481E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816867;
	bh=l6PooBT6s9LwFbv9iT2QoJwY94CXixkPnKXDz4wGez4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NvgrQ9o/rqwAhf93XBlYWyCjjl8Zr3D+6fiZKxzTRT1bHezR2NVWKw+qx9itIMuZ6
	 usTQ34iwNLlvG17rM5/XvM7uc4CIni9TivYPcow80Mgxkh1kcoYkQAP4iJyDFeebim
	 b5BOVLp/eGqsgKrf3OK4HBVMj5fD27IM6/RXL5O1uPtnsh5DREICj58kf92JvMk16u
	 zsD9ef4vGxF+dzID03Td5pK1wGnGqpmerpOMFVhig4Vr/6rlKJoVwa0M/+kSKvvy4h
	 HCV0OBwxBKah+mCBkpgb5sDWlL+IYc5NXUlUE+qxwMkMf2+v3JtS6hQ2bTcUEyJMf9
	 c/gEuDALf7/0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E23481E41;
	Mon, 19 Jan 2026 10:01:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2C7160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94B2540CFC
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uziFL-V_4d0 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4988F40CE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4988F40CE7
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4493B885E6; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:12:38 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 69d6fd1be521a90a97f2c7724c9a9a681f01d9e2
X-Git-Newrev: f7b4ef3d38731d6be933d16a61c11321f8cb2532
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.4493B885E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/iwd: update
 S40iwd (use long options)
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7b4ef3d38731d6be933d16a61c11321f8cb2532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

- use long options (as suggested in [1] example)
- drop '-q'/quiet option from startup

[1] https://nightly.buildroot.org/#adding-packages-start-script

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 58a19f3240e765e4c8fc60d830fe67e48989c054)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
