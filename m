Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178F2C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 05:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65E654221F;
	Fri, 14 Oct 2022 05:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65E654221F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vX4dUBg0ORia; Fri, 14 Oct 2022 05:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DCEC41DB5;
	Fri, 14 Oct 2022 05:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DCEC41DB5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11D9A1BF2FD
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 05:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C12B360888
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 05:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12B360888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlHbiUDT-UWm for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 05:44:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BBF660803
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BBF660803
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 05:44:52 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6A85324000A
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 05:44:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 05:44:51 -0000
Message-Id: <20221014054456.C12B360888@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665726291; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YOLUowWzuFTUpRtHndln/2OLql/mJpi69GsRhhCnSRE=;
 b=Hx12caLc7i7LH7Diw9acsPYkoYSnjIHnWAe1LLyWUo06BCVi7fVdzlDMClMIiE628XmaCW
 /vzhogikbhqSZe1gFspZ2I/CWjS1+rhmErNduynj4xaQ1iS1hcIWo0iCDfFVIv+XOogc75
 qRwC2Vfhz6LxpK8GrkyyDM3pPtsCtsvorfZQdhEPY9CImhYs9QV3jMk2EUDFh04xDWCYOc
 ypniK/0IDShbhhoM66olvW0i16ZNvPoacIiw3+kg3uzBd2sZlCaL9qYPe4ooBZXwvhzTXA
 YLGUVizxNdtvC9/isHVKfUbxLppdfDyk/X3oKRajsE587Dw3cukrsrQUCwseOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hx12caLc
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-13
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

Autobuild statistics for 2022-10-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  9  |  2  |  0  | 11  |
  2022.08.x  | 17  | 11  |  0  | 28  |
    master   | 98  | 744 |  9  | 851 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-44-g2628500f5dff... | 313
       host-gcc-initial-11.3.0 | 49
                   bearssl-0.6 | 26
             berkeleydb-5.3.28 | 25
         coremark-pro-1.1.2743 | 23
                   slang-2.3.2 | 22
      ca-certificates-20211016 | 18
        host-f2fs-tools-1.15.0 | 11
                   libnss-3.83 | 11
                      crun-1.5 | 10
            host-binutils-2.38 | 9 
                        brltty | 8 
                elfutils-0.186 | 7 
dahdi-linux-5c840cf43838e06... | 6 
      gmrender-resurrect-0.0.9 | 6 
               libglib2-2.72.3 | 6 
                    sdl-1.2.15 | 6 
                       unknown | 6 
           dmraid-1.0.0.rc16-3 | 5 
                     efivar-38 | 5 
            host-binutils-2.39 | 5 
            igd2-for-linux-2.1 | 5 
                 musepack-r475 | 5 
                     fbset-2.1 | 4 
                    frotz-2.54 | 4 
         host-gcc-final-11.3.0 | 4 
                host-go-1.19.1 | 4 
              host-rust-1.64.0 | 4 
        host-sentry-cli-1.59.0 | 4 
libsvgtiny-ea9d99fc8b231c22... | 4 
                    zstd-1.5.2 | 4 
                  boost-1.80.0 | 3 
            btrfs-progs-5.16.2 | 3 
                 dash-0.5.11.5 | 3 
       freeradius-server-3.2.0 | 3 
         host-protobuf-c-1.4.1 | 3 
                jhead-3.06.0.1 | 3 
               libcap-ng-0.8.3 | 3 
                linuxptp-3.1.1 | 3 
                openswan-3.0.0 | 3 
          refpolicy-2.20220106 | 3 
                  umtprd-1.6.2 | 3 
                    zeek-4.1.1 | 3 
              alsa-lib-1.2.7.2 | 2 
                  autofs-5.1.8 | 2 
             batman-adv-2021.4 | 2 
                  botan-2.19.2 | 2 
casync-4ad9bcb94bc83ff36cfc... | 2 
                     flite-2.2 | 2 
                  gensio-2.5.5 | 2 
                gerbera-1.10.0 | 2 
                   hdparm-9.63 | 2 
            host-binutils-2.37 | 2 
       host-gcc-initial-12.2.0 | 2 
host-pahole-73383b3a39afe86... | 2 
      host-riscv-isa-sim-1.1.0 | 2 
             libgpg-error-1.45 | 2 
               libmdbx-0.11.11 | 2 
                     linux-6.0 | 2 
                    musl-1.2.3 | 2 
                   nanocom-1.0 | 2 
                  ntp-4.2.8p15 | 2 
                 systemd-250.4 | 2 
                 sysvinit-2.99 | 2 
               tcf-agent-1.7.0 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
               apcupsd-3.14.14 | 1 
                    attr-2.5.1 | 1 
                    brltty-6.5 | 1 
           crucible-2022.05.25 | 1 
              dieharder-3.31.1 | 1 
               ding-libs-0.6.2 | 1 
                   duma-2.5.15 | 1 
                     file-5.41 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
                    gdal-3.5.1 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
                    gpm-1.20.7 | 1 
                       gsl-2.6 | 1 
                      hans-1.0 | 1 
        host-berkeleydb-5.3.28 | 1 
              host-delve-1.8.0 | 1 
            host-gauche-0.9.12 | 1 
       host-gcc-initial-10.4.0 | 1 
host-spirv-llvm-translator-... | 1 
                   json-c-0.16 | 1 
                 lcdproc-0.5.9 | 1 
              libarchive-3.6.1 | 1 
                   libee-0.4.1 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
lshw-d76afbaaf40e953243da92... | 1 
               mariadb-10.3.36 | 1 
                    neard-0.18 | 1 
                  netsurf-3.10 | 1 
                nodejs-16.17.1 | 1 
                numactl-2.0.14 | 1 
                    olsr-0.9.8 | 1 
                 openssh-9.0p1 | 1 
              procps-ng-3.3.17 | 1 
                python3-3.10.7 | 1 
            quickjs-2021-03-27 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
sdl_mixer-d1725fcb7c4e987ae... | 1 
                    sslh-1.22c | 1 
                    tekui-1.12 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
                usbguard-1.1.1 | 1 
                    volk-2.5.2 | 1 
                      wine-7.0 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/33d771d402add372fa78d91d09e19e1744f0a7c8 |     
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/c6f1e0d42b9ef2b26ae89069af709e3b4f398f72 |     
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/82b5c7b3f0f2b704eaaeda53fd157bcca998740b |     
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/47e87bceaf6b74a01b3f41767a34bdc46c3140fc |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/88d8f8e061b99363998853fd90e53e91f01f4c12 |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/aa92b469680e6b7f03d3dbf6e041a75e7096842b |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/078a2e33cea57a9354b3342c9c86450886c7bb5e |     
  mips64el   |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/8190c8f6f79c20d0763e71727fc6660e2389a9fb |     
   x86_64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/f47bc37ed9a386b7ed469a3d74c9a77046be8c43 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/d0d931896bebbbaa8eb80659822d54a3cfdfb5ef |     
microblazeel |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/16036c1695d8d0face76c9f023447a3e2d958054 |     
  riscv32    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/a083f9503a8d364609d690b058b9e0c0450b0ddf |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c67f8a0a877524e108aedbce03dfd5f1c11afc98 |     
powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1d2f5ea7a40f7724f12a48ae4a1aebe82a738b90 |     
   arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6d563719735eadfef0f03565d46f62658f6cda24 |     
  riscv32    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9d5d7f9ccd2086d238b16baa6b5c8fa525a6d4fa |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6f5774c5eb3ec8dee354d4ed7de98f9e951e2c82 |     
    sh4      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c1530a6a3c6873b73f1dcdf8b79ad46e59b1f9a6 |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ee9cf727ef8029de46f73e4da15ae7dde520e918 |     
   armeb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/4ee63da4339714bba6775a0d85277f94c69e640e |     
  powerpc    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/122aa4495dab770ce5f76b9402906e703c937f7d |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/af62d5f0292118082e4571f48835d92e9829845d |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/87229dc740a137cc3d41ef603ce832ec68acedcb |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e6926f6a0aa07f8bc7f7ac587326cc92a8fb5902 |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/14e3b942bde1ba6670493a9bc657cc3ee96e72dc |     
 powerpc64   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/30c5827ac06bceb0d1abe2009a4e106cf349d82d |     
 powerpc64   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/46ce671d6c6c5361925392b651a2525972c10b23 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1cfbe1960af15feef9346ae4c6dac1a8f34b5a7a |     
   arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a11aef4f57989f11cc651370b1821bfe0e20eb2f |     
   arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a295af5439dcb777353900f2676b04ccb1b39972 |     
   armeb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/dccec4d5f0e2ae5b797758140be220948a963893 |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e300d0bdb8a636a247c9dbbe78d6527443bf4ca7 |     
    mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/331f8dcbcf702828bb37d7da276f272a87357d8c |     
   armeb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/bcb73e3bcf4beccdc6e7051e01d2fdc2699695ba |     
powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9c195ba659b8b357e2b116526e4380d57b365e9c |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1cb15babf50a93d741af9118c450c59fb2ce3a3b |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/93f1966976915f298acbbbd8d0b39c93dcda756e |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b2edd82ab1707172bc51d78c81e6088df5024f56 |     
   s390x     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d35c7e5cb2cdacd677f3a406be7029f026614ba2 | ORPH
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6baef6d4925b7d408bf17aa6072231390ce73e76 | ORPH
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d2bb3d33d7c00ba230ef0621b35f3a4f78da1cb1 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e9c127691cf82af06504592230a9731b909923fb | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4aacee5341235370d64192c9ffdefb510bff9099 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/705e6a64c79635b518941945b6681aeb44c46eb1 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/9513acea48c1f26d83674a546ffb67d415ac39c8 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f831ca3322530d1553f549740df414fbbd3b64c7 | ORPH
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6d0ed7206f71fdeb6151559555432ea30118133b | ORPH
    arc      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/aed565eabd8ab97d85f2990260a1fe867bcb7a84 | ORPH
 microblaze  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/85a04498d9aa8a2c48063c9b243dbd3365c404b1 | ORPH
    arc      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/df6487401f4b4d4f4e6d292480118f0dac41b46b | ORPH
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/ef57528692bed235f8d36cb84c46c77b9e4664e8 | ORPH
  powerpc    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a91182b332d961cdca57d3dc8eedf1de9a7cfd57 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/09fa739aad53f0f9c7fcbfec436f0d8f4d715266 | ORPH
    mips     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/261756ae7e7c3a8da1ad5b9b2d90def88aace671 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/8e995503ca11a58303d7727a9f3e1e5892bcec47 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d2de4656673d1f69991dcd4d1cabe69ab03f6a22 | ORPH
powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f0e018705be832eff59c4b9fcd567453f9211bcd | ORPH
microblazeel |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/64eee73e9611bf1814a2fb240997e544172b7c50 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/98a6a8a4c9ba66ad8b7b1950f266418ef0840b16 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/8968fbcecb8e848b27786360893b04d11640d7f6 | ORPH
 powerpc64   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f2c388852262822429aa80a99428fdf767b33401 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a75669b8f8aec47333bcd91ee838b4db0a7fc57b | ORPH
    i686     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/280a57d15dfa9c1da93dbfe34b7db1c376133690 | ORPH
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/78747d2db8b0b2a4a4d7da4144173a073e4afdb6 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/43e17b874053df59f1f6291d641f9efa891a7fb0 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/39177eadf9cdbcc72b3246fca15ae4ed6a0d8e76 |     
   mips64    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/8cd95854f98b9e5cb428ba51beca6c909e4463fc | ORPH
    arm      |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/8f1964a2e2968337d8d766940506f88904104f1c | ORPH
  sparc64    |             brltty             | TIM | http://autobuild.buildroot.net/results/8eb2a23d0ec82c7d9fc3b423c66bba268a4543cb |     
    i686     |             brltty             | TIM | http://autobuild.buildroot.net/results/efc40d989552a507d122c1c36d38b0798e44af42 |     
   sparc     |             brltty             | TIM | http://autobuild.buildroot.net/results/cfdb2a8fa683275a7a13f1aae6dcfef61fb8f31e |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/a0879fbe10e70033729a5f231f8e83df16f5ef80 |     
   arceb     |             brltty             | TIM | http://autobuild.buildroot.net/results/393bb6806ead71c79a479b9d89e1bcc93d4788d8 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/c7cd908f20b6a1b067c383e99ace02753c47770a |     
   s390x     |             brltty             | TIM | http://autobuild.buildroot.net/results/f17f57fda0e2b4fdf47a7c60ad58b26392a0392a |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/2545d294a70ccb280975ac997deb0664a829a935 |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/9147f892f7cd32df933135254ab76a4da9ac3d09 |     
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/7d62214d64f69fcb8d393dfa1e6c47d40c3a95d8 | ORPH
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/4c6ba2b7d29ed4021377a9539eca53b0dd36de50 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/fd969d98dcb472ab0872457b26a27051b432d537 | ORPH
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6801a81ab45abb654f484817b254451b9558d46b |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/df1069c739cff57099f0b6c50ae97552bcb2f2e9 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/fbc9a26c23fe7781ae8d296414eb65b300e7883a |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2df02911c6a9ce542ec42e8fef5f2100d5c738bb |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f7ded22869f638f40ac481d8b3487034cf0e941e |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6dc1345379c6051d00d244d065c7e9f836368dd2 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ea4a2fb566005f77e50b19cc08975ae8320116c8 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3c7a658131829c4a01229b3fad0ad3f56921e8df |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bbabaf34a6dae76d9fdf9bd1c34046cd0a84c69a |     
   mips64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/83fa408f4fb54ba42556c8a9a0debafd3599c240 |     
    or1k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/71b25990d72a64eff78752212cd871102537f40d |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7d254a5a69e85f9b60406f44aa5bacdd054a72c3 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ebe6e66dabcfb12c2305bc8252a8f30d239c1f52 |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8c8a3266a68783a28e63382ab8814081f8d62d1d |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a878fb2910ba2a248edefd674766c8be370dd713 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/440f53d1b34cf4ef78a5cc4fcee668da47cfe99f |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f0bee5220d1de2c4801a89c7c32d8f1e738e4042 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8658063ebcd006a8dfbd0bedf31c828a9c2c4538 |     
   sh4aeb    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/7e03c9a1f15aa0be276d50d61db541e9a68427b7 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/3b53cd611bbed9dcfaf5b5b8e645355fc6c2ec8a |     
   xtensa    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/b6c766225fac53369b49aadde71e1f482cf983d8 |     
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/5d1f799ad2c3d98716c9d248eac83c69b247eab4 |     
 aarch64_be  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/15e5b1cd2056302870351cb4f21daa86eaa6a7a0 |     
   x86_64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/7eb2833ee4d20a8e9abb14146ef0364107069915 |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/0669be1f629679a106abc8cf5baad4ad1a86653d |     
  aarch64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/6e2058a194e5ac77b90c989b1ddb30d4fae99d6b |     
  aarch64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/d6bb5314642503226ae262c0d33401a94308bea8 |     
    m68k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/de052551ad7358846e10b83dd2a27835f7657a02 |     
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/480d1ec63610edbd8f40630a10926f58702e033b |     
 aarch64_be  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/076e164d5b985ce5b1e1e6584718b057ba44cea7 |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/25c4cb0b921d485388b228ffc7bedee130d01e76 |     
 microblaze  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/20258df5abf4d41ebc62ce8c33e5de4b10d651f3 |     
    m68k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/2ad992b01d932be36539619173d973d703cd4f69 |     
    m68k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/0b68f5ea5ed255b72de5017edc32136eb5601cd8 |     
    or1k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/5bd052dab21ca5898703e5d820fc5a010051950d |     
   nios2     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/c13b4b0c321967900f8463448833be18412bc250 |     
   xtensa    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/cc64c6336172682e88c049e6ca7e3826d18f6275 |     
    or1k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/dab763c96f764a5e5d398529df4ddc0f2992d085 |     
   arceb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/1dfab53fe2bc7ade6fa5a77fc88ff153d860214b |     
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/7ccf59f09efb9c25ce32ce0dbd61b94abe524ce8 |     
powerpc64le  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/e482b8945eb937ec16d72d65fc1c136522319ad0 |     
    sh4a     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/a0623aaa662425231ba3805ddd65d77e90ed4458 |     
   xtensa    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/ab0747f75106d69bde0826dad4e20892a592536b |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/057bb053ac6a51d8f925c6e6802b9c0a421719ef |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6a90da696f7da7eabbf7d7760bd4615861fad293 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3dd1ec54168ff36e30f619b12d08553c40641b95 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2024f7dad7b3f54243ae532680eb10b1fd326066 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4b45a2262732b26f64cfccc007b7fb8e2acf62f1 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/09ca853ae7b78c43a12814a483ef16f0b9a7c87d |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/325094a53ab2d7fe53f373337e5532c7ad9d7f2d |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2928094a901a75424ccc3395ab63f947959211b6 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a415d355046a24baff0fe942d8f597161a8e5e15 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/25e27098800541bb232715b24de46976a68153b8 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d15c3d5415818470820fd46edf1fb0be4043dd33 |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/4b549a61d739fe53453d31554dbc8b94cc62e350 |     
   sh4eb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/08d13af02df9832badb5b9a723f3d34a9c204c30 |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/327650a90cf97544d2f2e5871e603148c78dcc29 |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f936b3f272cc0b3e4e04229a1f0d45327472d94a |     
powerpc64le  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/074d5a6e2f762498fceea2f2142f61f7a262f48b |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/4b46d424cca097ab8ccbe92d3f1f19f4b03d6e87 |     
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/93f65abc83be9ec2f872f6c5b9f9c82c2b3cfc83 | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f5d492998305eef42bb50841ba43a3dcb4ef8e5a | ORPH
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/43606a9b49b069e14d3ab24bfbba856e3db53043 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/ecde38f7c2ba05106c551594f3c208af7b5001be |     
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/98b2be5b09d36a7e4b9d1f95c48b75c597a6903f |     
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/62319c1aa3ab05c3ee346b6257374677463e2223 | ORPH
   s390x     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/3457636f3233ab76e2410a822fe418f430647494 | ORPH
   sparc     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/8710f9d41aea0d4d52150d8c684c27f57af0b577 | ORPH
  mips64el   |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/10930fca3df331a2d779e8d912ee98cb3adf88de | ORPH
    mips     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/d64bfc8bbeca9c3a3c39c3d55755656115df3245 | ORPH
    m68k     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/e4831157dfc524673978e9b6a1f5ee0c7c86b822 | ORPH
powerpc64le  |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7fb33da8756fbae83979412dbad857a2f2c5745a |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/94262a58e17385a314821974ca2c4c56d6ebfd65 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2ce7ba02bff63429d9b1bd68dfbb6c7a46ffe039 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5a5d9ce6daa122618a754605104016ee0474c516 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/47090601f2d6da3bfaab8cf568091394f33e373c |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/16aa524b2eee7c7dafef8b4907d83d616e9e92c9 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e8445985ff2d4d98158471e705c3ffeba29b8275 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3fadde7a092302a98f914f5b267620a49c4b63ed | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5aa11c934a8024af4c49f855584e648b00ce6d40 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/21bd48e22c0a0b3f42a41c457df8755e2ac633f8 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cc24782bcf146469bdd2c6ad284f45ee85314031 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/48cbc73f7377ee2ce222d2845778d1db489b9484 | ORPH
    arc      |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/45b027cff4ca87970eac5e232a75938c486110b6 | ORPH
   armeb     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/c0c5441a87473be1ac4c846890d71d7cfec3fe5b | ORPH
   s390x     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/8072df924f87fa0c989b4612ca38c1ccd259e8e9 | ORPH
    mips     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/f9d67d78b9dc6ddc0dcab3597a0553dbe6d4052b | ORPH
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/854b9cb1d35ec9654a082c54ce55bd791ce13115 | ORPH
  powerpc    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/242d09acbf0d0cbe86ddd536f59151aa85047f7a |     
   armeb     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/786997633f31999869b860a1bf82bad988bcfa3e |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2d3b783b0b18a169c64e159435842f2daaaa38c1 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/e7ad081098fb5fd33515d86d1eee74ae285cd163 |     
   x86_64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/00c06413ed7b77ad90ff548946b8a3b44c35bbd6 |     
    sh4      |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/1bb5855159d80efadd738215b4e2b097168d98f1 |     
    mips     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/0acdf45e89a02ecd9fe85618d62f0c73d6ce3ee7 |     
   mips64    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/b62e794841adfc49116e6827fb31227d1ee53a24 |     
  aarch64    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/9cd213ce2d36f797041c7b21044c2b2c223dd546 |     
   mipsel    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/b088e9649d5d4c54678b9efbda49d45048cc15be |     
   arceb     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/6f46ca23da2175f6cf4f1fad466418fa157baf4d |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/03c8d726ee27e49c7d8c917bde328d5623aa9dee |     
    arc      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/4ccda309d4d720315f0ba91e36bd7d4530af494f |     
   xtensa    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/9c3e501c567d2062bb3f11347a35e34db1932ee3 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/691f2e37fe84d34d41cc5ccdd4205615b4b88800 |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/946578880b61227d6e878a98698eb4b350f0ece0 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b5ffcfd92ac94c4a29dd42b0b786be09439e6618 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/900475bb58dee4d82a5a6951167083b68461782f |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/88af5266ac66ab356072a063021b5994138f8d97 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/52f69f36e2032f99c03be80c065d2b9dd58d6ef5 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/66cf7d339d2398578c90f14fe15fb34b7d6259a6 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a28ccfb5d8c86de96e1b1d0e547ef3b2be711704 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7ecc27e68baf1a8debe432cffb921bd2222743c9 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2f07f6b9413595fba708f68592279716a7db90ab |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a4b4ec598ca24149930863c07499af79a3ab2c79 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f47860f8c30f19c3b1ef9f8ff6242c47ff17682e |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/186f3a87c06ba2d94080cfddbbd03a6d6d3b51b6 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5a61eda1edb8988f92a25974120ddc500e953746 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8989a375365c0c6c0f43c1347dd79f62f782fbac |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8a75786b22a495a6f33bf2cd476049f1be644600 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e669a2a16014bacdf8cfc0b4661455623eba1266 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3f295ea5edfd660888e885a3bb69d2c5f656e7fc |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/552f14324b4ee8357d786f37a0bd74b687e09961 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1eb7e4f47cebfd2be4804785720126919848c228 |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/affd5713ed13fb589b4b86d1af8e9b00007e9634 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9bba239aee3cc98e8b7627779b63bbb6386f5155 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4787ed65c06251d8c38cffa0efb9e394ffdfb123 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5bc7e72a6fd36c9638daadc876c7126a56ea1736 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2bc2d71dccd2216b2cdc16b1ba187880e0689eaf |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dfc4697e8c1b50217e3f79de9be6b945f6780191 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/55bd4220677f0949eb44f919fc80a778d23073e7 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6b70dc200405304fd1e30f5e118c843f35b882d0 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/14de80715ad90335cfd8050c52a13b95ce1f0580 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2c6c650e764ebb23821ac2e07a5a5a578a5dfbdd |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2c1ff0816c2ce75e84b6e453695d59dc8ce1e8ae |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d22830030c0c5760077dff4bb8e780f89537166 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f16073bbc5a90e8e8ac0d3b2211b66415b70e130 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6a8e45d8212fcac92fece0e785350da4d489ae86 |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4863b9928bbe1d481ba3f8f505f660c489a1487d |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0d617f367713d730038b74f2a6559b2260941964 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0b36e7e652de51f456b79f6464f6381aa50ba38b |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0d01e82d37cf9d5ab6bafae5a1f3a11c42d7870c |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/15174f9f1cd7b687b25097b804e767916ac27833 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a26700fd586ac4e21de5677d4ddeb38f37db0415 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7e9c8dfac3bb7598b4ce259239b1ad2d8cd6b763 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c2ce20864ecc3548382a4eb034498b48b892b6a |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1305d777c1fe2cf04a3664a0011717141f2a2573 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2480f49fff76f1fbf7b3e18bf22f35593565297c |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f1aab1fe90fa290834f03b29fa19057d35415cdb |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/435bd1863ce87162e2a7045791f6be68bb2271c8 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c5e0d92883b8a4c3d48241fc38975ceb8af9cac |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/efe503e720ce321574f1c71545b5251a4961a220 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5c0be4168a6b58f47d0791970b83f8e4b180dbdb |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d8bd37422a6c4f37df5d19190c7d8d3e49b1556b |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/78868cce91304b6f7673b5b13b51558f42a5ece8 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c574590dea2bfac143445b5bb563435a294cd15 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18ccad863ddb7b436be5f44e42a24c4caaea72e3 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/216cb83906ce1940a0ad02613c42b9cef9f9bbdb |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/81b5ed81be62af07e26fbbb1602af031d98eb247 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7986f65d73d678f26e8c92e7e593b3a322e96079 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2608846534ba6248039bee386ddadeedd4f03cd2 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d60bb62267b76909feff42c92f9cabd0598fcc62 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/790c41a7015cc420dc4393456df7d93fda047efd |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b02b86cfe28b3ca0db016b4bac690d4b0a505065 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8a417b920ca7e76eefaa55a97e501c64e3933069 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/895df69366faa4d4f9f3a85b08555ee99f979423 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/99047866cdc2ff5a2207d7a4358021ea2a0f468b |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e5a9f1b86db3f54235a4cea315f8cf8d33e49f96 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b8100ed5f38990f19e7878c8f196e380f5c90b70 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9a8137f5f44519ae54e7f08f87b4cb2ae7062402 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/efe3fbafc4f376f8f3bd23013dea8321e8c91809 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/72e85a7dde9e9520291f4b90100611a8d7b207e9 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/789d13bf60aab6d3d157ff7075c7eca13fd9835b |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b30540296151d91f6b371acd675b8583e85de79b |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ce4e7f1bcc0fa0ee20e55485fd95def43d2f3abf |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f2dad048942b8b2ce34b9cad7c9dc422c882830e |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b910063e4fc01451a9f11eee333f9899ada7a88a |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/631e41a892d3fba0bf61ecfeed0866e3aa7559f4 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c8e14138df0dd3c5a01d7435a35936a1b4b83ddf |     
  riscv64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/28b87000e4c2ce157319ebbccfaa887f3d9f2197 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f91f5d0278d3c5163d1a9ad04fba9f36ad9e8d83 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f01e70f6ca2306a6717604dec0256849cebf9b76 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2cce8a4e7ea76a9359da5d7dee0369c9a552357c |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/64ccd27b243efed942ca5e2da25c47fe8cc1b662 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d34cf0b6fe3907548b04f6832bd1bc16b92b6824 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/65bf9352f1aed1fa9209434d2747c2ea6acc9ea7 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f0065e53ca8527a1baf9adffbf1a9b034aeb3947 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/95f280bf4822d488650163c4e508b2252b8b050f |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/665cef8731e0366a908b0ee2e417762ed6aed905 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/30a0810784794be028024655ebc8b8260ff40828 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cc00974a94dec96f1eede245fac5451594a8c64e |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/834d83dd3b59e11a40c9948279af8ada46598503 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/addf9ae9f90da5d3e5e1c08b7bf27bb147c31ed1 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3e9fb859a794a36b7ecca0f73d9d19044d8aff46 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cc4ab010e5997b5d11de2c1d16141b81974c670d |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f5c02a3cf462b8e690d96e3dc40c486d9049d6ee |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bae0ad877fa16ac78bf5f6831a1ebd2ca0c8a1e7 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d9df932805ab630af570aa6bdc19b0052ff789c9 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/63deb3e9037e715fcfb8a66119a3be627d154ed2 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fb8e44e13c8eb80459ce27b35e0fe023d7078a03 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2c54ea602ec6529ebbb9de64b39138f0d2ab7d07 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7cf0574ebf50040488466ffe4e7030a10fd26f0e |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/82ead78c47abbb1cafa36ed9bb8afdb9c9731f0d |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e1a13f734855ab40b6183b7a9f0fa16f3c7e1599 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/33bda0dd4dc8a98e67fcc433d4d36ce12f2ef343 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0af4b9aecaf4ad19eb0be6c531c7f9c883adc417 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1090443c507cab9bef533d807dae3888916c545f |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/09dc2994294b1d981206790d41637a4a5dab621e |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8aa35cc7c11de9027ade28c8b7e34a3aef711357 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/13ca47bf4d70df260c11ee9593ded203490f46ea |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bbce549454293a5724ec9412ae801a8a76e280d9 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4fd18c8f1c4d9f523e08569638f2a1aaee0b3e0e |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c2e0b900c39ffc36cef536ebd76431f9026ec5f3 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e5886296a0ea81592ebc3e548ce78ee279ca1184 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/29125e66aeda8d11186211c634d2a03933f27746 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1542c2e99154702745fb89853c2e654c0d45a23b |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1698e11220abf9546c496fa609f03faeb75f41c1 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/348a4c414d8482079232fa4d2af56164f032676f |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0094526f16be2bc56fcd90efdf0ec127607be6d |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a24081b68af4d90c93527b8700bbc07a32df19d9 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5441dfb60250509671f07d50aee45757ca479075 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/daf6cec4e531a2ab1b9ec9584a8f9dda08ccd5dc |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8639637dc0c92bc9150fe96ab73f57f88f7f315 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1c87349cd47747c2fea76e4f829d959bb3686f92 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1783576b75eca525eec28337a3764323cf3bdc84 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/029b81a025515ec0fd8593217eab5c30cc8a1418 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d61a6a532172d1686a385ef98a0165c0438212af |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1c2d5eab422dcc464c23942be6bbd01e273fc705 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d321bb0a2888f8bd371f8f9fbd25ddcb7f41af5e |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/68ffd836216b5a075be4e4daad44fa7aaf558c84 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/96046aeaee44c786f8cfe1ea96beaaf1e56d2992 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/692c6d2f4e848674715d32b4f4c9f9fd9a95a70a |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/56f50e005fa61fc5c72020febcd174d49737dcb8 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0e64b4126d25f78a693de35da8ef9ff514f4d79a |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a47635da259e94d671cb09c91dbe6c186e76d7a5 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4cb839d81acf484ffdaab5d6bf6cc385affb4ff0 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d285374b22b437206d4197cffb1f626867ede96e |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/90ca5936d188aa47d2ad887d8c99ecf9db4c866e |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8db33b97e915a6516ecda7cda9c85c0cc64f779 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/06ba33b806a08dcc1106c7c8b0b79b540aab6e2c |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/afe23afe44df97fd3e180dcda367e59c1c71ca47 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5d7c8c0255bdd7f1c113cbb92dccaeec0e961597 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/80d6067e7b1f01cbbf2243b866837a4c9ca39cc8 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c52260564da3182fcd45e00dbe8f27fa29f4c42 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/74703b06993022b9af568dc9f2b41536e4852ecc |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d03f67334d3deac593510f432a6f4173538657f9 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d8cf32618b89764317887b7a6696db3b44d98005 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c80dfa0b17af620150bde305bd8ca996164ea6b7 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a495bc54db19f6cb9efc0a60153a64cb69c69550 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/805c24cbdfc1381fb196816123ca932837ede238 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/26c06c477aecd1f4cccbe43679ef8b26ead3e6cc |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c3f2913e080e71ac86f03c0621ce5cdc2494db3f |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/589647a33dba41904d4180c9af347092bc6d4104 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6e43b0c1f7e134f5dc1f02e4614e566e1f15ab1d |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c3760a3f32b677feed08b475db3e8331d3974008 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2e2c03a40148e88621dd785dc9bcb2b8ab7e642e |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b09e25b9f6d6073a134eed29ae219d0890e1dfe3 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/68a0492451544a59d04763496f7c74cbb9cc2bd9 |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a9b5b9e9f0aa76e703c7171bd3b9a30c57a65de1 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/36d90fd29e9c47db25493c06a3adb371461b940a |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/928993285f67c883f54ad35237a725464dd8e25e |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7ec10be3b1dfb831c4e4cd6b641f81554d7446f8 |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/97a6b40aca6c1c42360d661bb752989df8d23496 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/56fb651fe09cc78458227508631fa92e8c0edb80 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/127fdefa1aa58217013c305105e23981255e6dca |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4725919c17dffb2d26b5b70b5145699966a2ad54 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/85058058f9ea743d724ec44cc5e5cfafb1d7970b |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/301f4119334e227336f0d407c0941ff189eaede4 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4ba740b01358e570ddd83c5e4777beb57e507e81 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ce17f98f0c3f0696e296e7f2e1c315ed6ea48102 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/67e8839e524195ee14f22a36a5f40fee54ad0fed |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/590e68e6796685830829ff91a4ceb3e3d276953d |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d5467f8b0feb3571b1761913dcfa3670a4a708df |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bce50b2b10097d3d00b698314c198200e7fae05f |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/247946af28501d77a6c132483bc4539a83048d50 |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1d32fcea904abffd5194e4a60450be5ca535cf9a |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9c08783851952206b437529801f21c4ca8e89a92 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/58b15d41fdd3a5cc4982b0b202175103b7210c6f |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/118832aa57a8e3eec2f7c22bce5c6e4becfe00c2 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9ea28684c9bd9bbaaeb53aceca105bc687cc32a3 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c688c88782fcbd93a1135785b486b3daf22f34d4 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/95577d270c1366d7cd68c999a2f5aed5e812374d |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/981b762fcc961b2019984f03db8a3befa5be0bd0 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/832757551d55f6d73574b4969c6b6c0f1761c8ff |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f502f27b91dd3a8e4967305ea704e0a76c925f87 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e424f9d5e9c69c645086ef9915c6d626ce76174d |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/35f5682e96a1ff3febafa4ca098269254361bf2d |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/12a399d2d39f9ce1cec3cb52e0b9645a09b368b6 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1f1d8411c315474c17ae290c3ef9f67c5dd349f5 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9c386b01cb5657eb28127d2273bf6f7d3c6e7faf |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c14ecf525f93b6bf18207bbfdb1e94f79a981760 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/195c23d952d4f59de723386213be811eb733c4e2 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c2f7792e861d349c51a4ed314034a542aa4a614c |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8b9e9ec2cceec3db7ae24123c29f075033325f16 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f3b0b0cf1ac319c8ddca97b96249651feaf2e3bf |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c1e40ad503dde1264114442b1c57a0703a908f9e |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d111368e1b5a58be095db5321c4c696cd9eed864 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e336e662442e7526c1b2a4bad54a50248db690e7 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d4d8dd0211972ab11b887f895aafd73a35b936c4 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ea9bae5d05ce4a31f18388980a0a016b4e2f21bb |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/edcd3a7e03f3bb63aadf29070616633ae0eaad59 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/830856ae5286ce793f085eb97ce3b6ef3cd3c62e |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2d00d73466fa05f1dd3eb7da990f62b65830b02a |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bf4f2cdb0eba9f32cd3875f6736596f53a0f887e |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f2cf5b1f6ac510dcae7b95ef23be1745e2e1cd44 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/740e458804a33749d68b78be6b1918ac35306ecb |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/801e77d4c76bf18f51b1c2d6edfc6ddcc31ae7fd |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b69af8db0700c31cc3de440db3ea613b7998786b |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/683db75fb70ed480bab61754ad3fe364a90aed87 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3c9db593e4344e4117ba80d562469a93244fe04b |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/214fc96a516a415685176ece0e63e029c902ba1f |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/77f31f963b279bb42226869fda8b4b3bb106785a |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2f9ab2961b315cf48fb8c9b87fa99731e2702a5e |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b7de7235d2a7dd1b5d67373e5902cab8d6b93207 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/50568d030d6354f4c130785b6d3a0e5ae98c8f1f |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3cbaa4000c529cd909448e7d0b6a681bc13c97c0 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bf8150e302745f5ca1710f53e9dceec6a4e97b75 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/80715a3ec26ac3cea7d49a081d7457e69067b4da |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3b03843f57f2d7d5388cdc23e12e8c14d8af6301 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7e9233a79b06de7311f48fd6918a40466b58dc92 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0ac27121bd4e8c343f72360ca6b5abb89f9e9276 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/48480fa206eb9574f0b7760928bdc33e5052f6b0 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6c7f5576a47e15352d15a20369c38c4392ade954 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1ffe14686d85cb746a3deab279319c31207a70ce |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5fbad6a58691427f3fb7856f2fb1f3e43f34d985 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/72ec9cbbc8288b26d4ad771e7c38656ef49f0f7c |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4d9e5088f54936f04a270a4aba6c0ffd86bae9d8 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/98933660f7f0cc43a2dc19346fca6d7733085e5e |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/814cd98fea0cc361165cdf916329d91c7086180c |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fa985cbbb0d841f15d83937b593884c45dcd12c8 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3bc5838e97909414fb735eedf6b0d826212a06ec |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0a91823b650d6b1078eb7b3711bbe9939163f4c4 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f2f4a7837ba38542eb019cb353bab55e9846dd2c |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a58f043b4c1c67731469af5c3f7bf8f77c3d99c5 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e4a2ae71da6caed80b15578dd065a5b122af8db4 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a70d8d19be69dd3e30421cda6f4a5a7b47482451 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9370b0e954d1b075f9f711d09752204f63d30501 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0390d178166af6553ffca5cf7ee8d9a4d41c7922 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/743481099de202fd011cf6ef93882fcbb40de2f0 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/27eb48f3efbe418dbdbcc6d1176fdd95dc9b6f47 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/69b181730b7128b6bc594653c2edd54c92e0bba0 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/124c7058282eff97413a52151cb33b3a7ab1533b |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5de6900e0bed5dffccb379c51066621bd4638294 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d7813c501dbcc759d1cec81052ba81f9c3ea98be |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/68528b02434df7c24f22c9c130d62062e6b3ac0e |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/34f62aff693cbd496b4621e7b53dd9cec91b6f32 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/36d08e2c4e84b9e53ceb786396334a9d24ab9415 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a562904d7ccf3f8c9f9d93cea6660a2a94842a19 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/956b0116f0984e9a7eeeb0c84dfbdfdb49396cb4 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/707d8be35162cb3fa2b74a3a1ba8be607a9f9d63 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9313a17c965bab88eba741cb9d04271f959360e5 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1c4799e3056a6df82af3e229171f12b6ac768d82 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b350683de515b4b664d6db0a6f4128a63757dd12 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/faea1a09f1a270e92069a3e61cb20198010e85d7 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4cc73409feebae5f6bc1aa0aeebe4e32021e07ea |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a28dbd84c454dba6be1ce642cc11e97db49536e0 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8f71b3855254ad08e0ca3e282b0e53b61caf819 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/404053ca46ad750e061ad2c987601c10ec83e983 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e131a63d299bf8bc89d7044faed4c317592403f8 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/29a6c6599020b8696889cab87ca7280a9f96532c |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e41ff352fc5cdbee07d839b986641f0024a51778 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dad1b7746e0681bec7f9cd56d5a037a50977c459 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8625559d4a0468dfe88054be638b543a2c69d546 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/02957234ad46aeb1a236b17df15627ebb92af2e4 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e28d94113add5c6458bdc8a0a1187a90340ed9af |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dd3f8ab88b19b0804552aea040ca1457e780ef28 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a7dc74e94bc88f61ef171939b639323c86aa95b4 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/de687e6aae58a9abb2a58d3a7fe770eb201e7da8 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d81f828370f6585c11993c564e355118447351c7 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dd6cdffa2ac15f68fc44ebe07638f81ff6803705 |     
  riscv64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/413e58755f6d90f2220bd81469a9a2c8902d2af6 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/017bf741160e520733b77095bbc1656d2a133462 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0be1a32ec9bfcc174797be332d80f7138fcac3a3 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5e69fe7fa963d6ffe52429167277e3a8919c0870 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b6ab328a61afe514f2eb73cc3c970f424e9aa338 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/27d336a6d24e172b5915a5031ecde1af26f88f0f |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/97630c91e3c9aa2f7a094de3a6b0d794b77126bf |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a6d8fa6c1dadd8fbba984552648aabd695844e22 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/91adc1a4fa1b27445747e7ee428c8073f5a1c176 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/61bf941dee47b8d5504683b6178728f99a9f73c9 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a6aa4575fcdf400b5a38e883fc8f05442d9a041a |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2eaa12413b5fe361383d99e906709d4aa7a1e0da |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/82e846bc8ad4b71a2260103b9e9d3322c9f3d5a0 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/29143bcd61859b14dea5686a65d4ea6f63ae8936 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/80da72a6139f5e743927301a1dad6599d227db12 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2da9608d7ea86875c813cb3ef67921f2ff008fcd |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/91e232b0c4b376f8e976976886521dff3febd455 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/12a9b2693b79c3470faa3dabc11ea1eafbb5f058 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0ce7cb066bedcd3e9ee8a51ca0716c8dd6903ac |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f43a12759cdc14db24a8e8892ad65c16cd680766 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/016abe55dab2a7dcb36ccbc91ea9177c87eeec5b |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f5d893217782ddfd689821cd912f449d7ee95cfd |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/511aef5c4499272fbc858bb383de963c72708b26 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/90fed584e6ad23471a38f2ec034bd9cb1e9dc3e4 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c3b3c88113cd2e0c916de2694855f0f1b67e7cc9 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/db262d8cf044957e9f2836c8370d5704b80af73f |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a71e57b701d170ba151c06af72feefd73dfbd513 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/65a41e92c01327bb18d80ef61ae7e70c7fa4a0ca |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d016d9d1168596fb8506a309bfda9d3861e08bbd |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/218c59b5963f16cd87ee3e84e30a3e4c627f132d |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5ff05806d960b6266d66239f3dc37daa84adcf35 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ae1e2bb335ffd05210d3e770fd13b33f98376785 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d8cc4c3ced75bfa336a1b31dca804aae5fdd3a85 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f8d612357fc51b7530dff16735fd4b2134a9024d |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/742fadd4b813346911d5a234d5170d33776ac05e |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d197c450053a868208abbd7adb0f31b6d1c2b1b5 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e89e5dbb2c42a5970abfec4c68fa5e72a13afd10 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18fb21817e5fc8e4de5c05bbf50b29acd4bf3848 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0d493cbaf9b3b3a8d0153aa1c057c7e0c3b41c54 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7640549f5c24633fe1c06d9e0548bbf4a616cc2d |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4559fc7821e418503d40de8707a59a2c5cb3366d |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4d8f9de61c831e47e06bf43bf648cd3886d4f6f8 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/26f1fba17068681b11960e4f558c1612b244fa53 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/651dd4f417889409c927f3636363b77337949587 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/76760462839ca9fc946bf24fbf838af6520700c2 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c6065f04afc8e76708c80e9556bbd49631a6b681 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/91927aaf429bc4db4468949bc3697107032e8360 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/71c253d9155bc9a07bf4d46a8b2e282f184a3f23 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/162f0b662fb90239a39b1169e9ad002ee950907a |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/9c0d7a86d8c5a48083a7427f605a2d02414ce693 | ORPH
    or1k     |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/ae31c80bdfc42b8939ad8d0693a866209d048ec5 |     
 aarch64_be  |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/09f14b8af5e1a911f270b90403d1a331df1aea71 |     
   mipsel    |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/fc5be395d653272a79e2bfc736ab386edda5a5b2 |     
   sh4aeb    |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/8ecd65e3804c121b106f3b60f9c2cde4ed4213be |     
   sparc     |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/0833b42f2a3cbda96de49169bfd6a2901f7cc715 |     
    sh4      |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/324b9f948256def60c5d2a3a124f8fc69fc79edd |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d6dba84dc392b03c9325af0ace68b171603a305e |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b7addca60d0fcb6e73bf7f840d6a6290f38739f7 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/fc0223529c1007e09211938e9af6c5151ab0b81f | ORPH
   sparc     |            hans-1.0            | NOK | http://autobuild.buildroot.net/results/942caeb90486cb634cc6d71cfe08e98dbbd8229d | ORPH
 microblaze  |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/de591f7738b5b72c8f882cb1634aaf463d48e9eb |     
   nios2     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/7423eccf35618a096735ee446ca0c41d6cd84571 |     
   mips64    |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/1fe7ad524fa1bf98fca69ed79efcd3d566331745 | ORPH
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/67b9f433b72991268e89bc6a449ca1d294b94189 |     
  riscv32    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ed009a84cd192ea8d5a7c6c4ce75dfe9ff94005a |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/77edfd2bad36e88c7d532e11094ea4bdb9bf0554 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ea4c8a0d40ed8489817dbf2e3ff7abc909bc1531 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4ef0dd691e72a6060b5c58a1904fa2e63928505d |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0d3b37d25837dbc2527b403676cf9e9bd503ae53 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1446fac68520eb7680d2585eb3a8132e8b8f0a45 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9c3963f2546ea274d0b75d47b93fa4f08a056592 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fd754273b3b401a6dba0ac99c5157d086e98aba9 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/686ad4c025763392897e26af16304e5894dba503 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4906b891f956d2370b96e8659e60a48196799b83 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/86001c1c8c28d761d9ec218914f71fa91916a7d1 |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/aa191b98bd886305d0d2bf3f7d5effc8dbf4069a |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/866e0a490af143970ec4424249e17e8856d0a797 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c6bf26d0ea46da84b683ab519c4c1ac6fb7cdbee |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c5da7ff4dbe1f2d970cd29c4782ee20d8cc2dc24 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/08c43d57dd91e292c9828a8b504501575c10352c |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/45cdaad1ac490e7108f83ab24798737b25898520 |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5f1cd4b2383f3c68f107ff3fb8fdb234ab8a7de6 |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5f953f82ee8c04617abf8048325e0a7c4709da20 |     
   xtensa    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/eb246f44cb14968db9f375dcf5d63ca0e2598d52 |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/f6ac9f06de1f4ced978d0fac0ea38fbaf6f9df9f |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4145323f3d7b70bcc5623bdee7f5c2647f12a9e0 |     
  powerpc    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6f7f84e9844f70e069fabb0b5f05e31a2243b5e5 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b96fbc4a901d78777538ad48b92e413201eda99b |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6ccd6e43b955f6bfe1dfee8d0ea8d8896164d9a1 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/9ec33e94b5bb242d7daea6823cd9a77036044b7d |     
   xtensa    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5dea92f82e1a6300b6976fa695205b40b1253398 |     
    mips     |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/9095d277ad323ed98b56d7efc9fac146b0b140e5 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/44d3f8b1e4ecfe36879b3ab990e63882b7fe9d0e |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/157b5603e4d35c6a0ad67cd7376e7e6ad907baf9 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/efccc21980cb37abde5a387c367f46092214665a |     
    i586     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f675b3930e8d3dc3d5d7f3b26b1769c40d0914c4 |     
    i486     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/70b52a7607461a9dbd741e9df12d27149d60ef50 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fc7e980e48b7359433ef0ab75005b217dbc00339 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f3f6f47072d1b7ebeaa559fbe9ea1167b09b5fb2 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e30e90b01e1b9202078f2e30ddf7159a01c1a0fa |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e919e670bc6e85166cc084450cefb4f759ded515 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fa42e562fda1a3a67cd54ae84e7832c76de08fb0 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/23e73d985f613c4e5181ee1f1cb774b5f237de73 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/af71d081ecefce8dc35c2c41930539c6ca8fbd9e |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9e6c71fd5c521604d2b3d7627d4e3d39af354362 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fd90ea3f444f9049fc7a494f448a069217601413 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/69b7b5c7888d297bb8b1b3a490ab4a303ba02302 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/53bf2b51ed6d07d3fca296dcca2c36dd38bb410b |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4bbb0768666036bb7b17e795080cba6a526f227d |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2aec48c2aa80e6e8d468cbf0be82696a06ac8342 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/efc72ce2ce6e06f8c11a71938707a4fd4d347c93 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/201a457f67453fc8b24f1e2b976727a82b16f494 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/59adab99f193e6472de6638c151a7a498d2631cc |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/420fcd99ee52ed17654d10b7c41139cece73da80 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9dd11338502d6f5e286ddd2c34d19df8318265d5 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ae976d444cfaba70c170076ae4307f0c949407cf |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/3dc9ae93019fc35866ad5fcfbae41f7f99853764 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7fdb099da98a876dd4847f8a267f90f6ec1a541f |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4ca5118fb5fffbe344ee188553bc9c9e1d7db935 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/30a4718159ba3d6966998aefd1067592a8b0c37a |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7e587bdc4cead59551bbf109f30f659b5b5bbe4d |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/982b610f1f22a9d924d8bae4bfd6b104ba3adce1 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/559e746c19667c3c72a444886c87fe68504f7c62 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/a672321c74f197ca76c47667de53417265b11418 |     
    i486     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/723f1c3e20cdc9d0132cefb4e10586cbb1a6bb85 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/91a706bfea50783256299543398c0b191f56e320 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/328f814726bbf904b8eac1758f681221430152bd |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f2214db252433b722719223f3893be3f3a6bbad9 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/769f0cce9bc2acd7850778f0b1e607b93cbd0598 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/79db83759e2cdd47f84c41ac05e429e1003e3d4e |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/a364a91481ef42068470ecf34f6ddf4cfd1c460d |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/bfc3284e44c875508048a23791d653adc2aafc72 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/29181a1a01435053a8d198f8756ba53259bf53e7 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/46607874864faa0c86cc7861825919e3288a7fa2 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/545d7029f6d0edbac596b69b48995facdec060be |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/aa1dcf3a4c8ca01939340de7aa2e356c78f41987 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/11909b0d26e32a0cb4895562194ceb023e320120 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e0725040008f94f28129c11e55ed9657fe1813c9 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/3085143c5817047cce7b7142fbe62d8f96d03e01 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/302e26dd3554502d88f9c71afed9c24a16fe03c4 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/3ad95d402b4f3b6eb04e3696dae4c2703ebe7b4b |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/14c3e6554d2f9361f2b5361c3744d1b3969e378f |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ace6aee97cc190e5bdb4a0c61ba5c1b1119f36f0 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/14e7f2caec142c4017ad2ff38ea159cbece8d6b6 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/3871e11dcc26b18e6160c3278691a832220b472b |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f934dedaefef0c16534acfe834b6b78fe0419b01 |     
    i686     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/2274f3c5fa8b7f633b70f37052876bbf1ab27df8 |     
    i586     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/9cb2bc38976705efd9c9b5c5eedbf7fbe7c85ad8 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/c07a3897c3597ed70b6b9b3c6243e65dac573436 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/e1789dda3c95e8ce7fa5400c9a08ce11abd5afdd |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/0f6b06dade601cdbdebd9f6ff073ae248731967b |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ce3c1ae248c915faa2befb0cfef8dc2e421f0609 |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cee218ac8305e5b6c45230bc42c26fa0a198eb26 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4c74c0fc845d43d4a52a2f0b23a4cad4d4cdc53f |     
 microblaze  |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/8bbfa605d9258db6eebaefd61015d1c0990a04fd |     
 aarch64_be  |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/6e8f56c4dd7b32ea4d4f36398f709ff93a5192ca |     
 microblaze  |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/74b878513ccee451987e2ad9b7a3341902eed0aa |     
microblazeel |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/474a834f3fa1b315d3920a259308b923e39a7018 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/ce451042e581f1641ba006045406297bef211dce |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/19d06325af16086897266415f23233d12233c3f0 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/0aea0475ca9da95eb531bf4044ad965d1e9d8c6b |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7f0d3f236fc4f45157006046e15fc9c633e4f79a |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/29fc1fb722d10e4f8795c02dbe778ce6305c3653 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/2d7fdef5152c2c0ec341b6f4e4fd1d3357b96d44 |     
    mips     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8db74a250bdd797a5f117342b817504a8b0ccdb8 |     
  aarch64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/09963436566fd825528246307eb5c45520e7503d |     
    sh4      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/53353a844905df5f781a8e01dc28a3c09e69ac6c |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/31541b4a4cb02c0e0ca598f48d6deb926f2b3bad | ORPH
   xtensa    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/97dc16b25fa6a37d05f00960a4616b48f40e37f0 |     
   armeb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4f0986ebd0a0c5d9cd8ec51cd153be27989b8996 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/61c2933bfee5baff524b0f13f01a734380d2b147 |     
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2fc7c885e7752a88b410169e345db5de0d239d74 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ee7b57c37d6a2ab859f35f28d314aee638ffb392 |     
  mips64el   |         jhead-3.06.0.1         | NOK | http://autobuild.buildroot.net/results/8193b853e37e09280ae182e0ecdb1b9a660f6c9b | ORPH
   mips64    |         jhead-3.06.0.1         | NOK | http://autobuild.buildroot.net/results/8e9678e983b4540c0c8ad00046a85ea3de70fc07 | ORPH
   mipsel    |         jhead-3.06.0.1         | NOK | http://autobuild.buildroot.net/results/85bf24a5381289878277ce6a6224a4b6859f729c | ORPH
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/9148892239fe49fd7805b3afea0514c4d719d968 |     
 microblaze  |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.net/results/5170076f04b40770bcc471a82952e2dcf00e9695 |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/a87907a5e55c5a52d7dc88338271db41ffa11728 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/bf063e08610a327f59917079dfb504a3277affd8 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/9f89bc5a1bf5ba12a0a053a6f534f032f022d4ce |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/834eb85a3cd1eb9bc34cf8300643082d89256fce |     
  riscv32    |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/f5071fd40e9aaed1b7f8a942be546e01dee96612 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e98e888d4b81909007860645970096bb182694e9 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/aba8617710bf592605c0eef84262b62f48d5e2dc |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f018e5278aa265e8d1c1214928a2c5ef841e81f3 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/380e1b30edddea22b2bbacfd9c043c1bf5ca5d58 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5e4175f757a3671b22a6f24f8c8bd0aa55176690 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/96f93af644fecce31325a00cec1a780b57c09839 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/ed32065339dc8ac8820f42df3a7d0ca863183a19 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4d69d1505259f70602a6dd56f96d0a414853a698 | ORPH
 microblaze  |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/89631cb4c458d38251ab5b6726b7bb13ce1667f2 |     
microblazeel |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/d0be375c992e84d6ab913e07edc3cd6f1a5c4d87 |     
  aarch64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/cd5e657a900b6bb17f7e101dbbc861d13ab92f39 |     
   sparc     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/a13ee5d7f051b1550b702f9e756a545403cbb0d0 |     
   x86_64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/e96d092c8b3a4fc0e09f24169f526f5fee55f7d7 |     
    i686     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/e17a65bd445df9a9b84fee8e5d815acccf947b7e |     
powerpc64le  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/9ccd7b2df4b5c17917713561d31c05c443d134a5 |     
  aarch64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/d8b9e88c300ae6df9c3c7e523f38af0de44a4961 |     
    m68k     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/d23642433e20f6e3d6bbffd6c92e29ba67e1aa84 |     
  powerpc    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/65205130fe67635134a7c4d05ff20d220f2e3052 |     
powerpc64le  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/ce8811063b425e2c0b6d8149df51201dcca59c15 |     
   x86_64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/1aec101a7b3020eecda2fbf335bb6e407217755f |     
   sparc     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/d54c7551ff95d60c9e8c7ff80d8528cccf87a492 |     
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/465acb0a276c8c46f1f570eabc284ba585818d0a | ORPH
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/9d4c63cc8916c93c87c3ad4ae910fb66258ce64d | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/5d4a306cf31698e833bb8f5f0b407e87fe62af32 | ORPH
   s390x     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/f4ea02e5e520f7cd5229386ca8a9fde25a68bc1b | ORPH
   s390x     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/3fadba08f3813552faded0497b586d81acdd0247 | ORPH
   arceb     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/c32667719a928ec94ba2c1121987692f616ec73c | ORPH
   arceb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/18d5c45b3266149d6dacd3bf6a86d5a4c7e4194e | ORPH
   armeb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/070810e79c4a182be06673ead833532c585a92f6 | ORPH
    arc      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/57b44ce9f11a809c253171ed401422e7bc1fd921 |     
   mips64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/af6e78b628b76f1f0456305a83f48de50b02dd94 |     
    or1k     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/0160a895771f7501667ba1acf3700556daef8681 |     
   arceb     | lshw-d76afbaaf40e953243da92... | NOK | http://autobuild.buildroot.net/results/ff8638819ef3df5911c7555d039954a9f9f5fa42 | ORPH
 microblaze  |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/afe5006bce0b467f21ad72e131543ff68212240e | ORPH
    arc      |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/fff8495fdd2e5ff66348185e889a24b7a3e60034 | ORPH
    arc      |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/fcbf61ac312839f01555054df5f8a4426b821dc0 | ORPH
    m68k     |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/8e9974f96a6d8de62be13c018e6b037df0d746b5 | ORPH
  sparc64    |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/ded8602221c38b51960988740f78ec58879921e1 | ORPH
   arceb     |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/1b029b9165a33a6eb2f072b6e2f7375cc24bc841 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/e72c38a7de649c7e2639cfc7476a0a283dc3372a |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/c3b0d48fd0a49949f1e7c17e8b4582f06217fbd1 |     
    m68k     |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/22353483c06e5efaf9da8b1ddd2a4000ce6fcac3 |     
 microblaze  |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/1296f37e8f693e2fcd32766d5f8b8d69a6dd7931 |     
   mips64    |           neard-0.18           | NOK | http://autobuild.buildroot.net/results/f8944800b886d09c8398e55add0235642e4dce97 |     
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/670b184b84a01b07e9092a71d644186516ab97bf |     
    arm      |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/9ff23f2e3c97e9af410617de3e7376f9d45a7d63 |     
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/225525fb80b8fda1547ba9e4fe2e33e81f62114c | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/0d2b1d9ecfd99327324d1300ee3f23c6a45dbae1 | ORPH
    or1k     |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/73dc2ec714f3e97614f84f4d040f6a8404664e61 |     
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/86605b2c026bad66dde75d6273040388facd95b7 | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/be8ca7ee002d4495514d769524f0b59beb457853 | ORPH
 microblaze  |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/094afb87ef38366fd7bd96225037700ed3b8c194 | ORPH
   sparc     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/37a7d276777a37e38ae201b5e33d070c6126c01c | ORPH
 aarch64_be  |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/b0549df6462dc050355be3a4f615b14a1e89a4ab | ORPH
    arm      |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/ab8fc76bb03b83222916db88bf4dede470e43cb0 | ORPH
    arc      |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/a51aa6abe34809f516b24d8727b64aa41155c754 |     
    sh4a     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/2f33160839ba8de770156037d10c1bb4c8276e2a |     
   sparc     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/303c667c0e8038af6b9dbc8fb6caaf25a8f48065 |     
    m68k     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/fe785de902219b36f1469f243b3a9c9ff44baf29 |     
    sh4      |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/7d028d6b50c35462b6c9b6031d27c80794c696bb |     
    or1k     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/e5403483e5cd7cec55d7d56e57130a40303ec1b0 |     
  riscv64    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/94d4f2e3ddcd1f94d312a212f63061e01d8f62a1 | ORPH
   sparc     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/a14abb7233ed21b202126de3b2795a0b4030b1e7 | ORPH
    mips     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/a459c0c18991434cc5664c5e82eff4843d25546f | ORPH
    or1k     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/3aa1c14c50275f7a4413fab3df0e18de67f87673 | ORPH
  powerpc    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/66982096d07af327f6c49470c727ee3aa2f36c56 | ORPH
   sparc     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/3c7fbabb35d4d17169821bbc3c7dd850cc240be1 | ORPH
  riscv64    | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/1e5e50fe0a2af98995cb304ef802cfbbf8918500 | ORPH
 microblaze  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/5ebe6583a6c0203b21c848dddf63da07e6ab8699 | ORPH
 microblaze  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/908bfaee6ef517a4d92591b12466cc03b9d69432 | ORPH
  mips64el   |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/f15843581c276b6f34a59865b56707f746c899ba | ORPH
  aarch64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/9322debca099e143054f7a0e19ac61d174ed64c0 | ORPH
   armeb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/0f75673fe969a6fc6eccd46756a797a623b55271 | ORPH
   arceb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/95c39b42f6a56017270a4e2e7a4439045ad6dfb5 | ORPH
    m68k     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/d6d1133257d0714991ee8a42d7cfdd5f99a7a5c5 | ORPH
   mipsel    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/4b8b40fb24b7f45f14d3635f14920dfd77b27731 | ORPH
  mips64el   |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/459df0d5dcb3ce09ced593e872ef0655cd2ca7f5 | ORPH
 microblaze  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/f4eb2e3c023003e2bd2ab09bde295f55c2835bbb | ORPH
    mips     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/82703cc5d66b2cf9f6b73c1877078c64a919db90 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/0f35760c383bddf2b865102bbe1dd547008c8f00 | ORPH
   arceb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/a95d1f533c314c55587d49a313503b50c1d09828 | ORPH
  aarch64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/d0ac3758308b7f9cfd2193d67489788ea9acfc7d | ORPH
    mips     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/3a64fb0ad5c4098b023af10c45eb93a90e606707 | ORPH
   mipsel    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/d46fe6d6b8038cb583323c7a22fd17a89ca8a88e | ORPH
 microblaze  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/0019bd3c5e72663415ab9b3b006a1ddc0c7d6bee | ORPH
   mipsel    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/c2c59c3b3398e543b472861f5d5befae832be3b1 | ORPH
    mips     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/599ae18c14efdcf4b0b7cea17d6020f85cbfd6fa | ORPH
   mipsel    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/683223c064b87db43c2fcaa720c76b01a043f40b | ORPH
   armeb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/d0a423fd07fb9d96be8b60598aab931ae708346e | ORPH
   arceb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/6722e216d7f4be13f4136a2950ffa8c5929e1b37 | ORPH
   armeb     |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/d17eb5f567115d5c1a6c871384922acb3a0cf6f2 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ae225f12df15f656fc2c924ac4989ddd7e9f79b5 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/3fdcfde720220410759c4b7c23877eb1e3b0364f |     
    sh4      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/01aa822b523f6be32e387b14cd10bbceeb00f0e6 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/e6b79ad2b24c0b5bf3536f74a786272c99d2b0d0 | ORPH
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/b84a746612d10b2fec966b7b137bcc0ac5c6828d |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/3f91fda936aea5f5fa048a4728cfa972e9063649 |     
 aarch64_be  |           tekui-1.12           | NOK | http://autobuild.buildroot.net/results/c6cd0d488581013a8b215b0ee2fd8f549a868d4b |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/520e50cd5b22875514e48e1b3e7bc87f20dfe760 | ORPH
microblazeel |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/0708e82daa19a9d0b8f517e5b61f6908bc9039c3 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/1480acf997b6c567d4044f8c29b981195be14019 |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/bbe9e46d69b2c37913dbd37191780874d8fe7e06 |     
   x86_64    |          umtprd-1.6.2          | NOK | http://autobuild.buildroot.net/results/a1b1de9e2f764ce22f23d8a8ea88f7ddcf2969a9 |     
  mips64el   |          umtprd-1.6.2          | NOK | http://autobuild.buildroot.net/results/7c7dbe03d769dc5f155fc14102f6591855605640 |     
    m68k     |          umtprd-1.6.2          | NOK | http://autobuild.buildroot.net/results/6cd90b7877520669d9ab9c9fadc9fa36912963b4 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a7498dc8cc26db3bfc1a2629a9d247fe177ed5a3 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/589b16eca9ea2b15a3feda3b078bd428b0c54f44 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/87ec35952ab6d0df53d0d8aadd4ccb1fa12c91dc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ef6f7678012287f8f3dddacee2e2665f4d1f4db5 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/2be7430cbf583ee5e91b12a5313d7c2086ed9aff |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/21dc838c51760a9eff10b058cd60f89c139ddf3c |     
    arc      |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/0f533f0442fe5ae876ea4f7fe7dfdba619aea94b |     
  mips64el   |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/36937983c8e9ff08cae1502717f9b4a260639592 |     
    i586     |            wine-7.0            | NOK | http://autobuild.buildroot.net/results/61f31182099d71189091d237887eb0c2df8880a6 |     
  mips64el   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/7bb9fa6788bbbeab5ac0355e92780ac417ed7b06 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/8b7e57d70f145804df9cc6f8cc7d30dbb2102963 |     
 powerpc64   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/b2aa356c21784ce47cbc3f67783cc0453cec665e |     
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/e491d5811937a8c68175984d83f39afbeb898314 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/4d9baaf58c9059a79d8cb51c810eb1eb1ecb8c6e |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/c92cbeafd1637c5ce77c378b1c2c776a26ecaa92 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/70a2e6fef040d5e391e80043dc8e3ba074205d4c |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/8628f94851ba50e356ea5f03285058baa4d66303 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 
                   perl-5.34.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8b4069306024df930a8827aefd1054cda9ee78fb |     
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a9fdd07354246d8cada2a928f8202c9281e9fe7d |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                host-go-1.18.6 | 2 
                gerbera-1.10.0 | 1 
                      grep-3.7 | 1 
host-spirv-llvm-translator-... | 1 
              libgcrypt-1.10.1 | 1 
                 linux-5.17.15 | 1 
                    sdl-1.2.15 | 1 
                 sudo-1.9.11p2 | 1 
                       unknown | 1 
                 wolfssl-5.5.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1eb3d7cea3510eb469760ca65c66ddee3603727e |     
   arceb     |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/fb7b57e3432468420877092365bd5d1a435e9d78 |     
  mips64el   |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/b114e6e61179acf71cb0d778558c21e98d34b35d |     
powerpc64le  |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/0504bcc6f8782b53e2fb27580aca257b8b887f35 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/1466ef7769ccdf55a26fc2f364da60173c1da846 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/67db6665a58434f036cabfe097db100f99cd1ac7 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4cc7613dc062ce8676f554038610a0defab1504f | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/ba6dad05e8fa3c4b88842d7c432571a08bf2a83c | ORPH
   sparc     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/474d76d113169f73fc8085f6bf381cea5bd3a06b | ORPH
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/af6638e99ca058b8a5258b512908907f6f2798f8 |     
    arm      |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/9cf621bf2a89c40276913d3630c0775951bca128 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
