Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965CDCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E94040EC2;
	Sat,  3 Oct 2026 07:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuRoZZIsNazb; Sat,  3 Oct 2026 07:10:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6DF7B40ECB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011444;
	b=XCpi2FMiiC6Lf5lB738DmjGujM/kIqkEMrljH/wglHhGrLss0xKuNKoX1oS34uFbNWGE
	 rgGKeJBDMEOwzrRyY/CCziVyoyXynw/JkIHD99fC08ryYw5osLVRO9+kjAMFzVG/nF99e
	 tYnLL+9Gp7tSvEDxmmf3OODs3KgZiDugCzSHVk9f6z8rbhVbbhVqvUKZH76aNYWGmdoGS
	 0p3QXSRA7y6qzczboSttWEV2LOa7g7ch6bHUHkGM5vCCJLJh29Zthca/7gyWdwImJWmvd
	 JUgaCxTeIghCcmdxA/j3Dnui4YMe7LCQZnppEdMybZyQZ3D/L3i16RSpQzbCs3jEuow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011444;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sxYEiCPLceBQoSHvXR74Ug0AzlWckuarKDW3zfWrIWg=;
	b=VSwnSDSYq+uWQ67RxgngdvMu+lomkICmt51FOc58KOLvDBgt5jp3iM6p9848dIBoWDoz
	 MT1w+Ofm1ysPaPdxou8QdQM7EfAKeBe3QZH2s4O0CLdhOTDhIxTbKihnOnFcqSYh3NQgv
	 GvdQGwGaCq6zYbMjM/HjhJjMyjiOy9fgbOan/MeBA1VTaDN4lnEL20KYCSd/wbzJgK6AV
	 PR56NspM+nmxSbQqIvPRElRUw5WC6jLvrQkmzPKoparEc9yoL0MlYcAErDI/zX/b4aafV
	 +0AQlY82fh2ax1Bqz/vC8Spv5Ex/KlQeqGUhLR5pMBz0kn1kAqXH1TpUS2fOAmHJLug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011444;
	bh=sxYEiCPLceBQoSHvXR74Ug0AzlWckuarKDW3zfWrIWg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r8j/HXHGzBxWKq/X9kcEuaIq2HaSGgkoZuRAnpv2ai6EkGg4oaUV3CHOxicivy9Fe
	 bI2YOt6YVfjH7zCPDVVbtnIs2Y5uiD0do0if+JIbj9yiwPlOTICWipI+8MkHWmGlyG
	 8MgZjmImWsMhAzNcmtFJZ+dgaskwt1NucCBYQ7evYHzmIJHALmQliZy0B60K3x2Vr3
	 xv0Q54i/ZXR/8UOjhAY5fjprgYf6h3XQB+7VZL+fFHiU0brt6YzC7fmatzQa5nKX1c
	 adPxmFIaoP09imd5Cxs/5F0flgecqXAaligGxOVWyhQybMJ2PRwsR6tQ+OtEBF4vyA
	 8novd8baiACIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DF7B40ECB;
	Sat,  3 Oct 2026 07:10:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D94034E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F72940059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3fnTMJ9vllk for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:10:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 19F6F40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011442;
 b=FgYY96gYqiay1KXKIHkIKFYXCQo6P4QWc5NrUp37IeqkQonObhu1g5hGylQO3tOM7yuY
 hfYIK0PPH9As79IjWMrqsalY4lW70UT+P+u0AgM6measInVy/o+wvgW/wkK0dADIp9QbD
 xPMT5lhj8QQuu96pJdRzTYb90qZCpBbYyR4jOOzyX+6p6rJzFAWG6G7UN+A3u7Tm8OQpp
 C6IuRrPUX+Cd6M8iHZChmfa/imPH9mm4hSQMD1o6mbiSWDKVdSSV5F58FZDeQEtekpQlN
 cgfqER+GivRv1ZNrKqEKypUDgfcRJeCWi+UT76POEtqxE3IPEHEmRtEGvx8GGsbqXkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011442;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=gwSWkCWyT7/GDgpWhSbccpamXC5nSQTfV3aJAexJ1Lo=;
 b=Pcav0+kpg6+PF8VBY4mrglfqLE3K02RpD1Xw+FxCc9FRATyLlJl0buopgLjETR+O/TRi
 vcxyXS5ggAoSpFxCkC8tZL9PJm4TZ445hKeywuUCg0pBdTWxvnzoZVN6dGAre5iuOO2Aa
 sV3AejaswoHmSxJ6PUiN6OJVlshVcrFeLQW6os9Mow6Fwb79bn9mlTNFkUHS/EAuM11ZI
 eKz6/eHsGBskc5DVE8EdKBXJppPonF/kxen1NNdOtYO3xGIV1CJYa2W9+lUEUNKT5mDH6
 9uzDSmkxfheMhMUoYCbaVcxQNg3jkgHb4vU2ISvwa4skPZ+IyGzRhBFQSbZTsKwdygg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ddUbhTle; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ddUbhTle
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19F6F40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010930;
 bh=gwSWkCWyT7/GDgpWhSbccpamXC5nSQTfV3aJAexJ1Lo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ddUbhTleuBKdQuRsJvBk/1iC1p1MI9tyaC/fXnRNk9CNHYjSbfRtJb0vYxdD3taom
 wqfrBGT2zcKnBfEiBOfTKZMKTVULsM7CpJh7ecqiZfkyZy6P8AR3MUbV1GZsFCbTUE
 9jnh81FAuDxAAb+i0dOwUOZNiqrZ3v8PydZLPErouliVeNggRuhMhGQ+OXyEJqZdRq
 EYbbAtY7yg2lloX6ebE8cF8TDjRPCImZRm1Bh75k7IUMKj8LKDsoH412bAUwzxbJUD
 spnG3Qw/VskuD5e0szJblX1MZwnmSzJmQJl39lWqfs0ovFCzX11HbFHVFC9gBoPFbi
 NALLHTbz8HzCA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 qvRhep12lnnwqBbdlkWy98K1kAY25DuNK2xXgA+qxuSzsaYFRSUzeQwdoL23jC1nkYBJzMFvE3V
 d+aWat6mKtJWKxfqgmXPhSKxPpTS6lDQ1dOcAKHdKbSyOZJjYw6bfwb4QT3qCHm1FiixXAldu3E
 RaqKXLXWhRgQirqYLpj7MbXDn57kwkeaUCBuZuNFXnqPtTNxIFeYJ5zZD0vrs5Fz8bDWJPzNXCw
 632XUobIH5m6tgoI8CCXm8vuUvgWQtuJLXZYUqVza3KUtO/6PizobkGGta17zW/CtwT2oYjoQkU
 N6fHRkP3dvY03+VAESDIe7llbVn12Fquf1ZsYgzytlCCezAQeP3gxpWBn4ITWHMflvtgMgp6MGF
 PGwCm1QctZMsCjWtixwr4Qe7QNI7oSfigC68Zjnn2Vv48hUPimnJ3fEaAR97ynb3iEK5d+6RO1h
 SjfI/GUz+00peM4Tg9BWQpJYf7G0TAS8NM79Sm9C3IzsIc62gYYxUhxAFsjVS+3POGTUINvoLs+
 qOm8yv0sw1VVlzFpA4/RK117xDeGABHFXHEeHqgd6p5O7tSaSeHiOogBGt14ZQLUdsdTHQDhHDR
 j6FOk7f2q58H31Lcf/X9Dx4AO+QBglO9AFmQNt7XVmYb3Va7/+KdAsPW6iAruEXI
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 113BAA4C5435;
 Sat,  3 Oct 2026 09:02:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-1yne;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:54 +0200
Message-ID: <20261003070128.1295458-82-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 082/114] package/python-sh: bump version to 2.4.0
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

https://github.com/amoffat/sh/blob/2.4.0/CHANGELOG.md

Upstream switched to hatch in version 2.2.5:
https://github.com/amoffat/sh/commit/9956258e71ef054426564fbad937fbf225a9633f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index 43da0bc0ee..54eb66981c 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  961d38de16f88556bd70381eddd7f415  sh-2.2.2.tar.gz
-sha256  653227a7c41a284ec5302173fbc044ee817c7bad5e6e4d8d55741b9aeb9eb65b  sh-2.2.2.tar.gz
+md5  3c11c9c853bf3d326dab0167e9610187  sh-2.4.0.tar.gz
+sha256  a250aef68509ed93419c9a1d90b0647cd5cbe26107ba94d3717ef5b6d595ffd9  sh-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 6bbd621af1..e5b54b0974 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 2.2.2
+PYTHON_SH_VERSION = 2.4.0
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/59/52/f43920223c93e31874677c681b8603d36a40d3d8502d3a37f80d3995d43e
-PYTHON_SH_SETUP_TYPE = poetry
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/e9/c8/137093889a8b8c9a66c9b46079cf2a0e155a8be027df212a4041e3b7b09c
+PYTHON_SH_SETUP_TYPE = hatch
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
