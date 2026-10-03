Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC17CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26300410EB;
	Sat,  3 Oct 2026 07:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFgL8ev6vB4g; Sat,  3 Oct 2026 07:21:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 330C2410FA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012075;
	b=mH6HlfJjRKsf6sg2Ci7+EeLl1KNa/KFHaTpOyWOMt4Qjb4s5/akrXYaEh9H48+yDA9l1
	 hLJCsiNRRmPnAb/mXYCRhymqHVhxebwLmlrTBKyKgDlXnQ+3JVbJpWdaE+eJwKwPyvd4g
	 PnC8OVSjafeOtj2Vob0919vgxUqO+NZaqOWNdNCZoipmxxjempBw9ubKGP8ZLciTiJm6K
	 dRe0QHJD3AMwx+zBtI5uf+Wk4KpYMPAfA3mWFuD+bVoafKiteSTo4vpd9oeaqFeYADQwz
	 4uTEbW6tx4cnW/KAULDr68KvXuonggwFwZ3G1ZBx7vFyOAhs4oJjDsZn65WkxqthneQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zjKrKZcrjiK5ckkoaCEnUWawDcXoLKl/d90AgDMBSWU=;
	b=i7UA21ALk6MOu/AgVCZyvLpHz91RyRUmDFK7y071QhPA4Le7/YsmrBy3Bb2CSuH63BmN
	 OhkuKLG8UyL+CZqrLm+BIyOkjbEexnrmMEcD1rf935BOe1XN/mCKBAsDZdji6KbRK32pI
	 bPGvluSXBn9ifXFccQLh1NSwfQTCMUEsSViSOUxTDQuJOO6VHuDH2BCmCk4JoHJkED5dr
	 95tbagHubKc082p1myicA20pzEH5VGfkELfha5lIKJH0oYR1vuJrcod642kI+8n94Qv/u
	 xzUFk5R1M0Esvll0gz2V7G/3Qlvi8F4IOTXBjtKa40GbFBUtVdGmAYjpEE7apbWU7Ug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012075;
	bh=zjKrKZcrjiK5ckkoaCEnUWawDcXoLKl/d90AgDMBSWU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bYMoCzndxN3Je0yBvkA8xRQa9gAQAuekUIQb8cn2j/95s8hV9xKTDX4ncvoZ5d8fE
	 sDfg66TaVtNqtCl5PfMFqPxYvTdBOx1kpl8c6r4zk0b/eNnCGbmpEC/4qzclrBYZMZ
	 5T4gFWAUBDK6BnkWOe4PoFrxChKdW0Okk0c0kAzgL0exjERT+O0lzCGfAd7DhwTFbg
	 rPbaTi0cYbnzpLN4Z8v1RKrNT1PWig/Q4rOpRDdjEHW4nRO8ILZTU53zkp8EUhBDri
	 OI3zzKJ+9I+b/pHDags+zNnKLSaqmrJYkWMV6/b0393/dGR5VxECr72SztSDkAGGlJ
	 EsCg1qZz/4VXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330C2410FA;
	Sat,  3 Oct 2026 07:21:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D6EE34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7A3F60DC4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4SSPZyTNFhx for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:21:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D412160DBC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012073;
 b=tLCTjxvuilxQsp0v/uuyWDrNoC9b3KxYRy8zXoeTsHlMWJ14gAb4r7V86FQidgkjuLcA
 8lfF1LwJaExuJkfuqqmT4LnD871SGhSrd1o9XtkIeRG4ZKWcjpm4WxlIxu9ULYkJttr98
 cAKiDMndamVPppts63yvvQeliDDnfxFYWx9pkBILzESH8RZqlaaR6t9mwuznX2o2P3oO6
 ajtZLcwJPTXVOcWo8YJkRaQKjoCmsE3eA8klGETHsOXFKzSoCr7dkAvFKRZnMXUdUVhj5
 3+6bN1qecD5dGBDnIYoimC9lhAeezjprLwbu3FMaIxtSGgKhNHhFd0bkUnYgFK/J53Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012073;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=18mcs6X4eOaX8TVGX9eu5tZ/KJei/wZ3xoxaQ7C9Kk0=;
 b=HyGmhWGC7yz1ZpspiiTrbBo/dquvlMBdBRPky/8ngprH0h+v18010uWCopd2kyM7JP8P
 OxEolmTrJ4NQAbvYIfnhXvh+NsgFCQZZapExrTwEO7IOUmzB+0bHQIn769IpYdUSAyvhp
 bUgPE+COWKz7XDkXI2faMUtL1jvtjV3L/LRlgaOsxyPw3iz7xClEndCvq4vg2+kUIs1UV
 jBhdPd/gtj74hYEDfJyksMAh5xKGHd8A/GLvdQ37xQ4u19JgihSlaTngRbar79lDx1DNm
 +A9zaPYpmALI0hftIMMAT2ltpOvfcGsi4VCKEF+LiH89mgG9lry8aLNyPIQ1uweoi+Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=L16PRMQu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=L16PRMQu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D412160DBC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010940;
 bh=18mcs6X4eOaX8TVGX9eu5tZ/KJei/wZ3xoxaQ7C9Kk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=L16PRMQujHiOPDj8pOq5Lnd3BvTEZ3ir2lNm3as0dR/zUKQRjjJCMbG7yZ/dVlyNy
 1sdHck9Hq1173hNMVGXvs1ruNxDkuiMB67qqCwKf//gaRopgc5SSGL5oidVM1BwO/L
 ViV54Hb8/JPykYIEoRMBPwo17fgbhRm62HlaHwxCUdppBH/D2y2yh9hDyuANiKLduy
 sqR7htmG7QW5dyq96YwiQfRpysMN+1PnyKdSCfAxbOBLbTnkArm3m/qaRY0HI3KHIU
 dzhHyrcGWhr7zlufoEjVG3K8MECpUYP4KSj1+t7EO4fkxutG82FKx4pOC/YE98O8X8
 +YBmC60IQQxMA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 Rr+/TKmDbmjXq5hfmUByLO/Yn728SgC7jadtiZuU945+QL9cY8D578Cg6jvrYdQCf3tX44POKo6
 fAx4/ss7QXsUAkuAviK8vfHgyviubL9cCdbNeFRbqWNgev1UzS/NgymufqViIOSlV7Cfzo3zsxn
 3SAR0xjVtScCL7Geb8GMY4biVj8TT6TfNl3e3bqq5j8yKPC8H9gLXywgZua0xIT+gSvyG7RPaSV
 aesMEytPgBftv9P3xTAZWuwYiIKokwq4D3N7VeEtpV7/D/gzwndTjWx2cMvVlPEbVVZRzVy45s5
 Q6PeBUSXSKTDKk4874O4fZ6RCtsAiZARGaMknWEhdBSCVFsJnJkV+iTyFrvp0Ta+OVqHSGvesaL
 LUn6Joob8nKNxLgWMN+O/xH5PTN372L/dUgsoFcKo1x9AtIywCbm22Y0n7f3X9rlWktmgBMVXVm
 aXhDCwZd4Q5Vxnj7GkYeKZ/KEfqEUXdSZM32V+ygA5X0N5g+EJABhQrZKpqJvk8L+wIWv5IF22U
 LIILGDRIfsEXvynrKAN4GfVg7jArt7pdqdxvKIwIjpBAlj0+AjAcu6kAKhekJ3PAtBdsmDG3WXy
 L0D0ETfm5CgiJ6vJxncP3WXbYW4ouFZiMW2VjfiaAFLC4MGCDfxeYMu8i7mLejc5
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 29E9DA4C549D;
 Sat,  3 Oct 2026 09:02:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-2gDw;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:05 +0200
Message-ID: <20261003070128.1295458-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 033/114] package/python-httplib2: bump version
 to 0.32.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-httplib2/python-httplib2.hash | 4 ++--
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index ffcf5cbd63..fcb8b19374 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  957581afb1aa862ea8efbca88e13bd45  httplib2-0.31.2.tar.gz
-sha256  385e0869d7397484f4eab426197a4c020b606edd43372492337c0b4010ae5d24  httplib2-0.31.2.tar.gz
+md5  0c45edbd75957af282de53fb428f6b1f  httplib2-0.32.0.tar.gz
+sha256  48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025  httplib2-0.32.0.tar.gz
 # Locally computed sha256 checksums
 sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index ea5b8e0008..ae683c759f 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.31.2
+PYTHON_HTTPLIB2_VERSION = 0.32.0
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/c1/1f/e86365613582c027dda5ddb64e1010e57a3d53e99ab8a72093fa13d565ec
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/84/f5/ccf58de92d61e3ad921119668f54ed36ca1d0cf5dcc5c1657dfb164fd78b
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
