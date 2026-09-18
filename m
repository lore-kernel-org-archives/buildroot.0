Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5619FC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 189C781327;
	Fri, 18 Sep 2026 19:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1t0l4WQdCBC; Fri, 18 Sep 2026 19:38:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4D07381325
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760317;
	b=lBz4humP4Pqoxj953S7qNuBUYuN83KqC0/eypIVft72pfkV8u8AX48yRYVsMTrOhJuaK
	 GKBcdhxTiOYF4sk7Nw0BjnR6bn7MyVO8/qzXq3qd1v0ZkKBSoBrNWI9IofAIhQoMkTyJp
	 SF7mwEs6YQFhSpbdN4RQ1W1qxzmjPrGNjBJesuCg5/MG42Iv6bu1qWg0jvP99JZsW/G7V
	 nn/9wgK7uvCeyKfj6pgMmJmmBdK3IaxGLcg9730Nl+Z955bxdOJPItcsq3FgJyYf0uqZC
	 MqCzjqszYvHsumwz2gQ1V1mGmz7To4bV2cNYJsG+OLHcJL7G8GKGZM+xeVr1RhXprBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=mHu7QtfQF40gcvXz9Yw2aII8g70qykO/FsXLQs7KeAU=;
	b=JggI506Q3e5tL6FL8bj2wEUG48LlcU6ul0h+CiAUmeaFblcHYqFSpf8QJSLdNXI/qwJb
	 gjiXMVO3EG55g+/tbIqHjLrBWkI1YPmOJYt56PlsDJ11I/YPGDk9FFOczeik81NpLLmvz
	 GXYYFqrTxUBgffZgiLdCqZdOmkyR9MdfO0ANDiLcmpDiVEXGUMVK2lF7htDvopy2NdYtC
	 WOOO+K8TiEspRewG1isNTYdSz2OvD31UYGF3tvpVsW3V7PGUishjhBSuJIk/ef582xKXy
	 Zp9fXdN+IC+cMdRvSMnbaVpzYJep9Djs3J5Br6YEM2SewF9ad5poArwaj2BomdQTLGQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760317;
	bh=mHu7QtfQF40gcvXz9Yw2aII8g70qykO/FsXLQs7KeAU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CwP4CnuCCgAy2ehRTCSaYE5CoP95SJ0oPPpj1wKbxVRWmdOGwIjtZt5IrhXGsXDqt
	 NLXnhn0TTsQCuwKD3nF1hG50l7Dtt7+BUIL09YM6EYK9TCNL+JnSdo13MKJpyC6Pv0
	 w22JUBrt73wraRXyb6qaJVZJh3f9EJ1p1KeRkmjmoUyYTMnB9MBL4PfLD3FJItKCfJ
	 xvGYFCF2RERIqbIoT9mZd7H9qSBHRn9PDRsNY4ZTn97g3oRHPNCI/EA7tgaW2godLH
	 O0r7Bz6nDzOu5WLPxU62VRRSRHrHp3qETl6d0QAWGUfQQalKMnl4du4BA054V3YGnP
	 WJJ+2Doy9ncEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D07381325;
	Fri, 18 Sep 2026 19:38:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3C0D3B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B950660E72
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLv_8jWkPl0E for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:38:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F9FF60E0B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760315;
 b=ADOZKuinVi1fVFpUL+lEAYH2Q1J8o8j+dj9nlJk+7vYUt5Wjw2UeYqKs4wwBYQvoQt6B
 KS8v7/3ssQruowlQlVLrVaQA7ykmKwTn5nKaJvV76BHs7gSCwFcT58Dtp6vKWkefejFCP
 NYClTcVQrpvRfoQezXwSopm6+2fG++DhBhlcvmq51cvF0D8qOL9rHVlwiVMd03cs5SJaP
 yygGR/4th5EXCL1oCgKGTLhT0EmYP5qNFEUkms2Zw38/kd1QunPj0CHPPoz8q4zHVgGo3
 3W+MNI2zNUTyeqrHWqKeo+/0h1yTZ4iwymXGUq0OuFUEf8zTeEJwHvXh6okAko7ddoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760315;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=MVP2Y/ieZcNN6RHAeCWDsV3ao6zk8IHBdR8kBgABnWI=;
 b=ZhgKHCdfr/P6ExgJclXLfhhH4BdLajwEPa/CQ64V4kMCS8nN268V8JZaMZUSJar6U4q8
 7ohwdw/x0mYXCMt2RRGOS2ndgtfSmheTY2b0/DrBZYKVVxF5AD1CVhxeP4dJncRJX5+ek
 oeb/Jr1iU158L/7tMFKJ/l1SES5pJatjOlfZejDnpHs/+OU0ZHUnXTpxOkLNNr7j55wDM
 knWoDqE2i3etCvZYyRJjewfE71hpmntFlf7s7WFTu169+6Byud9ypWZBmlHfNj+88e4jL
 ZNMkR36puIQpEJus0smjEYnIQRYaTNO5j+dttxaxn9p4JYoe83hA8mocZJfn1ydFtnA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QEbKAqnR; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F9FF60E0B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:38:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D0261780389;
 Fri, 18 Sep 2026 21:38:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 21:38:30 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 21:38:30 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>
In-Reply-To: <20260915221110.2037230-1-thomas.petazzoni@bootlin.com>
References: <20260915221110.2037230-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b0c130f5f443dd756322dc4ec9b55464@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/gnuradio: fix dependencies of
 BR2_PACKAGE_GNURADIO_PYTHON
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/09/2026 00:11, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_GNURADIO_PYTHON selects BR2_PACKAGE_PYTHON_NUMPY, so it
> should inherit its dependencies, but BR2_TOOLCHAIN_GCC_AT_LEAST_9 was
> forgotten in commit 8b3993178d0ffae312d7dd0df70d30d1d3d88873, when
> python-numpy got this gcc >= 9 dependency added.
> 
> Note that the existing BR2_HOST_GCC_AT_LEAST_9 dependency is correct:
> it is there because gnuradio needs host-python-numpy at build time.
> 
> Fixes: 8b3993178d0ffae312d7dd0df70d30d1d3d88873 ("package/python-numpy: 
> needs gcc >= 9")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
