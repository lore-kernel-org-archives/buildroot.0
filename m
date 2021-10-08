Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC83C4332F
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 10:48:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D9F61040
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51D9F61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A9E94018D;
	Fri,  8 Oct 2021 10:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HU93no6KEbfc; Fri,  8 Oct 2021 10:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D5E64019B;
	Fri,  8 Oct 2021 10:48:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 885B41BF5A2
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 10:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 759EB608FE
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 10:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHax-CIo2wtC for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 10:48:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B5AD6066D
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 10:48:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 24A3A93530; Fri,  8 Oct 2021 10:45:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Oct 2021 12:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c424eb25ca22d2b455eaf48580ba0484e3cf2fca
X-Git-Newrev: 0a056557051f0f085f7f8ce99a31c4ed288e800f
X-Patchwork-Hint: ignore
Message-Id: <20211008104542.24A3A93530@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: S35iptables script
 cleanups
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8701322076904697474=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8701322076904697474==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0a056557051f0f085f7f8ce99a31c4ed288e800f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch removes unneeded redirections when
calling iptables-restore and iptables-save, and
it adds the save operation to the usage help.

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptables/S35iptables | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iptables/S35iptables b/package/iptables/S35iptables
index ff3f51a2ba..a2de29d222 100644
--- a/package/iptables/S35iptables
+++ b/package/iptables/S35iptables
@@ -6,7 +6,7 @@ IPTABLES_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-	iptables-restore < /etc/iptables.conf
+	iptables-restore /etc/iptables.conf
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -36,7 +36,7 @@ restart() {
 
 save() {
 	printf 'Saving %s: ' "$DAEMON"
-	iptables-save > /etc/iptables.conf
+	iptables-save -f /etc/iptables.conf
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -53,6 +53,6 @@ case "$1" in
 		# Restart, since there is no true "reload" feature.
 		restart;;
 	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
+		echo "Usage: $0 {start|stop|restart|save|reload}"
 		exit 1
 esac

--===============8701322076904697474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8701322076904697474==--
