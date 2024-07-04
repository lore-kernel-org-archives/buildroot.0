Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692DAC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 10:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96DCA40BB3;
	Thu,  4 Jul 2024 10:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2qRT2zoPnEi; Thu,  4 Jul 2024 10:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9593F40BB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9593F40BB6;
	Thu,  4 Jul 2024 10:17:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3F6E1BF32E
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC46240B9C
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsprNOCY1mwj for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 10:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3ABB5405F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ABB5405F5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ABB5405F5
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 10:17:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.251]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC34X-1sZSXT3QK5-00Aham; Thu, 04
 Jul 2024 12:17:02 +0200
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 12:16:30 +0200
Message-ID: <20240704101631.1860647-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704101631.1860647-1-fiona.klute@gmx.de>
References: <20240704101631.1860647-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:yZmyeBy79HErLWgwKc/k+06G1CEh43IBn4Wp5D0qrlKxzqAQROP
 foFpGauRFIG+wrDR0FbnXowNYH7kA6X2UMC5MRaNFH5+wGp6NQP4mMrmK7SQQm4bStaxWDE
 Z3Ph+ArkbtAQRKvOSvD9L/k5EYcE8CLXKuUDJD4nq+VjVRvkFLbaw37uGmlXU/93EAktF+1
 6zzrRGWOEZvrkFuEMN/5Q==
UI-OutboundReport: notjunk:1;M01:P0:E+rMMkffAcc=;2ox/QubIDdT46MNLU0Kw4d056H8
 fQZI0FcqI+rE97eb8ljX5G9vfkbRThbuC4FnwvJ/8gklR0WPuuAGspPTeOWVGhmvmkIBWXCQT
 97hgCO7+chVPcKd2iG6A8ZFxqt9xFHyiJ7vdULO81PY7YEGoD9CcNHzL8078b4X+jOyE3CV7T
 W8GIVlk5BhrVFnUacgHUYX2NKlDIvWPzRXzO+qofuIlivxdgE7E9klthYv009kCn2IrFX0eSd
 VYtcTQi+eZAsRVmIDhcqdQB5pk+liVrn+bbkxN+Bt71HRYsi30w9OAS44bFf94hM6qztlB8Km
 9bWgfAEd3b6fEDUGsUIN1NlK77EQESTyFYPoHoHNxsDppUJAUk/9M2IbWligPgV6H0BCoktZP
 tVbBw+9uW8q3Rz5wEHDa9SkHYzMnfNXpvZHah0AfDLrCMCxbooF8/eJj8TKpCQRRLmyPe5iWw
 Jgt48MeOVxvfduKw7fWyNVdiHwPZ3zPEfbgBoOps3wevymwnj6UWyyqXczQG3wqQAFUh9O7Ip
 ffZ6mJuofGRzu+H4ucuqAWzCHsVqMSWZD5uxWSoaDseyR6XsmimUkIXgVuHer0C+3KP4xbQYy
 V6fpAZS+yHMdV9MKu50mMDE8jNvPZ6WYAaxUkTG/w0wiYpetYMzqHZukHZCw9u5jn8TaURBIz
 wE5AunPYXdb5U7sMcl5sbJblz1pgQ55maf3c4q0g1yPpHdgY49o3urYVwbNPD+MsptbdcdELk
 H7gYd73e7094ZP+YcMZMA2MFCj2E2kjuJif5betITzwe4ua4SKS3+pgEkeLm3FATk4JG+3yFR
 kmA2q9cmXzqTcR0j+TBaFXo5KM1wQhL6rHj/9AWn28y/0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720088223; x=1720693023; i=fiona.klute@gmx.de;
 bh=G9nEt1d/019itp240zIczE964bZU7CdYwYEorsTPT4k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KxTWtWv8E4FdjITfa3nzXyrDVOO3ramCy2wpLTCku1LOc39k7lElGbU5vZIzjdhK
 yymWL9a/fVra+B2KQU2UyIuIT//qaXzmo4cXRM0W2y9U1H19nYudS/IrBGgGL9lsy
 2nnBGDhKoEN0qce35mKAlXGW2qCo5yKrpgvW6KGoZ2yvuVhNlRdBXxkUTaos/uCGS
 u8aBeA0VF5fGmMCgVMOsc6aFr3AhZt4IgqkOfubDMTiAJ2ThxesJNuVRtHbrcUSrA
 nZ0gHkkgB1HLeKH6ZLGjbMGe2xH+S31etlvMUzo8OyPbUrHU/R8RNmpHf3lkUe7mj
 Hn1LeTSn53/MNdCthg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KxTWtWv8
Subject: [Buildroot] [PATCH v4 2/3] package/openssh: fix init script
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This brings the script in line with .editorconfig settings and other
newer init scripts.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .checkpackageignore     |  1 -
 package/openssh/S50sshd | 24 ++++++++++++------------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2edbae93d8..b9edefd50a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1149,7 +1149,6 @@ package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_pa
 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch lib_patch.Upstream
 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch lib_patch.Upstream
 package/openrc/0006-Also-create-run-lock-subsys-directory.patch lib_patch.Upstream
-package/openssh/S50sshd lib_sysv.Indent
 package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch lib_patch.Upstream
 package/opentyrian/0001-Move-definitions-that-don-t-need-to-be-exposed-from-opl-h-to-opl-c.patch lib_patch.Upstream
 package/openvmtools/0001-no_cflags_werror.patch lib_patch.Upstream
diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 5ad156bf17..a26a1cc6a9 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -45,18 +45,18 @@ restart() {
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
