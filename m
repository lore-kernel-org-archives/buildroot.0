Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6325EE020C
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 12:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BC4040BC7;
	Wed, 11 Sep 2024 12:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgteROVSyfyo; Wed, 11 Sep 2024 12:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF71A40BDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF71A40BDF;
	Wed, 11 Sep 2024 12:05:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A39521BF35B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 12:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FAF9608A9
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 12:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mL1xG8vmNU1 for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 12:05:44 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 11 Sep 2024 12:05:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21CD1605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21CD1605A9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.24;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21CD1605A9
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 12:05:43 +0000 (UTC)
Received: from [192.168.0.68] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MXpQA-1sVmP70R4O-00Ytqt; Wed, 11 Sep 2024 14:00:33 +0200
Message-ID: <633a76e1-8899-4750-9b0c-6d8f6c42321d@green-communications.fr>
Date: Wed, 11 Sep 2024 14:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240911105436.854798-1-adam.duskett@amarulasolutions.com>
Content-Language: fr
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20240911105436.854798-1-adam.duskett@amarulasolutions.com>
X-Provags-ID: V03:K1:zRbUf9pJ7x72tD2pouw/Qx/Oz7QBOS9Mz21aQkypzsoPpxCvaZN
 mS7xndiFlTUzznVOUX6kdbAim5988oJQJ3+p46IqeniVgJr9FH/N++AnL5TH0B6c5qGtEQG
 l3KEMz+p6FzQwtq0wQb22FvltbTdoaf8ia6W8yW7smHWr0Tgk+snle3eMUMYsmrJKFBEBls
 lpHYfvSe33Ij8pYwh/YIw==
UI-OutboundReport: notjunk:1;M01:P0:WIvqrz+8olA=;RDXXPHi0EVu0ebatGcmZceHYUIT
 sANaIr4LSlXlD3OnLctQ3f/F9vvxeCEtG24kQlb+MyMMjlYoSW+u2A2XKX+E5BgC2hjzmQmJY
 pi8al0l6nwy2neDDXSXXH2lV136RLO7aTTaMHAirrGC86f3gtZFmWdhLEbu+IZ+Of8RNckDKX
 I4eKkbj5LqVE2MdwSAFIWZ7WwGGvMypwWA203uTSilxUNVSwgfuuknPKrbb2bgRuknJPbwsrD
 wDRU2VCSByyRrDAaXyUoJ2KU2wRgUhyr/MQ4Dl7cWv6TmGYcM4U4pLGnsKyzwvlUlS8E+9T27
 kRhx4/rO5FavFszaKcrOV4yYHoEOIJxKfLgxCp/BR4fPNMMQJYWZPyASzYhVcie9zxXJMD74c
 8V0jYE93rXi2VRSDWm9b6f2Zq0p+D2G/QEpMN0WapTMiLIpAn28eLABh3cUoRPNHLRsHOQ0iN
 T17oUDXR5/QmYJEtx0jCTYeJwlqlnAnhtg5cr8gD94hcACB7eCXkZeqAtArzchQzaWuxROzgM
 vsyIyOxVl9HSzgFDoMyI96hVFrV/uvpeDUOcYT3JfwwXZ8HC9IbjZA90IrLRPkvcCI0J6ywKU
 8gs4IKAGDY2GzTdHFfNEQb0St1kCt/ZyA3+ldhapHmZd/8CQew1Z7nrc9+L09qF+3ge16cdi4
 WrV/+GjeD/dukV6f49TOYOhlj0eiPmYv1GliVazailcLtlaxXWp8Rl1Sg9P6CTg1nojGqHZqt
 lmUsD+PyB3bmXUzjvFdnbjPQbEcCuiPTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: revert commit
 4349746dac6f55b0b0faca21a7e609fb67d1471b
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/09/2024 12:54, Adam Duskett wrote:
> Commit 4349746dac6f55b0b0faca21a7e609fb67d1471b states:
> ```
> commit 4349746dac6f55b0b0faca21a7e609fb67d1471b
> Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Date:   Thu Apr 18 11:13:50 2019 +0200
> 
> package/boost: don't install boost cmake files
> 
> Since version 1.70.0, boost installs its own cmake files which are
> utterly broken so don't install them otherwise all cmake packages using
> boost (host-thrift, domoticz, i2pd ...) will fail because
> BOOST_INCLUDE_DIRS will be empty
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4ada26bab5c1e6504c7d8c92672326ced1d336df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ```
> 
> However, this has sense been fixed in the five years this change has been in
> Buildroot. Furthermore, having --no-cmake-config breaks packages expecting to
> dynamically link to boost::log with a multitude of
> `undefined reference to boost::log` errors.
> See: https://github.com/mendersoftware/mender/pull/1663 for one such example.
> 
> As the --no-cmake-config is no longer needed because the original problem has
> long since been fixed upstream, it is safe to revert the change.
> 
> Tested with the following packages as a smoke test:
> 
>    - host-thrift
>    - domoticz
>    - i2pd
>    - libcpprestsdk
>    - log4cxx

meson can also read cmake files and it also have special cases for 
boost. I'm not sure how both interact with each other, but it should 
probably work fine. If you want to be sure, try compiling mpd or 
libcamera-apps.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
