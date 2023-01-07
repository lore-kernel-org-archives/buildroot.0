Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A7EC54EBE
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 06:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 659EA40240;
	Sat,  7 Jan 2023 06:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 659EA40240
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZiA2CY4Yz5n; Sat,  7 Jan 2023 06:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DAB4021E;
	Sat,  7 Jan 2023 06:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2DAB4021E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50D0F1BF2C5
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 06:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1750340211
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 06:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1750340211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gg34AVXvhJCM for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 06:53:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 772EB401A2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 772EB401A2
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 06:53:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58BE0C0006
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 06:53:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 07 Jan 2023 06:53:07 -0000
Message-Id: <20230107065314.1750340211@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1673074387; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z7UgrRbN/G31C1SeKHwKOfqaYQUPLr65+U1rkUJ1y/o=;
 b=RKuV5E+DkJVshI46FYQwpctwzMHxBHenWl+233lsDF7jBpxoYMBMQnlEwpUD77IVQGbcpc
 jLMKNsVany+tt8y9uiKFhuvgQhZA8Rf9LUXdtvsGgc7eyFYvaEDZmyJM2wo0fdVfpCHFhX
 j6TVpJcgEsYGK8c4OgUzf3OymRyErLZtEKq4CDesmtd9H47gTWJd9B8O2i1Y1ST1/cNM1m
 f+e9bFp77irQAM71xf8G23QrRWlXf99gD+X22f8hvoXGTugJ8HeSH25Y2AJqKNnczpXJzh
 coKEvcpjlRMWRuFnoC9fsWuxZQ0NpHyYL6kbI5Dc+f0EYoDDo/vFY93GSDcCPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RKuV5E+D
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-06
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

Autobuild statistics for 2023-01-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  0  |  0  |  4  |
  2022.11.x  | 15  | 10  |  0  | 25  |
    master   | 85  | 280 |  0  | 365 |

Classification of failures by reason for master
-----------------------------------------------

             libgpg-error-1.46 | 53
                   bash-5.2.15 | 24
               host-fwup-1.9.1 | 24
                  bustle-0.8.0 | 14
                     xz-5.2.10 | 10
            host-binutils-2.38 | 8 
                    fwup-1.9.1 | 7 
                host-go-1.19.4 | 7 
                    pixz-1.0.7 | 6 
                    bat-0.19.0 | 5 
glibc-2.36-66-ga1dc0be03c9d... | 5 
                  jack2-1.9.21 | 5 
                   linux-6.1.2 | 5 
                       unknown | 5 
                   ethtool-6.1 | 4 
              host-rust-1.66.0 | 4 
      linux-5.10.145-cip17-rt7 | 4 
                    norm-1.5.8 | 4 
                    opkg-0.4.5 | 4 
              host-pahole-1.24 | 3 
    host-python-greenlet-2.0.1 | 3 
           janus-gateway-1.1.1 | 3 
          linux-5.10.145-cip17 | 3 
            python-bunch-1.0.1 | 3 
                    crun-1.7.2 | 2 
                elfutils-0.186 | 2 
                     frr-8.3.1 | 2 
            host-binutils-2.39 | 2 
         host-gcc-final-11.3.0 | 2 
               libglib2-2.72.3 | 2 
                   perl-5.34.1 | 2 
                     ply-2.3.0 | 2 
ulog-0389d243352255f6182326... | 2 
                  zabbix-5.4.9 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
                  assimp-5.2.5 | 1 
              asterisk-16.29.1 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
  binutils-arc-2020.09-release | 1 
                   bird-2.0.11 | 1 
             bluez5_utils-5.65 | 1 
             dahdi-linux-3.2.0 | 1 
           docker-cli-20.10.21 | 1 
              dropbear-2022.83 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202208 | 1 
                     file-5.43 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
                gerbera-1.10.0 | 1 
                     gmp-6.2.1 | 1 
  gobject-introspection-1.72.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
                   gvfs-1.48.1 | 1 
             host-delve-1.20.0 | 1 
       host-gcc-initial-10.4.0 | 1 
       host-gcc-initial-11.3.0 | 1 
           host-python3-3.11.1 | 1 
         host-sentry-cli-2.8.0 | 1 
host-spirv-llvm-translator-... | 1 
              hyperfine-1.14.0 | 1 
                   libnss-3.86 | 1 
              libostree-2022.7 | 1 
make: *** wait: No child pr... | 1 
               mariadb-10.3.36 | 1 
                  ntpsec-1_2_1 | 1 
              open62541-v1.3.4 | 1 
                 openal-1.22.0 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
    python-cryptography-38.0.4 | 1 
         python-greenlet-2.0.1 | 1 
         python-pymupdf-1.21.0 | 1 
            quickjs-2021-03-27 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                  scrypt-1.3.1 | 1 
              skalibs-2.12.0.1 | 1 
                   trinity-1.9 | 1 
               valgrind-3.19.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/edb62d45f64329cd97e12022b964bb75a68bce45 |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/3944f2d53d92cb8f7e610098269d26c170db7277 | ORPH
   mipsel    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/e0a9f431ee9892e7e4b723fc79387f8a638252c6 | ORPH
  sparc64    |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/c13203c5ec025a55f3b7898f85ad97cd9321340b |     
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/638f03b15566c9edf269792049338f0d7eeeb480 | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ed0c8b62ce11c501450ef5402fee0e6f44ca0179 | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8d65764524a690354964c811c5d939c72af44793 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/54c59f5592a59521b02e99a170912e12c4255ed2 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f10f03140b68de1c1f4c68c300b17489d18c4b9b | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ae8da0f063841eed95c1e9802672e82028337a0c | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8f76cb6bcf652b431b36a4ed5d67a00d11206656 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/76e4b586b01f272a678ada2eec167e4a9609dc8c | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/292fd83b71a6e9e21305d84119a39a0f5beb4e07 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/317ab33fd7793a78074a4be0805650398cb30a30 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/56b60334cc4f13bad353c4f16ea7db99496e3ae2 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/05ead907a6fa841d88d5504298234e2af1f26f13 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e1a9be383fdae77134309a02efe8b243623b2eb3 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/584755d6f7f4a72018d4417cdc5b6fde5a2c080c | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5a685b2c8b27dcb47df36c9b5c18cab90b0e4aef | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/650227f5e3ced31d151d862b282f38084513593e | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/17f87373205c77a37f5a6a90a885ba93a5723261 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c9635cc8a9fb796c93abacb729afa9e87243d3ff | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9d5434859c987892e832fdefc262dfac930dbc8a | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5d1098d5e542d584c92ec4aa915ca6cc0cef4c63 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f4ad03e3a7cfb3f931ddc5a9436ad9c24c23783f | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6450f5f62ea4ae5fbc8df9301e2dfb1ba9fc38fc | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/6792ba7c072e839cbb34530acdac285be1765977 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c3966e23e3823616ded465fba33981e22cad7db5 | ORPH
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/89fc820fc136179dd0cb9e6d5242aeb6b9a8221f |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/669158dc065c08a3998878fdb94c969b7483e85b |     
   s390x     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/be4206d26ecc22ab1310531180c3dac355d8a54a |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4b32a8fd77ef6d5712508c595dea4d7f580af922 |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f39fb3c7e193a3d7645ecccfc8347c88c5ccaf60 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/92bd8704eb0ee5eebf3a37c4459ef7d497c5e811 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/fd6909c71a2be5d8eb7443114200e027c26d87e6 |     
   xtensa    |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/ce2a31092463aca65880f75cb2197003c7fbe581 |     
   sh4aeb    |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/875bd55096c8cb968f631c8dc7a2f4058546acc3 |     
    mips     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/c1f1c94088a6e9d546ef5a3736285a3ba0f7fc7e | ORPH
   mipsel    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/ba86ea6982448888e56d40e5dfa1783fe0dc0cba | ORPH
    mips     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/2d676f04c24ab913d2509a71b37ab24a0814633b | ORPH
 microblaze  |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/f303f36ce0153b4926a94b45c698edc10161a338 | ORPH
    or1k     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/e66b44cc7ed3f394617a1494c991425089696584 | ORPH
  sparc64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/bd570bda818661d3733e4bf4b0f81372e8112821 | ORPH
powerpc64le  |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/eae3cc786ef1a0d30a76a83af5ffe5807395dfe5 | ORPH
   x86_64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/6244bf2735523b5f3cd8f74e618db6fe18a208fc | ORPH
   s390x     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/33e412d67deb84bee32322ce853bba3164ed7f70 | ORPH
    mips     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/e40573bc5d04e7a4c17ed3f417dd16411030cb18 | ORPH
  sparc64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/ff71c444dbd46cb702a78d8794099a866ed7602d | ORPH
  sparc64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/c12c65db7b37fa2d78a8ec86799798ebc43e1161 | ORPH
  aarch64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/63097ac22117ef01d5d44addf908fded732d137e | ORPH
microblazeel |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/c97a76fdf3b650e0c7893b2b880006338e95bb29 | ORPH
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/929e3e2ccad903d14dc3714519af4fefb77c8dad |     
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/d461ca031da92a8506aa924ce32d5c0ee695f029 |     
microblazeel |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/3a51fdc48a876fd9291786b5725b371a06472789 |     
    arm      |      docker-cli-20.10.21       | NOK | http://autobuild.buildroot.net/results/58bdf698b94cf5b8ef35f24f7201a0cab70f064d |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/2f12298b1463280b59a60d8374364555ea6d9b7b |     
   x86_64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/9214d5172c0e9e39f98d18c6228dbc511e047744 | ORPH
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/1e986f86269cf44cb58a58dc226a766038627380 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/90af30e6cd7af7b4667ada6319434b51df101a81 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/48fee041c6239ce22762d1db60df3c766a952c1e | ORPH
    m68k     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/61a39368b8c7fb6a73b5ac8a61ed29f28d157e62 |     
    i686     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/930ed28d40f5dd3ded263672e799514f9bc30a57 |     
    m68k     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/ada3e557bdbf3721b49c39ddc1c30fbc5ab1b0d9 |     
    arm      |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/166d0af145d5a71c2a6c91902a19d7ee4a322bb7 |     
    i686     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/6dbbf1d21f1b550a906c99fcf22770d7083c50aa | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/1b0322d9b1209799f44cf3ec669607be03be3a9a | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/69f04805efa27776ef47550f256d30d7e0332ee6 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/e5a1ebc1c28e90b1db2715031bd73dd5c0a65f48 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/8b33aabdfa2d7de0fb8519f9bd83de1cf8f9ea5d |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e28608b56b3d6194f93eca59766f897d1c5226c2 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dd5980c3611e61b0365aa206d518f268669b79cb |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bb712719b48d59e34a7afbb076b1ae361c81ccde |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dc57438027e6fe7351b474018f3b33d194ff0467 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/95c355dba1f481342f27acdc332026b6869fca53 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1fff2a6d1f3b0dab0c933b04c351048bf9574045 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7e66ac01e69d6a5a7732ec25034b428349ad2ba2 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/49925f1fbcb43e3077995b519ca66c58b63a84fb |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b27daf29b87d06f436cb3933c6b0b58f253d5b70 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fe4d244578646261a81b116b470f4d8a1ff1e1a2 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d56d8d07265da0255e32566d6243e625748a7151 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/afe719096e39efcd021a8ef45cb4bb28d2570200 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f141b406fc208d9533fa7c5f38b5d8882968c3e4 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/4976a71e7e826ac5131b9a83d6053797960a3eb9 | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7d10d86eb4b477057d8d545e009c6120d86b35c7 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/ebd9ee8a9aa89a102b0901f5fdb783c6a11e575b |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/41813067729580ac189c655f3e5aff4a9a579358 |     
    arm      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/dd037427fcce1fe2d44d05421ade7fed51f12d5b | ORPH
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ac72b1ade0a69f8eca65730efdd32c77f99e40ec |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fe4a4657389f072ec35b34e607175893bc60ac9a |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/62160328b972d13c97a243de75b3f9168e063e7c |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0fc6fdc84216afac2e2a6e4b7255f6a4096a41e6 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f48157bfa93686b45f6215dcea044583694f2f6b |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7da76a5d71d1fc614b777ffe00996c61b3e4f167 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1d5f5bd172cec1b78a01cad6b66a64703d41aeda |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/25fca93b7333f03057ed6fae8b0abf2f70552345 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e20502b68baa104c3402dd17d859c808f4544356 |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/7ebe87181d9557925c3c2f4380d5a8586bd672c6 |     
   x86_64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/bd5c789565d253f76ba39203a7fa814edffbab29 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/49460f8fcd56864efe124791ae9c78ed54426f19 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c6e63d481389e3829b32d8682c65a4cbb7f2e7d3 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fb60de25ea06d1d3cd85784537e15c9b7448d10e |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b234cedb8a9d34dc37060361b2de030e050907c8 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/263ad1200e6f9cb28c9a85e9b2cad5ecc42c66fa |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7d7c979a2b08ae97ae174b302e12dbb1167eabc5 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/61e412815581e69fc49888410a78a38ba37d4947 |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7cd4ed52991fc8eb99d7a55e9fe73b16a36220f7 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ef544aa5644526387aa9117b3ed90f49eff3e8c4 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ab37fd62f22cbf9a38a322aab748b20b357bb576 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/218fff8d288523e480ae7d66a6b195766da57c84 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/17ceaa27255715dc33a0de9e586132bf13fcb21f |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3192a318c11b23043e73d650a917ff1457956f02 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/eaa500e117078a29c03f3120122c557f59133baa |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bcf308fc73ab52cca03d19ccf95c7bd6c5974fa0 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e959253f5a2893b19e44005c64c49c0fda6ad919 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9d9674d0b37f364857e1d8a437c70a77c99801ba |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5bd6cc7496730827938f4fab9b3c5a0e756d9fc0 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/050e0481bbb3319c28995bec79cbd0b42efae3de |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/909a15f393059a25ec22919f9d094e537a315672 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/054d6dd66dcc8d76d92f3ed14ded65cd779ace1b |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2ea41071dfa8d525f2f5260303c98e881056e501 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a57c7629bdec121f8d148b3633dece67f150cfd6 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6c8679ea2e40a0ed0db709138c49dcf5e74382b6 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b6201a9282df8309bf21e675144752545e40572c |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d10ce0146e0bdac32792ecf2af6cb0903837f469 |     
   sparc     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/bdc0a44882264bf765794b97889da7435e1f3642 |     
 microblaze  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/22775c7cec80e20815b73acfe9e4cf4973e5adb2 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/f149b909bf97f0c8a81801f710017d6f86787746 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/3237609a4caadb2d90e93a523415961dd3530e8d |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/9f1f0d84894e4d0b5abb4302a5e8adaff092191a |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/f7828f69ac1f57be573e8fb906dec4432e9f3d67 |     
powerpc64le  |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/fb3fcf176f12e634212592761a32b1a0607d364c |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/9468d7e8c9f2e3a5666643333136faf579bd3f6a |     
  aarch64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/7ba93e3309875516ab3b6c076cc070464173ca04 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a1638385e72ee51ba2c40e86e313402a6d641540 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/671bfbe5d134889050db1ee416858fdf9dfca35b |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2696ce012b70ec01f08a296283211a03bb80600c |     
   mipsel    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/fdb304b937d5e1d4a403776ae3228a308982d619 |     
 powerpc64   |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/cffd1011e7bd9ec4c723b14e93c2e93463b889b5 |     
   s390x     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/6e06b6bd661791146f60a3c037ea253282bb4dd1 |     
  aarch64    |      host-python3-3.11.1       | NOK | http://autobuild.buildroot.net/results/35bbb3fb79e45670033508ccd7b60be18954e014 |     
  aarch64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/79bfef2ad2cbac72659529f51edae782a2fdecd6 |     
  sparc64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/8d5d76a5fb77ecf8077a316db4303f79f4b456a9 |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/122c3d5c0befdc8d04d63499c8aba163deba3f20 |     
   mipsel    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/d2a313f1f57bf0dd876ad647f9e99916283079c6 |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/90dccdadc987b49ea61c75863d884e610651390b |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/6bf9c89fdb9b3e967976db773962ef71822a557a | ORPH
 powerpc64   |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/52925ec449d31f902d5d79435a07bf85cc20d9cd | ORPH
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e1dfa0fbb139d130e59d1f9d59c9d7f03e8047cb |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/37d097452dd0a882cebb429febd06f4678d0ace7 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c5010ba4b5c7960e059935c0096a4396e32a4770 |     
  powerpc    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/65c2f0777e15a19e9d27961fcd955994e215af25 |     
   mips64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/4da4e51439090d2695687d88654912872c895e26 |     
    mips     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/8146ad725db86bdb1e49c73f47b54b89101d2e4f |     
 powerpc64   |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/cb5e1fc3db0cd1656b5097275b9e573a7053db38 |     
    mips     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/5432a71dbd41899687b7057f6b663ef1a9d20114 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/742c17f1ed1151327cbba207195a2c0190633f12 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/93aff436ffe6f45b96f180cb24721c6d8dd05c09 |     
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e9a76efa9993924d0a558d5aeecf310855d9ae59 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/1501e78ab0bb406f703fa7201d34917340cd07d6 | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/289d013c2b2b88bef943e1e08c9c1cca31074c99 | ORPH
   x86_64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/b3442c297b52f43125ddbc7604164a4df6643311 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/baee91420c2462e0bb96d06eb7d13e5470d2c6bd | ORPH
   sh4eb     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/34951dfb20dd437cde1eab7db56de141af1dacf6 | ORPH
    i586     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/1affe1c7305fb01da4404c98510c01cc4109e4f3 | ORPH
   mips64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7bf60f92fd0ec3399eef4da913c1498a3fca86d7 | ORPH
   mipsel    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/1703546281fbbeba67dac72b4426a0ee6c8fa550 | ORPH
   mipsel    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d4d57251fec6813c9296b75891c666475ecfaa31 | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/016315632c9da7136be6d5c258587741e1ff69e2 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/83b0cd5147180da4fcd27301427ac63a42ef96e2 | ORPH
    m68k     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/de6964dc2cbc5205d43c70d2a6066446d6f85ab5 | ORPH
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/1c7ee9abdaf020f13b395e4c75da08dccd65acc3 | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/3406ca94fb14b596481d70c7d83964aba69fd928 | ORPH
   mipsel    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/38ef2cee5389c91a52a7318dbbca3456f6aa05fc | ORPH
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/514dea04abdc0fa2dd59b688fee4a4241d0a5148 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/6dd108610fc6a5abda79ebf2af68eea9c7685239 | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a555605664035a46ac6718db24c04aec776b00dd | ORPH
    mips     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/37d29471ce1fcd4ebd01708451641b6a0fdcb247 | ORPH
   x86_64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/2f06b24b54a6565f01825c698119788d1485e03a | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/99e5ab43aa5b26a6bffbf5defd726f54ba2c2ca6 | ORPH
  mips64el   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/5ee0039c37974618f3c791b126f8170ee162c39b | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/cb5ff2f064bdb5ea8870185affbda30de84aa2f4 | ORPH
  powerpc    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7c3e7b84ba6143c3c93a2df7a60d3dc484198c98 | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c8e7bab6a85b9b412f8e8072bdd708a19497e7a1 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0d38f74032b7e532d7e14950ff14e03b70fcca85 | ORPH
   mipsel    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/43ebae2ad9014fad5a830e2325723f45b12d31db | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/86280bb04f1747a652325fa68e34a18e07d59e28 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/53d94d4c951d061d744dfdf490ac5fa524bded5b | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/867a5dcc4452ce92868b254598a64f3f8456c920 | ORPH
    or1k     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a5a705ac5971ed040cb6a89ff96a21641be5e922 | ORPH
  riscv64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d4e7ca8c5768a5045e53a6fda1319aec1b86fd38 | ORPH
  mips64el   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/730ce1f4bdbb68468133b36437a0384bfadb800c | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/adc9c2926e28a153d1e13a0b507222329ad16249 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/903e8d6172ba83643f801e841ebdcef63caff2e4 | ORPH
    mips     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7e59a2f09cf441a61845822c67d3e518c8eebcc0 | ORPH
    mips     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/87d23aa012bf10d68e27e602efa907b55a2a0f17 | ORPH
   sparc     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/718a06e840c3ee086688143b60ad2c837adcdb11 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/46994840d28ec95fa29435bb1648024a369245f3 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e70b3c03c81a53c0bc7404a08f184c193ee01e20 | ORPH
   sparc     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/68a4f2de0608d1f01e0a22d0321e83196c5a46bb | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/dfd37c5ab71443dfea9d05279d3cc2e6da0b167b | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0c87d8cb8d7166a8e17e72d98e5d73113e241308 | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/80e6503ee369971362940e1650e67f11fe88272f | ORPH
 powerpc64   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0dc0c73d47137cc7d9a4671be718f239078b82c4 | ORPH
   armeb     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7df4a90b75534648d7150dccd1c6b585a57578d6 | ORPH
   mipsel    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/688881d58def06f5b4b2922adc0e1b9e06c28eca | ORPH
  mips64el   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/31c46e0ca7a9584dd940ce0ec926a93f0ebc431e | ORPH
  powerpc    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ae52305dbd2d11f915eec859d401f93eef95f41a | ORPH
   mips64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f80aa8e28e8d56591f2b8f177bd7c50f370881b3 | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/769713b0c14f23abe9f66cfd55db618cbf5f6409 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7fb58321a1a7216ef393d58623690be0942dd93c | ORPH
    or1k     |          libnss-3.86           | NOK | http://autobuild.buildroot.net/results/e9cbca9e568f30c9c513086b4aee164d5b55e504 |     
    or1k     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/4401f9eea6c15973052ec16814a3dd8ca1dc932d |     
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/3933fc6bd50f55a4186cdbe4724bf18d3142fbaa | ORPH
   arceb     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/25127b6b4fed756317935943bc51cb27c8b3abd5 | ORPH
    arc      |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/00ed98df8013163f5db1ebcd8280b3ab75f462cf | ORPH
  aarch64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/b2f8b0839b93190a7a16564814858b7c45e14269 | ORPH
powerpc64le  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/68e5591bfa8e1a73a942552bd9475fda7e6acbe3 | ORPH
   nios2     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/c324c3d6fe57e7958cfc8114af887bc4f041e96f | ORPH
   x86_64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/256dfc81ca26b7f44fb1dfcf7a9732c0faf89cbd | ORPH
   arceb     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/aa4d711d5b6085fb10ec3b0d036a48c7804c55ec | ORPH
    mips     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/04789b572b27611302f8dffbee4204ffe2f4fbea | ORPH
  riscv32    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/53a8ff2b65bf550dbd26cdcfce71ae7a269c9b07 | ORPH
   mips64    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/d340aa5a4ab0542e55f97732f5d527f93bfca0fe | ORPH
  mips64el   |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/cd52884e110d4094787993480d76b10b6ca89758 | ORPH
 aarch64_be  | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/e4e9ea0690a7d37b0f19581279a6ff354fb3cafb |     
 microblaze  |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/7620442f790e4f6f6d44383b058b2867f9aa8eb4 | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7b63ade1c8a367fbca00f557c3105baaad8f45e9 | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/71accdc485dccc2c46d3a7a67123bd5fcf8fd180 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b8e441aef1a0eec21fa42e73c1b3dfa441440a74 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/283fa54d52a2a06fde53ad862bc2c011656d26f4 | ORPH
   xtensa    |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/35af73d99c0e858a3fb57279380fecddf8f8b3ff | ORPH
  mips64el   |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/c45dbb16c21890f50312fd0420781e52afe17d14 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/68bccc7070b5941625cfa643097ba2e25e369150 |     
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/84be4e839c5d57a3bde20880cfe60b70fb0ae26b | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d112e380076f8a89e5b210e39b04f0c2497bf66e | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/77cddfdd3365ebcd58642ac0209cc64b8d181158 | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e1d6bddb02a7512ae5145cfba8738adfbeb5323a | ORPH
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/44621a1ccc6cf3b3807cd4d87b7a4a6025a347c9 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b9a0fde2c6a6d4e6ce109429a5163abf2c04399a |     
    or1k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/bdd87e1592d269dd94153965ede84ae752fcf615 | ORPH
    sh4      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/e9c3a9b345804854cdf796ec93d1aae326ce39d1 |     
  powerpc    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c46d590f056db46a0992b5cb0448a9c941d61d4a |     
   arceb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/81d4ce8c668d71ccb3c51381e4b49d9a70bff655 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/2ebc860b40405254f4feb185c8b362b93e2df74f |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/7adfc72667f87d801a782bc7d65e3ddb84bcd84f |     
   x86_64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/361aff21dee46001fc882a0119b4cf67d5d00f11 |     
  aarch64    |           ply-2.3.0            | NOK | http://autobuild.buildroot.net/results/027bdd5ba23c13def8cfd44519a3a63cafdc2cae |     
  aarch64    |           ply-2.3.0            | NOK | http://autobuild.buildroot.net/results/5754de090d752f85a9e07382e82e7cb50a936705 |     
 microblaze  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/e6921b47d67a9ba5ec557c2d3a8565567b55bafc |     
   sparc     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/3cc3734a9f65c41b937edfedc489b9f742246e9c |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/fcf48e8d9c25bf82c0ddb6c0f68523630986aaf9 |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/bc27afb5fcb727c7e51d24b548b2ac610491e224 |     
   mipsel    |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/98b04b3cdba19a76356521079bf7ee30fee90a8c |     
    mips     |     python-pymupdf-1.21.0      | NOK | http://autobuild.buildroot.net/results/7fabc83dca38947c913fe739ee9727456cdf153a |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/367a042396f977b17a35f26724ebc2f21099cb6f |     
    arm      | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/a97e9c1149b860b190a0c137a0aa987c7f81a7fb |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/423ca2293d1f0db5d88c64aca664993d5f77dfc8 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/8357bef5fb05717f3a512476a1b4516784fca0d9 |     
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/c5a15c0240d2ca2200a9e5115f8b4c0d1b272b17 | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a92cff0e43dcc8769dd88fe6056bc251c882f116 |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e867d814dbb0dfa20c4f9bfc87eae1a2cc4c44c0 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bd2ca9074f9d7b197c624ee32b0de5619bd04de8 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/90ea23f78bf7a6b2e9a0f4c37d41d49542c237f9 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/7c2f14b979be27af27430c2aa38e9c8eb15ae7c8 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/1ea9818c3e607ee98c9b028bb9117ca66097cb8b |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/9e9b80c39a0854cca9b23e8c362ad4619e075301 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/13827afc02190abae168014614023933d44e6366 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/60c8969d7508c07e50da31ccd0c8b1eebde5228b | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/8d0f45bde3d32cb67d5dd323328052fdacb2b6dd | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a91dd671c3a382b032b8ad2d852dd66338732f0b | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/97dc7512d0e37f16ec07caad9c066186122aec2a | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/4d334e4e4a2917be07d3e2940716e38f26412809 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/80a67090d04b49f068936a192ef3083f6463226c | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1f146dbd27c562ac98855fef8172bd22b0f81cf5 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/5f842cd0391544cee7ca95c6bd4fdc114a37dc09 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/5d4e837c3e4ad80bdaae36a56c3eaf452de7f948 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a9c4e96145309ac38d3aa33b534adc94fef2b045 | ORPH
powerpc64le  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/f22fa3d8cda8298a577acc02be67dad0cef596b9 |     
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/dcca39d0a7bcdbf8ba8a823e04b87db243299fd4 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/73e503e52c81ed76d8deadfa19a1190873663523 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 4 
/home/buildroot/autobuild/i... | 1 
           janus-gateway-1.0.3 | 1 
              libgcrypt-1.10.1 | 1 
                  linux-6.0.16 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/af9d0173524f8e210ac62d93018d96aa5aa97179 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e41e1b3f919a0cec1f8be87ad8030f3ccb4afc6b |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d558e5fbc7e4d6e2332a6a798891f815dd646f04 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/70fd55d3be0e02330ca648cf94af793d03551d84 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/86e4285b89520da6eec72865f6023e6480061b07 |     
   mipsel    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/4060114b71ecbfaedddf9996ed0de5e32f32dae9 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b52d0a0682aff4f7f63d4acb2555184c123d7614 | ORPH
  powerpc    |          linux-6.0.16          | NOK | http://autobuild.buildroot.net/results/1ffa76ef6327d3357bf1e1e9594dfb5d1e1f307d | ORPH
   sparc     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/3a5e0762f0c7e1886602ce7b05aa17c7a04007b7 | ORPH
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/03cb84ecd822d253d4d73d7aae813e34e9835234 | ORPH



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

