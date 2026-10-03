Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E12CCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1335540FE4;
	Sat,  3 Oct 2026 07:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKHA-JD-klYj; Sat,  3 Oct 2026 07:18:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 314514107A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011937;
	b=ReTfhf5U/TQlYnDC5QdicQK7RRUBVpgiLyxIUmyev0/qcxWe0a4fQM0kewque0uCxPo1
	 3wKasXLD0aTENCe6LFOaoGyaF4/9ZbHG2MuHBLjwmcCJUm3ZWLXdHeBvdJ2l9hwHHL6nl
	 fdA0xKqPeaTTOpdHThWFjppJZQznf9YlFpdzYbUK7iDMdlFf0rKVyYRyNU3+1t7UP0SJF
	 d0tYG0QXunL7PnM3ggczVJ/3ESagq3ZIR84fbSznMVBMixQeJAhPCU8UBqbftJNHTAoe4
	 koMH05JTviYl+YjHCeblekJAz+Df5o7Kz1Ue6mHhIrk2YU99AV9FJ3NUHoDkUf6Xp+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011937;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=m9RzaM9ryftV3lEhGUwUqKExkoEY7XihhZCuAdpM2kk=;
	b=q7HcO79y+Ea0W5JyVsRgpontVH+VY3t5RZykXV/Cj/uiQbySIaU1w6qrHeJEzUB4BT8f
	 iDdgzyUpOCcFJvUgJgQxBK7wFwLnDNO2g0l0iljCwfqofvmL3cJA4lzf7+N08csAYvcvt
	 poRYZpNACP7KXbTtm4We9W866dhdIksXaElhARzLC5A2mIjeRegIAjgLyu/rr1D7R9Hsm
	 oSGJUQoxH/m9192QT0V5XeueQJK5TkTBLScoSWGpEv0rxKwvszYvSY7nJeMXf/53hbYZI
	 G7allqu5U/pDp/Mum26ubBW9KddWGMJre+hhLs+W4UlbEGBfXJFzIYEfpf1sPxmh2BA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011937;
	bh=m9RzaM9ryftV3lEhGUwUqKExkoEY7XihhZCuAdpM2kk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o8zo37bAI7W9ZzzMMXtjM1FVcnTUC7wdBQFkN3rVC9ANnzjpY8d6TuK9nLYm9IAW/
	 hmR0b6krWPzDdj+dnjvNiCw8+Ru0N/zPrN5EHjYR2O1VhwExRccdB/qGxFByf28XdH
	 /j8CkNRDIAr85YKdoQOxps2f9pxjIF/TvTNoh82I56o4JLr7d0uG4C631Y9VoQC/yU
	 0EPMlZA7beEIZVkvDn2llVB408t7E+zTZX1tkqFi30PNLyJWLedThuRhdJKBpehSwS
	 OthxtZYJontdZ6IaXFksLQ824TsQr8nXGZnZGs3rTh1mu3KpN2BSMHdNT/tG/rGTGl
	 1WjutoQV/fARg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314514107A;
	Sat,  3 Oct 2026 07:18:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96A3534E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88AF540059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCxW1q-qWhSq for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:18:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9E0DC40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011934;
 b=NKaLTxPR5uJ037gSgJVA1RJjgNfVuOESAtdUEEwR32SLwc4Ev5xEU1dW9lozLN5hTCaR
 dVOZ74vtfumb0XVxad8Gql/nEl1mEKDgZWV2fEHJ3M0f1Ubqxkjjt9A94nQMQg+BzDwJ/
 xeQtx8VN7vR4iul/iQ1t3/p+cdqyU1yXFFWQssTGEfSqSXaaOERro1mb/a2zNpZHmnauO
 zLJ9cuz1TtD1tCd58zK+GQTi5/tGjY5aJIfTqc6DRhgoazGx+VFddvCYRcngyPbgdPAs6
 SFDKiOK4QCbw3dgm3X8KgDbMVf4/EuyUbTj0I0G4RdxW/PKOR0xCynD/q/b8P0pqMWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011934;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bJelYKbNt9x6VjkN7FdDeYWjLJmWW90N8xyaEnWFxoU=;
 b=r4wW2V+MEuJwEjsydrCw400oBwhjuj77Xt7+Aq7Ztw4M0ySIUKWTl+5GOr3ZiERFSHBV
 3CmvP8F4aD7gU5O9bZw46fmL+WUIIswHV7fZKMX0C5Tlgt42Xh/qQsi/1uX0Y7Wp0b+Ni
 +Csw+KQWu+A8zzMx27akojy8DuETmqVxeijq1sx3w0dD0FJUatBhXfmW2h7N1OdXWIehw
 DYUa8Ng+inHSRroUt+Cw0/owPl8frHxZrcEkT1eCqSqbRLRh/sr9iAOfB713gh0BIpFI/
 3P/sEhIoXfXlTHG/JDjbTiDUQRuR5AxBNk5Z7iK3GrvqGKsEZv8LtnSJd8g8W6rI5aQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JlnOm69i; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JlnOm69i
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E0DC40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010937;
 bh=bJelYKbNt9x6VjkN7FdDeYWjLJmWW90N8xyaEnWFxoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JlnOm69iB7tw9IKkMA6o+9Nk9qkq9/q4RVH/9iNi55eCVJH2EtikbvJsJj68Jzp3r
 Grkg9UKFrUzpyhAIqzQQ4FRIIu1Q/hjudwErAr1RELF+mPzIAIkTShSESE/INQ3wmn
 5dKmeYAA2THe7PSgYQdyPbvn00LzWUErGNA9MI0mbKJZWsfuGHsCEPRIKl8gUpT7Be
 vCnEQhLXtLEvfRfe+SL1syoYetdQnfIt5afbjFYLsKIygA5xkqlYyZ+UHN9zkJaI/5
 6tkmrRlx4xVgzfkxvhPYT3RpnjO+R/e2qIkFKKzCH7+YpBE1cuARPpVSe5SZsDwO03
 ysSdZSmNdou9A==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 Plig/YLYXV7o3cFItGj9Dk8bRhoLw/xobUXipL6a82PIsbCyYHpsUSCOUlpPfJENGFVnMZ7Atyr
 QJVzP4ExOfvnzrqXh60sGzwzy+TrVEO+ol/g9AArPx7FTh+BmcmJpdX5XYrJDMzyaWepektZgup
 Kk4zkgnYpJisGifO0JtY3EATY2imEv6GKOXc2DSfpVs0Op//6LgXyW4ZJimkbFlXgZL2wliFyTQ
 czQ4BrmyfxGznUkw1aKh6///Orc/9lrbYd3Dh7OxMDdkwu7Ww3BwGIAOAr70GuwE8blaARQF9NQ
 P0aHvOF6uLflw72dGjUaBwYKSWoQ40H3Mj5zg6vfr2/Aiyfh93ol40rhiqYDCyurE2tnK0h/L9P
 t5DnR+J/gYJTgOg5NU3wApmHAvhTjM2++qnefOKBHOYV0D3lWX66x45cKjzHTWB8zgR1wgPoA5a
 Yy0QhUqZixRsfOEStar5M83L0wN1G7nAXIBfgTDKvUI8AIAzQqrgseWYGg5t9uHEDLMx3vCZckw
 BfDnradN1SzP4QktEP/r/T48Y8Tq1TneSUmGtP+r8gqzLnJY3UM+J1U6bl55mScqzoje4fnpFw7
 j5Vv6AWDz/ZnrYSI5WYTsxPCfTjXvh7kiFQUoFiJ9r1p3mAPNoDqaVco5NClRTfV
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA59BA4C547E;
 Sat,  3 Oct 2026 09:02:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-34zN;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:54 +0200
Message-ID: <20261003070128.1295458-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 022/114] package/python-evdev: bump version to
 2.0.0
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
 package/python-evdev/python-evdev.hash | 4 ++--
 package/python-evdev/python-evdev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
index 9011065a56..b9f2e969b8 100644
--- a/package/python-evdev/python-evdev.hash
+++ b/package/python-evdev/python-evdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/evdev/json
-md5  d07e455e36642752ecc3ef161f15e5e6  evdev-1.9.3.tar.gz
-sha256  2c140e01ac8437758fa23fe5c871397412461f42d421aa20241dc8fe8cfccbc9  evdev-1.9.3.tar.gz
+md5  d2352944714abd2a29e817045261df05  evdev-2.0.0.tar.gz
+sha256  442fb3f4c8dfc9e61e901133c356220c02d663eca8f34722e0cecdd637eba504  evdev-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d4554960d6496150c88c1fd02d7973121a9a57b961ea58fe349fbf8ada3816b2  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index 169055ab27..ee8cf67b5f 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EVDEV_VERSION = 1.9.3
+PYTHON_EVDEV_VERSION = 2.0.0
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/a5/f5/397b61091120a9ca5001041dd7bf76c385b3bfd67a0e5bcb74b852bd22a4
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/2e/07/eb30593524303d1367f0dc00c1c66582c994dba412a47751e34bad9fa29b
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
