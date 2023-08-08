Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00496C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 05:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64399403A8;
	Tue,  8 Aug 2023 05:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64399403A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id maV7GPQF_swW; Tue,  8 Aug 2023 05:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03603403B4;
	Tue,  8 Aug 2023 05:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03603403B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1AC1BF32C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 05:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF2C80F5C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 05:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF2C80F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j43a0Bb6Oqm3 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 05:48:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72E6780EA0
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 05:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72E6780EA0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45F31FF804
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 05:48:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 08 Aug 2023 05:48:30 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230808054835.4AF2C80F5C@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1691473710; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x5RckEPkJ2Bt3mWs3vfeg0CfakVv4QMDHNkW2IsVUDM=;
 b=llF77E3iQslfxyxqg0HfDP7Yqg+IKK/sdlo4KMz0BOa43sCkZCnQhvlyi8LrnkH4lpj7pb
 qdMid/5lJnCudlwATOPwXJ6YnFkagwFQuEyGKBDKo23wmWlLmmuVdlilbTvBZVIJCSbc4A
 8M29x1MSZj8sW5U0ij9ry1ic/IJjw4/YOMMpKMobBAyNS1g+Q/Jed4yI5ZdMsfmZa5pyK9
 oOFO4Tti2WmBYDk8ICGfFYvBXTy1Jmfa4hZ6dlpx6zak/vBOtnihitgHi1N+/TW0jM2rkC
 0hBOvhHCMf3sHXFJPXe2DqMYbaJEJbTjR7wlwbzv4DtlXg1/Iis52d7Xa2qjQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=llF77E3i
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-07
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

Autobuild statistics for 2023-08-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  2  |  0  |  6  |
  2023.05.x  |  1  |  2  |  0  |  3  |
    master   | 44  | 52  |  2  | 98  |

Classification of failures by reason for master
-----------------------------------------------

               libglib2-2.76.1 | 5 
                  check-0.15.2 | 4 
             util-linux-2.39.1 | 4 
                elfutils-0.189 | 3 
                   linux-6.4.8 | 3 
  gobject-introspection-1.76.1 | 2 
                 mpg123-1.31.3 | 2 
            quickjs-2021-03-27 | 2 
             batman-adv-2022.3 | 1 
                 c-icap-0.5.10 | 1 
                  clamav-1.0.1 | 1 
             cni-plugins-1.3.0 | 1 
                    cramfs-2.1 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.2.0 | 1 
        edk2-edk2-stable202305 | 1 
             f2fs-tools-1.16.0 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
         gobject-introspection | 1 
           host-composer-2.5.8 | 1 
                host-go-1.20.7 | 1 
host-go-bootstrap-stage2-1.... | 1 
       host-python-sip-4.19.25 | 1 
              host-rust-1.71.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                    libndp-1.8 | 1 
                        libpng | 1 
              libuhttpd-3.14.1 | 1 
          lttng-modules-2.13.7 | 1 
                    mosh-1.4.0 | 1 
              open62541-v1.3.6 | 1 
                   perl-5.36.1 | 1 
          python-rpds-py-0.9.2 | 1 
             stress-ng-0.15.07 | 1 
                       unknown | 1 
        util-linux-libs-2.39.1 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/7b4ca83a69b597f74a37b9767d795eeea120e6bc |     
  sparc64    |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/79fe12177eeaa26ab00fe8df75ee1078f7fb4734 | ORPH
  aarch64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/2904e016b9f3bc2dab5f4a15784991f2819a045c | ORPH
    arc      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/e823c656a6336bf2e1d89039d2805a6a2d248cb8 | ORPH
    mips     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/ae7e3b0f0fbf1e0b4f190d9e32efe8702879741b | ORPH
   armeb     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/b1087e9a67ff0382632b73f280fabe92cd863593 | ORPH
    mips     |          clamav-1.0.1          | NOK | http://autobuild.buildroot.net/results/69b8b3494c12e691ec524d80d6d08140875cc64c |     
   x86_64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/2f8984e752885efa12ba6cc81d0c99ad74211e62 |     
  riscv64    |           cramfs-2.1           | NOK | http://autobuild.buildroot.net/results/0b19b980d4d94bfa06c8159f3d0758cc1873400d |     
   xtensa    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/e53f8b2bd401c75a6d93424ffea17c44dfd12501 | ORPH
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/a6f2baa1363c6160cd2d738266d436aa7ed87176 |     
  aarch64    |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/19635a166f07ccb6da8bdf4a5753ed0e5f4cb163 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f872533d9a08e713c795e588e40040b712f87190 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/12d72ef5e2dc1c72aa2462812e4d8d40226bf5c2 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/90f30eb359d40ad892b8fbcfc1e373b371b863a1 | ORPH
powerpc64le  |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/58cef7ff6787c3a43e11244d0108ab73c7813a33 |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/2501c7e6eb222b1fdaf94f04f08e4a95ec4b609e |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/06245c11e00c564488026d6014adf5b1c69afd76 |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f6e9339b49cd5249a89d932d50dc1d0b68721603 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b7704ce6f5fc9766825881259557cedc3e9a44dc | ORPH
   arceb     |      host-composer-2.5.8       | NOK | http://autobuild.buildroot.net/results/170806213b01966cb9dc297d990707db6457b2e4 |     
   mips64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/9d5232745f17b6e9fc77f1661101080d1f439ba9 |     
 powerpc64   | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/9a0dc8bffa2a51d71e3f6d8c9b1041a080e64049 |     
   x86_64    |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/95e1a4e2c4952c1f578d5efaae4df3e5fe237b77 |     
 powerpc64   |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/67966a508ebe87a842f0f6525ddd60d306708a51 |     
    m68k     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/1fdfb97da422c269077886855e4581feb9abda5a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5c7ef54cdf7f4cbfa8a2cfb37c5858005576af86 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/859ccc06227ce1916c63336a61e3bf0671a0b748 |     
    m68k     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9d0c6c2e3a47396b9cf373a4a3446af458c6421a |     
   x86_64    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/dedc7788a0501a404083e9b947b6f2dd0c9ca9dc |     
   x86_64    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d2da03f7558f3b6ee59c813bb64115702e52704c |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/4b20586e6cd02762cd3dc6536daf1d973fe2d937 |     
   armeb     |             libpng             | TIM | http://autobuild.buildroot.net/results/eadfa401d53770f39803194419e5deb1c5bdc65e |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/79d2cce07c8f7f7de1a067bc27819a890a3cf8d5 |     
  aarch64    |          linux-6.4.8           | NOK | http://autobuild.buildroot.net/results/e1839d4d078096920dc0b61c7ce83011a4643204 | ORPH
   sh4aeb    |          linux-6.4.8           | NOK | http://autobuild.buildroot.net/results/0c8b37e221ff957c953eec89e2e0a14528982454 | ORPH
    mips     |          linux-6.4.8           | NOK | http://autobuild.buildroot.net/results/1a4fce2e6a624d94c5bf8594626b1c6919870d6f | ORPH
 aarch64_be  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/bf84062290151e179fd546ed90d8656bc3b6acfc |     
 powerpc64   |           mosh-1.4.0           | NOK | http://autobuild.buildroot.net/results/0780481885197b1874981c36ec0c7f2bc9e5a00e |     
   nios2     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/859cd84d4d9cc788c21cd7368a901194ed7f9174 |     
 microblaze  |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/715ffabf0626f55e6e9e52a2ff9884222e5cd07a |     
powerpc64le  |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/f1473a453778cbb51929a012054276afedb70737 | ORPH
   mipsel    |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/13d66e281cb4778f7498f909f5f7c65d4b28bcbb |     
  sparc64    |      python-rpds-py-0.9.2      | NOK | http://autobuild.buildroot.net/results/8c304c3daf0f320b482fe8215151996324d75026 |     
 powerpc64   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/55bd5cf39b76ac13be5a3d62ca50b5ee89eeac94 |     
powerpc64le  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/23e68589652cabd5f19702cec2eb8b6f702c3a62 |     
    i686     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/823aac32b0ff365ebb3d99073f34276362a2c530 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d0e1796a8524329124381eb7b4b6009451df0fbf |     
    mips     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/ab4a05a502899b45483c70cdcc724600e9086cd2 | ORPH
powerpc64le  |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/ecb2f45c488513cef21f93cd6c75dcf2d1e49ecf | ORPH
microblazeel |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/535bdf8af93c658c1e64a0fa5f8afe7600bbd715 | ORPH
  mips64el   |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/f873e61dfb35f65a313f112e60063510d5f5b543 | ORPH
  powerpc    |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/94a406fe89e451fddb2e7ba8732cc4eb55791ad9 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/c30009df570ba39e8199f6cbcbd3a189de67d946 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 1 
                 qt6base-6.4.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/5febcac4979a88c1b3f9a642eedfaa4dd9e3f846 |     
  aarch64    |         qt6base-6.4.3          | NOK | http://autobuild.buildroot.net/results/1468ab483bc8d9e56bca4fb735a32f8f8b315107 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

              host-rust-1.68.2 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/f372977e02947bef042058f8a9976fa39e86e360 |     
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/6415f013d58748ce66cbe8baffb7505d1833ff6c | ORPH


Gitlab CI results for 2023-08-07
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/4814732224  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4814734175  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4814732904  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4814732966  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4814732970  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
