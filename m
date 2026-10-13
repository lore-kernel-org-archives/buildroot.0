Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7EFCC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC672805E1;
	Tue, 13 Oct 2026 20:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rj8dPJ40Sn0X; Tue, 13 Oct 2026 20:21:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D709D805F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791922897;
	b=VrC/ZbKBDSVwQb6bDvglWN5y3G767lUAedYDKZkaYPMJar2ZwCK3X2C+r7y6296sYO2n
	 UQjwGoGErg7Uxv/CNkMAsix1hBmjZPuWlpt1sJNOjngaxKKVhO26aBSQab8FIN5weWUWa
	 vBogw84jMouzA8DbTzgtjfu3OYnep9zi5uO29edARuXetQ7J+j8z6EYJcoxE+egFqEOG4
	 +p/czr3U/aqlDeOQ58ClBsZRm+rkM1kLNoqb+PrJuOPnzA3UBK/5li0hmB5up4l9vS7WJ
	 KsJnOysd6N6YMXBpChd1rvzpyFrXYzWAgcnmaH/PRecy1UC0mjlAKOMkDawAc8nU6Yg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791922897;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=lb7bMSj1+VDlsGW27I2DjFfJjfrSINmEolAuxjxD7TY=;
	b=QMNWFBm+lSgtFEgQtT2sUcP2aYv/d3bedPqLDZDd+iiV1xRxH9Jpbv9uiPCy+p/xMgZi
	 NZr5UPmAC0TWLx8oAPitAi6wJV/oRHkQTdONS8HtcLxtm6oc2iCocS63reAYT62uuv5fE
	 Hs8Nr4WkqS+O4rZG9Il+PHtYVr1AQ1Nn9zMU8QOWTz5b0tErOuzWWfTIZsPhext2XM1sy
	 GZqHtCpJ3AtZkwbrbkZ4PAPaIdR4V+vloUlacWXWHgATAWcvKFaaEko8BtABAAztwjkeb
	 cfmEMqYy7Ee8euy5PqFMkQsKvA1Sq47ODg8E4w9ol4mN9RCo1F5v8ZIZ2mpKgNfrNnQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791922896;
	bh=lb7bMSj1+VDlsGW27I2DjFfJjfrSINmEolAuxjxD7TY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rLWO6gtyZAL+xnOwDufan0eCSUHdM4881xpkDxQ6GlkWgku3ikvPgUjV6V23DUj0I
	 vyS6plKoiKdyFa25gdejw5MB6KzOENdv/hfJAvbbkd1pGPVy/ediGwm70efLS1R+RO
	 iT0iHi4leuUtVqf/KB0jPZUl3+Uft5HaNrAg3Gsu+rPXNW3GUDxRRDay6eMfR5AOFX
	 IQS9gH5bTqQUDHuqfD2rIO659wwmqDsee/KDyvJEvkGSPms31/ThfW6KRsdCf2cPi3
	 x26b8X7bQpaGn8N64c/3EQlJqH9bkW383qu3UkOnrHBa14yRfM8Qti4mNkyyq+mV9O
	 k+IqtIWh/UbJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D709D805F5;
	Tue, 13 Oct 2026 20:21:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF7B32AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0D9D405C5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJqlDgfumFMx for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:21:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1C2CF40560
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791922894;
 b=lEqbMe+/COO30czWqQIGP1i9UTTkF0SmbFKO9CTzCc8teVvD0CpyePNBGS4P5n3juKyf
 K4HsoO77pa0XY6pS0YLK8D0MDLWCIBF6yDEZiLcCYcD/fBhRdJkFL1H/9hiO7AhJF1Myx
 41UDRWcbO4dtGBKiqpdrsLqcpVB/8S9p/sYoIN8EQyWv+4m0gfO2F/Qjj4RSKAm/6UIH5
 FNoq98o4wwI/eGSbUtCqYxfCuLyCY1Yegmmq91NyWqxEhYD8hBCjj3P1oVScDdpWaVmEI
 QQ45c3DgVcElwEcHMk4nfrowDPIMaCAaDi4I7ntx3Kyk+14jzvd0Z2j96qFe3VRzOHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791922894;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=v++jYlqSa9eoc3MJDAwHlWc1c3ZQxA9D8VAPNo18D2I=;
 b=SiX8H/K220ugxKEaOFr9SRBiTPAG9MscZ1behpYm7Psd4JzH13YUNhO6/zbT7bnJkg5Z
 i2gi47E7AIuTaRtCvv4av1+9y+oNTz+EQMqumr52IP/99vrTigpflOMUprng+Cs58oUbu
 wc6vx0D1sazNKxqMjxzIKhNOtekPHM9131MZQ8c6KTJ5qrHE1vvH0NIHwPwJhgimVAFKD
 0lA2mQrrda9zqVY+xJ5AcJ3K7m7rG846fYzcp8bEC88S2zdUrfXLYUesXcbtXYhRdWCIF
 Hrfg4Hl2cY0WGJK8Gi6JZI442TiFm4Fhj/85e+t8dokqOyu4FfBeBQc3tOBnfCGqvAQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lmeTfKnC; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C2CF40560
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:21:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDhhN-1xOBf41zTr-006Sb4; Tue, 13
 Oct 2026 22:21:29 +0200
Message-ID: <5068010a-25e4-440c-99fe-c8e2b3b30d27@gmx.de>
Date: Tue, 13 Oct 2026 22:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yegor Yefremov <yegorslists@googlemail.com>, buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>
References: <20261009083420.1298439-1-yegorslists@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261009083420.1298439-1-yegorslists@gmail.com>
X-Provags-ID: V03:K1:LB65QFUb7wQuvAvfAW/St+HkLyHuiLDRqICIzLda2TpFJdx5Stb
 WX0RVSWgADf8EAoecFPUDbWQAqKDYFgSU69gt1ZG3f7hM3t4/0T/TD6UHtcJ8efvXxhqRfy
 cGZ65+T2915pZ7Khet4lGYfXwQvIpaS2YiSgSPcLKzHrboqYxH36YxxYoXmYDmVT14KqQLp
 p4ehtUPh9VX7DAeYpU7SQ==
UI-OutboundReport: notjunk:1;M01:P0:1xf6MCaruCw=;nXcznfCCZSDZcIE8Vv97Lrp57y+
 +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
 w+1RJP1h5CE=
Subject: Re: [Buildroot] [PATCH 0/2] package/python-types-*: fix build with
 setuptools < 82.0.1
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 09.10.26 um 10:34 schrieb Yegor Yefremov:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The latest typeshed stub packages (types-python-dateutil, types-psutil
> and types-setuptools) use "<pkg>-stubs" keys in
> [tool.setuptools.package-data] and require setuptools >= 82.0.1, as
> older versions reject such keys, see
> https://autobuild.buildroot.org/results/1ce798157bff8a423ca8c7c9f0e82620890ec3b3
> 
> Bumping setuptools is not an option for now, as 82.x breaks older U-Boot
> versions using binman (see commit aa8e6bc395fe), so instead of fixing
> up each pyproject.toml, this series backports the relevant part of the
> upstream validate-pyproject fix to our setuptools 80.9.0 and skips the
> now unneeded build dependency check in the three stub packages.

Adding patches and is the wrong way to approach the problem. The build 
log linked in the aa8e6bc395fe11070cab29f2ef8f848a1a871c4e commit 
message indicates the problem is that the "pkg_resources" module has 
been removed from setuptools with version 82.

So the correct approach would be to package a backport [1], allow builds 
with old U-Boot versions and binman to depend on that (and test such a 
build). Then we can merge that and the setuptools{,-scm} updates James 
has posted almost 2 weeks ago [2, 3] (I already have those in my local 
repository and they work fine).

The quick fix would be to revert the typeshed updates until then, I 
don't see anything critical about them.

Best regards,
Fiona


[1] https://pypi.org/project/pkg-resources-backport/
[2] 
https://patchwork.buildroot.org/project/buildroot/patch/20261003033954.462113-1-james.hilliard1@gmail.com/
[3] https://patchwork.buildroot.org/project/buildroot/list/?series=960

> Tested by building python-types-python-dateutil, host-python-types-psutil
> and host-python-types-setuptools for an i686 Bootlin toolchain and
> checking that the stubs get installed.
> 
> Yegor Yefremov (2):
>    package/python-setuptools: accept PEP 561 stub names as package-data
>      keys
>    package/python-types-{python-dateutil, psutil, setuptools}: skip build
>      dependency check
> 
>   ...-561-stub-names-as-package-data-keys.patch | 42 +++++++++++++++++++
>   .../python-types-psutil.mk                    |  3 ++
>   .../python-types-python-dateutil.mk           |  3 ++
>   .../python-types-setuptools.mk                |  3 ++
>   4 files changed, 51 insertions(+)
>   create mode 100644 package/python-setuptools/0002-config-allow-PEP-561-stub-names-as-package-data-keys.patch
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
