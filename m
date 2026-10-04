Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D07CA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 08:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5309940A56;
	Sun,  4 Oct 2026 08:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMaAn2bdbNfl; Sun,  4 Oct 2026 08:10:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7338E40A30
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791101446;
	b=KDl6FRRdI/Y/04/HbalY2sMtR/KDcjLTqfQR7XmSk7ComHHK9QeGAoceadx73d0XZUGL
	 PmgOy5DimOPaqfNy1jGA5AmjkhduhZcVDthN8mDJ4iPN3scYXwdIIQfXqFLUjdmxEK7QL
	 pg7ZjpkZKIbxv6AVqzp/Dry1qKEBiCKnYqtwPxm/7MxqFAQEn1aa/GDEL673XJwZFMPlL
	 NAPtyJuv+ooVzz2S/mk/FmjxY5LPOVfLYHspMtn0cfa22XIcLFOzHPbZQLNuepLNCNZCm
	 g9vxQcquStFum496pcead49ifqmbP2XPG9onUg+csnKrRT/dkUyP5hVixWZ8DGgLuew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791101446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0lNHuVnxhMt3YHtzktkljMFwP+a9oGYYhIjn4cDz5uE=;
	b=WXqkfQ/+icvVoc8jKigyY0i9m7rRK3hGQSEy2lMZLYNj/DFqEkrUZobqCh/db/AAce49
	 hm/a0DOxgrb6XmXN1Ip8i3vs1oV3/q9VRbLmixpKtpTe2SIxqE0z7jYU3hEJhCAkkM1x7
	 4cWIQWGG9/BuiN2+tm0mNCVuzGGtlQgUQQ/+WBrU/hGoktKYOQQO3sfKbzxJEFCG//ofv
	 EawOYRaaZYL0OE9B4rQEydSEW9jYeanRnEbo8o5+lkRcDFFmnNjYaUK0Hjyn2ChZ47aIE
	 A8A5mG+XnfJiGuuFsiBmU3ZXSGoGK0NxYnED6X5qtitl94vZQwem6LOw+9yowTaTIYA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791101446;
	bh=0lNHuVnxhMt3YHtzktkljMFwP+a9oGYYhIjn4cDz5uE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g7+7Jpf9vrelG6UmE2YvRkQsRn83/y+mIMUYlWkDnvL2f10odPB2hrBZTsUyXhd7p
	 3pQqVel8zfAcb5hinpi4bBwmTonIaCxEiQQWfHGVhVcUDmtcyM3y+9ADMhEHHVJB5O
	 VFlTS4+sDKG3W4kwFuKkxMfWNZdlB4ZyvPvYLZM2ZpHrTTezMFUeKjiUZQNAEbhH3A
	 hn+LH6NMP1j7E78duq2ijJY1z/iTo1kZamnGgFWxTnVf8ZM82YcO5ucIpXJlINq8M3
	 uc5/+i1k53fGj3DzWYzUdRxMxP/RWFXI5v1sgeJBewCx0QlGzOF7LsPgtlk2/nnRO4
	 lfoq0upBZf+dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7338E40A30;
	Sun,  4 Oct 2026 08:10:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD2492E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2E744008E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03U6MOurapon for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 08:10:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A43E84006B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791101443;
 b=egzsfQOWzy6bbH7crsFhFIZhvfVB+vx7lY5K1OgJDmau7fvWoVneYjuQAnX60e6nsn2q
 XxUevpi787i52/6NFimXkR0UKDQ5qypINcjMJ5VRo5zzSYncD18GBG38ntvhGlfnFm4n4
 CufHueTok8hyGZSwDqnrE1iBlbq8MkWxakEisOmRaPOljvBZbTvnS/MfYWxbKUL6GpBA2
 tSETJzTasugB/mt/DPEOfgLiiS+GoqdU4HRUGGhm30lkOkmo8gNJyrek5E19LH4WomAMB
 Ls9DewoG1tJfycD9LP/N7TijlLoWqTcbU3HvUNFE242EferhCv9BQsHelOQckWe/CNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791101443;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=78vYFISa6iQKySM1qsbjc4fsOGx+2bj0ZoSu9EjtauM=;
 b=GkyNacm4yq/tPtv1yRDj7IWWI7UxOkz0bywLCQp30zU8aFFc/5zvcwFWV6wZyLH6JR7z
 zSVZ62bOF4O8rqeN4xUR+ukVp4CKyU6ZDqR+SgllrXKBBRbjcvn2bDfImUJXu/ksEWDwG
 f7oBQ3A0ECUaQxsROWBrbkBKd+1UGbiLH31eusJW1Q3f4b9ca8wpDhGoxIA7dlmtC4xg7
 xlQsbnxYtLzjelT4W42yQmuBc4Bn0ZgLwb4N5PlUdmU2/1pK7v/MIaeOWNd1orQySS11M
 hCZUjMh/fXIfRaUNg0L56A36CmNDWrs/iZwde+N1g9UrnNqsIvcQETxdgMu4Z9tGe/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="J03dITd/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=J03dITd/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A43E84006B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791101441;
 bh=78vYFISa6iQKySM1qsbjc4fsOGx+2bj0ZoSu9EjtauM=;
 h=From:To:Cc:Subject:Date:From;
 b=J03dITd/IUiQ5JZoGkmakGd3DLTDmGw0E4Wbv8DX9A8EWlSw4LIahWtoT0ZMDsN1a
 HszcVx/W3SRopaDXzOnw437tryk8uv2xv5tXu7uT8Q184d+GCaccgr9DipRRktDq/t
 9tKkO0xYzG8iAIMOojv14DqjDRNq4IWksHPGGyry3TLroI7lHOYooa1dvWIT7qqO9X
 IuYrrdXd0b2ZtHqNLMRLGE1jeaakNbandMEXULcC7Nq46XJqvWiMunx7ksU/hsA93s
 mFYsc3CRbjYbbi10zSnxCC/P6GWKBROTpt6dlTLDbTY5EWBii9t/2/gyum56Xlxiw5
 MYeTxS0oVjQlA==
X-KAS-Sym: v3:f51bdf72230551df:myykiwQpj3FLPW64/Ntu2vKiNNLe7h4q+kSldFuaHzl1U
 Yv1u2/71b0paelbikvmI3ditghOJdUNrumRYjBGZDzqF27Dvbk6KYNirDSp8VtlEzRq+2uzGQC7
 87dHyl7YXitnz+w6gi3ZXDYQzyYnPwMCmENqlZUK+WXqFKEVwWzMils1bj7EvDKEJ/VGNjMfO0H
 TgJd81j6+D74lFKt+v5w2M0JkecqAt2H8TeUefP3/Z1koC2qV9c5lSZYezLw5uJiXRGJFcp3Pll
 71PwNc8PCAAqgL35a29yJyL0i3OE1wBDs4zl6fo+EF8Dw7qS6wN2X5e62cDYj3LLXld8Xhhw==:
 vX4wjdnKmXZ9wo7jlGKdzlTJ3gtRDMJkU9DMNrhQ9kvq69DYg1TLgnIW2xSUCCcvHo/XQLnqQzT
 aMDmDR24l6PT0NgM0t9iLJaYMjjkea7Lf67xUqRCWJ4E2vK//R0UYGVmyHWhIOgi7K3mn8oPIaO
 DWqHny+mDEneC33QuRxSi0cOKRDbGdyCjXjBwARxmvFvohzC514w7NyBWCKxqadxvY37iOMQx3C
 edFtnFmGe/mm+mYAu0iSc4sq23xzRmISGWYRA15N+F3WfIyprYrOlh5ieKutXXGUxqiuEjdTNQb
 xrGrpUVVB5sVlC2YNa7AS6xt4vWXul+rA74NxVjYAPfN2PWzzMVaR+/58wPdz8ZjkkWPrRjcNu9
 Mco6t/s1I9P2pigY7Bv62CSD/n+H4k0JB8HXlBgQzCqYH22D97O/B05gcLhAxXSNZfWXURelZ46
 fekQvyyabgSPZrGrEYl8nSL1o9Law/kzMLkHjBuRk69PSKxyeE8IDIGg4w4xtgOATrfx2ZCrSmS
 1Zb3DywUzN2CuX/0VWti9PirQ8Jxh7GLufd1usql6KLgZtfZZlJpyMl5AhlXg1Nz4vb4m7XPdS/
 Of6zqaUwV2HwPD50uF8kqv4W5ec0b/5P03mR+HiFsNEApIKUZFWi7hEK+xyATcEJCMjkmmRD0y0
 lx0dS04M4ww==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1B09A4C4FCB;
 Sun,  4 Oct 2026 10:10:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57696)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDHIu-000000004Ja-405c;
 Sun, 04 Oct 2026 08:10:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun,  4 Oct 2026 10:10:40 +0200
Message-ID: <20261004081040.3067626-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: bump version to 2.5.24
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000516.html
"Note that version 2.5.23 was released yesterday but had a regression
 in the smartcard detection code; which is fixed by this release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c6e1fc8851469dae37c551de3eafacf776fe0eb9

 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index deb7a0da17..f03925bdef 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  4921a199ae868c8dd0478352d2d93bb470489e23  gnupg-2.5.22.tar.bz2
-sha256  96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72b7a024e6d9d87e  gnupg-2.5.22.tar.bz2
+sha1  61949c7a9edb5d9af9682183473b71c8319f1b79  gnupg-2.5.24.tar.bz2
+sha256  bf149d01a2b9fcc0e4589b8ae8697d3d5c557ea48ed95a3fa55dd3b1187e6039  gnupg-2.5.24.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 5b8b30e702..7b1a0e4f31 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.22
+GNUPG2_VERSION = 2.5.24
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
