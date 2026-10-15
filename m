Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADB0CC6B2F
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 08:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F30810AC;
	Thu, 15 Oct 2026 08:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAujuzXjvRhp; Thu, 15 Oct 2026 08:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D98288056E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792051254;
	b=eH9K2+e6cyJUQuW68NuPmkGVXujnE6gcvJ/YRzgXXD6DJY31IbOu67znL1HDl+kgJ7He
	 LsE4+81hq8+L7AZW0UUzDMfl3JnOAmooe5wqZdjdQlxDj4NqKm/ehVOpXhHPSK6WkA10z
	 O0QElqwEH05xQJSHdLxp9t35JJoVHVzpd8IsTEPAtjMAkQ0RJ/YgpzT3J2bHCe/zFB58k
	 I0Ked/FqJkrKcebz5uAxIMOcFX6R0d99qFmpD05WxqzXsCReqNR855Ifmy0lqPRDipq2y
	 sdt1VvqU9TQOyQG1ypDb0/EbDzqfA6y0qDEnrmBBNh4bIRE3SRWR89kQ9EAXgkPzJvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792051254;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=t+LQ7Qgtq6Sbbd/EjrTEG4E4B5NbVRIiMaleMPmLyIE=;
	b=o/GCqLvOAFRCBerFcoHzKR6ZzyiTDBDyS2IvwwRi1doRsT0Su5Eb3xEpw2imKLPybFhH
	 g278cGd3VqJkzZD3a70OvoKZzk9GYbPcRGZhbTI/4vKf1X24c+aHbsSBS/16FtMHt1UpD
	 o8D7cMnfTZq8ZcTvuNTTZA2c1Jhq1rrLnc1jNWYtTVngtKqyRfXFFd6izu1O1HlF4ziCw
	 wyqslF5MIcCBJ0vxP9W2+jVYrya4CmbqfEEGvM01y/dtHzFMt02mC7VmnM5INe3dmmCxS
	 0zbxMTPc0CcHMqT89OIFC62fiDkDw0vwOdu5YWC6Sts445DM+IpxQ5fRHFiSc84aDQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792051253;
	bh=t+LQ7Qgtq6Sbbd/EjrTEG4E4B5NbVRIiMaleMPmLyIE=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PGtFp1WBjVRnBbz1ZtTZ3Pt1RR0RGxltKkZyQA7aTtSx7HD+JmNNczy5bArHOSSuU
	 bMKczB8jqKPK828hU8rkHLZi2StFjOzp7OG7xOpco6CHQ891IiBTHfz2t1O5YqBogj
	 omwfKo/h8RbfkXVNrd9mHNqbKuFDgUoGMBEO444WYPCarUtPqysToTW+jmltif4/1v
	 588+z87XdG5H3gMnaoyCZJ0mfUl1VzmRJdKeS+ofqnpxMYB1STsSsEXls+/8/VrNo4
	 isqPGVf0n7t9l2LxRTyp52x2mQqPCae4vCysV9hmODkT3KV652IX7g9APYBQcQBn8R
	 sdmJfCoi08yZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D98288056E;
	Thu, 15 Oct 2026 08:00:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8BCF769
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA82A4009C
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dyjvt41ZaCtN for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 08:00:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 540C040053
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792051247;
 b=n8bmnN95AU3inljVjKJwkS6b504Hg/4d34OPrmy3wWzUC4TsSdFSTENhva2izS4WSnb9
 20JN9IljmwSplk/8XJPu4AXeW9JDJ0GjE2NIV3NPkV4sUa+xRGW3z6vvi0cSrDiFhyVj/
 7OUCz+8u2TO0q4IjeaMmN49d7bI5GWT7pUuguR4xYkVRf+/1gussb8771GJpEHqt5nIGx
 6mc6p9YZrhbEIVbO8LgChEdJhYRxw6CDgnkPDel1mu5I0WzmRGlvhoW0qbPY9zbfVIWC/
 SVvI01E1E37AczeJb0vx/NAdx3cK7Mzs8oyOk6KDRfnhdd/6wP8ij4gY5Pfg/crQvXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792051247;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:Date:
 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Message-Id:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
 bh=S2neZJ5gqr95SbcfqaweEMCOdw/3ypsKhmc+SzcJ0pQ=;
 b=NBIfDrocDU7J1fKUAwau0BAUY9EgqCoEI/R5sVoCtvxUKddlPMlNQyLAjln4C6e6E7gK
 3erDQb5Qak/Lf7TvQTy2lSuYb4xAD+CSt80dtQ6a0FqJKSiAY/xMRMr8BCQgBOfoAaQMg
 kw6+I71UymFPetBiFXadKVygi0Qe27nacB+uCKZIzBydKGpXJ2cb8NitYHzFr3DW3fons
 70Tv6yWcj8Xq5UAJZhmUOIdQP39VeXKOGVI5WNzjVmCtclA7lF2hYQih/PubXCvIZw8XV
 L4Tr36Yw9t5f0gPWOC/SDRNRnwhhtK2vANN7JAT0PRBFOzbP9vcvfCNQWyejwTsgMIQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XmoFB91F; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 540C040053
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:00:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 034EAC63455;
 Thu, 15 Oct 2026 08:01:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A985D60360;
 Thu, 15 Oct 2026 08:00:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C20010328B00; 
 Thu, 15 Oct 2026 10:00:29 +0200 (CEST)
Date: Thu, 15 Oct 2026 10:00:26 +0200
MIME-Version: 1.0
Message-Id: <20261015-perf-fix-v2-1-3de446bd18e5@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fengwei Tan <tfx2001@outlook.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH RESEND v2] packages/linux-tools: perf:
 explicitily disable rust
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since kernel v7.0, perf uses `rustc --version` to know whether or not
rust is available. If rust is installed on the host, this `rustc
--version` works fine but then the perf build fails with following error
(on aarch64) if the host-rust isn't selected:

rustc  /home/bastien/embedded-linux-imx93-frdm-labs/integration/buildroot/output/build/linux-7.1.3/tools/perf/tests/workloads/code_with_type.a
error[E0463]: can't find crate for `std`
  |
  = note: the `aarch64-unknown-linux-gnu` target may not be installed
  = help: consider downloading the target with `rustup target add aarch64-unknown-linux-gnu`

error: aborting due to 1 previous error

In perf, rust is only used by one file of the test suite
(tools/perf/tests/workloads/code_with_type.rs) so we can safely disable
it.

Always use the NO_RUST flag to build perf.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Changes in v2:
- Always call NO_RUST=1
- Link to v1: https://lore.kernel.org/r/20260727-perf-fix-v1-1-6bffb9146263@bootlin.com
---
 package/linux-tools/linux-tool-perf.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 3238948d76..8c91c2cc6b 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -29,6 +29,7 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
+	NO_RUST=1 \
 	NO_SHELLCHECK=1
 
 # We need to pass an argument to ld for setting the emulation when

---
base-commit: e17cfc9b3b728059d97f9f8c4d890b4444125d1e
change-id: 20260724-perf-fix-f14d1c7fb681

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
