Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F3CC31D97
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 16:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 585B1414B9;
	Tue,  2 Jul 2024 16:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HR3hyYo489-O; Tue,  2 Jul 2024 16:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D7E1414CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D7E1414CE;
	Tue,  2 Jul 2024 16:57:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B300A1BF366
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABBBB60645
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rQWt7Eh9sYI for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 16:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D6DA60627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6DA60627
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D6DA60627
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 16:57:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.121.108]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHG8m-1sbpxl3u9w-00GU15; Tue, 02
 Jul 2024 18:57:18 +0200
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 18:57:06 +0200
Message-ID: <20240702165708.3796162-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702165708.3796162-1-fiona.klute@gmx.de>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Mk5HA21zJScQxO26g+mUvbS3G83IHqkAUE4dX4qECd5qIzZvvLI
 qc/mvqiFCPPf2JpvF49uBIkaC0j4WsSZgsyM/uA3lDS7AjKGt3zXloU59FsCO+cbw7NWOyP
 Lbx4O3mcu+Cfxrqztxy7URr3/tG92wpfHY4Qn6f/YoJaxGsg3/aKRIuJF9nrXHALf+AgYVR
 TB5+5qfoh1s82GUBr3gQg==
UI-OutboundReport: notjunk:1;M01:P0:j1B1Bwec82Y=;dj6acZbJeRmqI9XHlSOSSV3+7pR
 oJBcHPGhF6VG7uo9xLh2cqvPdd0llr5nQm2VZ93LhNsrXvk+OlQEwGvpCIm6nhfwKsytGN4Lm
 qGEs4C3Ig12ZsKdy2MUIc/yLzPDmg9D9pYYc6pU/Ag2B3wc165R/dWxpfS3gnO2B5J2eBExC6
 8rpCqJ8yIm8t7HJYUo9zz0zFNslIuFXzHUv4nGYGDAGym/lgWvxeWzTp6s8OChnTgjPoO3EYn
 EJ5XCmgR/cvgDz+cAYGnxH0r5/5At13e7k1R9bP7zy4il4RyYRz/A7E7NwpsXHgVRKAzTjKOu
 um/Ocmcfs7SAUAS20qoRA4n4+BF0gj6Jq5OEV4foMckb8xxOB2f11voo3gMAOqYi6CKeyBvaN
 JuKp9XAr0j7QfymRkBdIz6IEwuGMRCaoIm0WRJI/rmKyosPsjKiwBnRM+qfO3MMrpYm1v90ZI
 lclzzGz0HrF1HTXTxKByoQTJNCxpUth6DcTKc3GSXDmjJeFnIRcS2QEiGW/k/QOk58sxOCCxH
 JTuTra7DT8X+waWw8CZSzNq/wOr5dnnjjcsoWz524u6/uWpCObTUNsDF+ZJevndZ54Yl/EpA4
 HrE8dPvMUOavyvQUzw3EKyGts3RFfjmooem6Q1Z/0dAESbpx5B4Xli/HBdsWZJ6cDBij7TE4D
 TARbzXbyyqyyo/GwlJChHZBW5RnR2SGHpxU+DsfYd2qZb7FreL1vUsUCCLcoWYOvSQXcJbRW0
 pw1xOImQsuk5lHgUJsUUZzxYCLPuYa95ZEEV/S9wJ4BD+o2OtN/ilcFnwF2DUjBdb9gja6UOD
 pQxNcpOwl2jRswg/rsikEDbQrgb6sil/TE/95xm3CKvss=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719939438; x=1720544238; i=fiona.klute@gmx.de;
 bh=oRaevi23c0g4fJNVgLCOR9m/g9K+15izbRQR8f8nrCA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=i/5hpyzYpVzNGFgG0ytjkMiSr2iTQI/lDWrEgtp6eSKLRSXb++/25mzFlXbgmurn
 3rhKSjgXfe1M0oeflqtcd68h5W2ZeEkMEAO0ZPgjH68IV02z4HTpp7cPvxXdHuTjY
 HZg7Ao78GzA5g8etmqjlz+W5BHcg28z4jrTn9TqIcSIJDT7Tbut+yo1na6Z7kNTgY
 rDd7xaiaKHBl00TXBSPMAm6LqMMR5XgftiJFYFenKsx2MgIsD9wIF128NZrSBrceX
 +n9oNqPXghjjkV/li2kEk+Xa03Zxcmp9k2BwQ/KtIzR+OR9Pin8719GUapuS7ZyIe
 xC5GPnKJbcI4zQkuWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=i/5hpyzY
Subject: [Buildroot] [PATCH v2 2/4] package/openssh: fix init script
 indentation
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This brings the script in line with .editorconfig settings and other
newer init scripts.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .checkpackageignore     |  2 +-
 package/openssh/S50sshd | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9c4a760117..f8c00e3f9e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1150,7 +1150,7 @@ package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_pa
 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch lib_patch.Upstream
 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch lib_patch.Upstream
 package/openrc/0006-Also-create-run-lock-subsys-directory.patch lib_patch.Upstream
-package/openssh/S50sshd lib_sysv.Indent lib_sysv.Variables
+package/openssh/S50sshd lib_sysv.Variables
 package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch lib_patch.Upstream
 package/opentyrian/0001-Move-definitions-that-don-t-need-to-be-exposed-from-opl-h-to-opl-c.patch lib_patch.Upstream
 package/openvmtools/0001-no_cflags_werror.patch lib_patch.Upstream
diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index f1ff9dfec1..6ee0fc6b86 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -41,18 +41,18 @@ restart() {
 }

 case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	restart
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
 esac

 exit $?
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
