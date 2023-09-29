Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C86BE743ED
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 05:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4E6A4031F;
	Fri, 29 Sep 2023 05:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4E6A4031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQ5lOEvysCQk; Fri, 29 Sep 2023 05:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 954A640608;
	Fri, 29 Sep 2023 05:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 954A640608
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 284641BF2BB
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 05:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB34140511
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 05:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB34140511
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xcJNbzgYLFN for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 05:34:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68AC740512
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 05:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68AC740512
Received: by mail.gandi.net (Postfix) with ESMTPSA id 832B5C0005
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 05:34:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 05:34:53 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230929053458.DB34140511@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1695965693; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N+9FwPPBo7woT1zlR9KfhNRwe0xrP9SuWMAZdKkVmf8=;
 b=fcBmqm/fZKJdMJ7jOsYfFYQQDsPauNml8TE1KxJ3ICy1sKZHy6s9sEevsA7geiqy/BaAxZ
 UwvbPrxbtVW7v+ozbBoXOGJYNpIYDBI7OIhvOASauJltTV4pF48e4uFumsX1gEZJIuBmr8
 i+yO6drxUhk+GNcAv6QRQGv2/3PObu8DfBwLyiZTXzLyl/vIJ9x1jyfSIrTWnPEPn2q3BT
 TSsgPIC1+86LspubdALb/HlBsnIsI2dWUbQQPZs4c/jlSqC7N8148Rc5qk64uAtpKDu13K
 iBW9xzm8K9Vt5VwcgqBJpcNkF+djiuuzVqEQ0b05drXswTLE9y87h9MnTmWIEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fcBmqm/f
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-28
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

Autobuild statistics for 2023-09-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 12  | 10  |  0  | 22  |
  2023.08.x  | 10  |  7  |  1  | 18  |
    master   | 80  | 83  |  2  | 165 |

Classification of failures by reason for master
-----------------------------------------------

                   bird-2.0.12 | 9 
                 gnuplot-5.4.9 | 8 
                       unknown | 7 
  gobject-introspection-1.76.1 | 6 
               alsa-lib-1.2.10 | 5 
              libarchive-3.7.2 | 5 
                   linux-6.5.5 | 5 
             stress-ng-0.15.07 | 4 
                host-go-1.21.1 | 3 
             alsa-utils-1.2.10 | 2 
                    brltty-6.5 | 2 
         gobject-introspection | 2 
        host-sentry-cli-2.20.3 | 2 
check-11970a7e112dfe243a2e6... | 1 
          cryptodev-linux-1.13 | 1 
                 dc3dd-7.2.641 | 1 
                    flac-1.4.3 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
           host-doxygen-1.8.18 | 1 
         host-gcc-final-12.3.0 | 1 
       host-gcc-initial-13.2.0 | 1 
              host-rust-1.71.1 | 1 
               libunwind-1.6.2 | 1 
                libxml2-2.11.4 | 1 
        ltp-testsuite-20230127 | 1 
          lttng-modules-2.13.7 | 1 
                  motion-4.5.1 | 1 
package/putty/putty.mk:22: ... | 1 
                 pango-1.50.14 | 1 
                   perl-5.36.1 | 1 
                    php-8.2.10 | 1 
                    putty-0.78 | 1 
                     pv-1.6.20 | 1 
rtl8821cu-dc9ee6c6a8b47d0e3... | 1 
                   uacme-1.7.4 | 1 
                 uclibc-1.0.44 | 1 
wireguard-linux-compat-1.0.... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/a8629d30bea0c7d1544dfb2f0992294b734c7f1f |     
   armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/814b2fa60dc1d2bb25e49355968adf43f257e2c9 |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/f7015cd3393c8390fcd0153f2730f0363529b127 |     
   mipsel    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/3c9a4de5e6160833d64f777ffccc2ea887f07af3 |     
  aarch64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b2aeacc36c92184f90428adac11e8c6271dbae9b |     
    arc      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/9d892e9c47ecb2252df9cf9ea55dcf6e53fb8d5a |     
    arc      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/5d9f21f9cadd2331c10c8080207e34a02bb2f64a |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2dbfe835228e64c54e88769a664030aa85d0b7c5 |     
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/0be44b988182f18c57797355075bbbab9122b218 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c76e59a4cf12728ea6ab48ef009995d1ee909c28 |     
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2b29fcb441426ad6303cc3db7871d3b805a188e0 |     
    m68k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/152976f81b11ff0123ecd904442178ef5f123902 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/778ac0b29bc69a9f06290f72c3f1aa791a12975f |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/aa9d4fce33557240ceab13956e573f2e8e3df280 |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/e270f5e1b1f37b833693e2d79042784d5bbbb7d4 |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d328b024264dc8477d332377edf9ee1f2e5499ae |     
   sh4aeb    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/691670cb377864a5e50441f2dedbc0bc91d6a48b |     
 powerpc64   |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/25676ffd7ae6977f1f53b89fa8040c3eaefee970 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/8c515d412c0b59385147a9ee9d65ef0f3c068b8b | ORPH
   x86_64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/b982c90cbd4802b1180e0e475f67c64fc8da65e2 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/faa1c80815ad91029e70431651dcecf4ddba06a8 | ORPH
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/2140df0cbf1fe6b0e63a2ef78e436cbcd0247b73 |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/cf4a01496af57e875d7df43ed10b2f90a79f2b18 |     
    sh4      |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/3269f9c36ccc6de8289ad56239a5dff36c73d6e4 |     
    i686     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/4285ec8a127c931b617f57a0496a25246b644430 |     
   nios2     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/9256381eb4b94ff0f28c9111d426dd9783a7cdf7 |     
 powerpc64   |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/4192dd2037c52de2f4e9ff29d429e1ebd2b842f9 |     
   arceb     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/bd762f547525b0c7629f7f60f37cab202f470e0e |     
    or1k     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/601be80bb9a7a474d8b6f804cab6cc6a3070fbf3 |     
  riscv32    |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/9d72c40d29d44c17aecd6ddbe3d6f37dcfe4e29c |     
  mips64el   |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/605997bbb13490164928b04209a8394b6f494388 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d8223c6ed648c74d196438ac1a40716244072cfe |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9da83942951a60acc1b9033665a78c3e4f87c2ec |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/417fc60b3c58edfbfd0c69f237dd350d7f4d4788 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3f09a791b5dfaa3bb84c4c8b7aff15327a814a4a | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/287e29d42f0aa831d11e30383c882a26a44a8a86 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/39dfc31eed3773e272211f79736a0d8b0b63aaf3 | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cc9842ba05316583d6332f5b1841e9e27392e846 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3beeee8dc3f79084f61168559819fd992a08b89f | ORPH
   nios2     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.net/results/9076cb9427898ab9d3663b16efef3151a487d2d2 | ORPH
  powerpc    |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/4366646742dc3af4df443c88e72a4a72720ccece |     
    arm      |    host-gcc-initial-13.2.0     | NOK | http://autobuild.buildroot.net/results/5ec16fddc8113977231dc46f17ae0d4471b1b1e9 |     
   mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/a84164bcb1388c783705728e9777cc689a48929b |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/7b4a1fc0b9295f4dca652418321d5e7a634a13f4 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/0496dea98de0231850d6faa4ba9c2bf79b799124 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/37a196c9bb89b448b52916a04835922adcbe2e0c |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/a362ac7188f52501bb5910afdd35817ef0d6deca |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b5575e08349f839dd9835b58f560759772c7bcde |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ce89c1605daa97137540d3780774b5c43f74fe96 |     
   mips64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/cc387612d5e04fec87c7eadae8637d85966bd09d |     
  sparc64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/6d6fa3ef7f1599d0c08eda6ec8edd228bea3c5c6 |     
    m68k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/1c080e16bcaa2c27dba88bc6e5b94867c822aa0f |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/8c87c2a841455aea3faedc01c8ed977c6926c167 |     
    arm      |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/9903f902f50adde9e21b6c88ca2c02be312071b5 | ORPH
    arc      |         libxml2-2.11.4         | NOK | http://autobuild.buildroot.net/results/4346bd55e25020e94e92513a99bc6dd666712a8c |     
   mips64    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/a5ad2ea501f8cce2ffd778144b5beaae325567cb | ORPH
   mips64    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/38fce39586bafd480a3a2c69cfa47d89ecc40c3a | ORPH
   mips64    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/cc3426bb2ca7131db89604f1d6cb524f3caa59d0 | ORPH
    mips     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/e6b13f7cfbca75aeb3b39f9b08f169a8b99a50bd | ORPH
   nios2     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/4a27b90c0342fdf8a0717a107e304fa26fb08c9d | ORPH
microblazeel |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/9fa9627c99c2d37daaab28d9432c16ad0cd9b186 |     
    i686     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/5c1a146f88aa6b300b74eeab5bb1cc7e7f6c08d7 |     
  powerpc    |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/cb588d014333638cfbabb32689f81319a865020a |     
    mips     | package/putty/putty.mk:22: ... | NOK | http://autobuild.buildroot.net/results/641489512ba159e88849e6f11eef45a50a53620a |     
    i686     |         pango-1.50.14          | NOK | http://autobuild.buildroot.net/results/1e9548f7d581bb0fbd5b08472e76975a61087e72 | ORPH
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/4dd0e375258f48c8b3911f518430936ce05ffc33 |     
    sh4a     |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/5853963f5601b5b0f33dc6683339a9bd408a698b |     
    or1k     |           putty-0.78           | NOK | http://autobuild.buildroot.net/results/fc35f1e2c6883c8e97d7e549a631d55758aac682 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/8a77f540b070361ad83813a068d4c71310d5f81a | ORPH
microblazeel | rtl8821cu-dc9ee6c6a8b47d0e3... | NOK | http://autobuild.buildroot.net/results/aea09f6b53985c921ef44c94c8cf27302c1d7a54 |     
  powerpc    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/3e684fd899f703e1535a7bce11ffbfc4e9c4e489 |     
    mips     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/0e948076bce5472b835c5e47eb4d1a1ef7d3c4c7 |     
 aarch64_be  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/bfa521ecd36153ad9e737b34dc4f09298165acee |     
 powerpc64   |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/8b8cfccd46c3ac9b4d4d6d424a1740efc5eb3c11 |     
   sh4eb     |          uacme-1.7.4           | NOK | http://autobuild.buildroot.net/results/2083eca8030e3f7ed8df388a7c29bc5d672b9512 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/f414d20f844e18bd0f1db0b7c4dd8e578e47f60b |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/3d1423246f6e65bbb9213914d2eabc251a1268c9 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/284ebd0676519da08620b2c864aaa352a6ff0b1c |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/8b3dc0d12d851afddd2b1dac35cfb0cfa12201d6 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/077acbea81bcd965e1834d00a35e39e818e62391 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/32a7ac3ef72a57f9f9cc7a6b28387889d5aad4f9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1d5478565f550f5035271e9e73056ab594b88d88 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ed84b9a49c39b9cdd47fd39bf8d57bb73517a451 |     
powerpc64le  | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/dbe95f5b6a1cd289c41a1130114f6610a62959e6 |     
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a5a4fc36a1e07f466774e4564af9fc268e294b9c |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 2 
                elfutils-0.186 | 2 
                  check-0.15.2 | 1 
            host-binutils-2.38 | 1 
               libglib2-2.72.3 | 1 
                  linux-6.1.51 | 1 
                    php-8.2.10 | 1 
                  tbb-2021.5.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/13da25267fa1b102a4dba77c4b0fb35db185167d |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/a1316f87c5520aa1b931325fb5af52b4925aab48 |     
   mips64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/5f13f29fe4a1664827de5bb1d0b7815aec95ff00 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/57bd38575c15c962ea00f4b73fa4070eb7824430 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bc7bbb72f00ce1c4c77cfbcc291b686088cca90b | ORPH
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c7b384c1e8fae3995a284973c30128989a8d94b4 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8ca09d4acae5d2cbb73fadef6862b93f70ba8f81 |     
   armeb     |          linux-6.1.51          | NOK | http://autobuild.buildroot.net/results/4a0b81bfae142ed8ced0be2e70db37603434acc5 | ORPH
    arm      |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/aed21a3bafcbee559c977aed1efee69a0b75b9e0 |     
    i686     |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/2e38243f473f872aa7a274c369dad15928fc33e9 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                    brltty-6.5 | 1 
                 coreutils-9.3 | 1 
                 gnuplot-5.4.7 | 1 
         gobject-introspection | 1 
            libfastjson-0.99.9 | 1 
               libglib2-2.76.1 | 1 
             stress-ng-0.15.07 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/b19d17c45dd62dc474908bd1f81c0a749248932c |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/5d8930caec641a51969dc8b6a2adb91292b14b64 | ORPH
    arc      |         gnuplot-5.4.7          | NOK | http://autobuild.buildroot.net/results/03b0e9945ee54df5abdb1c48ab4230209582c505 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/bb234a059fb6afe6564de8a22970895e775f5cb8 |     
  riscv64    |       libfastjson-0.99.9       | NOK | http://autobuild.buildroot.net/results/c32e861482a0b62f760af14d5614ac70689189ad |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7ce872298332737b29e78a9935c231baf40bea7d |     
 aarch64_be  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/9539e1621b530184bc0a02646e891ccb18ce0d8f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/cdce24917e6fba54c3e6f7c0ffb6ce729a64db80 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
