Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E894C83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 14:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33258613F2;
	Mon,  7 Jul 2025 14:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OH5pca9bemHJ; Mon,  7 Jul 2025 14:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45EFC6140A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45EFC6140A;
	Mon,  7 Jul 2025 14:07:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B109F1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97C9E6140A
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p28r59DzLg7S for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 14:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 487BC60BD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 487BC60BD8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 487BC60BD8
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:07:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.121.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgesG-1vB7zQ0S8y-00oIhT; Mon, 07
 Jul 2025 16:07:04 +0200
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  7 Jul 2025 16:06:48 +0200
Message-ID: <20250707140648.279009-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:0DlSNwb+ExNk3Ug+M/TOyd/VXmh182UTbfAP2Gj/w4K8FQM+8r0
 ZFd68Ez29smycDX0XFcSDbOlw1cgfFgAGTvrLiygerhOsmVyH9iEJjRBfN2HSMI5DcEnE1i
 Zfxs27jpoxUkO2ofgsaHkxah6fSQ9YtTKi6Co9nm46Et23pcatgDezYUTZSIye56oEDFlao
 s+Y/Q30BVsAiiz2Jy8w/w==
UI-OutboundReport: notjunk:1;M01:P0:H/oBana8BEc=;0+UvAgtrN3CQqHYOB54f3FS/ESB
 D4F2yzf8s9LdeFa1bdNJoimW3dC2yRLIOurIWZZ8BiORsi1jqCJz7TQDS3FdcoIIoW2QDU3j5
 eUSaZFV0Kjl+aLr67v87kBvDWQmy+yBO69tMgQF+0YVVr8IKgzxftQMRWBu1XCbxAztPA4BNf
 ZlDGluUklPFyrE0QZ5pigOH2h8NYOGImBGrCWlG5e9K3n+oiimXBBnr+JOGVH4iW3zAKrHO5R
 IWXA5YVbuES64XADOg1akQYCBr/vFyM15dmHtH1u3f8Q7nQjlIxKChLQuLTt26WwN945oL13h
 IROchJrvkzMFEcRpO4s/fEN4n3adeTyMHG9txA7xKPPJVDcrU9nlRHXPc/VJD1eFytP4U99Qv
 ir8PMXRXixzMmzRMZW9R2BSYMnK8Zfzc2FKTS/sK0Y//FVqA6Z1B+BQD491F22J50X4+kD4KF
 oQOvyLTUHrqc4VAs0nCMCnB0HujRvCwxtjrPA6h2KswKg/uGtC37MzZsUN0B6c2vmJWpwmiol
 58RQds1xUjEytudkE1SV+ZUjRR5jv+FifWTrpIVlAXWRxz7PGTz6JveRplWYkOfuKMeKXRk2l
 nMBUECo9E/2eNsAHi7/HY3IpvpD20wd3m3RFNrZGB4yo3WMQ6GQvbIi1nIn8QtDTrUNSpfCts
 UjAM6IGdpUmYZ7F5M4TZmr0TeU8HyXgOZNrqYe826pH8p/OX5BoUOZEN7x2UfWtHEPxAL6jjP
 BEnFgVhPWWHoKLMehQFogejNPTstA9zhI/fqNFh9j3qc20BQq75EktEmU/saC9uSdRfUNxq7B
 Gt4TvfXkGBYVNCiR6NZtP5SCUo1s0XiOCUOnJ2bKBXu24YOeNIuRrGNL31+mRp9f7NAwmZcwm
 pxM/Z8eZ6Y48vy1IJK/NUROeGUM78q4E4EwC8T2K4XGTbSqy+1XzAJ4nPGPhW6063Tq/7o+yX
 WoByn0a9l7dXjpwjfEJIj8oYAK+MBbNthqw0iWxRDpn6VLc0sPTCPlcGa2/O4i8LFRq0fTop4
 Zga8twopMgurWtSwPH0lUstPO7vLrbg3OpBfB8H9LrsjTyAZWi4ZZ0UDUEvBdtFRB5S6Ff9Na
 fLIpZgMNhlWvzFtZU22suu4Wv+O1Mn/Jn2JIaq3MGbE85lfMUp04cmCAGbXYZR1cwn3Ly4Qml
 +kogz1uZQdKg4ONVOWodX62UUAqdc1P3JT6dodkCVXoYaY7gxIlAurzCLyHqL0hbQ9YHXJDr/
 cixAVuyAev8V7n56CUrh2HKGZZn4UKwQhlyZ3+HdTJmfrFP1eXhyDRzWwQPNS1ZhUxgeOSbPV
 Zj3SZWytGOMmQhNRGEslknsTIByIASvq9M5IFf5cxkoHj45vztO3K13BobI/twGkkcuZ2Jr82
 aLxaGfCFF2zX8KDT9XPiTQr5NJM/VUOb+0j8qL63OkFYF4+1nut7q3LkPiLOnsxyq/gL/asHW
 bKiy6Zc3Daui8pcANQJ+YhZG1bD3FkUO4Nf5Q2tb9feHyQaqWd5uXrNV1Hi4m3+1rZ1Ec2kUF
 oU5oukb4Ul2UZHhIeEYL2u2ghA0bq1htZA43FcTfwNGBAq+gsq/VWnXkiLWpfAOZW0IS4Lh4U
 VDy/JXEhGymk616vuY5MQW+6Rhba/SrxPLP28qgrmxlJ0yk9pmpb5wmrfskckJ1soeQeVFCys
 xWBw5FA2BYVRWpNyT3lxRC7M095tFAI+D4hGcFp29AKzs89UQuy7qj4Xjy3GV6rGwvEwjBv3g
 4HvFvKWbpp/B3hU+VoxR/T78GpLkFPYHSDBmZ9dmd6jDdnDsdNxWRf+99DRtogDeN+gjC/G/L
 7G4khgerOUmEPQGGX0nM9yn6YrJ96M9QQhL6YkOtVHE33+otpKGsPS+zrHkYGy90VlZS9Wyab
 neqRxA4zCTjupTQ/Kbq7VqWjCLYQk3zu/vS8I4ZPiJ2VNTTJ8dR/CNyvqHiHyKTk2+660YOJ6
 Nq4ykpE6dV0jabO8wRpyKNk1Deg6lrGuf60gSoMN/CDGD6mleSb52yHJKlstxYEu598MiL60k
 eRnpwtQe+6Yrb06r5e1lMcl9yxYKVqcvAY2dpTcIj/xm41Wrd9TBahOBtwkLlmWrEoN2WaIwP
 JtaEGg9ZvYnl11PO+idVEq0CVil24WBCoBYHNpYX6ww6BZlgzT69z/heLUOPkNvDtXkRctoxy
 imu9vebCCfyzEq2lt12A8fsYMayvn+3UrypBURMB13G5EiaAag5wCPy4SyxBh4M9OKDSs19Lr
 EEfRYWL1HV+j/aPnhYhsanTaQcX1cEX8/2kjY9JxSTc3TMiq4eYg73AG1k478Yh6TNsKCufuK
 fFNhU3kbp0t6JP/L7ZuyAHdOdlD38qmY83TmObrSQFETvkgqEhCGPoErOBT1Y7BLIEWeSzQd7
 kuTrOfr32sEFvgssNmQCkuEQfYxxtg2e0oScFzN5dtgr/27mVa4oGotqtTVJL60ihyGa6DB5b
 2WYpYukmj10qVQsnSxoE/3K9DYw6r6eG8LKPF9Abjy7fnkbhegMls6pc4i0a4zi95ch6oindw
 uLkIRH/1v+7LNm9bJRSeAubuJcMexyAB/00ZYwwNHoUsQgC140js+2QBPFthgVDlGCOfl7Jay
 C+9o34W2XZwCewVqt3eSyVhsawNj0mmG5RDorlX3IZftiI6JklpXk+a70f7YrMPFx3OWeBuFp
 IbL+2SRYXVPjshE+VVRr2QrLC3fw4v5lwi5LKgngvCNs5h++rQG6gvMYZy1uOTQS8SORGgJ6x
 PViPhX+HHypdRjVBsg4FGSR3uOR2xWAqbvC/Zh2nZZF/oQIqTDEZcqcIuJLKiSFUPoJa6R5Jd
 P+VAuTKZIGWX7tq/7MQTkM+YtGLJi10EhuhAKZ0H/TexI+ga6WA+tEdJlH4HypsaNKUFbOR9m
 D8rcSCIvmS25uW9CkCbLbRbTEVKiQR8nJgiCp7mjt2byYfoam/s2zOhx7JNfczls08s86/hD4
 xZ0wMRZc2O4Uu5ySrTKwVLc6S8DUbdfpDE3uMw+vfHbsPGlRAWfi7vCtdCCUlBCCro7x1SBp5
 DXg5l/yP/uXniBpFNjwVYaCkgjL2QD9bzuJcIC13fRqmt/7+mp+wpMCUkYjd9OkpSXy0ixqv6
 TMhHhtgoD1SfwmZW0TUPDCPVEuD5VpfOkMsqh1JUyBUsJ2z/cHzbhk+vTvXMaSjjjTPhiPD8+
 WdyFoZ4uTKGV80wG6qosS7tvqi7o03YVM0humKThnkpZwTRalmIDSTz0ao05j2gK0h7sdsOCi
 jdtEqrg6idGP31KwTIriv00wPUWZPyOFWbvCAjKGCa9Fmdf98gorfa0HJ5opBz4kqKg1SsuEX
 9YlAppurS4MgqyLGkDZ9xScHhcej3i/B4QOm1y6s64ycFYagqQBrbb2VFn+fnxRhMzIx4hAKf
 Jz1T829ug+JFSuvMtdqklM8Ddq4nYmTYyp7118KloQPI9Yd1MvyXVSf3nChKdmamA0VYGE5iM
 4ZR1WKb/pIW6Xv1/VEjoI0t0nvEmBoFI2ocRc8EFdB3uWft8hglcoHD8HcX03UBhaR4JXumSp
 UnavKtjDb2dy6l209ngGf4jLvoaEY19TIRvnBsz4BvuaguEk40saqUldblevzIZKnha6awVIL
 q4Ci8ckV4fzlpLPBDPjE3UqzZ3m1ZATnH3Q
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1751897224; x=1752502024; i=fiona.klute@gmx.de;
 bh=80Ze5JSa9ebwjCJEl4UOU7vgZpi61PyzP1R4/puDrqY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CnOsUC3hf9pb7AdV4sFHEh8LzYoLgjTPHHc/2EDa6x1CTsk9mIahoqjphtEIjpst
 Jo58nrbsjZwh/fJI65Pa9wOLwabk5BuLFKLCmxn7cThxO99/XYfgkJoj71GLz579l
 Mk98kDsBbAVdR80p8/fUG20e6vhtxAEWRY2Q8TJAt68wbO8bq3Uh7e3SFBPzE23I7
 rydQzqbUrznw3iSY1nWJb6njbHdm8H7zZt7BAVv0bOKQDXsV+e646cuJ8WDTR/Use
 AKaL55K3lxhvmIBAM+hgsKjgnW7AZCVkdWS5ENvks2vb6/sktfB9dRmOoMpJORb4Z
 B361LeirlYx+8idEQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CnOsUC3h
Subject: [Buildroot] [PATCH v2 1/1] package/genimage: bump version to 19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This adds support for btrfs partition images, among other things. The
COPYING file changed because FSF postal address has been replaced with
URL [1].

Upstream changelog: https://github.com/pengutronix/genimage/releases/tag/v19

[1] https://github.com/pengutronix/genimage/commit/0909434ea5e3e927b4dd512d7e03ea919da12f8d

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Fix hash for COPYING

 package/genimage/genimage.hash | 5 +++--
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 232ba6ef66..5c55467737 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,4 @@
+# From https://github.com/pengutronix/genimage/releases/tag/v19
+sha256  7ec4fcb865662a8b2ff20284819044ffa84137bf3ca16fb749701291bc01f108  genimage-19.tar.xz
 # Locally calculated
-sha256  ebc3f886c4d80064dd6c6d5e3c2e98e5a670078264108ce2f89ada8a2e13fedd  genimage-18.tar.xz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index b8ce7ff3c9..5fa34d8eb9 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 18
+GENIMAGE_VERSION = 19
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
