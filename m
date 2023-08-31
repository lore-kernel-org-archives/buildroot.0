Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B71C83F2E
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 16:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95D88418CC;
	Thu, 31 Aug 2023 16:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D88418CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NCbOo0zyt1i; Thu, 31 Aug 2023 16:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D45EE40153;
	Thu, 31 Aug 2023 16:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D45EE40153
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0AE1BF3BA
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 16:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 588A060D68
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 16:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 588A060D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAoL0PEWEOJg for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 16:48:17 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37FDE60B26
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 16:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37FDE60B26
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so2040317e87.0
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 09:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693500495; x=1694105295;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iOMB+sKLsZXeFvS5tH66CPlqP6VQifPfhCybLlOlKkc=;
 b=EK3ziPMqKUkjOfMfWPZM+aLAmjJPFl4KJMubXcEmMvZI7nEH3w5FYpKOdpxtJQjNMJ
 AdxP5KcoqLb+2bMiWSw604lDp1T37zdKI3lx5r0Y9AB006OL4qASeg2q1JJ3pZtlKBZM
 eNDqgOXDEbV/s0H1G5ZY/L6XcxXp2XprcG0Z2VpDUGpGkYCniUw0zIkKaER0y1CkExcI
 ff5OoqqxqIlhTmMaQGX2CJTmPgrmvSdwjpci05WYVsTAUyftrPs4GNUIobdh+zcOkKsU
 1khLhWLY4yDXneWNp13Ao102VcUZpxAjFsCZ8vG7uw1pBhU6J4vn6oBuz/lJtv+BVymq
 /A2w==
X-Gm-Message-State: AOJu0YwiivZz21SkOtPBKQFPrib+AjJzong6Bc9PK0dFNvA6Urtrzswt
 SnOhef0y03hK7+kkmcOZ6CjlT4H0BShC9EUyZZokatWhUFKYjg==
X-Google-Smtp-Source: AGHT+IF3N1wzLWStxBSkw+72vyRfMgdrDRuGtLz7DP804efKftOd0WmamWr/idOpAHaMdDqFR9OJpQ1sO7U00d51UE0=
X-Received: by 2002:a05:6512:234c:b0:500:d960:8ae5 with SMTP id
 p12-20020a056512234c00b00500d9608ae5mr200124lfu.25.1693500494633; Thu, 31 Aug
 2023 09:48:14 -0700 (PDT)
MIME-Version: 1.0
From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Thu, 31 Aug 2023 18:48:03 +0200
Message-ID: <CAPmASevbUcWtFd-6ke-fXkXor6iPRmjnk+UvB3_fVQk+Jwf33Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693500495; x=1694105295; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iOMB+sKLsZXeFvS5tH66CPlqP6VQifPfhCybLlOlKkc=;
 b=bay4yVD6+NK5+9Kcfa1+wjEozNql4pxmc1FNQyx5Z99Wy2r4WHlzXZDq0jR6uRz1bU
 udH+Zcld3IyguMe1yKYALOpExGCp/3I0/YDDaGq32U6YwYGTUqk1sJ3Q4vmzEasRPFXA
 eUJzR0SRj+tT1bg2N32m0d1cITQ/1Iy+9z4gPnsvTsn5KqqSHwWvDOCzS2zLHRvGYHXf
 5xMaRIwuzcCxdq8BHgD2wqZ9vxLU65AuGNx4mbla+BpiZL4BvwJgYG/xZ2ECTfqkbp1U
 iS4Aoj+MsQD9kceoWuy2EuqRDo9iykZyPP3NrXjc0xu/dsWVqesabi/qV4YQ7fkyxCjn
 3IRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bay4yVD6
Subject: [Buildroot] Network Manager says the interfaces are unavailable
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
Content-Type: multipart/mixed; boundary="===============7456900825303264107=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7456900825303264107==
Content-Type: multipart/alternative; boundary="00000000000068dfe006043acff8"

--00000000000068dfe006043acff8
Content-Type: text/plain; charset="UTF-8"

I customized the default Raspberry Pi 3 64-bit config, and I enabled
BR2_PACKAGE_NETWORK_MANAGER
and also BR2_PACKAGE_WPA_SUPPLICANT in order to connect to WPA networks.


I didn't enable BR2_PACKAGE_DHCPCD because I read it would prevent Network
Manager to work. Running the image, Network Manager find the interfaces
(eth0 and wlan0) but cannot use them:

# nmcli dev status
> DEVICE  TYPE       STATE                    CONNECTION
> lo      loopback   connected (externally)   lo
> eth0    ethernet   unavailable              --
> wlan0   wifi       unavailable              --
>

I'm aware it's the expected behavior if the interface is present in
/etc/network/interfaces and I'm ok with eth0, but wlan0 should be available:

auto lo
> iface lo inet loopback
>
> auto eth0
> iface eth0 inet dhcp
>   pre-up /etc/network/nfs_check
>   wait-delay 15
>   hostname $(hostname)
>


The driver seems ok:

# lsmod | grep brcmfmac
> brcmfmac         270336  0
> brcmutil          24576  1 brcmfmac
> cfg80211         872448  1 brcmfmac
>

and iwconfig confirms the wlan0 is running:

# iwconfig
> lo      no wireless extension
>
> eth0    no wireless extension
>
> wlan0   IEEE 802.11  ESSID:off/any
>         Mode:Managed Access Point: Not-Associated  Tx-Power=31 bDm
>         Retry short limit:7  RTS thr:off  Fragment thr:off
>         Encryption key:off
>         Power Management:on
>

I also tried ip link set wlan0 up but it does nothing, since the interface
is already up.
What else should I do in order to let Network Manager to use my wlan0?

I'm not sure what other info I may add to my question.

--00000000000068dfe006043acff8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I customized the default Raspberry Pi 3 64-bit config, and=
 I enabled <span style=3D"white-space:pre-wrap">BR2_PACKAGE_NETWORK_MANAGER=
 and also BR2_PACKAGE_WPA_SUPPLICANT in order to connect to WPA networks.</=
span><p style=3D"margin:0px;text-indent:0px;white-space:pre-wrap"><br></p><=
p style=3D"margin:0px;text-indent:0px;white-space:pre-wrap">I didn&#39;t en=
able BR2_PACKAGE_DHCPCD because I read it would prevent Network Manager to =
work. Running the image, Network Manager find the interfaces (eth0 and wlan=
0) but cannot use them:</p><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div># nmcli dev status<br>DEVICE =C2=A0TYPE =C2=A0 =C2=A0=
 =C2=A0 STATE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CONNECTION <br>lo =C2=A0 =C2=A0 =C2=A0loopback =C2=A0 connected (=
externally) =C2=A0 lo<br>eth0 =C2=A0 =C2=A0ethernet =C2=A0 unavailable =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>wlan0 =C2=A0 wifi =C2=A0=
 =C2=A0 =C2=A0 unavailable =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
--</div></blockquote><div><br></div><div>I&#39;m aware it&#39;s the expecte=
d behavior if the interface is present in /etc/network/interfaces and I&#39=
;m ok with eth0, but wlan0 should be available:</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div>auto lo<br>iface lo inet lo=
opback<br><br>auto eth0<br>iface eth0 inet dhcp<br>=C2=A0 pre-up /etc/netwo=
rk/nfs_check<br>=C2=A0 wait-delay 15<br>=C2=A0 hostname $(hostname)</div></=
blockquote><div><br></div><div><br></div><div>The driver seems ok:</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div># lsmod =
| grep brcmfmac<br>brcmfmac =C2=A0 =C2=A0 =C2=A0 =C2=A0 270336 =C2=A00<br>b=
rcmutil =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A024576 =C2=A01 brcmfmac<br>cfg8021=
1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 872448 =C2=A01 brcmfmac</div></blockquote><di=
v><br></div><div>and iwconfig confirms the wlan0 is running:</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div># iwconfig<br>=
lo =C2=A0 =C2=A0 =C2=A0no wireless extension<br><br>eth0 =C2=A0 =C2=A0no wi=
reless extension<br><br>wlan0 =C2=A0 IEEE 802.11 =C2=A0ESSID:off/any<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Mode:Managed Access Point: Not-Associated =C2=A0Tx=
-Power=3D31 bDm<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Retry short limit:7 =C2=A0RT=
S thr:off =C2=A0Fragment thr:off<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Encryption =
key:off<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Power Management:on</div></blockquot=
e><div><br></div><div>I also tried ip link set wlan0 up but it does nothing=
, since the interface is already up.</div><div></div><div>What else should =
I do in order to let Network Manager to use my wlan0?</div><div><br></div><=
div>I&#39;m not sure what other info I may add to my question.<br></div><p =
style=3D"margin:0px;text-indent:0px;white-space:pre-wrap"></p></div>

--00000000000068dfe006043acff8--

--===============7456900825303264107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7456900825303264107==--
