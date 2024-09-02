Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1B4CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 15:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 206C84000B;
	Mon,  2 Sep 2024 15:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RT2Nrl7qxQQf; Mon,  2 Sep 2024 15:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB49405A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFB49405A9;
	Mon,  2 Sep 2024 15:33:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA291BF292
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6774C80F50
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpAWQGyRA4DZ for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 15:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F171E80F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F171E80F49
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F171E80F49
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 15:33:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.191]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2Dx8-1s4cRE2dxO-010v3t; Mon, 02
 Sep 2024 17:33:18 +0200
Message-ID: <f752a51d-2a74-4c84-9935-ee1dfc301e50@gmx.de>
Date: Mon, 2 Sep 2024 17:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Walle <michael@walle.cc>
References: <20240902112735.728574-1-michael@walle.cc>
 <a9865fde-0c09-42dd-8cd2-d174412dce28@gmx.de>
 <9640293d17286595101e07a82a66d44f@walle.cc>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <9640293d17286595101e07a82a66d44f@walle.cc>
X-Provags-ID: V03:K1:Qev9JW+cbvtDdntboiVdPCJb/Q9pY5nnnvT1pithtIsZcAbaPcE
 m7R8UCpWWZmHmOMNXKXzho/0kSl/HkVo4/wnFIg3y2iacDsNe2i76x/zuqTClpA7JJzPrtv
 GJ9eArsc9VZh/THor9OXlqzWHKeRLwAh3weB1n5B/ao6voJXU6ir1FVO/LGZ3ZZ+Gm+LV4t
 2QhBPJ+AeOHpxuU3041Qw==
UI-OutboundReport: notjunk:1;M01:P0:SzLisYyOVLk=;m8cuPWIxUcD5BST0xeGWlrY7czn
 4GiFpTfOQr/TWHdXzdWsZ55LM7Ayl0Ji5QXconPwFUaWHmj/U6hwALsN0R9hozJkuRMTc7Wl4
 Ibxd7wmdeugjkj+VkNM8Xyxp56A4kyJra0aydPqjU1YnlZ/5RodZ6LMEwlksgHv4otHivONxY
 BnyrdbbuGKeNfu4zgCYOmdDyrkCF5NSYYNe1HDjhkXg6Hsvf5JkmPdCa5n9qjq0xv8bHMfwHW
 J0huJk4WjLK5bnEoJzI9LX1PPwnoF7kARpcKYMIatW4WoxI2Tx2uQp1C54R18H68OjjGQQbrp
 cj8wzgitg06/iR5wwEx4kaUHB9I/3XBNfkP2toTqst9LufNV9hxpDGfIF6y+7g+tJOlvau6tk
 ueQsVfd3hFCHj/rsE9UXiFWxGqwvqFn2j0FGO1YCfFl87E5E8TpII/+nvFOHsT4jza2h0BGGJ
 91u4oSh4aLS5M8z9FKQTRKd2T1Um5P2c1sRyeznoDKgpLmb+auvLBJoEJcDjXUbBqAj5SvejT
 3y60SozlEPQMwb/uJN318+K15jFb5sNdaRBwrBGs2ZegXxvZ28xQ+AMW/HWZwJD2oppo7WXTK
 qny4BscG8VUzkLAESODh2O5nu6R4VUFlk5d19T1yYTZCS9w7Y/sTb/W0djqnqz2pAYkkstGj2
 Pqt3H2PKAarfHhAHApJ+dUBpaaZPqy04paV7m+VMcxkqMdaQMJq90FtX0JF13heRHjMgrtkGC
 a80EvwphZLLi4A7pC4iDf98TebqBYXkWbhff8qV6lPG0wM7Vb9m4Y9PU+vuLkxPB6olXq/nVc
 U4ZiYG/8BSaI2zEpjAxFn/SA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725291198; x=1725895998; i=fiona.klute@gmx.de;
 bh=IYuBhJQ9wIi/yQ2Z54982Md9kthe58vkessYiYKzWWY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nWBWLXUqJ8G1x3Bb38jtYvp/QxtN+yiwZK+BDof8seLduZ5PRI2+00lolg+dHLlp
 kHmCa+KD3rbKV4Afll+NdUSW67DSJDAeYk+JkhJhhy6wcLJt03xYKyhXE5O6IxZqA
 6QysbQIXibfLgMoi0Xi/DCmbwTCeyAdvQ5Q4NBbzhAh3+514Z3QTgz4r2Tc6QuYKb
 gnmdUa082hMsrJ7Y1+tJ+fu00WCUA/K7/toFw7pfDkpkoCwrUepP/hrY0rvHrccKx
 3ICtKXQUA+wE9/CiJMSPyE9rrRxn1pJwWkhrCGAPCzUMtN8Y8NYBQQBe4Bv4wL3r9
 Zem9gBG+OQw0/7IQVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nWBWLXUq
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 02.09.24 um 17:02 schrieb Michael Walle:
> Hi,
>
>> This looks like the DTBOs will be installed to $BINARIES_DIR along with
>> the DTBs. At least on RPi platforms it'd be preferable to be able to put
>> them in an overlays/ directory, to make it easier to create the
>> structure expected by the firmware in a genimage config without
>> templating. I don't know how common this is across other platforms that
>> use DT overlays.
>>
>> Would it be practical to add an option to install DTBOs in a
>> (configurable) subdirectory?
>
> Isn't that what is the BR2_ROOTFS_*_SCRIPT are for? I.e. to customize
> the final image to your/the board likings?
It's definitely possible, the configurable install dir would just make
the post image script that builds a disk image from the rootfs and files
in $BINARIES_DIR simpler:

With all DTBOs installed into $BINARIES_DIR/overlays I only need to list
that directory in the genimage config to be included in the boot
partition (in the "files" list).

Without a custom install dir I need to either move the files around in
$BINARIES_DIR, or generate a relatively complex genimage config with a
"file" entry for each DTBO to map it to the right path. The former is
pretty simple, but might break anything that expects the DTBOs in the
original location. There probably isn't anything that does for now
because there have been no DTBOs installed by the kernel previously, but
I can't know how future proof that'll be.

That's why I wrote the option would make it *easier* to create the
structure required by RPi firmware, it's not a necessity. If you choose
not to add it I'll probably choose the "move files around in post image
script" option and fix it if it breaks. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
