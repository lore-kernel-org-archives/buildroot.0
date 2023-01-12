Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1785C54EBD
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 07:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55AB540123;
	Thu, 12 Jan 2023 07:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55AB540123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRmLPoe8Wk0j; Thu, 12 Jan 2023 07:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CC074026A;
	Thu, 12 Jan 2023 07:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CC074026A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AAF1F1BF396
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 07:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BC024026A
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 07:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BC024026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7_r92_Ls8os for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 07:35:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21C7740123
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21C7740123
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 07:35:39 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33E8324000D
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 07:35:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 07:35:37 -0000
Message-Id: <20230112073543.7BC024026A@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1673508937; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nHKRSqSHz07MuLKrZ/lQ8FywBuPB967/9DGr+J5P9r4=;
 b=eQKu5vhCoMSDh9cbifR/T1IawaNwdgRxLGOQpPdigY6S7Ssobmj9PlATGfQVhTz9DEStrJ
 LaLEOvDqz2cAUEnIBj+vJ6ctXXKujdOz4lJlwP255Fa8PgQzyKguIBJffcxSgX6SmLRa+w
 6KwEJYg2q7MRRAeBd2Jy01IcNHj3z248ri5XnsFf0d507iZ3fS5TFiWE1+eRGiic2KCDWb
 WoPN6/bx29QHFWwqSe3mHLVb2zjWBN/7y5GCNFKVWMoqsLCgEQTCD9T8YcgswwyDVlX5xy
 PX1AOL226n1FJsJtghBZYNpTgYHYpQfyeh+iC4PWOk8lW1D0/lsHzUeyZOcgVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eQKu5vhC
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-11
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

Autobuild statistics for 2023-01-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  1  |  0  |  6  |
  2022.11.x  | 11  | 12  |  0  | 23  |
    master   | 168 | 278 |  2  | 448 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.15 | 31
               host-fwup-1.9.1 | 25
                    fwup-1.9.1 | 18
            host-binutils-2.38 | 12
         host-sentry-cli-2.8.0 | 8 
                     xz-5.2.10 | 8 
  gobject-introspection-1.72.0 | 7 
              host-rust-1.66.0 | 7 
                elfutils-0.186 | 6 
                   linux-6.1.2 | 6 
                    opkg-0.4.5 | 6 
            python-bunch-1.0.1 | 6 
               libglib2-2.72.3 | 5 
                    norm-1.5.8 | 5 
                host-go-1.19.4 | 4 
           janus-gateway-1.1.1 | 4 
                    pixz-1.0.7 | 4 
    python-cryptography-38.0.4 | 4 
                  sscep-0.10.0 | 4 
                       unknown | 4 
                 fdk-aac-2.0.2 | 3 
                   gvfs-1.48.1 | 3 
            host-binutils-2.39 | 3 
host-gdb-arc-2020.09-releas... | 3 
    host-python-greenlet-2.0.1 | 3 
                  jack2-1.9.21 | 3 
              libgcrypt-1.10.1 | 3 
                 nerdctl-1.0.0 | 3 
           optee-client-3.19.0 | 3 
                    bat-0.19.0 | 2 
                 coreutils-9.1 | 2 
             fontconfig-2.13.1 | 2 
                     frr-8.3.1 | 2 
                gerbera-1.10.0 | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
              host-pahole-1.24 | 2 
             libgpg-error-1.46 | 2 
        ltp-testsuite-20220930 | 2 
               mariadb-10.3.36 | 2 
                  ntp-4.2.8p15 | 2 
afboot-stm32-3566acd582e553... | 1 
        at91dataflashboot-1.05 | 1 
             berkeleydb-5.3.28 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                 coremark-1.01 | 1 
                    crun-1.7.2 | 1 
                 dmalloc-5.6.5 | 1 
                     efivar-38 | 1 
              erlang-22.3.4.22 | 1 
                   ethtool-6.1 | 1 
                  eudev-3.2.11 | 1 
                  ffmpeg-4.4.3 | 1 
       freeradius-client-1.1.7 | 1 
             freeswitch-1.10.8 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                      gdb-12.1 | 1 
                     gmp-6.2.1 | 1 
                  gnutls-3.7.8 | 1 
         gobject-introspection | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-binutils-2.37 | 1 
             host-cmake-3.22.3 | 1 
         host-gcc-final-11.3.0 | 1 
         host-gcc-final-12.2.0 | 1 
host-spirv-llvm-translator-... | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libmdbx-0.11.13 | 1 
                   libnl-3.7.0 | 1 
              libostree-2022.7 | 1 
               libsigrok-0.5.2 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
                  mender-3.4.0 | 1 
                         mimic | 1 
          moby-buildkit-0.10.6 | 1 
         mxs-bootlets-10.12.01 | 1 
                  netsurf-3.10 | 1 
            ocf-linux-20171122 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opus-1.3.1 | 1 
               owl-linux-1.0.7 | 1 
                   pcre2-10.42 | 1 
                   perl-5.34.1 | 1 
                    php-8.1.14 | 1 
           python-bcrypt-4.0.1 | 1 
            quickjs-2021-03-27 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                 snmppp-3.4.10 | 1 
                 systemd-250.8 | 1 
toolchain-external-codescap... | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/5a075bfc4e229fe3fc343346b3b1f7e783d2f909 |     
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/5cb2a91f9832872033dd6e2cd67cef13570730cc | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/39a17c655a14c2e7d490266a66947a65e400b081 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/81cabb7a7f553ab25a5372a1a8f144ae7886767f | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c4a563909a25a49c81883b2697ddf98af7b28daf | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c14f23ce924a1be3a0f4b6f857edde06c7a24f49 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/55ea164d2eebdf913ba134cd6872d17daf6b8e4b | ORPH
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/12fe80cbefd028c697293ed898320ec821aaf369 | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f676ebb317f107232b2e0df7c40973fc8788c48a | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6e08783c4e3aa9c957310042df266834b8dbfc39 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e8acf0826661a30bbf603b75b65cb3b23a7ed8ed | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b16821093bd073c5919241285ca6d86bafcf8d04 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/90a5ff3172e464f164f55b99a243b71ede879567 | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d41a01518f6aa75ed07e3e2997e355decb89aebf | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/deccba87a9f4783b0dab3a7bfc98a8c3e4638006 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/712e9fe4bac265a89df81e50a60c513657e9644a | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f8aef87d3e835bceb0e2d344abe71ccae10e9a09 | ORPH
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b05dad4ae5dc7f6bc0fa8557d75cae7763e8b44e | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bfb270504aadabf8bc20b53daf9aa705e213f9ab | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/30337b4d657f913ae3bc7d08cfadad100fad8bc8 | ORPH
 aarch64_be  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5d6158e5df205fdb2815927cf011806a21cd01df | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4df420d881328593528f1ae04c7717e97bb918d9 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3c8af0df1b60217e461741368454cfddfda0d24c | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/83eae6b470bcdba1c44f0a655cb0a23f3186e914 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6935a99d5f45de7ed8e0ea429dbc9d8f330b59a7 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/26998bb67ca6eb31e6c14c5fee38036a9d7bca94 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/efd22752c23b3d13406ac6b3960ed40c192ae539 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/26159054d2e3754294c285b1d3d5aeb7d2e454d5 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/12f027eae2a18e2802d9271f32b58d311bb3da6a | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ff4c17c9b16038532df93b557904862a73573fa5 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4f0a645d0f1d74cce6ccf4b4998949bfaa30209d | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c52f447bb9b51d160121d7657fcb254c8767573c | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1d0208c89009c5ffef7426187e541460dedc9be8 | ORPH
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/20f64680601d3957da56e9f82f1e2757f623ec29 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/faa5599cc25b0a0bd074b6d06e3dd42870ecf507 |     
    sh4a     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/c88f5a16eb2ee1c79adb44548dfadf573c6c588d | ORPH
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a54b69afe20c8d93b06d85547de7e1bcb0d9e036 |     
   sh4aeb    |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/5d1a090ace40c28b0d15141890b7616715857cd0 |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/3ed6a252520121637484de062046f69188a26cff | ORPH
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/f39a2980fcb5a2f94d21b1a4f4812ff82c3dead0 | ORPH
    sh4      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/39fd07123c24e80705c232b9a335f582adce7ccb |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/9d443151dd599665aaa70db8bccfdee2d1810e80 | ORPH
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/85ec8d5ea8681810c3e5064c949ad256f897e140 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0edea07c6a8249ce84adbd7c98cfd2d0303658ee | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f34aa238f91a6e096703396d36de26ae1bba0297 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1ffccc647080bbca9626cb262695959678b05f3d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8abbda497f1be8c33d4730d0d68fd451f6e1d369 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2d60d5919afa9b3c150f3b416925564c6dfe6d1a | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0900dbf54c687b4637d8f5414323b08a4009fddf | ORPH
   mipsel    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/61e901eb823491317d834b8ff11d0313e74fa205 |     
  sparc64    |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/1ceb6284401b27795c67ec67c0fd1a0e02158182 |     
    or1k     |          eudev-3.2.11          | NOK | http://autobuild.buildroot.net/results/4a8f06191e664ff64be22f1e790bb4ca6e08f532 |     
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/e9742425ee4d993fb6ccf567a55d8e50d1d08a37 |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/a91e6715a028d0f23096282bbe6f6d8e5d4799f2 |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/e94010ed7e0156589ab0d69e5acfd868c900f36c |     
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/d9cf9e322eb30b3477e6278e0249467c7661a832 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/8e0c9225593dd0b3d1a6e74f0c1efd9195a912bf | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/fff0ec73b9b4ea8649ed08adac2a967472f7ccd4 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/604f507e654a942628bb61c603a420fdba774fa0 |     
    i586     |       freeswitch-1.10.8        | NOK | http://autobuild.buildroot.net/results/a751f8d69a5ddec595c02f7ec80fc2df57a37e91 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/7aef0fa2fb306ec821458ace870be4a754d4df0f |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/e8657433b9684e46672eb8ec2f6c8a961209f8c0 |     
    or1k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c0229e4c4f998846b0fddb802e5a349965d94356 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a6fe0c4e9d496723befcac90926e2c13e139b1c8 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/be7c010cfa3c8ef5e2a44c09e1baa751f2ddac89 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a57da58d76f803acc755f26891e73781a2c0a3f2 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/df78845c51a8857a42859f193853eda20fd3c164 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9132377d8768d243166b1f0673de624494b543d6 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a605eb4cd348340af74db8ef7a855f5294eedb1d |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/90181b7cd572583a230b0ea9b7c9f0eb5f9bfc0d |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3b5064f7b0e93c24cf97156be5a585e0e2ca24de |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9dcf6d050ab2fff84719af9a3e269ce34d47930a |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/692bec4f6f37d7bea1f464def68850d898985b0a |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/032b579834a34d0e68e4d2c8cdd046be9fc8d67d |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3779cc2351a4d46dac662f37e61f09295bdce30a |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dc16531d9eec79fe63d1e1d300f80c9337bfbd9b |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f583cbe2ce1f70e23ff75b821f5888bad7d11a9d |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7cc16cc9e4451033a30e977699ac10d898c3c37b |     
    sh4      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9a25a08274de9b54507f631a048e2e1b0fde5e05 |     
   sh4aeb    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/22ad129ffb953f13faff3858f699d9eadb7dd685 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b508bb84ebfaf7b16793ae67017e5d8812d8a91f |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/28066c5d61c2353520a573732c21dc327c378a00 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f6f0ff842d22185341fedae411491a058052111c |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/aff52e7860ea9c26fa1b555e6a6edf99e6ee503c |     
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/05bd7cdbb512430d643744121ccc17f4e2c1f482 |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/a0a6f93a2c4e88e8b117141452d44ef51f94efbe | ORPH
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0fefe8bd7131993687ced142b3d0510297b23c89 |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/05fce7075e88bc8b9bf62e228c43227a80beaa82 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/a034de839c306d1968632ef46005c3960d6714a1 |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b9b451397ed3492e60ccac893c23cadf2de32285 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/fc5f8bc3cf54705017273a78bbf909d70e4baaa3 | ORPH
   mips64    |          gnutls-3.7.8          | NOK | http://autobuild.buildroot.net/results/5bca9ad0ddd076a85dc4af7aa2a49ee6a08becf0 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4ee64ee6c653e8671952953fae8bdcdc42279076 |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b599f2237818139761cbf7aaedbe1261475bc90e | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a88aa8e222deb757d0b631d0fa24aa82eda3a568 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0b475da3ef899b1e21464046e9044816ea52e3fa | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c314665611ae25be78c7125daf8b619c39510dc9 | ORPH
   armeb     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/45caae1fbd2518fb4810101382da555df6faf5cd | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2fe290d4019e2c09fc19c49c90f2c5ebb524b513 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a36b46ba5a1fe6b4861678d0c0d9d1abfb6efea7 | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/ed50cfefec59cff10694f0769ef56ed68db91c30 |     
powerpc64le  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/72911a8a184dd388af1aa46430445edfc3e1ed13 | ORPH
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/d6c707d7822f1e7c7c408f2a73c4c94f603f5986 | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/9b51573809856f00c9eb1caef452108f518bc033 | ORPH
    i686     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7bf0896543b93382fe6a5cc85610a1213f4582fc |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/331e3becadc797c779c7a0aa95eddd9d98426f1f |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/92b8ac92ec90b07fec783f44e63f036d618789c2 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0135e2de941d99151eb784e683fedfd59b922703 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/068c8f047459147299e710f1da5a6f5f6ab5286b |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b9a85e4c7e1bae658d74c6bf8579283d38c82564 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/374ea6e0133560879dafef05c331beb61cf42634 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3c2616dbe9dd8d189dcefd5092a9e3409af4c068 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/14dd679453bf87ba54fb5dca4d6baca623d71e56 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/be40a4213cfe44ce267dee52404477baa361c89a |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3dcdcde58416886fdb43e3990eb58d7c32a2fa24 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/afe9e3d4f38c03ae1322bc574d3ff2ddee9ee45c |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d4a4472ae3e4c929afbf38b90f99ce4e7d10f1e5 |     
    sh4      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f735c493adde289c39390c3bca993a08e49243c2 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/94d953329b864bf3c952e211a9c43b93cf4d911a |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ccffca4c034225d7451359cadccc06d103f9b25e |     
   armeb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/fd6c029eae7227118d80288a21e56f986b8f6f46 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7184778eb636ebce30e072a337e44fb96fff6180 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ae90f8549179d10a9e19fe24bec28cd82295c1cd |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ba522087a1285262e5268667183e1767c264d64e |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/70da07ca9ebd635e10fbc2ab4f7fc1ab29205cfe |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/12d262426ed178858af322290f9092e4eb7aa361 |     
    sh4      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3e92dd65556cf040e8aaea6cff073959d6150cd3 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0efb745b7eefea66e9e1b23a652ffc58600d340a |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a46b9a70ff4cfb33bab3dd0a8bdb9c25fb7b7f25 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/08b0e03af929c5969bf36f995b21b94ec222aba7 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/96205be9d1cad17361e91a2e20d2e373a5093dcb |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6dc6a2dbaa065aa8d0281b5ecfd2ed6346aaadba |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a25334db1a8a5a4c150de4b928eef741d56f4935 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/508e17e3a25f67d83204dd69ce973cd30c919034 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fdbe4789174efb2c17cc03a17f6e424a1f46450f |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9f7ba3189627a10dbb76a6444d8dd832909a5d43 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/40437700f8f8167ed3e82779c84517ae50e18811 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0be46486eae2fbb3db415f07def71c7e49821a53 |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ac19ba5cd3bd1a60213a76fde4456b4846bb63f9 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e663c8bff8fd43a7f66dc0085dfa78fc2e44783b |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/359e4c2ece57cf951fc6d43ed84b9859629c45bd |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e3ec20897a9c5736d1141baf7f1326c8e1aa8f41 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fb91c8626ec1b7a468f018c56b3d81eb974771f9 |     
    sh4      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1e5905ab55a2eaf97a63066554dc2e11a57aad41 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9c59f4b71cad4a5066228865b77652fbb44418b6 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4d895210dba49cdf9abf936ff01c3f754151df4b |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/009b77670c0e25f8db596dbf6cf80ac66fd94463 |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/21ea1cfde03ceb08172dc56ebeaafd0bf3be8526 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/9ca730fd44943d3d68588baa170c02b1a94712d7 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/9c7f1f2de896ac52c305276cb09194e09f87a8ec | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/493b32b1d264f41da462b35e2de6d066c75708c2 | ORPH
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/63f9b5583702d26c091e18f09a6ec703361e9356 |     
    i586     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/108dc72a4365a6c0420bc7eb12059cda1c41399b |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/d3d5f59e1588fb1d0147c02b01677e49115db132 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/71bc3fc4fa9fa8642a7a4a8731c333d89e0bfbd5 |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/26a74db91bbb48adb5bd600ea52dd10cb25bac53 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/76ea653f8b346f96c51a4684b425fbe7df653873 |     
   x86_64    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/80bd27ef3adca9f6c9aaf3ab3d26c6091e12e363 |     
powerpc64le  |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/854b5320d8b724205ab071c8da9e6fe7ef5a0fb1 |     
  powerpc    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/fc8b5163055f3fb3d5a380b24ce75622406dd204 |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/25624f524e994589c54f7765001a896428bc6cfa |     
   armeb     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/7a92f1923b504b64c6f192d6cbb1b600b169ad4d |     
    i686     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/ded9a9a6189ba2e4f5136473676899023690d4d3 |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/3cf8a9acc3a7a5c78856402aff4df95c90f44b58 |     
  aarch64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/96762d3383a549a1e2cb96ad76407367ae7a03da |     
  sparc64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/7c2d562cbf738c955737f74a75b7a17a07a6a296 |     
  powerpc    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/8d5726ec2e545620f6e195322f08e4b810878ba2 |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/ad9377d29e56b8603cf637aaee69440be4839c62 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b9b967aaf5ab0bb6d512235863e2aa9f76b34c7a |     
 microblaze  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/aa919b1d54214d45db469c4a696442f5f86069dd |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/48af62446cf3681ca0b29b426dcae77ca909d03b |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/de06e1816b521a38b2a6c2219daa095254c73467 |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/131ed46f521f98bc27089cb47a8287463a79e61e |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f7c313b8a3994aea72f0630ccc139e1b796189f1 |     
    arm      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f7b6d6a9f7bdff3fe4133046bb641101e11e29af |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/bcfbda41ac88eea7a117cbbb3f02970d86aae43b | ORPH
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/100c8242d0dadbb4870531b12d9d84695c4efb00 |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/621033c3dc7ea58344e69dabda31c19cd8d45eda |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/00f06255b5ecba8d0581003b03e58bf5e22e9841 |     
 aarch64_be  |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/c2d12b5981a9e4ed5c9f6efbb0dcb363ce2fcbe8 |     
    sh4a     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/3b820eae75ac4ec98884abf52124f3a59555d68a |     
  sparc64    |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/58d749fa3feb3ff41f8963a4fb50a295f3ec15f5 |     
    mips     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/4946fa1ae391a572d0370fbcccc9ef5d741aec3e |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/47bd42890b5c42522896d37d58fb64eccfa6ee57 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9d13e8cdce862168764019bc95c057538c36b05b | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/83f1c6a6406b77113828b25a8ae3323028b4d979 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/392f72c79fd3c33beb3748f452fc30501dd599af | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/078b13192d539b2da72847eb3ab06bc6eb7e8d9e |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b90ecb3267dc8e81e108037dd20f87119bed80e3 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/fae61ab4d77ffef4b52e7dd73ecd9788ab079df0 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b2692f1b83b8b97d5903a5e565db12f7f3e18074 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6d6dd98cb46f35b4105c774214f16a84e8a089cd |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/34eff6dc8b2529f14321dbfcffbae58cbc3e2ff0 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/3b4971f2d3fd5f1097c89d8dcbc570a72fd62df4 | ORPH
    sh4      |        libmdbx-0.11.13         | NOK | http://autobuild.buildroot.net/results/9ab611408cb9d110fa80b81c43450882f723f6d9 |     
powerpc64le  |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/718a1bde1d2ca3c773ca3915fb8dc1840d86cc05 | ORPH
  mips64el   |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/f6bce25fada6fbe229ab90757024d40945cab57c |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/0e19df92f2549c778c6d7d6ca82017210157ed0a |     
  sparc64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/28d3502890422e9b99574e470bda52d43895fb78 | ORPH
    or1k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/05e75594d6807a3f8bba9a4f6a844a0766444edc | ORPH
    m68k     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/b197f440f17f2576154a82748602c16be241c55b | ORPH
    mips     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/d1295de24ccf1a57f5052e6ef172bdd14fa3b49f | ORPH
    arc      |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/abc53e81de05e575986f485d4577da2cc6deadce | ORPH
   sh4aeb    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/a9f8eaf13d243a18d9c68810a4ec8ebf0e81ea37 | ORPH
    m68k     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/6df92f99b28abd14ae732c5e53474b19f0ecf0ec | ORPH
   arceb     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/57baeb3e908a231d6c800c624881cec34916ebaa | ORPH
   mipsel    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/6b00ffe793d953f7915ecced9c8887f38312cfc7 | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/21318329a4a550f2c1cfbdf381506ff3cfe7436c | ORPH
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/506ff1827dd7bf1aea3f1a0359983a1fd474e4bf |     
  powerpc    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/aa0a2085bca7a372a3a4cc4041d3a426ab1273fb |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/0cd0999309522b1d66ee0c7da11c6f70d1f63f55 | ORPH
   armeb     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/e127fbf158394ad3cba09bf5ff81fae932487eb1 | ORPH
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/bca5b4480ebada1fdc03275fcf29555f10be744c |     
  riscv64    |             mimic              | TIM | http://autobuild.buildroot.net/results/6bc851dddb3f9884a13ef9f6d73bc1135ab26190 |     
   x86_64    |      moby-buildkit-0.10.6      | NOK | http://autobuild.buildroot.net/results/22d7e515f3f1a79b58f79e02727fb060b59bc1fc |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/7c6bbe092fdd6b7a4383bbfb98104eec47a17542 | ORPH
    i686     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/4a704d5b4fe37cddb528170d69376c388fdab876 |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/14234d9479426b89fadfb6370ec15ae42c69c02b |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/5d396f2b92aa0adee1678bbe60b4d80db1adc2d5 |     
    sh4      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/35b7e2158dbc1ee2a17be44637183d122f68ccee |     
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d24970a0daa034d95c6886fbdff0ceb4d1e98bde | ORPH
   armeb     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9df8e83633bf95ff11bbcec668058d409c36eec8 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0e831c1fdda018796becc25009f67d07a3e624ba | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/588fdedf6387223d416e5069516541c7581e5280 | ORPH
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/999ce8a72bf794be22e6a5ad02dfc11ecaa3149b | ORPH
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/6e52088c2a5f6c6c0e6024a67af26f73be681996 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/eda3f4029236ae6babe8cbf27804934868e2cd69 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/a4219197e9c594d5458250ef96c3cbbd02eb8933 | ORPH
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/6cc30833578702fb191eab1b936efa4788d93762 |     
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/69baa77034d4699f695ac2deb7f4da0753596b3f | ORPH
   armeb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/a96e038f2aa6a4fc67c57cd7951b9c8eeb3080df | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/6e893c50c34dd346f9f2dcf3b2e92f41fb833e71 | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3c63222618455ff646a78b656cdbebb083db0969 | ORPH
    i686     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/4547a9b1087a6154be635650ffd3b8cc1ed6b624 | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/a3d7f8a71026a31e06c185568d1c164cbdf05b00 | ORPH
   sparc     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/613eaf7a859e6295f14a02d44cbbc4ef807099f9 |     
   sparc     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/42b913c862e8e21051f2f944d24529de5c968142 |     
 microblaze  |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/af37692b23eb1feabc8d5e2e1074e389948e8f60 |     
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/24f2d3eb0e8b1e6f01f5562ccf6bf28255c17215 | ORPH
   armeb     |        owl-linux-1.0.7         | NOK | http://autobuild.buildroot.net/results/178af832c4f34057b234d263f9417e4efc7bb12b |     
powerpc64le  |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/4e5ca641903c6a27ac62e90476b15ef72b213f94 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/bdbceab78392e2bed2c207c15a2ad0733a862b3d |     
 microblaze  |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/a03d0f673280e5f3fdae0be78536de3d82b89813 |     
 powerpc64   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/1c2f08732c5988a4f7abd243efb85120b60562c1 |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c8babcadd019df73da4925140b73c7d7224b2384 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/7d6ffd49fe5a0ef73d657ed71481190e67df4f2c |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/d6f9a20608d4a3b61c179b5c8fd3e8391727be4d |     
   mipsel    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/0c2bcd7d293cc363f8bf958bce46e251b227142c |     
    sh4      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/0c0803ba73057c625fe3299d1869bd71cd67ebc9 |     
   x86_64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/ddc1d4409f60f0b6d5a0baf6050d1eeabf1451ec |     
 powerpc64   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/220e62064fe73349c49afdf265200e4b888ee37e |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/2a19b26cc8105f2c39f5f2541a097c7820d31cbc |     
    or1k     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/ac53962b30503660ca66fdce95892f243b95ee4d |     
   sh4eb     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/b566e4c00c518cfc1cfa30081610ab9c9f46f4b1 |     
   s390x     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/16afaf89a8abdd7a659f52998b1f3e8944ee48a7 |     
  powerpc    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/b5335460a2ff442063da1acf8b1a430d6229e3aa |     
    i686     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/84fe96f08a7efaa51a772ba7c563800e2751d881 |     
  aarch64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/5435e8ea3d320e6ca4b089110ee1d1b2fa7ccdcc |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/cd0844dc96ffbecb419cf697d8c44db366b942d7 |     
   x86_64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/3373f37b9273da06b991bcff685d816ca817fcf1 |     
 aarch64_be  |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/06a73c35c9d68ddf957e0f4e785e665aecc7da84 |     
   xtensa    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/a3efa95e43c62c17edd9f5166a3eed3dbfeb21d8 |     
   xtensa    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/3ee373d513a2e383df60ce9248c4c1e24c29c4be |     
   mips64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/6c6096862d45698d19daf4bd988c4778b3e39f73 |     
  sparc64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/b38ce49e70cd7c5fc270147fb273766d7f9b7e50 |     
    i686     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/055ee1f30855d5346b64bbd318eeb354be2cbb32 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/0e79de9c9f3ccc06f2850eedc7a706d4fd43afef | ORPH
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/6e7539e8e4aef666799f322138318b7d57d9d16f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ce7d6b07de6dd5a82cb658b2553ad6bdd066f1eb |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/1d7fc643a4666825836d80abbe8716128c1346b3 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2ac7b1e1239c26206fae12d5c67caedc3b23743a |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/53d1bd33379e50f604cf037c9c9f9754a52d5a36 |     
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/48012362584b5d90c0f82bf4dbca612f05d693b7 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6b50043605a18d1246e4ee0d21e0abe9aab79c04 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/f7ea101295c2e769840629083197ede5192aab3e | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c934ebd2cd1a19be5c77fbb1c1e06e5cf2940751 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/8d7541f4efbb0e1a68ce98c0a3a119e6b0bb4d84 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/4f0eefccadb91a5965e93edce9080c0df2d105e9 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3347a021b3e00297b4d2a3dbc0977c697fdcc1f0 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9f8c2d2a5d269c68386ed63d08673661f406dead | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c332c9074814908fea5afcf748d8366cadd4a02c |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-rust-1.64.0 | 3 
                elfutils-0.186 | 1 
            host-binutils-2.38 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                  linux-6.0.16 | 1 
                  mender-3.4.0 | 1 
                  ntpsec-1_2_1 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                 uclibc-1.0.42 | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dff1c0a4a02e5c949cd28be8f7e30a9557a57765 | ORPH
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/902c4bd26aa5915eac7b93c3d73147a9e3afb437 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f08b308f59e99b2f6b41564b6ce47c63c39f7075 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/83fb29ea556f4479363018637e05631e88702596 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/0e165af9e0bbac165642905da509aec4e0e8bc86 |     
  riscv32    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/a310c3eb532691afd3386e5afa573b387d4c73b1 | ORPH
   mips64    |          linux-6.0.16          | NOK | http://autobuild.buildroot.net/results/eca39b2070fbd5a591355b17b877fb0c95b93b0f | ORPH
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/69c1aab8c7d68a9ad19685e5bf776563012caa24 |     
   xtensa    |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/d71adb5988c62337eaea2accc37bbd9e9ff219bf | ORPH
    arm      |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/f619d29a58f169b4042c81d117048921e723b064 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b9b3835922eea9f4c384d7e7a74eee04232a7cd9 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/02caf34f76f6a93081b87c1056ea2adcc5b9277c |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

