Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA7606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BbZ8f0nc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9313181109;
	Wed, 28 Oct 2026 15:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1I25UNGPi-FO; Wed, 28 Oct 2026 15:51:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C767C80F32
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793202716;
	b=OzHobv4lNsUFMuchet0nYVwgNSWPPualdpvD9NJZGC5OiWdIKTOeNnOMtMzvCsnvRq4N
	 LDBpmZVJEPgoCGZjAaM9yXI1gpk8rU3PgKEXgYMiPSQiqSbRiCaAWr/d0DUlb3WMz5s41
	 M6GHHRbSa+0d+TwOFGactWWiyxp7IQebdAR4LUd4sZ4C1s5HDvwWKqj1LlwJaQJhfgmqx
	 6xrA487gUek/YruZ4Y2+edYb5LppN0NuNCBrgTF04TpV4O5khRYs3JAWfqXdI7OFDWNQH
	 0bTmtSyfVD18zs3bfVrdzjrfWXfynZiWzOB1kWGQCkivWlvfBD2ODKXtdQLM2Buj1RQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793202716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Swyie8NiE/yPZZjeWQiqsDquz87QxuUesbek+Vp9oWI=;
	b=bKRtn0PKHhyjrKpxQ2qgJ5PYDc3ivj0S3/3HCkorO5lzyD+H+FrMm7JSDlviaT+lG95C
	 5XQwYR4TtyUHmBcx6E4yw9NTvdQ4DL1JH8EWiIZkGJRTTXm+HJnwtawY4vgH5C8vX1QnE
	 V707auQ58ZAJKSopPULqqcEbmwJQRkAY3vagM1RtxOri5TJvHdIhkDTSvJZjtcEE0+ZSe
	 BgL2toTOEfG8LVRCyEEq8QPjMOyi/yTO0RN1DXV4SNpenHOtp2rLZCSSKOn/3QguSudmA
	 sUEvND+tzP7CYph9lGNUhBzOukI67st+Imyb2KgxKadVYzcvDfHUK5X+4VL/PX1JOKA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793202716;
	bh=Swyie8NiE/yPZZjeWQiqsDquz87QxuUesbek+Vp9oWI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BbZ8f0ncBXTFQVRKds83wX5ZfUnQIZ8nizdF1S4Senmea48Eux1u4CNAaxX9QcAvl
	 TL7hBl13SVkncH+nR9CcDCQTqcizCf/G3VaSmjWweX7I1pDaPdPU1jNf50LveVG5WS
	 wY1IE89RvMLp2sEUA3YA22bbUxy6ZA8GdQLIltFDvFEM8v10lE+eK/QCpQHVT1EXp4
	 UI+65iJ5Af8VM+wH2p3hFB79Ldu9RxOG9B9IGSMdp4XccTxlS4xoF7SPAmDRCxRz4G
	 LEcJGzVkCtIGgQPxvlcgHBvsrW4HAuIUnDOhg/3bYNMXBbTdwAjKBJjynY7gYpLAvA
	 tfoU6s/3mJRKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C767C80F32;
	Wed, 28 Oct 2026 15:51:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A3214D1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 701E3400AD
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eVBxFTuNDZ3 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 15:51:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5CF784009E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793202712;
 b=U+/wywDgfdPQ4eMyFvMG5s6zhYreShZ8ryO1Gf3tLgwDgjxIEmqrZ39AwJZ7hqcgSmxw
 e151DZ2o3/owMybhfpo8V2YJEmgsnAIaiYdpm5rL27xk1J4gTVJQ7StYEIrQGRilJK+iI
 rIAKT0ZTQJsJGTOFrswwQdOVYSURIXUUKyJ3EIz78mS8+4qKbDHBdWRxE9vBpK7G6uo5w
 optBOPa/ZVhB7FJZ2TnIw9+HXrkGluUJWF3cQH4KwJWlIQLaPC4tf7SumJNuPiI5QEhwj
 IQOZcZ4Jyp6Y0ir5HnG5t5aZjcws/QHA4wPdVxxWgMs0p+eV0ahkh3akTgLjWG3tzfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793202712;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rL6rE7ntBv74vGt6CiLrqGrVVmB8ay6tNhcs6amPKaU=;
 b=TUeFH9DS9Aj9bmMNVdEw92ktiWi1t1jeoFLfE1EgTHEMt4GUcmXn2LOd9JW+zbUAl7qe
 aQFOXQkYc6D2CD/1+WUD/LXMjVVxgRB1O9CtIlt/2X0KeleVmlagoMNSRt1CEjc1+Cn9B
 R8ygRRRb9iuZd0qqILtftqGzTtQg89AJKGuI3QCvI+YN0olSVulp/nKnRhwWIB3A80xKm
 54PK3nWaHupdRSISCrnRyQIjBPLlUlLFhk/l/zXrVcPexI4bxwUe/P7q0rZ8I1alCX6JZ
 AdhNqflNOBFDqJzZVFjp3JavDMGvcSb3Y2aLjNWk4lEm3LZBPu/iWZWgUfzYDF4Ozvg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=s9qvu1Uc; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CF784009E
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:51:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTmY-1x0jc21wIw-00SsBM; Wed, 28
 Oct 2026 16:51:40 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 28 Oct 2026 16:51:21 +0100
Message-ID: <20261028155122.3226008-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028155122.3226008-1-fiona.klute@gmx.de>
References: <20261028155122.3226008-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:fRQQSvCxk2KO16LZErKKnY9i2i4sVapAU3QDDHrv2F+o4iaSjbB
 9OAxnSOwZZGRvKwRQRGYB43LgbmdElF/DGufmGZh6PsKi4s3jlwrmS59PhBcBG4ZxE2m/eQ
 QxkxCLKNC0J9kDvhOf/Znu0u+9lv5AgWpo2jZgDVKhVrmfF/kLL0gzGpBM2lvc4w5efXarT
 WDwW9oRdid5UdAHRWrY5Q==
UI-OutboundReport: notjunk:1;M01:P0:PYqJziP+d+k=;lHyzEr3jklQrUGhhOWvSXnC7fXN
 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
 iOD2J2shj9za034Mpa3eAiiS
Subject: [Buildroot] [PATCH v4 2/3] package/tpm2-tss: enable host build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Building host systemd with tpm2=enabled (to build systemd-measure)
requires tpm2-tss.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/tpm2-tss/tpm2-tss.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index b9653ad33f..9bb3b9d677 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -50,4 +50,20 @@ define TPM2_TSS_USERS
 	tss -1 tss -1 * - - - tss user for tpm2
 endef
 
+HOST_TPM2_TSS_DEPENDENCIES = host-openssl host-pkgconf
+HOST_TPM2_TSS_CONF_OPTS = \
+	ac_cv_prog_result_groupadd=yes \
+	ac_cv_prog_result_setfacl=yes \
+	ac_cv_prog_systemd_sysusers=no \
+	ac_cv_prog_systemd_tmpfiles=no \
+	ac_cv_prog_useradd=yes \
+	ac_cv_prog_groupadd=yes \
+	--disable-defaultflags \
+	--disable-doxygen-doc \
+	--disable-fapi \
+	--disable-policy \
+	--with-crypto=ossl
+HOST_TPM2_TSS_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=c99"
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
