Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F92C3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 06:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4747760B9B;
	Tue, 17 Jan 2023 06:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4747760B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThRS_GU1RbZk; Tue, 17 Jan 2023 06:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8323961040;
	Tue, 17 Jan 2023 06:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8323961040
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD8651BF35D
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 06:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ADBC40502
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 06:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ADBC40502
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ik-OeyLYA8V for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 06:40:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7D9340022
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7D9340022
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 06:40:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 15C0110000E
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 06:40:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 06:40:33 -0000
Message-Id: <20230117064038.6ADBC40502@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1673937634; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BgiXfE/wWAAYmRpvrgv87WjP2M8IuGfNm3n4zrXDxJ4=;
 b=YnHFaQrLF3UxmU+c95E6iuxncFDeRzWbaYqlM/0/oakK+/yYLLylHA0+Y2ADbufPRLEpxT
 MFfJjNa5xYBVgkOf6A5HWM0IwW5qi24TbKyHL1ae20w/abt+j9u4h9L+a8oxO/Wx4fZ148
 FZDC/KJlIWIFIkrkPf1EUxuCtPJgOtuiNlTkgjqtQrrWGeEQooRP+tVww9EXZssIMBvKxp
 UiKr0JKd6xN+Eu8+6FmwLyWQYrrxCGY85NgqyreLmFeEQWv1SHoTxRrtwoA10WzPCYSRuF
 Gp8H5Ex17P4JayYlvApvyR6Tu8UPRn9lE0M0ZDIKsnPaOHE9H8yeWhkoyjyNJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YnHFaQrL
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-16
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2023-01-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  0  |  1  |  0  |  1  |
  2022.11.x  |  2  |  5  |  0  |  7  |
    master   | 111 | 206 |  0  | 317 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 18
                   bash-5.2.15 | 17
                    fwup-1.9.1 | 16
            host-binutils-2.38 | 9 
                     xz-5.2.10 | 9 
                    bat-0.19.0 | 6 
  gobject-introspection-1.72.0 | 6 
             dahdi-linux-3.2.0 | 5 
                host-go-1.19.5 | 5 
         host-sentry-cli-2.8.0 | 5 
                  jack2-1.9.21 | 5 
                   linux-6.1.5 | 5 
                    pixz-1.0.7 | 5 
                elfutils-0.186 | 3 
                    norm-1.5.8 | 3 
                    opkg-0.4.5 | 3 
    python-cryptography-39.0.0 | 3 
                  sscep-0.10.0 | 3 
                       unknown | 3 
  binutils-arc-2020.09-release | 2 
                bpftool-v7.1.0 | 2 
                  check-0.15.2 | 2 
                    dust-0.8.1 | 2 
                   ethtool-6.1 | 2 
                   gvfs-1.48.1 | 2 
            host-binutils-2.37 | 2 
               libcap-ng-0.8.3 | 2 
      linux-5.10.145-cip17-rt7 | 2 
                 nerdctl-1.0.0 | 2 
                  netsurf-3.10 | 2 
           python-bcrypt-4.0.1 | 2 
           python-pyicu-2.10.2 | 2 
              traceroute-2.1.0 | 2 
                xenomai-3.0.10 | 2 
                  acpid-2.0.34 | 1 
                  assimp-5.2.5 | 1 
              asterisk-16.29.1 | 1 
             bluez5_utils-5.65 | 1 
           crucible-2022.05.25 | 1 
               ding-libs-0.6.2 | 1 
                     efivar-38 | 1 
             f2fs-tools-1.15.0 | 1 
                  ffmpeg-4.4.3 | 1 
       freeradius-client-1.1.7 | 1 
                 freerdp-2.9.0 | 1 
                     frr-8.3.1 | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gerbera-1.10.0 | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
       host-gcc-initial-11.3.0 | 1 
             libgpg-error-1.46 | 1 
                   libnss-3.87 | 1 
              libostree-2022.7 | 1 
          linux-5.10.145-cip17 | 1 
         linux-headers-5.15.87 | 1 
        lttng-babeltrace-1.5.7 | 1 
                     lxc-5.0.1 | 1 
          modem-manager-1.20.4 | 1 
              mosquitto-2.0.15 | 1 
                    mpv-0.33.1 | 1 
         mxs-bootlets-10.12.01 | 1 
                    ne10-1.2.1 | 1 
            ocf-linux-20171122 | 1 
           optee-client-3.19.0 | 1 
                   pcre2-10.42 | 1 
                 proftpd-1.3.8 | 1 
         python-greenlet-2.0.1 | 1 
           python-numpy-1.23.5 | 1 
rtl8821cu-86cc5ceb7c28b9b99... | 1 
                 rtl_433-22.11 | 1 
                    sdl-1.2.15 | 1 
                 uclibc-1.0.42 | 1 
                  xerces-3.2.4 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/a063b04f9e0c3cb8137f7e74a8991a1e0796e42f | ORPH
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/6ce20d24dd83f9a05aa53e4f44c8c133901ce2e4 | ORPH
   arceb     |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/03e9ca374a3213ca2b88de9aed09a60076b89e73 |     
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8a16f0f7249bdb6a0e660a2389defb82b9485684 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1eb6162e2e2abee1f1abbb99748e40a661b140e6 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7dbb105f5a018e115fc5c11346bc4dcc7b2e944e | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/36be0e01673aa6bf14764377165bf601391e2cee | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4579cc56a81863b43f7d67b429b4e0da043efc8a | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4f32007367af4e0d0170107eeb980bc11c65c429 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/09c9a8c96e29b95119060f4e9f155345cb1c3660 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9c73812da45726d45e43e5c24b47a60bad4dec8c | ORPH
    i586     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/88679b754e335dfdea41b30666aa911c4c363646 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ae8aa4071ebf4db3d1f2881832b45b2c5b0b49d2 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/aecb593c8d983c3788061b12d230099b0e82a790 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/130eeebb00862b0da27fb769138a634af929a361 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/fb68c75da6f69d639c91352e7a95f18095f5b26c | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6fe2af0f6879cc6573acc9aa79893053c0f802ea | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/088c91199081c8c193c6e82e7cae8f70989c38cb | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7eb6aa1806272bd3fe0bf4b710484367fce9e34c | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bfc47ed697eb7a602e5b0e908eb1dd67f6ba2988 | ORPH
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/089212863506753df7f02c8b4e7099d2d2901c9f |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/badf462ebce2948785cc6e7d89a63bd39aa803bd |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/44bea10d1f033230c80c00850a2781a44c427f54 |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4daac0c80eb72b3cc3af41de7bd9667854c47e16 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6f4317ae0a923b7f699ebb5bb7518ffbe52665fc |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ebd7f24adc1488a5b7c27f5128503ec2c79d0f9a |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/52faefc92bb28ca685f203d8fab11486e87ec086 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/804ac3549df84ea46c9323f1a9bea534d75489d9 |     
   sh4aeb    |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/18b0b64ea3e8f1be10fd9ec1d386a33eee1a2991 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/3e0e99f0cba154427463d44973fea2a089fd425b |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/fd46316261e5f557808871dba1fbd85ef5543e03 |     
    i586     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/88d77b640d60dee0255f23a7e8782743396d6d56 | ORPH
   armeb     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/61f360256879f9cef0860a3118a19b039009bb05 | ORPH
   mips64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/6593020e9fa53ba3dc45ae4098034d99c2d41e3f |     
   sparc     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/50bf0288ddf66f3ea20483af4bb981ad942791ac |     
    arm      |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/5e0e1710ae2f81be1b505e8354a25a446e6ec332 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/e5c38bc75e81cb9004c99ff92dd1386c19cc418c |     
 microblaze  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/76beeabc5c5953298034b9d5b9696b4e191e7b71 |     
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/413b97e4b754ac1977e0987fb9e163f2a2d5a71b |     
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/31a5344e7108a19460f79bb2eae77553c15fa5cd |     
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/613761dc00701b324683ef229946c417cc8b279e | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/3ac8995dc2d91754fa7e5f7898d4b02e5f187540 | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/bde2c36d76880ac0d270fe956c2c57876993cc3b |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5798f3c5a317f76acddb9f17afe67ec6ffb5b20c | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c4a9f9db51e024fcc6dda75af6938692d1ece91a | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2f546feac16242b4ed8389e4fc382d7001700ed8 | ORPH
    sh4      |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/de75340ab765b3476d27a7f5f86c0c2c6d4efcd6 |     
   mips64    |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/bc85ca127663d6e92f16de47d25ddaa2d795d302 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/d0b57ba7937ce2440ce37c9a45da4882bfae5552 |     
   arceb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/13af89568049fdc9f0e38113070462dafe0aa438 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/5ab0a6394405ee725d48c857b942318713c1e21c |     
    arm      |         freerdp-2.9.0          | NOK | http://autobuild.buildroot.net/results/f96d1e1b87901e59ce3f62a384f30e8659f2f2b5 |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/019627ca2a356136e78817dbb7045edfba61c266 |     
   arceb     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/c26c9f863dfeb9757d39f243510213431d99c02c |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/705fa607e274ffe33b7dd37007355240e30d7685 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1db2dfc0a35988e4c2b22ed21005f965ae0ec70c |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0b34f35a6f623f2dc9d49950bf5d98b6d7cd321c |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9edb51802aa1e0c34002fedae43506e35ac5c346 |     
   arceb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/ba6c735a41370f1e3da7949711f6e83584cdf88c |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8d204b5d9c9e8f47516c49ce18f292f0d838f850 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/63bcc6e24f9c9bd8b88b92481f396ab35fb11a60 |     
  riscv32    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a5de3b714375c92a1c6949427d76a7948ddcb4ca |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/917e28b3e10c6eb76788c38dc8d3f0953ca565a3 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0da95753f090c23c8ff613314322f651318e53f7 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/83d84d6c9a99bb8e4d11f896be4f20293002b410 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3b636d710ecc238b58d07b6a566b930bae3b6695 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e53f0806b4b9e2d84e2c5a66f26f2e172b0809a5 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/de9c9fd2fd8e9d8aa4e45097015cdf22b5d67992 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0ea66d57283d5e7f55147a574178edf87ee9ba36 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/300adc6ac46e29478f0910a67221c6a3956ff6b3 |     
   xtensa    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5d62e285530a2ebad5a5dab0430401c829e9ecb1 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0e587a0f181136144c2ab56b35979949104a1091 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/def7ed73015726e4a9019a851b3dc4e730dcf4d3 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8f296b033e7e33aa4fac96814b1d65cd3c063a1d |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f855953c5332971bf078a27b658fac47e390d61c |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/fa92e190979895ad58dc18c965f9313cc0c521f9 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/e029a11a3c0ca210291b875eed141055ef80c1cf | ORPH
   armeb     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1387cbd2f226441a6c29392e7b208a648bcff35d | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4f55b9fd40853093f85003ddfc1dd18c26bf414d | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/91b28d9ff0b19f9e82763a57a45bf5a7295ca2fd | ORPH
   armeb     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7113a5ceff548b8200a51aeceb7ea99a03a0484f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5e3b5b31e959b5e144857a496a571b826cb4b249 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e90fa771e80961ba98c1534d46b43951fbc71190 | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/379df4cdf0779d854160769eb2a6762e27ef6ad7 | ORPH
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/a1f03eaf19485a90abe1115eae58fe47c221a4d1 | ORPH
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/cc168d7e2a8817144e499de67874e3cf4cef363b |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0ffe232540efb950d4dca376d82bcab3824dc735 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/437825f203a5d02335072a1cc28f70ab79ceb02a |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/07c8548dd429f0006087601a923bad8249d135fc |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2b813086c6e16e186b439f0f3c2c43b23d006a49 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b4109c036523f4c6c971876a66b5e9ef5a166bc7 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/dd80444c80ed0e5c162ceb8aac69060ba9277642 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3e4be4b2c59692e7b3ace505aca0811adbc48036 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/043ba478762ede4e85134c3a10ef39b41eba4736 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5813342822b187841c35671486692817f6739939 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9da419e4062e80370e56c497bd8768f7a742082c |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5b87c1f78995f8db04682fbec69e61b987061a2f |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/efabc27c63c5f9d6fa0d2b83bdea8a7902432e08 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9551072882b1488fb1dc5206478e3b31ee9c69c2 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d2993e2f2cee136eca55052c2b23a2662dc0a23a |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/afe78d497dbb8a8c2d46a5895639649bce34ce3c |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9cf868db4f94224652339f47fe058bcab61206ab |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/12d94f86f2cff42837a9ec09f37bd8dba92d4005 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/07eabd23bf5e847fc4218461e959791a23cbb44d |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dac75ce1acc818be4fe2e17e9268fe8901210706 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b588e1bb407c1760712922a23ec49984e6e1b68d |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6e3f136e463660cf43ed8d95b882dafb65dbdccf |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5c7a1cfcf1fd2011ce73007745775d515a9feb62 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4d2d7cfcf1b5423e04da462978b250e4ff2c75f4 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/34101179f5763678fe63aa5af4437be05b1c9719 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d766ada74e0bda978560d324aae6c42d4045d70d |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f6ef5383c6faa054b0a262ef4f513b1f4d05a298 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/82c4aabb919fd2227587a39f55365b459b6d8396 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0a89bd24f5ecfe8ec3b5eefd7c5c25565e7929e3 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4613d0d81f0901b884f8ad6202368942a718f0d5 |     
  riscv32    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/f0573ea97dd7a84ce30da42724d024b9ccabc682 |     
 aarch64_be  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/041be10e4ef6c9bf36fc6f0bf1b72db0d5d78c5b |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/cb77ede06101cdb3091f6eab65b1e30d850f0f7f |     
    i486     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/4bdf6a9eacdb832775a127a4a58d27d73882822b |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/6e5b811a4222dcb151727286b4887df7d9357cb6 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/2f7d2030eac1ac2088be5b101f62a48e9a84372c |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/79a94b24e76e104c67008345bc916c8079799f44 |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d886599be2097f2e3962908ae4b9fd768cad458d |     
   sparc     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/df5215942fafce0ab7e8b0f04ac4f2100b11bcb2 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/3ef9bcf19a581d70d1f694f26e5395dd832ced46 |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/17fda7e9c560ab602675cd07df95b2f89ff766b0 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/77a2385f2897117e47eef549ae6f1938f1c12f8a |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a16cdddf464c9adc2ebbcb9e4ddd56748e8b643d |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ba9894d3f697aac3d2e62afedf416bfa3e523f3e |     
    arc      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/8a2530cd75f8ea618e7ef4ec2ef12c00557ff8f0 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/aa7fec960ee09637105b8d53d0528973bb41533c |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/73f99942a970d60e11fe8ce97c47f8a75a6fdba5 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6492aa41b4cc8f21fae6e4e841c4907af959121c |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/4471f9704642c0c64c5b789eb1a1f0c5e77c4dac |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/cb27f3140065ece4469f5e63480f718e34f31f2c | ORPH
 microblaze  |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/43180531606300101cb6a4ecfba17eaba193664b |     
  aarch64    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/d6e73549436503f987cb9516c9120d92938e52fc |     
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/5b489c12883104bd9e21d0e6733a4a23aa72d439 | ORPH
   mips64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/16d3757d7a7b3168ae7f368b62a9e4fe8737fdbf | ORPH
   arceb     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/5b88e1c232fd8db61b8b07650caaff9bee7c08c4 | ORPH
  riscv64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/46c2b6e22df102eda604cbcd3612f4d206de41e8 | ORPH
   xtensa    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/2beb1e50fd7464e01db8738a18c9bd603c0d29f3 | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/9680b914a954522980805761840201699a5e4200 | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/fd26e64c9dae478cc49a56d46f669863fedcf6a7 | ORPH
   sh4aeb    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/770851ad4add818cf00ccbd1dbd11cd682c3614f | ORPH
  sparc64    |     linux-headers-5.15.87      | NOK | http://autobuild.buildroot.net/results/9441e57778b46fa1158238964a7067230f660da0 | ORPH
   mipsel    |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/bafe2435089073655eca29f2050f0a56e9c3c456 |     
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/974b691b40efc8ee50f55db4ccbcff2d08c03e1d |     
   mipsel    |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/8867462197c6575a6572179a54c97ac9e31a8a0c |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/1e72675de0c47ab55a13bb45a7416b961fdcb407 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ae37e2123b856c64495a69329dd6d83df1821bf5 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/f0fd0e85d5dfbb21dc20383941427cb30149b00c | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/d3651d594a78b1c31c24d3def9e3c2f5f5473d6b |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/d5d6b16a4721aa764dfe831125d1310aee8641bb |     
   x86_64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/b6bbed626b1510d36c588f2caaddbf2de83bfbe3 |     
   sh4aeb    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/430f48f6936e539795349b4c4eb42374372bc98f |     
    arm      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/50e51522aa5f6adaf33b475ea5dcea823f640e58 |     
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0f070d8ebb7d9c5b921687d903de3736fb99f2b0 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/961413fdbb2ddeb40371471135e139ea2c3f0d17 | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/a9f9c0762e4dba3d0525ce8cc7366356a9ab8372 | ORPH
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/10408be2131783cb22bcf478d9e0444c53b91d43 | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7c91166b5891c5ed11ae28ac031c3f8fbc8e0baa | ORPH
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/1d8c20b1508d205184632f8b79362e2f685118bb | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e2318bd3dff3873f06d07f75b35dc2799414a150 | ORPH
  powerpc    |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/61191e158c2baadf7d4d0289ad390da9a17b35b2 |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/d99f475156847ede5ef0c24471ef7fca7f7c0931 | ORPH
 powerpc64   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/98a2bc900c8996d6b1cae2306ebcf1495e6aa4db |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/8ff752f71617c703b2791eb933bd520b523ab078 |     
    i586     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/845976ebe7a483c87142f57d381559e1d0eec8cb |     
   x86_64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/2f4e7c8a70cae2ffd741b61e5ea9eaad7df1d4cb |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/9f441e29b989a6c53222f5d4a62fd5793edfbbae |     
   x86_64    |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/a16ccd7cc78eb63de06a6d738fccc6b947da13e7 |     
   s390x     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/0f203960859cbde969c459287377ac0871fb9d6f |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/838edd754718462c21d9675c07e5afb057266934 |     
   x86_64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/cda04659fcc01991f0663a5b2d4181bd314fa7ce |     
   mipsel    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/054ac17c7121cfd7a0779dcbdf71ca787f30f7b9 |     
   armeb     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/9c8143956254b07af7ace0e1ae09ccccbb3c4540 |     
   mipsel    |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/56523ad39c4af5c9260c869e7d0821cf7ec1c108 |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/37398d2b7566d46e1e96f512fff5357e23d786f4 |     
 microblaze  |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/766ddbc3748f9745abc34ca9c1940d1de4ddefed |     
 microblaze  |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/009b012d1b61899470a1b1e5e4d2dad68df631dc |     
   nios2     | rtl8821cu-86cc5ceb7c28b9b99... | NOK | http://autobuild.buildroot.net/results/a02cf53e9fecf53d90ba250103dd25db80fa226b |     
    arc      |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/0e929a1dd27e2d1e39b064ec0c7962b3be567c08 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/4d1fa3c4b54425fcc2d14863d786f96491413110 | ORPH
  mips64el   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/968477e0d16c8ca3dca65af56814407f0a96e350 |     
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/033bc66138f3165397b2ab1a66dc44b8df037f60 |     
   arceb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/2f00d726c38fcf183c030f7eaa865bdc67e52cdd |     
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/62c1803239e12b0dbcd3b50cb97d191415182d47 |     
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/9e5ad7ff8ea723a7d37b0b1a757e51846b2dca06 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/e8da1141231f46337d406aed1a8f96c1a577b1e4 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e0d2b18145712cba86cb40745a5a892f56cc9105 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f7d84c8deb777747d6fe4783fdba8cc28e9bde69 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d8d82ce1ed2d5761452bcce7cbd0032b103ece77 |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7ee98378d370d39b145fffceb9289775b0b68c89 |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4cc12d89905926d34bb9774dae2a08a201c713f6 |     
   sparc     |          xerces-3.2.4          | NOK | http://autobuild.buildroot.net/results/11cae98556f9ce4a4b9fd50a54363853676f5613 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/17b0b2bf0c0ada17fa7cff98d81e86cad5310a71 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/877704fc410446bab8c44bafb1fd6d9ecdce4d8b | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9bfec5e3242e2016c54d218b0f23c3f079038519 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/dd7393f9be24f759e3ad1f97e9d82b4537d5a69d | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e249722ff90345703597b3184f07f063701f746c | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/11ae94087e9bc2bcb212cf93ae083915d3fee4da | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/576a86b1572f7a61d157490656dba6fe27008c42 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c2a99c45fad114831d841fdc216671a4b774c9a6 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0c247501c8b62dec32119184e0719de676857d8f | ORPH
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/36638d652653ee444820be627618ff45bfc9b3f9 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

               gocryptfs-2.2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/2c51731849fa4e47f1d076fa60d173631d4f5c28 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                gerbera-1.10.0 | 1 
              host-pahole-1.24 | 1 
             lirc-tools-0.10.2 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/26943a4487e19d365ad0528deaf6062d65140fdf |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f3fd0ff912d683c142f45d3263454ad439675514 |     
    mips     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c0b873f465de30d1da33969807ef6e7576e8e16b | ORPH
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/6064a3ce81d6b9397a258ed2542423e49dca4073 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cb9c2137a8e481520a9359e6a2edeeb384e234e1 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
