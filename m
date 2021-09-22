Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2DDC4332F
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 17:40:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4CC46120F
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 17:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4CC46120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F053613FA;
	Wed, 22 Sep 2021 17:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-tlVV9-5AOz; Wed, 22 Sep 2021 17:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8883861436;
	Wed, 22 Sep 2021 17:40:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 970D81BF59D
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 17:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9247283D7B
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 17:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXG1c79DuGE7 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 17:40:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B849F82969
 for <buildroot@busybox.net>; Wed, 22 Sep 2021 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=badeba3b8450; t=1632332449;
 bh=ZyUa213useetKR5+rMKcSFmOsDS/61rwyujSHC9sexk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=AlB2flgTeZL+H1mhoL3iQJJPT9eldrX4S0EXO4eXczDeP2QcjonRNZBDW0s6HTK2y
 Lh9tDHS/ZqxViJ7AsuhmoPTS0Q1e5n+BHY0k80nGJTPUnGq1pnNKZty12twiUkJmxx
 YmuRfwovC1P1YbK6RBllhafdqUnW3868oqBMXRPk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1mRzmG45L2-003Nlw; Wed, 22
 Sep 2021 19:40:49 +0200
Date: Wed, 22 Sep 2021 19:40:47 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20210922194047.32914074@gmx.net>
In-Reply-To: <76537c4d-163e-7947-5956-69969420e083@green-communications.fr>
References: <CAHpv4cOfQv_PoRU0YN3NANLjcK9tooxUM-zFcQm-t2Xc0zP5xQ@mail.gmail.com>
 <76537c4d-163e-7947-5956-69969420e083@green-communications.fr>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:jJYq/KKlA4jc10dBKc+8U1Wv4R7KlkC9p+ZDPGNefDjjvNhnMmE
 D9wq2sFVFTspepYI1CDP5TsQYEDsK/MihxiNhq0mqRO8lFGoSIEN4bJe9hADq7D57/130nP
 XPjhQ1Fm/UxNACjF6kTJmzbMuy8UpiSsaL9ynUcnZ2BZkkgjjeV+/qCScTNBr89A6xxapk4
 MIn5YATMhLcjBElSCJr+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4qjDYvXnoUo=:aQ9kEYzfpJcciftagy44XF
 RbBsfPciH3O8zKDxtYo4vYNPNqjLFaBSXDlb0WFE/KwDOgUsWj/Xkrd1YYphBscANqDaiOOgy
 Ze2Dy8963RH9hAxUlxsIhDSpQTYZ6R1ACXb8nvYPoWm/2LYMYuoXStDan9Ml/I0UoLmbyqWrq
 4k14CI9cvWY9YNjEUSWvIMTS8JtG7psVGUs38i2bbbDfgFcubysdJOoRTaXLmHqRgimjwsgwE
 iV2rwpRKMfZWadtdIMd0fSj4z98IDprbJv+2qmIdwhny2+cfSuuZy05PuQ0RwdWfyaS0epm3n
 +ePT8LmWBDzEcIdJIi9HpUXjEf4RxAnzfjvoZdJvUejhUg3VbcQsk7bO+4iFKbMhDdPt/chiM
 KAHeVKBQvcNZZaH+Y9MrkpONwj2H6MHm751Z9usddpa27Qni42IR/fyytsaD3WTXCU2/JtIf8
 1rUliAG9q9S4zfJEBV0oQaXTsP2GEFy++o/ALgIGJDYad7mz531P5kqooC9Xk7i/gjHgL71Xn
 PjbSohLXCsq8cNdXJgxlVGkdZRBGEznEeJ+3Ohwg2f8KCn3ybaulhjSLvzkf6ryg9YwYiPh37
 qzZuygl1HYm7SqzkA4PNdllE90+4tBVtgdmEK7UQzKkzsd4RdxZKHLu2HEeeONAx+Jue7ENDA
 7fY4MqGp22e2n3noT239QLfdKxXnb0+uc3zsruRhcKGajbQ6E44+YU0lh7C0CGBT7LQvoqC88
 +WJ1w617oKKBFz42MDVtIPW+PNzRfLLPD3F91WSU5dXeJNcV0tPNqHn/ZlTk/32ISTGE0ijH7
 krnAkJWxmDkoSzveAeoM6o7aZ5uufeuHuPHeKWn5jGiCGGsaIUdlgsrsJQYmLWSbu944i1dFD
 WRICJtCUIGYBiNTZS0EYMYplKiPy/zkK+OW+/VIPZGFipvKesFuz3C38iC3z708o1+WnZ8BHi
 TkQBLR/lOQ4CFborW8Nn7Y2ez9AMxKoHE55yzf/DjIFETTlI2v2aV+ei8ynIPnzwlOxgbGxrd
 ny16Z5dbyZGBCMNDAqa2QBzz5UjH+uVkmH7mAbQk5v1S7IIVtPryB79egHE+IuWa0upJZHE5r
 28FpzgA6cyHDQc=
Subject: Re: [Buildroot] Recommended way to auto-reconnect wifi?
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Jeremy Fleischman <jeremyfleischman@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello Jeremy, Nicolas,

On Wed, 22 Sep 2021 10:19:27 +0200, Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> On 22/09/2021 02:16, Jeremy Fleischman wrote:
> > I've been happily using buildroot for a growing number of Raspberry PIs at
> > home. However, I've noticed that whenever our wifi cuts out, they do not
> > reconnect when it comes back.
> >
> > I've got them configured using BusyBox init + mdev + ifupdown +
> > wpa_supplicant. I've skimmed through /etc/inittab, and I think I understand
> > how everything is wired together:
> >
> >    - /etc/init.d/S10mdev: mdev starts up, and asynchronously starts
> > discovering devices.
> >    - /etc/init.d/S40network: This runs /sbin/ifup -a. I think this runs
> > while mdev is still discovering devices, which is fine, because there's a
> > wait-delay configured in /etc/network/interfaces:
> >
> > # cat /etc/network/interfaces
> > auto lo
> > iface lo inet loopback
> >
> > auto wlan0
> > iface wlan0 inet dhcp
> >      hostname thermometer
> >      pre-up wpa_supplicant -D nl80211 -i wlan0 -c /etc/wpa_supplicant.conf -B
> >      post-down killall -q wpa_supplicant
> >      *wait-delay 15*
> >
> > iface default inet dhcp
> >
> > As far as I can tell, this all only ever happens at startup, and there
> > isn't any mechanism that would attempt to reconnect to a wifi network after
> > a disconnect. I've done some googling, and here's what I've learned:
> >
> >    - I'm pretty sure that wpa_supplicant is not supposed to handle this.
> >    - It looks like some people write scripts to handle this for themselves.
> > See this SO answer <https://raspberrypi.stackexchange.com/a/5121> and
> > this dweeber/WiFi_Check
> > repo <https://github.com/dweeber/WiFi_Check>.
> >
> > Am I correct that this is something I should fix by adding some sort of
> > background/cron process to do something like the WiFi_Check script above?
> > Or is this something buildroot does have baked in support for, and I just
> > haven't found it yet?
>
> Buildroot has nothing out of the box for this, short of
> NetworkManager/connman or the likes.
>
> In your case, wpasupplicant should reconnect automatically if it is
> disconnected, but the busybox DHCP client, udhcpc  won't retry
> indefinitely by default. If you use a custom busybox configuration, you
> can modify CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS to make udhcpc go into
> background and retry indefinitely.

Alternatively use the following patch [1] to change the ifupdown-scripts...,
or do a complete change away from wpasupplicant and use iwd (see [2])
providing AutoConnect and DHCP...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20210216202022.27264-1-ps.report@gmx.net/
[2] https://iwd.wiki.kernel.org/start


>
> Also, note that you can copy the Debian ifupdown scripts into your image
> and then use the Debian's wpa-* options in /etc/network/interface. You
> will have to tweak them a bit because buildroot install wpasupplicant in
> /usr/sbin instead of /sbin.
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
