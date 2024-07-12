Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C86C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3722D60724;
	Fri, 12 Jul 2024 12:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6InId-a0dnV; Fri, 12 Jul 2024 12:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F59760BBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F59760BBE;
	Fri, 12 Jul 2024 12:50:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91AE91BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B77AF417DE
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ppbH2fDGhp6 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54C24417DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C24417DC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54C24417DC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:50:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAONd-1sdV4i1fR5-002zvV; Fri, 12
 Jul 2024 14:50:11 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:49:54 +0200
Message-ID: <20240712124956.3925574-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712124956.3925574-1-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vJyvGHdztx8ELvncwaRPO5dZWI0pkomn6IbfUJX784NFhW5TJX7
 f+9Txd6UtySThQXYiUjaR7HB+chnCISeOdDJaKeD4LGhRJ9JTwpdRBBQmN9xhAJ3DlCohj5
 l36Hw2wXlO+OMhMtgVwjMyA17hIFNU/Gwd4aSwIn3JfyeiIRLh5XyRanzHnpOvJ2Vdxo5S7
 n+sMRwYp9MzctTp1Pt24A==
UI-OutboundReport: notjunk:1;M01:P0:czRKftwsMV4=;cHd1qSTJaJpBiCyiMrbLv3p64ub
 UVOzuZShKUEbUF0XhDySIgWMCq28QakHfQsHCtDx1TmBK4VQLB+vPrj3tP0OA1jebif3Rf/CI
 DqJA4DW2Wei8EUs9SL7ukXfV3z8ShN2XLwNxOrXyy5AFlzCJC+RUSf82XFHouuoz/Joqe4G3/
 VE8t99ttxyYEyr5Q9MAy6rA+us2RAnKZZaypWDrF//eaNRDNm2XIPv/aXo4JHNMHkbQu3PnXv
 x74FLQ4dYdwwftxpM5VOwuzK6Xj8peJbiK/m8l4/N7roLG+8y4ChuO4D33LJo6WEj3OmO6LF2
 nhfoIA2AhcIz/KAc18E3gYLVz2NK4elNZltxVDgt1teVkSFY8xFlDCaqGZKve0T8BA6PQEZOr
 F/zx1aQ6vACabKyOCKOuNN4iLl8v9f02UziGzE4qTr4on8wh1f6Ybv1c4+bTkFQGLl0Iai+bk
 0v74sgBdYG6n/O6AjgkdM+viKiEZPHfXgZEMrR2T1ICt3Co26+/F7ozj81etYkqCD8nzKa4Ui
 g6kpxsxnzLu7Sd8x2PqCs+k8If0Rv+NfQKvm2sXYyv2KuPatPz+YxZXegfAanKj5mvT8ul0mP
 Z677yPZg+O91xJ/lqXL+WZLkUBrqF8eSNRDpIk0KQE/nFpLqMzTHWSExOV0QyrsUWrlDutZLU
 5qACDY7L5umpf6sq85+7bvpeNBN5pIGQnn6see/Cwikq7sf2PzOS0chN+zaI9OLT3NSP67SRi
 32bLFfVtacjN77tYz3QQknCxcyrOk44UWSarpk3gR1PAr39cHwuCcrWTU2HHlmSJ8slqcfE8I
 F9I2yftWwZMwLOv22vCxGHUg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720788611; x=1721393411; i=fiona.klute@gmx.de;
 bh=JqXKISBEbG1C+wdXDMfzviniEw6OSJTFwlx+zKM5OqQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=D1MslAjG3axmI9DHh6DmSTMMljglLDyveaDeNF2XZa5GH0gPnlwKJf+fX3YVG9qu
 +CtgJi1YN9gZcy93+dYW4TUIHmAdPnse9jGcuokTHQ9FeT19OsxwTIO31/NVf0eHQ
 qmq9Sc0YpeSOts3VkByaz/mxRnYAXGxyRA9X9Pr9vS02jWBQwkqKPhD/9dEvmbKT0
 HArhRn2Y4s56m8ICzbudGyYrdMzWbbtWax0v0KlGsvKW/9QTaboZmKXQIMKw0kBBT
 B1UIHQ5H5t3ISuBAdB9eM6AHj/YEwQWKlrK64eiv5I9r8/us/7Us0gtMiKfkwkxcv
 QPCSlhbhgp12MwVhuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=D1MslAjG
Subject: [Buildroot] [PATCH v2 4/6] package/openssh: tidy up init script
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
