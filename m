Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2214CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EAC060688;
	Sun, 18 Oct 2026 20:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wUOogO4cwwu; Sun, 18 Oct 2026 20:52:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3EDA60707
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356732;
	b=Cz+bhvb6qHPsxcXpa5xa7KyK08uP+boqw2K2YoBR3wRfCMVxuDJgyLr4LCV+C/AVgwB3
	 +TDHi1kEnbu3jY8g5PiUQ9O0MpkuIrRkJtM9Jq3fNed5rz+PDueAA8hzhOvb/OV3GUJND
	 27V3NP2hhd1GshF/8dyYbYrZmfb6je5ftKdenjdPe6pxL2xbKVX6X3tARv42eyaH5Sjd7
	 izsmvJeJbXPeSUTPBB4h1UYmzFgzICXFuMMnd8m5/JmNcL+OsEdrKSA46NFDI2lghryet
	 uNt+xBNc45eNVsUI9D9GdLHz5wGUmEmW/KLUCwdJH+RDNQmU5DCncdi26T4AhyIGnZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356732;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=rXOw0x3SXw1An6QTjA0KE4FAjmTVUeObUtufr/47RSU=;
	b=OJ/UD2ALf5ivwkSbZkyhmYC+Oju8BXub3VM2Eps+YraAM2X5mrfEOHq3DwAxJT4kJTq1
	 xvmPFmKb5jNmKDVLJOOB3cBACS4ZZRhKDk5uA4moveCr62dyWtsoIXlVhsQuF3/nW2M2O
	 lmoKRSMAmRVnB4kmDT93k2v5aolVZ8a76lZV6BH0+neGCOOkun8ujSeJkfkpqp7JUx++y
	 YO0g1J8fGdZ/Crd0H5NC1RE85kfnkDzgJYsC7qkFxsVxYDAHVUodwRuUplksrXJvyKlMH
	 YSPdBg3bY/yhnCHahuMJ0Rs5v++dHQBgTg4y23JQ6QFEb9RqeDmr262G4nKXulPgRtQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356732;
	bh=rXOw0x3SXw1An6QTjA0KE4FAjmTVUeObUtufr/47RSU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ChQ2QlchFY2J6Demqjzu80okmJsEaTTEyhFG85rxxpz+M400Xudh2pp1I8mLgGWfy
	 u8gI/I5Kq6KTeWjCKVJNHFRj02BJi8N4zEuuI7LTKbW/qLIkTpedyajOPw8bGrDQjz
	 cWbYWSvxvyWWEEHU7uOVNBCGODwFqEjk93/WmaECB4wiPTxwBlxHOP++JwU3Gd3LZt
	 kaadroOJFYlctoVTZn01zS9S8BJUQp755wUN0TxpYcpPDBxfQIgRw119Ibvj43G8Z/
	 Pwb6yXV0SWaNqRiUSXkGLOJnxY3OyN9xiPFgvDx1qlEP2QJqKt3eYZiKN9WiNbennL
	 kiV0xkJIHN3Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3EDA60707;
	Sun, 18 Oct 2026 20:52:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 543A02A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46B2E80F86
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHnCFrYEus71 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:52:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F318C80F8C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356730;
 b=WhbzH31VauTQ2XMz5KFDLEOGzaZKjU1yyjy/ik0HOWmkJEeccUEsdOc07g9AoCscYP4D
 zpNdxFUXU1NdZHf2yB/XqOYNq6hPI/F0SbNJzFFxZji/BCqcAxA0KrDHpdn/o1DzR+zV8
 tUJiZxAYIUXkFQP5RhRzlnEA4IroN5t/HdusFK/k7tgfuKWNUJYH+XQ7wwBGLtyBssukc
 hbm0k2KSPJ+C44HXf60DA9PlP/FNO+Gi1R5G/OH/r+RyH5H1Y/RudyYr4XK8a31DqBqeG
 RmLgq4jNoUGUw4wXa7JHDTxZkskR8S5D5SfjaQAxBj1ReDGZ8H5jrqnE+2pXf3i4H6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356730;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=FXtBkes1ztXm02OThQqc1E/v6CX3vQK9tIBz97YJ5yI=;
 b=E21SkvvsTuxJoB+BS0csErZIuvYh2U4Ahe+cvPS5sWxQdF5G9T6n8AFz+Zm0jmoSN7/g
 0l8VmTuzauuFGTGkZ6kgEmpBMpH01YZg1uLrijbzb1n8tmwq2Y/XNKY1UJ+24sUiGWCJ1
 AVWJdajNBz6qJRrJAE4HDUjTUnkCqxaFHEAeBxH6wITulQ9WD7jeTpUlceFOlndGOzwGq
 6EpP4EWHugHKjVfmzqikqvLRaiHpW9U1qh5TX0FWe/igu2yTE4xcB0QEr6hoV/RIM2FZf
 HvxdjAKRQHVbZJwz6yNvwP2jRFsU4rlyCwxuExJtAF6/P/qzZsKqBqreaQ65429rRdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="Rqu/LSSk"; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F318C80F8C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:52:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDywu-1xQDMB1bu8-00COU4; Sun, 18
 Oct 2026 22:52:07 +0200
Message-ID: <ceb0645d-2f67-419f-bc06-c14cc35b54fd@gmx.de>
Date: Sun, 18 Oct 2026 22:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20261018182507.536698-4-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJn9S5IBQkQ6+MhAAoJEO6nJs4hI1pYvz0P
 /34nPCo/g0WbeJB6N75/1EkM9gDD1+lT4GdFEYYnCzslSxrIsL3kWuzG2kpqrErU8i7Ao/B2
 iE3J9NinRe613xlVUy2CU1VKaekm3YTkcfR7u8G/STNEQ42S46+3JRBMlLg1YldRsfVXq8tc
 jdwo193h4zrEeEmUDm8n43BPBhhwNRf+igtI8cNVyn9nBt6BrDnSswg497lrRjGjoP2zTkLT
 Q/Sb/6rCHoyFAxVcicA7n2xvaW0Pg0rTOrtA9mVku5J3zqyS4ABtoUwPmyoTLa7vpZdC33hy
 g7+srYNdo9a1i9OKF+CK9q/4auf3bMMeJB472Q5N8yuthM+Qx8ICySElyVDYSbbQIle/h/L7
 XYgm4oE1CxwiVCi8/Y/GOqhHt+RHLRGG1Ic+btNTiW+R+4W4yGUxL7qLwepIMY9L/0UcdnUa
 OBJk4waEX2mgOTmyjKR0FAGtaSH1ebz2UbY6pz5H9tZ4BIX7ZcQN0fLZLoi/SbbF+WJgT4cd
 8BooqbaNRoglaNCtTsJ7oyDesL9l0pzQb/ni1HGAXKW3WBq49r7uPOsDBP8ygyoAOYw4b/TX
 qUjJYpp9HcoQHv0sybSbXCFUMnL1E5WUhy8bBjA9fNtU43Fv3OR2n5/5xSn6o33XVMYMtkrN
 0AvEfAOGGOMJWktEYA7rxy0TQiy0ttUq0eQszsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmAhsMFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmf1
 LrEFCQeCXvQACgkQ7qcmziEjWljtgBAAnsoRDd6TlyntiKS8aJEPnFjcFX/LqujnCT4/eIn1
 bpbIjNbGH9Toz63H5JkqqXWcX1TKmlZGHZT2xU/fKzjcyTJzji9JP+z1gQl4jNESQeqO1qEO
 kqYe6/hZ5v/yCjpv2Y1sqBnPXKcm21fkyzUwYKPuX9O1Sy1VmP1rMzIRQHXnNapJJWn0wJAW
 079YqdX1NzESJyj4stoLxIcDMkIEvOy3uhco8Bm8wS88MquJoR0KlyBR30QZy9KoxmTiWKws
 Mn6sy4aX9nac3W0pD+EyR+j/J9SWSvOENAmn4Km+ONxz93+oVLWb+KHtQQloxOsadO0wwiaZ
 xUT7vJcxSgjrHugSs+mOLznX/D8PfG/+tYLFlddphcOGldzH0rxKfs53BplAUe+LEZY1AU8p
 0WDK2h097ZQ0eZiVZlvAKSjwsjow2tpqwamtfNKrFg/GFRbNZcoQuYsf3vBW1CiZ5JQ6Vh2A
 bCn+vBDsJwD9Hcht1eVRxnIq745SQ0naL48Q3HGpKdXZpJoBQZ8bSAFhRSb3m+P4PE272rLY
 6FCkqS+UeX7RBpPkkIDoL7WS9HdvDHuQ751D56WkTnIpoF+sgW6tOEcfgFrYf3rVvh6G3B8S
 FPSOJuHYnwzMFrDNxQQKb0uS/j1s2dnlS55MouCvd5pShM5iRFzE7k3CMeS4NkhFim0=
In-Reply-To: <20261018182507.536698-4-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:TDNneCl396DevcczhhIBO1XHamuCM94mpsbQq2y9DPY3ebTRw3T
 oQMMnsLs3AyZsV36T6RztiLVk2y9/Z8+hOYAaeZn1Y/xeebUAOWXD/oVUEEW2bo8aY9eWfL
 seDmt+5FqpuXI867rEnDIIvIr4zi7Kv8b6coH1HLLT5ICKRA7vEbguAmyCM396ghu12HOkU
 rCri2xKRR6Nu9d9I2Fliw==
UI-OutboundReport: notjunk:1;M01:P0:XOE5cbp32MA=;ahdZpNL3UC3jwlYkwfbQO1r6/7I
 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
Subject: Re: [Buildroot] [PATCH] package/python-distlib: bump to version
 0.4.4
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

Am 18.10.26 um 20:24 schrieb James Hilliard:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thank you!

> ---
>   package/python-distlib/python-distlib.hash | 4 ++--
>   package/python-distlib/python-distlib.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
> index 8504366a0c..f1aa34beaf 100644
> --- a/package/python-distlib/python-distlib.hash
> +++ b/package/python-distlib/python-distlib.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/distlib/json
> -md5  6a6a1389a42f24634f06ab6978d5d96d  distlib-0.4.3.tar.gz
> -sha256  f152097224a0ae24be5a0f6bae1b9359af82133bce63f98a95f86cae1aede9ed  distlib-0.4.3.tar.gz
> +md5  027419d731f53771b20d66578c4abc13  distlib-0.4.4.tar.gz
> +sha256  ca4175b4ac7f71223cc30ed7248c45d2b38c2439d8ee6e498ab67ed63cf3508d  distlib-0.4.4.tar.gz
>   # Locally computed sha256 checksums
>   sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
> diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
> index 581c4ee4f8..2354d8bb33 100644
> --- a/package/python-distlib/python-distlib.mk
> +++ b/package/python-distlib/python-distlib.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_DISTLIB_VERSION = 0.4.3
> +PYTHON_DISTLIB_VERSION = 0.4.4
>   PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
> -PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/c9/02/bd72be9134d25ed783ecbbc38a539ffaefbf90c78418c7fb7229600dbac7
> +PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/68/bc/d36966de7304047a1001a7559fbf266c464bb5d8cc85464536ef8c9bcc32
>   PYTHON_DISTLIB_SETUP_TYPE = setuptools
>   PYTHON_DISTLIB_LICENSE = PSF-2.0
>   PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
