Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4983EC636CD
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 06:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2621400DD;
	Tue, 31 Jan 2023 06:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2621400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKod1lF8ARES; Tue, 31 Jan 2023 06:55:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57C734010C;
	Tue, 31 Jan 2023 06:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57C734010C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3701BF954
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 06:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 272E78135A
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 06:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272E78135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLIPJdeylVxB for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 06:55:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F4E81359
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9F4E81359
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 06:55:38 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A6E4EE0004
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 06:55:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 06:55:35 -0000
Message-Id: <20230131065542.272E78135A@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1675148135; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MkfuV9hEKu2HG0lfYCRGj+8+NpDr3gQ3c9Z9l/Lg7Mg=;
 b=SdgCPKobYKOK8Y1XzDRMhRZCjGW5UV7xJMtAv3Yoq3yqlcC2acs0cAbHgZ5g2ygwmBVBpS
 GuVr3fM+xGOsYPNzBzia6mMjGBSCq55A33usZMQC4MLecmfR1b4/3O06e+45qHmgC2fmTY
 mz9xRWFN5M8pqOpqYFL4GqBn8rCBtqj0gGSW/9ySUrsMobZlRjcmK/nBYmFNGbaTV4FLs2
 DPfAfdtHWSJ9GLKzfEIThT8/8CnIvB5AXaAqbSun1Xc3SHJBcGiqLwIEXCvTHf4UjttcLB
 8hMhvUxsrziQbzRWSAym/BSwTKATQ56QaQHGmxaO1mjTbeUlKPMhql+M8fJExQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SdgCPKob
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-30
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

Autobuild statistics for 2023-01-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  3  |  0  |  6  |
  2022.11.x  | 17  | 17  |  0  | 34  |
    master   | 157 | 323 |  1  | 481 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 29
                    fwup-1.9.1 | 16
neon-2-sse-a15b489e1222b208... | 15
              fluent-bit-2.0.8 | 14
fxdiv-63058eff77e11aa15bf53... | 10
                  jack2-1.9.21 | 10
                     xz-5.2.10 | 9 
                   bash-5.2.15 | 8 
               libglib2-2.72.3 | 8 
                    opkg-0.4.5 | 8 
            host-binutils-2.38 | 7 
               libfuse3-3.13.0 | 7 
             dahdi-linux-3.2.0 | 6 
                host-go-1.19.5 | 6 
                   linux-6.1.5 | 6 
                    pixz-1.0.7 | 6 
  gobject-introspection-1.72.0 | 5 
                       unknown | 5 
                  xxhash-0.8.1 | 5 
             fontconfig-2.13.1 | 4 
              host-pahole-1.24 | 4 
      linux-5.10.145-cip17-rt7 | 4 
                    norm-1.5.8 | 4 
                 wolftpm-2.7.0 | 4 
                elfutils-0.186 | 3 
                gerbera-1.10.0 | 3 
                     gmp-6.2.1 | 3 
                 nerdctl-1.0.0 | 3 
            ocf-linux-20171122 | 3 
            python-bunch-1.0.1 | 3 
rtl8723ds-bt-14cedf3a9fec1a... | 3 
                xenomai-3.0.10 | 3 
                  zabbix-5.4.9 | 3 
                   bird-2.0.11 | 2 
                bpftool-v7.1.0 | 2 
                     efivar-38 | 2 
                 freerdp-2.9.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                   gvfs-1.48.1 | 2 
             host-delve-1.20.0 | 2 
         host-sentry-cli-2.8.0 | 2 
                  janet-1.26.0 | 2 
          libcamera-apps-1.1.0 | 2 
               libcap-ng-0.8.3 | 2 
           libvncserver-0.9.14 | 2 
                  netsurf-3.10 | 2 
           optee-client-3.19.0 | 2 
    python-cryptography-39.0.0 | 2 
qt5base-2ffb7ad8a1079a0444b... | 2 
                  vim-9.0.1260 | 2 
                alsa-lib-1.2.8 | 1 
                  assimp-5.2.5 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.80.0 | 1 
                  check-0.15.2 | 1 
             cni-plugins-1.1.1 | 1 
                 dhcp-4.4.3-P1 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202208 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.43 | 1 
                flannel-0.14.0 | 1 
             flare-engine-1.14 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
host-gcc-final-arc-2020.09-... | 1 
              host-rust-1.66.1 | 1 
             host-vim-9.0.1260 | 1 
                  hwdata-0.365 | 1 
           intel-gmmlib-22.3.3 | 1 
                jailhouse-0.12 | 1 
                   json-c-0.16 | 1 
      libabseil-cpp-20220623.1 | 1 
              libgcrypt-1.10.1 | 1 
        liblog4c-localtime-1.0 | 1 
              libostree-2022.7 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
                mongodb-4.2.18 | 1 
              mosquitto-2.0.15 | 1 
                    mpv-0.33.1 | 1 
         multipath-tools-0.9.4 | 1 
         mxs-bootlets-10.12.01 | 1 
                    opus-1.3.1 | 1 
                   pcre2-10.42 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
           python-pyicu-2.10.2 | 1 
                      rauc-1.8 | 1 
                rng-tools-6.16 | 1 
        s6-linux-utils-2.6.0.0 | 1 
     s6-portable-utils-2.2.5.0 | 1 
                   sdl2-2.26.2 | 1 
            ssdp-responder-1.9 | 1 
                sysrepo-2.2.12 | 1 
                 systemd-250.8 | 1 
                 uclibc-1.0.42 | 1 
           xtables-addons-3.22 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/ec7ff77cb2b991565ddbab6c5d34dadac57ffe39 |     
  mips64el   |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/5778d25aff810efd1da763abb531d138b6d71613 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/de979f3e272503e839dc89a2fca662651c2d3f2c | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5cf1322d4c797c07e804ba2fad883019ff742a16 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c3bdadd03147cc635f550efe46db361540aeadef | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/88e578278644e83afb0ad848ee9e1f9aa83fe8ec | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7363c79cbb3bc510e02c4a848129828c40e92680 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/25a3114f6057e50cd0517fb0d92dbd3cf8e92c27 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ce7796102a49fcb4d5d248e7f9a0c1681be9300a | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/dadfcd3b22d33d49d0127f719fd72f6e14ae9b12 | ORPH
    sh4a     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/833d68946d8385985cfdf3839368beaab9945d71 | ORPH
   s390x     |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/094b360fc39ab461dbf2db5a633da939f81def47 |     
   sparc     |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/80ba6484d9746a9e05bc614d88a1b791ccad70d3 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/44fd02077db5f8b5be68153b9257680db7faa5f1 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/1f3ddbc4766f89bbd468abf2c205357eae7905d3 |     
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/1569bbc3cba0d9c13133853736546165548ad305 |     
  mips64el   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/b4b521016b2f65ff19974c085255337adb265e98 | ORPH
   s390x     |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/5d6d3c24d119e3570a221cf1fb9a5b61d8c8bbe6 |     
  aarch64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/737df145c498040df29111a6335197b4f18cf38d |     
  aarch64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/983f189bf42353a512b26c7c57a6995656417fb7 |     
   armeb     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/58690ef76eb637040c0f7f74f762f3ce0ce8e57f |     
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/a762a9421e7156c3c8a544aa4285b62444e96cb9 |     
microblazeel |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/b4e5ede6e1a346d41936b5b95e6bf188e44c8dd1 |     
powerpc64le  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/9d2f396fa246d1046c7a3c233a62642f420b80a1 |     
    sh4a     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/bcab7a82fedb4d9a2d223207a0cf03740f416f27 | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2f27307f128a9ef105380c27526bc33091d50f32 | ORPH
    i686     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/420d2cdbbd402c8746abfbf7de7f9164b62852f3 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/544825de5205cdf4807faa11c936cc8fa9b4308a |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2b4793a2e27351e6cb277ca6bb8af450d32dbdb1 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5f4dbbd485556bc60347083447a39ee4d24aadb5 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2f56c333373b69ff4e9109efa915baa1569a67e5 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9769dd7c5969d63d2f91e9bb6c9ce0bbbd26be3b | ORPH
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/ae313c7e00e198a80705ad979ca6d7bac3bd9422 |     
   arceb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/e8eceddc191bda614ace976c5e748a10962cda84 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/d62895d8d919c7578ce6d45318d7a5e2b25b5c74 | ORPH
    arm      |           file-5.43            | NOK | http://autobuild.buildroot.net/results/db95da0be4034640d4fe8d62fa8b6ffd6179acf4 | ORPH
powerpc64le  |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/4f94dbd1e307bf5218eb2306dcadac0513a0028b |     
  mips64el   |       flare-engine-1.14        | NOK | http://autobuild.buildroot.net/results/1f49a3cb89d90cc2330d42a15872799a993c7893 |     
    mips     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/139f93956f79df88df9c51492cd761fbe3081cbe |     
powerpc64le  |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/ae80c41e232ad76209443f8df1d5e77a9292b37a |     
 powerpc64   |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/f722c06fd0ec813fced8054a382f8aea3fb9b7c3 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/56c2c9c9c081ee307fb5e96f58be04751584d14d |     
    or1k     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/9970375b066e2ec3e9797356738828cde5e6b647 |     
  aarch64    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/252efb49ca2a475c6135e71aab514ddf4217ff25 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/a65b1ba1afee26ec9b4330ec220fb8a912ceed22 |     
  powerpc    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/3cc3bcbbda3b08c8aeefc00c0030b37055fddb1e |     
   mipsel    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/335b73001298383f02bae2b2f877adb144636c0b |     
   x86_64    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/1df45ab56595dbf1f0382dc1466f2cf29d17ef1d |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/1c25f61dacf1a34d56f2bdc22cccaafad84ab79e |     
  sparc64    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/8d3b57414acd8eb6648ea02049c40264402b36dc |     
  sparc64    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/c89c4f2e8e38f4aeb42275836ef5da0227e02762 |     
powerpc64le  |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/f360ff067cd10a2ace7d328b325b84474b1a9bd2 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b91417db2b0de56f743006aba234de2fe58cd366 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9cc48b42a874049b9f64529e8c7cb375dacf3268 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/05d0a8ddce7ca51fd54576ea71ea47e815403b27 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e5afdf7c7003daaf4b36b9d7daf5a9586bf6fafc | ORPH
   armeb     |         freerdp-2.9.0          | NOK | http://autobuild.buildroot.net/results/67483327bf2cf32b6862d696334bc53127f5d249 |     
    arm      |         freerdp-2.9.0          | NOK | http://autobuild.buildroot.net/results/1eb1f68aafe5abcfe43076d03565b4adb1957131 |     
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/3056cc6e352f1f6ce3521637b8334e7360c9641e |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/9925b0647742a7b1614d5638580961d208432585 |     
  sparc64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/f5f329387220ad43d595b8b28310dfc06796235d |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/24fccae842e29c161359107ab3c75b3f60aa43a0 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3e9a8ed9978b523b5d40a4190f8d49b28795e0ba |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/884aaca68c3f7b4d2237f80690f055f333dd34ab |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/581f7fabd871a01556f5120709d9c88f0fe47338 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3a6eac83963335db6e2f8bdcae273c3653face3a |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9585ea1a85445af651007cb791700587ecab02f9 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0857cfa214f5244ccf9cb2eca647d16c75b33945 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ced985c9dbfd0e8e19def99c02ff2df28249392b |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/01670c05f1721bbb36268e46f1c1c88f93465131 |     
    sh4      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f117916a4dff3c274e7a1207e9aa97dd12f4a1ab |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c7800d9a2e39d782a3baaa5f04ea827bfa4f3bc3 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7b8defde1704b147e9210a13cad7078720369f64 |     
    sh4      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/20e3c70d118946253ce0c6cf12498d54faa36101 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a53720f98c0b394dfae521340e82bbcc9a1551c6 |     
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/095bfd213fd335b57d8d0ef0f98ce7b23b3d57d9 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bf11150cecc40a7df9040f90759263a60bec7303 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e5d5388eae52e9cad4f992524f44a65fdc46d5c4 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5c251ac626ec3c759af40e006600911a6ac71b15 |     
    m68k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fd890ddb55d0c4e3d4f9c0a7e25fa13008d85e80 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e5ab571c361199c2a11653fd795f2251f476a2d1 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/57578e87dce8be94457c156ede1b375d6fc20852 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6106fae20565b32e1ce6c003bb21f3266e276530 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/adecd192c08a160dd7283c231cb01921bcc6214e |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f1269d20bd1c62fd33f9ea7ac0e764d610548d8d |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f30bf0e0328b018a75c332836d003e4a86bcaf97 |     
   s390x     | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/2838a0771cc642cfd2e81f1f79bf1695bb84131a |     
 powerpc64   | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/b0f3b6352429a5156a8c3a2b932331753887b65b |     
  aarch64    | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/52f634c06bdfe983280a2c01bb9fec4b0e1a4b34 |     
   arceb     | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/181b85d9dd505693ed23fab823085b001aa785f4 |     
    arm      | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/f683772a5e029f9f607f5821e6bc62d43df3f00d |     
    arc      | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/501fd582a2a0707edab2309ee39f3f004c56d242 |     
   xtensa    | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/90364411b2e863016e1e0673d19d7e34f7bdb077 |     
  sparc64    | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/45558eb012373c6ad84e5d78284f4ef0ed28b298 |     
  aarch64    | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/51cd1aa34be2042b471b2ad404bc9e707e59bdcf |     
  powerpc    | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/fe0be6fd00f5f498b6b7341e7cebcd6aaadcd892 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b702ed9a1cf477cb449d42b79940b1b1e5bc1d32 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/42bee3b0d8cc9527b20780faf6f461163853a604 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a4ac6d5cbb2eb3e7ee65682c51f7832161172601 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/627fb7f0fb54a4e1d81c4e9249073c36f7cc6cc7 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/c41d7906ccff6250317fd40115999741aaacd806 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/27f64c2a9ea9a91b4d27eb594c241dd87a175084 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/631d210a1fc5ce8bb4905a7e1451f64f660fa66d |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8c9590747c0c3f31de52c5b5cc5f77676eeaa5d8 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8e1591e8098dd76ac79e4faba472dcb07c8215f3 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6ff28e50cc77e62b2b8a19e3eb3b5f353457af1d | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1bf33ef0be255867099abcbad4a9cd5d62665af1 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7b660de746c39e1bd374d5212992b926c815efab | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/1a49f373fd1355c5198f525b5f28394de5b2ec46 |     
   mips64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/14035d57c01c5ce8543289a03080abf86f734486 | ORPH
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/3b68faa36b48621d9396e54644079f296a547c9c | ORPH
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0bbe278910282bfdc4c764cbde09b89680c4ae92 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/df72e58ccf782046c8c88f4512c314b24f6f910b |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/deab34c9c698f062dbe78706f5b54a3195cfbe9c |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/46bddec9b167c4ffd966a558ed88e42fd7b1ef41 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a75d1169250139c430ebb2b48ff84a7522812dfe |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/960587ba2456d4d8fe3ce845b56c32461d6b5210 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/56fa4a063a3b55f413a50683f364d2a6c11ad8a5 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f13ca456f5460bc150149b2dc6fcd85f7b6619c5 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/780ef97c89904be40c7686d9c6bc06cbd0be2a1a |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/0d04326f7d0c82fe9b0b7ef57eebca8aa1330cd3 |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/ce60ee976c25b3a8f4085406539c48aa137e2bad |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7426f7104de610ce48584f127d36fa454781a8f0 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2f13144b63a922ec401139e88e46f3a3f9f6c67f |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/206b2c7dea16863398a95b36e5aaebd108b1450c |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/590a79ddb1da61066e37ed196d0e1a36c293737c |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/03d533bdaa05e3c8601dd571536accbe1d7c7a8b |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/642873125ee5915139a723330330ca16e119608a |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7d26892e7c5d8be1b80e60e0b9f2d89a18de1f69 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c6b18a066074d1546b46e3a3654ea049e44b7830 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e90e393abe9aec8df27c14ec949ba208ca95a616 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/825d1c008cf2350ec2005e434ea4fb0c740ef7e4 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/657bbcb2be03a2d9e6d7a429046654e550d8eb9b |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/af43fd789ad58e0f317f6876153d61864f48ebf5 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/374bc4133decb1cf1516694d34a8213988756bc6 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e4278bed710f4c681523bac8406a2a888084f5c0 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5f379de9ae9c2032d576a177a451f3491c69d42f |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/97f650db9c3f3acb34de18d1deedf97a3ccebdc2 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/283c821992488b701d087a540f58e26fe09f194a |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/837ba82a41e150ffa85180151e24c16c5dad8882 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bccbe869f8d70e2d7be5fafbc6aa0296d352c9b4 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ed07f58ffa981316ed6295820853d800ed3e6678 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/665b19a645f0fb491eed6b4d8965636ef462bc7c |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a230f42a6848a388ca640fed0067c9f466130e50 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a0b2b620ddc92260adb00b08d53a05c7f583f764 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3b82115a9a8bba31701ba0fc75c9cc7b93958763 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b4e072e50a2c3e04e8835811010bec9f5cbbd1b7 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/33fae5f4272e88492b2805f32514192c036038ab |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1d11223d4ae919db3ab5429e42d950ae69c11fa8 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e99192d195448551c27b6e2c6fa2e8762344453a |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/651ebb892407b7cb504309f3c870381839e2414b |     
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/84e4f8a2ed0440947d5ecc0bbdea0970abfa6a92 |     
powerpc64le  |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/c3478149d2681d6de7adb58457ab070e8590bd76 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f6559ae174b866811a3e087766fcd299d568c0bc |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/ee1adc2832bcf2acfda0cfdcdc687a31d0b5dfde |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/678d7ebb6383564bfaffb586cd94688939c2305d |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/0bd9d2db17930c4ae6cee3135cb61a7f478773ca |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/df3f6b14f7d817adcf3ffccd01dd07b82406b396 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6d956428350c679b29b7c4f5c72d55a5f2087400 |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5f0a08457ca25f90c7161dd86c972fa355a947c0 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/77b8fcfac1bb4437e4b1f8382ccf5960f40edde3 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/73ec4e60d3853d6275bc2bf6607810f98c4c074b |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/99872ea221f05672bb2e2aa012ae382a499cd56f |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/27fd0c6a1558b5aa07e8d5d126b05a31a8cb062b |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/ee078f02285cc0fa304f4700423dabf50507288c |     
   s390x     |       host-vim-9.0.1260        | NOK | http://autobuild.buildroot.net/results/0ad43d35e23ecc82af573385ba1a376378cf096f | ORPH
  mips64el   |          hwdata-0.365          | NOK | http://autobuild.buildroot.net/results/0c1ec824b2ee3256851cd13b12ce935641e3d563 | ORPH
   x86_64    |      intel-gmmlib-22.3.3       | NOK | http://autobuild.buildroot.net/results/c1120932e8c212820b239ee8cd4a057623a73376 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ae1919d27c54cc9f289d3e8cbf4eeb5de0eaffdf |     
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/4bdd86deb7e3e049fd089f9bcde2dbf6c925e95e |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a86086355b3dae22ba75056749eb94314a90bb81 |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e82e7cd777de8fd53ab1d5822351efbc4f13b6d3 |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e2c14c7532098643b15d91e603846cebdd028bf4 |     
    i686     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/007f62f1b895c6905ebe03f793f24bddd3d089b2 |     
   xtensa    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c93d8f1f2a0ccebd80df08c288d76bb46b8320b1 |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/15536fafe7071aebdb297f071ee7c72a2854d1b1 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/73da02d8d1a9ef86babd048253ae0d652adbd45c |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/35e16b4c3796fb240b68ce019942aa3a21476777 |     
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/062da3976622e47a6db758e80fef57c8990d6a19 |     
 aarch64_be  |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/3cd11c4570de4fc41e7110077556c2e7dc08ada3 |     
  aarch64    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/bdfb91d86bc785530e3fdbe825b138e960bea64d |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/1b88d971cda5a68bf566777f85b83e09dc40f347 |     
powerpc64le  |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/66addc7aa075499926f367625b9b0fce1244fe81 |     
powerpc64le  |      libcamera-apps-1.1.0      | NOK | http://autobuild.buildroot.net/results/e44e2deaf88d91525d03b3f315446be766f90b1e |     
   x86_64    |      libcamera-apps-1.1.0      | NOK | http://autobuild.buildroot.net/results/758631a9fcd62835844f78914a36dfb579e7beba |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/66682bd3015fb438060c69087bb60dcfb85620a5 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/49878878c99a2abcb3f343937b48dea23849a607 |     
 microblaze  |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/97f3787d3f01d5ac8303d1532789f8c3a37a2cac |     
    or1k     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/82c4bb547658912889296e263d6c7e854b1f2d86 |     
   mips64    |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/0a7104719296e628c5b278dbed8e3a31eb298016 |     
    i686     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/ef5f0ecf3215ddd62ee55b42eba8b2abe6d233c6 |     
    arc      |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/216e378297b5ba697b143fff7793bfea6a1bd707 |     
   nios2     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/ca050ffe736157827f02cd942644e9c455ecc1eb |     
   mipsel    |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/23943a6dd1bcf531843d017ea2363e66e14bdbdc |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/75cc5cd6fa7903711bf321f9f8529f37c7e61960 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/41b626ced15ad62d0ce515d1fcc6a0e03d3c2163 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3d156c10fbc12dd5a76c48c904c4bb5507aa7268 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1d5b88d317c6bf4fa3b727bda7abc000d015e46e |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c5be369cd0a6dde451e574795c32c65b8df76b26 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d250135fe030e46bac3d95591641f5d8504396db |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/96c993c89fb271beb182fc03673ee7d077a96b9d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/126ba0d77b9dce0743710426aad7fb623e5c9044 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/93298c5f6b89cbc7a52f2f600957153ecd83902c |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/b5a62318797246624d9ae59834fe1a16c5e26c38 |     
   mips64    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/9f041a4597422a891e49a0687e9e7f87b3dcf0d2 |     
   sparc     |      libvncserver-0.9.14       | NOK | http://autobuild.buildroot.net/results/6e7c28905a5c2061cf6dd14936c61562521c5483 | ORPH
   x86_64    |      libvncserver-0.9.14       | NOK | http://autobuild.buildroot.net/results/e417ba81c922063aeede28dc598af4e11da61c1a | ORPH
   xtensa    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/5d8d254b097310fc2be5fc5b08cb4fbc9173001f | ORPH
    i686     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/b79a585050e90f941c59030cfcc3bd62044bae46 | ORPH
microblazeel |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/451add22e770d227455977623ceb2041dda0515b | ORPH
   sparc     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/d326e6a1d1a8c4f47e278303a4d706207099ef6b | ORPH
    sh4a     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/10f030d690f499f14d2d8ee6408b1df6614c5301 | ORPH
   mips64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/e5c92c24d54c0859422fda3edfae9eae98999551 | ORPH
powerpc64le  |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/df27d543ee24b0833336c66b63ba9b735751bc0d | ORPH
  powerpc    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/b6d944f2b15c2517723580c36d9ab4b619477596 | ORPH
    sh4a     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/a80e1c502517d2473144c0a269779eea84eb071e | ORPH
   mips64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/d83f88a8f87f29e0988200a511c263d6c668ab62 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/fdd2e31f8003959dcd96e5a5bb0b621a0c0cdb44 | ORPH
microblazeel |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/4e8af0be9c6133ef26c91648e84a4ad6bc89f3a8 | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/2a13e10b8c56b020c50e1279dc8e7d7126d7eb49 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/5e9ba03b72d463681a17dbebe34437513f3ea94d |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/3be9792704bbb169dada151f6316da5105fc232f |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a64bf0e21ca998572ee7265e5f5c1e1be64aeeb7 |     
    mips     |     multipath-tools-0.9.4      | NOK | http://autobuild.buildroot.net/results/eb9f43f3be7213d1fcc96bc5ac0d489242de7fd0 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/8701808b4563ec62aa75f9c895d1c157324f5897 | ORPH
  riscv32    | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/07e93d84dc9fe794d7f088c8d942b6d5bbe06783 |     
  riscv32    | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/4f1b86656426f8f7ad896901f784931849681017 |     
   mips64    | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/a5db2f286dbd69e84d518d086df857ef434b936a |     
    arm      | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/0ebb8c886e0a432b6fb43ab21010f625f6797b9e |     
   sparc     | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/7c643e65b03af46fc810a1ff2988209d0b6b9fc1 |     
   x86_64    | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/c3e1cca43ef4580a8b315fb36df052ec1efd5001 |     
    arm      | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/f9310865f57813d4c44f3fb30c797a2a5c98d818 |     
  mips64el   | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/35b75bec605399ad586354977c6dfb87e1471b2d |     
    m68k     | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/82e89ea1fd2bc44380ece24652c91e1ade62bb66 |     
    mips     | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/d8b82e81cb8c1f2e50752b3fe59858ff7448c5b2 |     
    i586     | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/80b217b9d696d9302be819d22b63093c5c54f275 |     
   arceb     | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/9a5d14d9dd2846faf806acddb4eda427eb0e6918 |     
   armeb     | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/0da415ed18c8a999e9e1828bb7c50ee31cb3146c |     
   arceb     | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/394e847944421670149b4d3491d92fab1da267d5 |     
    arm      | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/1064a5908d0b2f8b1cd451d33370b1e571530606 |     
   x86_64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/53cb183f224db35c977ad50eb6c3bf7060121bdc |     
    arm      |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/84915ca9c5b5ec49f615a668cba936b85d77a1bf |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/81e31151e94271850dc6a06121d5409ae61ae843 |     
   armeb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/db93519a411865fe14d7ef5a2ac3b89b7c11b475 |     
   sh4aeb    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/a9511fa0eea1602a923162b4b471307dd1d36cd2 |     
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/646a1cfd9c88198d563705e64577881176dfa2e7 | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/cd2a7c812775175b3b70890ae1c2263e5a15cbb6 | ORPH
    sh4a     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/83607ca7c38ae5aa7f119a12bb5be64675c84973 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/02114c8c439b91b3c71c91073549232ded04ce74 | ORPH
    mips     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/dfffe0ef7d66f42a80b0b299a20c88d36d08bc9f | ORPH
   nios2     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/3a03cbdf40682f962bd0d5896015e09df3ec92dc | ORPH
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f63a9953ad4a8a9a576b5516e1b56ec0006ebc3c | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5c7209d7eed5f7cd332ab62066fa9c2be18ddae6 | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/72840c25bb63a6188d7224b2ea16519aaf20d37d | ORPH
    sh4a     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/aade87a3c5508a0fd0158e4eb42dc29f649c3c4b | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2956a470371ed03a907379b29517e3e4fb2c63fc | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/314396fa430ef87a597e3c2de02966c7acc195ef | ORPH
 aarch64_be  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/47ee967febd03bc9e8fd47dbd5c9649f05eb1f1e | ORPH
   s390x     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/21e4b51d542349222aa6ed0e7b4828678659c70f | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/64f3b5d0ec05db77fc1ed0944ca9c0bf664ebb65 | ORPH
 aarch64_be  |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/385469852f4e96cf4f5591db4b68f9ddf5f86f88 |     
   sparc     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/f4c2de3e244509fc5777311b1eb196ae7209a32d |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/47d69e626d78b9e25b46deab008fe58c37abc57b | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/17f9cd020539c127643590629bcac81532dbf94c | ORPH
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/dbf2b76745c4bc78ccf99bf76224ae601b460c29 | ORPH
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/27c645cfbf95e4e278f92bd7b9afb2971aca798b |     
    m68k     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c34f5b630822f37a9290619e4db4af1f5d2681d6 |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/dcc2bfd3130a548f17264045e64c76beaf2c8dff |     
   s390x     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/615f4b7bac51dc6d845143cbc1494c5d7264991d |     
   mips64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/e5195116538b2643a9bb82667a87894b4e760de6 |     
    or1k     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/b8216f4d597871a7b4521974d9757dc4e88d320d |     
 aarch64_be  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/6a78490b70eeb1aa043a109a47002f049932e656 |     
  riscv64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/2f80faafd0977b0cf548c641ce2a9e27263a241a |     
   sparc     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/10ba935aa3157a89a392da2cfc9becbed86ee3ad |     
  aarch64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/48e4615dc83c8473307147164a849a376a2367a4 |     
 powerpc64   |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/1629b3b2c560dc71ffc774e7d655f753ccefa2b6 |     
   nios2     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/9325a7e7df92cf8c2bc312ca31792e2d330406d4 |     
   mips64    | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/04f027031bf9d344561c328ebd42040c3ae43e34 |     
    or1k     | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/5df52095462750d3a3eac4eddf0ff841fca6e497 |     
    or1k     |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/3b8909b3e89da4f4820a9377112d0530a6c6324c |     
   arceb     |         rng-tools-6.16         | NOK | http://autobuild.buildroot.net/results/2b1a7a2725ce1c8da01190dc6c88f63f55ea3d03 |     
   sh4aeb    | rtl8723ds-bt-14cedf3a9fec1a... | NOK | http://autobuild.buildroot.net/results/cdf7b124d23c7a93654b1462c4fdb3a124bcf8da |     
   nios2     | rtl8723ds-bt-14cedf3a9fec1a... | NOK | http://autobuild.buildroot.net/results/67f5c2abf19eb70eca4bbd42a304bc0759473382 |     
   sparc     | rtl8723ds-bt-14cedf3a9fec1a... | NOK | http://autobuild.buildroot.net/results/377023f5a440426b53bc31061f326628f75a7dec |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/956fbae1470d9a0a644a9bb3c3797d326992a2cd |     
microblazeel |   s6-portable-utils-2.2.5.0    | NOK | http://autobuild.buildroot.net/results/be647264d2ead2308d710d0009e14f359266f3fc |     
   sparc     |          sdl2-2.26.2           | NOK | http://autobuild.buildroot.net/results/58435b62c73205eea27abe974c1e05479ed51e0b |     
   nios2     |       ssdp-responder-1.9       | NOK | http://autobuild.buildroot.net/results/f9430fbb5858df8809ac2063786d0588400803ba |     
  riscv32    |         sysrepo-2.2.12         | NOK | http://autobuild.buildroot.net/results/93e12602d0eca433784adae003943ec5908f3512 |     
   s390x     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/c895878937ce1a60c711869fc30d92e8ed2d6a98 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/6319b5a563c97121c5ba29540076201c6cd0d017 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bb4288feecae866d007b852d7fe73cc034dfac40 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/06a63d74e43b5ce230fdcd83b6c4544559a1f829 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/20e6cdf26a162f4baadeede5a3418952bb943f7d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/298df688fe0404335aa669290cb8f7d7bf0b0b74 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/203195597e8851e3fda03aae830de86f3d0cf011 |     
powerpc64le  |          vim-9.0.1260          | NOK | http://autobuild.buildroot.net/results/f99c209efcc6f316c49c9c045d69fa3ca88fd4b3 | ORPH
   mips64    |          vim-9.0.1260          | NOK | http://autobuild.buildroot.net/results/8eb28b88f2a201c2dc2061b7f63c1a18987a0313 | ORPH
   nios2     |         wolftpm-2.7.0          | NOK | http://autobuild.buildroot.net/results/b05731b3d397e50c4bd55380e4611e1796cf6d98 |     
 powerpc64   |         wolftpm-2.7.0          | NOK | http://autobuild.buildroot.net/results/9e4668d798ba17f0eb9ddfa6a03cf6e44494d733 |     
    mips     |         wolftpm-2.7.0          | NOK | http://autobuild.buildroot.net/results/3c4aba9e59ba1a252f8ce119e9053a1a3e46f77f |     
 aarch64_be  |         wolftpm-2.7.0          | NOK | http://autobuild.buildroot.net/results/9f41ea742547bfd6be7df056adaf4dd9ef3ba3ab |     
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cf6ed562d5697c7f86563b00f0a534819e23b437 |     
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b76d1ffce9c35873317b48c6466c922c8ccf10b5 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f89d309bb5429c86742a1845f3a1e98b4050e015 |     
    arc      |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/c3149ba680f6442a821e91e76d3a3b14ed9fe3b8 | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9c953ff346422391fdfe95638a38b4fa75294190 | ORPH
  mips64el   |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/fd97cfc34eb019df84d283d3c8fa16fc0da13851 | ORPH
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/368506538ee84d5eae4b9feddc6ae6d4e59f58ff | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/048ad2b5ce25ea9be8b293eee4e899b4cf8e8c42 | ORPH
   armeb     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/1d31ac3321a3c2934f73fd220c8c9d85be9bce3a | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c3576ebac12fd970474a8916324647382e879ce2 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c35bbb72a14524ae9871f39e48e1f1f5e384e2a4 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/54e77f957cf8163378842e2df31ef7b09551971b | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0e44d477b9fef01af0e36e347d4ea631487677cc | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/43b657bd128fadc2fbf7394460c39902a890824e | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/f5ac8a485fdd11de7e2c30e0a744c2f3c555b2f6 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c63ffe1e230d33de757fd8831e35f5fa2f5941a1 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/92427a42ac9eb72f5b7ac403320176e51da350cd | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2ba7e3139b6787cc06b7c9663b3d1ec5a05b1f69 | ORPH
  powerpc    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/6172500388cd3877e5ad416769186ef7d38bdb16 |     
   x86_64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/f2bbf211e0918d748bcea6bad40f12001182a309 |     
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/fc969c6293c862a117d823d6c04ee24b4e1fecc9 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d7f27a7669340aead37479dcc2a84be776133ba1 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

               gocryptfs-2.2.1 | 1 
            igd2-for-linux-2.1 | 1 
                 mesa3d-21.3.5 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/2f7760362b66e7ef9d598c96651cac89a10ec87b |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d10afc751cad94bd2339a33a05b8f40444f74a36 |     
  mips64el   |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/c9ec0f3d1834fbdc6312b92298f73c49c4f70c07 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                       unknown | 4 
                  cairo-1.16.0 | 1 
             flatbuffers-2.0.8 | 1 
                 fwts-22.09.00 | 1 
                gerbera-1.10.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.37 | 1 
                host-go-1.19.5 | 1 
              host-pahole-1.24 | 1 
libcamera-ba6435930f08e802c... | 1 
                  linux-6.0.19 | 1 
    python-cryptography-38.0.1 | 1 
                  xxhash-0.8.1 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/0f4ee5d6adc01c2a7d4d89e2a2ed753155214480 |     
  riscv64    |       flatbuffers-2.0.8        | NOK | http://autobuild.buildroot.net/results/ce96b36bbdd2a61d383ea204042c58319a649cdc |     
    arm      |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/112737a0878a6f473fb8940611a2ea0afeacd4cc |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f1970b0309d551dd7c71e401b3d04995c38b58a4 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/b948e6b615e64b7ecfe56665ee80025abb2f7322 |     
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/2cbc96de0bb8107dad7e96fb3165ce750dc547f9 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/0c7d41a4325113cd3401d574af1f969866a0c85b |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6365e7c84139ecfc95e69d390070259d79f0cdee |     
   x86_64    | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/a0286729be9a08d648a2a856737a8df133ba69d5 |     
    mips     |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/bc857b17ab8930bfcbaef7eafc5affc9c7537309 | ORPH
   mipsel    |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/a853fc42d9f1a8c15ee3f3931e018dc4bda07a31 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/10acb09c622ead651e719b7ae54851c3e7ef45b9 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/86a4be63a9172551beeeffafea691b88320ec099 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e80963f66de34ca821c74477e69116fae2eec5a1 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8d356b65e7ade1903979901f839a0b7b4b4e48b5 |     
 microblaze  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/d9f1a1fa14f35f926224d8d2bf0fce3ec8913291 | ORPH
    or1k     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/8dbfa89acc09f137220d911b4cd4686a595649ab |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
