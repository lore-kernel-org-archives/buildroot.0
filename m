Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12848606A31D
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n0KEA+Es
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D30E880AC8;
	Mon, 26 Oct 2026 19:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfYLBKZ8Ns5z; Mon, 26 Oct 2026 19:10:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 14DDB80A95
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793041820;
	b=TpNiWbKFfLrvPko7k8H1oV2RSDk5kSSeYYp/h5jS+qbreYGuuhpdtUf6Rf7hEZTYyPXK
	 TOSknGcpS0u1C2Do4ZmaTeKwLMe4OoEoecEj2MMQv9b8fAz/OreU0UJQQCPrBOH7Smfjp
	 RYAgmpVpvG7V5qSSRJNUNtHeLa+N6eIhlAuVIR+353F7eMcjAsWFbtTbmtbd9UTkTbIrH
	 PCNbvMvlsBEbJ4r9atYJPGaZazLU9Zp3tw7h5nn9DPnS3UtMpptu8wERXqctADBmpKJqp
	 ykyIh6zHZFxg71Zvx0EWmqhCUuICnMCNGLgRcUUwfJMh7Cm+PspjqouvYsqe4YeC5zA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793041820;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SLw2C4ZBAk1SACnuWGUEaJfXN4nEXNkSvub51s1gyy8=;
	b=I8IEy+L1PHsu5SWqqPJEmOd9FIBrzlYqEDY+c1/OH0p1CreTjGWBTlNA5ho4lXj2r8qI
	 DW476pE/1QvCVsMtd4SexlxRjLArEUxxc+Iww37nmCdFeXzcrlVCRPvJwxqLCqHPFvjma
	 NIIF5Bk8Ohl8hC1aqmXEqB1ca4G7JcqAz3oNiFvUcJW0tBktW8gczIbOlopt3HymjA6dE
	 1HNw3oTNhktoshagAw1RDAc8UXtj5nwzSkBAZ/pW4eRHgGFfrzX42girAvdoQY/gAUZZC
	 XsNUcpUHPnwagJaWbV1jz/y01+8jp4YMkYe2X3Q9bkuDvcCLe0F+vDlRttZ5ft2T0oQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793041820;
	bh=SLw2C4ZBAk1SACnuWGUEaJfXN4nEXNkSvub51s1gyy8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=n0KEA+EsQIGgO/E5xLpUJjveF0Z5cxFLwMEKwi6+1zHxQzmtDYDJHX8ePrKR4RFZX
	 UNeGxdS8g4yA8YI07qtC1SdXmDF9ahw6s8/5n3HtTJHsPzwTO4gm3zcukjtuTMYHgb
	 r9jI0z52SYkltYBAZMuS0VQdIMPFwI79cgsLsINBiSJHknHkaLthaPcrlAc+YqROZx
	 f+mlInVP3XqIGXVIIgigTk4G5qA2Tb1FYIStZPxP3xY0VFIW/8ETBF6/Qk5IFnNvjJ
	 3yziewnaQ4/36Z3E9kb6V/izzIB4n3UzwVhJ6UudjnrhqrFPPz3uCXbSX6ID0e1H7x
	 e7qHX8kJ0zJLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14DDB80A95;
	Mon, 26 Oct 2026 19:10:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBED5380
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A13F2407B3
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acS4fl33bJ10 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:10:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 628AC4075F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793041818;
 b=m7pyuTsqlxBeQF+C4/cBMX7uKH1TuMEgEY8wcuba238D4urLfuAF/Ck4va+/FT9KYzK5
 Mzrw9q5jnavmys7Ti8tUFqG3Nc+wkLnmyg8satTHYm2bZdtKZY/5Ic9CHPP0roaf1SmaW
 QgLSxy+6bQgqdQs0WFotBC/fEz7J/KDF+KoPuv83mgWBrlg28xpyikSt+J3FBtjmri5bR
 k2kT5sN0dY4KnWIsjJkX4qEuOjb7ADx4ewQCk6eK+Sq6bW8hwqDHbxg+dhpmmPGBjOvP8
 Hj99yHXwj53INM44pbiRI20G5/SffeprQB8vP/STwxa1SXVVnlnzvs6g34aZRCrhMFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793041818;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=JcF6HoUR7z0CcUgIuKEqIdWllQxOYyB3V2JIwFQI8jM=;
 b=ma/iDtl5uQlp9xgw+R6e7XX4J8Ypo3ZhbDltZXfbAUpt3rVlgK31QHlP7i0iolmuHNZ0
 6kzozZTVWh8oulcbMKjeCuCNKc/p723dUsugAcWPTiW8G24sSpDGBkTjpri1H1YIMA+vo
 Z+rYvx97BJjVBthHlLAXtIhB7X1JzgWS+Kr3edNXkSLG35Hf1JkpOHLWKLAjfP8EaWNr9
 WDxVOfcXDh7gyGrAjPIs2qldZDbJ///SzZLAs8zWbN+EvXkQRNlJG0OFH8j408jY/twWV
 juc+YzbjRc47X74GfS30oYBTBXXD1QwaUAlYR74ROKyHqEp0JI9Td9Fg7eRPXh6K81g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=OPkRZM59; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 628AC4075F
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:10:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqs4Z-1wqBs20bwH-00dsNv; Mon, 26
 Oct 2026 20:10:11 +0100
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon, 26 Oct 2026 20:09:55 +0100
Message-ID: <20261026190956.376568-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:PVjiRqWnxSZIftHAQd+klMlWT2zZthDZugWR3v6iOZfWkgmBcnq
 cB5HKCAPzadWTqUqSbF2dG4jmMDxVN1tJVdUkSff3NjsfT4S4sVc31LEqkXIlr6RUPMkV4r
 jw1VnkGFk0fDzW1oUVlavLY5dhsCGtCLewqd0G3LgPnEfaHUfGPTbmSRF4TSWE4FdJwaiIQ
 r/XNLKQaS4GrMmk0Fsi1A==
UI-OutboundReport: notjunk:1;M01:P0:NMLgcf7ej8k=;TUF9qR5ibWvQ6kpbrP2M4NLVGnT
 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
 UmjuIWh/lNSD71azo0yUY=
Subject: [Buildroot] [PATCH 1/2] package/swtpm: security bump version to
 0.10.2
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

CVE-2026-75900: Fix length check in SWTPM_NVRAM_CheckHeader()
https://github.com/advisories/GHSA-gqrg-h59c-j4wj

Upstream changelog:
https://github.com/stefanberger/swtpm/releases/tag/v0.10.2

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/swtpm/swtpm.hash | 3 ++-
 package/swtpm/swtpm.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
index ebad1ef4bf..4f6cbfd61d 100644
--- a/package/swtpm/swtpm.hash
+++ b/package/swtpm/swtpm.hash
@@ -1,2 +1,3 @@
-sha256  f8da11cadfed27e26d26c5f58a7b8f2d14d684e691927348906b5891f525c684  swtpm-0.10.1.tar.gz
+# locally calculated
+sha256  f61cf6f1e9bbcb4cefb30b70cafaf1c4df54c6961e65cfa63830e8ad0e220134  swtpm-0.10.2.tar.gz
 sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index de7f2fa05e..d6559c22d6 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWTPM_VERSION = 0.10.1
+SWTPM_VERSION = 0.10.2
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
 SWTPM_LICENSE = BSD-4-Clause
 SWTPM_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
