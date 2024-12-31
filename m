Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BCAE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 15:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00291607FA;
	Tue, 31 Dec 2024 15:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqUIg4EThMQq; Tue, 31 Dec 2024 15:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A98366080A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A98366080A;
	Tue, 31 Dec 2024 15:00:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78982E0F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64CEC40EC8
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUfb732YidWT for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 15:00:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 361CE40C22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 361CE40C22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 361CE40C22
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 14:59:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([84.249.220.44]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1tApSN2e2x-00I9cS; Tue, 31
 Dec 2024 15:59:56 +0100
Message-ID: <4abf920a-3da8-457b-a287-cb57fc7fd20d@gmx.de>
Date: Tue, 31 Dec 2024 16:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20241210162243.1541113-1-fiona.klute@gmx.de>
 <20241231115447.32f36592@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241231115447.32f36592@windsurf>
X-Provags-ID: V03:K1:GzuPmliX4+geLozpQaWeahSUDOEidRSqk2p7ULdo+R99piZgCVs
 Y8hG7t1J0j9v9C/h/8gdM2GDHA7vf5U8anHy8qmgpir0IvBK2AOrzSVyKWw7Qf2Ttc1k6KC
 6wU5aHXnEETrEEPlXMUUB9PsiQsNYPKzxrx1WTDDD3oOK4ukz+MdZNQZSzLpsVPD21kHKFP
 x5iCajf86IPup5aOmqufw==
UI-OutboundReport: notjunk:1;M01:P0:OyKXn9JGuKA=;F92u8wje6AJv+Enmg9Hh1+2fLP0
 DUC2Nns08rXTbQtzketotC/pA7xoGETyrDZRabJPzdzbIXcepiNFuTZKDmkux4t+//0hQ+DMk
 y0mjoXQuyZ6i6dM6fZRClnTXe4wVZXTHzPZuzC02Bnfd8WSgclXfNbgSK4MlrMai035+PmwI2
 RhF8Y7hiHuLROGPHDoEFPwbMq3OUkGb+4ZaE98LeYf/hFkA4/mwCS0cMKo3OHBHhyTbmncNKM
 hMgaLrktVdGbNM+fv6hoBxZonbEXUaU6YwKYEES/oPBMB5KgleTsZNbqNL4Kmjdc1nbCKQA1a
 yDsqMylHEIF6uNtesZsjyj69qtZoRvK0MBZAH/MJl959MeGWn5/f1Kg1hDUi7spdm6CVvBimK
 Gmev/PpLfpJRURVR/Z+GqbRdKUXDVEpgMJX3C0FEvssj8q8yiG0kAZqgshjZaBF1iGxN3gSz5
 r5qDBfFSdq+T89H0Oariup4Nz/f3SYxYrILpMmkTy9qlmsWsIyKJm3EoGoDZgU9jdGfdcMmaI
 rql5+tMvuldnfO13Oq3vtZvhekiGz5krxCT1HAeu/KS5hnvWALjWaZH9g+HZMMg6R/kjcAP/3
 ovW47zu+EkA4X1Rpr0r9Ajd8tkQk7ThivBMRpku+w2gi7Bj/zATDlHfvPHjlYcj46uVjAMEJU
 IGN5QK4vHNa83QHk3AYf8fhsDAih50+MSen4ildAMC4CFNpY1so4gJi+5SlDh1ZbOfjqzMneI
 +kX2DXpdzvAYdT3rQ1+IC2Ig3qou0xd4KYjq1V0Jz1TRvk2TuZz7A4m1Kj63Tc4NGqlptJ6vT
 KyZ++qC8uj8PtHG48lM24hiq0zlOA7IWoUzmj2dXWUkIuaPRBt3y8LnbtZzO7gG/dROhau/re
 MtLzH55bLKlQduZWqZQ6bBmCvCXprKjWNOhthv0R7YaKueTDtD84kfQIQ4Bp/kyJgDhVdPhgO
 u+pk76K1AhhVLs/nqfI/p3lA4boBQV+TmuSEGWgw18Nv9Cju1scFMZO1d58eVW5J/9HG6KYtE
 ETUzLMuauoW8A5Eu3QXePb6PVEf2kMhEAx3K7OdKSYSnkheMeiNPz/yC3ebXPD5wZ7iLFyWTV
 3XKDVwJjD1OsJinAZDaif6maZlzqRw
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1735657196; x=1736261996; i=fiona.klute@gmx.de;
 bh=Ir4RZb+nmlH0q+FkfFuHchmRsW8SGSd+xEqJ/2KzoMU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=PcdpeIhPkm+VDf8acbhML69wjEcfC5H8RgyDewga2qtk5xj3T6fja0kuBjStt8tc
 /m9Msq/hbF0QNdjoKd0jCW7bJMvV0J+CiuN+f1TxhNxwgLpuvPi/F1jI9zmJ6X99u
 vcuYatkvAx5WETdvaC60V0i8jnf5a8XZVMesyjfsJxrsIdR5gvsHAV3GqL0RMOl9r
 B1fBPza/mMbfiBL2bD8Pvfk7HFHJxzX/Qsu5YirezJsoeSz834OpWanT8g66U7Sx+
 Yz0mpKw7TFU3TnR9hf7GqzF9W1ZL+4SaT/iYEFQkxwf7O6yFDjoPkfWZUJT+9MJRE
 Hc9fX+aiw0Rr55l2ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=PcdpeIhP
Subject: Re: [Buildroot] [PATCH v2 1/4] package/bluez5_utils{,
 -headers}: bump version to 5.79
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

Hi Thomas!

Am 31.12.24 um 12:54 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> On Tue, 10 Dec 2024 17:22:39 +0100
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Upstream changelog:
>> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?h=5.79&id=0845b8f6ef2ac004b1c953cf4fe4ca3458cd8e36
>>
>> Patch for musl compatibility taken from upstream "master".
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>>   .../bluez5_utils-headers.mk                   |  2 +-
>>   ...0001-gdbus-define-MAX_INPUT-for-musl.patch | 33 +++++++++++++++++++
>>   package/bluez5_utils/bluez5_utils.hash        |  2 +-
>>   package/bluez5_utils/bluez5_utils.mk          |  2 +-
>>   4 files changed, 36 insertions(+), 3 deletions(-)
>>   create mode 100644 package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
>
> It looks like this update is causing a few build failures:
>
>    http://autobuild.buildroot.net/?reason=bluez5_utils-5.79
>
> Like this:
>
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.3.0/../../../../mips-buildroot-linux-musl/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_disconnect':
> /home/autobuild/autobuild/instance-7/output-1/build/bluez5_utils-5.79/profiles/input/hog.c:211:(.text.hog_disconnect+0x3c): undefined reference to `input_get_userspace_hid'
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.3.0/../../../../mips-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-7/output-1/build/bluez5_utils-5.79/profiles/input/hog.c:211:(.text.hog_disconnect+0x44): undefined reference to `input_get_userspace_hid'
> collect2: error: ld returned 1 exit status
>
> Could you have a look perhaps?

I can reproduce the failure with the combination of Bluez features
selected in that autobuild run [1]:

> BR2_PACKAGE_BLUEZ5_UTILS=y
>
> #
> # OBEX support needs a toolchain w/ C++
> #
> # BR2_PACKAGE_BLUEZ5_UTILS_CLIENT is not set
> # BR2_PACKAGE_BLUEZ5_UTILS_MONITOR is not set
> BR2_PACKAGE_BLUEZ5_UTILS_TOOLS=y
> BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED=y
> # BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL is not set
> # BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO is not set
> # BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH is not set
> # BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID is not set
> BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG=y
> # BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH is not set
> # BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI is not set
> # BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NETWORK is not set
> # BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC is not set
> # BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP is not set

The input_get_userspace_hid function is implemented in
profiles/input/device.c, apparently that doesn't get compiled if
BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID is not enabled. If I enable it, the
build completes. That looks like an upstream bug to me, either
--enable-hog needs to be fixed so everything it needs gets compiled, or
it needs to require --enable-hid.

I guess the quick fix for Buildroot would be to add a "depend on/select
BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID" to
BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG, the tricky part is that "select"
would create a loop because BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID already
selects HOG, so it'd probably have to be "depends on". Or we could wrap
them into a combined option, but I think it'd make sense to wait for an
upstream opinion for that.

I'll put making an upstream report on my list for next year, if you or
anyone else wants to do it first please CC me. :-)

Best regards,
Fiona

[1]
http://autobuild.buildroot.net/results/312/312a63b8fee536d345e0e5cbbb0b0c155d81635e//config

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
