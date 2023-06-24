Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EC9EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 04:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 496AB821B3;
	Sat, 24 Jun 2023 04:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 496AB821B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qc8Lde2ZvgrS; Sat, 24 Jun 2023 04:52:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E62FE821D7;
	Sat, 24 Jun 2023 04:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E62FE821D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 990BF1BF27C
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 04:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79FD041FB6
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 04:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79FD041FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OrhfGNvnLeqr for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 04:52:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8BCD41F6E
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8BCD41F6E
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 04:52:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D6DFAC1D59
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 04:42:32 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74360E000C
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 04:42:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 04:42:27 -0000
Message-Id: <20230624045204.79FD041FB6@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1687581747; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fO36hb8A4BEhZzxqDmaX0/LaSsQ8y37DzApshxE/wbg=;
 b=WI/ARL73u2Hjo6mqE5hhKjIZlrBO0ktfgrt7NVGZ2iAdLU7kM2ZRn5dgvqPX7xmWdSqWDm
 5ztMiOHVtq6Uq02nL31N6HHmeOURKosLkdJhC369znetPhgTg/MX0V6tMCRH6mezHDIwft
 BYrXJiOym2XlRIZjCZbe1mIOYmZF86UN/LYSEl/kF/q1nQHJtVKJEFnEe5/Hha3dPiSGZg
 3es+PqIAaHA4ylp3tmyLfUlV5t8bWifZvAVAcr2GfyKw13Eoek43hpBhWMCs0kOg1LAmjD
 URxQ8//Nf4BimilOMDfLkuIDp775xbJPlFZLo2dOVncqBpOFNgh+yfhK5e0y8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WI/ARL73
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-23
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

Autobuild statistics for 2023-06-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  1  |  0  |  6  |
    master   | 67  | 92  |  1  | 160 |

Classification of failures by reason for master
-----------------------------------------------

                   gupnp-1.4.3 | 8 
                    strace-6.3 | 8 
                 raptor-2.0.15 | 7 
                   linux-6.3.8 | 6 
glibc-2.37-2-g9f8513dc64119... | 5 
             dahdi-linux-3.2.0 | 4 
             host-ccache-4.8.2 | 4 
  gobject-introspection-1.74.0 | 3 
                elfutils-0.186 | 2 
            host-binutils-2.38 | 2 
            host-binutils-2.39 | 2 
               host-go-1.19.10 | 2 
          libedit-20221030-3.1 | 2 
                 mpg123-1.31.3 | 2 
                    sdl-1.2.15 | 2 
                  aespipe-2.4f | 1 
                    bat-0.23.0 | 1 
                  boost-1.82.0 | 1 
                  check-0.15.2 | 1 
                 dc3dd-7.2.641 | 1 
               ding-libs-0.6.2 | 1 
        edk2-edk2-stable202208 | 1 
                  ffmpeg-4.4.4 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         gobject-introspection | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.70.0 | 1 
imx-alsa-plugins-rel_imx_4.... | 1 
     linux-5.10.162-cip24-rt10 | 1 
                     lxc-5.0.2 | 1 
              mdio-tools-1.2.0 | 1 
                  netsurf-3.10 | 1 
               nfs-utils-2.6.3 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
              open62541-v1.3.4 | 1 
                 opensc-0.22.0 | 1 
                 openssh-9.3p1 | 1 
                    parted-3.5 | 1 
                    qemu-8.0.2 | 1 
            quickjs-2021-03-27 | 1 
rtl8189fs-c223a25b1000d6443... | 1 
             stress-ng-0.15.07 | 1 
                 uclibc-1.0.43 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          aespipe-2.4f          | NOK | http://autobuild.buildroot.net/results/47527061de0745e4b35d30db41c5d07c3f0f4428 | ORPH
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/229593962ffe2822fe2ab7011a2bae6efab6fa62 |     
   arceb     |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/d82a8ff08ca023cf4a2debf91aa6e4c574ae1e2a |     
    mips     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/7333f89ff3c07ceaec993352755db1dd12ec0383 | ORPH
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/3a8114cbf42bc569677762fde4f30592a09f5c39 |     
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/2bb8a38b12cb3a7650162f1f7f65b56b20711d64 |     
   xtensa    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/5ad9ab3c4529df1f55ebb56e13eabfead671fc70 |     
  aarch64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/deb081d7fb7211aa886eaac2d5e1576e6051086e |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2d6e9ac6a46c36b8fe1a31f6eb54b67a1989cdd8 | ORPH
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/fb204a527d753c05e3b3ae716baef456483ba954 |     
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/859ac557e58bf43922157103c3aba75cca703f3f |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4b473a527372921aa01cbb24aeb0b46e69d5de04 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/29984f0b72ab9b5d8060b54c221b5dcde981f3b6 | ORPH
  aarch64    |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/aa589b38e1591a0ec4d400891bf86f5138cf4542 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/057ab09d13ccc9e1dde8f9d8b16924b19a0fb5db |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ba575422d96f284aa6fa849eea02ed1ec33dd899 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1aa4a279f082589e28bc0ae94e27afedd8728402 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a6c478fd9cd0c2d51995c7dc42fcc0faa3e24952 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e7157515d7064d7f10f7b7c1f4f36eb5a8da1997 |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e59715184303162653eb717f002cd0fcf9e1fcf4 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/4dad20baf5c3bac78e94116504e976f4bbe48d72 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/175f91e0744671a7079814d373e3c7bffaf451ff |     
   arceb     | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/79aa2ca03ea551844ca8e4433212881cd23aab06 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/0075da8d5f0fed7d62a3d96f55921284a00e712c |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/05f4664fe1fe1836672129756410167b817af175 |     
powerpc64le  |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/7190e6b1fe1ba516171b2aada8b947005e808279 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/8a7d5aa25add15a26b45cc4c95f844dbe50817de | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/5b4bbd13d0821f0d94c79774d1cda7253d9a130e | ORPH
  sparc64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/e7ba4839125cca161fce07885190c1622a318530 |     
   mips64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/9c89bade4a92384008295741fbaaa0c4379b5065 |     
    arm      |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/a9b8e5e283f7a30122426f5054069e3d350f1534 |     
  powerpc    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/5691d3ece29a1ad1e79636a33d88a6d74323ebf7 |     
   x86_64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/c74e420450ad27623a63415c03babd43de0e16b9 |     
   s390x     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/61314ca27e7a86b6672f9c445fcf6235c5465537 |     
    sh4      |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/de65dcc7722709640f103f73a8cc57121462de27 |     
   mips64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/f03ad4fde7bc41d866bf35a00f8dca8f87b70123 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4daa2e16b5bc7599d5451f2f1fa2f7b602d04eef |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6d6f0dab7835f8bbecedf4715640b005fe6bb15d |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5fd90d207f0994871d1709cc51be293759816d4c |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5646352d0d88a96676b708c79f941e6e0aba848e |     
   nios2     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/a1dcdf434bd62a16c02c7d7784301734767ab124 | ORPH
   mipsel    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/8a474aff09056c2358ddc01414a3467f3d9fd8c0 | ORPH
   armeb     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/9900de4e9896be4c08ef36253ea9d8c4ba0a3eed | ORPH
   arceb     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/cc1e87476a79988ee16fd11354189bd179055ffb | ORPH
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/ad8061530f1cf0ce83303be8b3f7da8e1e4913b9 |     
  aarch64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/ac84b2a93386a37ab142fa856e5168c4ab60dc9c |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e1e5679c53b167a653822c636bb9538c8911e6d9 | ORPH
 powerpc64   |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/98f3682ea79769079c0c79c2fdee170bc8702ae4 |     
    arm      | imx-alsa-plugins-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/706afbf59de5e57590a460ec0885288333d0995f |     
   sparc     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/cce67c9c41aa2de7ddf0d702247607e6bc623da6 |     
   sparc     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/d62a091cf5830dab7706eea4f459dc252fc8bd61 |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/2db90ccd244d37dc8330cf18f2e57203fbe3fc30 | ORPH
 aarch64_be  |          linux-6.3.8           | NOK | http://autobuild.buildroot.net/results/5ea5d04551ebabfa8f31ac92114865f020164f2f | ORPH
    mips     |          linux-6.3.8           | NOK | http://autobuild.buildroot.net/results/018ae450eaa652d8b1c58917190d8cfb8cefe231 | ORPH
   mipsel    |          linux-6.3.8           | NOK | http://autobuild.buildroot.net/results/11a5b49bd0cdaad3ba343aca18b88fab35bc56fe | ORPH
    arc      |          linux-6.3.8           | NOK | http://autobuild.buildroot.net/results/7932566f94135c9b3b16beb65067fd778ff721cf | ORPH
    mips     |          linux-6.3.8           | NOK | http://autobuild.buildroot.net/results/ece069c5c7a30fa45e5bab2e740edf23f23e6adc | ORPH
   x86_64    |          linux-6.3.8           | NOK | http://autobuild.buildroot.net/results/8cd99f02499a655e4fb11891ceef70a90201be59 | ORPH
powerpc64le  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/a1f1e7d53b41e94daf95ab121df80071db087728 |     
   x86_64    |        mdio-tools-1.2.0        | NOK | http://autobuild.buildroot.net/results/6c4accb52b722cdd131520e28ee92db6820733db |     
    or1k     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/d74d25aaf333a13bc911f662b5233a7acbec69dd | ORPH
    sh4a     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/90551f58b396863c874018ad9dcb14437c5ba98d | ORPH
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/5f93af0e000f25ce01541282ca8449105c8c04fd |     
    m68k     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/97c9ca5793b93ae20e66aafbfcf85b75f527bc09 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/2a07fc777dd3e9daddfc4157bb073e151b9413fc | ORPH
   xtensa    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/42ed73a5f2d3990a3835f2aed8dd3b89fef60c97 | ORPH
   x86_64    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/2c8910aba574165d43357bd7af2c129282c6be65 | ORPH
   sparc     |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/dd2584af3961ff3a94ba939420a44aa1f964d6b1 |     
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/490c34d3b7458a9de2f70e5d7530d7c20bc5d78d | ORPH
    arc      |           parted-3.5           | NOK | http://autobuild.buildroot.net/results/0ceb338a2786b55833efc461f6d7964d9083ce43 |     
    mips     |           qemu-8.0.2           | NOK | http://autobuild.buildroot.net/results/9985d2999eb896da5bbb923a41616fa5d92531b2 |     
   mipsel    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9114f160d91ca6c8630f68b2d91b7573ad5c7e38 |     
  powerpc    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/984add8b2679697dae99d4bd9461eb20fbb82fe0 | ORPH
    sh4      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/74199c5d3e8b799a72eb91243f98cfb19e71788b | ORPH
  sparc64    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/91144298a13bb3018d962aa455f4ab53b5fcc9e8 | ORPH
  aarch64    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/08450f51a420c751dd8d2af0dabed39816173459 | ORPH
  aarch64    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/e92b040a5c0786875cc064b898796d34454a40db | ORPH
   s390x     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/eb3cc4a6e154f379177b4fa7f9f8cb7086c63c75 | ORPH
   armeb     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/0b883beafdf054331c6131ed2f069ed629d9001c | ORPH
   sparc     | rtl8189fs-c223a25b1000d6443... | NOK | http://autobuild.buildroot.net/results/f4863bac77419a23d030553d8bd7c2a71f76eb91 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/fb6e9992c88677d33f92b56f79c7e1aa6c3d0996 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2675d20334b8fa3af8daa8c6b418e910c24a8a00 | ORPH
    arc      |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/d18b591b5a6f54a46830faabadf72463d0f792ae |     
   arceb     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/21f9642b0cd331e6fa7a505778d55435abf1d6b7 |     
   mipsel    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/678a71b24941692faafa8285db47a28c7332733c |     
   x86_64    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/73548386f2a409a7909d0b2c814ee492ee45c637 |     
   mips64    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/e7d43d043e0789e2f6ddcc23f786793126a039a7 |     
    m68k     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/30f648e6dc12b82c711fd6780952f53d6cc8fb18 |     
 powerpc64   |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/5694391b59682b728c6eaab64cf6d7ee319f35bf |     
   mipsel    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/e22fc67a334ebc1b1fbacc15a6cf606a3213fcff |     
   mips64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/1ec10fafbdd486e8e78daf64c2aa0b09dddcb857 |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/05a8ba0a2546a4e7199fb8003d2a95f39f2749f0 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/dc1416fb62301e904d6b748729474bb1f8c722b0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

libdill-32d0e8b733416208e04... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/fa9f912fd6c017bc6d04cf9ea5fef95da7d5d976 |     


Gitlab CI results for 2023-06-23
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519270979  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519270987  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519270998  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271037  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271076  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271084  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271092  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271099  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271253  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271263  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271417  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271539  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271548  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271554  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271700  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271709  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271710  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271712  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271714  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271716  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271718  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271719  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271774  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271797  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271798  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271857  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271966  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519272053  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519272084  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4519272204  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
