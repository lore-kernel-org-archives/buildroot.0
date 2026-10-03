Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64913CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 519896064E;
	Sat,  3 Oct 2026 15:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8yO_8smhoc5; Sat,  3 Oct 2026 15:46:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 83CB86061A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042393;
	b=Xdmmr5fGK1R86WGdjem5FAPQft5zNUdecXXLj6S4LTENwpnNLmKr1b6XFu1+p+4baS28
	 cw1bUpDgbJ6XlnZILgkL6DpFhhD4I7sK6UcAyba7Q5FI/07sSnKErov1/BTHg6LO0JLpI
	 ORSdBKVIKrZRCaNl6L//rmjBUwiHrJPWETsFz0utolhcIZrZi8si4wm4VkJIgO2utBogi
	 Fqel81aOt/ZHvKmXL+N5mmUpvTbzFmTC4mhexwkv3h5fVTCn9FhNRs+mTHQrBCBq5p6+7
	 CyBwVX+q3/n0hdgQ0DI8oenE9vn4qej5onyUhqz414DRE+Rfv/75+JHqYuGS9CQtUUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042393;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dHlz/MK1aU2OAYlbRRx2PwJG966WkkYeWQBoMI1X0mY=;
	b=WMWUTKadKK9Cy8jr2kahtwmwFg+ev8Fub7VIBU0D6GjYUJP+ZvBjES6YPSGJraROnyw7
	 8AbNW7AwzKuvKWUqJFvH+oVQp8KWN3upPKIuimHzqGBlUN3uGmTENiZg+pgLINze7j4kv
	 het5t6p1L9/3WgExHlrw2To+bHfF0uZi/O8Q0vd4rpLIUjMYaOH70Hok7vqXwqWUwlf8/
	 JfU1UiJaQf4EICaRb3rygjhMUfgNqWUtraU9ydi4SUtOWwO9li7/ueLcYEehrVic26OwU
	 5JV1Qn3bv6L530+RsawsgKnn/zpTOYxFthj0uAhRE5X9IEb3QI2k3PXGnmLGvqbYLIw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042393;
	bh=dHlz/MK1aU2OAYlbRRx2PwJG966WkkYeWQBoMI1X0mY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HbtQWqk+gy0hyIhVKJ69XSmewJ95FTBdZQ+Lb2hFpbbGZz4cip3+s44n/a2FNkiJd
	 lBYB5odMRsAqsL2Qdl9U7Uv1pepAbOK1KeqBgT7uDzKGKuKqpecd/d3GyUnVGKLgjK
	 Nb+ytoZuztrYxyDPoFj/9q4P/amWFowu9LpvAbcY0tu2Rf00lB/LFiY8QXTwN/Xa09
	 IJpy/aegOT4+joMPZeurdLtHIf3WN/a9IQAfNQP0VBvBrnTIUueRuNeypMgo1c19ik
	 1K9T3N3WGOusAICM3BK7BCPE8F7lBugjQz5Eoc6YTAhFOom9lIlFmj0jLruM8xFOGX
	 FT5Q/ISpTg3kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83CB86061A;
	Sat,  3 Oct 2026 15:46:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68F75263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AA6140EB8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHAoADyE3rrl for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:46:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE76A40EAB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042391;
 b=AcFeiiKbm0CbHXDgVGNQPsICb4LQ8MfhaslkDpDmmyVA6w9PZKzY3g45XWeqPSgT2LX+
 AF1hHl0eSIth7uZdSynBPxNk4LQ3XMbP+/YzlCMep30xIAmtlEi4NA/1AhGHmu0NldycC
 mNYcK1cahKgWAttWwlkqgMLYIqx7uLIdPm7c1y0dLPzrSwtAZlVbDUJGz48qvP0r1hXuN
 WxUdXtKxdMC2lqPtgJaIPYjqbComiixpJuJf9c1SwwwLLA1crqg2TIKwLU+8o6MWiP4jz
 3+FFfgXosShXjhanKyywJH3XZigiTFrtI+dXao47j/jp8a573iEf5RqJntwvAk0xHUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042391;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=i/gegk7lQ5VB/ObOqVG7tmiHWbzQS2Fwd3yJyfj5AlY=;
 b=qIhBQB4mGgob96fEEuXSLa64qLP0u2yKKCwtiNXWGRLpoUDltpSI0iKJCzV0A1QF/qKC
 icAoGu2CzxzpYEz9ILUJxMfekBj7760iutAAfkCNsNQS5m+dNMnOa0XdToPjNNBpR8ARV
 fsolotoIZf1rQ1iZeR2YinikXAisdVYfIaocEi3DY67RSGXnuk7RGLzrlBGwZsHxQYk1u
 qp8dSWFYMQxiIZA+OVKrp5EePyP/2yPOsKiV/iYy0rHIu/d7sRi64ziObLokFkLep7j5X
 ubYQC4PtFKqcjIxm9DpHfhZ3LREhYMWZpN7tzkUhkiKA7hfcmCpP6RXduk1CaogmIdA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=Y0z2bTRG; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE76A40EAB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:46:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKHc-1wUAaO1ZHw-015QNF; Sat, 03
 Oct 2026 17:46:28 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Peter Seiderer <ps.report@gmx.net>
Date: Sat,  3 Oct 2026 17:46:24 +0200
Message-ID: <20261003154624.2746137-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:kGfs3CpED4klNs6oTXgdKRMf+Ri4U8GcMyme3P15fqRkiJxieh1
 BE/IocfRjIgiCLZJVwOmX3+xsixcdnmoehnbXpultDo4bBNT6roPssyXtZ5tu7W1CALCUXv
 wxJSEXuVGD/YI232n+o7HPDN7JoTng6sJepjUDe43XiIeO9kzCKUYGDyF43xDQTKXanO5rb
 IZ2UXmv94ABJaZzsUT8Hw==
UI-OutboundReport: notjunk:1;M01:P0:zE+QEPstyOg=;OGOX4O5+iJsai2MG5b2L6JXkfub
 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
Subject: [Buildroot] [PATCH v1] package/eudev: bump version to 3.2.15
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 3.2.15 (for details see [1])
- move group 'render' back from systemd to common udev (see [1] and [2])

[1] https://github.com/eudev-project/eudev/releases/tag/v3.2.15
[2] https://github.com/eudev-project/eudev/commit/dbfd3002979539a3dc9a1f20250e3229b048d090

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/eudev/eudev.hash   | 2 +-
 package/eudev/eudev.mk     | 2 +-
 package/systemd/systemd.mk | 1 -
 package/udev/udev.mk       | 1 +
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index c41bf5992d..0e24957621 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc1927f006f  eudev-3.2.14.tar.gz
+sha256  eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3  eudev-3.2.15.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index a060e8f0d8..0deb0e53c6 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.14
+EUDEV_VERSION = 3.2.15
 EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1f1b5823a2..52c434b28e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -700,7 +700,6 @@ endef
 define SYSTEMD_USERS
 	# udev user groups
 	- - clock -1 * - - - PTP and RTC device group
-	- - render -1 * - - - DRI rendering nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 21c1a71f5a..3518e874a5 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -8,6 +8,7 @@
 define UDEV_USERS
 	- - input -1 * - - - Input device group
 	- - kvm -1 * - - - kvm nodes
+	- - render -1 * - - - DRI rendering nodes
 	- - sgx -1 * - - - SGX device nodes
 endef
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
