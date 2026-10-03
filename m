Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAC2CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47FC540E62;
	Sat,  3 Oct 2026 01:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeTMZS6XWOsj; Sat,  3 Oct 2026 01:48:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6FF8A40D07
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790992135;
	b=B7fyaWEIrQYBGuQm5QGkST9cQaoMJ+VHJr81TqLsgOi9FoqG4pE1xDO2knpDQ3qEGtuI
	 nAH1Q4r2kIE/DT0Z4I3c5lrVAAm9kjt8GJ3RVgO6gUBfzOQKT4AqdehOLO/CwAP3TqyVA
	 VsgFY8dD/Soz7YybcqtOZn3DJTtxB6mL7/VAF/ZEIKB7k/bFcrxNbTrO/hpk+Y4wqV7/l
	 t8Amfs0y2HywUA2jpMMWe/aFJzuQco6cT7ZEO+P+K9OO2/CXW7AS/KZn3aPyh7bitflpT
	 3511LUdidDaZeXEHJ8X5bk8AJwkiUUpzdE268R3aSt5Db5otQQSGBdX56EMMIAmE+qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790992135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Pn7VuMhjP845XGlSo+RTNmvqkPSmiPZU6KQECxkwP2E=;
	b=HXSOYF0hoS9LcqyO7xeLsSRwmtW9zi+mvVVaR7KusrfqCHLifpYLHZildrMxLGuIMnUJ
	 CaEbaPhnbUp1LjrGjg7eoZLlO/egvBLsp5zImFihOCwoy8lTWIPnb5LdHPFiur1YJZk2H
	 ed09izS8k3Ok9rqsxbPuOJZ8zKDC7jikSt01HdDuQP9npVWO2lpFkGJIV7BPZt2q7tEmm
	 gJYJjRxhzwgE/KLIFQkeczlel7ruWeRID62vz36MtQrzfsEKSpDhKh+euav63Jr0POQ6Z
	 uImbc6JoVlKB2eRi6EihCz7vB4uhO7rtcFtj3QMjFilQC8d6JJi6oAJKFph/3uEkcOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790992135;
	bh=Pn7VuMhjP845XGlSo+RTNmvqkPSmiPZU6KQECxkwP2E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ggqw8rbJQp+MQxS7qRVrn3FOYzvCyRnL3WaJrfwO02e6ELouUx7Kv4iSo1SpqPkEv
	 F6x3Q6maW/LMXPhqs+fj54i7rsalZQHmCLTsGJXPJ+d1RCY+5yecEXRy03Prbh8zZl
	 7a0hXhR08HEKP6xgPtuzF/hx2PV6sdTf8fCrwq7QAj5Ytn1Qv40cfagBDzbhBPE9+J
	 sPLa5LeXngtIsz71OtcNY+T6xy1MdfGMRqLA68D14ISj7PSnLXl00diA4kRS2Q5YP7
	 2DPfrP3cZoiZCi8mjQ/N++Tn3maw186HjKJJFqx55AqQo5ZB9i8geD42uz7bwlBon1
	 zkPH5uD5/B/UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FF8A40D07;
	Sat,  3 Oct 2026 01:48:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 455921D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BE3160DA9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCERN36kUgBc for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:48:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EC7B760666
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790992133;
 b=JVgL+mL/5a6qXphDAZB4chc3oe4YR8h3l749/biet1+NLk2eld5uOz1oGgB5zrcG81VR
 9Ew/+K2ozTlHlDaBVm23HKayDdEnpYse/ohNoEPtQia4wt7eUOCdNeQHvBfqrCJWSc6TO
 Pba3+qV2we/0+zeYqHGgh9XRoHYqwqUjoDTMFBSGwqCaZATduDT5qKxPh6a8zY1TrwtNd
 jCRn4lvZEEahW7VzbQUSB41nYEloBvWkYkk/rzQZx48DfvwySm87ys+cZWgxR2iHfhdFy
 ulSidhDJzMu3izkoftITZshbAD9VmytEN9aiqaCApkPmzWENwpzWLqmJF2I9tDrJigQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790992133;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=uw77PbN5FkN80cT4ykg6wKhqLEiO0TNyN5Khd7rkCGo=;
 b=c2iKJuPAW7rJNkcv4vgmXLSGB8Jqw8TjqYKcKxcHEKEBFdePfkMjF7Z/tvCQsxRAi5us
 9H7cOfULCMYmCXlTYJynlW5YrcpUySJ9GRthTITYIO87l+K/aES6Pg/cM67F88E/GaQ3m
 nqUGgh7i34rnVPuqfKN+Xh5186pL/JikN4AwJhk3cawPMEJL2S+mGmVqBY2uF5kU2epvI
 QV2Gjai9vMtJu/FqMBvhn8b0guVrFVx4QvdGQPZY8D+20+cp8AVsPp9p1DhfQd6LwAfcJ
 jbN8voCiOsP7Q3Jpa2nM3d8gxhf/CpRtCr6/BrqsufBeEpJSS2FGFLBQfTB6J0TAlqg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LvaOKNBL; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LvaOKNBL
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC7B760666
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:52 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-483a66818edso67355fac.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790992131; x=1791596931; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uw77PbN5FkN80cT4ykg6wKhqLEiO0TNyN5Khd7rkCGo=;
 b=LvaOKNBL5T5IDlrc+T7N2yggZs40/NTLWhQUHB0tNd8OtSM9gKfceZ5lE8MMqbBH6G
 Vj//ktSvSH0dUP7gS2cuhqeBrOIq6I5L/sRe6TyRzwkXPyI4TanisfqKlrI2VxtRyl5t
 Tsq2CWSvEJTsaVNqxiSkaweL5BdXxIm7l70b78IKF/4epHJV7xpqXbdI1jQAdYAnZyFe
 EHk9+pQYZNvFDrrnp6DLl6Pu+RrjTly+ga+KvESowDjDt+nrp+IB00sOCBW5O8wiqXgq
 BwVmZVhDLtYnoJZyVpIf99PTe8zFOA7XjbN+dOw66Omw0DcEsx5ILojUYRb3ZFG8NLrT
 slsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790992131; x=1791596931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uw77PbN5FkN80cT4ykg6wKhqLEiO0TNyN5Khd7rkCGo=;
 b=bnddgautP7A+h5dsU1VZo9tRLa+uX3Mk+jSEBJ4FhmDJQi2Vm4aVDKOaoS1n5dyX7x
 f2PnnVYDDpzMw4/Blm3EgFrD78JrTwOv5zwWf9Ws4DUH7Y8xkKF2x/vaCjTlXxOBLYQZ
 +TLZ2/W+XUn923iEOmCv6+EkPxXTMf8je8oGP5BQ/4wPkqTLz1Piu+9CEHUU3Xk86qLg
 gWLo8DJratSWYJh/7amqJOG3/grXXkZ4wkMxA0sj4FUhYLDbNsIjNy/OWKGaSOTcaqOL
 Wx5Q/Z4gcRlyv5/Fp5XHsjLPG0UIyUnlOvWADebGjFm1dz/zT25zfIUqQiNdEbjSmMDx
 y6BQ==
X-Gm-Message-State: AFuF++nYWqs+Y49UVixmjCdfKR54EB0+LlKuEd0O0VooMQVXkoLWy9cn
 psHlhoiFXzw4HgulFv0itAx53Zl0Bu6xJpDxkbWJ1rmrFMX28pdH4v8tclUD8g==
X-Gm-Gg: AYBFou0SR30U1SbhPDkwrlUAeyZs3igdYhAmhp3K4pPtbJCdSrj3CaQkDHvg03GsdN3
 IOwj2bLkkmC2exi+IwZwS+YtikqUvRFWlsEDnPlBoeGOFnLpBuGOfxnBfn38ehxKYrx694swkQU
 Z1KfAxdE5kZz1gRXseG4QaOUnfqRyyguqlbQjNDDUWPITQ8fopRJ44YeiaxPmziIJhmWgwBGkdr
 r7RxGSA0fEIpdGyPDSFuA9MU/NID/I0AUmpamUHL+4H67dAXoN7cQAdzelf+1/wJByKBKz/FIab
 1mdywbsgDmDiVjMBHG83lTOZZXfYh9B5o2ttFMdwf3fBEWItAU4qudBmA+GAej2ZhVUpntXTqIZ
 cS6oHXd+48n38HhzQe+Nu4FN2GeQ5nEtE8W2Da/W9e4lqGYhui/LjmUY+EBRggJypQ8CI6j7/dR
 ttnAh1B05y8HdgRn1gH8lzYiOOoXM/OkGAJ0mRjaxoKjYkaZYdKiUXojHQxQz8CzAPCe/Ds+gmq
 sUf7qE+C/znUU1bhBuAfa8cIcMU/deKQucvWvfok+VNazQ6onZKEa+FyI61Jf09wpOndRqB0Xwi
 FlF3pN1fF96AI3oJuIalN7duiGHuo2v5TVw/nExOhiBDV4gDYzEbWaITMhOgFm6ZN69+19BUeHz
 24HJkXowyLr/9AuvOXDiFZgMr465tGjGji/IVHu9TGnE=
X-Received: by 2002:a05:6870:2188:b0:475:e066:771f with SMTP id
 586e51a60fabf-49e3a90fe58mr920584fac.38.1790992131495; 
 Fri, 02 Oct 2026 18:48:51 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-49e16e577c0sm3990524fac.10.2026.10.02.18.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:48:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:48:26 -0600
Message-ID: <20261003014837.403895-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 7.0.0
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

Update license hash due to the inclusion of the full Apache-2.0 license
text:
https://github.com/aio-libs/multidict/commit/19b465951efa17ed8a9ef1fb4837df82657b9843

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 6 +++---
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index d2fe79e0ef..50a36404ea 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  aed0d99fa532a2b6570b88c900d60b99  multidict-6.7.1.tar.gz
-sha256  ec6652a1bee61c53a3e5776b6049172c53b6aaba34f18c9ad04f82712bac623d  multidict-6.7.1.tar.gz
+md5  efd429da40e56f8f5e8da04b381d7002  multidict-7.0.0.tar.gz
+sha256  a7fcd089a0af2e0ef053c0d39c22c9ebf2434dddcb91034fd2f59ec99623788e  multidict-7.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  93d11a968e2f0f36373c40811ff6d20e173f58c3cab5884cd6617bbfd795492a  LICENSE
+sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index dc92b653a1..f7db1ef314 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 6.7.1
+PYTHON_MULTIDICT_VERSION = 7.0.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/1a/c2/c2d94cbe6ac1753f3fc980da97b3d930efe1da3af3c9f5125354436c073d
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/c4/64/642465a4827331a98ba4ae29f97658be25d1bdcb868872a2f78f7482b507
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
