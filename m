Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9BECA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8EEF60E1E;
	Sat,  3 Oct 2026 08:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOtR-Sdl6s9C; Sat,  3 Oct 2026 08:45:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D224860E07
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017140;
	b=nKg9jMiJhSRjIo34oe7ufOMf70mvj+SIcGl8HKdNvV5+fseCqB0agWDc0BX3haT/7xZP
	 t7c4pdZM661R8K0ZpqmCtvemrOsLDqdhtpPGhWe4ng3zoRmnMhKYZ7aiuwRU410mlAEmI
	 dRddYbpRVOR+YhBEDccJ1GHo/PsC4iCkMjpxPYFJKz3L6LZoGQanUv3F6grknM8kTGxa6
	 X9E/n4ZZ8SpbXkUDyetiupV2hKoREtR9vGA93te7GuIt36mt24+9BGWnfmSEH3Wcg657m
	 tfQPJ9pNP8tlCjYRl67ghoNnSl9TKilCcPaTcCj6vLvZy2SkaSYp75hj5G/c/SooXtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0mALn1jwP5Mjmf/dD47ewggNcNiI9TWTDBK7PMgcLvc=;
	b=McmREmTarVmjybJaF9ottwKOd1oHi+ehgGlGaqotmLX7BN7IV7mEkLPm1jX/BtK1W4Qt
	 L9ycS6E/oq+y2tHXxv+K7xmV3hDtlrel/xXXMmIam6ZFaYq3pHAHoeL2c5mFj4hgXNz7g
	 +flXiBTHJjpN13fEtj+fcDJf8JXpelo+dk0LEXRWYGtri00HmVG5Vr3d5l9iCilkpMW5k
	 SXK6abvr+d1BlnOXdAicg0Xc3P4GA8rTXYbT9HJkdeG43lPLkCCR3ep4wUvnw9e95za1T
	 /ZAZbph844/Ti9B1yzyoBTARcwZilKsrUt164b/ToxxFqIec2iAuTJdgqGGWMakLYuQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017139;
	bh=0mALn1jwP5Mjmf/dD47ewggNcNiI9TWTDBK7PMgcLvc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YLwZisV/m/qqzplGle11wXSz06ZrpM26DJjQqB++UJ/loyqdo9JehLan8/gWqnHiL
	 zwV+ZmrEKcMl9EDpQioWfLXo0h1CyZLE+CWdC98fiURl6f9lDmAb7C/UXtuR/y50Ns
	 9cDe4q/DHbApmu4gjRVhk2gXSV+UuDkloKAO+hyagZU0sPhwmgwl7DkrYPfCJPcYQR
	 JW9uewv2LcrjY8Ga3YuaSO9BW/uyAEmeE/1wmPAYuJfvphgDc4O6xuuG1KYRM6/Jbu
	 0JAJQJCi+D6g1V9cxIGd+hK4MFUsymKruMIQ7EndlYlWLWi12QNAtcp7YYphOdViQX
	 EMy6TeUgV7UiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D224860E07;
	Sat,  3 Oct 2026 08:45:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38DF32E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E89C41001
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmt7sq9Yw4rj for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3F1A440FF5
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017134;
 b=aV5WKpmywFt02tkC0MC3BJ7AonoWbXueoZoYdDY4J2cO4ac+XJ4Lfi6mY+Te+dFFMfAf
 kgOKQU3fBnYsXQbtRG+HzVjoN/PDfNDJKWhQGjNmxqhISCtHeS1/Reoob4xa/1eLjkoqM
 1JkDejfo5yUxusPaFl2axssmzVVpX+xEyG3hG8WwYq2GZrr2gYIl46mxxDozxxLpmw/Zx
 eGfyLARiy388rQZPkFHSdR4LxVGnWoIZ+Bd+SeqJS9w73yrN9IFXy0uGOqnJvw0lCB6rW
 iD1VuaodYuzZsNV/UVmw889JkD8i+99C373bGVCSIYmDu7MOsnzWU7aIVwXoUfdy0LQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017134;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=kwq+G3ysJPtsfVSlwy8ZkFQJ9mw0ZpQfnZcan8CpeOw=;
 b=fmutzsRhtHyLgKJxbLTFiIUvu7pSQhkpOaW7e+MaW8uB6rxdesmjRcJuA4GqebkKaXHM
 n1s2LQeCl50fpv41W2t3KGItERCgwUeW8/BSrvSRFu7rxLKAcQeKh3L7eCHbWBcMiqLvx
 0HKAFzXIuWcHS9SvqVg6XeIfg9Naz7IV5jcFFPjqn/f4orXRlhA7PlDQEZfbKN+pTvTsn
 0FQtqvj0IG+KtD0aqpUw93OSA7BPnpQ3urIt5wUsetTXUvUs0T1IoYzbz8D+Hsd+hwqxc
 mZ2KJuKiTRLh7EwxhQYHFb7Cld3hzUk3beZ8+uF0sLBT6HbwiEmFYIQWMGhxPmP7aBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=H9L37rTD; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=H9L37rTD
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F1A440FF5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:32 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823d139c181so487436a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017132; x=1791621932; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kwq+G3ysJPtsfVSlwy8ZkFQJ9mw0ZpQfnZcan8CpeOw=;
 b=H9L37rTD9qcHSE2hNT2tR2sBx37GbpcHUnv08xrOwnIo+XNoHI3mD98sI6yhTo5ik/
 IrCVLzIBH2x6bYbsl7iWvcqvVhGdCFtqhpDFXCkyU85W5NCR07ML47iv78LTXNsFjlqK
 2f3s9BIzRX6hy9wqf74jLezsygRjvrEu+WNLTfnKZVb9QE8I3myjfkqkR0vK5cKf1na0
 flWwm1+y4v8Nbthokimbna2JX3C1QSZ3m4PihCaYe1GPetylo8S7htHNYykykQzX5b2c
 CPQyV6CXSk438tyeTqPObQ08kSsF6yUV88tl6+aamSequdYIpyqy/qL6WkZCdzq78YbY
 CZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017132; x=1791621932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kwq+G3ysJPtsfVSlwy8ZkFQJ9mw0ZpQfnZcan8CpeOw=;
 b=znd5AmpvKcv3hw6UrSz8FwoB8td/bvYPOKYotubQAhCVMPok0WSVaNLGE4QswjsSlR
 G6W/hoUqHoGtu2l/ETkVKLcVsJ/B5WcFlN+S6XJr4oASd1Vxcewa7kmnF9s5lsPF2ZKM
 YHZXB/VFFlOJ/NBUW1v5nZYNytNmPtxvFIAFLCvLn0ufouAd9CG+XHntzvtRvxBTnQ7E
 McDA1OKxd9vn8/zYSbQzbedZohmQ8UOc0riYpjYR7dKUhx2t3mhC+MVoSoDGPxf6FaXH
 SQ6N5SXbZl2lJODoMlJvYjQfffsinBx3iaPlfOc3BPiBsiYvQH53s6Z7TcFZkdEgFl+a
 FGAg==
X-Gm-Message-State: AFuF++ljaQ+lmtzwlbfxhFyqOuibnyhDLXO6EbSSJLw003Zj2mzoZrh8
 JfLggGB7q+aHSu1Tf8iM1KU/ao4mgxeQAf3br9FEdcibjWwcWeGwwEz/THAUBw==
X-Gm-Gg: AYBFou0FfpAq164ZK+PQtQFgbJ4aaNqVLA+NThHddlN2Wwy3+bwEPwhBaF+HjYqXGvb
 qr1o32NZA4LgNkrr2JKziyCE8RD5bw1U+LROhqAcNuEHZJ7dl0DNSS9QjIuTy40MzoZNVp/Yn77
 7rCPESbB4xSG4cjxVkRS7FU39X9PPLA/dHr15pi4hJvMBA2GmspJ9FbNqSMrk8JSeLuafvy1LJK
 m8g4jlDNxfgSgK41b8WVQkwzwkdc2+dA7iwSy9VAtc39Q6Ij8Tqa08k+wh7hRyWtz8aiQe2Dzba
 +Zc15pup49mf3UZksSNn0X+Tf3dPD/SlD4pRCYWYPChS+GbzeWXj7qmkNPO8bmqqBOtHTxdpzbH
 DC22d7/UeeoJQtV49LAty89DihbZJdjPDv0ED0JPnVOvYjCXTlT7sO6QO58BM85XD/NQvA1JMJM
 TU7CKVLU9BGu+iQbUJhYc4L5PFoIL400ncNDr5jKYyd4cq6qiz6Ux52IRm0k1Yh09+gpbjuEfWV
 LgeM+ycsl7YB6B7iiIIj/QAhdG603MwQ6m57MEcyYJxF2lHWTjxjAKsfHJcJGXkHATZUWtxAGrf
 0EIZUGUMWs+UJVyJwzsZ/M2xfP0v1Rjeb7YLinw/AHEtICA7+5Q5CtRwZWTI1cksNCAoMSM8dPT
 4PJxql5j0/im4Cmq7pc6nP1gf0YWHq1c/sskabvDTXITjdHq0gk6y
X-Received: by 2002:a05:6830:82cb:b0:7f4:bba7:f547 with SMTP id
 46e09a7af769-822843657f2mr5290519a34.10.1791017131913; 
 Sat, 03 Oct 2026 01:45:31 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:04 -0600
Message-ID: <20261003084453.545653-19-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-mpmath: bump to version 1.4.1
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

Update license hash due to copyright year update:
https://github.com/mpmath/mpmath/commit/ffda440b4d90bfb6c0b78db9f9e4a0171b2e77bb

Add the host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mpmath/python-mpmath.hash | 6 +++---
 package/python-mpmath/python-mpmath.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-mpmath/python-mpmath.hash b/package/python-mpmath/python-mpmath.hash
index e402647a59..2c50b2867e 100644
--- a/package/python-mpmath/python-mpmath.hash
+++ b/package/python-mpmath/python-mpmath.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mpmath/json
-md5  d5d17bbefea73eeb959967351d905306  mpmath-1.3.0.tar.gz
-sha256  7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f  mpmath-1.3.0.tar.gz
+md5  76a2228197ea084926c3d72c31ed1a28  mpmath-1.4.1.tar.gz
+sha256  efd6d1b75f09d69524a67609949812668b28e81ecbfe0ab449ced8c13e92642e  mpmath-1.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  c26cae81da4508e5e249985777a33821f183223ebb74d7f8cfbf90fe7eef2fb7  LICENSE
+sha256  01cb9dc26c9afd5804c2ebf72f9ef03b5fd48972875ed59a483a45f441971f1e  LICENSE
diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
index 86a3562d04..6abc5abf4e 100644
--- a/package/python-mpmath/python-mpmath.mk
+++ b/package/python-mpmath/python-mpmath.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_MPMATH_VERSION = 1.3.0
+PYTHON_MPMATH_VERSION = 1.4.1
 PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
-PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57
+PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/c5/b0/6de8e78014ff1842a90cc9a56da6ccfb598a5390ed0257fcdb7d9680c18b
 PYTHON_MPMATH_SETUP_TYPE = setuptools
 PYTHON_MPMATH_LICENSE = BSD-3-Clause
 PYTHON_MPMATH_LICENSE_FILES = LICENSE
 PYTHON_MPMATH_CPE_ID_VENDOR = mpmath
 PYTHON_MPMATH_CPE_ID_PRODUCT = mpmath
+PYTHON_MPMATH_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
