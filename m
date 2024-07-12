Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27567C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5AD541940;
	Fri, 12 Jul 2024 09:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzsYDRXdiJJj; Fri, 12 Jul 2024 09:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 414214196B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 414214196B;
	Fri, 12 Jul 2024 09:48:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 158151BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E77884042
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSS1S2KHxHFl for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0A4381F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A4381F91
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0A4381F91
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:47:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1sDyDP0mCb-012oh3; Fri, 12
 Jul 2024 11:47:54 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:47:15 +0200
Message-ID: <20240712094717.2539892-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712094717.2539892-1-fiona.klute@gmx.de>
References: <20240712094717.2539892-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VhPZNGx8XxesUp6vIjCAzlBooXVk4iSEZk1mHGIJi5oyca6MPSl
 piEktkG+zJTOJZ81vHfrwV6DhPQBG9H3XIB3bJQgdqirrPB24KSqUTm4GmT/1M+L+eMQ+2S
 CaR2LjB34FHAIgwe0dJLcrSMn04PMqM/yb8T6U+mcNlzwrFu623fxF10QI2vgClMIHQCCeU
 wUDAFu/vG6GQw0OxaS7uw==
UI-OutboundReport: notjunk:1;M01:P0:fvbLD2wcjaA=;RdrRWkJax5Y/hhlZINQBE1XfOTF
 fE5wY7uep8yxQjw3zbUUrqlJJrEYGAX3GxsixpeIUEDrxcWOr7b9o3iMf8SaSiYCyQVrWO6Rw
 NPqXM7J+3vyPe0nt3CGbgAOQNmyrugNb9aC5WVw4ILHOINnwuTuEb1Tgn7J1AwNWp6l5rJMmx
 rE5J5V1uf+dj0GZUh7O+/m6ESln/rjsnWBKjBYahS3Fos8qlNtEiganTH3TBDPruUYDeI0ZuY
 YzLEzqEPqGlKuN0rtSxxNawOA1dmo734yFYU1qPrWhEhc5O8VJf1buET3ASjT5C9/NO6Ko/2G
 9MAxgesUzyu6Io82LOTO+Kx0iEcGILEjy9PlhQVshMGl1+UDbYrIjOdymwDUJOx2qlmoiLCMO
 4zmzppSWxWE5nX40INunEQKlHs9lvSg24P36McWaorRrHcSE5KW55uCnV/3yoJh9ulWyTA7P6
 z7uz1GhrHkvtBe3rXnvXj1TjVaO9hUysRD3IXyvmJWR43aNKIv35ZbUFbPkeDnl1/rveOnTFK
 eOTecKlf1MZLjVgNdlg/G+QDergz8jue8QZkQOHwK7dSdDtbSXHkuXghV4Lh9bZ9kAVvRf3Ei
 Cim8+I3S0dmYA1IpGkUu2EOllAf2yvrPrFObIQgTnrJmgrB+Ir/dMGVW/vzDO8be8a6MG/jnO
 Dr4EJKIGvYbzTOnFoX9lK01amtIn9VBaIMXMIHOtwIRHKk4y7Udkeepo7PKmJEYZH0IaYAql5
 aFlEyPW2ceMhg6cfG8T/yzDlZP4axdT5PZ+fjENh7SSGg5B+lWR51DIWwMfXJ9QejT4m2O9HX
 7XYVQWBUYTTgAahVPi246vAg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720777674; x=1721382474; i=fiona.klute@gmx.de;
 bh=JqXKISBEbG1C+wdXDMfzviniEw6OSJTFwlx+zKM5OqQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FkTM+awTBvqmQ47uSGAEP3g93fYnSOWUwxnyj1l39f4YHBq4lWsh9mSi5w1mjojo
 F1Q+9CXV5dtV/RLWXHXUYgP62oEDoK2VVGiqgOdTUNakCfxdzvBaQ/+Y/tXH8yhv1
 fCGM0uP6oc1P/o3zkkt9R8vamIpQHWKFOqYn/pkcA5sJFgr0alGZNpwWNUEMCzUWW
 OhvuTT2lfj122cGiQvKkFfYlLMRz+eumkpdHDHwNZKZ19JPLO87rQYC07iZNc56xr
 CsFyCIKZX/IMeNu9jjEa463ItF8+Exr6r3gq9kEY8xHhCHfeX+uRTo/Ogj9rdtLhI
 793I9d+Ey84abEI+Og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FkTM+awT
Subject: [Buildroot] [PATCH 4/6] package/openssh: tidy up init script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

* Use long options for start-stop-daemon

* Avoid --quiet, except for reload where the "stopping" message could
  be confusing

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/openssh/S50sshd | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index d16a7ad8fc..56db6ebff9 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -16,8 +16,8 @@ start() {
 	/usr/bin/ssh-keygen -A

 	printf "Starting %s: " "$DAEMON"
-	start-stop-daemon -S -q -p "$PIDFILE" \
-		-x "/usr/sbin/$DAEMON"
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -29,8 +29,8 @@ start() {

 stop() {
 	printf "Stopping sshd: "
-	start-stop-daemon -K -q -p "$PIDFILE" \
-		-x "/usr/sbin/$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -51,8 +51,8 @@ restart() {

 reload() {
 	printf "Reloading sshd config: "
-	start-stop-daemon -K --signal HUP -q -p "$PIDFILE" \
-		-x "/usr/sbin/$DAEMON"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
