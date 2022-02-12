Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566ABC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 08:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFA3041299;
	Sat, 12 Feb 2022 08:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJPGO-LEMXn3; Sat, 12 Feb 2022 08:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CFAB4136B;
	Sat, 12 Feb 2022 08:02:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 149DB1BF847
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 08:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E802C83E96
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 08:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KWN12U-SkvHe for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 08:02:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D98783E95
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 08:02:36 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A3C9A200013
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644652953; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v9PMQDacbzGHmj5lRQrDhWA/z3y2h2Bdci5FczLIKEw=;
 b=dnJs/zzlYDE/iAXQfVukJn/WfY4nhFT6PzXt4a66diXUvckW8CxPDqIxOYpyfkUmCoN2YZ
 Qz1KVzde3LeEIhc1gXDzmQvqnK/fYqggH4AX2siERxRncEFDw8zi5kKHCC1JHOWtdC9A8J
 0MT0owX7MNyk4zSb6b3Kr9hiG+smL1miVZv8nFbxtm1WlFcCp+cp2zcGDfeTezLD/KPwy8
 DL+CzesureJ+R/kwSTFIBdlE1lKHiFuM3RHoqUg+pTS7ydsNLfj7OarWpXBaN06VpNILM+
 1jN8Ix1FIxg7BbFhe5R4TseZxCIAuYE3UL1o/xb+Ht5P2PZHNo9xZ3pqfWzQ/g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 08:02:33 -0000
Message-Id: <20220212080238.E802C83E96@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-11
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

Autobuild statistics for 2022-02-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 54  |  8  |  0  | 62  |
  2021.11.x  | 19  |  1  |  0  | 20  |
    master   | 26  | 60  |  0  | 86  |

Classification of failures by reason for master
-----------------------------------------------

                host-lzip-1.23 | 18
             bluez5_utils-5.63 | 7 
              host-cxxtest-4.4 | 5 
    host-python-greenlet-1.1.2 | 4 
        host-python-six-1.16.0 | 4 
      gst1-plugins-base-1.20.0 | 2 
           host-bmap-tools-3.6 | 2 
              host-grpc-1.43.0 | 2 
    host-python-cython-0.29.27 | 2 
   host-python-docutils-0.15.2 | 2 
host-python-pycryptodomex-3... | 2 
                    bat-0.19.0 | 1 
                       frr-8.1 | 1 
                 gerbera-1.9.2 | 1 
google-breakpad-7515ab13768... | 1 
        host-python-lxml-4.6.5 | 1 
        host-python-xlrd-2.0.1 | 1 
               mpdecimal-2.5.1 | 1 
        python-docutils-0.15.2 | 1 
               target-finalize | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/233c48db483d771ec79433f7d8c956757619c29b |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/b514a5d49ceeba7d87191e80fd9e790e2331a688 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/decb0e0fd5234d339ef1f2a6083b5ae5eb16f9ab |     
  powerpc    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/731da7effd1a6f09d2d930518b25deb5b698d91a |     
   nios2     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/7b5361d9e0160db8c1c42202c2f819c88b9ed712 |     
    i586     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/9e6c817ed1294b32704d302150210e2d18380db4 |     
  riscv64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/bce5cdd062f8ed00dadc209f50eab44a49d196e7 |     
  riscv64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/25ca25c5ac0422fb31f1506744c1081da6220d36 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9ea759fc4177cc70c650d79fabe3e439dc5d0a9d |     
    arc      |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/0606c01f099f3d44d9e4d6c9dc2edf2afb2d7a72 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/0b2dc409a8d9c0f30563c14654f1bbbdd39926e4 |     
    arm      |    gst1-plugins-base-1.20.0    | NOK | http://autobuild.buildroot.net/results/c4b1449f35debcbabff7e42abe239695d4ad4d21 | ORPH
    arm      |    gst1-plugins-base-1.20.0    | NOK | http://autobuild.buildroot.net/results/4d4f6533e275f3f420221424d49efe1106b79248 | ORPH
   x86_64    |      host-bmap-tools-3.6       | NOK | http://autobuild.buildroot.net/results/d99c4c6824244085941ba1b8b8a19428893adbbf |     
    m68k     |      host-bmap-tools-3.6       | NOK | http://autobuild.buildroot.net/results/3dde991f3fc971ef7db888ba9e9731092f2fdd04 |     
    m68k     |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/d4f4f272788fb7b2a50df4aed1cae56fef3cf7e6 |     
 powerpc64   |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/1f504875be72d5bbc8c2d181eeddb5b0ed19519b |     
    arm      |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/d4e450a75fa6673003a4f50d8effc4b23f62bac8 |     
   mipsel    |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/0e6f0e8f9902bfbf98b1db88c61df70cfc022868 |     
    i686     |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/a70fa6f9a8829cc86d7e1fdcbecb97e451a564ba |     
  riscv64    |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/c4a3b10cfbdb781136ec22915fe11df2c65e4ad3 |     
    i686     |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/9355d10fb99f197248a5f5825f1b2c661f89fb20 |     
  sparc64    |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/4ac1de927d4b988c6b9b1d51e3a06c37f33109eb | ORPH
microblazeel |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/291bded53473f87f604e054b1473aac1e0080327 | ORPH
    arm      |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/59c517407f890de89916b0c5b01d217f2bac88ef | ORPH
    arm      |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/1ebc53a1c1307567b31cc08d0e542d68f09fdd20 | ORPH
    arm      |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/afe026f053a9f8184ba0346d994f8dbad8e96c19 | ORPH
    arm      |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/fe27629126d383eded056a8808778d2f6d3661f6 | ORPH
    arm      |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/76d8afa81e478cb4f408292484f67898236ca5a0 | ORPH
  riscv64    |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/feaad6b96bd4083bd42c4ceb46831d8adabca7ca | ORPH
   sparc     |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/c5f90590e95d71d4df893c90d31ca0567337602d | ORPH
  mips64el   |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/9f1377daa4682d8881048819222158e4d402324d | ORPH
  riscv64    |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/bc2c91f1020b124aee972e357a4ea36302c0f236 | ORPH
    arm      |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/8c587a9b122a6be4cf2d072b6f4f8d1ea0a2e559 | ORPH
  riscv64    |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/d1512d274fe36a77c87844714edb28c333d711d1 | ORPH
  mips64el   |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/289caf01c243a4fe5427db81e132161e8fab3721 | ORPH
    m68k     |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/61afee5b7f1250ce1540a4128a6c0dceec5349eb | ORPH
  riscv64    |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/1abfe907c4cab333f9b40a9c3fe0b4ab969a850d | ORPH
  mips64el   |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/cf5a59b0322e9fe359ef2053370840944e222b26 | ORPH
    arc      |         host-lzip-1.23         | NOK | http://autobuild.buildroot.net/results/49b598458fcfd20f3d185f57019dc2225c8f6ced | ORPH
  nds32le    |   host-python-cython-0.29.27   | NOK | http://autobuild.buildroot.net/results/f9c7da94e38ea83f4db37de3862d7685fcfef514 |     
    arm      |   host-python-cython-0.29.27   | NOK | http://autobuild.buildroot.net/results/8b405edb03e0e869ffec2d95a54b97dc1bd5fa4c |     
  riscv64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/937ccd09532ff966c070da7fdb863a742d115b86 |     
   x86_64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/c2f9a8a2d0d7c29695ae94106f5684def2a52a63 |     
    arc      |   host-python-greenlet-1.1.2   | NOK | http://autobuild.buildroot.net/results/5f2f334b7a93da7213f7535410ac2bc7eb161449 |     
  riscv32    |   host-python-greenlet-1.1.2   | NOK | http://autobuild.buildroot.net/results/df691de7749b5e998ee824c67eff46885a83b4c8 |     
    arm      |   host-python-greenlet-1.1.2   | NOK | http://autobuild.buildroot.net/results/c90060446e8f73c9bc510fb27626fb309ae4ada1 |     
    arm      |   host-python-greenlet-1.1.2   | NOK | http://autobuild.buildroot.net/results/f012d6c16e518ffc9e3a784d0a9486058463e8f6 |     
microblazeel |     host-python-lxml-4.6.5     | NOK | http://autobuild.buildroot.net/results/7a54e772510b0b407243599c69de7aa4b10943de |     
    arm      | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/1255ad0d0cbcd7048221643b8d2388edb2fdef74 |     
  riscv64    | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/56ff2c33aa0e36e7a9bf3e3fe83de149493c1cd4 |     
    arc      |     host-python-six-1.16.0     | NOK | http://autobuild.buildroot.net/results/da51646656640c0ae7a18097212b48790065406f |     
    arm      |     host-python-six-1.16.0     | NOK | http://autobuild.buildroot.net/results/97e36712c5138552778149f5ebf91f63e533047e |     
  riscv64    |     host-python-six-1.16.0     | NOK | http://autobuild.buildroot.net/results/fb9e8d595f66f33d9bc9365f8eba6abd16e31afb |     
  riscv64    |     host-python-six-1.16.0     | NOK | http://autobuild.buildroot.net/results/79e0e8e12420a5fb98144e44805581b643f238c9 |     
    arm      |     host-python-xlrd-2.0.1     | NOK | http://autobuild.buildroot.net/results/8806c24202a81dab011a45011afb0956c1871e7b |     
    arm      |        mpdecimal-2.5.1         | NOK | http://autobuild.buildroot.net/results/38174e993635677a63061e97993e5eee8645cc32 |     
    or1k     |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/ed3e196841c1d02787f7fa102cd52456e09d58fd |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/46a9750de4b98be96a480231acf9ca15b86d64bd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/590e256491926126388121fc5062721569149041 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
monkey-f54856ce250c4e257354... | 2 
                 gerbera-1.6.4 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/737def3cb23c2e802ddc0a3a36cf0543f4d67583 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0ed9ab091a22a7b2135e06d25001ebe3c662fa96 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/01cfdf1c3cdadb6055bd477c5ccdf9f5a52e8bd1 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7f35f70f00539110cb6b825565e6005f7041c018 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/376dc3a093dc2c63e571462ae82139aaa3e32cb4 |     
powerpc64le  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c8aa7278008745b462c00d4e44bc49e6973da11b |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ee582b3937cbbfb83d25146caa5b763acffb771b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1d2d94ac74d8db5d1abad6604cc19f24f7dcd07c |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                  zeromq-4.3.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/429d2dd34e5d8e2fff40ce7707fa1bb18260f3d6 |     


Gitlab CI results for 2022-02-11
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474884  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474890  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474895  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474910  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474912  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474927  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474931  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474936  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474940  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474944  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474946  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474949  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474951  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474954  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474957  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474960  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474964  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474966  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474968  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474972  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474973  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474984  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474988  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474990  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076474993  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475005  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475009  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475012  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475014  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475020  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475021  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475022  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475025  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475033  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475038  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475043  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475048  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475049  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475053  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475055  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475058  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475062  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475082  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475085  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475086  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475087  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475088  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475091  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475092  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475093  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475094  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475098  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475095  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475097  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475099  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475101  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475103  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475113  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475134  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475137  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475143  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475145  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475147  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475150  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475153  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475154  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475161  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475162  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475164  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475170  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475225  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475232  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475245  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475263  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475273  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475275  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475280  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475285  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475294  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475299  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475326  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475329  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475330  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475334  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475425  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475437  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475438  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475447  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475454  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475459  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475461  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475464  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475467  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475472  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475475  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475493  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475495  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475498  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475506  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475507  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475508  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475509  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475510  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2076475511  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
