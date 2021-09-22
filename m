Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DFBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:19:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B055E61184
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B055E61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8088540774;
	Wed, 22 Sep 2021 08:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cj3KMEY2HZlD; Wed, 22 Sep 2021 08:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69B04072B;
	Wed, 22 Sep 2021 08:19:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 744E51BF30E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64145833A0
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPUR1ge4LK4l for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 08:19:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E4EB83372
 for <buildroot@busybox.net>; Wed, 22 Sep 2021 08:19:33 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mn2Jj-1nBbMr0hfD-00k4Jp; Wed, 22 Sep 2021 10:19:30 +0200
To: Jeremy Fleischman <jeremyfleischman@gmail.com>, buildroot@busybox.net
References: <CAHpv4cOfQv_PoRU0YN3NANLjcK9tooxUM-zFcQm-t2Xc0zP5xQ@mail.gmail.com>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <76537c4d-163e-7947-5956-69969420e083@green-communications.fr>
Date: Wed, 22 Sep 2021 10:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHpv4cOfQv_PoRU0YN3NANLjcK9tooxUM-zFcQm-t2Xc0zP5xQ@mail.gmail.com>
Content-Language: fr
X-Provags-ID: V03:K1:OoHDrFCTr0I3hO997ajGhzCriACzcsxuc8kqCOtd22TZbb5tB/7
 rbXc/f8kLrtVj1PqcAjMlM92QilubTJImUonVGCcnVNEC1cSJufk8QqxwXog6T+humjOvvo
 Mt/AJqx2QtFGFxZqt8vGZJP7I/FsqQCt/xQRYJf5oVA8+v9ReOne6NoSzSBvkGjtrE7prFa
 h9dfRAld7o2OiOfdbbDhA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xK7QarqLBwM=:Zpr4O7Maamc8Rf4E+hJxPs
 FXlAtL9jKHGfi/CbHC67Rq/obbebcTR7KMNpgAiwpA+dOJzBXHjDD2F7Gbnf36gCydhbcxQ+T
 19NZ2Y/xStpWoSGVjDSMWErObFNjYhrqu5GDUwjHI6tbqbxJNM7bOBqBSRvgHpkxNDfpWohwR
 QcNwKJusEeXjPgNMHojm0f09Lb55fjmwktYKnq5XBvqD7EKzifAXqjnDjnLlDnnqsVW5o1y85
 kbQv2NDGs/uH5zYy7kQCijeDo8gLLhAEbMHPQr8jpg3lRlFX9fS3PdgZwz8cggLryoD8KugLt
 h2xaAlGgmVA34NhfQV/775bz+GwKBGNudfq4lnyf6L3rb4CFvkg4xA+EYxTBv2+HssuEO7igs
 iygbl14FECOdOwSJEARNJyQwJtsw5fxfUL5yMAxLFpMYLA5rB+k5pE5NcKEZe74cUxs5ZSSJI
 5ypFXSZ8a3dBzRFo9bNEotJbxHyMap6f4orueLmd+Ay1gwpVK1N08+uSIxzydGRHLWT1qZ0Ns
 fLxwfGjAQOjx1suVlcqTdyDu4crtiqwPMqaVAt4cC+ZDgE0BvVJ+vlJD5qaZK4jFoFRgZXtfz
 N7UJLyalCDxJYQd15igbZAco3aRkb5ycXIjHJqIePDtzHyj/HhN507J+jDRWB1GVhp74WMQIk
 FZnVMn1JWlT+65cYdu9thqLGOKJeuzQ1dHGMdGqsC4sYeCkMwsXdtIX964BbfCCCkjDvTL+Xt
 vnZubplL6BTD9DAoaZDZrZo4bCen3NNT4BYE0h6JpnBciBiP6f4G30Njr3BK9UEKmorLQYuk6
 zqhB+K9
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On 22/09/2021 02:16, Jeremy Fleischman wrote:
> I've been happily using buildroot for a growing number of Raspberry PIs at
> home. However, I've noticed that whenever our wifi cuts out, they do not
> reconnect when it comes back.
> 
> I've got them configured using BusyBox init + mdev + ifupdown +
> wpa_supplicant. I've skimmed through /etc/inittab, and I think I understand
> how everything is wired together:
> 
>    - /etc/init.d/S10mdev: mdev starts up, and asynchronously starts
> discovering devices.
>    - /etc/init.d/S40network: This runs /sbin/ifup -a. I think this runs
> while mdev is still discovering devices, which is fine, because there's a
> wait-delay configured in /etc/network/interfaces:
> 
> # cat /etc/network/interfaces
> auto lo
> iface lo inet loopback
> 
> auto wlan0
> iface wlan0 inet dhcp
>      hostname thermometer
>      pre-up wpa_supplicant -D nl80211 -i wlan0 -c /etc/wpa_supplicant.conf -B
>      post-down killall -q wpa_supplicant
>      *wait-delay 15*
> 
> iface default inet dhcp
> 
> As far as I can tell, this all only ever happens at startup, and there
> isn't any mechanism that would attempt to reconnect to a wifi network after
> a disconnect. I've done some googling, and here's what I've learned:
> 
>    - I'm pretty sure that wpa_supplicant is not supposed to handle this.
>    - It looks like some people write scripts to handle this for themselves.
> See this SO answer <https://raspberrypi.stackexchange.com/a/5121> and
> this dweeber/WiFi_Check
> repo <https://github.com/dweeber/WiFi_Check>.
> 
> Am I correct that this is something I should fix by adding some sort of
> background/cron process to do something like the WiFi_Check script above?
> Or is this something buildroot does have baked in support for, and I just
> haven't found it yet?

Buildroot has nothing out of the box for this, short of 
NetworkManager/connman or the likes.

In your case, wpasupplicant should reconnect automatically if it is 
disconnected, but the busybox DHCP client, udhcpc  won't retry 
indefinitely by default. If you use a custom busybox configuration, you 
can modify CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS to make udhcpc go into 
background and retry indefinitely.

Also, note that you can copy the Debian ifupdown scripts into your image 
and then use the Debian's wpa-* options in /etc/network/interface. You 
will have to tweak them a bit because buildroot install wpasupplicant in 
/usr/sbin instead of /sbin.
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
