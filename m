Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9307C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 06:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BAF9845F8;
	Sun,  5 Jun 2022 06:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n38sTLSh14UY; Sun,  5 Jun 2022 06:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 196A7845F5;
	Sun,  5 Jun 2022 06:58:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2561BF410
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 06:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 786EF40491
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 06:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8eWBS6QyFV3 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 06:57:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E8AF4013C
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 06:57:59 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id n4so2192492vsm.6
 for <buildroot@buildroot.org>; Sat, 04 Jun 2022 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=pw8MrxOpvDIfboVtmf7odghTZ3QoU84+NXGuLIx1hww=;
 b=pSqNUuO5AtEqPi0211p8rt3ycyqnsMzPydVNyKLiZme7bZ8YnqpckigRSQrQXtqrmQ
 sn09aMWTPNRxxlMY9Hd1eV8eBfhkr77nfR9TW/uqlYHTFXwo3RnkSH6ZnXRSYY9o5/2p
 M1z9TmjSHN/lVIsk3KnUNZ//ZuNEBWzVz+cgz0SSaDvXXDfnf8DTKDrOMbtNYS/aqy9k
 IHLAZNPrJaJAoqZT01mbkncHAZ4skFed1NZUc7rvCyOHrVsnuOngejHYfs7PseUayg/E
 T86IQsxo/B/tMZp20TwQuaYe0TzcPrYUL9BXZn/kZ/apjOJFvQICyFlmqnp7TTDR79Bc
 uLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pw8MrxOpvDIfboVtmf7odghTZ3QoU84+NXGuLIx1hww=;
 b=PrC721LY1xXVBvaQtx4j/ZTFgyiouXRh6/2rF6Ph6t1CNNw1Ertqo5ceHiLs5uL1lk
 vrKxNNQcVBJhHT0zMtqt8WHjYckQP7zPXFkBRTskfqbgceGnVNY2IwAtaGRENLCJSO8P
 nuAd7N08OfG7nk3w3sazhereMZw3YXHD4a4SC8e6VcY9UIFyI8Z3hYlWqCZ/02B/kjjz
 RCUQtdn6H9WfOU0Y3BwlyqY3AyAQs4QS8qtQVE/qI4ujfKuNCkFm2k14UVHXhUHTlikx
 tVz2pt9LfEBSVZC9QIQSiX+WyI4+nkC/Yp+rKudMxK5KG5l+RomEWa91Ln3sAeIHyIt5
 XBrg==
X-Gm-Message-State: AOAM53353NVYf6FClyjEAL1IagWBfR5BeYFDt1dqJhcL2xoQ4pG7/Uxl
 Sq8s76qOrGSXRbBOgcAmPzwdqVtVWFydsW+BVgtZS1f506cR9g==
X-Google-Smtp-Source: ABdhPJxiLVdlvGO+g77CHaWvIg4zDydHNSpbfRsPl7YJTpErj9pJLwa4LgYQ1BDw2CpZdL1lW6B7pnq7XDzzdNUlJfg=
X-Received: by 2002:a05:6102:f11:b0:337:d6b6:ebe6 with SMTP id
 v17-20020a0561020f1100b00337d6b6ebe6mr24640937vss.40.1654412277943; Sat, 04
 Jun 2022 23:57:57 -0700 (PDT)
MIME-Version: 1.0
From: snathick <snathicktechno@gmail.com>
Date: Sat, 4 Jun 2022 23:57:47 -0700
Message-ID: <CAN5CKbfz_js21AQZP-XwhTXz6cqYywO5f9VaxYG91aMspQSuCQ@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Systemd issue
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
Content-Type: multipart/mixed; boundary="===============6035723906719426465=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6035723906719426465==
Content-Type: multipart/alternative; boundary="00000000000023923405e0ade075"

--00000000000023923405e0ade075
Content-Type: text/plain; charset="UTF-8"

Hi,

Unable to build the initramfs with systemd enabled.
using the external toolchain to build the initramfs.

Enabled init as systemd in menuconfig *BR2_INIT_SYSTEMD*
Enabled python package in menuconfig *BR2_PACKAGE_PYTHON3*

while building failing with below section
*python3 3.10.2 Patching libtool*

Following is the log:
















*configure: WARNING: --with(out)-system-ffi is ignored on this
platformchecking for --with-libmpdec... nonechecking for
--with-decimal-contextvar... yeschecking for
--enable-loadable-sqlite-extensions... nochecking for
--with-tcltk-includes... defaultchecking for --with-tcltk-libs...
defaultchecking for --with-dbmliborder... checking for _POSIX_THREADS in
unistd.h... yeschecking for pthread_create in -lpthread... checking for
pthread_detach... nochecking for pthread_create in -lpthreads... nochecking
for pthread_create in -lc_r... nochecking for __pthread_create_system in
-lpthread... nochecking for pthread_create in -lcma... noconfigure: error:
could not find pthreads on your systempackage/pkg-generic.mk:272
<http://pkg-generic.mk:272>: recipe for target
'/home/snathick/buildroot/output/build/python3-3.10.2/.stamp_configured'
failedmake[1]: ***
[/home/snathick/buildroot/output/build/python3-3.10.2/.stamp_configured]
Error 1Makefile:84: recipe for target '_all' failed*
*configure: error: could not find pthreads on your system*

observation:
After building with busybox init and then removing busybox init and
enabling the systemd it is building fine.
integrated initramfs to kernel, image booted success but stuck with below
issue




*# systemctl System has not been booted with systemd as init system (PID
1). Can't operate.Failed to connect to bus: Host is down*

Any suggestions/ comments to resolve this issue.

-- 
Thanks & Regards,
Snathick

--00000000000023923405e0ade075
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Unable to build the init=
ramfs with systemd enabled.</div><div>using the external toolchain to build=
 the initramfs.<br></div><div><br></div><div>Enabled init as systemd in men=
uconfig <b>BR2_INIT_SYSTEMD</b></div><div>Enabled python package in menucon=
fig <b>BR2_PACKAGE_PYTHON3</b></div><div>=C2=A0<br></div><div>while buildin=
g failing with below section <br></div><div><b>python3 3.10.2 Patching libt=
ool</b></div><div><br></div><div>Following is the log:<br></div><div><b>con=
figure: WARNING: --with(out)-system-ffi is ignored on this platform<br>chec=
king for --with-libmpdec... none<br>checking for --with-decimal-contextvar.=
.. yes<br>checking for --enable-loadable-sqlite-extensions... no<br>checkin=
g for --with-tcltk-includes... default<br>checking for --with-tcltk-libs...=
 default<br>checking for --with-dbmliborder... <br>checking for _POSIX_THRE=
ADS in unistd.h... yes<br>checking for pthread_create in -lpthread... check=
ing for pthread_detach... no<br>checking for pthread_create in -lpthreads..=
. no<br>checking for pthread_create in -lc_r... no<br>checking for __pthrea=
d_create_system in -lpthread... no<br>checking for pthread_create in -lcma.=
.. no<br>configure: error: could not find pthreads on your system<br>packag=
e/<a href=3D"http://pkg-generic.mk:272">pkg-generic.mk:272</a>: recipe for =
target &#39;/home/snathick/buildroot/output/build/python3-3.10.2/.stamp_con=
figured&#39; failed<br>make[1]: *** [/home/snathick/buildroot/output/build/=
python3-3.10.2/.stamp_configured] Error 1<br>Makefile:84: recipe for target=
 &#39;_all&#39; failed</b></div><div></div><div></div><div><b>configure: er=
ror: could not find pthreads on your system</b><br></div><div><br></div><di=
v>observation:</div><div>After building with busybox init and then removing=
 busybox init and enabling the systemd it is building fine.</div><div>integ=
rated initramfs to kernel, image booted success but stuck with below issue<=
/div><div><br></div><div><b># systemctl <br>System has not been booted with=
 systemd as init system (PID 1). Can&#39;t operate.<br>Failed to connect to=
 bus: Host is down<br></b></div><div><br></div><div>Any suggestions/ commen=
ts to resolve this issue.</div><div><br>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Tha=
nks &amp; Regards,</div><div>Snathick<br></div></div></div></div></div>

--00000000000023923405e0ade075--

--===============6035723906719426465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6035723906719426465==--
