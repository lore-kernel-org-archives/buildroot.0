Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAD1C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 08:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D739409D0;
	Mon, 11 Dec 2023 08:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D739409D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_MZjCLr2qKQ; Mon, 11 Dec 2023 08:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60DFC4093A;
	Mon, 11 Dec 2023 08:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60DFC4093A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B92AF1BF3A4
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E07B60A67
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E07B60A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5U6XQeBZpJot for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 08:11:14 +0000 (UTC)
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net
 [46.105.45.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55C8060A64
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55C8060A64
Received: from mxplan7.mail.ovh.net (unknown [10.108.1.149])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9E78C1FD59
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:03:29 +0000 (UTC)
Received: from logilin.fr (37.59.142.95) by DAG4EX2.mxp7.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Dec
 2023 09:03:28 +0100
X-OVh-ClientIp: 82.64.11.165
From: Christophe Blaess <christophe.blaess@logilin.fr>
To: <buildroot@buildroot.org>
Date: Mon, 11 Dec 2023 09:03:23 +0100
Message-ID: <20231211080323.1399694-3-christophe.blaess@logilin.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211080323.1399694-1-christophe.blaess@logilin.fr>
References: <20231211080323.1399694-1-christophe.blaess@logilin.fr>
MIME-Version: 1.0
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX1.mxp7.local (172.16.2.81) To DAG4EX2.mxp7.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e268717f-5ef6-422f-a623-940c01daa946
X-Ovh-Tracer-Id: 14001972720239596823
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeluddgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfgtihesthekredtredttdenucfhrhhomhepvehhrhhishhtohhphhgvuceulhgrvghsshcuoegthhhrihhsthhophhhvgdrsghlrggvshhssehlohhgihhlihhnrdhfrheqnecuggftrfgrthhtvghrnhepkeelkeefvdduhfeludeuueelkedvheefieduieeutedvudetgfdtvdefveelleejnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelhedpkedvrdeigedruddurdduieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghhrhhishhtohhphhgvrdgslhgrvghssheslhhoghhilhhinhdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0016c0da770-af77-4354-8b86-4737c5bd422f,
 9AF3198B505034A765FD1E5F33C94A984CDD90C4)
 smtp.auth=christophe.blaess@logilin.fr
Subject: [Buildroot] [PATCH 3/3] package/rpi-firmware: update Config.in for
 RPi 5.
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
Cc: Christophe Blaess <christophe.blaess@logilin.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The `rpi-firmware` menu entries for Raspberry Pi 4 are also
usable for Raspberry Pi 5. This patch update the menu captions and
help texts.

Signed-off-by: Christophe Blaess <christophe.blaess@logilin.fr>
---
 package/rpi-firmware/Config.in | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index a9aeaed745..ebc6379f81 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -41,27 +41,27 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB
 	  The debug set of files for versions Zero/1/2/3.
 
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	bool "rpi 4 (default)"
+	bool "rpi 4/5 (default)"
 	help
-	  The default set of files for versions 4 (standard GPU
+	  The default set of files for versions 4/5 (standard GPU
 	  features).
 
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X
-	bool "rpi 4 (extended)"
+	bool "rpi 4/5 (extended)"
 	help
-	  The extended set of files for versions 4 (additional GPU
+	  The extended set of files for versions 4/5 (additional GPU
 	  features, eg. more audio/video codecs).
 
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD
-	bool "rpi 4 (cut-down)"
+	bool "rpi 4/5 (cut-down)"
 	help
-	  The cut-down set of files for versions 4 (only features
+	  The cut-down set of files for versions 4/5 (only features
 	  required to boot a Linux kernel).
 
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
-	bool "rpi 4 (debug)"
+	bool "rpi 4/5 (debug)"
 	help
-	  The debug set of files for versions 4.
+	  The debug set of files for versions 4/5.
 
 config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
 	string "Path to a file stored as boot/config.txt"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
