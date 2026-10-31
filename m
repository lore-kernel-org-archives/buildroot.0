Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77963606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Hu1Ft/2V;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJfda5qg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4114360838;
	Sat, 31 Oct 2026 17:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bf2OrjbKbLW6; Sat, 31 Oct 2026 17:21:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B943460829
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467270;
	b=IPczEWCXzbjDj9vbWsdxYQkon+AAXTHnoA+LAKszvhOuc5tOPt7EBE8qCWcHXNG6vOnu
	 DJXi91k1ptSOHdV+NGlSanlhitLG8DeJ2m4bcWclJzmbVs47So4b+XKloDYI45WVznr9v
	 wwvotLE4DSjtXGEE1MZTJ2DyFLrtajAkN5eSCtVxJy2RlWTQRCV436qotFnIUzb1pwmnS
	 1iCGoiAigSqYeC4d1qFBs+kQH9RXCIfhjQj0jOpu/KqhYSnL+gJ/xUwHd/gA/PKvDFkCD
	 5U8vZ31JEqQIPk1iPWWPgMwJqwQTpPYQxLCPoTA+uTONIYvYOBNH2F5ImQlvZknYHdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=u8PKd9WoWnNcnyIVM1Ay5tKuwDOlNpl274fSoKFR9ek=;
	b=JhrSCMBah+Hhv9oZui/3Q4d3wj5kQQNTcZOvwMDTHmomsnJhX2cZSabCcGPLK5k3/8+D
	 0g4TqzeyZwTnZDW5JekAaNO3+AFUq5lrPYdQ909ovdRN+7Nk9B7Koh6W63WOjwCarQUfB
	 6FBSYTfLoZq1z8xBPWSQmFmrgLGjvreXgOl0qsnOndn8Q38g3a1gr2w13hrEkR6DARnQZ
	 bpMSbLwyfLjOHJp9ydoll38BYjtdYVaLUrp0q3Zzd6tA9t7rXT0EBnaMwTTSXgv5zWZZ4
	 tMTC7mbpVmSfa8fmyS6j6BdyALN+90qmryaXPhzmDpW7LzHDb9dN+drPPDes/o0kG2Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJfda5qg;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467270;
	bh=u8PKd9WoWnNcnyIVM1Ay5tKuwDOlNpl274fSoKFR9ek=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Hu1Ft/2VJyG+MNIBarSO3NuVjGY0Q9h37uWfSMLjzANXp2gfKG5yAxPgUhk6JVjY3
	 x8oiJqnQN2/QbYw6xzAgyjcTWSdgFlabmTcXTvHPCsRy5wWeFyhDYT4CLnYGBsrtRh
	 6BHtG/fV+HMT/Wogf+Sy8KJLQUKlEdsjQdawKRoZftcdu2rAdFBmmFXfHat7y5V5kz
	 lIhwsK6p0IE50EJzGeXymOK6A0bVRwgBtrf8iBA8rT5dI2vtOnv9tLsh7ywWLS/5R2
	 4MCVppCeJRevQ/GAIGzlzNFAorW7IuujWlHWl3bjej1Lu1YXxshQY1wiWZnBIPWDfc
	 aZanUI6pRRlZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B943460829;
	Sat, 31 Oct 2026 17:21:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA419411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA5EC60763
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0ckyDtOI2PJ for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0E2E9607EB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467256;
 b=iAhkL40R7qLrccnHJEBZYLg1rGGrZuuJ0C+DcMxnR9lgcpF8cGjmyrWic2lIEsNLAhDX
 +aY+rp6t9vd8KYtVTu8DG9HCIjQjd7EckJPsjb1MKB2zYjFT/c9kQZSw2mm7ix+HEbL4n
 CZDqXBHia4bYDREa/KKyyBaI7vMVw9mx5Nawbf6KKjjIy20rLIa9BV2UomXU4/hcItrke
 5LSRP9oRwCRptoLdzqXbTsqMYPDbVQ2ALfSVReUYhCIbl9cHXMvE78YNlSGqc/IDHMbNA
 ztMm3+RK/gxnWNtXBub+bWA4u1ibaNEDbts93mQ4CeSSs6gz0obsHOHkWcQp3Twc6ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467256;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=lEVnr1xxiC8vENphOTqZlVGpt5JyvPpPeuZGDmiPoZI=;
 b=gJrgTQ9GJ6F0lRUPGy+cLLmVj4A2lj7497S35rjDvgHn+ph7BQ7d63ywJ2ZmntcPrf8J
 jIxz9QFc7XFeKcTVztPlGH53ALG21RU2SyN93btQa9B8+M5VJ9cpN9AxqOuA0ckNbEczl
 m4OqNtTnDTkrn8hNY+DvQKPGxG13kDEWb0Eju12v1I5cuXTU3p5COTSr3Ulah2ovotWrq
 Rp+pi2yFjwPmg5E7cBiSAGVT7w8d4RjNKwuDElFZ26MkF/EUzjZ2OTIO6mf11+NmveLWZ
 RX8ZOojMiK6L15X0fzS+6oh+e9wO9rxcko7nC3qMNut8oSngG3O47DUPLn/tPD4VvLw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=WJfda5qg; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=WJfda5qg
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E2E9607EB
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:55 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-85a5455bd3cso1028943a34.3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467255; x=1794072055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lEVnr1xxiC8vENphOTqZlVGpt5JyvPpPeuZGDmiPoZI=;
 b=WJfda5qgLEIP95GfyoQ9VT/2jM1vuPahYTGSdxUNUq8mWNmjbvak9Lz858Py3VM4DA
 Q95iYeTRClmoryECCy/1OswVlsw0OpSBv3Hbp6NUGzhYiSatPMzOFk0epyJEOtqj1nDu
 BMSWJUS6EYhgyPcPuNLvgDvT+FIO/i8Wbuqq5iKgBahTk5O3Atl1vszIIhO8m4vOhc/9
 USmqpmnUucT4ThL/XtAuQPzA6whkI3NMvfXv2JSTz/WzjshdA4BHljCj0zKMW8HCXX+B
 +hRkmcB7cOTX+Pi6EGZdPz20RZSuCaQ078tLEW575TBS8Q6ZYvJgx+39fG6Tvq0SoCH4
 S8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467255; x=1794072055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lEVnr1xxiC8vENphOTqZlVGpt5JyvPpPeuZGDmiPoZI=;
 b=BjLmEdsUzWE3JN4uC287KlKKXRMMa02FsKPHjwig/xoIKGW8Bq7EfLY5ri1aJAMwVq
 YXosLb+AIzX029xKtOQ8IWxmmgQ/0L1oBPHjJ6i0HrGZWFRSuTLIcXo/rctAgQm2sUx/
 mQSJd6m7fBjxi5J9HPXxkvZtrNZmLjwXQxp68/JAiF6/hAraQ/Sl+EbzOWiZq1o42aMl
 68fJel0mdLp12PRI08r9+5d6RRCwjyVjKYVKCkRQCtxH4ryd9tI+k6WIFvwkbBiZIr6c
 bLiPX36De765x1LJur5IyRMnukc0ZCbFSi2Eanbenx0qfHzfbOIKmDsHrURqJGQNxT7z
 KQVQ==
X-Gm-Message-State: AFq9FYJK5WVv2FDKvW+xCvPq/mTBbEBZLnWb4wE1ZIOkP4/I98HNlXzJ
 SWoiPnkWcla3PffsELIQR99ixTCHPOQwyn5KBVBkDye9CM1CnkIB2rqXV5AnxA==
X-Gm-Gg: AYBFou2JqW1rmNGzZs8GYQSV8OiJ5y1K7uzfwNCI68eDOrYp9bogxzpQjigFeP7nm2k
 WaCNfgRuS9B2GqjcpyWdK+QNIae+YUL0U/WTwLhwwNX70+F9gf8TsexBiO6YtSZQDTC7+KGA/8z
 QN18wG2qtfwnjrmke0wG27B6nw4exJ6nQ4a7MI0hSwL8T9Od+tQl9hSBleu3l0kzUGiA42M7jns
 wJDs2Szff/7r4a9/HOpgIhKEh0Dx555wZyhsoH54WE+3b5+2irvOTC+5vfl5XpUMJTzG39Tn5Ow
 EBDj984T5C8DRqoN8J7RwXYIi/xBm4pwvICrEhjMOHBlVasyNi0ClS61FRc3+FpTTTTvNo+mlfC
 3yVJy5GFyG6D1nQ1xZURpy4FIoqXpvdRM0xXOvhUunPXCUi+Jri2RpPbLZX6dNgkBBatXCHD551
 pGHrCI2XmtHvDkjh/ly3G4e+HT+B+a4ppaxOlFV7CTztiZ1DQUBQ7FQZK0aehgUwegHYdgYSQWH
 vOE5v/exiWjHdX+E3Klgt8wWwmRl3jb/nGcNHyJ1Bl5pINyhkHBGhrI8/nBG11Fvxzbh1vqT3ks
 0xa+tIL5mhw0aufQmSTyqBOFv15ercIF+DunxBuChpr3bCkXrPuArYLrNORpGPrA+jCcPZFyGlh
 0PbGj+j/GpTPNzFXoyXzOwkHAxh/jQae/GV4MiII6pufev4nBdS96VukAd1gstXEo+DdoDTBQTW
 7rr3MwpQF0+uAs4KJm1z8tEqFmPNrCqLtypqhsegWbrBtBVsmqKfbdFfJqCjZDexhWIENbogPpI
 g==
X-Received: by 2002:a05:6830:2649:b0:845:3cfe:5f1 with SMTP id
 46e09a7af769-85d3640cfd0mr4570231a34.5.1793467254828; 
 Sat, 31 Oct 2026 10:20:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:48 -0600
Message-ID: <20261031172019.2683287-19-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pytest-asyncio: bump to version
 1.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index 3df3a36190..f26b450a5f 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  2495e68fa8e724cb6c69460d35a8f177  pytest_asyncio-1.4.0.tar.gz
-sha256  c6c0d2259945122819f171a32ecea2c349ead889ee28176caaf492143424be42  pytest_asyncio-1.4.0.tar.gz
+md5  51f6e86e414e3c0130deaa8e29e04425  pytest_asyncio-1.4.1.tar.gz
+sha256  e8266eb094e5ee9ffdb2068c9836f33e209ea77a970eb846933d416b5602669b  pytest_asyncio-1.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 54f719f21a..3dcd9cbcaf 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.1
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/43/7c/d36d04db312ecf4298932ef77e6e4a9e8ad017906e24e34f0b0c361a2473
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/f8/9a/887535e477847f5159377ab35303923644840b13c0ca03c0a467f84d4680
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
