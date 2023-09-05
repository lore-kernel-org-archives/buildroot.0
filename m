Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3A3C83F3E
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 15:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B9DA4020C;
	Tue,  5 Sep 2023 15:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B9DA4020C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XgpHJdeVd1o; Tue,  5 Sep 2023 15:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA8D401B4;
	Tue,  5 Sep 2023 15:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA8D401B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 501A71BF306
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 15:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 298F861123
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 15:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 298F861123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_GivzyMneqw for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 15:08:09 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 05 Sep 2023 15:08:08 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F8660BB8
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0F8660BB8
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 15:08:08 +0000 (UTC)
Received: from Exchange2013.PRIMES.local ([80.154.17.251]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MUXlA-1qD6lL0yYq-00QS3X for <buildroot@buildroot.org>; Tue, 05 Sep 2023
 17:03:03 +0200
Received: from EXCHANGE2013.PRIMES.local ([fe80::d454:fe18:ff77:97c3]) by
 Exchange2013.PRIMES.local ([fe80::d454:fe18:ff77:97c3%16]) with mapi id
 14.03.0513.000; Tue, 5 Sep 2023 17:03:03 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [solution] Camera Driver doesn't provide 60 FPS
Thread-Index: AdngBpk6NRuNdhUNTfCqJCF39tdsFw==
Date: Tue, 5 Sep 2023 15:03:02 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC8DBFFF19@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.177]
MIME-Version: 1.0
X-Provags-ID: V03:K1:tXQ95K096Mo7DciPkKK//GKe4ectMBZDO39gnHEDUYwdC9Pxemt
 Z3iHaK5kjrL2HRu2piDRfD9icWiecQbd0SE/Sk/TxCl+UeGrhYFhI7ut0ZSEXzrytrnWcT1
 3+nnPa4nQSFJtDZ2YqVJ1DBl7cKBD/BUsiU7moSmtSs2DjzKOwpaM78wBKnpzB+nDg8emmh
 4aTwWKrySZAooVvziI3zg==
UI-OutboundReport: notjunk:1;M01:P0:2TPIinq+V00=;q2bRa3FTxa+RiQ+th8vzFa0EFV7
 6FgTiNhkymj0tAxLAnN96DAhbtqa/8Q/A4KqnCXKQiZ0lRAhSLe3e4Im5yLMo4mTBE2Jb51Ym
 0hh357HZ42VPe5lGCzvDjubLTqNtiK5hjIDIMDBQkoZBsRO3krVqvS2mAy/GR4l/cfnQ/5aPg
 hQSYfLFBrF2Ul+/Q8+UhZ3Y2Od1x72rm3xjnpQDkJ1uwGhcV0HMHbqYRau5JQ/XeRh0ogJTEr
 F1aVm4ztb35+fh6VQHN/8CJDntRsXEhF0wvcu9ZuhKx9zXxZ18A2UC/8wbD7mTiL/2kdSBJEr
 Fi2d8bs6EyrTbzr7QNm6fVyuNYBBWbAjjHs8qpvtR0SCZ4uREyCfAHVw6jk6IKnm1u2jgSbh0
 WFkgiKFXUnMM6EdBkzF+cMS3gc8RXixbJRfu7tavG9B/YR8ux3dKrszWEO5Xy4NoA/bXg4Xes
 kaTAe6PHQjJ5hISdfTBVfLtOh78e0gfAuFfWfTgbEqfYYY3K84Br7iXCVZvQHQ2tX9v5AF2/P
 16Yu0pcgyPxdSXo8cR0pAxV61yc3OoD1lZE8VQqEJ207KrkWrYoj2NlIe28gJKJwFWVLTRR0k
 waNQHp9XRyBXdlH7l0GwnbyVaLLbVSzNbWKYt4IxjIdYJwJbZPIIo1atguXy10REpSy6HBrSy
 wrYxyw901oPSO6ke88JW2bC2WpzrAQTa2R1Gk2DN1bSvMqNElA9zI+VziUMgCHtvMjlnsHmVu
 xXWfyeCxy4f2IBDYu+QhMVaAo6ZDd6b8rJi4mVWWMS1nwMC+tR0x5QnzdgKV2Tzijube9rjMA
 6WAyjDOn7Qk2y+e0W0OpdoPaRKWFaLW1rzY6R+G+IL3geszXolPjaTurD9QiC9bq5xi1orldA
 qSdhMiE92vhLZT0e1svwjudiuXdqsptlfDow=
Subject: [Buildroot] [solution] Camera Driver doesn't provide 60 FPS
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

>> I finally managed to build an linux image suporting my imx296 camera 
>> on the Raspberry-Pi 4 (32 bit) over loadable kernel modules.

> This really isn't a Buildroot-related question  ....

After some research I got the test programm running under Buildroot with 60fps like it does on Raspberry Pi OS.

My test programm is written like:

while(1)
{
   VideoCapture();
   DoSomething();
}

The problems where related to the scaling_governor changing the system clock according to the performance.
It seems as if it is set to a power saving mode as default, so the RaspberryPi 4 is running only with 600MHz.

For high performance:
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

For automatic performance scaling:
echo ondemand | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

Back to the default I experienced:
echo powersave | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor


May it be some help for others.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
