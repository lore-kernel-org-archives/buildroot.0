Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1574DC43217
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 07:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 956B060B5A;
	Wed, 12 Oct 2022 07:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 956B060B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1US51QvmkQd; Wed, 12 Oct 2022 07:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA55160AB8;
	Wed, 12 Oct 2022 07:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA55160AB8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FDEF1BF8C7
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 07:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2864A60AB8
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 07:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2864A60AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ki4bxaMFQYRZ for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 07:54:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D85607B0
Received: from delivery16.mailspamprotection.com
 (delivery16.mailspamprotection.com [185.56.85.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73D85607B0
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 07:54:43 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se16.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1oiWZb-0005le-F7; Wed, 12 Oct 2022 02:54:42 -0500
Received: from [95.111.54.43] (port=59648 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <dimi@tpm.dev>) id 1oiWZZ-000FTe-2o;
 Wed, 12 Oct 2022 07:54:37 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 10:54:23 +0300
Message-Id: <20221012075423.14729-2-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221012075423.14729-1-dimi@tpm.dev>
References: <20221012075423.14729-1-dimi@tpm.dev>
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.0088900029315)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+xm4QlZ+Bl/xOAXrKE58LjPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAQaXPwIlI4yu/PH1NWDdGRdDxkbFZNIYOsFAU
 9Z1MxitTtObPqIqeRAv2CqzEPfjvzn3+O390ZiUEIR10am7COXQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgHlsrgHdRWEueoBSMqiQzPh1yRvIbtitNGnLjaBpZxUE1lUtc0sYymngJCgc9
 CmsiXhTG+PaMK5UE3Zu4DMGBKIPAgTtUp75uqlx0KezvZHX3zixxmAa3/eEcqtssaDcJh4qquF0m
 STLvgCmSR4faGwwvmLeDYYVoZCdncqjCVTxqe+hzuzR4e2zKsft/i9azUpyDFBOp1ITdzGU/ruyy
 5nGfZreTrrCodBGR0eudR/Re4NVbVEBU/8Tv9RjL1Pyu39sUHXwyAFnSuVW90ZJgh3r6hAL/pjzQ
 N/GQ45ibIzsEkC4p6ub0lMDXu5jHKgmeLKPFRdvGVz6FathkOrvSVdrtItr3uBzqAPuBJFUGX0Q2
 t+qRiaPwgDRu7DKiN+p7bBfpnQAiZ9/ZqWhbBZN1xB+2FvX49cAdKCmINeQFZ0RFQVRTn8m0sooR
 S7h6xdEgKTjECb0PwpN4olPuA0AI936c0SM84BxzaZIqKXfxGEKuZx7+14Jzmz/AIEZEOWHZBHBs
 Vh8hL0TjJRBEjHRI4YeOExEv6Pv2dcfPgqk3OA/qf32HRAIXLxSxjQIuPQZekU0Akxmo/OJTStPx
 sVDqh885wqZ/TEVM83BCczs5iL/TPpuFqUUQz+mM8JAD4ECWZUr+TyckoIgOBJMWw0kpnWt3svE7
 ZJ3XtYW0BdoTQS0KaYzPVvZwixgECwyoVXiMgC1WZPLtGUfYNA7tXrSwQUiFroSxonXrusVOLyyG
 r8Zm4zuNRcgRKiGg7nXFaZTxBJaObljWpDOTOVWUe8x50zPAn1kWxgw5KeA8R8PB0ZU9DBsesZaF
 M2cmuKDecK+A+e8GZaMX2PHOpwaDf5p22DgM02tEPCu8iebBKB3QEof3K7c+w3qs5s7L8fDiSW7I
 8OiOKoEkzG5zeTA9tFOrqcTvC+SJKJ7q9p46wYNru6KDpdq3Q4knYBZuH/aTKbzgrzMnbkkeR/bL
 V8ffzH+ilQ==
X-Report-Abuse-To: spam@quarantine2.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=NtgofF0uJhZlOmO4C9PyPPQh3o2xAVBrOvFwdb4es40=; b=jdMRZnz2ykTbU7hBtwmoOL7FeZ
 nO5gpQOhr0bj1b3X72GJ5ZOZWWBL9PU2vt7Lj94YH4eZb/O0uGVl3NlOJLsyWmMlIz2eX1LXkZ91V
 YAxLhwB2dkz8315Sqyu2yDd4JfkBHOQzGDpy09n3s//W88BPGDKPiZZnejarJN431qBKT9DRouASh
 ZxPLWX/0Rq4rPWXwKZbQttWnGXES8M4y4vI4kyJy47iqnpuMXaYLLLJrHXeTWLY7N6tJVsks+TwC4
 Pzbs/Ur4Ql3/I+vhQPoI80SBdtvYE0hh0UiEkpjIvLNFLzliMF1cbGYVGj8MLZqWpnmHsOgKLZq+O
 KJA6Zx7Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=jdMRZnz2
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: [Buildroot] [PATCH 2/2] package/wolftpm: Add new config option to
 enable debug output
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

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
 package/wolftpm/Config.in  | 5 +++++
 package/wolftpm/wolftpm.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 7ebb253857..4e712d0afb 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_WOLFTPM_NUVOTON
 	  Enable support of TPM 2.0 extra functionality offered by the
 	  Nuvoton NPCT750 chip.
 
+config BR2_PACKAGE_WOLFTPM_DEBUG
+	bool "Debug output"
+	help
+	  Enable debug messages in wolfTPM.
+
 comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index f217322545..398fa668af 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -47,4 +47,10 @@ else
 WOLFTPM_CONF_OPTS += --disable-nuvoton
 endif
 
+ifeq ($(BR2_PACKAGE_WOLFTPM_DEBUG),y)
+WOLFTPM_CONF_OPTS += --enable-debug
+else
+WOLFTPM_CONF_OPTS += --disable-debug
+endif
+
 $(eval $(autotools-package))
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
