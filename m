Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58DFC46467
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 06:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2211082380;
	Fri, 20 Jan 2023 06:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2211082380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mH3-QzmMLZKQ; Fri, 20 Jan 2023 06:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFBD582382;
	Fri, 20 Jan 2023 06:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFBD582382
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9296F1BF82F
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 06:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52CA440176
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 06:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52CA440176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qv14f8l673f9 for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 06:42:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32F34011D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A32F34011D
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 06:42:32 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A9966C0007
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 06:42:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 06:42:29 -0000
Message-Id: <20230120064236.52CA440176@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674196949; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8wBo1fq+CF+GIhhbeuxL7jPA8q//kzxBzLQd3xKEfZo=;
 b=Sl3YvXxohi2gCP6qKkEkrz8HLXbme32T/TxEcRbJdiV8TIhop79vbqJbSKrwQDDRTXdppN
 Mev2FVEJQWjHW7pkLgok1+cduqTQ5RBvBPcQsfpPcUsgjhBH9AwgHRrra146CufuE038ep
 AqIaDAQfcOkhK8Xc8p4cD1SbfJJJ7rf4WjX1d5kxkOsDHrVQE407iduRUgpF6mzqKq10Cu
 dZp7rhJEQq5MBJgDu33hlq3Xncs5WQqFRUYd3MOIcY44YlGCOr2Hz8vcit29iSnkiCMAY1
 8sZK+n/R1ucndIdPGT/N+aoeisguRHhfxVmVBcT2hGnUqpoeOLOvvLpt48MOhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sl3YvXxo
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-19
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

Autobuild statistics for 2023-01-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  1  |  0  |  4  |
  2022.11.x  |  1  |  0  |  0  |  1  |
    master   | 124 | 233 |  0  | 357 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 29
                   bash-5.2.15 | 21
                     xz-5.2.10 | 14
                    fwup-1.9.1 | 12
                    opkg-0.4.5 | 7 
                    pixz-1.0.7 | 7 
             dahdi-linux-3.2.0 | 5 
                elfutils-0.186 | 5 
glibc-2.36-81-g4f4d7a13edfd... | 5 
            host-binutils-2.38 | 5 
              host-rust-1.66.1 | 5 
                  jack2-1.9.21 | 5 
                   linux-6.1.5 | 4 
                 openssh-9.1p1 | 4 
                    dust-0.8.1 | 3 
                      hans-1.1 | 3 
         host-sentry-cli-2.8.0 | 3 
              hyperfine-1.14.0 | 3 
                    opus-1.3.1 | 3 
                   perl-5.36.0 | 3 
                    bat-0.19.0 | 2 
                   ethtool-6.1 | 2 
  gobject-introspection-1.72.0 | 2 
                   gvfs-1.48.1 | 2 
                host-go-1.19.5 | 2 
               libglib2-2.72.3 | 2 
               lpc32xxcdl-2.11 | 2 
                  ntp-4.2.8p15 | 2 
           python-bcrypt-4.0.1 | 2 
            python-bunch-1.0.1 | 2 
    python-cryptography-39.0.0 | 2 
            quickjs-2021-03-27 | 2 
                    sdl-1.2.15 | 2 
                  xxhash-0.8.1 | 2 
               apcupsd-3.14.14 | 1 
  binutils-arc-2020.09-release | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.5 | 1 
                 coreutils-9.1 | 1 
               ding-libs-0.6.2 | 1 
                 dmalloc-5.6.5 | 1 
              erlang-22.3.4.22 | 1 
               fftw-quad-3.3.8 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                  gensio-2.5.5 | 1 
                gerbera-1.10.0 | 1 
          gitlab-runner-15.5.0 | 1 
                     gmp-6.2.1 | 1 
           heirloom-mailx-12.5 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
       host-gcc-initial-11.3.0 | 1 
               host-lcms2-2.14 | 1 
    host-python-maturin-0.14.9 | 1 
               host-swig-4.1.1 | 1 
           janus-gateway-1.1.1 | 1 
                   json-c-0.16 | 1 
                  kexec-2.0.25 | 1 
                       kmod-30 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                    lcms2-2.14 | 1 
      libabseil-cpp-20220623.1 | 1 
               libdeflate-1.15 | 1 
              libgcrypt-1.10.1 | 1 
             libgpg-error-1.46 | 1 
          linux-5.10.145-cip17 | 1 
             lirc-tools-0.10.2 | 1 
                 mesa3d-22.3.3 | 1 
                 nerdctl-1.0.0 | 1 
                    norm-1.5.8 | 1 
            ocf-linux-20171122 | 1 
                 openal-1.22.0 | 1 
           optee-client-3.19.0 | 1 
                   pcre2-10.42 | 1 
                    php-8.1.14 | 1 
                   psmisc-23.5 | 1 
                 qt6base-6.4.0 | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
                 rtl_433-22.11 | 1 
        s6-linux-utils-2.6.0.0 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 
                    vlc-3.0.18 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cbe8d2fa87852a102eb492d8f6674cc632ab28ea |     
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5c109dd48528e4698a5dff9bf0c76ff15af76b6e | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/114af9283dfcef0fcadf0fe9576d234bd4378551 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8f1ff6aaac7d88f0502eff957cf9cd48da5cced3 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/fd440bc22ef6c19a4fa4ee0198fb4a1211725b5e | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5e24aabb07cd366c2b46d13ca27d84cfa6bbdbcb | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0002ae1a3f79b62325eed92cb65c355819dfae49 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bb7d1d21c1daffe580e72e5ea7cbf51cabd0ce96 | ORPH
microblazeel |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9490a360249c518240ade34f92b0ba8caba35133 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/460f7fb2845aa456f0267961d67373de59ce47e9 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ac2857a500cf47f4bdd26a2e6e5771779e720f2d | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f3cd6be11c31a2978eb33fb90b12616a3e59de35 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/269275b9ec2a7c876781500f8655c4b48c9696dc | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/576ccded2eb24f1f61f65ef2c81f3d31f75b3d18 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/78c1360aff29a0e83ca7711d07454bc4d05b7689 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ee3a29b4be76849e58ac81d50d45e18b47d1c825 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c92903a3eeef76c7ec020c9c8215d20c4df634fc | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f336effb0d6895f3fb91327bd6d46102858bd71b | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6c5152dc05eea4a1187a4d37e3bd5d658cd3c9ff | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0a48798ccd911e3b5d51f74d90dc14839cc82225 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2449cfc517f3d5f1e4308cfea465f58b9c760348 | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b1d272416d544ef74b6581e03bcf304affa21f57 | ORPH
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4b16bca08c6be18e38cb2fca40e9f6ff20e06d9b |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/9f38ef2f241a97d907bdba5edf3f9863551270ab |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/5df7099aec9b3b9bf4b974b5e697774dbe59bbd4 |     
  sparc64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/73815f7241afd98078b1b3f148925c1bf443f1b3 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4c38c55b6c7700552a9600f450cd2bc15673d2d3 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/86497d099cfc62498ece975a98ac2c39eb7c5529 | ORPH
 microblaze  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/d82b5ae9c7aeb16a30972e8e0761d6183350a602 |     
   mips64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/bb50f8ea6dec71990ed64ad693c18db616ae3919 |     
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/6493896c34a3b2d354ac3e693c4338abe5b1db10 |     
    arm      |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/f7af1e78adec3c6c9569809adb8076e9c61bff80 |     
 powerpc64   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/404cf6d1ead1b3915c2e64fd94955d74819ce46c |     
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/3ca252a7870a9598e68a689c9b66ad8e93864e20 |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/2bc5426cf9784bd55b87c9755b073aac65179c17 | ORPH
   x86_64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/76dbebb83d3769288e098ccdaa4263f844d47310 | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/1210ff6fc64f81d33707487575752a1c5df8bb26 | ORPH
   mips64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/de5a4b657fd46eee10a43431620326e6b8fb8028 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1b65fdbf9f0dad2243006b4096774a18a707d6bf | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dc5ce241f71caa220937eee9037fb433bea6ede3 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c6e2b8f489d2a2e2af6d1c2e2c3cf26a062796bf | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1fb68b04c45d9cea22aa9762c10cf51e69daa431 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3b906d061d0ff3dce13c583dc6005677e5d401d8 | ORPH
  powerpc    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/6b9ed6b882727ead0a7ed32ea9349360445fc567 |     
    m68k     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/06be68762172621ae7ca3164bd40aee8ad6a4ab5 |     
    arm      |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/ec88a7da4fdaabc9b8f02004c340f9850e4898c5 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/1243bdbcb7ee810c89cd654e29f34da987091122 | ORPH
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d1068901e3798129ed7e10b5848b566c6ca30a0a |     
   sh4aeb    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3682cbc94847c83430f6f1a9b137717dfaa95116 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3f35d75243a9a0e16232b2d0ecc53823f11fa745 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/bee14527ea73b76e4029424b5a72671d43589001 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5e1363bbb443a03ff6f07f864651c474673634c2 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9e734faaddca5ce122ac9b996b2586852774f25d |     
    sh4      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/182260fd86497fdd8d3c3946c9204b265ffdf830 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b46546adff4ce3abc8892bd4cc45dae7ed2f8641 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6e5de02adc0f5ef8bd1e4e22ad361694acbff01d |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4839cbef8b6768a761fe9a77c96243ee561c0263 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fe13f30ad6ab0d1bc9ff45ecd57c793f3140191b |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/479a2f2f5acf6bdb99047d0f5b58f5c6e45171fa |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ab4a1e9cf5ce2ccdfb2af086bb57279ea82c0515 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/40b33131eb5a0a98cba4feeeb96541aa9bcdb3cd |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3062bd74375b05d317512035f007370f49041c53 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c3af923445d9b14fe3b6fa049a86523d025ad428 |     
    m68k     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/acc01a507d4bfa6d2b27f54071ceed41fc4d85f0 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bca12337503669243d666fc4adad197d75c6fcbb |     
powerpc64le  |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/01b7079f9bba5ed69e31adcb83daefece07561ed |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/ccbc275391c1d2073854e8dcac666adb0bd98cb9 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/def2a17095d865ecb0261cc59d0052af59191664 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/ff6c8c42b5cf195ec47b4a2873991d727b6971fa |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/8812ea70f4752ea7bee179a3b9b5b7f158a93358 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/a7f7a03d94f1c622e822d79fbee9a5a0a28c150d |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/fed27b35aacd6e805180be3a03ad56ec290fd8cc | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a592469c6c1ada8a37966bb409af55592adf1796 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f51652ca1efff23578e636d26a3279db627809e1 | ORPH
    sh4      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/ddc66b9e93534e8e5f86e1f984cdd13e53b8cd00 | ORPH
   sh4aeb    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/b5cb30f8b206a6fee24808f31ce74d42fc3d154a | ORPH
   armeb     |            hans-1.1            | NOK | http://autobuild.buildroot.net/results/9148ef79f171b9207e219e6443c2263e9f0c65bb | ORPH
  aarch64    |            hans-1.1            | NOK | http://autobuild.buildroot.net/results/23274850a5c9bf84b7ffb4047e1514d4787b4c01 | ORPH
powerpc64le  |            hans-1.1            | NOK | http://autobuild.buildroot.net/results/e531925d94010d2466947d422af592760c54ae68 | ORPH
    sh4a     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/c9de37dcfc78f03da04470f8fa7f449c01b63642 |     
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c9e2a20870a10b8fcbe23fe452e7457719d6ae78 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/eb4b4f8724170c493b429e603820ab895a747a1c |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d0a1e63d99214269a02ed4068db24183b725fb85 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/203a541896eb7ced7b47ae822fa520ba8bbd45cf |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c701a131a538aab347ca7b9273e87c6be7ebd1d8 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3d78d025f37a57979289470e3d6dcce56435f156 |     
    arm      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f0e89053f463cc719092afc46a2d664db5d80b53 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/03b6cbea96aca6c7057bca4b686436852e872f5d |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0e8f33b56dca8547599250970a4f08dec0a7b1e4 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a44e10c03db7c01ea2af41f3f7e5bacb5341f4a2 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a959b11351d85d4ae061969f3a700e25a7abd3b2 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c2ad1a5261c3e903dacbeba4d04a2a89a5ae4860 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dad22fba37c69be383805378f0d399fc27f2a3c8 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f4ffeb811bbc09589c4d8607eac0fb2889bab7a5 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/97424625c0b2f67008a060cd788362b44525f1cf |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9f5f2bd552a6cd2db2e628a5f1d720738a30f994 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/42c274781aa80be62905190ac3c5340dd97e1a3e |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b0de8ee3e4e618353f137ddaf8a41bd45036c496 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/18468a3a410765e6e69562f573fb9b75c29c8e17 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/72ec99070a76d01075b371c5e7761ab479ed9fd6 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6cd1f420c4c59e25a79f3c0d60ec210ffeecd12d |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7ffb3833885d9efb582030bcd85f2a76393405fb |     
   sh4eb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bacad4bca4e5fbc58ad5cc11c2e57b9c42574cb2 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/36c74e5a95cb59f965128f274b6bfb86b4465ec4 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/663925bb9bb4926f2a452693ce8fe9adaf728a71 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/28353b19481472a1c28aeef04f930f41bf3e7b2c |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7d3a8dbc8262da7bd6d12a323074f838013b422a |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2a46682f6ea373fa603f4b0665a26f5477e91086 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a8b4358d921b4f5ef8ce9fb5c7c03b0ef55875bd |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/271e6ce2491c0d1cdc8862c1c7c2a182bc7026e4 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ea446c3fe442b8cc6d9ba3281486f76bde4a229b |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/649c4f297792047f44946d00ab4b84a028b0a78c |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e2262e9a1eeee8994278d524abb01e8811c356c3 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6259394fd3fe18b2c7ab1c7a1bb24797e13051ae |     
  riscv64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/221714ff1bf795d5c93ad02593fb49d9286162d7 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/889a321f96ffe6901e4d5822448e8a394494f7e9 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1a64e2d6698e583af6bc12f6ad780330e9a594ba |     
    sh4      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/57eb8c579194962c9067f4ad32caa5c668a29aad |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/0da4c94e3e4f1105d56f9c38d63da6b07b2c5890 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/8e290383203fecc210bbd8faa174ef3b051d6923 |     
   mipsel    |        host-lcms2-2.14         | NOK | http://autobuild.buildroot.net/results/e2f304054023a9c3d0d32fa985ff31293203c7d4 |     
  sparc64    |   host-python-maturin-0.14.9   | NOK | http://autobuild.buildroot.net/results/4f2b50eda97604c2e1ff22a12679af47fa54529b |     
   armeb     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/20cbbcc9a9b1fa821dd68f48e17feb6b0503be38 |     
    mips     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/85110fc6dbe91b569e1a1b0dfd12c4be88a49e63 |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/28f6aaa09218c178efe5feb1bc58f9501b34159b |     
   armeb     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/3b49d081a3044c2dff420d1dea34b2eb8ce144ff |     
  mips64el   |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/d712d61870a10e1145295a6102b179752a89ab20 |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/704ce0edc6eb3548da41b255ebb7b46bd8fb9a22 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/2c350daaffef89da511480620a10637f211ea593 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0f2edde212d38d2bec4f8324f3d35da94ec1d802 |     
    m68k     |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/fe0dee3ce57080acdd7bc56a612f8598e02ae6db |     
  sparc64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/a17346e84a7cd0a6d3418083858e95d1514933d6 | ORPH
   s390x     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/780b42fa8e0deca2837575a22bba6214c75404a9 | ORPH
    arm      |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/751b57e78f8be8ea383f2bc5e1f62c3ac6e65f79 | ORPH
    i686     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/670da1fadf9f992401f97532848c1e466c0ba8cd |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/595ed41917e2f3453e33749cac9b2d88f150acb1 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c5f72f1943ee09da4ea4e877963dd54e31a37db6 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/281eb1dbfb9b7d72b92048e6323f60c0508149f8 |     
    sh4a     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a98fb976c4f38e35a10f527842245c046b52bd08 |     
   sparc     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/9914d612b2ad7896c75deec2d67696da5ff42947 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/4934acf9070a90246168b267a8b205d7655b505f |     
    sh4      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/c3b0a5b0d3723dee03fa279a1dfea0589a944db4 | ORPH
 aarch64_be  |            kmod-30             | NOK | http://autobuild.buildroot.net/results/9474c297ede97b743eccb5008956ac19a8c7bfcc |     
    i586     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/665ebb10c86d95abd1cbfaceb7f9d8ccc5e7bb00 |     
  mips64el   |           lcms2-2.14           | NOK | http://autobuild.buildroot.net/results/7ffbcf21bc80b85ba206b4eda2877f70a182e5a1 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/50b75cae3bee91300a4d9e1094d2c5c24e3392ce |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/a1c188a2261295a8caa9e77a06e79b52dfa2aa8d |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7517fbec162166ddbe6f48279faa6a46f5d1a89f | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/313e9df312a81969c5a89159e887b47eab5c3b57 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/00b402d7a7ac8e19a29b9fb9bbbd00f2ed1f7afe |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/9fb606c7ee5d09021b7e0e977bd482ad7fcccf8b | ORPH
   xtensa    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/bd7c3d2eddb4552b8572440d32a482eb1ba75bc2 | ORPH
  powerpc    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/39635818555eb430398be36b25918c75b9fe64c7 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/78bb83c39c6f337b8ccc84c234d872bd5e31c569 | ORPH
   nios2     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/365da2d35621827202cc37ebff5d9796ed47fa51 | ORPH
   mips64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/9b8460ee8ee23e9a6ac3399e503aa83c568f0df0 | ORPH
    arc      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/abc3615dbe155a4aaedfd5e6aa4d5ac93087733b | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/236ad7890ecd6992255483016f45ae4d93794bf2 | ORPH
    arm      |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/ad109a6ceaa2c3a8a7935b64b994cb71d254d97a | ORPH
   nios2     |         mesa3d-22.3.3          | NOK | http://autobuild.buildroot.net/results/92d8e7e726205fd37909841601f06e837ea6f154 |     
   s390x     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/130a1bf075aca5563794d7c4ba2916e2fde2950a |     
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/799384769932a3f7d5ca1824c2fb313e4c3e991f | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/fa758e2d7bbac86a5ddd538ef98778a6d11da718 | ORPH
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/073e6aca7ac72dd3afa1657b53df85cdd0ea39f9 | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/fa55b6a9f9c1dabb9b0e30730938bd7c6f842050 | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/4040f4128f288fd170fd8fa7c666738d0a7d21f2 |     
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/7d26655ba15fbc9037e0a4b4e8e8b183808db4a4 | ORPH
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/be2f5694210f4065663802564a1fe2f8fb3b34ba | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/6bdbb6bef77204861c26b7144e2655557052121c | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/3afe7962f0301c09e215b38bbb7ac5263d53fc60 | ORPH
  aarch64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/54382baf65ffca9a48255944be815becf8c40215 | ORPH
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/4e7911164f747883c479eab90b706630b7ff01ad | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/c170715fe2a9a6fd556272d37b5b3b307dc854d1 | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e3b36bf8162f8fba1cc9319d615c196da445a555 | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/9f96b7b26c94d1034551fac21524ddd9840c0ed6 | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/34fbaacd3f4e651c02df1d1b3c0907fd92bf2eb3 | ORPH
  aarch64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/8be69e21f721642940a00924b5e32a3708c5210a | ORPH
    arc      |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/1936f534086bd029f643bf5ae986619463bc5693 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/7df19824992eaeb332ffc34658a65c34b5f4d474 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/fcc6ca105a7fc58096e44a5c232d12579e5037d8 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/d4ab1a4db07080549fd9dd386b2a60a1ae4afca8 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/ea1dd4ff84e7f1e888cf8d7379ce4b625cabaec4 | ORPH
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/bdd7a9a48b9bcc8ab59fbc80c5140d70f0052ce4 |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/6ad77f6e63cdb4d0f735b2bd0f6ac491ccd3dd35 |     
    m68k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/d873927e561dfb1d6a1d760886a508ff96078342 |     
   armeb     |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/f1f0414e07edcc3573e5ce76853dbf072224ead0 |     
   mips64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c3d5c57ccea1eeaacb7650175744585428ea7eb7 |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/07ab7207a81a454beff7d740ce577361e1a40008 |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/e365ce450d4f3661d2e51b28f4658400c2899a32 |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/1308a2823dba24c1174d5a862bde2775700277e9 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c77342606aeca4cd69a8212e74d00f9331d8f2a7 |     
powerpc64le  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/f2deddf345040ce14c78d55808812fc69685c106 |     
    sh4a     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ea98e9e180fb58cd4354daebcb4ecfd6ef2a874a |     
   nios2     |          psmisc-23.5           | NOK | http://autobuild.buildroot.net/results/bb070c9e6bb65d941016c125644f521fb4ec2119 | ORPH
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/8e27dfe52f34aa247bf8ee06c47c5d1b4a66b135 |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/9c3f3576b839c50511b39b9b3774c0afff85f5c2 |     
   s390x     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/c6fdff6618c6c1260cc0b503e695ec34581ffe23 |     
 aarch64_be  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/f25b7150664c2f448744a28572773f4db4508efd |     
   s390x     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/3fc174f39a18632bd1f1019b2e828168defa5c14 |     
  sparc64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/f692025aaee1e1313a6489e5345e3fa1d9d16ec0 |     
    i686     |         qt6base-6.4.0          | NOK | http://autobuild.buildroot.net/results/685751bbdc91dbf690a3a0689f06fcc769863128 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/fe93994066029146376821eaa460d793e825fb47 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/e8dd8b84bf246b5e625ca4cd45a921dcf4562460 |     
   xtensa    | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/93f5ddcd87b8635f705595315155496c66cdd552 |     
  aarch64    |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/f8ab248d313884b9ba9bb7c0ec04d7d201384043 |     
    arm      |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/62c8a232f55dbb16513e844d9b7e8ba99ed2baee |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0aaedbe8624ecf934b8cfaae1aacb011c5cff3ed | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/a0f59c60489be7896ca3054550121bfabec42e60 | ORPH
  powerpc    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/fe068d915f1a987cea65da57ed0d1f3bbdccd0c2 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/7a92a977646a81b05a3590245ad05986b43b0093 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b77fac335f3731a2e11fc54f1e24ccfb864b16c7 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/e9a0b77c67b371b4621a76dc131a157d3bffa26f | ORPH
 powerpc64   |           vlc-3.0.18           | NOK | http://autobuild.buildroot.net/results/85c9231c9e943eb19c08bb85b9681d5b852063de |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/3a5fa0ab307ca2377b04f256004a8ba908f5b43e |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/488fcf4e957e52b57f706c3097ae2f95c3004f3e |     
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/6208c8bda86381a5ad981e01bb85726d8c07322e | ORPH
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/953133575d8c13266f1450fa545e70e4a518508d | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d7de443616d37a8336715721314db09899764765 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a5777ddf343d5a53d85f966605bab30de4e09347 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3f4fdb314ed93f43838777a68c79f18a19fe7b00 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6578ee0d9953d59202dbf352294da2707a29a38c | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1c67f149856d144ab93621c912d762a25fb1f7a6 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/665fc1833c152c1600c31c28e7d0b6f5b09a9517 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/afb4ddc8d21fde89636aff121e953c0a878870ef | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/f963388d80a05d73607a1128fbfa6083b2e9f299 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/90324fbc1c465a4d8e758500bb9afe61cd94c79b | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/79c5aa5a7e6714fd258f3c87f77dc5254d7dd4f6 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/4117ec3b80ad17e90ab171dad7a5f611cb7e34c0 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/422712eb5504c9a0735b6f1841c982e77f514105 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/318237db8d6a2c34bd1423dc2bd5f8379c260564 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/79cb65e19709ae1352168043273bfbf47a91720a | ORPH
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/7aeff9d3126c667c4bf081069a7f592edd352541 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/7103cdb974fcbd33aa0415ebe1aa50dc5a8577d2 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1dc51d21a01804ae8196a7955b5f5e06037b39c6 |     


Gitlab CI results for 2023-01-19
================================

Detail of defconfig failures for 2022.11.1
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224112  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224114  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224116  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224118  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224122  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224126  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224128  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224129  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224131  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224130  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224133  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224134  |      


Detail of runtime-test failures for 2022.11.1
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        DetectBadArchTest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224149  | ORPH 
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224136  | ORPH 
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224137  | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224526  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224528  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224529  | ORPH 
                 TestAtop | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224239  | ORPH 
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224241  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224803  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224245  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224184  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224185  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224186  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224187  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224188  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224189  | ORPH 
             TestCpioFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224190  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224247  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224249  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224250  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224252  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224138  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224254  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224191  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224192  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224193  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224195  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224543  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224544  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224545  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224546  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224547  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224548  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224549  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224550  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224551  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224552  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224553  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224554  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224556  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224559  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224562  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224565  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224568  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224570  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224572  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224573  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224574  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224575  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224576  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224577  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224579  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224580  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224581  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224582  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224583  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224585  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224586  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224588  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224590  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224592  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224593  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224594  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224596  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224597  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224599  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224601  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224602  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224603  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224604  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224605  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224606  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224607  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224608  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224609  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224611  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224615  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224617  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224619  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224621  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224624  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224626  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224627  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224628  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224629  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224630  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224631  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224632  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224634  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224635  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224636  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224637  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224638  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224639  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224640  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224641  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224642  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224643  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224644  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224645  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224646  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224647  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224649  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224650  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224651  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224652  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224653  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224654  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224655  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224656  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224657  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224658  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224660  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224661  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224662  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224663  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224664  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224665  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224666  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224667  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224668  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224671  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224672  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224674  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224675  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224677  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224678  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224680  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224681  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224682  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224683  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224684  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224686  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224687  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224688  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224689  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224690  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224691  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224692  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224694  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224695  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224696  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224697  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224699  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224700  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224701  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224702  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224703  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224704  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224705  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224706  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224707  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224708  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224709  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224710  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224711  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224713  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224714  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224715  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224716  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224717  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224718  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224719  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224720  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224721  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224722  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224724  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224725  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224726  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224727  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224729  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224732  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224733  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224734  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224735  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224736  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224737  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224738  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224740  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224741  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224742  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224743  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224744  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224745  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224747  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224748  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224750  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224751  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224752  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224753  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224755  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224756  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224757  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224758  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224761  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224762  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224763  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224764  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224765  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224766  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224768  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224769  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224770  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224771  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224772  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224773  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224775  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224776  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224777  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224778  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224779  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224780  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224781  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224783  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224786  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224788  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224790  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224793  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224796  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224797  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224799  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224800  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224801  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224531  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224532  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224534  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224536  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224538  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224540  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224541  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224542  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224196  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224150  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224151  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224152  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224256  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224258  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224261  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224264  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224266  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224804  | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224175  | ORPH 
               TestGitHub | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224178  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224179  | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224176  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224172  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224173  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224268  | ORPH 
       TestGrubAArch64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224139  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224140  | ORPH 
         TestGrubi386BIOS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224141  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224142  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224270  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224271  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224243  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224273  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224217  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224218  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224219  | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224220  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224221  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224222  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224223  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224224  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224225  | ORPH 
...mdRoIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224226  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224228  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224229  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224230  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224231  | ORPH 
...mdRwIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224232  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224233  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224234  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224197  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224199  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224200  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224202  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224204  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224206  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224207  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224208  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224209  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224275  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224281  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224298  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224301  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224276  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224278  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224284  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224286  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224288  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224290  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224318  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224321  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224295  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224323  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224306  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224332  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224309  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224340  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224343  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224292  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224326  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224345  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224313  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224303  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224350  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224500  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224311  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224282  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224300  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224302  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224277  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224280  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224285  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224287  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224291  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224320  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224322  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224297  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224325  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224307  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224335  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224310  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224341  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224344  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224294  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224328  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224346  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224316  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224304  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224502  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224519  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224312  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224347  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224349  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224352  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224354  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224357  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224174  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224210  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224359  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224361  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224362  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224363  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224365  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224367  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224368  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224370  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224371  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224372  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224373  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224374  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224375  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224376  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224379  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224380  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224382  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224383  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224378  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224385  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224386  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224388  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224390  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224392  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224393  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224395  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224397  | ORPH 
          TestPostScripts | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224160  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224399  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224401  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224244  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224469  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224403  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224404  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224405  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224409  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224412  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224457  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224406  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224407  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224408  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224410  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224411  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224414  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224415  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224416  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224417  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224418  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224419  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224420  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224421  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224422  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224423  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224424  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224425  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224427  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224428  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224429  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224431  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224432  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224434  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224438  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224440  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224441  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224444  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224447  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224450  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224454  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224274  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224461  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224462  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224463  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224468  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224471  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224472  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224474  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224478  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224484  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224482  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224487  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224488  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224490  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224491  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224492  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224494  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224495  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224496  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224497  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224498  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224485  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224466  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224499  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224153  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224154  | ORPH 
         TestRootPassword | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224161  | ORPH 
        TestRootfsOverlay | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224164  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224503  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224505  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224507  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224509  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224510  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224511  | ORPH 
                  TestSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224181  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224166  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224167  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224169  | ORPH 
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224171  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224235  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224237  | ORPH 
                 TestSFTP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224182  | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224211  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224213  | ORPH 
 TestSquashfsMinBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224214  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224156  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224158  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224514  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224143  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224144  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224146  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224148  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224515  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224517  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224215  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224521  | ORPH 
               TestYaffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224216  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224522  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224523  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224524  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620224525  | ORPH 


Detail of defconfig failures for settings-v1
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227226  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227228  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227231  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227233  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227234  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227235  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227236  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227237  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227238  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227239  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227240  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227241  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227242  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227243  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227244  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227246  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227247  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227249  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227250  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227251  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227252  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227253  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227254  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227255  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227256  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227257  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227258  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227259  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227260  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227261  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227262  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227263  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227264  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227265  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227266  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227267  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227268  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227272  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227270  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227274  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227276  |      


Detail of runtime-test failures for settings-v1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        DetectBadArchTest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227294  | ORPH 
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227277  | ORPH 
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227279  | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227700  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227701  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227702  | ORPH 
                 TestAtop | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227424  | ORPH 
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227425  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227955  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227430  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227329  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227330  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227332  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227333  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227334  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227335  | ORPH 
             TestCpioFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227336  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227431  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227433  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227435  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227437  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227281  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227438  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227337  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227340  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227342  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227344  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227712  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227713  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227714  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227715  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227717  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227720  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227723  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227728  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227729  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227732  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227733  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227735  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227736  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227738  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227739  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227740  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227741  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227742  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227743  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227744  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227745  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227747  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227749  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227750  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227751  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227753  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227755  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227757  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227760  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227761  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227762  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227767  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227770  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227772  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227773  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227774  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227775  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227776  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227778  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227779  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227780  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227782  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227783  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227785  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227787  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227788  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227789  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227790  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227791  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227792  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227793  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227794  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227795  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227796  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227797  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227798  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227799  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227800  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227801  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227802  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227803  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227804  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227805  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227806  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227807  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227808  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227809  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227810  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227811  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227812  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227813  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227814  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227815  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227816  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227817  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227818  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227819  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227820  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227821  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227822  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227823  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227824  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227825  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227826  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227827  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227828  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227829  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227830  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227831  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227832  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227833  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227834  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227835  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227836  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227837  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227838  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227839  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227840  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227841  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227842  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227843  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227844  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227845  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227846  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227848  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227849  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227850  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227851  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227852  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227853  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227854  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227855  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227856  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227857  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227858  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227859  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227860  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227861  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227862  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227863  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227864  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227866  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227867  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227869  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227870  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227871  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227872  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227873  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227874  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227875  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227876  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227877  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227878  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227879  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227881  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227882  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227883  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227884  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227885  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227886  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227887  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227888  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227889  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227891  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227893  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227895  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227897  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227898  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227899  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227900  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227901  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227902  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227903  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227904  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227905  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227906  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227907  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227908  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227909  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227910  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227911  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227912  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227914  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227916  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227917  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227918  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227920  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227921  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227922  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227923  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227924  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227925  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227926  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227927  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227928  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227929  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227930  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227931  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227932  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227933  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227934  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227935  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227937  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227938  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227939  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227940  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227941  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227942  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227943  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227945  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227946  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227947  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227948  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227949  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227951  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227953  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227703  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227704  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227705  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227706  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227707  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227708  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227709  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227710  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227346  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227295  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227296  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227297  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227440  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227441  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227443  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227445  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227446  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227956  | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227321  | ORPH 
               TestGitHub | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227323  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227324  | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227322  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227317  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227319  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227449  | ORPH 
       TestGrubAArch64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227282  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227284  | ORPH 
         TestGrubi386BIOS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227286  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227287  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227451  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227452  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227426  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227454  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227386  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227388  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227391  | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227392  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227394  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227397  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227399  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227402  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227403  | ORPH 
...mdRoIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227406  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227408  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227410  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227412  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227414  | ORPH 
...mdRwIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227416  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227418  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227420  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227348  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227349  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227351  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227353  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227357  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227360  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227363  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227364  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227368  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227458  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227468  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227495  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227501  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227459  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227464  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227471  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227476  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227480  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227482  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227525  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227527  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227492  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227530  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227510  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227537  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227513  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227540  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227543  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227488  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227533  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227545  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227520  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227506  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227551  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227682  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227516  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227470  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227497  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227503  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227462  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227467  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227474  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227478  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227485  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227526  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227529  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227494  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227532  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227511  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227539  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227515  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227541  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227544  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227490  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227535  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227547  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227522  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227507  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227683  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227693  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227518  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227548  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227549  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227552  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227554  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227555  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227320  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227371  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227557  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227558  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227560  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227561  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227563  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227564  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227566  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227568  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227569  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227570  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227572  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227573  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227576  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227578  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227581  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227585  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227587  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227590  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227580  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227592  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227594  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227598  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227599  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227602  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227604  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227606  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227607  | ORPH 
          TestPostScripts | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227305  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227608  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227610  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227428  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227663  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227611  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227612  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227614  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227621  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227628  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227656  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227615  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227617  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227619  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227624  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227626  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227630  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227631  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227632  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227633  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227634  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227635  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227636  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227638  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227639  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227640  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227641  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227642  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227643  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227644  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227645  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227646  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227647  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227648  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227649  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227650  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227651  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227652  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227653  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227654  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227655  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227456  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227657  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227658  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227659  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227662  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227664  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227665  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227666  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227667  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227669  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227668  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227671  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227672  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227673  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227674  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227675  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227676  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227677  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227678  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227679  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227680  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227670  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227660  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227681  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227298  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227299  | ORPH 
         TestRootPassword | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227307  | ORPH 
        TestRootfsOverlay | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227308  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227684  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227685  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227686  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227687  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227688  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227689  | ORPH 
                  TestSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227326  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227309  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227311  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227312  | ORPH 
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227315  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227422  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227423  | ORPH 
                 TestSFTP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227328  | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227373  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227377  | ORPH 
 TestSquashfsMinBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227379  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227301  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227303  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227690  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227289  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227290  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227291  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227293  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227691  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227692  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227382  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227694  | ORPH 
               TestYaffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227383  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227695  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227696  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227697  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3620227698  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
