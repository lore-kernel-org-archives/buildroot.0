Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2A7D29DE7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC3B98350A;
	Tue, 13 Jan 2026 19:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07c4pPUiBAvA; Tue, 13 Jan 2026 19:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E56DD83E9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333275;
	bh=fcrP2XkZ7NTTqxU3kdI9wnMlArxO39lOOyRtZmHOi+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hPyq1bYYj59QyHN2L9sOupTKm35PoOBRf1FRYbQWLmOA6YZq0OaMni/joDlQnXJIH
	 8JY07iLjecfg5fFjalpvR1uUqi9pWx+oq4aPC1ba0Hkhxrd8wL5QAFBYinO4huSiNp
	 vje8R0RmIdQaDyEoyBYguAbflYfOZwng21e0oTjXiKjt7EkV6Pj54Ivj/chHRZV1hU
	 BHWYhZzd/poBGPtqb+WK9AvkvXFAYY+RAB3RcO7Hzj5KY9Z4dDP8eXP29+8/RssN1B
	 OdAd8NPDs+PxNuUkG1mTzElaiPMh/BrVAQ7uVXHx8QhiyX5q9cqSg3VPVNMJXDmDlV
	 NXyPM1I9y72Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E56DD83E9B;
	Tue, 13 Jan 2026 19:41:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01ED61C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5010182FF9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MXRnR-JVb8A for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88DB482A29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88DB482A29
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86B348256D; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:23:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 828152362c9341b7dfe7b4bdb8e01584c424fa95
X-Git-Newrev: bb678171b47dc8bb53f2e63321505c608680abd1
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.86B348256D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/busybox: tidy up
 klogd init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb678171b47dc8bb53f2e63321505c608680abd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

* Wait for process to stop before deleting PID file, instead of fixed
  wait during restart

* Use long form options

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b91258e424e68750615b6175f8fb9404522a5bfd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/busybox/S02klogd | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/busybox/S02klogd b/package/busybox/S02klogd
index 0677e1e5ca..f76d4e72d4 100644
--- a/package/busybox/S02klogd
+++ b/package/busybox/S02klogd
@@ -13,7 +13,8 @@ KLOGD_ARGS=""
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/sbin/$DAEMON" \
 		-- -n $KLOGD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -26,20 +27,24 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
 	return "$status"
 }
 
 restart() {
 	stop
-	sleep 1
 	start
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
