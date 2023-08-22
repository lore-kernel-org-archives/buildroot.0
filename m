Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85064EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 09:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED1ED81E65;
	Tue, 22 Aug 2023 09:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED1ED81E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJt0hh9oMMMq; Tue, 22 Aug 2023 09:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40E5781E53;
	Tue, 22 Aug 2023 09:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E5781E53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3C4A1BF359
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 09:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC6CD60AE3
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 09:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC6CD60AE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DlCOoNs9-_Sc for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 09:51:52 +0000 (UTC)
X-Greylist: delayed 761 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 22 Aug 2023 09:51:51 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77672607EC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77672607EC
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 09:51:51 +0000 (UTC)
Received: from Exchange2013.PRIMES.local ([80.154.17.251]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mg6qO-1q57u11zyg-00hap7 for <buildroot@buildroot.org>; Tue, 22 Aug 2023
 11:39:07 +0200
Received: from EXCHANGE2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca]) by
 Exchange2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca%16]) with mapi id
 14.03.0513.000; Tue, 22 Aug 2023 11:39:06 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Camera Driver diesn't provide 60 FPS
Thread-Index: AdnU2JFWSd9ePUSRRI2XayX2o0v1OQ==
Date: Tue, 22 Aug 2023 09:39:06 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC8D762350@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.177]
MIME-Version: 1.0
X-Provags-ID: V03:K1:L27vz+YYgWOJ4SoEeLzIuYiiOF105uZJRCShwS7bonDyJ96wlS4
 4Exb+29ybr6BKus9vmVTWs7/mW4GDuaHwpS0FtwlYqL203GLsdUAbIE3VV2COhHYYW8nIbm
 mBaG8Z861de/H5bofVac9Yo5tEeKVzSMfp7pheBr+ZJQsh4kVzyitBPCHzAYc0TvKFGyVnH
 PT8IrldR+xaTOOzd3jKxw==
UI-OutboundReport: notjunk:1;M01:P0:OF1+eXcjiD4=;Xjyp4WkFDeKS/UpkO9hjh9zxsLn
 5X4ldjb9TQqWq7ZVFEUEbnGIwzwgh9+26fanJFHaghLNJrIYoPKFFLIHYp+9VEiuNsGOGls+g
 4GRF9V4A9RD2XbH4NoPd5luUAjkenlzeTuQg/Okklv2KbHgWkBZ8MtXbURQtGMRJ9Ir/oHpGC
 HNjbhJbjO7TKS1ArJt7EbbvNZH7ZOB/zCycA4b5MhNqBdW1ytcYM43DdTF8X91PwrUHveXMLN
 Z7zR469wpFbUS6pnzgQpeD5n1iH6vI8oCUMybjnlBaU1BfRN/TLMN/yKDbzgo81fWwDiotgwd
 ln68E9yTPTnmpGFSOabFzoXU77WzF2uh72JM4uLcsQIkCzHwHanjt84MOWPCRpWO9tiDPUpxW
 8SfATs5GCFJmVX+wrgE/HruJfaqyb0mXf0zfXaf490YtZQC9gQLqVyM0Pu1ieMZ1bcM1bTHxD
 qEs6vYtvn5N7qgEtgNyMJ0zwUqazse2m5pFVWu2sBPkiMOcxszVskFz+2eBgcQVPfWhmmw+4q
 uzmxmUuALMJtNA+v9pfJFkKLszcb0fZm/VGy9UZVYbjDLYl/OO8pliwM7BYeNxUfLWW67Muv/
 2QqZqbVXjUgFja78K4Ku9H++wI2ci82KnP4XvGBKHHj8+7Rr+gjytFKNvU/KMZfDARTIEui+q
 zfCeBy5QqYKI5xleEhwJVZMNGX5I8CrrMwLdDmBH5g1gm6F0MlIdyX3d2M72mVsCaUOjJmzb8
 EaUoOcQdd3faWr1o5lUQ+C04tOg1FSTbqSY4bwYt9dhIVn+UthobYUiPjTfOUUKP8Fvf9gtIh
 6KtNnHHSAeMnB1OG0AEPpN2ALYnKlPhB34El3WLUgwFptiug1eEEcSaGTtEluzZfLCfDJYasG
 wz7dXF/ywyLhUroPAraoyNHZY8dk3Nza3RWs=
Subject: [Buildroot] Camera Driver diesn't provide 60 FPS
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear audience,

I finally managed to build an linux image suporting my imx296 camera on the=
 Raspberry-Pi 4 (32 bit) over loadable kernel modules. There where good exa=
mples for building a helloworld kernel module.
 =

At first everything looked fine, but than I realised the camera is limited =
to 30 frames per second. I compiled a test program confirming the problem u=
nder the build root kernel. On a, standart Raspbi image (Debian) I got 60 f=
ps using the same drivers (compiled and installed over dpkg) with the same =
settings in the boot-filesystem. The driver is reporting the camera to be a=
ble to do 60 fps but test program (and application) are only reaching 30 fp=
s.

Are there any ideas about settings in the configuration concerning cameras =
I might have missed?

Thanks for your patience


PRIMES GmbH=A0=A0=A0 Max-Planck-Str. 2=A0=A0=A0 64319 Pfungstadt=A0=A0 Germ=
any=A0=A0=A0 =

T +49 6157 9878 0=A0=A0=A0 =

CEO: Dr.-Ing. Reinhard Kramer, Dr. rer. nat. Thomas Umschlag=A0=A0=A0 =

Local Court: Darmstadt HRB 5134
g.kautzmann@primes.de=A0=A0=A0 www.primes.de=A0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
