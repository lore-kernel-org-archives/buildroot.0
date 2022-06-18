Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA2DC43334
	for <buildroot@archiver.kernel.org>; Sat, 18 Jun 2022 04:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B99B60ECE;
	Sat, 18 Jun 2022 04:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B99B60ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHe_eAmE-a1o; Sat, 18 Jun 2022 04:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA2460EA5;
	Sat, 18 Jun 2022 04:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA2460EA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98D371BF2B3
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 04:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C5C240534
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 04:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C5C240534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSTlLhoxaitf for <buildroot@lists.busybox.net>;
 Sat, 18 Jun 2022 04:47:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E121400BF
Received: from delivery26.mailspamprotection.com
 (delivery26.mailspamprotection.com [185.56.85.152])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E121400BF
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 04:47:11 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se26.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o2QMT-0005mk-Eb; Fri, 17 Jun 2022 23:47:10 -0500
Received: from [62.73.109.28] (port=56346 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o2QMR-0008w9-De; Sat, 18 Jun 2022 04:47:03 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Sat, 18 Jun 2022 07:46:59 +0300
Message-Id: <20220618044659.4800-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220615075028.41612-1-dimi@tpm.dev>
References: <20220615075028.41612-1-dimi@tpm.dev>
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00864817646903)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+0Q8pLXFY9/+CWkVtaj9BNPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAQaXPwIlI4yu/PH1NWDdGRaootWGA5j9etSe5
 UJME++VTtObPqIqeRAv2CqzEPfjvzn3+O390ZiUEIR10am7COXQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgshkcoiOqzf47/xWESKiPlR1yRvIbtitNGnLjaBpZxUE1lUtc0sYymngJCgc9
 Cmsihzxxy2VtEIoiQZ4kAb9ki4PAgTtUp75uqlx0KezvZHWbz5twsxHtQVQSuIppndtMh4qquF0m
 STLvgCmSR4faGwwvmLeDYYVoZCdncqjCVTxqe+hzuzR4e2zKsft/i9azUpyDFBOp1ITdzGU/ruyy
 5nGfZreTrrCodBGR0eudR/Re4NVbVEBU/8Tv9RjL1Pyu39sUHXwyAFnSuVW90ZJgh3r6hAL/pjzQ
 N/GQ45ibIzsEkC4p6ub0lMDXu5jHKgmeLKPFRdvGVz6FathkOrvSVdrtItr3uBzqAPuBJFUGX0Q2
 t+qRiaPwgDRu7DKiN+p7Re1CGvjczx4KvFCokWHczh+2FvX49cAdKCmINeQFZ0RFQVRTn8m0sooR
 S7h6xdEgKTjECb0PwpN4olPuA0AI936c0SM84BxzaZIqKXfxGEIg2IO/jqGUcCa68likktQ4JTVf
 /lY41NkAeIeOKC0PGy9OVX47b4qZGvxdjyZ1CFQHmFDqewO9xyOqCYO8P1aHoGlJESAu14YV1AR3
 U+UyFj+4P7/NsNT7JHCvOnHPp4Pdn+cousT5+gFGAcOaNJ6l+dSxHUtSz59+xi/FGxobR1FMy82T
 FetP/kBSV5/trvtTk9ny2vM+IFavT6E+140lgZbb9Ok+P8EchtKA5WzfPgT14E1hghwshSzpuJw7
 tsty2DNwOgV373pfDhBQ21OdK8j0MlXJpYeYPfC0zHdZ/J5eJAr6utz50zF3Q796+PuYLgdrOtLC
 bKvBiH1ahgeoC4oi1BMd6NlIvsvDiIUHqJSTET5IrgKSqpC5j8AO0HtX0QIjIjCn1zvQuUxCBw4J
 0zMC1EkB/dUo3Uq7Q+K/Z3ayN55WV0bFGLn8N/dDfCx2SKR4BpkzgM/GypUylheSR7d4CWpSt/sm
 /gYhmNcISA==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: [Buildroot] [PATCH v5,
 1/1] package/wolftpm: Add config options for TPM 2.0 extra
 capabilities
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
Cc: Dimitar Tomov <dimi@tpm.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dimitar Tomov <dimi@tpm.dev>

Some TPM 2.0 chips offer extra capabilities. This patch adds additional
configuration options to the wolftpm package, so such capabilities can
be available to the user. For example, the STMicroelectronics ST33 and
Nuvoton NPCT750 both offer secure GPIO. Due to chip differences, wolfTPM
requires explicit configuration options to enable the extra capabilities.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
Changes v4 -> v5:
- Style: Fix some lines in Config.in that were longer than 72 characters
Changes v3 -> v4:
- Fix commit message. For some reason the update was not included in patch v3.
Changes v2 -> v3:
- Better commit message
Changes v1 -> v2:
- Remove a not needed package description change
---
 package/wolftpm/Config.in  | 14 ++++++++++++++
 package/wolftpm/wolftpm.mk | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 0b964c3d7e..52a9005d66 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -23,6 +23,20 @@ config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
 	  encryption. Disabling this option is not recommended as it
 	  could create a security breach in most environments.
 
+config BR2_PACKAGE_WOLFTPM_ST33
+	bool "st33"
+	default n
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the
+	  STMicroelectronics ST33 chip.
+
+config BR2_PACKAGE_WOLFTPM_NUVOTON
+	bool "npct750"
+	default n
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the
+	  Nuvoton NPCT750 chip.
+
 comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index a4a9edce85..d0423cd06b 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -35,4 +35,16 @@ else
 WOLFTPM_CONF_OPTS += --disable-wolfcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_WOLFTPM_ST33),y)
+WOLFTPM_CONF_OPTS += --enable-st33
+else
+WOLFTPM_CONF_OPTS += --disable-st33
+endif
+
+ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
+WOLFTPM_CONF_OPTS += --enable-nuvoton
+else
+WOLFTPM_CONF_OPTS += --disable-nuvoton
+endif
+
 $(eval $(autotools-package))
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
