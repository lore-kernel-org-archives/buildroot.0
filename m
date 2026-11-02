Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8715D606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wd1rXmWT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Gyr0GDnh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DE1C40573;
	Mon,  2 Nov 2026 20:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8EDwwobbfVk; Mon,  2 Nov 2026 20:59:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 59DF740506
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793653158;
	b=N5EYz9V0+LTBzwd1zWB6WqveQoLu8rtoLfmtQD3OrkVu+x6MBe8oNyazN4TW6ruuoE9W
	 WYGV/CJ0N1pqlQa7FH/8nWylAF+tCMyt1J+LTEJ9OWmwCV1X3nesNZxA/AO/wBKlkx83V
	 8g9NECWapCCi0UZSLNT927Q15NGy3sI48L/0KMXI/V3BY/EyS9hLOtEpr3MKeIWIBdmpF
	 9vSs8zffP4jIZwVED5Ey6hg8cdEWlZSq6tfoxwGBr73vztP9pRIZUxo7Y3MhVbtwz+FgL
	 DFTKZ9o/UWGWwrQSEhknaGOFgwwpnT6swD5FsFi/7ivclyOZc83veagj3mnCfwzKWSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793653158;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JIvY3TyTMYdyQzhQ4ehPd2wsSpBoBGRL3kAQ2XXLZzc=;
	b=oFceBQRpnLMrpigSNicXzecn+DVrerQNIirqEJpaNsP0Diulok+7ztIY9KBKjgCfz0wG
	 u3Xc8bOus0vXM0wZW3DxzLjSg5CN1wNLo+VDxAO1JceshXaYoN+Kheies+mJj4o+R8+T5
	 QKjavN08K+0s72Wnjvq6/mwLzvIQsYnaUmFKr5715S6LEG1TfFyTt1sIUMOtDTRVgVcHi
	 p7KHK6eVRtuyLZ/OZN2cRtelg4TyYvqcq+kVPEkaDQ4tn14zwpGHKX3237PJfg78aTDrK
	 aWJoe6D7xm1nekKnVj3KcY4lfHxvHF1YNRQpyJaASBya+xEwR1ZznVl4TpU2CopbPUw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Gyr0GDnh;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793653158;
	bh=JIvY3TyTMYdyQzhQ4ehPd2wsSpBoBGRL3kAQ2XXLZzc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wd1rXmWTEu7C0tsYQn7PdtOixAkXz5BTX3nun/+H6Tv5yDlvtN/OTQzEta2dM+9Uf
	 GezRPPXqIurfUMPYz9YHE1Xj8/iC1U4AX5q8P1r72k1ElXwAx/3sfwYX5BROyoufsK
	 DKKgxWlknhjxImPG2+3v5XYvPJ6NxARJoONBQEO+ftaqYDRySOx8uheta3rxTwO7jC
	 0DqYRaVqf1Hgy+Lf+vrynZo9H8lf6sRr8ZqsZdqlF0HylG3/EZmNrEsYhKyX2G30R0
	 k2z4MTQo0jL9a5rqcmAdSs1PRzoi8MKLRfbAZWHi5vOTrQ8w6gv4gBw0J6Nq6vhKnz
	 BcEc8I7BnNj9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59DF740506;
	Mon,  2 Nov 2026 20:59:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F63E356
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8547F40506
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2YVCIvhlGx4 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 20:59:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9744C40478
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793653156;
 b=c95sNi287Xes81EXrX4MJ0A6O+PBIXaiGlM/WYCSwxFjLyIkYktdjrntbiV9MWGw2xa1
 1ipt1G6+splkeYvxLHFpJmW8d7R8oPvrEq+gElIN7nuf9vftsAgERWAShvds4FNStknrH
 FDmXW+aVeYGFplcXgKgz94bTCNjkd/B4uRJz8EqImbV6f0iGVCvalpGGnnQm9MrPVY55G
 8uUd5gv1j4lpCKKeVn01hF2wsQGcNAYdAOrbRHbs4aQCCgwnjHTmrvCQF+dg9tYoN2HSC
 L7mDCkTWFTFa4vzA7An+WrM7HziOpmvZmtmpRoIKyZaBiMuRbIBIYwZp+mfFEfHPMMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793653156;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZyhwkRy13J9zZ2ZZ83gyqfXuNjOafqibKzU0YGg1x28=;
 b=mBPeqNaRUcnNDxjFbnILAqCnLi6IngNHamYOSusob1StqqxPJO+5LtJAh7ntHd9kB0SO
 EqIALzBdMH8EcnpzHQCGJVILQjxnouRDcb2btjJU8hfRck1OVUCISfAtETGI2NK9C/FZ+
 OiOpSQg3U0MHX2uxPDRyWBnPHwqLPGZDOnOzSmLHwKrusJzrHWdY8oD5WSR5tNGFh1mNF
 aheBI2XbaaFtPICXSVnYlEPDIC2dvsKu5rW77AqXU0b63reVC6C+4m+bbk/kXLeQgyyAO
 GtseJXCvaxxf7Me5m/fUQgw63lhfmcbm7vwPHZahf6Ysc2RUs7ePWn2D/V1+9ZzdG2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Gyr0GDnh; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Gyr0GDnh
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9744C40478
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793653154;
 bh=ZyhwkRy13J9zZ2ZZ83gyqfXuNjOafqibKzU0YGg1x28=;
 h=From:To:Cc:Subject:Date:From;
 b=Gyr0GDnhK6n4USYYXqr1/v4Tuzi3L0UGSc0O0v7zGVwYtlLTLMoIKp/EpoGzJkMAx
 OhUkwy2N8NngHBlo+eTZWO3A/lbWs9XWkqNp7UE7fKT10Wx41kIbJTSH3hxCVLkNJS
 va5q1XtUYksRITsjVetRudZQjZE4b5kdiJfYBBdMvT9yq8W/fXm4zO5+TPLjXROT1W
 oGT1YQ6tsYXq8pxVs40RePzTcg5PQXwj1qa4yQWc1+/P9pPZtjKhHrDOsnDigGtUsg
 HyKKfoO8A07kWugisRimX4AMQLEeJErlzCY2DASyUOQ3r69z9v9B5Y/an/6N8ouln2
 z7jUL0pmx3KyA==
X-KAS-Sym: v3:f51bdf72230551df:pCYVLYdqZ8h6kZ0BxYejGm3ux1rbo3LoXm1GbxoaGLj6t
 8cOIosmOasXftgnSW1Uodem7hON6QaK0QnTAB2q02jvdwQMnCwAMLfXVmTLPkoa9ayOESG8j6ly
 la3d8OgOr0W33/K9vS8Nqc/f5uN0JTk6hoOV9ukT9HTo7H9JUvfEZPiIfYWa4iMHrhZodTJO5IX
 M35V6UbKlFH/st6+XJjtgHvpuyky61jDu70EHDaU3HFM1qgi9x6kMsQcqyRCxWVrMgFeR+7ZtUK
 2pbQsSaJFPtaChQbyX2vaUFJduF8bxMNxxB+h4FH6Q7UEHZim5mOdgsQkgfkrVmslkpak4Bw==:
 C9bEbizHjcRUQcj2+GajzXl7dkUBAY8da4EozHNGZYOoPAvfGeDXmGyLbJTSNG9UsiQDueStV22
 x0Zg5ubmDFba2H0q/JewUPjQhSjKc14WVcRMR233Vjvmj/8+low9bnV4Syla9fHzu0Wv2YLe7nr
 uDq8TDYllLLXHUpJr7s7OUs4kEbDr0EMLd5vTa7mMKBOEFCGXVziriUIiuUd5P4X3B6P/f1HEdj
 RBR2pqcio+DaoD+TQccZEN3zY4mGHgQTolHeEGsaqichoVUKIqX5U5BgGQ2zW6jGfWCWWqawLOz
 b6sO1CqTMxCUDBjBoeyPc1Z4w4AI9sVCfmP3EvqjPWVYNR0tY+/q8iZHl3KHIPds+Bsa2O3Zoh1
 z2CnGdI4dJNg5K+n1KfUy74W7C88j2WA/eE0RNezRNkzgiPbUzWOW/AXLD9JG752Ckqe70OM7d7
 FCBda8PLbYcy3E+wdN/HrO4RKhH5nGwYXfgwqF6BnKhNG1RSxm+PR5GC8wMuT1Whf31RvqUse7N
 rIYsUnOTpWuyFmSO5HUdC4ZYz1yYtgUvkIt7cChfP0vuFzmztGIbNeU0G+fINtFSs64uTC2sEYE
 Ev6vM/W1XaRPJN5LgMMdtLrLyr6DxHuZbMKOGXoeyg==
Received: from fli4l.lan.fli4l (p5b3a07a5.dip0.t-ipconnect.de [91.58.7.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65F83A4C2EEA;
 Mon,  2 Nov 2026 21:59:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46092)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNz7a-000000006wY-1fyr;
 Mon, 02 Nov 2026 20:59:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>
Date: Mon,  2 Nov 2026 21:59:14 +0100
Message-ID: <20261102205914.70727-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/sofia-sip: security bump version to
 1.13.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/freeswitch/sofia-sip/compare/v1.13.18...v1.13.19

Fixes CVE-2026-110658: https://github.com/freeswitch/sofia-sip/pull/347

Updated Upstream: tag in patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed including a build of freeswitch:
https://gitlab.com/bkuhls/buildroot/-/commits/73abebfd5d4b5816876dae85c5e17ed479781056

with the exception of bootlin-aarch64-glibc-old:
https://gitlab.com/bkuhls/buildroot/-/jobs/17677872559

  ./.libs/libfreeswitch.so: undefined reference to `getentropy'

Freeswitch added the usage of getentropy in version 1.11.0:
https://github.com/signalwire/freeswitch/commit/7f9dd270b492907ddd063be18003e18719bdb80b

getentropy was added in glibc 2.25
https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=ec15dde7613306cfa574149f61ea38ab3fbba76d;hb=db0242e3023436757bbc7c488a779e6e3343db04#l116

causing a build error with bootlin-aarch64-glibc-old which is based on
glibc 2.24. I found no way to disable freeswitch for this toolchain.

 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch | 2 +-
 package/sofia-sip/sofia-sip.hash                              | 2 +-
 package/sofia-sip/sofia-sip.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
index 4e1b2ad87d..cc1d11f7f6 100644
--- a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
+++ b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
@@ -3,7 +3,7 @@ From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
 Date: Fri, 17 Jul 2026 16:41:11 +0200
 Subject: [PATCH] Fix build error with OpenSSL 4.0
 
-Upstream: https://github.com/freeswitch/sofia-sip/pull/337
+Upstream: https://github.com/freeswitch/sofia-sip/commit/3cc785eeb186d6103ea628d15ec4915f1a59be1b
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 623b010190..e852c92000 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d2ad4e64753a7c9843b766b8de8081d9c1d7acfaeb53c12b3aed7fdb9235766c  sofia-sip-1.13.18.tar.gz
+sha256  99389b574dfcff5775b260dd9ef1bdd2bcb5a42e655bd229d477e488e658064f  sofia-sip-1.13.19.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index b8679f6961..c0d15878fc 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.18
+SOFIA_SIP_VERSION = 1.13.19
 SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
 # Fetched from github, no pre-generated configure script provided
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
