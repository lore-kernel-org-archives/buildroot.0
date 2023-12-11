Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60391C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 08:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0933E414E4;
	Mon, 11 Dec 2023 08:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0933E414E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZSgscrqvMtOj; Mon, 11 Dec 2023 08:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CA02414FA;
	Mon, 11 Dec 2023 08:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA02414FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0161BF3A4
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09BD161023
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09BD161023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0muQc1sl1mDr for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 08:15:02 +0000 (UTC)
Received: from 7.mo552.mail-out.ovh.net (7.mo552.mail-out.ovh.net
 [188.165.59.253])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C655260A67
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C655260A67
Received: from mxplan7.mail.ovh.net (unknown [10.109.143.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E381D2B804
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:14:59 +0000 (UTC)
Received: from logilin.fr (37.59.142.102) by DAG4EX2.mxp7.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Dec
 2023 09:14:59 +0100
X-OVh-ClientIp: 82.64.11.165
From: Christophe Blaess <christophe.blaess@logilin.fr>
To: <buildroot@buildroot.org>
Date: Mon, 11 Dec 2023 09:14:55 +0100
Message-ID: <20231211081456.1405448-2-christophe.blaess@logilin.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211081456.1405448-1-christophe.blaess@logilin.fr>
References: <20231211081456.1405448-1-christophe.blaess@logilin.fr>
MIME-Version: 1.0
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX2.mxp7.local (172.16.2.2) To DAG4EX2.mxp7.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f0e657fd-b982-4622-85f4-0b7dfc40412f
X-Ovh-Tracer-Id: 14196190454321206551
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeluddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfgtihesthekredtredttdenucfhrhhomhepvehhrhhishhtohhphhgvuceulhgrvghsshcuoegthhhrihhsthhophhhvgdrsghlrggvshhssehlohhgihhlihhnrdhfrheqnecuggftrfgrthhtvghrnhepkedujeefvdfggfegueffhedufeevtefguedvfeejleeuhfeugeegffduvedtfeeinecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgvlhhinhhugidrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvddpkedvrdeigedruddurdduieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghhrhhishhtohhphhgvrdgslhgrvghssheslhhoghhilhhinhdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00485c65e78-a1e8-480d-a0d4-274db66b4a27,
 9AF3198B505034A765FD1E5F33C94A984CDD90C4)
 smtp.auth=christophe.blaess@logilin.fr
Subject: [Buildroot] [PATCH 2/3] board/raspberrypi: Add boot config file for
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

The `config_5.txt` file is used by the Raspberry Pi bootloader.
A Raspberry Pi 5 specific DTB overlay enables the serial console
on ttyAMA0.

Signed-off-by: Christophe Blaess <christophe.blaess@logilin.fr>
---
 board/raspberrypi/config_5.txt | 21 +++++++++++++++++++++
 board/raspberrypi5             |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 board/raspberrypi/config_5.txt
 create mode 120000 board/raspberrypi5

diff --git a/board/raspberrypi/config_5.txt b/board/raspberrypi/config_5.txt
new file mode 100644
index 0000000000..23845464a7
--- /dev/null
+++ b/board/raspberrypi/config_5.txt
@@ -0,0 +1,21 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start4.elf
+fixup_file=fixup4.dat
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# Enable ttyAMA0 serial console.
+dtoverlay=uart0-pi5
+
diff --git a/board/raspberrypi5 b/board/raspberrypi5
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypi5
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
