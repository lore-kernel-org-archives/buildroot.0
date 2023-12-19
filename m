Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E322C41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 06:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7914016F;
	Tue, 19 Dec 2023 06:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE7914016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5DcqEz8VWIs; Tue, 19 Dec 2023 06:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31E2F404F8;
	Tue, 19 Dec 2023 06:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31E2F404F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB5CB1BF301
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 06:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98241404F8
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 06:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98241404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlTKMp3kaR_4 for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 06:38:02 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D2084016F
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 06:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2084016F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E74CFF80A
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 06:37:59 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 06:37:59 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231219063804.98241404F8@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702967879; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uT7fS0zU3vuEe4OynU6bALWLsROmPF04GGHSJcPVttA=;
 b=HfMPptGELQVBytIrLZHziJvFYxFYaXXNLslipDvX0Jxn8KT7dSs4gmT+urIxVspp04B79h
 l92RQ+22D5Sqc3LfckutMHdR0/gaLWpWBmb3B2GQQ7KrquZ/C6b1NYdzsTYkf59NLsNCW+
 OYo3pELwtYZysTfK+v0zQLhHkm07KqSS3xvMrWEBEVRy6y5wYgltEYuVDVCXO5ScS/qGiV
 MnFVEgHZyAEJODpok1BJp2GZyt41dV0FApPlvCBSaxeOqXCmwafKqHR347IduUSoaDd50r
 gt4Q/hQlu/aik8+se3LgH/10LCB+rwZNto+1ICNLPBTOBxHDZ0efN+qvYH3R5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HfMPptGE
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-18
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

Autobuild statistics for 2023-12-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  4  |  0  |  5  |
  2023.08.x  |  3  |  5  |  0  |  8  |
    master   | 36  | 41  |  0  | 77  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 4 
                       unknown | 4 
              host-rust-1.71.1 | 3 
                   linux-6.6.7 | 3 
check-11970a7e112dfe243a2e6... | 2 
  gobject-introspection-1.76.1 | 2 
              libopenssl-3.2.0 | 2 
android-tools-4.2.2+git2013... | 1 
                 coreutils-9.3 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.2.0 | 1 
esp-hosted-ce3c50a33fa4bc56... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                host-go-1.21.5 | 1 
        host-sentry-cli-2.20.3 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
              libarchive-3.7.2 | 1 
                 libcurl-8.5.0 | 1 
                libglvnd-1.4.0 | 1 
 Makefile:727: target-finalize | 1 
                    php-8.2.13 | 1 
                    pppd-2.5.0 | 1 
       python-matplotlib-3.4.3 | 1 
                    qemu-8.1.1 | 1 
             strongswan-5.9.11 | 1 
             util-linux-2.39.2 | 1 
                 weston-12.0.1 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/55deebf65265e27bc1e91b843bf9580212964a02 |     
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a9001f938ed9e102907e4fd96dd526474df91c2e | ORPH
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/42b92192755f8eda62bb79ddf6ebbc60dcba3c2d | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fe4bdadd32df9574aed813fafc8e5ca180c158b6 | ORPH
   armeb     |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.net/results/404e0e9e50edbff67141d72a1c0d00e2ebe86ff0 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/e9755e1f4814b6b0c151c590b5c34acfd89556ad |     
    i686     | esp-hosted-ce3c50a33fa4bc56... | NOK | http://autobuild.buildroot.net/results/6ac7a4601938d3296ed1657c06f8cdf433757d73 |     
   armeb     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/18a907d10853a4bf8362034d9280c9585f906a81 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7d93336e027f2dc8763aaa2f3a4b1cbdf8509693 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8551c371e51966456b61365a38748520e351c7a6 | ORPH
  powerpc    |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/2920978d41f1004c6b3b64fc2ba378d1861c8f25 |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8d801188d9922b319006ab2671ec1e3ea7f3f697 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/eb45b65f9719232fc2461c92755e3f0af5eebe18 |     
   mips64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/88a48db6001ebe11715a8bd8cbae04339c057ca7 |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/f3232a6b56471ef2358ac4e80ca936e3a89c1d93 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/220a624c0df36ccc42e5eea2e258578bb0fc1d67 |     
    or1k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/acaa4670d81ede2604eb2630267c7bbe04b05817 |     
   armeb     |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/f98365366f60bb3c2035261da222a7999066199b |     
    or1k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/48938d44b9ebca9dcba3967301734b890efebf50 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/8260c3eae72f2428cedb4fbf41011119741e3f9c | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/378a340a16c1c35cd7a89065556d0deec2d56194 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/059a6d9415be02af0a73a4d05a3048a0b1477838 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/85202a6cdd0b608bf492937dea373390c7762e33 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/97da4b7d7cd86e3b16dced31365798d3b83e5af9 | ORPH
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4f4888774a9f3751791b07aed26222dbf83ba7d8 | ORPH
   mips64    |          linux-6.6.7           | NOK | http://autobuild.buildroot.net/results/fef88ee81f3b37ed511494c27f4c0d054d85f837 | ORPH
  powerpc    |          linux-6.6.7           | NOK | http://autobuild.buildroot.net/results/54485e94e98fdb8342ccc42ff81c09b915516b52 | ORPH
   arceb     |          linux-6.6.7           | NOK | http://autobuild.buildroot.net/results/f98d30e95b0b88bed32d8df97fcaf38cf81a1c8a | ORPH
   nios2     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/11293ad444cb14383daa4a74cf12cdca0fa9c28c |     
microblazeel |           php-8.2.13           | NOK | http://autobuild.buildroot.net/results/73f646ac9868c031937634f899a74be6a0c010d1 |     
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/f2e9293561ce13ef9b679478744372309ebf747a |     
   mipsel    |    python-matplotlib-3.4.3     | NOK | http://autobuild.buildroot.net/results/bfc0a91deefe826837b669198527558c0f85efe5 |     
   x86_64    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/60e84543c74112a61275cd5fab831a822d729c85 |     
   s390x     |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/79dff52895e1960fe15d8efd8e7411dc17e2063e |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/b83a9f223d373ce19677e7a949b82a837b5eddee |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/c2640b2940e005a9337eedc1be7c34f8582ab3e0 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/1217b6d4c2ef7415fa7386d8f2b62f1002837542 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/8fd47ce32f839562fde3bbd30fa093a649b06709 |     
   arceb     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/f34a42f9d520b735fe5b76616d15ad780ce1c5a5 | ORPH
    arc      |         weston-12.0.1          | NOK | http://autobuild.buildroot.net/results/7274e9cf06810aac48bb4c078614592ab8577133 |     
    i586     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/3a7157b67a0b7fa6282e349bdede3898bad11cef |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                    brltty-6.5 | 1 
                  check-0.15.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 uclibc-1.0.44 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/d65eb5f97179e3ef1b497191ca1d4d26fff0d95f |     
   x86_64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/42fd0f946b815e2487a470730283b58eea443a64 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/a1cf877b5869b5155ff71fd58216fb156e3741ce | ORPH
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/c026a483889ba9a1a8bd32585c6ba9765735caef |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                elfutils-0.189 | 1 
              host-rust-1.71.1 | 1 
         host-sentry-cli-2.8.0 | 1 
                 openssh-9.3p2 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2bdf639e3272acc014cdaa7af8f254db338190f8 | ORPH
  powerpc    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/de1f848751582f0f284ef2cc643fb2471af6ec90 |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/047dccbc94fe1d0e1a83ed9991a89e5d96923e78 |     
  sparc64    |         openssh-9.3p2          | NOK | http://autobuild.buildroot.net/results/912ee4373e5200bd83ac25de1a8dc85ba8da1272 | ORPH
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/d20613eac3b153154caf1d8e7f593eb6aad2fd73 |     


Gitlab CI results for 2023-12-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655115  | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655983  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655985  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656387  |      
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655179  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655180  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655182  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655184  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655186  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655188  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655117  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656003  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656010  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656017  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656021  | ORPH 
...linAarch64beMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656029  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656034  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656036  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656041  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656047  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656049  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656053  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656056  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656063  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656068  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656070  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656079  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656087  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656093  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656099  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656100  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656103  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656107  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656113  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656116  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656121  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656129  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656131  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656133  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656140  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656142  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656145  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656156  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656157  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656159  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656165  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656169  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656174  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656179  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656182  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656188  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656195  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656199  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656203  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656204  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656215  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656220  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656226  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656233  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656236  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656240  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656246  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656250  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656254  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656259  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656265  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656269  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656279  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656283  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656288  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656292  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656294  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656308  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656312  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656316  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656326  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656330  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656336  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656342  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656352  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656354  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656361  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656368  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656372  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656382  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655987  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655993  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655997  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772656000  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655369  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655415  | ORPH 
...emdRoNetworkdOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655306  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655451  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655485  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655923  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655455  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655489  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655954  | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655616  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655650  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655707  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655859  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655781  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655800  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655806  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655817  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655825  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655831  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655841  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655844  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655845  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655852  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655853  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655854  | ORPH 
    TestPythonPy3MidiUtil | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655856  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655862  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655864  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655865  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655869  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655874  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655882  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655884  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655889  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655888  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655894  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655897  | ORPH 
       TestPythonPy3Segno | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655898  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655900  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655901  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655902  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655904  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655915  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655917  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655918  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655922  | ORPH 
                 TestRuby | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655926  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655927  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655929  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655936  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655154  | ORPH 
               TestScreen | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655941  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655942  | ORPH 
                  TestTcl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655950  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655956  | ORPH 
                   TestXz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655961  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655962  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655971  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655973  | ORPH 
                 TestZstd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5772655980  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
