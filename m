Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B4AC433FE
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 15:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B9E6137E;
	Thu, 21 Apr 2022 15:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOOHSIGgfMWg; Thu, 21 Apr 2022 15:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D460261351;
	Thu, 21 Apr 2022 15:37:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA5F1BF304
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 15:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0638B410B7
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 15:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGEnlWsoyuWy for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 15:37:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11C1F40499
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 15:37:11 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u15so10782867ejf.11
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odJW5YbQtyCq7VikCY/vHbN4xw/l3bLw2D7Kee68iCk=;
 b=N5OQlKgZnRcTfNs3uxJw2uuHiB/TTwwye8oxRQ4KeuaVCDuLz9dYXOuD1S19hPlWMk
 q84D1C/Bu6AA9k7fs2r3kDw4ycn02dt6ZTJkbFLGMKiFbcxkq3AUX0nk+JaPAqMjxcte
 lEL2yw/wFmVK1I+hV7DFIPm00GM0ILdrTM/7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odJW5YbQtyCq7VikCY/vHbN4xw/l3bLw2D7Kee68iCk=;
 b=0YqRxpDnp/myT5dLDK0NeyM1dJgH7sjXVZUgGOTrdWG8KVb7s6+QSRQgRcVx4Z8Mqx
 yT8BWw2f0WA6eogRHfXlzqwW5nVq6s1BEAnRyhSqRiLWh5u7XXkdEdoRuEIs0x+lzlPn
 /hPBlpvzR6B+jdDtXbviokMoPhu6uODs/2jkXo82YAhtKEksFrKUsxybtReYBuMwbSzL
 Eg9c+0NCGNcNkv8D9yGAYBuYD1uL94kin3c90C8ZIRcG++NnAnb/98GKdIONnCMAaxrx
 eZ48KIjrpJTso7oVZj+LqeuInRptiGL4+fBFDsw1t+maLkoha4RKTEpxbEG44YweHz+o
 XyWA==
X-Gm-Message-State: AOAM53137M+QLPsrOrB5YCwfoK67nb+RcLp7duAfG143U2XdntVeIBJ0
 tYhjRMyeF4NwoFZ0y7L4RcsfZmEXSfg2UVbf9Y9MGM4tCbYRoQ==
X-Google-Smtp-Source: ABdhPJzXqDz/CJpTFDKvW4id8rwCExkkyjjyuyRvQX7ESOkCG9oBUerD7KcHkwDgNKzAbS1o9p2VCLO4GNFcd9uFj8c=
X-Received: by 2002:a17:906:9f1d:b0:6e8:88f4:3545 with SMTP id
 fy29-20020a1709069f1d00b006e888f43545mr94050ejc.167.1650555430046; Thu, 21
 Apr 2022 08:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSsCzsQbWw25kghn49m6vZ9XBMi5NQfBHhTh5X6E3z=JFg@mail.gmail.com>
 <CADYjeStJRry=ed46Km6nsaFk+wtbaxs0bLDfiPmtJ7xwZs2UwA@mail.gmail.com>
 <Yio9dHRYViMb7+iG@arch-zen.localdomain>
In-Reply-To: <Yio9dHRYViMb7+iG@arch-zen.localdomain>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 21 Apr 2022 21:06:58 +0530
Message-ID: <CAMty3ZAWobw-jq0Z=Uc1BGmg_tuPTvUNjOq07fZox=VLCXh-zg@mail.gmail.com>
To: Jan Havran <havran.jan@email.cz>
Subject: Re: [Buildroot] How to connect to Wifi on start-up using Buildroot?
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
Cc: buildroot@buildroot.org, Sourabh Hegde <hrsourabh011@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

On Thu, Mar 10, 2022 at 11:33 PM Jan Havran <havran.jan@email.cz> wrote:
>
> Hi Sourabh,
>
> after enabling RPi firmware you must load the Wifi driver - since you are using
> systemd, it should by handled by udev on start I think.
>
> So you probably just need to configure /etc/network/interfaces to start wpa_supplicant
> on wlan0 with /etc/wpa_supplicant.conf file, where you can put your credentials.
> Or at least that is what I have done, but I am not using systemd.
>
> I did something similar some time ago, you can check it here:
> https://gitlab.com/sonicpp/gnss-pi/-/commit/caf0317c024e51fc7e322deacd09ec9346d47e26
>
> (note that to make "my" credentials public in that commit was an intention).
>
> P.S.: if you want to have any modifications to be part of your image with filesystem,
> you can do it by using rootfs overlays for example:
> https://buildroot.org/downloads/manual/manual.html#rootfs-custom
>
> Regards,
>
> Jan Havran
>
> V Thu, Mar 10, 2022 at 05:43:27PM +0100, Sourabh Hegde napsal(a):
> > Hello All,
> >
> > I am trying to connect my Raspberry Pi CM4 to Wifi automatically after
> > start-up. I am using Buildroot based Linux distribution. I have worked with
> > Yocto before and it provides systemd-networkd and wpa_supplicant feature to
> > connect to wifi on boot. I am lloking something similar in Buildroot but
> > couldn't find any notes online.
> >
> > So far, I think I have enabled the necessary config/driver using "make
> > menuconfig" :
> > [image: wpa_supplicant.png]
> > [image: firmware.png]
> >
> > But now, how can I set-up wpa_supplicant.conf? Any link to notes or
> > suggestion would be helpful.

Did anyone find the fix for it? I did see master is failing still.

# cat /etc/wpa_supplicant.conf
ctrl_interface=/var/run/wpa_supplicant
ap_scan=1

network={
  key_mgmt=NONE
}
network={
        ssid="ARJ"
        #psk="Ind123#"
        psk=8078b7e8da96488dcd3561466208348e028cafa46172882cbe3329d6c7caf4a7
}
# wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
Successfully initialized wpa_supplicant
Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
Line 1: Invalid configuration line 'ctrl_interface=/var/run/wpa_supplicant'.
Failed to read or parse configuration '/etc/wpa_supplicant.conf'.
: CTRL-EVENT-DSCP-POLICY clear_all

Jagan.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
