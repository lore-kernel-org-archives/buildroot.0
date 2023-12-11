Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B026FC4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 08:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54409415DC;
	Mon, 11 Dec 2023 08:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54409415DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkUgAAvmSmUS; Mon, 11 Dec 2023 08:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B6C415E2;
	Mon, 11 Dec 2023 08:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B6C415E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9B0E1BF3A4
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEBB140114
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEBB140114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id js3eVLknQB0d for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 08:21:56 +0000 (UTC)
Received: from 6.mo552.mail-out.ovh.net (6.mo552.mail-out.ovh.net
 [188.165.49.222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73ADA400EF
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73ADA400EF
Received: from mxplan7.mail.ovh.net (unknown [10.108.20.180])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5E7602B635
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:03:28 +0000 (UTC)
Received: from logilin.fr (37.59.142.95) by DAG4EX2.mxp7.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Dec
 2023 09:03:27 +0100
X-OVh-ClientIp: 82.64.11.165
From: Christophe Blaess <christophe.blaess@logilin.fr>
To: <buildroot@buildroot.org>
Date: Mon, 11 Dec 2023 09:03:22 +0100
Message-ID: <20231211080323.1399694-2-christophe.blaess@logilin.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211080323.1399694-1-christophe.blaess@logilin.fr>
References: <20231211080323.1399694-1-christophe.blaess@logilin.fr>
MIME-Version: 1.0
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX1.mxp7.local (172.16.2.81) To DAG4EX2.mxp7.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 0ef25ba8-a3d0-413d-9712-53ca1b4c58cf
X-Ovh-Tracer-Id: 14001691243848094999
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeluddgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfgtihesthekredtredttdenucfhrhhomhepvehhrhhishhtohhphhgvuceulhgrvghsshcuoegthhhrihhsthhophhhvgdrsghlrggvshhssehlohhgihhlihhnrdhfrheqnecuggftrfgrthhtvghrnhepkedujeefvdfggfegueffhedufeevtefguedvfeejleeuhfeugeegffduvedtfeeinecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgvlhhinhhugidrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehpdekvddrieegrdduuddrudeiheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegthhhrihhsthhophhhvgdrsghlrggvshhssehlohhgihhlihhnrdhfrheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0016071ebcc-fc0f-4210-8cf1-1ecdefdd319e,
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
