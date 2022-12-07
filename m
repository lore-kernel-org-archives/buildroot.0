Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0674DC352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 06:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76E4B4035D;
	Wed,  7 Dec 2022 06:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76E4B4035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YArTm2cl4oli; Wed,  7 Dec 2022 06:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF6D40A00;
	Wed,  7 Dec 2022 06:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF6D40A00
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7241BF841
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 06:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 168E581F89
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 06:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 168E581F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZMNvFu5QXfU for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 06:35:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D8C81F83
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81D8C81F83
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 06:35:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AF5301C000A
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 06:35:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 07 Dec 2022 06:35:17 -0000
Message-Id: <20221207063524.168E581F89@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670394917; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZPi9jDbWV9BtR0+NYUC/V6aH8Zb7eH2KCfIKa/k0q6c=;
 b=N82VGXpnB4hbtGwk6x12H47aXhgJpiPoqPHTOzEzabHugynralOaaqnj+r0dN/jZIBMJPY
 ebW77Y0AXGDXrbRzDwKBis9a1cOMF3mYnet6hWA1xtqMA5U4Ld5RzsPqGVq74WUGR+kXlB
 dlmAjFndRFUF1YxrtYceKHBkj5hEKFaGAGAloYF079VF3Mbd6O5dQMRPGcnEMo8wlZBr7r
 kPueyoPL7xQ9f6A5KlRzf/Z0YVyOa4Ecy0akN90F+4H1XTQi8llKmWhRtbnoT8nbnH7uQd
 T81IOQiq4d/I7IPJDYHh0bUlwuALn2xR2+FUINpq/DJkzoLU646PZAT871eUwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N82VGXpn
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-06
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

Autobuild statistics for 2022-12-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  2  |  0  |  8  |
  2022.08.x  | 24  | 22  |  0  | 46  |
    master   | 225 | 321 |  1  | 547 |

Classification of failures by reason for master
-----------------------------------------------

                   aubio-0.4.9 | 34
                  sscep-0.10.0 | 15
                   linux-6.0.9 | 13
                      xz-5.2.7 | 13
              host-rust-1.65.0 | 10
                    norm-1.5.8 | 10
                host-go-1.19.3 | 9 
            host-binutils-2.38 | 7 
                       unknown | 7 
glibc-2.36-66-ga1dc0be03c9d... | 6 
                  jack2-1.9.21 | 6 
                 wolfssl-5.5.3 | 6 
                gerbera-1.10.0 | 5 
              host-pahole-1.24 | 5 
                      crun-1.5 | 4 
                elfutils-0.186 | 4 
            host-binutils-2.37 | 4 
    host-python-greenlet-2.0.0 | 4 
                  ntp-4.2.8p15 | 4 
              open62541-v1.3.3 | 4 
    python-cryptography-38.0.3 | 4 
         python-greenlet-2.0.0 | 4 
           python-numpy-1.23.4 | 4 
toolchain-external-codescap... | 4 
            host-binutils-2.39 | 3 
               libcap-ng-0.8.3 | 3 
               libglib2-2.72.3 | 3 
             lirc-tools-0.10.2 | 3 
                    musl-1.2.3 | 3 
            ocf-linux-20171122 | 3 
           python-bcrypt-4.0.1 | 3 
               tcf-agent-1.7.0 | 3 
ulog-0389d243352255f6182326... | 3 
android-tools-4.2.2+git2013... | 2 
           crucible-2022.05.25 | 2 
                  exempi-2.6.1 | 2 
                  ffmpeg-4.4.3 | 2 
                   flann-1.9.2 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                     gmp-6.2.1 | 2 
  gobject-introspection-1.72.0 | 2 
google-breakpad-c85eb4a59b6... | 2 
              gr-osmosdr-0.2.3 | 2 
               libdeflate-1.12 | 2 
                libdnet-1.16.1 | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.45 | 2 
                   libnss-3.85 | 2 
               pcsc-lite-1.9.9 | 2 
                    php-8.1.12 | 2 
           python-pyicu-2.10.2 | 2 
              sigrok-cli-0.7.2 | 2 
                tealdeer-1.6.1 | 2 
               valgrind-3.19.0 | 2 
/home/buildroot/autobuild/i... | 1 
                alsa-lib-1.2.8 | 1 
              asterisk-16.28.0 | 1 
                 augeas-1.12.0 | 1 
                    bat-0.19.0 | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                   bullet-3.21 | 1 
               collectd-5.12.0 | 1 
              containerd-1.6.8 | 1 
                 dc3dd-7.2.641 | 1 
              dropbear-2022.83 | 1 
                     efivar-38 | 1 
              erlang-22.3.4.22 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    gdal-3.5.1 | 1 
 glslsandbox-player-2021.08.24 | 1 
             gnuradio-3.10.4.0 | 1 
         gobject-introspection | 1 
         host-gcc-final-11.3.0 | 1 
               host-runc-1.1.4 | 1 
                 host-wine-7.0 | 1 
              hyperfine-1.14.0 | 1 
                       kmod-30 | 1 
                  lcms2-2.13.1 | 1 
         libcpprestsdk-2.10.18 | 1 
                libkcapi-1.4.0 | 1 
                libzlib-1.2.13 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220930 | 1 
                     lxc-5.0.1 | 1 
                 mesa3d-22.2.2 | 1 
                mongodb-4.2.18 | 1 
         mxs-bootlets-10.12.01 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.1p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opus-1.3.1 | 1 
                   p7zip-17.04 | 1 
                   perl-5.34.1 | 1 
                proftpd-1.3.6e | 1 
            python-bunch-1.0.1 | 1 
                    qemu-7.1.0 | 1 
                 qt6base-6.4.0 | 1 
rtl8189es-e58bd86c9d9408c64... | 1 
                 sudo-1.9.11p2 | 1 
              tinymembench-0.4 | 1 
                   uhd-4.3.0.0 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
           v4l2loopback-0.12.7 | 1 
                    volk-2.5.2 | 1 
                wtfutil-0.41.0 | 1 
xr819-xradio-4f0cfd5e869ca1... | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5aa69cb300e9a33f933a1207a50288d7387b4d33 |     
   mips64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/4096005b10af4dd5ff4a50408d4d1ddcdc4be80b |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fb1cbef09cfa9a33ff0e1c4787e498f17034a98d |     
  aarch64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0c50bb09bb1c31aa5bbb357af4b54da31dfa532a |     
  aarch64    |        asterisk-16.28.0        | NOK | http://autobuild.buildroot.net/results/e2e20a18b0ed1c5d31eb6d57cb1814875b324731 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ca24d29efc5aea943029eee74ab2bf7eb5baca42 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c74984823ce24f67fa147ee89a29c872ca83a9b6 |     
   sh4eb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/cb0f2c578c562d58a9a506bda8779f5849b57acf |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f9a2d7f7b97aaa5a48ac7a3203a21e5211949aec |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a0f46cdf7a74cd72c3944069a678fdbfb8fcf850 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b657e71b69642b5614cf52c73cbe67c07102a155 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/246af258469b69cf158e7ce0d1c0cbdfe164494f |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3a96d91716190263026bf6d8a8f4b63901969a7f |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/00b1f1c6c00db6cc8c75457a4886d9bbd20d34e3 |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/483d17500313cd97a53e5cfce88e2998770d6148 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/88aeb46846a7d35df5f98726b5ca1e8fee9cf92d |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0c7fd90a711faf5f41c924fd057626e067da69e0 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/942d1fd3a86a513f5562d6c4266ee358088985d9 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5ba5241ffcaf5c18071cc12d9608c4c6d33a6012 |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fcd6604c61d6bc08b447dc8666f39581dcb6e49f |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d9017df08243497c83d36787011ca53bbc9227c1 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f74ffc4a9bf5bec9e3d56122c6a21ea1f7fc2133 |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a7d1b1ef70cba7c09f4a8493c8c3fa574b10aa75 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/49166c70977163ebb7ecad59a4f2e2612af95cac |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/aad347a82c8552f22cfc4954644353f2af744876 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a86e4811fdb406b65c73cdabc14cb5be6f5b2b49 |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b657314d1d785f72baea4ae605e643fc99806160 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5b49664a755a49d04ecbf9d1ffdd21f9a6bb9690 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1b3610245203cd7ba032549334e7629d63015af0 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9791ca07402812fd115302c2421c29370e3a52a7 |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/bed8dc1621d8b86a627667b017810641d48a3b6a |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6f65dff6b0f408b77a19b66e1850db22bd765fb9 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/dce36cdbebd63bc1f05c545171137f9f29188fdc |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a241fd9f3a5e3d1272b6022aef23597c8cbbde62 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b395457de03f3c66187ac76a5af5bcfe0a338d04 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/df4c990555bb3938ccf3b9f32ebdad2e7c30b08c |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/967917c863054db5220e38fd73ca450ab08c610f |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ff1199b0bb3ac19df0ac671d4f248c7b62d22f4b |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/810f050c751a7935f0f244e89f3e931d8a98a635 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/b51e2d798f69cb73dbcf64fcf8ebe35925e72f9d | ORPH
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/664c8579143809fb5d950eb55b3f469fc3372ec5 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/71fd2384456b4a7ab289a6ea936365a5ab370386 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/cdbf7f002105353e89363b07a986dfcf9f2bbc97 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/60cb8737221cd582fc8fe8bb9a308649eafa6b72 |     
    or1k     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/a77126b44f5d393bfbe0a817d8415c2e4696c0cb |     
    sh4a     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/4fd7992241fd6a017c3f411b0140aa096b8801b1 |     
  aarch64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/528d6fb775ed20fbaa35620ea5bdb6586c8b0ce4 |     
  aarch64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/3ff0626cd04b74659d1370df10b0cb7d02415f53 |     
    arm      |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/6cc391db1751565d22e0da74aaa54f4b979847b4 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/74dbb733247933f0adeb7f58e33f7c11d7238168 |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ba039157e42ced3e67668922fa1ac25eb6708bf7 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/36383670b763db6807749736b15f7846ce534895 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/02ad3fd6ddeaf79b0fb776e15f1de0bc03702bb3 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/97ae2605b84f31aaa702aa443fb1e223f2de7479 | ORPH
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/05462e3f31cb1e559cc8f8768b8a526a2b5f0bb2 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/b1977291ad6830f9b7cb2d8a1538cb3fc20d5ac3 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ee8f3689837e0f2c5556c29689ffecde0e9c2b36 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/155dc323e5550636895456b3198578301396bec5 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f4ee3bf4987091418c26974619bc1f04b1d1cc05 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1d11a5ea0da7666df2516f1ddd5bce5ca4958a4c | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/7e1024fe10d4cae6f3454b37b962d89f203148b5 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/fb17898ee8262398343f4a0ef5752d784e75ab7e |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/c1e27d19c96cf3f1dd6158510c12d0d06e1e0bc0 |     
   mips64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/14e3c015b72f99eaa9dbdc99f8e7babbee67e757 |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/3160add908031d36231d0cfdf6517ab442ef1f31 |     
   mipsel    |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/eca565673e6d5c2935bad106fbcc5d63f6021d6d |     
    arm      |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/fc296b632ce94f00562c38d42d7b5f140700f62e |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/3ef9e2cf96d60e043e4d5358954200ccb7d687cf | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/722d7f46882a8a367ff82fb08ec62b46bc1f0c26 |     
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/3d47e92bb046da05b2f21951359fcbd4e347fe20 |     
    arc      | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/80d676d63fca4af180e52728b97722b9dfcea1c0 |     
 powerpc64   | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/2a00ed96268e665729ea49c1909d5119c859aa0e |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/42f00fcaef2d702f2d1956308cfad68ec641ff14 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ab7202b3f99cfafc71fc8494faff20d0d3250240 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2ea83502a9951b258032e8c56b37b9d7e9644ca0 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/40757ef6c8d368d3bd0900ff06d53267f096174d |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7607b0882d5e8c97152198326e93b72280ca8fa0 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/140eb97fc4e290c6f31037eb71c5b135e214ab57 |     
   arceb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/03b2b71d1e658b3aad2a22d532b30f23dca932fe |     
    mips     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/82bdded4544dc031ae2334d1e6f59b96f2dcc9f0 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/defc2daa68b0b6a11df65e904997cca2be20e3d8 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ced7e8beb39ed7cc61a849204de02c2f15b154da |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/75b07558f7c93a71abf2d2c2ba6c5c0596e108a7 |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/454513236e9c06076a6df867977f385013153489 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a178f160956a969b1efa5466d8ecb0d5d6d55207 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f67516be859ac5ab98508ff3744e92edc23a25af |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f576b4c68067dbdff0cc9f4d792f63b43c87b4e4 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e7449e38be0d2526f7215d4bae3fc8acd2c3dddd |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/bdacaba0952001b6e058abb4f8a7ba9f4e2bc1d6 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/97d50613cdc8227d1ef17d3e2715fdc802494bce |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ca8aa7ef73f1857c86ac3bb6eac8f8ad5701604c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3c493bbde24e08e8d127cbbed7f55aab6f0afc85 |     
  aarch64    | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/73866eb1b376e8a797612530d1d849a71a803877 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/039e9dbe9120509e930521fa2a07bb86bc3e2459 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/40390cfa4c4ccca3ea44a67525914dc9e2d6c7bb | ORPH
 aarch64_be  |       gnuradio-3.10.4.0        | NOK | http://autobuild.buildroot.net/results/6a82605c58f9ef9eb6c14603777dd8523dd00aa5 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0a822b4bc972ded59e5dfea98be80f516b550fed |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/296f082fbb2fce954e0c871ff0c02f5d760a986f | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1cb673023f4ecc75e35d9cd8ac5c80201992ecb3 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/dc2e534120173e5ebf8d460a6bcf0272068d1840 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/5e3ab621bae1a0da3aeb9df9602120a22a38d1dc |     
    or1k     |        gr-osmosdr-0.2.3        | NOK | http://autobuild.buildroot.net/results/86e9d0cd5f70942d120f9b91953ec01f114ddb38 |     
  sparc64    |        gr-osmosdr-0.2.3        | NOK | http://autobuild.buildroot.net/results/aeddf54af2e3fcb8e86c149aeb82b8f192415832 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/77d8bf550177dc785d93b7e77f78a0a6f4059e38 |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/661f351f439b42a6a4f72fd9c7a10ec39796f134 |     
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/67408bbea2eed533a5c77dc41272e96052a0e64e |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/46922c4cede1051919a2c2cb035e1b93f71b82d6 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c65bfe97edf99071ad1e0743d2e3728332c526bc |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b63713883f73439acbe63207102ccb4d67f0e976 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a5bf3d1d0ee074a1a7604326f7bd5f3933e6be05 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a5fcd791a261422f605c80b1c5b02323cbe75eb0 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/beddb998f3ac9b8069fa85369841874f04302737 |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f236d91c88847967fa01061b6771cdcf989952c7 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/77fa583ba6a27bf6323b80d43a65d52224327076 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/39eec9194279be25e8e5331a7d071a81b73085ca |     
  riscv32    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/6718c36e79b9ceebc8a5fdee3270b96e09307b8c |     
  sparc64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8c3db10bc84675528b16f65b76eff74cde6fc65a |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/97e75dd640976873e494f6b791d6ce69239bcbf9 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/5cff77894a268ad583db7a84940a2ab523ea310f |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/8a4306664f8355d098da8e1913a105c7223bb324 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/95118681b941d6ba4a3125f9da50258037725297 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/5102d90383e36088be4a01217ccc098f226b14dd |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/541734f7464becc406be08af73c4909152012799 |     
    i486     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/4bf90ee0f1549bb84f4ba6c7f61fb63c084a07aa |     
    i586     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/bd984409263a309d1d5fcb00b852efe8035eae9e |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/e85acb28b0b09320c03d1701f27f51ce8cc99ccb |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/d74bd5fd9ff6bb76c7f708cf18755caa331c514b |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/60565e13a21bb2db684d46be4086d95694764fae |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9b5752d6abbfbde5d8eb8716008bfb2a21117b5b |     
    sh4a     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/136e7ca36484272f3e270f7410ffcca48bf9d357 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f4442edab659b635fb22b37918f250057c7d2c1c |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0428e621228727e90e7becda7f829b3c88943bc9 |     
 powerpc64   |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/f453232daee35593bef1099e6d2a15a456a56681 |     
   nios2     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/681ba2514549c66abff29d420a8d02b39bb3dc88 |     
    or1k     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/a09ddb24d7f025f9d4b1763c29fdcd0abee14905 |     
    arm      |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/7e0d9c5aea62aed14e371f282cd24adab89a29e5 |     
  riscv64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/715a0512710aebdf448fb0556c31cddcfb22c798 |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/dd49230db1a96f9e122f7d3c3488402bdf2e13b7 |     
  aarch64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/b5ab784f0d68a9acfece6b29996ec45027f092ae |     
 powerpc64   |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/e93aaf85210a074432c0c5a0fdb0e13ec7f1976b |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/18b8344d1fecbea821118e391e852e83c6f056af |     
 powerpc64   |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/8596c31a4590a4522bb452a072a923d1d27b54b6 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/285081c8616d8f77e33362109227b2275844e2cd |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/d294dec8985879c0fa794d34e98da7de7d0180aa |     
   mips64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/f24614b89952f22f1cadaf62018ac8b4b0ccaff3 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/47c8839746dd3295579881653a4cf377a4642caf |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/51bae575b3591cb9b1b53a3128ca85e23c89fe51 |     
    i686     |         host-wine-7.0          | NOK | http://autobuild.buildroot.net/results/f670620c2d518f8adaf430fbdfc450528faa8739 |     
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/23d5ca87887176189067f5ceae5b90e16d3c1983 | ORPH
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/4d6ce2c39b79a44e746ac55d336447aabb53c089 |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/99fa53a94e782fad05ae1b76b14ffba289c9883a |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/89036fe0951bc502a91b96a55fe67c2c8a8b85c5 |     
    i686     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/6e16c19ba6442ae879309bb60841ff0fd8069233 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/19adc0ce3488df8b2ac8e051a70898cb27c12aaf |     
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/627e200dbfa82288c4ac534be44aba86fa92e558 |     
  mips64el   |            kmod-30             | NOK | http://autobuild.buildroot.net/results/292a6a365beb87e08afd55a3abba46cbb46d6fa8 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/3ef3163ca7547130f39a6e6125a81a865681fca5 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/2a7349d9d83467f6ab1cd819eb3f63df66a2b45a |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/42481158f46efa240496a0db8fe7ef780ccae455 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/79f599382b9acaa2fecc31db09032709185fe41b |     
    arc      |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/56108df1011e6efe3f426b72a760c7049e65bb26 | ORPH
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/af75e5b99388141dcf04e2546d0eb442fa51a06c |     
   armeb     |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/2fbbe5f4186a699a7aa05b138379f8bb57b50654 |     
   arceb     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/77bd4cde5dc8c6f8be51a01bfbcf3889a867b1b3 | ORPH
powerpc64le  |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/c956de8923f8ec064585736583b0a7b8ca31e201 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ee9d1bd29ec9a2f31c6e85b9e57130265bc0ff21 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ba0ef62c6f22f55a9fb09ba8c62a3ff64db40843 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/90d69aae449fa24d8d5a3201b6b5c8d13a22a773 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5a02c2d15613a115cffab8d73d2a04272e22b665 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1195e43f615fd282e8ca5a3f4b94e95df39207ed |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/8a76122f8362047787ac3de6c59c7f73086e394c | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e48af095699ba468633450c7121b72bc647d2b43 | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/f56a106f1a3b78bb148b660f16ae96b4c24b69da |     
   mipsel    |          libnss-3.85           | NOK | http://autobuild.buildroot.net/results/ef727846f7e67fb4f81d0287923fd95d680a2845 |     
    or1k     |          libnss-3.85           | NOK | http://autobuild.buildroot.net/results/6e897c77ff7c7d316b4ca692951a89c70930e4b0 |     
  mips64el   |         libzlib-1.2.13         | NOK | http://autobuild.buildroot.net/results/bac17491fb6d4a901af91f616a561d6263cd03a3 | ORPH
    or1k     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/1168eea5c256f13c13bbcd852e43383dfeb9237f | ORPH
 powerpc64   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/f147c3ff7218d42d1d0d48ba1cc88b05360d83c8 | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/915ade4b9d327b29bcc99c3d4b298a788a3d5343 | ORPH
 aarch64_be  |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/edb394d7547451a08d5a06af8acb3d3b6ede5fed | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/b7ce5f9c9b9861db03daf595282036eb309b0bfa | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/6adc039200d139ea3a161362671466e6f58e2607 | ORPH
  powerpc    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/7c25eb6a430ab688811a5dcb0bb3502e29d95146 | ORPH
    sh4a     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/82b35fbd2d8dbd77a140eb92b1e77a1fb90731bd | ORPH
    m68k     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/650439a92d3f1cb912e212950db3d7e3cee7d8fd | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/f288d413ec138e6b6d4caf5cb14390fc45cc865e | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/49ccebb2a13ae81d3f70b9907b64944a99f67991 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/6efbee376abdb280a59251ce419c5286db03938a | ORPH
   mipsel    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/c66b0c168e24126767aa1fc2cfea84338dca702a | ORPH
  aarch64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/95a0aac3151f4bba4478c9e312ecc9ea3351d2ae | ORPH
    i686     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/cb36415e5acef11c2f62c3edd5b3a3d7c510fbb9 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/9565372b7e53eea6d268a36da191e20099383cf4 |     
 powerpc64   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/6d2748a8b3e78794fbeb2e6b082f419e20a83511 | ORPH
   xtensa    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/7e844201ee592cb3a5481700ab6abe2b4e7fbcea | ORPH
  powerpc    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/94b4677c37ea2472daa9ff762bbac13ed8ef2b11 | ORPH
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/75f694d3d6e411599ab13ec970ccd6a5ec1bb8b9 |     
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/c964047eecbfe1522762eb6ba69037619efb8c3e |     
powerpc64le  |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/33c9ca0f2babdae880d72e635beb482d374c29de |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/57cd3f29c6e6bdc6f260528c4d75274cbec07bc6 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/cf85066aaa584ac6f1ddb11028d961df7e642481 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/46072a619898615579c070df5c74a5b16f7e651f |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/dedf5aa2a882b575adbcae0a76f7a2bf4172b431 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/1bfec6dcbfcfa2e15f60869eaf40c3d986791e11 | ORPH
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3a4fcdd4d65eeaa41b88b5951a4161af64486f25 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/91a0dda30134b92050dd8c843f615b1ab0ddeb3d | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/bc4c06a1217b8b6aa529144cfaa4defe44b9d41f | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d53a3dd68b2de095a619b250e40104a7c823a4d8 | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5949136eabf596cc2afac9d7d4e1e33e55363d2f | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0eeda5c7661ed992cb4d62f374a119bee6f1f65d | ORPH
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c4df751fa52a2ca8077e7f0b451bd3b11e712a50 | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/23dca78014f4339b4f9d21dc1a57e90a816ac9cb | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/23f967c13e73dc210cead18fa816a173d2e79269 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d9b8b55d6bc0bc1905de6dfbc80f46a496189b96 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/b3bf14857b8b40341749f785c607a2b8dfe732e9 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/f14faec5fd669cb8aa5bde6790eee7d4068a2a10 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/ad66be30b8554dbadc5ed4627366dd7f76a93145 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/60d465b1c3fb800077b547a3044cc18108a6f0bb | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/a3564a1cb98451dba8e18a7e07f50bd46d1e7e0e | ORPH
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/155786a3ea4a20bfb37a0c4839c52bab8dd4659f | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e1f7f267fd46f23ba5c0047a6eec62336c238afe | ORPH
   nios2     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/819b485b60a3d334696a95431b07e86aff72c881 | ORPH
  sparc64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/e3264d44bcbafaa7247a7d13e2d4be0085502b25 | ORPH
 aarch64_be  |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/62b5b243badfb26be00d6ae9aea17c350ca3ae32 | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/dd9cc6cc5fcf989c6715cf2d4e21812f7949f56d | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/c303ef4f8992a54a4202d18b356115216e4a7a7e |     
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/475c4a873256b349d53c043606d7c2793fd06835 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/59c2efce14e589f44795a748f6570f93f2566eaf |     
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/453d1b5d262f61e5052463e8d30cceec4fa16e12 | ORPH
 microblaze  |          p7zip-17.04           | NOK | http://autobuild.buildroot.net/results/018d76e3c3a22737e473b16284db44d4b0cf275d |     
    arm      |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/da234ed6f0ef037d4987033cac205ba1ccd58442 | ORPH
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/8d831638c8296e9da5cf4df67b4026d75838eb99 | ORPH
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/db6f8e2bd027dacf9276aabe44213fded36feb09 |     
    arm      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/c7915be6fb31010591a2208c7ea0563f59285ce3 |     
   sh4aeb    |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/cd03a12d434bb4b1663008dc648f95d8cd21f078 |     
   x86_64    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/5fd3ca25c01887ea0cf307ca307c76683084fe41 |     
  aarch64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/e5675d4cba8e06503eb6b4943dfceb84ca3b23c6 |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/f0efcd08cffafb7556b4a70a941368697d3f9e40 |     
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/7d46f1a0c27f0be95990515a8f409edb44c6ce42 |     
    mips     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/0d3cd7065c9f11871500cd5ead1de5abf7773427 |     
  aarch64    |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/d9384d04aed37625fdc464fc654aa1f42a90a4b8 |     
   mipsel    |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/29f5c1399d86cf9da90b671aafbd5a7ff4e525b7 |     
powerpc64le  |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/626e1f3f4884707c22f077c48bf75e50bca46e7f |     
   s390x     |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/17d5bdd2bf3f60d30efa5cbb6f13c44a8dc216a7 |     
powerpc64le  |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/1c6bf56e8d82d2f14d45cc773de57ca3f302c78d |     
  sparc64    |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/31a2ace634478b67a1962e918c6bc66c4b4903b5 |     
  sparc64    |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/3a82ac70a8c683a290caa79e04e3febc3a47ddaa |     
 powerpc64   |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/c8b92d846f2badf7cfd4350e670fa8942691958b |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/52fa787a8c204d84b0d4c49982a8c0cd8f16cfbe |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/91b3d303bc389eeb31090bbcaaa75523cd3b305e |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/99a06c301b14b631e9c61ff313024630ed5d8c16 |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/769d8bc739674c475f5ef593ec9cb7c990f71ea4 |     
   sh4aeb    |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/2e5e99f47223eeed252a21cb3f657ce221907ef8 |     
    sh4a     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/25eac2ebd0d4ec6e1c089111b04f4c22bfb8b65e |     
  riscv32    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/54c0faede95aa85f202a2305584f5598ad888fed |     
  aarch64    |         qt6base-6.4.0          | NOK | http://autobuild.buildroot.net/results/d68eb69d212721ede19190b2427c34ef9d217316 |     
   x86_64    | rtl8189es-e58bd86c9d9408c64... | NOK | http://autobuild.buildroot.net/results/349893c66fcfbbf0e0e10285299581894254c941 |     
 aarch64_be  |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/7760812e53122678778ac32cec54369e5318401a |     
powerpc64le  |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/7b7495b6846f4ca23786fd1feb0cb445de0c56ff |     
  riscv32    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/c9964a23c0cb52cd732e811465f3af7633dcefdc |     
   arceb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/32034972e9475355268f3380a6f31f58fd84a8e5 |     
  aarch64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/6110cea488a40eaef8a8a82e32656f6d378e869b |     
   nios2     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/48467d9487f8171ee911a4502c885fbf49f364bd |     
    arm      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/b30a26369908721c7db30a5e1b029e59ecc93bd5 |     
  riscv32    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/2e0168d23e8c23bcaea66e2f52b3691199d789e7 |     
    or1k     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/e4536a3da6523d68479cba706c1f256dcd774600 |     
  riscv32    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/db1517631935f614b979a7271e39c20f9d65621b |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/4a133f2adbcd02394144789cd76224426ff808fa |     
microblazeel |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/375ba44fc49f62f772a001ad661bb25b81b06538 |     
   s390x     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/81a6ec4b3a8f6af6233f16eca5f4a4f78a26e2b3 |     
   mipsel    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/011abdf125787156636c52ff08c2e0594c64903c |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/6ad28b13b3c8390b6ccc8fd6d71d1b141d4dc779 |     
microblazeel |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/55d2c481d8c148fb3bb61c1331340bcd71274553 |     
    or1k     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/d91603170c47610bd3160164de33f97c0fea4ec2 |     
   xtensa    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/f74e222132695e081fbf8eea007cf9298648d80a | ORPH
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/0684f8ef6c0a9af14f66efc323cd38de62cdc9cf |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/df5f7e7599647421ed235b5902f5acee499f6b92 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/9519068c93b194beb5943a91814a089164e5879d |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/141fdb0fd2c795fa9abadea972ffd5dbb598d436 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/5362898658665607e58ad652b8d967894d650681 |     
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/2ce91732cae27965854a5cecdf4d0d43a9a1b8dc |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/e7f2f05d96d7e711cb2229bbef39430453e68790 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/7c74c6658d978d5f63252349c89af36630559d4c | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/2b17b0d56a4b41adf1b949c2656cd912e540d243 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/2daaa05cf8c5455d240d14a8411bc4338847c1cd | ORPH
  sparc64    |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/3945ee9452a4adf7af11bb5f3bda57fb793ed794 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6c91b5632c060b98bb9476c33bce4902a2610d2f |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/840184fc052a7c95c5ffe2592a13991cb45e93ac |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/552c9a3a0422c135627a74915dbb5fba14352882 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/faa0c6f85deea3f38ddabd3e1e1450469ea3790d |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/21e43a7a61c129f12afc52f9c5f067dcb5730115 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e24d4d92d1c8722bb96240703e0f6095fa96c554 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/896ce4911d65755bf5e170af627f887b3690b88e |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/690c3ac299d813bd0420a1a6a34391eda546a085 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/4117770cdf968dbe274afed0df314e337658f679 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/90b900dcad4de09e78bc9742b7d42749c5535b3f |     
   mips64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/b660932bc1797f3620cf07846bb6018ab207da95 | ORPH
    i686     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/4582d59be395e068d923c3d7d38a2818c006be9e |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/639d94d40af7fc52a771d77e81c7ed59147171c3 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/e6163575f1a479ea9e8482f4a4d904897e75dbe4 | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/c7c4ae76954e388ab639b39fd521d90acfe4edc9 |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/a31159a7cfc2d618c9b11b56b47819b73c5c7244 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/6bd431de96e78a89db40e1bd01bc044bd9e726dd |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/7a049c1a6510045f50a43b5467c14e7b5c596609 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ca3dd6e8c3974ec183ebb1aaa689af2f2693d5a3 |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/0a87d2c1ade93f52a13cc2fa0663efdc33a911d1 |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/4f50bc23ce9aa935420b178d710976420a69c97b |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/9a7e29d32cb0735ae1617677fd13a4d2c01705db |     
   armeb     | xr819-xradio-4f0cfd5e869ca1... | NOK | http://autobuild.buildroot.net/results/81f62d01bc72da13beb1d2ac453586bde0a90de9 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/872a5ff5a73b0a32baf2ae8a57a82b68f1a5c26a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f9fc5ee7ea236c78dd5eb83f45235ef6f14f794d | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e405b89654bf27ec04e2a8d9c142e6727fee2240 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/11b45c164895a61bff06805f0253734fe5cda73d | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/228f466ef930a892b5421dab4032b1981500d615 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/da341eb65f2477d42c601299dc275a6f7fc6a781 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fd052f5b088680878695536cf48869969393a672 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0d60c51c7b38a1a8a080d325f32ed04dcdb5d778 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b9ea8583a658f1a7f07d0cc0e36eeb22f7cfe651 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e0aee69c550472e80def204e02ed15aba3166258 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/418090b2905f616c0c5888f58df9e08c8accf0fa | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/89afa41731b7d3205a3c0938d297d1c689169d9b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/85e9f8135888fc1454ec451c5da74b4aa66e751d | ORPH
powerpc64le  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/f6c9c12fc1c7ffe3b6942b1efcc2cd7365e00870 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  cppcms-1.2.1 | 2 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cppcms-1.2.1          | NOK | http://autobuild.buildroot.net/results/8a3ac2ae19e2b1b9d0c2a64fe5bffa609dc0f076 | ORPH
    arm      |          cppcms-1.2.1          | NOK | http://autobuild.buildroot.net/results/76ea27b8bef1d5defaa472c7d5fcad1ef317f644 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                       unknown | 3 
host-pahole-73383b3a39afe86... | 2 
            igd2-for-linux-2.1 | 2 
              containerd-1.6.6 | 1 
                 dash-0.5.11.5 | 1 
             f2fs-tools-1.15.0 | 1 
                 freerdp-2.9.0 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
  gobject-introspection-1.70.0 | 1 
                host-go-1.18.8 | 1 
               libglib2-2.72.3 | 1 
               libmdbx-0.11.12 | 1 
                   libnss-3.81 | 1 
                librsvg-2.50.7 | 1 
               libvorbis-1.3.7 | 1 
                   perl-5.34.1 | 1 
                    sslh-1.22c | 1 
               valgrind-3.19.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        containerd-1.6.6        | NOK | http://autobuild.buildroot.net/results/7a427eadbe8ef6841e0f0e9fa0f60a8b5b41bff6 |     
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/6be299156f0d4948305fc4526b22732a8057fe09 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/f8b18cbd13bb52d74a15f265be5863eb50efe8fd |     
    arm      |         freerdp-2.9.0          | NOK | http://autobuild.buildroot.net/results/442c2b762e0cdac83799d666329f9300db32a58b |     
    mips     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e232e9ad01e932b359d0f149fc23c38ee551600f |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/206328bf80b32ba9c7e4055cad82569e50b65f54 | ORPH
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/0dd55fd7b6a3fbf7476685e6732513d832385aa9 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3ab419730c76df43ae709536b41f6e552074d767 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/42a63d21290945cd74790a72985694a4f6bf0f4c |     
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8f68e331b4954b4750a6862077743f5f331f261f |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c6e8560069ff42dad0a194a09a855f66ae12f750 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f7400b27259d9e1c4304da18d6acd422883973ea |     
   x86_64    |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/c8112bad5bd1437bdec6c45f6a5c7fae14d92bd0 |     
   x86_64    |          libnss-3.81           | NOK | http://autobuild.buildroot.net/results/6689105e42bb5d01cb2a1d0d1e91cd2cd5196e6e |     
    arm      |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/f4d8833c130308fc3236556be907743fe2ff07f7 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/6253ce538984034ef471304921d21a8c07296185 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5edac000f2c04b192e00bd048be3413421af5588 |     
    sh4a     |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/404eea93c25ab6759005083ee0cb234be5159e9a |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/e24ba8aaec060bd1dd46e81eae037735ab7e9d5e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a91a0cac17be9aeb5ca9acb6b796cd143cb45b80 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9f07461d452ec8d6919b11ef7d4b36a311c65932 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/ed49cb9f6cbe07f1b06a886169d7e1ff85aa4d09 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
