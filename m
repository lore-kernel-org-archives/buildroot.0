Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76345CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA734114E;
	Sat,  3 Oct 2026 07:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0gb6HSuW5OE; Sat,  3 Oct 2026 07:23:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5942041153
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012199;
	b=iIaVj98SEGxWSimVm0zkgvZOD+iE9e6PKGXnDmJygBf1p2PpNFKTVZcPMU/b9RPwJ8AN
	 StblwRlqZVt/YEDatTNOXqbQ3ou1IFy+eIbZNWaVKoCNkLJlT0yO6JhQWhdSJKdiybyZQ
	 51XXXxlevAHcTTGYcvvxGCVv7icFvr36jmQaa9dRNCKV2UwV5j5vEuWjOABSvtd+gcYek
	 LnLxpUsZ7MOH+VIqDs+EUYIYydy7ejTDyR4WMaS32yTiKW8XtmPzSWAGk91jZLcarAXPu
	 B3ZmdHk1ekZHo23LBJdyIANLfox6KLhVHUCXqsg1jPKmIVwj37ssc4nYjAF1677TDHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VHgoSLlTQBBVmAgSSjYfTzyaiOsBy4w6XdefaJ74Kj0=;
	b=I9cGuUbCYoU4HgeaCHJAKwkjLZjKxq1uENt9Zj+G1+xus/DjCdmdRNmt+Oo25i2d1NX2
	 ndHtcMb3eUA2Yf1iaSdQrP20kOAwlLV8kg7clrwp37/uUp01jtgPWFGp7tdKTL1D9FvIa
	 UbUi4hVc9aUckRyDKR9shXbtesE74VlA8Pr52MEIwp0UJYc0qL9u+lR5FYdua/R2CiIA8
	 BVd+SIu31jG0Xa0IWfMatT+hCB3VrfESVEIXJ831tGeJ2qsHG4bR6SemzBYlpQIXeFXAg
	 OcKMsXpsmB07kEKhIrrAwcosSiBOaj9zPIRQYgc2Aa69eyzGpsw51lHShzSL6TQkwWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012199;
	bh=VHgoSLlTQBBVmAgSSjYfTzyaiOsBy4w6XdefaJ74Kj0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FBHYe2lgsxZN9S/eAnAdCmlNyatU5VClH9w1FKuoHD+kpTafVkqAEwniEJVHYJx3I
	 DHbqPefhm66v4g/Jt/Hx8CrlsLeyHEwsqpYZb5curkhHMnTxqBy3pPeL022m53/Rxq
	 mxhhANvcYrX+4ZYOmgcSFraVxgIM5VELv5WhEtNU46WLVyfTgLQTdynUjaCXgsRUZj
	 oQZnfcJS/vkJFq6+UUAaRGhjOyER2pXgtUYO+/AtgYlTojiVI6d2SHsfw3eb/kULF0
	 Ht6KzqVkTNefxwLWCijCXixG75mkBtJ4JCQE07R472u5Ah0h5vmBW9HwmOiqq5Nzm6
	 8HKY4x6sPsQiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5942041153;
	Sat,  3 Oct 2026 07:23:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70C1C34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56C2B40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuauZR4ReWGA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:23:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5813F40059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012196;
 b=iuklqxuFgbSHQjkmuYWD2vr2znLZZzw4vP1fhVTE2bKyT150yc8dPyFgo8Jvt81LkBRu
 aD1cWAtNtwspW7Uoa+akmH4pwluCsB7kfDks1XMoBdILtbVs0Ds7GfMzBzJ5PYaRc27cs
 jMc0weFGkSZCuyhqBva6SN2Khqj5RefDP9IHHwix9kujD6IMtFtUWyxZqW+XTIy+sV5OD
 VvZ1XW0kut8NwC5BAWsoeXole2VssXT8zvWAL7jbY6dy4BX6v3vpTF4uFaUyAFp7tEkFK
 0Xqet2zhC7vOP0O50KOZ/rP2S4chyNUU/FgJEGfKB9TDdKEtoxBz1S8KJYot5yJMLsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012196;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=msaj0IsmEcgcHjRq5piEx/O2XzrlTdut5+lv3VKgis0=;
 b=XmFZSaTGMW6Jko8UfAL4J8WX1BJ2+qgMzJD6xqpXFyknTJDnYEit5KDw3c4TOMrDO2xB
 gVOSC/qo3UnSL2kwgV80LxNE7c4mu85lUAXoo7BILrVtCFVvtX9hOWQMG+uILpVQWQU2A
 ipscVA6w2HlCVmhULYwcA5T5tusQuvv3hsidlTmEFSXN9ycedQO6ObdE5J2i26fahNnch
 CV5lR2awUjvEcWYM6BAUEatJPajx8RoadzkZULhG4d+zR7zNPSNmn5UPzLOumnWCZOHrh
 71/3TqSwO4/j/hpkZI1GQbG8VyWr9ADeBV2WnJS/O3wx9O1KPvDZFRCsSYbq36iTaig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=b4yhF3+i; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=b4yhF3+i
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5813F40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010942;
 bh=msaj0IsmEcgcHjRq5piEx/O2XzrlTdut5+lv3VKgis0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=b4yhF3+iZSZtBB2cie53gzwqmIbwN4zwt02ICL0qBcm/cwI1SclYNJCJIPVDbQrX8
 nCZls9IyRZOBjxrcAx7+fPtHyFfDH4dTH1nTDqx+4nvGlH1k1Nv8ISF6Cekeawke3z
 oKmBsSa5L5l3yieiiP7KU9nGqhqY1RIponB4dCbYHfQ9rnGiEhzAjlvYRIBUJjIwz6
 wCGGPRTgaLa1MryeN5WzNLobwbrn4SBVG09cAgoBBrzbVj1QRVfmev3HBaUGo5wSWs
 cByD87HfMlZ9fwNcXzJol5hZ8yes5c/w4cqp242xRqDXOmnwAcycwYoOalZuxGi46H
 tUf1iHxpU6xtw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 etDcrJYdgERur96tViJklG4zLFb9j9xPr9mq3C4Ar/jHAce4i7Dw9yFCJgo80ksj2d8KJT9xVwK
 Q67ozwLPSWHYlHlywZc8Op7xiHhK0RRGJF5MhoChdVj8j0D8E2zX6xe7DbIxYDy4FrEeStPBOZ+
 EmDLC6hkn59j1J2Efml/tQcn/ILpaPMcqAeKtHY3iieqL3raewFoOsAJbz8pajS9pF2LFPxqSeI
 dKgayUN3rKlx6V2niYPS1FDMibs//6+p4BNNURE4Yhv1Y7HVgN7H2IbbhArxOeVn7F7Ya5OEPTT
 fF2Z6SsV7cLEqBpS00l3fq9GdIq0kC1Hmk4Mr+SPSkk/nhv+1jqgPfXiEYqDoGJCq+SbRxNA2dq
 2wZZfCF5h9V/r6S0zRNUA+G138DRggzA+/oMHEuTqg+MBkFPsK31cfuUukTSPoDGEz+40wy164R
 11clo8uDsxGwkztHyESOnk8pERslHNxnpPQ7e/a1V37puh+8kzo+vtVmfzLN93Siipfy8rTgtJ/
 28cIWDcTZnQ1u2dmomX1uM4u4O/NmuJUdFqac+9OqpxJoqw2SNhetLDGZdx5OzRb6lrEwoAPPxc
 iCSxQqu4BBvBjrwp7VxFLx0G6FjY96MNJNTdnLxgXZeYbUFGH4SSOSlnpMqwGC8X
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03710A4C551E;
 Sat,  3 Oct 2026 09:02:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-1plB;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:15 +0200
Message-ID: <20261003070128.1295458-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 043/114] package/python-mbstrdecoder: bump
 version to 1.1.5
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
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 4 ++--
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index aa278d4590..cb76f00d92 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
-md5  c9d9514be421c358ca75faea3a430672  mbstrdecoder-1.1.4.tar.gz
-sha256  8105ef9cf6b7d7d69fe7fd6b68a2d8f281ca9b365d7a9b670be376b2e6c81b21  mbstrdecoder-1.1.4.tar.gz
+md5  606e6a8f552d5d0aa40dd9a139c5e6cd  mbstrdecoder-1.1.5.tar.gz
+sha256  8cbfba26938befd8a35e3cc06ca0632f61320b7b2be7df32550b895e1725b1ce  mbstrdecoder-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 6f51b36103..66e2c0b194 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 1.1.4
+PYTHON_MBSTRDECODER_VERSION = 1.1.5
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/31/ab/05ae008357c8bdb6245ebf8a101d99f26c096e0ea20800b318153da23796
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/4b/9c/dd6e38d747a62ead27f9abef32f4ca4311d4e40ac28e76bcc9ffb5dd0329
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
