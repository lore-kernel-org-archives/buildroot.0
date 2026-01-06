Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BCACD042C
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 02:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B83481497;
	Tue,  6 Jan 2026 02:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5aqys9seGKr; Tue,  6 Jan 2026 02:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 304328128C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767666828;
	bh=mnLMa0d+ZtMXx+GChdNtBhq4QxdIkEC2KoO/s4bi8XY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MRyjHRkOZ3ZZZkJOev3fvUhJgJwyDs1kjIMiANZoYlftNvnAs0wgGIrGQ/Jy7Y0Nw
	 6/Akedixu8xNjrCCKQzjc0ToKz6pTp64mJ9OFkpqnxNdbYyo9v0cqKiwUqX2Jibw5C
	 mG3Drqaih4tgA/CTFVq7DlM3C5k131JGmwo39giA1eJD5o2BkiWPlRtbvuvNFo32Xc
	 +zomrqd0OqMPcwpjPWRxGkEnn0xmSKpoEAerscdEi9y3FAnAaU/Arh9XdeJGVvvt3V
	 ntf5QDSz9D1JtAHsRlpWW0MrtKWkgYg9G2Af48nwc40NJzf1BKlwYl/kMJvCj038++
	 j7A6LgxKfCNjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304328128C;
	Tue,  6 Jan 2026 02:33:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 896E896F
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 02:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7001381277
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 02:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmTvdW058HwC for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 02:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8ED8B8128C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED8B8128C
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ED8B8128C
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 02:33:45 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7c6d13986f8so427092a34.0
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 18:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767666824; x=1768271624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGLnk3tSaCs29Jf7X1q9vvL0pZ8eVkRer5y08iVzHrQ=;
 b=ZZg6w+sbkTveYFRpJu7oDMgYbyDUCHchieNdRdgsx0WyckLsW19kSPv0ZRb0x+yFjL
 +6GWXAPDZ09uBeK5HqBQuWQ0wUhhxxT5F8QDVV/DQ9wVT8zJXC8OhIMXKhSXLRrZsdz2
 FZ+Tkzjrb5Wn0K5h7ntCNP1bFVjBHHEWK2VYSEBVKUn4LVTmHlr8sj8429KImJn/mSJU
 gIIXcgea0WxLz0rqzaaUglxU6eFV2Ic0WnELluUl3dkqmCaYCWu5HUM9X05PrfiBoK/R
 LpM54ma+SuR3bK9pCckBgPheTQpQt9HL/M5c8XVtCnMmg1VltK0mWs0HSHdYf70wUH7G
 +P7Q==
X-Gm-Message-State: AOJu0YwBp3dftn5ac9yPPsBVFCtp14QX3j/RehB6/tURLZVVho5JkhRA
 8QLGornB5WSsnT2up/J0EIFNyCyidSWNb1j3pdjfmhAj6kvzxDElawHV8ohy5WRF
X-Gm-Gg: AY/fxX7Bds/bxhW+ZSTCl0LynzDWQGk1NMHD6KUhEGCqygGVP2lLx4or2zDyVp59RHn
 22rF0GINJlggJeGMDb6Py1fyn9ZhNXzmxw9vUw9+3pIrDzVHLGtjAcfzc6j2rFJqajunfcVaevA
 P9aQgSlrs+Jz5wXvUW4VTn+iLKl/uF3S6z8gerKTJ2a2iJGEuumjo9Oc1Sn2LtGasP5L04soFJ/
 kffJUkZDDHisCqg6OlOD5rOsfV2wAx6KczrrDypYfxF/nCOH4fcelWE/H9fVHxWNORJTC/QLg0g
 OqeWKnoEZCc1dYWVRwFyThFUgDaFxro6drBryHuWvfa0CPyYp/suOgbN5QA/cQ8kUu19kguBcm8
 eV5kBLGLb0o05W22LDWFnpRQPB2mgyUsmLU+s1U1lFIuVJzzCdGvIpx+lYUdCyIyeO0t74LnAWf
 L88bFQKHDaD2rclfIYu4gPMcIZJ8zVJnSsH+NJMnHFaFUnwokPNPpD+q6doKUozxn0M7XmSm+8b
 AteBuJ6ZQ8m1crZJcJ5maqbLwkqo+MuULwurZVPZ/q9WzL+W73Hqwz5tR80
X-Google-Smtp-Source: AGHT+IEGIG52IrVwYu0iWXKZkFhdMyvDsmK+91HXv4gN+IWF3NONsW5K5oWF1TgmLVkHj6S7xq0aQA==
X-Received: by 2002:a9d:5787:0:b0:7c7:6300:f78 with SMTP id
 46e09a7af769-7ce46cb0bd1mr601065a34.9.1767666824093; 
 Mon, 05 Jan 2026 18:33:44 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (97-118-158-110.hlrn.qwest.net.
 [97.118.158.110]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce478af8besm544615a34.14.2026.01.05.18.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 18:33:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 19:33:41 -0700
Message-ID: <20260106023341.2237312-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767666824; x=1768271624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uGLnk3tSaCs29Jf7X1q9vvL0pZ8eVkRer5y08iVzHrQ=;
 b=lK4WvRuowdvrlMc3ZwAUsx03cJxzQP9+7HLQCIg3j86RquUP+fOZpklgrv8mhYzEXs
 eJJwfwSCs3Ql6hmJd8I+T+HdwKGRNwCEaXCRGG674LevxnFs5xbeyzeKFanzgV6CN+Ri
 0EGS1PhNb9ctQ//sjr9+psrmNzE8dtIzdBF47ZnLydyr+HfczvAvsGov5u8bF0f7aMXm
 rWp+KCRPm0GSX/H04Z5ynCKdvguZmrQNM84gubZXdjQXWGv0Mh81Bob7ILDaWO4Q+ntY
 yulRzgM8oWEy1tPMz7EOtX2mzUiRq+QiB48iUWugmwMotxaYO/BpxvgXRQjSWMWhN2Pj
 s4yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lK4WvRuo
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2026.1.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index cc80fa1bbe..176da86300 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  430a5fa9f18895a9b69a018d2beae67b  certifi-2025.11.12.tar.gz
-sha256  d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316  certifi-2025.11.12.tar.gz
+md5  d8447ad858fa15af16f91e32f182aa85  certifi-2026.1.4.tar.gz
+sha256  ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120  certifi-2026.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 1f889d425d..fe28f5878b 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2025.11.12
+PYTHON_CERTIFI_VERSION = 2026.1.4
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a2/8c/58f469717fa48465e4a50c014a0400602d3c437d7c0c468e17ada824da3a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/e0/2d/a891ca51311197f6ad14a7ef42e2399f36cf2f9bd44752b3dc4eab60fdc5
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
