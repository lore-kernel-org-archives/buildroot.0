Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECB2C46467
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 09:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFEB98186A;
	Tue, 10 Jan 2023 09:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFEB98186A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BC4z9e8H1khG; Tue, 10 Jan 2023 09:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA49281839;
	Tue, 10 Jan 2023 09:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA49281839
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B64D31BF86C
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9172660F99
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9172660F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0s-U-bq7n9g for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 09:41:18 +0000 (UTC)
X-Greylist: delayed 00:05:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DAB460F93
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DAB460F93
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 09:41:18 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1Mo6WJ-1oQx0X0z7L-00pgxU; Tue, 10 Jan 2023 10:36:06 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 10:35:37 +0100
Message-Id: <20230110093537.16767-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:xbi7OFDg/PdIsycgMNVFw+PJKts167BAasWKTQXYazR1K8rXFmH
 rO9WeMeeglLtLxWqRR5asY74mpA4SR0rnd/hpcJfNMhjWlYKdqB4vipnIbiTQFwElejxmWn
 Pfmf+maTmPZERJWoEo2C2yV0LiuaBMHX8of5tYvCl9LrTBI9KEAlr7A7cEOXu/48YrUpOl/
 uwYhLNvRmlH8MBb5oGwxQ==
UI-OutboundReport: notjunk:1;M01:P0:IefP9LJtR+8=;T0zxCQkeOAp5tmc2ywBfzjpQufn
 3rTibk6nQuAQTZbB6JB0Lld2tAHRpi046dH9sJtqIDi43/09mKHJclrgYrOZfhetVSTBdDrVQ
 hvtg6uEL/6JNYbLrL/+H8FWTKsV+VpUAxZHq5O0eaXe82WAFcOD21z2aPfkm8SK2qWevmJwrb
 Swrnkay3u3VOiAi7UDM5tBXocDMaxnB7aCQiyLAsaY2C3NTe6MlOyk/I1KC+5w1pKNWCvkY2n
 Fl6r5uDGsdeUPn6g77itNy46265fyf7LUEkw9/jC4iHoXUDmCqK6srUg7S2jxqLoyN8N+LVMa
 a+qsLxUJpNuR3+eUShK/d5Frvb8Q+9O+tKvlmvSo8JgVN2dXRgLMF1OTURh7wm673cdJw0QdT
 bqM2+zBMTCjxJO7aL9J2U6cJVj2687e2eUWkkxFEiU0WFtOYu9uaz8cUitw6gQ8pw67vfTRvo
 +iAPt/bI0PdUZb+O9LrLXlcTz1lydWO1KPI/I9nOZGJNhfUwiBinQcjO/YzeGZ8OW32zV2p/o
 WrxVUVq1AnVp5WNPIM7vGHOrZi7vwGq9MQAa96CGOWa9BaSgBq1/q783y5Axo6Lc6YVznveoM
 wsuNWPGczt/SAc6oYROYAx66iVEoegPa7VnPHpoUay24L6CmCeRlsNzPNq0UrMm/yH8U9Umh+
 KLSEXZORQPumiSRaqRqkXUPCoUIJJoyZT/pzmr/bsw==
Subject: [Buildroot] [PATCH 1/1] package/iw: bump version to 5.19
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

---

on top of 3a22b009992883ad57553ffb3f194303f90ad1a4:
                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: OK
                      bootlin-armv7-musl [ 7/44]: OK
                bootlin-m68k-5208-uclibc [ 8/44]: OK
               bootlin-m68k-68040-uclibc [ 9/44]: OK
             bootlin-microblazeel-uclibc [10/44]: OK
                bootlin-mipsel32r6-glibc [11/44]: OK
                   bootlin-mipsel-uclibc [12/44]: OK
                     bootlin-nios2-glibc [13/44]: OK
                 bootlin-openrisc-uclibc [14/44]: OK
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: OK
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: OK
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: OK
                            br-arm-basic [27/44]: OK
                    br-arm-full-nothread [28/44]: SKIPPED
                      br-arm-full-static [29/44]: OK
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: OK
                            sourcery-arm [40/44]: OK
                     sourcery-arm-thumb2 [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                           sourcery-mips [43/44]: OK
                          sourcery-nios2 [44/44]: OK
44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 33dd117368..376dc3b499 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256  4c44e42762f903f9094ba5a598998c800a97a62afd6fd31ec1e0a799e308659c  iw-5.16.tar.xz
+sha256  f167bbe947dd53bb9ebc0c1dcef5db6ad73ac1d6084f2c6f9376c5c360cc4d4e  iw-5.19.tar.xz
 # Locally calculated
 sha256  5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af  COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 9bf6ddbfc6..60ada9d57f 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 5.16
+IW_VERSION = 5.19
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
