Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1905DC19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 05:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B8D4011E;
	Wed, 27 Jul 2022 05:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B8D4011E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWxC09WTHYYx; Wed, 27 Jul 2022 05:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB706400E0;
	Wed, 27 Jul 2022 05:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB706400E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7581BF20B
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 05:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21D7840132
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 05:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21D7840132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6TgVEU870qF for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 05:33:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12303400FE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12303400FE
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 05:33:07 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0162FE0007
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 05:33:04 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 05:33:04 -0000
Message-Id: <20220727053311.21D7840132@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1658899985; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BfSzQb7k5HWf4/jPaMoXDDJUqzUulbPDJTC8MBtwUCE=;
 b=lliBj6+hvXwTC7ouNHzPWpMaBejZWwNcX0LnzkywGgog/oL3WzS8LAXsYWJpdqfsccfO30
 nWrRp17/7O3rROszopUPdUnKuS+xLaxMzeaGrFTb76XfDSyFcnHbt73leyJ+dhqs66vP6T
 PyRsboZj35NvHk/zjuohlCiflqJjH2roRAYjrLUkHshFwn3OTN95ChC54yNOhei6pDuP64
 JYJEOT9jrCFgFxc/IhwoVXyd3yN6SVFiLHu/eHTMkAb5sJ+2+1u2LYNBZWRPCJ1R2gr5/a
 pyB6KvMG0u+pednPRfFiaJUQLl6J41oBycR3pV0JElSSGIsZAahHcy6NA2VRtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lliBj6+h
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-26
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

Autobuild statistics for 2022-07-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 11  |  6  |  0  | 17  |
  2022.05.x  | 26  | 32  |  0  | 58  |
    master   | 159 | 173 |  2  | 334 |

Classification of failures by reason for master
-----------------------------------------------

                 linux-5.17.15 | 9 
                speexdsp-1.2.1 | 9 
           libfreeimage-3.18.0 | 7 
                     refpolicy | 6 
                   speex-1.2.1 | 6 
                 uclibc-1.0.41 | 6 
              bluez-alsa-4.0.0 | 5 
dahdi-linux-5c840cf43838e06... | 5 
               pulseaudio-16.1 | 5 
                       unknown | 5 
glibc-2.35-134-gb6aade18a7e... | 4 
host-pahole-73383b3a39afe86... | 4 
           linux-5.10.115-cip7 | 4 
                 opensc-0.22.0 | 4 
                busybox-1.35.0 | 3 
                 dash-0.5.11.5 | 3 
       host-gcc-initial-11.3.0 | 3 
              open62541-v1.3.2 | 3 
                 pixman-0.40.0 | 3 
                       xenomai | 3 
              alsa-utils-1.2.7 | 2 
host-gdb-arc-2020.09-releas... | 2 
                     host-mono | 2 
              jpeg-turbo-2.1.3 | 2 
             libgpg-error-1.45 | 2 
             libopenssl-1.1.1q | 2 
                  matio-1.5.22 | 2 
                    sdl-1.2.15 | 2 
                   tor-0.4.7.8 | 2 
                zerofree-1.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                    4th-3.64.1 | 1 
                     ace-7.0.6 | 1 
                  acpid-2.0.33 | 1 
                arp-scan-1.9.7 | 1 
                    bat-0.19.0 | 1 
                  bitwise-0.43 | 1 
                  boost-1.79.0 | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
                    dhcp-4.4.3 | 1 
        edk2-edk2-stable202102 | 1 
                elfutils-0.186 | 1 
                     exim-4.96 | 1 
                 fdk-aac-2.0.2 | 1 
                     frr-8.2.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
              fscryptctl-1.0.0 | 1 
                    glog-0.6.0 | 1 
  gobject-introspection-1.70.0 | 1 
              host-delve-1.8.0 | 1 
                host-go-1.18.3 | 1 
              host-rust-1.62.0 | 1 
host-spirv-llvm-translator-... | 1 
                   hwloc-2.7.0 | 1 
              hyperfine-1.14.0 | 1 
                      icu-70-1 | 1 
      intel-mediadriver-22.5.0 | 1 
                iptables-1.8.8 | 1 
                  kexec-2.0.24 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
                 libidn2-2.3.2 | 1 
               libvorbis-1.3.7 | 1 
              liquid-dsp-1.4.0 | 1 
              memcached-1.6.12 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20120127 | 1 
        optee-benchmark-3.18.0 | 1 
                    opus-1.3.1 | 1 
               protobuf-3.20.1 | 1 
    python-cryptography-37.0.4 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
              skalibs-2.10.0.3 | 1 
             uccp420wlan-6.9.1 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 
                  waffle-1.6.1 | 1 
                 wavemon-0.9.4 | 1 
 wilc-firmware-wilc_linux_15_7 | 1 
           wpa_supplicant-2.10 | 1 
                xenomai-custom | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/286cc5f754e87a3d3c79a751b6f53b50c1ba8782 |     
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/21ddcab7093f90aa9fb206b7365fc5566b553071 |     
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/4bf658184fec72813bd8048f7adb80f25b04fe9c |     
  riscv64    |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/6589bed53bb217fc917451756389a8baa4d828cd |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/af74093753a1b5a44791079f4700fc61be757e61 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/4718dc947389f69ea603807d3bed58a7b01b392a | ORPH
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/18beeb4d853619acb7a1573bd56f2eb0bc36ba6d |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/079dfd54829a554d70ebc045dea93fb1fd4d24a6 |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/41d5dd8d2cced9c4b44e677e6f0c8d5f778c756d |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a8a8fefaea3c4df044c84569924ff23fb284b6ae |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/3ffa6c535253e5dfa63c2d05ba6bdadb6a4de8c7 |     
    or1k     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/1ea544d94352f807c5ef4280d989bae40ef19dd6 |     
    sh4      |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/b4a4eefaa275d165248483da91c1710e923aad41 |     
    mips     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/f38b451adfbaa27078adfa53a4cc8507ed0ee6a3 |     
   x86_64    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/c66c4eceb13f99ad6c2a8fdf57f1c6f943bcef1c |     
  mips64el   |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/eb5218fb5475ca6d6105bfb4d54efcf834dcfcf7 |     
   arceb     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/2ac73dc98cdae75b9a6c33323b5bdd1e4b13ba10 |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/c2b136c5b1534dd501d88568a02d10e9998f99d8 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/1b7352ab1c1dd93deb457e89f1892a8d8ef37d70 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f7a831ec3a680fd745793683832efa72ab7a591e | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/ee10af2fe100e0c30b54dd3a3174103f3d1a67af | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/bb33fb79ecf753790f24b5bc30ac2deba3af11dd |     
microblazeel | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/92ad349e2813e1317a8e30c8f2dd4f64377a02d7 |     
powerpc64le  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/b7221db1bda47da91f67e3b0e5660affaa0a44e9 |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5e9f61fdfae5d42027cc291d47c8823966c1b6bf |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/182663513e78659bef3a69e43f98a67e13ea6693 |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ed0a01f00966fcf9aca90122c3f0781f642f6627 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d7ecdf0eb1759442975f5bad0c45f797a23055aa | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a366130f7d6c6e03ff0374b80c6fd5ae03674ad4 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/493d663330a71eb16c0719f3fedc8c1d775f5f09 | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/bf961e29f113e9ce4832c7f7014ce4db382ff6b3 | ORPH
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/22023c1fe78e7a06e9bd027a12522ef453396355 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/34d8a75ea281cf2d288c6fffb6dba5bcc83a60ca | ORPH
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/ff92bf961edd52b88eb5e65735db5e94a69ea7cc |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/288555568053131f6717dff461a573dbcaa67a28 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/110923baf182f40fbc5895a22d1ae2d0dbef3706 |     
 aarch64_be  | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/bcccf8097816a120822e8e02fb3318243f3e87aa |     
    arm      |        fscryptctl-1.0.0        | NOK | http://autobuild.buildroot.net/results/58e8facd9105dcdfbc21ed245de03f3162c98cc9 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e3cb0dce0ea209fe8c677c106cf8d96bec7d7669 |     
    mips     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/d62b28da2473ca99b2be61e84852520815cf2c1b |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/1a650ee63f70d548cb16c225a9eba071a0b9996f |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/2dd184e4cf2a374998d8f71e103be5091dd59822 |     
    arm      |           glog-0.6.0           | NOK | http://autobuild.buildroot.net/results/bf0846a51da69169286c7af38089d204d3d242d1 |     
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/4ba5fbc06d1711460bd7ce1d34657f7d3030190f | ORPH
    i686     |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/5b467ac5a08dd1c98224788a4005d953a70a0d12 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/997db3a0da19e47a3871774de19787d6abaa1c85 |     
    m68k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/0ba9bba5d4be249fe78b128ea3ecd0c9bccbe334 |     
    m68k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/15d62edfc4b54c0b40b9d3961b797bce4e307919 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/280613a95c466d5ab79130f7399ffcfaf6596289 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3c799d95f966ff431fc78dd45fc23b158200ddb9 | ORPH
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/7919d00f406fa533a2212c5c9e1f7d0694aa7c1a |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/692d2c4b6be6b8f7d25f437e57370980bc2db982 |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/92429ea83c5830e9a5b2b2ddc9e27df8349d0c56 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/49ad218be51e7f641695e8556aad6f683334da8c |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8d884142cb172ebe6839b255c4365822fa0d9da1 |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f288f2ac2472d22a3f45dd87fde3d2317c6117c2 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5cdacd79a37dc04134a285a9e43df2144d6887a3 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/3c3feeaf98a14329a7a8727607fbda7f2e04d7bc |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/2da73f528300f374a94fee0e3c52e0365dede51e | ORPH
   x86_64    |          hwloc-2.7.0           | NOK | http://autobuild.buildroot.net/results/e7fd7f44acc8d91ebc6b6768360316014da97138 |     
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/de42dd5bec5a48131d33b94aeb4c71db2d0fe3e1 |     
    m68k     |            icu-70-1            | NOK | http://autobuild.buildroot.net/results/5b96b93da89bd7c81c71d82ef0609afb3f6a6aec | ORPH
   x86_64    |    intel-mediadriver-22.5.0    | NOK | http://autobuild.buildroot.net/results/939cde9543c60ea19f4bee51e86557c8dd87fcf8 |     
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/93db89434a0af816aa6d0518b889d097ae10f156 | ORPH
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/2b162cc983466c5aa472b04c7d1fa68d70db6fd0 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/9e51b3ede619f159dbf78fc9ea8fe5a78db61611 |     
   armeb     |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/c67aaa9532b67efc0a0e6f71de0e45127a50ea69 | ORPH
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c54ad4b93a6dc7487db205bc288f96d7c9a0a855 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/f1f7b11ad9fc5eca429974b37e6bd0f912220699 |     
    mips     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/cfe74ff684487d1fe364aeeb969104cf246c20f2 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/93b213e4e82c5d11a9b47e337e9bac1679baec4b |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a20cf345796ff5efcf7a56a729a44045fd2f5387 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/58d3f9ae0467fa8fb2ee1de2000d73410f1d9eb6 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7757a36e5338e686a4b3eb60cfe123ecfcd17bc2 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5678a2fbccb6baedbba656e5360ffdb6392c54f8 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f398ad1cd5c1853d098ae91530740333e648a4cf |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a3165a6e5a681ba18e770367598d11d90b86be5f | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2a5ae58120be0368b5d5ce77af1a953140fb401a | ORPH
  aarch64    |         libidn2-2.3.2          | NOK | http://autobuild.buildroot.net/results/c225ff4ef007b9a3ca56e6b601687aaa33699675 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/285bf2a4311b5bf967b1a91a36812bd6ad36865c |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/43a8f1815c42c62d1901a6f6c6b2fc3d3185bc0e |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/612bcb35a4a0f2df0f049b83e83b82dae5d29faf |     
  mips64el   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/a7e01b9451e7ca1720242ddd7cbc771425771578 | ORPH
  riscv32    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/149d645ca6393ebc186085b0ed8ca8fd33728dea | ORPH
powerpc64le  |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/20bc96ab3ffdf6176da042cd263d1d3ce33a6d74 | ORPH
    i486     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/7e8ddba9ac2bdbfae3fe172e61c59d590662fb17 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e5c3bee76faa6a0988ed23b2dc821fda0ba7272b | ORPH
   x86_64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/cd598c37fbefec9149d531f728cf7c56e03f5179 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/24ed94af01d32d4a59b598cd08746e99b14163a3 | ORPH
   x86_64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0300dbd03c762e0cfbc7462204d0cefa37c0e80f | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/a808f810ca767dc1346a8d648dc8f50f6267cc5c | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/baf8cb893c28b56f49976cbe15135514860bc52f | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8f39d4046612998a264d99d9e29cbe200406239c | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6007e6ccc05498c0a6076935582fad2aa682cfee | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e7c5442f1791032c6ca172d85a591faacc8248ca | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/62cd30c7699a62638a99efe44e5bf07016439d42 |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/826ac4f11ea39d5fad5f34c64b08d8b97e4a2891 |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/54b5ef11b1eefc592db685dabe071be012b11658 |     
   armeb     |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/baee8896ce62e4aaa53b7ddbb5e6ef632c82ac93 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/6ddf15278228d994d866b22b8b581d69631fc909 | ORPH
  riscv64    |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/3bb44312200122334b959dc48dd02fd591ab9949 |     
    i586     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/14c65ddf792c96a6606319d819180d16700b6d26 | ORPH
 aarch64_be  |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/a7a15f3699e2bbef56ab232193937f64d73e8832 | ORPH
microblazeel |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/e95a1dbad02fa3fdd250cdec4ac34a505e0bb03f | ORPH
  powerpc    |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/55f1b64000110f43dd2bafdef6c5da524a7ab7a8 | ORPH
  riscv64    |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/91362350cc9e4ec8146f9be567b0a1edcb978706 |     
    i686     |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/7f67874bbd9c311f139e1c3aab3d31eddd79fcbd |     
  powerpc    |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/19d1171a76cd4789472b16aa24b44f58cd7e0a1e |     
   sh4eb     |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/574c2076b953806b5b20700d116d75d9dd1ac709 |     
   sparc     |     optee-benchmark-3.18.0     | NOK | http://autobuild.buildroot.net/results/7bb85578697cf7bedb79238e4162cca26acbf107 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/ae7efb30dc66a206ce89713332379b4fa72bdbad | ORPH
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d6562052542a66c359bfecd98e6e665ce0bc681e |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/99e8990eff50e80509ac426729ee10688fda5575 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/83149d0c16295ca6cb39870ba0380b0cd4038995 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/46b8278609fcf53aab4c203b9bbedbead906332d |     
microblazeel |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/c651c03bc493ac721ad6517ace550237488ef8a8 |     
   xtensa    |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/685f8b595fd26738a76942fc08d530d13265b802 |     
   xtensa    |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/bd4d91035ec10b187e80a9d2e46ec124b97e09eb |     
  mips64el   |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/b8c05bb8360f5a2e2110ce44039627fad2791a7f |     
    arm      |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/3dc2a9edf4bf5ef4233168ecc6395ba956eeb92b |     
   mipsel    |   python-cryptography-37.0.4   | NOK | http://autobuild.buildroot.net/results/c65ac4ea1bc7ce7288d3c6ae7ad19a82a20782b4 |     
  aarch64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/e7536b1c48da51e4b3e36731310cc940e5d67ac2 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1102d44a8286bf57fde31ade0557e8f54b5c43ab |     
   xtensa    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9b8fc794ca2b037e375aebfb8b09f083bd3a0c7d |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/ae237e747d960bf7060da41d63653f682ee11040 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/ea6c8e5efbc611f6bb6cd72c287d9a380cc7fc06 |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/7d2cb085b7e77058b6f01479edf95cbe0afa57c2 |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b95d4aadf3b2804a4a5b12f70f00331281755ff2 |     
    arc      | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/a4b2b8eb09a53a04f91059710a8f3bc14d5e15db |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2d7e603c01ef9bc035ab12f75ce9585e9120794f | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c867ed3e38311a62f66b3c756ab5717e6c559354 | ORPH
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/5e4ebde61212516792bc9867dea96fd9abdee94f |     
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/ef29fc0cf87bdd94835fe594dce7af224e70b640 | ORPH
   mipsel    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/0c22231ac0bb93ca370aea8787f57148bf267ebc | ORPH
 microblaze  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/49ceefd28a708ccabd6327267ecd63618793474b | ORPH
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/71435642c4a4e049687a571d6f41027f0f80f542 | ORPH
   mips64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/19a672a73497bef2f09706c8409f8f74728fd6f5 | ORPH
   x86_64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/59c1c74fa36260d906810950becf10cc019b175b | ORPH
   armeb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/bd6e7ab0d5390d32bb44fdd9c12f9d83dc3e11f8 | ORPH
   mips64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/4211243187b8227cda1e9bfaa67c30f5b14bf3a5 | ORPH
    i686     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/eb47e22a61662eddcb4af3449360822acad868ed | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d4462eea2832901f1bdb38256056a746f826029a | ORPH
    mips     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/84a7c50cf14a78637fdb1d87770fc0d8eddd7f1e | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/4a30180d43e45ee079507f15d5327551770d9d89 | ORPH
    m68k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/7f0605a82551e47d5266246a16d375b9cfe61f98 | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/510a0a0d0b294a76064cff06c9fa405287f846d4 | ORPH
  sparc64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d4600f03b9ce1a5d19b228555ba52aa3245fbfc1 | ORPH
  aarch64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/f3fcd211ebd0915f54474879cac3d83e7b13b61c |     
    arm      |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/aefd0e45867f0f01bf8140c40953c2484a2ef664 |     
microblazeel |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/3c39102a44cf176b84ad230b442be1700f86fbf9 | ORPH
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2efa3e61ab6aff492a0ab7cc3395a0a7cb2fa957 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4a493af7f070f0e06a5f7e21d6154302f258c05a |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7df1a7a7c2a70488cf26aba995f85d89a6d4784a |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3bf2acdb6bbca707d5f3b7c01d9df7d50a74833a |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ee1427f1510a2dc4b437312f45400cebd43713c4 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b51f47e28cbc972cccdbbf1b923476a42bc90d22 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3ae22cd160a77025aacc2658d7d40014fc98dbdb |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/e3b6e7d11652196302d2ea7f7566ef6c0a08dca9 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f72fdf3d054949a3bff5179793adc28703e10699 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6a8ff2d601abdc1c5aa6f2b946acc57f9dda6646 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/cf4d0faeb70256f21abae0057e1ea007faf5d5d7 |     
    mips     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/0d8c762d215e05003935a3be9444afb6121bd981 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/c0e39c083da8211cdcb628e41b65e5bbf9d8846f | ORPH
   x86_64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/e6baf7108590fd06259e8a76bd16baacab55beaf |     
    m68k     |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/77a496eb12a14709a74a10e8feff5c91198f6da5 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c858acc27396f3941453898adc0dd651116baf3f |     
    arm      | wilc-firmware-wilc_linux_15_7  | NOK | http://autobuild.buildroot.net/results/276c2b73c4bd2f36a74b3ffb7bf677cb1c555a84 |     
  powerpc    |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/ac19975f0bf77f4a8ca574c374092ba81cd5a332 |     
    mips     |            xenomai             | NOK | http://autobuild.buildroot.net/results/4b337ce2d511bed13ada867a6c841e8918c81051 |     
   nios2     |            xenomai             | NOK | http://autobuild.buildroot.net/results/b9ced77deb15e492a22e094035b43ce3274527d1 |     
  mips64el   |            xenomai             | NOK | http://autobuild.buildroot.net/results/a1e54da1db9bed3b456bda285e2b8783c7a4c6a6 |     
  powerpc    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/bdcd45b0cdd6fb218bec6d0a0e58b1d34a06e9db |     
   sparc     |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/2def996e807bc756079925154bf9958245d28706 |     
   xtensa    |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/36e1073e901bf9383f9b9a4a874d1af71d4225c9 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e9c772b3495ff21226b8b37b556d395ff86e83e4 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 3 
                       unknown | 3 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e98b1620c5e41fd6e0305c6c273ec771b0ad1d56 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7c9d78f6f7d08b3f9a1022086ad684548011703f |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0307598f5332c0aeaa272231611e457186bc7bbd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7fc9ad932f158c96cc16d45090e953be08acc07f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/664224eabc0e84360acf2389eac5f8bb84303bb2 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/ad3abd2cf0788fcdb0a035ccf5e5d15e34f0d561 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 6 
                       unknown | 4 
                host-go-1.18.3 | 3 
                libcurl-7.84.0 | 2 
           libfreeimage-3.18.0 | 2 
/home/buildroot/autobuild/i... | 1 
                busybox-1.35.0 | 1 
               libglib2-2.70.4 | 1 
             libopenssl-1.1.1p | 1 
                 luaposix-35.1 | 1 
                mongodb-4.2.18 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
                 pixman-0.40.0 | 1 
                    pppd-2.4.9 | 1 
               protobuf-3.20.1 | 1 
qt5base-f31e001a9399e4e6208... | 1 
              strongswan-5.9.5 | 1 
    toolchain-external-bootlin | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/7224c74dd5c6444767ee4a639edf458703b4b4e9 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/7656aa315f2b0d214123bbe9fe285a03f8b34770 | ORPH
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/0dadb8ec2e314442cf6ffb5d11f6d47efff56d3e |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/265d2fe23e83d85e65b31d85575ae6936a4f0065 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/77ca6978227d1c473893e162bdd386e5e4ee10c6 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/16e6bb68e14f1055a93bc88d8d88f4964983a7dd |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d5b8a8c0eded8f04bb4464673416bda83fd58603 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9624060149589901929b5f385fa6f2662f2774be |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cdcc5851c272f1b9ec5b4645bdcd317638fc61c5 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f3cff8afad71f46f113e1672fb8868fe13763bf1 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a5efebb7fb8ef6308de5eaec3c23a9c4ed1841f0 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/65661e8a1e11bca69dc9c275a20d4750a861aedd |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e3565c6b971be93579fbfcb54b0e4f62c0aa9694 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/90c105b66e9e7c760f1894d49849c58d551ef613 |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d6c6bf4e3b71932650e35e7e9a973e4c9489a933 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/ed3a8e56ec5fac57493480d9be9b54b6e01b898b |     
   arceb     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/e6846b16d305c86a5dd802fdc81cfde92bc8fcb1 |     
 microblaze  |         luaposix-35.1          | NOK | http://autobuild.buildroot.net/results/dc1238827c0596da43a189f7e306cd50a6900588 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/7360ec34e9c3972961854ab0f30d20ef7cb587a1 |     
  powerpc    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/759c00ece1cfaa24a10e475a88b61cab0c05fcf3 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/109732fc6d5c8f3110363b1306541fcc82a92873 | ORPH
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/44c62640d603f5e893e961fc5d59357506d6469f |     
    or1k     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/94d13c9e95d203d73b0ef93f1741f099d5a55a36 | ORPH
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/67a344e1bba6d0d3b6d394c6fe88b83b693c9209 |     
    i686     | qt5base-f31e001a9399e4e6208... | NOK | http://autobuild.buildroot.net/results/897c6b514315591ea5c7af527aaa65042182429b |     
   mipsel    |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/3004dd5ba9736feb4801061fb0d8eb74b2a50e42 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/14232c87b5f86c755d68b431d993cc11e09dd11a |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/49f046758f6ac8b9daa1ff558c8585a2989b2ec1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c88eff7327b7847424d0d987943ea80aff67beb6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/950f36b8c71601809a0394d7ff4c489883bf82f9 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/fe9b738941e1d6c54353a7a02eaaa1e8bea77683 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3097c956fdbe78b288ac62920e555427365d210a | ORPH


Gitlab CI results for 2022-07-26
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

