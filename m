Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6D5606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MsuzDyN1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NFRBQuXt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3DE481747;
	Fri, 23 Oct 2026 18:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyfyVTrpEB2t; Fri, 23 Oct 2026 18:19:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 923D8816E9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779558;
	b=JOzLy2i4HwVZ0unIlUyKCK3BLAQaBKR0jMVxMsoR9rjZODqu86azTYH9Zak5q/vhjOLx
	 4CznD0OU2x50YOTcyBRlf61m4ZMhA0k0Pvp2R7S31slPYGFLR9sRrRgdGt6WEhP63/is3
	 VfinT03Pm8CB2Le/yY8ueXPCcehzylcmS2gSAUk8KP9O+jaBPxDpdMlKFXuFHK2AbqZO8
	 ujByJuuqP35iu148dJg90+Pv3ZQtt5wD2MzKLCiiIuzxzcwIDEOho7Rw9WHwYDcsb2Ueo
	 V1fh+SnAFlBUG/1rvBslBhAqG05YLlANXgOOhQGBERfcSalaVTf0TwMxpU9k+knAoZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sFj3imgtX7g3udNyu2ti01FuRfK1zNVvewMz7PIGz0g=;
	b=Lru4JTu397drdpsR5/ihTvwVp0s25Qmcda37rg/oxVDxy/JdfBZVjv1UfkxXnqtGocQx
	 5yYJL7610ELkmhvU5qvwefFZgZvPwtGSh364T3ivlkQqNtF+GjUJXO+ijRRLlwnf1pkSN
	 p8JTqEFBD9AS7PtN7XAWHobIb2NS1i0UM+Gi3cV6rlu2TrosMmyEkwRDpBkmz10CUVYdQ
	 tUEqJ+yb2pbhE+oH3FCG54FwwKbKUDF80S9eD5+I8fLRHBqYmVY/se7/OaQN9MuuP62po
	 QBDXgcHs7d5dI3eHhLddf2bsNThF7JrfS5e8CiPzTCw4t/8cOCVJ7IFxiX59DYBe2cQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779558;
	bh=sFj3imgtX7g3udNyu2ti01FuRfK1zNVvewMz7PIGz0g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MsuzDyN1SfrRy1ryhMmyYKWze9TDm5HJLr12alj7UXXCQ1xC8aA4HgxaBWsmepn2U
	 W7+yioGaaV1nmovp2k7a+IKsoMzxI7a7QfJx6NTXBOWo0GDX97NQfil7Qk+VY/qxN4
	 b0E9m/H+qOBZ7lGRZkenBmVolFvThZyXtEEpy1wnqQgDXEXXzy4qkoPkHtnn1Rn7jl
	 SBgegW3nE2o/+ed0t8AJkVJAo/rYWmP0nHH5bDuk/DYAROPj7Y8yqzvXkxeB8mBsse
	 47GXKt6pAZWwf2Cgbe+Qs1846WPfZ1ZZ5IYO2E/etApnANoBYD/gRfAvx3+DO/JMik
	 ljs7g3eKdiIgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 923D8816E9;
	Fri, 23 Oct 2026 18:19:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB4AF235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB7DD60A47
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDp9Z20tCjRP for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:19:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BAF3060608
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779546;
 b=r33gLcUCUbfaUwhR+Zobot+1zm5UCW4nOA7x+l41YUuFX36qpFYsKw6hQxDbygvhnY11
 bXtE6LnE6F2z8Myir5flN+4q0zu6RqGWZcBc6P096UKSNjHU1Yyf7D4RceKsDfrhnP3Bf
 6OGqvGqG8D4nRrlvI0X6ctZ/8gWnBCCay8y8ZRatu4MFMk3GjPk8H8TVtrfypjGXnyz7B
 pKPaxkxkTGr2rBV6kJv+TG+4bJ7OQm+/ZxEWWqeNZ15ET11zbv9W3iYQ27LdHLkNylcAO
 aOkGALiQeFPI+xt6IB/MHHnHgKSpbMm0+EqQwr06tZRrezvqem/KRXoxMGFs7fFDEXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779546;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=cKwQEOsFeDqZU3g5joNkCilgUgxtiB6htl5D/4S4yAw=;
 b=FwiekFuy2l0mWn/JWzKdPhAbeBY6P0X8W37r5RSlq3cn+jKTz9Ycx7k4LLX332iRnnF0
 kfnCe3dqGojSQM9+LTGBm3hDNo8IINuIilE2vjax+SZj440doogqaNJO/7WRreYzqTsCl
 zq1QKxSM/EO6DGBX9y1kZZqj0+l6l5TNfogfqTSfu4NitSmYgpc4Qn1v1uCpr//3+wBcj
 PDsivCwJ+N9PNyhgVTjRtTwKJo/QaUZJDMwbj9+TM0D8teIaZlr3zpSXZAHmrTbYH1QD4
 D1gxYU2HQg7AN6vA/g0Avj+lKCaqUYKMQVzZYBYslN+4rbjiuo9YmukZbN5QWzjuq+Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NFRBQuXt; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NFRBQuXt
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAF3060608
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:06 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-703be215729so535318eaf.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779545; x=1793384345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cKwQEOsFeDqZU3g5joNkCilgUgxtiB6htl5D/4S4yAw=;
 b=NFRBQuXtHfaFZ2jOlyvunQDgo29i5WFysl2ADEmTeHp7rrer32Sr5AmYwvxCr2nQ4p
 m0eYO6XAW2i7Jzx8wBKUUyylYjVLx+UCbEJ8h3pXXYijGAoS6zZxO1jxQngF+8tKiG0m
 7ijCCaUmL9QIJRoLnXZCt8LXEx+nq4DzbY3b58d7j1vonrtqxX51tUld1Ms0qy0y1Htg
 xbDHPS+eQLFu/r7BjIdSJ6VHjYxzPkGO0+3o41IfacHrHFAn9X5WSCKKK4Lp17HkyAWm
 e231fRyOisW04kcPidv60x1DKiQkhJMPHlfig3dP+wwB6Xli0C/1+8Ps3cIYE9RHRJb3
 /QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779545; x=1793384345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cKwQEOsFeDqZU3g5joNkCilgUgxtiB6htl5D/4S4yAw=;
 b=Us2NF8Y0qRJ58g6B9Ll9dgTwyNIjhHHNRfuqv3vwOxVqL3iPt+1Ft7EF0CavIEpsak
 pS/j/wWx7DiJocZXG1J7vnZiMkpiclkacQru9HnYQkEBtVyDf4ZSLB3k6kndYNfiiw4O
 m1KvHXq8oefCMXbbPH+shYzP2iN40ahyKAvDHdnUcjrcbahatq9YND4o35dnqPvPV9GH
 z1E7zhiVGa2bvTIWZIomKUU7FCz2YwH950Ch+iycmOoqxvVrkhqFKlulejvxqJQ4o/3/
 k7NBOD5j/xH3lSsRZY3RIwJ7CDLJ5d9bvQ8dTO6FkcgCuTCspViziXsE1s4nfstiBiZ+
 9SPw==
X-Gm-Message-State: AFq9FYL097/mcAryYap91WUUJ34Dq+kR0cb2mtYRPMXsUuwitq9PSxk1
 F8qrW44nB3ROUkH6wcfQXvsA5D9UwCdPsYS73pDaEPHg/maKwo//9JzCZDsIDAkV
X-Gm-Gg: AYBFou0XoQJGvT9zSDUhZwy20lGU0zDgAqs7bNLSJ836I1W1Th1x61J+l7JUgINrxXo
 ADSTFe5E/+pIDfyYcFe9uIbX0QYLA7v28Nx4TUyR6BSPtRHZCEVOO+p3G8EtDyCbuoCFziF7O6O
 x92u/XYUb81xVaxJLkJ8JG7VhsVDH4QBVAvb2kSiF4VDw+cb5zxldX9UrHBkLZ3T+jmf5CSvSLs
 Gv4xNe4abCysTGztOZg3pzLogBxC+Dm49/eGzAfl7MHEy8QkY2kSTVIcYaY6bDqhMD28CaPI9HI
 DaRNNXGulHFlKbeF3IVivBTJuO8pjaOXj25e+hN5INpORL0iO8AUaCdk6AP2S9AE+4E63C9M+wO
 8w1RrlaklTmlBf9xIQABtMEDhqzE8PPzLAOzyxFmi1MlWX/6yh1T4CUif7vtA/kosockRZSsU1J
 FZDQFiJefT/rL8zkbmQtv7exWiIsjQAFU6Wyz2+QwZfrXwFKIHVleta0KSEKs8rlPFEoDp2+lbS
 a9+Mk+wyuPSkzgSYx452D6M7n98ubn03/BXfXXZi4X/VlIhjA52moCMdK+/t6X6TFMuUXPy/0Nk
 eD6ReTqHjfnupclclXXEDwDexMw81qxxzd144ISYhs+K0/eprNdGHgwQzm9hsSVM6fzNs6LZhTi
 pkl/IkP/OfHYwgMgp5vBmY+j5b4cKZa011mzLyDu32ZJ+H7Km4Y5Lk6F6l9V880Q8LzgEQm4oor
 AUv7IJb4Tt5FTr1nTCZJ4KftQ=
X-Received: by 2002:a05:6820:60c:b0:6fd:3c3e:3c66 with SMTP id
 006d021491bc7-70b888c4992mr2115012eaf.3.1792779545527; 
 Fri, 23 Oct 2026 11:19:05 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:19:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:46 -0600
Message-ID: <20261023181818.920329-29-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-vcs-versioning: bump to version
 2.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
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
 package/python-vcs-versioning/python-vcs-versioning.hash | 4 ++--
 package/python-vcs-versioning/python-vcs-versioning.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-vcs-versioning/python-vcs-versioning.hash b/package/python-vcs-versioning/python-vcs-versioning.hash
index 964a21fb70..b641af6b82 100644
--- a/package/python-vcs-versioning/python-vcs-versioning.hash
+++ b/package/python-vcs-versioning/python-vcs-versioning.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/vcs-versioning/json
-md5  bfb201115bc6c78668ed643c9b06503f  vcs_versioning-2.5.0.tar.gz
-sha256  956a796e31f80fe714d219d6d1df15a6bf247d10f6d851bf4b98279d0a42da55  vcs_versioning-2.5.0.tar.gz
+md5  3e25e932a706a6bc3e3f45eff7f97037  vcs_versioning-2.6.0.tar.gz
+sha256  22e9159288e2d8bca2fa6f6c31c34c9c66aec157f60e9e526f5d160d2516d60f  vcs_versioning-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f52f6085a2f4acdb7f425fac78d4bb013b2d723616792fb173a9f8aea191d8f0  LICENSE.txt
diff --git a/package/python-vcs-versioning/python-vcs-versioning.mk b/package/python-vcs-versioning/python-vcs-versioning.mk
index 78d04b8457..a4ec8e027f 100644
--- a/package/python-vcs-versioning/python-vcs-versioning.mk
+++ b/package/python-vcs-versioning/python-vcs-versioning.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VCS_VERSIONING_VERSION = 2.5.0
+PYTHON_VCS_VERSIONING_VERSION = 2.6.0
 PYTHON_VCS_VERSIONING_SOURCE = vcs_versioning-$(PYTHON_VCS_VERSIONING_VERSION).tar.gz
-PYTHON_VCS_VERSIONING_SITE = https://files.pythonhosted.org/packages/6f/a0/6977bb418312ad30f27e522c5040604d4bbf7e40ccd5a11d333afe549354
+PYTHON_VCS_VERSIONING_SITE = https://files.pythonhosted.org/packages/ad/e7/2a691db7d076b75d099fdba1a14cd966931f2aeb591e77f6d22f15097326
 PYTHON_VCS_VERSIONING_SETUP_TYPE = setuptools
 PYTHON_VCS_VERSIONING_LICENSE = MIT
 PYTHON_VCS_VERSIONING_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
