Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30D1C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 05:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BA4540289;
	Wed, 26 Oct 2022 05:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BA4540289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bE0A_LC0k2LE; Wed, 26 Oct 2022 05:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7242C40126;
	Wed, 26 Oct 2022 05:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7242C40126
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7261BF57B
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 05:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65F1940126
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 05:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65F1940126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UjpAFp2lKXaG for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 05:35:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E79D7400BF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E79D7400BF
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 05:35:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E6EF8C0007
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 05:35:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 05:35:53 -0000
Message-Id: <20221026053600.65F1940126@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1666762554; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SiB8J4znhrFj/CvZdC6c5jJrcLSmV7GyhU4ytAcXVNQ=;
 b=mC/vm7VBXR2GVsqMJoAlWbFhVaNF+6QsAn3gz1iP9Vn2WsMTgeGoee3DBWbQARCJds3N5r
 OuWFO5QYKSEDa5g1oBESaA7uGfRRtpGj63KrdK5C38N7/s00fWw6ExT0c8XjnlHqxhLk55
 hf7B9SKo9aDDYtRjvGCcE5tJ8mChLGXzM49WV5sQPXsGMNNQXzujOCASoETG/JwlQq/a6O
 1BQLOSyWlmBXw6DT9JwmuGelFtg49EQ3Dn0S2xTE14Ix31+RGq9Ie18HwD5qlfx/D0++ET
 wvR1FLRkqM4RJ9dk/gSRppqjB7HTaE3gcfEobzZx8VgLFJtD/U/t6GIwG44YXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mC/vm7VB
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-25
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

Autobuild statistics for 2022-10-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  0  |  0  |  6  |
  2022.08.x  | 16  | 14  |  0  | 30  |
    master   | 111 | 272 | 11  | 394 |

Classification of failures by reason for master
-----------------------------------------------

   host-bootgen-xilinx_v2022.2 | 16
                   libnss-3.84 | 16
                      crun-1.5 | 15
glibc-2.36-44-g2628500f5dff... | 15
        host-f2fs-tools-1.15.0 | 14
               libcodec2-1.0.5 | 14
                 sysvinit-2.99 | 11
                        brltty | 10
        host-sentry-cli-1.59.0 | 9 
                 systemd-250.4 | 9 
                   linux-6.0.1 | 8 
                     file-5.43 | 7 
              libarchive-3.6.1 | 7 
                libshout-2.4.6 | 6 
            host-binutils-2.38 | 5 
            igd2-for-linux-2.1 | 5 
host-pahole-73383b3a39afe86... | 4 
              host-rust-1.64.0 | 4 
                       unknown | 4 
            btrfs-progs-5.16.2 | 3 
dahdi-linux-5c840cf43838e06... | 3 
         host-gcc-final-11.3.0 | 3 
                host-go-1.19.1 | 3 
host-spirv-llvm-translator-... | 3 
                libcurl-7.84.0 | 3 
               libglib2-2.72.3 | 3 
ulog-0389d243352255f6182326... | 3 
                      xz-5.2.7 | 3 
                  autofs-5.1.8 | 2 
                 dash-0.5.11.5 | 2 
       freeradius-server-3.2.0 | 2 
                     frr-8.3.1 | 2 
                gerbera-1.10.0 | 2 
  gobject-introspection-1.72.0 | 2 
             libpciaccess-0.17 | 2 
                linuxptp-3.1.1 | 2 
                    musl-1.2.3 | 2 
                   perl-5.34.1 | 2 
              procps-ng-3.3.17 | 2 
                     pv-1.6.20 | 2 
                    qemu-7.1.0 | 2 
                tealdeer-1.5.0 | 2 
                 wolfssl-5.5.1 | 2 
/home/buildroot/autobuild/i... | 1 
                 a10disp-0.6.1 | 1 
              alsa-lib-1.2.7.2 | 1 
               apcupsd-3.14.14 | 1 
             batman-adv-2021.4 | 1 
  binutils-arc-2020.09-release | 1 
                  botan-2.19.2 | 1 
                    brltty-6.5 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
              dieharder-3.31.1 | 1 
                 dmalloc-5.6.5 | 1 
                     efivar-38 | 1 
             f2fs-tools-1.15.0 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                  gensio-2.5.5 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
                       gsl-2.6 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
       host-gcc-initial-12.2.0 | 1 
                jailhouse-0.12 | 1 
                   json-c-0.16 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.12 | 1 
             libgpg-error-1.45 | 1 
               libsigrok-0.5.2 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                 mesa3d-22.1.6 | 1 
                mongodb-4.2.18 | 1 
                     mtd-2.1.3 | 1 
                  netsurf-3.10 | 1 
              open62541-v1.3.3 | 1 
               openpgm-5-3-128 | 1 
                    opus-1.3.1 | 1 
                python3-3.10.8 | 1 
                      rauc-1.8 | 1 
rtl8189es-39c17661136da48f8... | 1 
                 syslinux-6.03 | 1 
toolchain-external-codescap... | 1 
                 uclibc-1.0.42 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/ed4019939234b3dd4fe53779aedc2a7e6f08230a |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/e03b40c043484c581e55117f443b91dc6bf808a2 |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/4c60dec5f5eb7a772dc74d22bc59972a8a4da191 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e6acf63734cbd6293fd503da2f650f99ac35e3ed |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/5d62f1e24c3e10094e213ca5bc24dcf38f2c3783 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/de844aa47ce720d07f23d606f471fd405ef41b18 |     
    arm      |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/169e5cfa8fdf7245ebb5c528d90c9a6385bb56bf |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/58a141b5f29742b51916de8e7c12f7c91ddcaae1 |     
  aarch64    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/3bf4e4a3e4bf8e2b7799cdaa79ede9179eba3849 | ORPH
   sh4aeb    |             brltty             | TIM | http://autobuild.buildroot.net/results/2e47bb5ae3f8e89daa6bfe74f0881da2ea7820f7 |     
  aarch64    |             brltty             | TIM | http://autobuild.buildroot.net/results/f444f2d65b58c13518fd86e146c072ad4222842c |     
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/815423c263cd49ed674d18da3ab0e05d57222539 |     
 aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/86e4f11c40b8b05e8e3035fc4bf6d8496502c65d |     
 aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/603a35ff94fd35cc402c533d9cc534f0bf95cb4d |     
  aarch64    |             brltty             | TIM | http://autobuild.buildroot.net/results/44458b0699090e11b6718ac670a4e18688d5ecd3 |     
    or1k     |             brltty             | TIM | http://autobuild.buildroot.net/results/8ff467826a647c1e72374e70cf6d8afd18d7d1b5 |     
    or1k     |             brltty             | TIM | http://autobuild.buildroot.net/results/403e606631c4f7b3884b9b7334b16e580a28d451 |     
  sparc64    |             brltty             | TIM | http://autobuild.buildroot.net/results/c68b4ec80f458df7bd74ebc212655289eee2243e |     
   nios2     |             brltty             | TIM | http://autobuild.buildroot.net/results/ee6acfe358b038cf9ea385fdad0af027e3ea688d |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/086d55014e5d38b0a1f94b77fc2973ded73b557e |     
  sparc64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a03d5e244442a4ff89cae055b32f5776b4088324 | ORPH
  sparc64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/c7828e07250efe4de9ad3d78069109c37697709d | ORPH
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a335453d4f074fc59b3e81253d41c8fa18e972f6 | ORPH
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/e9aee329712c71f206ab7b858b10cbaab285a65d |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f23031097bc23561b304a15778eb10720c1e3e55 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/113f4d0ae5dc83a025bbb14387c9ee98853af264 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a52bfdd5e6c6241d2dcffbf225157ff207262f98 |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3b60ec95bc2c313945eb2fcad47e263547b2e2ed |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8734087874330c6c9b01df977f09bdba0c55b779 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0379a05f4dd9fc9bd652ad10e22f94fbf80b6cbe |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/20ef943c52b4d7a9d895f01d591de7351d70aa52 |     
    sh4a     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/20624ae601cdc66cee5995abe180b4c039ef36a4 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/48b0e91b43494bf349343794079eec061cae0e36 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e3e8da4f797dced48aedf8c636db983d36849850 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8166e44cc42a6f2d61d1d524299f34a3ec6b151e |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5e6a39f5a8d4e7a053e8c1ec83662d37f63b8503 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/45282a1ba0b098f2a32f7124d25653779afe5ed4 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1a5a164ac13582c009c91f0bfec008f464b1c133 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b810478966037c2c461f73a87f8c2dbb58636b6a |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/589eae62b1affeadcb4cbc482bd9ddba3812089d |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/e1f92d6a15dfe0d6c59eeab9b93e4ea2a91832bf |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/bbbe7c05ea70691f0eb71c7eb93862f63c9a248b |     
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f4dc801fe5b0d807fd07bac3e8e5ef41eab70e4f | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1e6db487b9cdebecff8b64f8ee9b6c238b736a61 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/5b4e450114f0c617092801b2e60af820c2f1d73e |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/702ff3704e4e69f46dd0155ce864e0783cbc652c | ORPH
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/18075baef542f49bb80e3bcad7988698c3306be3 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/8e270923ce72fce116b05c1d1e22e805dcd0d910 |     
   s390x     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/65cf0430562a1f3b54f4856f9b04db060adb4451 |     
   sparc     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/cf77bfd6b256a66765732621440ff8959904635d | ORPH
    arc      |           file-5.43            | NOK | http://autobuild.buildroot.net/results/b4096390133b8cba9da31e2825531d0dec1d1d14 | ORPH
  mips64el   |           file-5.43            | NOK | http://autobuild.buildroot.net/results/1071f7f2a9fb365bbbb41943f3003c25d31f3e16 | ORPH
   arceb     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/58dc2bcb479003fe27014c7484c0c1334d7a5319 | ORPH
   sparc     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/2233164e9edd8eb9275da6239871a374daf67323 | ORPH
   xtensa    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/34cb3fff617704e64950c4a21d7702b339fffe6e | ORPH
   xtensa    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/84c2d9d11e3ec7ac435109028ab3466e51ba3dca | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/ad3a933af6a1e3a0156fa8e5201104bcf5d060fd | ORPH
   mips64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/048bf652d3f79fe222fa646154ae2bec8d09db58 |     
  aarch64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/b016384ef3b82cabd14172ca4793f404a0cf2426 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/107e737822a4177491059d6d4b9b2df6be887dd0 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/74fcf0ff2b5ba0b41bd5f929288220aa561f195a |     
   x86_64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/4a1b0193df05c68e2ebce92d8f881283c3127cef |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8c55309858770022a2ad76cf8f318bc9d6d24a79 |     
microblazeel |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/9b018cf65284836aaec404e924355ec1161b202a |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/fe5d4f1ffc882353b9edfb89971965e424d461d8 |     
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9388b004ddb46174c6bc7cdc461b3eab9380ee39 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad21aa4b1da66a6bd939dfbf37534bd3a2fd0f94 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/eeacbc436cca77b63ca359968010baf3bbbf5def |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a5fa66921aa84badab17c4266083567f9772f584 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/167ffe986a215c09a9cc5ca7375f26ec54985197 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c5b8372bd2aac0053b7d6ed746fa26034a2bf6a |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ffdafaee3af8e29aeef0253c7c98fbca62b5fb89 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f1c634d445f93e0a7cea3979cecf9bbd4a07ff74 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3bb7a114bc96b06b49cabb9b0ff67dc9ad0d2ed9 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7c2b37ba8f5dced727016545520ecef2c7d2e646 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6c74c8a58a216293d41a4f0494035e6787f0a8f2 |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4a62bf159e5bf7ba719ab8d6c5572e12683ad00f |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0a83b23f6b5f8fbedd32db4b529301ba69ccd52c |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2416e484f1e8dbc40d7427fbe44f155ed4f4663b |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/faad2a692e763c75dcca3604429d008ab9cb312e |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5f2f6d689c5aa7ce891c634f0bb4313134495afb |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/ed794adf3c2617becbcb4609dfbd09f123611eea | ORPH
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d01e1a88d6cbf91bc4b76ec346bd011c96c3b34f |     
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8555602dac396651a5ba9e8a1710efc6dee29a8b | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/aa5eb499b86667c6e6e432d72761f8848fba36f7 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/9414b17146f6fd51ac8652f77c0abd8192eef01d |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/31892826debb1d66d654e02d84281ee5b2219587 | ORPH
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/346e32d76700672985ff28cae772d06d7f9bf74b |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c1834e918bcb5093ad99e887d3532dc5d8757890 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/58a1a03231367a15537a9bb1b66c6bcd99a37351 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/789fbc0e9a8b337fad84d144baad69908829066a |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/df0a50faea0425e396b11d296ee83a0b24eb4485 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2318556c0344441739d26c37445285ccd2a10b21 |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/deefde9eefec07baf373550a2d3c534bd458b029 |     
   armeb     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/20f564c56145cd6b3e9b74c3a0010c04534b9027 |     
  aarch64    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/d82c1da61f41a7b2bbd12f7213c303b8146d77ef |     
   arceb     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/b9c8147bdc1ac287aa8736892facf9196809b730 |     
  riscv32    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/25103af38fa24fb53455bb3742476ec1f6406c31 |     
   mips64    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/4bf2cb23e00918e3fa35cc08897f17d8d5d47eec |     
    arc      |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/72410364c8af83ab695d20ab79e0190b3c7888f6 |     
   xtensa    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/587711f411b4029c59153528d5fc1fa284b09c36 |     
 microblaze  |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/ec78dd52ab988afc2f3405dc67ed667b4745b5c3 |     
   mips64    |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/3d62cade51b67a674e2c8421fb3cdb45cefd7fad |     
 aarch64_be  |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/3a8b66027cde3cdd9d02745381526d52bb626a78 |     
    or1k     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/15ee18e1347bb090dabb91aef10117f7da1fd88c |     
   sparc     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/7ea9485e22042c774e9f48ee9a19a287ace9f31b |     
    arm      |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/638b917b5efe5f85a82c067178ec1f03905c1524 |     
   armeb     |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/19af48316d0f03528838394848e98c9ac92c1a72 |     
    arm      |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/898e731396cde987d8e457bb8f1c1c11c9c1a73b |     
powerpc64le  |  host-bootgen-xilinx_v2022.2   | NOK | http://autobuild.buildroot.net/results/57708223585baee2b0a28cfb7256c8bd1046e8ec |     
   sparc     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6833fd6ca0ebef791ed9e8465fdb07cb6f6d48ee |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/df1c51b49e08458974e7bb3cd98240dd34041fa8 |     
  aarch64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5867c3f970d59f1436f48438d6f091403916abbb |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a3c5acc12455ae710c202aafaf02066edb8fc796 |     
    sh4a     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/123cb15a84cbf061195f87dc562159fb80ce188f |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/41c626cb473b9d7e04fecab0d1cc3a4b18e47693 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5cf06c73cea1db6e3acc56b12a019c8d460abad5 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/2ecb1f3f1dfc3151738bf2f13fbc06ed1756ce33 |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a364d59831ff9e930ae5d8d5e028ba3783b1acff |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e592f7de2bcc4b5c73103009a54b8b5721664555 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/62cf41cf5825161c992aec97df38a1fdfe24a5cf |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/71d88ea6d163a244effdafccf42b7c13504789b3 |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6d0d63d4b7788a16aacfd2490202db667439a9a8 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/89cf1645f9777e5ba0b986b98c21e4858acee8e4 |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/17501a2526b485cf8b4129fcecf06e9f330f4cf4 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/723183f354ff65cea41b860d96649dea02ee92e6 |     
  aarch64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/90fe4c3b8b72a2c28555674383de9bbd9e8ae09a |     
    i686     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/eb6e28c934654e6d714973415a2fb452f9580279 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/0954eddb5c65f80c948e32bcc7aa290edf147130 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/92649ba56560332ab65e554b32253f89a7226b1b |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/e53df1cf298e691105caf4f48a48b13d5d2717da |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/da885647912398a223369b413f19996861daede0 |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f79347039fcda74d894257a6f8087ea0b32ff4f9 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/833856008f3ce6ac28c92437264e989687f1cdb4 |     
  riscv64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4b0ecf5800a07e4a87b697b2c939ae0e9753f3f2 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/0b2f52a84a73455e031791cd88dd25b82a3f16ce |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/bb79f3cd4232c1f3f4aaedd1fb8756fa69f0f395 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/bf3ecf23435bd4d686d85ca0c524645c82317440 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/0eaea2489da7a769263938f07dc4789f5af3add1 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/68cd593b796a8cb35b351bd1b6d203456eb9250d |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4fa6f631e7eb53102bbd2308b62c8fdbdc37a6b7 |     
   arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d1ef488625827e4fbf3fca7776e85787bb47bf93 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9b1867909d1e750e4cd58fc1cb100d0f400450e4 |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/46c597cd8d749ab1b905b49a7d2e02cb9eaa00bd |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/77319c40ad5443931d44eaf17417116fc6009c39 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/79e0809e05c65c3dbd338437e2b6151a26ff60b3 |     
  riscv64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/5a2d886666a98784a56c1f50c4bb10e52d146f4e |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/74f254df3fdd3e377dce57d5075b57b561a4f31a |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/c32fb504180aa9e945415a1434c391a8bb176366 | ORPH
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/a986effee48b9f3c0cd5088f2ef614fdbd43eec7 | ORPH
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/d464b39ffdfc9f002eb466fc566946ec11b89434 | ORPH
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/3a3571bdf4e930b5e3c687e863191b69fffcbac9 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/dd238e6285ed767debfbd9b978bfd68bed4993a4 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/91a5c464d440c36e1e1bdef8e8ee8f78e6721a4a |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/960d9474d36412520f4eeab53cd9a286d804a011 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/49d863ce5114e114549655bddbb4d2af64c3c447 |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/d3d004570d9707efaf6e1193ed5320db8e3b0933 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/a8e2c2bbae59b566621bc0020b28f669beacce61 |     
   mipsel    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/b7649f58bc186a77d81c970b3052adb1193ff79e |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/8d17f470883f3f380f666a0bcd30e754387fdc52 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/528d651842077938a81c4187ca46f61835f4bdee |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/64c19986cca7b7943c114492ee7ca36bb9dd0c96 |     
   mipsel    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/82ff22ba728f1ec24c58ba20a46bde3432a98764 |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/9fcbf0c036a97b2e9a4fcc6e173bcfa09e1b3dac |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/cc17d2bb5f0d25e31cace1e6e0f26e04ea49a431 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/72765a30f117c00e029142189616449368f7fec4 |     
   sparc     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/2d018aa2c071b0e7216dad28132cfd2b303f00c1 |     
   xtensa    |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/76bee4244fe00cbb8bf79e9af30cf4a3ec3bf949 |     
   sh4eb     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/33bb7bada67ee0ea464ce4377d421edcafefbdfb |     
   armeb     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/499db221b13aecf8a076b2495fa77135640f5ec3 |     
    mips     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/21b587f3dd3ecd720e73ef76208857aa09a2a2c1 |     
   arceb     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/7383b082c95215170fd0f27d00f95ea190224256 |     
    arm      |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/94c8eb7c4d08149c61982ba62b2cb1c9951e2714 |     
   x86_64    |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/876bc2d53dbe8960d764f42db2a957046d8378d6 |     
   armeb     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/42b78404af8df32cc1f0bf18d03eb2c71e427efc |     
 powerpc64   |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/30f3b320f1e39b55f3dc7e4271e63bcc3ea8c689 |     
 powerpc64   |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/a74e035c5db7f026df0cefbe21c1d906d5b1e6c9 |     
  aarch64    |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/4fec694be19772987448b1ec5c133c00a2dc2797 |     
 microblaze  |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/3c10602905920197455b2c9c7e5ae435f72e4590 |     
    mips     |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/30b519aa60d5baddb4015cf3608baa04a30be907 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2a284cb7f68b2d0bd992020babe1490b0007672b |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ec7106fef04f9e041642753f147769324291246a |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/29dd27a9bc07c763a4969dcd998688e51b127f2a |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/7b175ba0149a2ba09df9faf33fac4d4d3c65fdcd |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/dde4b7b3847d8c238c3cf86c44b69da97c4e8ce2 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d6401d9aeb1774b2a499b2c06a9ae9fe17a5899c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/28cfef22fced8becc91c2bfa7f4147fd94542ba8 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/6d04acec2457d08ee27592b357e9539c4750d47f | ORPH
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2977cd5f41ebf3ee4eba3b630a9626663ed8226a |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0300400b7773004db129f515bb2d67443085998c |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c21264deafe7068997dc17f83cee7f073c1ac407 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0a42e53e814e5d4eb3df57f0eb120513333db313 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/066562d0b986f6db5467fc4b664febcbc55376d7 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3e0eaed94f8a33f64a9b743ae42509deb0d69248 |     
   sh4eb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5cd4ea0b3889695dec2346faf68505cb8ef2bbc1 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6e542771f43e2776e54ada02dccd5ab65f0af297 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/89833d93f30a77cafc6a21a50b5be0d27dec4262 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e4310463b981bca936b469c058cb9416207274f8 |     
    sh4a     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/96d2ed98fa9c7f9fce9a247ca779ec1b82b00e85 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/18c7a1634d27284ca79f3d2fa74b1c637ac92412 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5741af8359a98619cdb9d60d4a6f2c6222cd7f8f |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/985e97d1b52eba06a4bca08e1c28f5859a439b2c |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/60cecd4242430beb03992af3b6639973958e422a |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/55c98518b0a6c98f86c557eedb814f346d55e2ef |     
   sparc     |       libpciaccess-0.17        | NOK | http://autobuild.buildroot.net/results/253448b55eec64966a739fe110473ee869308e3a |     
   xtensa    |       libpciaccess-0.17        | NOK | http://autobuild.buildroot.net/results/d41509feaa889979668fa5105ca1defca71567a6 |     
powerpc64le  |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/84e65414f445d414d0d6a51f51fccaa1ef61f2a4 | ORPH
    arm      |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/d897ab02cd28ff033ca259e95e960ad61f2a9345 | ORPH
    mips     |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/2337975f71759d637691c9daf7d9f3b9216da2f7 | ORPH
   armeb     |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/aa0efb3a5d9402b8dd4ce59ee12e22b8aa26cb42 | ORPH
   mips64    |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/d706b066554681c2c965dab5babb3649bf568266 | ORPH
   mipsel    |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/f137201cf1f2fd5d5e5e64152bc2fcc73f344a61 | ORPH
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/ce81c4d3fcb941a8efb0f0fca62ababa9d36bb88 |     
   armeb     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/de47c3954c53ec51cb46349f35e69427d0dfe0a8 | ORPH
  aarch64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/28a8c9c01eb32ea4bc0524f6c7a4b79cf9ddf8a7 | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/1d4866d20960667ccc3eed399838ef5a740e5058 | ORPH
   x86_64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7605a619b0ee21f6905393922c3eaa35af28bef0 | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/8380f86b05c5855cb526fa77053cf3c63089e7ca | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d86fcc25709a42b0698832d55056bfd436b2a7a8 | ORPH
    arc      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/4b3a638abd44362584d7ca4aff427bcc49fff24c | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/5aa14c86e2b90e31debb46e5c95e3b165d7ccc78 | ORPH
  aarch64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b5f32b29873a7a4864c886004474f750bb4736fb | ORPH
    sh4      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/6c1c18eb968e11cf43beb10eea89762e7172f588 | ORPH
   armeb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/cd88c3538548c3cc0fd28438e23e58b98ac7f280 |     
    arc      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/438b8ff17e335a430148ba1df95e11a8db618ea9 |     
    arm      |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/00b9e2b49bbd519265065cf91c3c103ae8bbed75 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/9dcad8d3faee19045627b740f93ef4ff845f3194 |     
    or1k     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/e88613ec43ea5e945275c76da5515e175fc69460 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/3dc9a59ef5c8a867962c657c78a5b3ca3fe068d6 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/d1bbc7f2e5b2a2cde0a8bca81a4e29f37346f156 |     
   arceb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/0c52b3b91edf1032d5cd3313c9dd9aab700936db |     
   x86_64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/1d46bffbe93d30f5ebfc735a281bc8c2f7f8b4ae | ORPH
    arm      |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/fe8a78e5d87056600a84ffe1e9fb66bdeac50e10 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/19121f049b9f0d1e71512bcb9cee51b5928a38a0 | ORPH
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/37114d380eaf223ba5df008e8f1b5bb99ddfeec0 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e69e9c99693a4eff3e2105380631be397c13dd86 |     
powerpc64le  |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/1977a3bf24f28736f569e6fe6728cb981527c31f | ORPH
 aarch64_be  |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/dd10cc00451038e75365a3df9c119a8ad039ba99 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/5e4a35fd5ffa5a75326d9afd4f56ee926182a1f7 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/cb1983ed30a3dd4f27322c500834da240f2361f2 | ORPH
   x86_64    |         python3-3.10.8         | NOK | http://autobuild.buildroot.net/results/7ce0f2c0e71271bd10646587fa36831344ff3a9d |     
    mips     |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/ab7b7a721fedb2ed48d4021a803b51ca541f70a3 |     
  riscv32    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/37e49f39c5b409da63c8d938d1c0e99642b36306 |     
    or1k     |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/390f3af816da1ce50ec23e7762848254514c5371 |     
   s390x     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/693053491ba61edcff0f75a4f30c13958e7e12ce |     
   x86_64    |         syslinux-6.03          | NOK | http://autobuild.buildroot.net/results/44b7eacc00c5129b6304b0f5d838351c866cb69c | ORPH
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/2df61d462f758b91def0bc202b041f3c91ba99b9 |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/e9b4d38fb1ff348350dd736cc16338be5408d02f |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/079ad8b99220acfff0ee046e9b2de24214c02156 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/69f5d25ae560648dbe985f2622c84a1ad5260e08 |     
    sh4a     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5cb591d7c6484eed3414864c6d3ec234fa7f14ed |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/2b4b99068337a8c39c43fdc4c588b7069eae3848 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6af693e1e849906f7c82b57ed3b5528ab186b285 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/bacb535c23fad6f2ae7682a109fbd482aebd8112 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f397642867b1c838fc00c69e6b260504cc9936c9 |     
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a33ba8f9511260e6591257c78afc2982eb4bc97c | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/927fc73d148f8449d5ddf07e069a6fe185fbfaa3 | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/455bc800cb2a1ea6f63f435f5b62f32daa3ddb6b | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3d34294aa011c029958cc92ed14725e8dfe73154 | ORPH
    sh4      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/5646113b89ba2360162df5dd827de99dad2652cb | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/70a67823b800fb58247d1e65e46280a081815fdf | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4930bee86b85fad2fb5cdcf4fc9e996bf0ada7bf | ORPH
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3c55f27e92c1672ca892696fd109fd46aeaad372 | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/d7bf5795b7621a92be32f18794e3e67944fb96db | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/01a36d660d3d00b67c87f10d306415c024dd3e19 | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2eab3a2658de10243362090aba0ce53add5692f0 | ORPH
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/ba0dbd91a5f0b0d464196340070e7a5eee88c3ab |     
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/9b0e6cf96d499c47a5c6b16704a62a7c1f765bfc |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/a72d86ac87be512241793122a90bdd980a6b26cf | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/5a9b70a61a15126b9ee7486a9182458b12a4c21a |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/bb861d6833fa6670812c2774b8eea8a51a523810 |     
   sparc     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/7047627ac8cf09ef36093e338fc6a497e7804ec8 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a5b19154acc61ff2845da2264c9e976cf885a079 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5983a813e777978e0c86ddf4cbb220ebf7b29645 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b3d3a023d52983e952c480b5e784222c7da97789 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/fb1804ee32ef3232cfc7c16d8f8c51e47f2e56e3 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4e92e6af2acdb5ba520ff575a02997a2384610b7 |     
   armeb     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/ef3b188b42df8dc67358887eec966e1aeb72c283 |     
    mips     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/d6429a1e4b0c1ee9fbd5dc03a97617aef51cd53a |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bd1e7ebe0aafe8e8b1bde48db3e37616f60bc122 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bceb29111de25f5e08bb757201d087252ba52ce9 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4c2190026461156c3dd0c4bdb3f5a75499f0898b | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f5e62a046d47d856c89255964c4f27ae796913f1 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
gummiboot-2bcd919c681c952eb... | 1 
              host-rust-1.62.0 | 1 
host-spirv-llvm-translator-... | 1 
              libgcrypt-1.10.1 | 1 
               libmdbx-0.11.12 | 1 
     libphidget-2.1.9.20190409 | 1 
                libselinux-3.3 | 1 
                 linux-5.17.15 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/678759e312c41f125801624eaeb9b3e67da3c4a3 |     
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/874b7b27b5a247c7b6ac35533da9543065f81a46 |     
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/30b548f4f46c16203d8ba6af405ac163f5965952 |     
    i586     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/05711691cc8848bd056323bb6a2967130899d810 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3243e5634fe4f898e48e0cfb2d30319e22458120 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7ad2d242f0b8e92a50022d449c2af5e6f55f219a |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/4a8078b084565f3ecbfa0588fb0ace92e215e790 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/689671a4582a803b5a065a09514342a136b647dc | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/45b3af6d9389695827adf8b61383744b12f3e220 | ORPH
microblazeel |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/08c43b1e1ce75fda2f3c46fa945b0c60cfe710cd |     
    or1k     |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.net/results/a8612967d69fbab11c27b0cacbd18904bea3cbac |     
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/b0b426765e168e56ee004be973fa48436d1ad3cd |     
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b5fdf50afac521b763853df8288db7d2b8a2b798 | ORPH
   xtensa    | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/01994ae49a606a700c6fbb6eb09a8dc97ffe53d5 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

