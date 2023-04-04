Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E001C6FD1D
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 16:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABB6460B0C;
	Tue,  4 Apr 2023 16:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABB6460B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kSVdvOIR_Xo0; Tue,  4 Apr 2023 16:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8FC960AE5;
	Tue,  4 Apr 2023 16:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8FC960AE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBB581BF283
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 16:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4BBA60AE5
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 16:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4BBA60AE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9AqGpyhMIKis for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 16:05:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ABF460AD1
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ABF460AD1
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 16:05:01 +0000 (UTC)
Received: from Exchange2013.PRIMES.local ([80.154.17.250]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MfHUx-1qM5uZ0MHb-00gnMU for <buildroot@buildroot.org>; Tue, 04 Apr 2023
 18:05:00 +0200
Received: from EXCHANGE2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca]) by
 Exchange2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca%16]) with mapi id
 14.03.0513.000; Tue, 4 Apr 2023 18:04:59 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Update: Tools(?) packages for drivers a kernels 6..x
Thread-Index: AdlnDnpPfD/uvZuPSKWzF+y+8GmNkA==
Date: Tue, 4 Apr 2023 16:04:58 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC8C24E7A0@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.177]
MIME-Version: 1.0
X-Provags-ID: V03:K1:rQyZRw/ai/TVryMLE9lxeu3MxoWkBolq5LrNTwqx44eHfnNmc0s
 8QBQJpCv003Cvv3tblH0akQ+E/fpsPbRpCMq0xdjFQ0550LKPyUOobvtdtR6BQuXiLthuN6
 Hxpoep1WCa5na1vfuWlTnmBnmQBNH9xcXGIIdMYCYzeWGdqhLSm4+K1LtdpoVOuJRLedpCp
 AM8yDDaiHJTCgy8iePzCQ==
UI-OutboundReport: notjunk:1;M01:P0:AfFtq9X4PVI=;FpFPd2LeXjeJ6DQ8Q6YYr5F8Jdn
 WmbdaFOvqwQj8DzrchtfVIfzpvcOQ2o7Juy6+sNETdXzIi54Z6VsUyMKj1C6vPCs5S1dlmTzF
 +Zn5Pi9DO4zUfHbO/XH+9SfMqRSjnARnDlYpwpmcoHlq82k8XkKnj7IEGkP+MXN1vbBVtZhjQ
 WFR+G6JlG8rRSqGN4DxpH5sVt2Pha5wm07M+S5mR7fUZSF8EGL55n2PMWoPJxrgtdL56D1h8g
 rlQHZ8XGeNhKdkVgcPhcY3dHAbmtaQoLXQ+KhAZpgSh/D3A2ymNyoQ06aXkzB0GeFr52klIdR
 uWGnKf+7EehdfSu8QwxJenwmzNpKbqChhoff5znZ2SlwBFIfGS6BSj7O5r6vYie9hmvqyNmBN
 5fzzoAob4YxCiO6I87izPgpwvmCBNNvZ0Uykh6N+34gM3h4hL0V8tWl01IyqE0W9OMKVfZJ/H
 7sE1isZ1EFljAB+pmMP9aLaUQsyjz6E0vo4FdFORGCDs1xgH7CuX7mSYuA+JZG4ansyjO7b/n
 MY+TtIxLRdsgpovGzFd9iI/DTv+P5Tq2ai8kRFV00K+gfmkdwNt44FSi8lQ6NNzwqNkZXzS1V
 PxTYFfc8NTYCZLbyytZSFHUIdbgo45WQTXmBEsWef45XpY7VwDMGRiu4wdb5AIjcyRpVKugqe
 cIZDUDMv/umM1lH7ipnWmhw80ebg9pYU3uqz8r/nkQ==
Subject: [Buildroot] WG: Update: Tools(?) packages for drivers a kernels 6..x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> cd output/build/linux-6.1.14/arch/arm/configs
> wget https://raw.githubusercontent.com/raspberrypi/linux/rpi-6.1.y/arch/arm/configs/bcm2711_defconfig
> make

> buildprocess was successful

Image doesn't boot, console displays the boot process untill it is detecting an USB hub, green LED is blinking 2 times, I couldn't find a description for this error. I tried with two different sd-cards same effects. Kernel is clearly displayed as Linux 6.1.14-v7l.

This seems not the right way to go.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
