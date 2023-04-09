Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFB5C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 05:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D36CD813F2;
	Sun,  9 Apr 2023 05:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D36CD813F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIRx74KGBxHd; Sun,  9 Apr 2023 05:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2648812BD;
	Sun,  9 Apr 2023 05:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2648812BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09A211BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 05:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF69684257
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 05:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF69684257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaccwHCB2KtH for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 05:33:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B51C8420A
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B51C8420A
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 05:33:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 611BE100003
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 05:33:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 09 Apr 2023 05:33:15 -0000
Message-Id: <20230409053322.CF69684257@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1681018395; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j0jCOgm6pbindSzpORcNEAAhgm/qR9qK3Hh0kKvGpLc=;
 b=XDSkCIHW1rKobfTjky4dK/kioBx2zSovKWmUU/6jj1ooxhucTsN2oNsqKcA28BKw0K/HfJ
 iYpkQgsWBpgRxhYIGND/Ij5lfWVB7APVL0l1PomAvBe6SpIACQy5m+V/aaN9wfIPqDkB9v
 L2F7I3b4QsgwkY0m67gZcKayxgwhsdlAoKyprEn6MVhUlYk+PZuIGjobD19N+hhSor7Jt4
 WVaaN/yHdTDq9ZgdOlGkVal6nyIjCwOnvWDd5rxX6MNdIM7ZmB58wtNlVkqlEDU47tjlrY
 5TR83yfds6xvIrKWOmwHRGrSDNcJFwSeFZGNzINnsDoKetusgS+8JDFwrZ5yDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XDSkCIHW
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-08
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

Autobuild statistics for 2023-04-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 15  | 23  |  1  | 39  |
    master   | 133 | 92  |  1  | 226 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 7 
            host-binutils-2.38 | 5 
               libglib2-2.72.3 | 5 
                  linux-6.1.14 | 5 
                 agentpp-4.6.0 | 4 
                    brltty-6.5 | 3 
fs/ubifs/ubifs.mk:49: /home... | 3 
         host-gcc-final-10.4.0 | 3 
         host-gcc-final-11.3.0 | 3 
                       unknown | 3 
                xenomai-3.0.10 | 3 
             bluez5_utils-5.66 | 2 
            host-binutils-2.37 | 2 
                 uclibc-1.0.43 | 2 
                apparmor-3.1.2 | 1 
                    bat-0.19.0 | 1 
  binutils-arc-2020.09-release | 1 
                busybox-1.36.0 | 1 
                elfutils-0.186 | 1 
               fftw-quad-3.3.8 | 1 
                    flac-1.4.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
             gst1-vaapi-1.22.0 | 1 
                 haproxy-2.6.9 | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-12.2.0 | 1 
                host-go-1.19.8 | 1 
               host-qemu-7.2.0 | 1 
              host-rust-1.68.0 | 1 
               ipmitool-1_8_19 | 1 
              jpeg-turbo-2.1.4 | 1 
      libabseil-cpp-20220623.1 | 1 
               libcap-ng-0.8.3 | 1 
           libfreeimage-3.18.0 | 1 
              libgcrypt-1.10.1 | 1 
               libsigsegv-2.14 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20220930 | 1 
                     lxc-5.0.2 | 1 
                  matio-1.5.23 | 1 
                    mpv-0.35.1 | 1 
                 openssh-9.3p1 | 1 
package/rtl8821cu/rtl8821cu... | 1 
                   perl-5.36.0 | 1 
                    sdl-1.2.15 | 1 
                   shadow-4.13 | 1 
                    volk-2.5.2 | 1 
                 wolfssl-5.5.3 | 1 
                     z3-4.12.1 | 1 
                  zabbix-6.2.7 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/b6e51cedd87c1ba4359d76bd71aa9ca7a07c0fb4 |     
   arceb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/1a9fa870bf6e062918b375d6f1e2b70f6b5c6474 |     
    i686     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/fdde41b3cf40dfc26b0178365d303fcb77108a57 |     
 microblaze  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/08b3808c1648e0a922097f3d1366cf5e12b7041f |     
   arceb     |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/dc28fec13b92fcb0554330af5a2728ae3e05b517 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/80edf1cfe80438f9c478197f6eddc6665f4bdc41 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/e1564b091a92ef5d4d60e02fdb26bf1cbbd8ca48 |     
    i686     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/f03512fb44ce967a53431cb46e867478112be8be |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/76bd7895e11cefed97976a5f91cee6105ec4a563 |     
    i686     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2ee10e91bfa07eb00d4a8ca6e870c31f40085010 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/7803f91317bed2ba18bfe61d160e148a0382f0a4 |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/9fc39f5da464b8cd5b5dd517a65b923e21535c7d |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/866c33066db24fd0aedb1720ac65e2afed0d5923 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/78657719599b30023015ebb100b8c37fd665def2 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/75cf2416898ec6f46f59eba7a16d1096526047e0 | ORPH
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/1a7c66f309d6e9c287163b2945ea14e2d06485bf |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d56f6a8ad3aa39f36d08dcbfd37a9dc45ba7d933 |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/ec9c78e38c1e17dfef7bf3d92aab32cd8bcbedd1 |     
    m68k     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/4bd39ee764c4ea7faebc495dc04cf2c38bf365ec |     
    sh4      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fb7f8517c335efb51d133060262a885c89ab0751 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5514a0fec79d97c96fece51ffb5917dbd228d470 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/16b412305fd57fce8b24bb64d5e0ee924713fa05 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ac3861150173018912b908eb8e5d700736d21424 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/deb6cb58bd69e8161921e001b21d4bda9c7a1c89 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4904039f47c73f4a68e30edbd85a9b3e1a59a8af |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2df03645d705376de4703bd173f7d7fbcc1132a1 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/914ce18b9406ac20fe9029dc74891d15a9323a32 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a2f27c4e5bc56793ca1e116f00247df9470939fb | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c71177974520c62c7e39d81f3de501a6fe125786 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1ed27381394f847fb6eaac73ae47f8cdaa076ae8 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9cc9d47a7b7a5e2818edacfb26bfe81b0e9b7c9a | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/34e291e65960eea912acbe174e0f7ac1ae232752 | ORPH
   mipsel    |       gst1-vaapi-1.22.0        | NOK | http://autobuild.buildroot.net/results/00d9d69d3e68540876f36d168d1fd0372db9fc79 | ORPH
  aarch64    |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/c5307d1519b15be5a038c555bfa857156f56919f |     
   arceb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/b15fc23d9f545cd89e7d762c395662251be4a7b1 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a441bd640dfa3a266c4d0ec1ec1668ac59ab9423 |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/46e4e151af8ba58413e84b1857cca3d68f536f24 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/16aa7478c5af00c7f7f852bd4fdb8837a9567645 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/246d46b2f41bfe542ee92e7f503b905687196e24 |     
    arc      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aa14953bf2703980c14281ca3f2f3f17fd803b2c |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7e2fcdc5d70fd8a9147e052d861dfe083a43eba6 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a0d6cf4ab7e6f83a3834998c0d7d7f1a5ece1525 |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/4121905cd323ae6b554a695b7f5b9d00c99abbef |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/42aad11ad401945f6ba456a0f8145ce4946821e5 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/d03d566e6f5ab21784fa7f49df2aaa2be6e8fd73 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/04ecfd491db8d88a3932d72696708f2c49818ce9 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/385a5191524fcb9fc04ccc433d88b1c55e326fce |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c0ad84cdade98dae3275149a091f135141a72383 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/37a4f69a4c3a0937b3b79de803e906b78023dc2b |     
   xtensa    |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/ef983335d9c4f9164f877088524c1ffc98278204 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/3b994de3995cd74382f3997d180e5776086998b1 |     
   sparc     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/fbbadb08076b84f66453443e17540a63d25f7dac |     
   mipsel    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/eb1138367666f87cc11775a91c455b8485565024 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/aed997ae63800fca9b8f72ac8fe9a64c35d72beb |     
    or1k     |        jpeg-turbo-2.1.4        | NOK | http://autobuild.buildroot.net/results/f0ede3717bb56e98cfd1694d1c123e9f68db37d7 |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/9403835e7fa39e3a4d53c52feee964f3c7cff597 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/32bc8b8f65c1476aebec845922dfe5f31cb04151 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/284d90f1c03a2b9a28ab66753d9f63d83fe9c60f |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/088a041b5c31c1813735fc18e16580ff6ad3eb92 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/352e464fcae11b2de2a060c16059e71eaeafb870 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/fd19d2bd90daf885ca5f6aae18d76fffd607ab40 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c1632cbcb34e979578d8d5c0389f1a740cf8ccc1 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/01d471b1e39022508a063c9e655d37ebe48c65bb |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d98b6ed818b85d4741f14cbfa702506363e64c8d |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/411e2558212500b90c8e651104764a1a92b4ae04 |     
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8a4c96feb2cd7fa7a61e7b4fd9538a157bd30e80 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/0162f4beb2a18f8ab2c496515efea0a0b47b7f05 | ORPH
powerpc64le  |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/5c71b51d1fe0d103500b10f00bc84d09631ae316 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/7a7594e8c6d16c508df62597b70a8ea490c7289c | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/43e1229c536174fc23370e0320df22a5fc52c82f | ORPH
 powerpc64   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/00015a0248fcae33b131b6730ded1871faff1910 | ORPH
   mips64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/244edd380fbb7cc44dc4eb9206029aec2629bc9c |     
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/f4c7c8e0e2481fb8f3e49efb94012daba2f90abe |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/9714160b80a0d1a01983d29af38a95049c07b4d3 |     
  aarch64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/d2d7235295d8a459dc98f63f0f986a21cc0e09b6 |     
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/1e93daeb293f31617fa70cbd66288eb52ea3c2f0 | ORPH
microblazeel | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/4a1c9633a3ee7da7023861735268ed69794d9525 |     
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/6924c53724521cf7c78304677ef54c57029d9e4d |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/e8e07a13ee37e8fb4238a4129a09e93d0712d430 | ORPH
    mips     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/2cef5392b5480b7ba4570bd39c63dac0a40d5a41 |     
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/5d29fdf697e1321667d92902b5fdb845bf517119 |     
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/ae35b08b2ae6fd6300c72fea98b7be079f696448 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/3bffdbaee83c4079393a07f9392ef14f12dda0e0 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/05ee65812f42de802d86b37a868e7fcf1c57c71c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/f6d0beb6bcd09af02d0716e5f805c8f76eae4b2a |     
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/d61acf4302bb2e864c4e950d2bf1e23e6eb5fc7e |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/a49b70b0cce2b2bcfaddc01fe84ce93108a24e04 |     
    or1k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c0030acc92e3f040c08a2ce0076d8f1d4081cbc3 |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b36d468fe5686f0802d3d28a973c195945dd764e |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8818a3a5f02583e13f91c1e41a9c2f93ff0d6561 |     
  mips64el   |           z3-4.12.1            | NOK | http://autobuild.buildroot.net/results/d389b9579bc081cf453d0df704fe6ea594cbcaf2 |     
powerpc64le  |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/e35246b5af5898b258fee71f9d82b2abe0a13abf |     
    mips     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/2f402fc979dfd584d9b09dfdef3a628a7a50eeae |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 4 
               host-qemu-7.2.0 | 3 
                  linux-6.1.14 | 3 
                host-go-1.19.7 | 2 
               apcupsd-3.14.14 | 1 
                busybox-1.36.0 | 1 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
            host-binutils-2.38 | 1 
          lttng-modules-2.13.7 | 1 
                          mawk | 1 
                 openssh-9.1p1 | 1 
                  ramsmp-3.5.0 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ae112ca73eeccd15545a9fa0bbe51426f2e829fb |     
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/ee5b3dad8c83471ac89a78ee8f04cef1b84f72d7 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f4aff978296d2bbf7bfc0adcf846d2b78421b09a | ORPH
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2b7afef6a768686530898e5dc6aff1f7499f5dd9 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/dc55a80dd80175a4dc8456508d94ab228fcfb816 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1798c86b06bc54a2c9f0e825c9dfee39dafa2578 |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/85d626d81bf5c4f5a7b33f0c68223d77e83b3f88 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6365b3ad49cb0fc94111ab5ee1db2939f033ab53 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/70ceaa8a0d7f2a329198df42a0bf5c0c32764b18 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2c39420549dd077726910462da3b7b9460a0bf13 | ORPH
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/459f2760c69c96828820888890015312b4ee612a |     
  aarch64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/bf8d14e78ca03b96b2638309dfedb375dc89f8dc |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/2f796ba3e72f664faf945ee95ec68a99cc093a6a |     
   x86_64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/ef6460a5d32b31abafd8a9bea1db7c9f52b570c7 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/03bbe4d4bf9347f55ddd7aca77a0d23d4b832d9e |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4e007e4deb6978c5a5782476d8e133bcbd8db42f |     
    i686     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/6d6bc3f90b9d9a4b9b5e87063aa9ba3021ac094c | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/315acc8a6bb86ccffd642da21a0b0b65d16f3163 | ORPH
   s390x     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/67358389cc9de78277eafc6cc8ffdd59a6606e1e | ORPH
  sparc64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/d2528ab917e981905a55f69173deef763bf92dfe |     
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/f1f71c1f3a8758fbce17b170251c1f6cb7075ac1 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/a77dafc243a5705bfddd212ad8ebefec9e5785be | ORPH
    sh4a     |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/e34913901a0cce0fce3b1fcb197a2c89b50225f2 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/87f8ac17f9082f1d4cad0e94703e138f5df75d39 |     


Gitlab CI results for 2023-04-08
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
