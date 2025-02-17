Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F188C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4634660656;
	Mon, 17 Feb 2025 12:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfqQLVIiHFAO; Mon, 17 Feb 2025 12:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3452E60602
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3452E60602;
	Mon, 17 Feb 2025 12:34:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE43B72
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADD7080DC0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iI6VbE2aQdUl for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 374AE80DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 374AE80DF9
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 374AE80DF9
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:33:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKDU-1tRW1t15WG-016xTw; Mon, 17
 Feb 2025 13:33:53 +0100
Message-ID: <10299ed2-643e-4ced-9ddd-579c8ef33bfb@gmx.de>
Date: Mon, 17 Feb 2025 13:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>, Romain Naour <romain.naour@smile.fr>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, =?UTF-8?Q?Jos=C3=A9_Mendes?=
 <jp.baltazar.mendes@gmail.com>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
 <20250207171458.1127620-3-fiona.klute@gmx.de> <Z6n1V0BQyoJjbn4u@ryzen>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <Z6n1V0BQyoJjbn4u@ryzen>
X-Provags-ID: V03:K1:KmBXg+ArXtwEd8hk58w7+ZQwWAMoOt8e48CyoVYrs5NNpoMBiMQ
 gxFIMvCIwXvv+9AdxeFC++Z1/xlG6VFDomj7N4BehrtAp3raz4UuhimHim5aAyasvxDRZaa
 c5StZBS2wrMKDfIAUp+12G2+v93/1m9k35GTCrFtE6Pr9Qd3EKbM4ed8Ckb1EzP0dXQWLGw
 yD8c7gSEqyLTKvontoqHA==
UI-OutboundReport: notjunk:1;M01:P0:u+zZ65AF1lk=;0DKJrWp8pdOTW1ry+6uHBdGG47l
 M4bQCHuSH1MFr7DQr7amzhCs9CXlc1YWFiH3yVNUgmkchje2ui3jYtlmF7kVd2v2nI95001CP
 cqeiRrqpGGo6z34PfJGAN//pxxUuVCcY081zP2Ai6mRIyhCXC6PEQnxtrWNHCDQfs07eFA+c1
 ZsqVwMjyejvBTLgMsZzWRC6wZbQZxJ1DXN44aNE0CWEpRCK0gmRDetp9wD9K886aIhckyMfyY
 yyjKG96YWL+Zlv1Gny48SX1IBqojkU6OXmoKOucHTCpzUKPeV4RNvhgEhdJgzLcSUsIRPQtGw
 lhreZ7haSvsZEXMo+O9bvmL8qM3B27Unpjxd9esUqBMOCDCPQS9FajMct5YHsxUBmmE1hEYSs
 Q5/uAcSydoce2GtxlwPwhGRc6FzhRh5TeXS1czcZEbkNQvMkWyJp3rxRxgyisj5WTPflDLj0u
 ewKXk0fDJ96PdqKbvOcNlklOX7vp0728rWhyPsKc7hQbKq82oIS4Rfv6kMenkLBU6o4cuyCNf
 HtVfbTS0er42clunE5IMFxz0nSvfXu9V271EbRr61PfgZWlZCMnooPRFFt/6JxvMFWv4Zi21Z
 zYc2SxG0DgbGxTtEW1DUcXAtpotioaz2HRgckDKVwS8EMum+y5jd1hn4eq9E8aK3MpAIz3SCn
 +eWo6tAXqBoW70sWEn8qpHMZZCzL6Uc9eueiuRzYE3+Ogcsm0or/7OAQPqPEq/9dZxKXGya4v
 C8I+bMesSRBe9JvHp8/fGsQEAViXG8J0CkyDkBGnoPtSwOf0C4BA7VWzPxzixogWQvXSimp1O
 Z261gUUv6qUvD+zncDvMri5N13QMeex32rTEfbaUQPt1qhRT2jK1hjux0lO4KwMt4rOEz8eAs
 EwLoRiVgmMj1sZhjbfsMV4TRvw4/by8PEyvw2vIvwyymRznA626trfTRJnFznjJYuQ6UNCIHx
 LcX18tIg6XasICKiFGDf3jcoGMVnwDoACyRJZ5w0JhMaqb0U9i2QQJnywU+X/Y2lizl6u1j9S
 4XRj3E+15PkvmfFF21JGQ3v3T/SnfoEtYLanoYc2L35voOeLu1yrNHR6q3SA+se6n+THVj7vx
 1G9hDkzvBZCMt5GYbWvcvUjrB6jgztSzQ0RaCalnkm3JPPgNfC3u2b9ooQqvJ/ax30UpxT1yZ
 gtG9cvW2Bq22/K3SGD353Zic0y4HbJ3ubQHRHrS3jaG0INFdIpFG1RexAhZn7SujAD50C6i9Y
 tL6vydkCghwmt/8564Z5G1Z9tWGOrG+iXUzQygSsvgNhmRGp56fPDFhHg/x8dkHOFGAehn4UC
 g+p+WR5aiXsiWxpZLHpa52ud+f5OzcUdsa5oH5pC7FsmsO66Ce5juftiPBCTY6y/RBowSxlRY
 mBnG9qqTfH1VFpzOaF3hAfEXOYhdF1ZMEj+1r3Pw365e220pc7CzjKj0JaZAMgWb8uAipGOEU
 UXWUKxQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739795633; x=1740400433; i=fiona.klute@gmx.de;
 bh=yL+PdIDchTRJY8e39UTwa8FXyUoX6SnjkUXiQTkPjms=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=m0de9SB+avlIq8qxw3owoTboFyQ5uX10nK0OIIpqPXj7m+pGE/X/CYeJ5v8rSPF8
 cgW0kPnFeVcFDJlhRK97YXJepwyQepMlGiquzRvp/ybCvuZ/Mcgw1wK8R5NWhyaA6
 C9uT5S6MZD7gWsJQPl/1/gCEIUCFKKV6m0j+rdGwFwGZ3+HLHk4NrkEPZnCkHaGgU
 dOBkMUoaIPst+FYuPJiADuRy2d0Tq1XOXo3JFGPXYklYdbWkPqtFye9Yj1um5RRDK
 pZkDLQhx8fVn1HhwPyGi+ovnPHwAUV9cR4yffwSKXJ7kgq+ONSge/DbzUosPlKYqy
 RoCqkVbs7TRjH9HWfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=m0de9SB+
Subject: Re: [Buildroot] [PATCH v3 2/3] board/raspberrypi: allow
 non-matching globs for DTBs
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

Hi Niklas!

Am 10.02.25 um 13:47 schrieb Niklas Cassel:
> On Fri, Feb 07, 2025 at 06:14:57PM +0100, Fiona Klute via buildroot wrote:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> When installing DTBs from the rpi-firmware package
>> (BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y), there's no DTB directly in
>> the images directory because the kernel build doesn't provide one.
>
> Your new defconfig does not seem to have BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
> set. What am I missing?

This change is independent of the defconfig, which is aimed at a board
that's well supported by in-tree DTS (both mainline and RPi downstream).
The only connection is that both are about support for RPi boards.

> Regardless, perhaps clarify/rephrase your commit message.

What needs clarifying in your opinion?

>> Using pre-compiled DTBs is discouraged, but useful for using mainline
>> kernels until suitable DTS can be merged, or to provide U-Boot with a
>> DTB (via the firmware bootloader) independent of whatever kernel DTB
>> is in use.
>
> I don't really understand which pre-compiled DTB you are using, since
> your series is not adding any DTB, and your defconfig does not have
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS set.
>
> However, wouldn't it be much better to rebase this series on either:
>
> 1) Romain's series:
> https://lore.kernel.org/buildroot/20250204163622.192932-3-romain.naour@smile.fr/
> which introduces BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>
> or
>
> 2) Your own series:
> https://lore.kernel.org/buildroot/20250207183455.1468220-1-fiona.klute@gmx.de/
>
>
> Then this series could provide a DT source file (.dts) instead of a binary
> blob (.dtb). Having a DTS file would make it easier for other buildroot
> contributors to make changes, and once upstream has a DTS merged, you can
> remove your DTS file provided by buildroot.

This patch has nothing to do with either series. Both of those series
aim to support building out-of-tree DTS and installing the resulting DTB.

This patch allows the post-image script to work if the user does not
have the kernel (or tools added by one of those series) build a DTB, and
instead sets BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y. If they have a
suitable DTS to build, there's no point in using that option. The
rpi-firmware package installs its pre-compiled DTBs into
"${BINARIES_DIR}"/rpi-firmware/, so the "${BINARIES_DIR}"/*.dtb glob
won't match anything, and including the literal glob in the FILES list
will lead to "file not found" errors.

In short: The purpose of this patch is only to make
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y work without forcing the user to
adjust the post-image script.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
