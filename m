Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F30EC87FD2
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 22:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C62481DCA;
	Sat,  9 Aug 2025 22:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltuxzWPaucHg; Sat,  9 Aug 2025 22:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63DE981D3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63DE981D3D;
	Sat,  9 Aug 2025 22:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53AB731
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C77381D72
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbTkNDNJCkoE for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 22:37:48 +0000 (UTC)
X-Greylist: delayed 372 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 09 Aug 2025 22:37:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCFD581D34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCFD581D34
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCFD581D34
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:37:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.119.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1uzfBA3vAY-00RDfb; Sun, 10
 Aug 2025 00:32:43 +0200
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 00:32:26 +0200
Message-ID: <20250809223229.2307960-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809223229.2307960-1-fiona.klute@gmx.de>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:wBb51BKAB4Lj3Cca7e2xEqfRlrdJfLrBiAGtKXTs+ot3+ni7W/k
 bK2aJY7muJZRtJjjaNWjWEmI9X9de//U67wyy4FdYgXBt677fmJb3A9OvOVBGWBf1oJRafc
 bXB4GnaRS4JXY0H2yKi5AOMIZ1tU8ROIQT3kaNjc6ROh6bcUsR8kH8b77MdAe82F0FZdOE4
 Zu7owA2NmGH8tX/lcNyMA==
UI-OutboundReport: notjunk:1;M01:P0:ZDjG0q3ER7s=;n3QVqiXNIvujw4ktyYXrYa52R1w
 Xsy4TaRqqZvp4wGRoT8lvTDZ1zH8p/BP5lE3Bt2qGt812mWsLFpqSGd+jnX9FLSYlgVVG+zZJ
 t6vQJELFaRa73YejutX7M9xZ2/QD79B/AjopfJZzXu4YULBAWA1s/SQ2LIOriY2dJDwUHFog3
 ZcjjUHODYqRYP+ZfGCKKf7kAleCaSON6T6VjzyErVXH9hdGcvdTb00ZAhxWnuVJqVpzyJArIA
 N9FStKLEXwt6a5xKqVrE/vIxCCeSOnRd+TgBtBRO/q39VmBPJomj38wQFN4QmIXu1L2e5Aai8
 aokyY73Yeih+vbBk0LeXdAySjgDXBxFnENtSVBKloZ5c6mQE3ruD6g3dWRi5MK2ZRJVFzsrad
 LBJb356RqZu7rR22bzTMo9XVgDV3XN2ubMej1s+thoKsZlL0bJk/bVd0+uOWrwlEHJPRrzsUg
 VHYFP0OtoRVaoqXMlH9yNJ7gMPalZJ8AVaIcnfkGf7CNxQX1RfVNsJbJuh3i7XdZT+Ty2uoKe
 w0fWP06k1Kn7A9zlPSeU4MGG05KQk5qHYihJ1i1utm3lxOT99W1kpS4CMghKEpjNAYqvXqLdQ
 FO3jEbRVhAy8UKJwXiCqh9+NjKeH2JJX+1r/+Zwy+gJsPC7zCJOCywzI/tP2IZ7mD6gShwVQy
 sm5L8Oi3c37RflyYs2TXzdeWcGvrMHQWQ6uOJ7XLbUEl7HG6/S0a6ZEjyMjrLX44pq6hd0nto
 8sN/A8KtH7OA+N2g9qdnZu6XpUMUaTjeBIor6TEjnW6b8xgFn1Qm3fiCqH4ZaeVTMROc+Oson
 oO9tNyUGNX22b1yxuwtdwN6Bn9VktotAbZtLfzEMORe+r1d0r+6Pq874dRLD620MU89Ea8VEh
 Fbp5lUAA1Z7j/A1myWUYtWzADnEiIoFdwcoEZkd/OOyTJcIfrRS5TmHD7MBpw1b9IBdHQGg4+
 OnMKHk8jFTZEOfpQ0pz9HW51iZ2ZqLVnHd9q37kt53jxTCi8tNNNyjM2YDImp+bL4uUPwI0lV
 bAsxFk2Kzif1ZHpgJhJNWaWOHzwCTnp9Iwr2Ii38+1nmwsNIpsLvgBC1iLDW/8IfoapjKDOtG
 QRDqcMJ5FBZWXJjUiWIbtyaZO7Ak4Zpoj5PVTH2IJw8ZKnh/Vrw3djEMj7u6s2mmeGcZaNxwL
 aMgEGYOgAObxqE5RyppYYEYJCoCFLWKxN+R1d93EoPqMZmnGDkMJFSa8WXXrll/bDfBXsvXsm
 pSq0316/ehwRAg7Dwd9KshAu8kZbsCeU0xBtEQJEq6iOcfO+jf+rltxfeMCvvjjwW2lJG/mB2
 /Lf3D+iklOEwPM3mLhu0bZOHaRWvaKPaiSbNGMAG0qm6dMLcNlz6HPPa3mJsx0hUj/orFKcla
 93KR0lC+LcRn64p1xLYsYYpk81DHfX1m3Mcr5fnXUbNh/sD/TGB9ZG05bPybUmwfrr4x2SU6i
 64eH5NSZ/f8khtHVIdko0A1npylFATU5Kmc08G6PR+JQ59gyInv4jC+GZf9gEm5bxxEhj9M7X
 tUysTxsr9edo44p0ar9+t8sxm2z3LoIJAjjOQr2JAtBSwuxeb0zRnA+CN1hITgzaHSeQz45BP
 EMRr8vhGxTE+CU4EmJkuwNQLLqzN+QqWc64zjlqPb9uUiw1ir2qyp0OlcoHE47yr4Xa9T7K1Y
 OtUiqGBSsbxjtlYIUq8vDVglsOcMXgwCVIMtA9DJqMxRD67APO5uFiTHdS+Wj/tdodeT+TtyY
 UgG9hq9OdZ6nZ1wYThAl1W7xlC4KB2/D9hz35C/qeVBw9SuH8aKALxa2gsAa0++iqrJlqoJms
 +YItTEHJLC8kXdSstEa9HttQ/aDIZMMb69qL11LCNU9XcTDYIogVEcbjAof1ZM9Z+SiXg1xDI
 KH7Em+KkETZoj2j91aCBdOEQoYfUL3GacGx6BmW7GNSiq0xL1p3Pjm7Mz0HpxZcdOnvVhGZLR
 Q1Hx/IwwvsZMCn8hD4eAP4evvd2xMqYse4a1gSQCqOc3uSNYoAsbk+U8iZL0LTK2XLAnOFaoN
 0/EBAIIykatM4Wti3J9zBDFBCgh4+b8D0Nh7jLcRN8mzW/PFT58C7JOG9JKlM0vOk+B9gVFAN
 QTsyt2YzLmicNamWhraNINQ7Sw4BNeL1HlCOU/CrmHGWvdS36xilQggQ8xDThv3Br4XCegovw
 Pb9FEq0r8z+3k713LwY8tQbZQpET/85kON58ky0ojxMivib5Y06L6RkXuCRPq1TvjpHg0INSQ
 dtVOi1GBG8Xzx49io7soHY16UgZGHwl0Jozy9/LtTH5jgDrP+6urfADmLpW1hoZi6fVwchBq2
 MDp/VR+pp58Y3vlqzUhPH8SwwEFKFlQbXuLNpNMMrvhJnA3Hxw6BF+nddnsCTPMFtwAJ2PPqJ
 AYcShU6oThpYmmufUu7P6FdTdBSuEeIMj+nBL6YBTqYXxuiKa1Q4U5BFeCMDNm72RoBure42/
 HXWZIP2K9KujndIAI6fbephvM2eFqmD8a8GCIdoinP3Mwuae9nW9XuoC25tMu5QfTx3l5PM/l
 GJL8zkymQV3cdr87iTiL5yq98c7FwG9svezJtNz2hv5rzDJpc7xA4EgHhyDhc/bAv9KedXLHJ
 YMTrnnjANAuLDITa9oc8NQprylAQtNqS3mv9plAcZSPgLQr5QV9TCEy3FtjCmyQtz8uUAOrX9
 /Ea2teQj/ZygVzbr3fdr8I1wKvMWEd6F6PnJApVe0riG2xGTiQcdDe4QuGzh02VyTaVrubYLc
 1bJmhM50J5TvNY3ClHIWu/zDGyL1BbkcgnMuuuKRUBqyNnF8sMaiEoQv+T3UKkik0k+NbKtbC
 yYhq1O6TOmyCnEV43KabeIJzJ0ANjWw9Q1Vw4sFn6YUO+2BydWjoQ2UoTEv6dibRK0iSHk/Pz
 kLtwqPgFIpGVzqhlhcwXz3705K8ONMq/fIolwXkTNuXRkbtwE0bztysdbsyfbyOIGEPWXmOcI
 JwCldUTJAi2JzdzmgLcaR/1sFmVPPkGXhIgUndmCfmvc22BTAQCFdNQCsktqBPLBiCUM3qon8
 TaXTxkwI8Hp0HTdEGn0urcqkEOldLlNm0KUL0auVJZlNlvBVWfrkGN66o2ae5RTR4EiXHGsUQ
 CXUzVrpzLs3K12iXu5sDEt+SeA2vPiZIgM1piZxZ3dJz3yxcMxZYe6ubwupGs3vXdE3MBImax
 dDKfzPlmO/PeDo6rtWt60fpm2cOKNSAFHe2QSD2/xY6alI34w75Ow4ne024XmkC1xkfei+Um6
 eI+D/Vc83NMAiotdZGF4E+0Efao1nOmDymnGlhX2N89uFuafFdX7GfV/YHRAXdB8p2L5Ey7SY
 2kaGg7EzaD2Pm+Oql3FxhJuGedyTlPQBOF4/QMv7bCGnvlwBfw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754779066; x=1755383866; i=fiona.klute@gmx.de;
 bh=FT9oX7dLQUhj/snGXg64fA1qDAmh7h6ld2obBHDuvQ4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pp8GvxQmUp6hIjXKeScNZrJzyLRKJ6zm8wgnxJS9Un67EBaV28W/pSzOixcCVgJn
 c/uweniP1cinDgQb7t3W2goXRVc7AS+J0JXlrwzuQeJCOSqL3WLrA3qMbgdX30miO
 /TgMufuO7NU0uV3unkBP85etVcNqHzJof54bVWfUFlZ282JU+KN7Xzi5ULxSMV0zO
 uutVOJR4I3rrN9Nvah8XdBdAgG7A9MNeXv96cBexItZEUJZcZkOtxXOEgyDLXTyfx
 Y4fwD4QufK+wuB2o3RITV5PP303MjzKUuFGhox9AVY141JnpSO23akgJL3avoHRfA
 J44XJmutf9pDxyuIUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pp8GvxQm
Subject: [Buildroot] [PATCH 4/7] package/python-platformdirs: new package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-platformdirs/Config.in              |  7 +++++++
 .../python-platformdirs/python-platformdirs.hash   |  5 +++++
 package/python-platformdirs/python-platformdirs.mk | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-platformdirs/Config.in
 create mode 100644 package/python-platformdirs/python-platformdirs.hash
 create mode 100644 package/python-platformdirs/python-platformdirs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 50a02d2171..361703b34b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1122,6 +1122,7 @@ F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
 F:	package/python-markdown-it-py/
 F:	package/python-mdurl/
+F:	package/python-platformdirs/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
diff --git a/package/Config.in b/package/Config.in
index 04041b11f2..3d343c3c91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1285,6 +1285,7 @@ menu "External python modules"
 	source "package/python-pigpio/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
+	source "package/python-platformdirs/Config.in"
 	source "package/python-pluggy/Config.in"
 	source "package/python-ply/Config.in"
 	source "package/python-portend/Config.in"
diff --git a/package/python-platformdirs/Config.in b/package/python-platformdirs/Config.in
new file mode 100644
index 0000000000..b0cde72585
--- /dev/null
+++ b/package/python-platformdirs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PLATFORMDIRS
+	bool "python-platformdirs"
+	help
+	  A small Python package for determining appropriate
+	  platform-specific dirs, e.g. a "user data dir".
+
+	  https://github.com/tox-dev/platformdirs
diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
new file mode 100644
index 0000000000..b35d10dba1
--- /dev/null
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/platformdirs/json
+md5  90aef8202386996ce2e4b560a9f1d3e6  platformdirs-4.3.8.tar.gz
+sha256  3d512d96e16bcb959a814c9f348431070822a6496326a4be0911c40b5a74c2bc  platformdirs-4.3.8.tar.gz
+# Locally computed sha256 checksums
+sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
new file mode 100644
index 0000000000..fde3b3636c
--- /dev/null
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-platformdirs
+#
+################################################################################
+
+PYTHON_PLATFORMDIRS_VERSION = 4.3.8
+PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/fe/8b/3c73abc9c759ecd3f1f7ceff6685840859e8070c4d947c93fae71f6a0bf2
+PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
+PYTHON_PLATFORMDIRS_LICENSE = MIT
+PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
