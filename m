Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9665FC3271F
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB26941940;
	Wed,  3 Jul 2024 15:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubmCneNL55Q3; Wed,  3 Jul 2024 15:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0159A4196A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0159A4196A;
	Wed,  3 Jul 2024 15:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9BDC1BF33A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C535141886
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oIPPVFWq_EW for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8455B418E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8455B418E9
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8455B418E9
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:57:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.8]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9QC-1s6Oz21Rgq-00uvQ6; Wed, 03
 Jul 2024 17:57:48 +0200
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 17:57:30 +0200
Message-ID: <20240703155731.914910-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703155731.914910-1-fiona.klute@gmx.de>
References: <20240703155731.914910-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vkA7JSOiuy9c6q9k0zY++etiKfoqKLpGxzEslL1fWVOTv4NxGm9
 Kz2NcNJVWd2SJOIuug/np9JNiAxGRzp7zDLOqNfeqW24Ofq1WHnj2n+z/0PUE/FXl01E6YH
 s/iIiFNPQKbLD3Ov1KtlX9k0ClJHWH1vKXuBBRUP4dVlGLL8U0dFf8wg6+SsGoBJ0os/5X8
 xVEE/Vj3Bn+rrPm00SB8A==
UI-OutboundReport: notjunk:1;M01:P0:IhnhefNgjuA=;lPC7sypuSW+06Jiu91rDCcI0XsO
 wutMaY/VzMoSINe7WuoD/kWh+pCp6OJtFcpnvEMHJ+212XOc7n5ibmh+7miY3oRTE7QDuWaiZ
 4abcIkTw4ynHx9ISxsn2XCmlzcvOc1HTU9LAUEmnBwYM8SF5po9w3bQcwLCzZO3SCxPwgSDU2
 Fm+xwZ2AF/ovSmORlnOO9GnW2k4OOOTv4d0uVE/XoHmrFNqU20Xgdq+3oco/fpd9HjJuak1ZO
 XB4y48P6I15SxfCFByiIxC5Y5F9ExeO5nRfbwXtfu/DKB9oCaIPL0WyFcm0OA3swifFXZ57yd
 qGzRaNThNLYsqCigKV/ANDxi5rStqaq+la9B5lRxDo4+6ORBCqZ/K9yzWWGQRLSUzSVfqFyLt
 u0/WBvEbk3O9hvcFc8sZF1av42DGTyDsXcf5Vp4jc1t6x4YKPWwyn8Xbmia1oc8zVtZA7n/HM
 +Wxsx+SH5sOaXR3csYlHXr+i5hNtM5UR+8pMsEHePs5vjsopxqQRtKolXSEZO9ATsz2zoFSV5
 02WVdbHZIeSgHLylSo/Jai+BfgB9Usit4UUNc6/xVmBJ2RphYW3imWeWboQyaquHaNr6+r5dI
 kBqv3CVt/bLX02HC3n6lHr0QoiWLPJwozP9fM/6VFrLsNp3c8Wezw6GPPYOv89ZyQbuhInSho
 Nj4AIOpY1iZ42u/Uw+Z7rfsSjvH8IrroOS9FqLANBdZ0jrdFZABvrYeFtrIyr2vbbLNRZi9y5
 +7khJT1GRtzg8Mmd7c0uZJ6asKuLWdFW3wSlutuoSwDFrq1fdRJGeiD35HJ+hwPAhhOSYT9Kw
 LJPePmkzLwgMwbHvFNuKJZsvaCECVCFQMbVU4g8xfYpsk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720022268; x=1720627068; i=fiona.klute@gmx.de;
 bh=ljSCaBQA0Z/VkdyKtQHtDxYdhF43chZm3SmIVVGIZvA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=q7AlEf1BGhCqNG6C6a86HmorViAYv7rPWuCFCbWR8eZ+7ctRK1DOc9QkXDfAZnRY
 kssyeQSIHciWVqbjbh2zQ9nC3b7NRAdzaiQekF0XWCQrws8floVIGeddfyel8CQQB
 nNkHR3avCcKLA/Zb9i97GFUdqDeA2SugiENpFGnDXJ7/nzDk7ah8w3WAmtvu78pjO
 8Pok0aA5WUNcFF2p1IqrEdRQwfADAaMonJBDkzcOqozR6I9uTUnXkXHrBig8If/9U
 t/67BSwl/GTNTDwVbstSBCYJr9wbtIbgKPGpSYQn0KKZxyo3cgjsDAfdgmgsrSGoD
 MEJXKA8XKrjzblKG+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=q7AlEf1B
Subject: [Buildroot] [PATCH v3 2/3] package/openssh: fix init script
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
index 071f6f0e99..5d953a3d4d 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -42,18 +42,18 @@ restart() {
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
