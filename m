Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7D6C7618D
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 05:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B0FD400CB;
	Tue,  4 Apr 2023 05:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B0FD400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmXMXC1jM0aL; Tue,  4 Apr 2023 05:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB40C40292;
	Tue,  4 Apr 2023 05:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB40C40292
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C99B21C2751
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 05:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B33D81773
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 05:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B33D81773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jrBdobnTa2kE for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 05:35:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36A5781766
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36A5781766
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 05:35:04 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 08B37240002
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 05:35:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 04 Apr 2023 05:35:01 -0000
Message-Id: <20230404053507.8B33D81773@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1680586502; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ij/4GvE5leNx1q6TPQf7At2Yj2YU9KahAez26Z8EScY=;
 b=htGwi0ZtZFEa2lnvK9lUteyxov9IlxrKNz8O7Ri7R8QSWi0k2pIBZML4+5tL4eOaCVRfEg
 U3XK5fl/UKpN5PUVXLXI3/dUYnbYRrWGk0oy4AENwSidCSok4y/sRhUDohoBe/6inp+IEO
 zxuymRNDY9zvgHRnlrk8AjI2+ZgefCCW1Gva9iI7Qe42SC0P7B1krVoQMk5NiEGGkJuDO3
 qshnpDgV6ZoI4O2wkpjF5tgFbwyAxtFxEmsLwy7JkNvKIgaXxdA8X9CB712ouJY/clKfK7
 oFTkeA8wGXECQc0EcHNyWdaZ6CHEux6fB4BTsRjcDSMVaw1UJR+AqzmqW6s4JA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=htGwi0Zt
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-03
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

Autobuild statistics for 2023-04-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 20  | 12  |  0  | 32  |
    master   | 117 | 92  |  3  | 212 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.38 | 7 
  gobject-introspection-1.72.0 | 5 
                  linux-6.1.14 | 5 
fs/ubifs/ubifs.mk:49: /home... | 4 
                       unknown | 4 
             bluez5_utils-5.66 | 3 
               host-qemu-7.2.0 | 3 
              host-rust-1.68.0 | 3 
                    olsr-0.9.8 | 3 
                 agentpp-4.6.0 | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
                host-go-1.19.7 | 2 
      libabseil-cpp-20220623.1 | 2 
                   libnss-3.89 | 2 
                xenomai-3.0.10 | 2 
               acpica-20220331 | 1 
                busybox-1.36.0 | 1 
                  check-0.15.2 | 1 
             dahdi-linux-3.2.0 | 1 
                 dash-0.5.11.5 | 1 
                   duma-2.5.15 | 1 
        edk2-edk2-stable202208 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.3 | 1 
              fluent-bit-2.0.9 | 1 
             fontconfig-2.13.1 | 1 
fs/axfs/axfs.mk:32: /home/t... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/squashfs/squashfs.mk:56:... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
         gobject-introspection | 1 
                 gocryptfs-2.3 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                libglvnd-1.4.0 | 1 
        liblog4c-localtime-1.0 | 1 
                        libpng | 1 
                libselinux-3.3 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
                          mawk | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                 openssh-9.3p1 | 1 
                   perl-5.36.0 | 1 
           python-pyicu-2.10.2 | 1 
                python3-3.11.2 | 1 
            quickjs-2021-03-27 | 1 
                   shadow-4.13 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.42 | 1 
           v4l2loopback-0.12.7 | 1 
                 wolfssl-5.5.3 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/68246261d2f23a81f538331836a34e6f827e38d9 |     
    m68k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f5a3b6cbba65e4882851208cca4fe41b63ba725e |     
  mips64el   |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/6988733d9c98e27fe29792ad1ec3fff9dd56f71b |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/d457087d0cf972892e6fcbcbd3d6c1f5090fceba |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/70c90565ed90839e5a540205bdc177bf77a2a7c2 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/8a670534927cc21db609a53d895e751fa5df2f02 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/262b7f9923f0b2f7677002483fd416ef2a1d4b7e | ORPH
   x86_64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/57f93719274bd81727296dc4b57c30cc2970b947 | ORPH
  mips64el   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/a6be3b569f49f1507f7c2c0df58f3675d138fa90 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ee4f28a9c3a2379cd09faaedd00a4ec884e574ac | ORPH
    or1k     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/16178cc0e7bba0f76e1c080de4a1f719375f02fd | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/015e23006f664203d3bfe03799f2d553e3c9c1eb |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1bc3528e7cc1f0da8df19e23de03734d8030f943 | ORPH
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/98e546ed8c890f26afacd9d27dc5af5783902ba6 |     
   mipsel    |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/05cae29bcba833ee4059f32dd82780abab070ec0 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9677c0990dadee21d44ffe4cd82f16be8e079192 | ORPH
  aarch64    | fs/axfs/axfs.mk:32: /home/t... | NOK | http://autobuild.buildroot.net/results/12c3fdce44504a610717714f33119cde2432e9fb |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/cddaa49a1b87721f7dced277b3ba830b697fa37e |     
   x86_64    | fs/squashfs/squashfs.mk:56:... | NOK | http://autobuild.buildroot.net/results/2e7b4778d578f1dcefc3c8c3fc443918c1f56fc2 |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/ea6c5ea50b4c3efef4f2942ffe671ac475487980 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f02dd18281b764412923f8a8e8cf1b5485a054ea |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/70cd98c2e1cb483b1ab740181738be7413dccf36 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/05a99e5901b52cff10ee93245f104b7ff7bab3b0 |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8937fbacf79636ef326cc247c4696b5feedaf73a |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/eb29292bd5abf0ee36085219618207ff4be7b824 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/134eac55daae45cda7526814e63138156d3644af |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4bc41b63f52b0b2a3946debd7d0459c6cda6520d |     
  aarch64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/f6ebfd318744868e4fc1a6b889e713fa9859edb6 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e21608bd7932d9aa593a81a534f60052699f2e29 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1fbd8b85d664547c1f2ce786e37c1bf584b520f1 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2274027b43e4a52ddee86988828d8cf2c608553f |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8d837b688dc3879828611cdcfaec3fdc740e2161 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/30657e9033dfc09875f1ecdec0720213d45f2b0b | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bc9711482c86941e4b33a09c26b79fb59623b76b | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6b9b6a7789c25c5fe72938013f6ada931b2ac6ad | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3727cd31ebc2ea22059e473f762a5acd170fc34a | ORPH
   x86_64    |         gocryptfs-2.3          | NOK | http://autobuild.buildroot.net/results/d72d70970c3a1e1b6aac83c4476c5824871705cb |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/49d308ff263b6dfa5452750432ee4ce4bc17d685 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4a0b2ead594898d9f65d91a7e45ca307aaa4b097 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7745904e3ca7300a5b89fac4ea2d9ca12d92321a |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5fb4f27746f8a0170cd68a0ea5c064469076a946 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f31a9c357c4ab04b48abb1528c7ccc15b95c657a |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5e05393c71589f1be4804987cd71822613bb2768 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e4112adad9fc0178c2a2cb169c9b3f3e89de2347 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8edd8fd091ab8cb8dc0254f0615e83f0d2d8d2c2 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/17907d3b573f293542439ad2d3a05721e2dc29c2 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/4ccdd02614f31c4a7e1e3a7f193aeb113ab3d90e |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/160340692b2c35898771d1105fa9b2de0c717b67 | ORPH
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/58dc26e4a1620c174dea1a80a5cbb704f322e4b5 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/0bc578b68664c7ba5327d66b9a3f28ea95f9daeb |     
   sh4eb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/610c7c74952030c8afbd6b6a988c9d27ebe86d52 |     
    arm      |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/3a1af20e18321519f90122e147ef3f41bdd82caa |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/b0abfb3fe9fc6ef507b666bb6fbc64c94c8c851a |     
    i686     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/d344637a486c6fe8b95cf08da81e24bb408d6534 |     
   armeb     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/2830912de2cb2b69f6b89fc8b4ff4d7179f252e2 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/b4546095c8ad637593e57d03fb754aa2590d3e2c |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/3af97b15e4b380cc7587c8c2f6536399e67bb2ac |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/42d03892fdb56d6dd3610c5a37465b8cee30e949 |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/62943562684a654ad31702fa827207ac61a3309e | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/0abf39e887fd96d6398283ba5525dd09219d7c4d |     
  aarch64    |          libnss-3.89           | NOK | http://autobuild.buildroot.net/results/95926147c5264cc15a432a9b0c5607bf67cb145d |     
   x86_64    |          libnss-3.89           | NOK | http://autobuild.buildroot.net/results/6fbc3373a4651cf907c0bcc60586266228590a7e |     
   armeb     |             libpng             | TIM | http://autobuild.buildroot.net/results/ecbf7fbe5d27b6e19e1da86c066b62a0d9f487d8 |     
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/829df44d66b66230a66f825f5143ecea8fd4efb9 |     
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/1cd9d9d6cb37180566c0fb6289ddf00d809927bb | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a7c2c5f674a9ac3a030469827ee1b247b8fe0c3f | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/574e4b5213381a42738ca64d4f08b613f85f26fa | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/4c4f89060a432b66f938fa3159a0ca071af452fb | ORPH
powerpc64le  |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/d60b8bc7b26e3094b309044454ea16d7e60b649f | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/6ba1e6e15a1f57cff58b91dd91f7a4ad6a7a3039 | ORPH
    sh4      |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/52eecdf1d1b9f9a06af43e1e8eec914703e98c36 |     
powerpc64le  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/b14abbf69ce730cad7332e082992019e0c57d0cc |     
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/4253dc93569b25c65f9539d677c4ee55a444cba9 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/44b25bfa92782154834ab046961e757eafc95b26 | ORPH
 aarch64_be  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8d6bcd1f4cf42b41c97492f04fd382050087814c | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d3f4d0afe07b355c94eec10fb27dac63cee51bf7 | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/ce9edb2e3280e561427ad4ca30733cd9b0fc64c9 | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/471d553f040979ab8a8013fb9144251b7525d033 | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/50da7bedc4b3fc0f3af071272e3dfa17269fe3ee | ORPH
microblazeel |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/5ce2108c8642e19dcddfc8ae6f5dc9e67111476f |     
    or1k     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/69a0419975c48f3ca496ae1dbdbb424c64935340 |     
   arceb     |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/2888cff78d36e69b54fe9d39215cbf7aefa460c3 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/2453c6197f9cfe9e70f68f3967900009b6d47e59 |     
   s390x     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/56fc0a813aa1fd605d6e40a68cd20b1b65a53bd0 |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/95ad725e1c72ddad33b4184c178fd1b5b86be828 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/d3d1b2743a6cbf57769f1113f2363096658768f5 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/49271adeb9e08626aa4d7b408b9f4d376183cffb |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/55f6abe258ae4b5625e1f0d2dd5ad03a7c48242b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f45a7cf03af811c1229c412da90cb31351f5bcb7 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/3cacb1b61cf404282e4029870a0f6e488fecd32a |     
 powerpc64   |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/e7b17140ec1d3762ea35b24f8e4f2c520a46078c |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/0eda0b8e3a5fea5558d4be41d676bf3a86881daa |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d9a9f288ac34daa11ef3646a046bc5f13cde707c |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a6985df8c69651a8e465d7c2bedd704fa7482e6b |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/ad35dfa6d04653d1c7b84dfa05429c25d77ae6d9 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.38 | 2 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
                 libnss-3.88.1 | 1 
                     php-8.2.3 | 1 
            python-sip-4.19.25 | 1 
ulog-0389d243352255f6182326... | 1 
                xenomai-3.0.10 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/25b923415cbb60e8a417414dedd15f7b1f58a837 | ORPH
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d4e2c03bfd3291a862949e53a4b178364b871b3c |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2b99c015f55d3be03104ea565f629d44ae1b086e |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/6a30a7b46de0854d1aea2a26eb890fc84977c9aa |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e3dddbf86b48d61e5e7460cedef88fce1f2388e9 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e7b7318276d2bd90a6eccd807fc58508d3af2f3d |     
    i686     |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/29b66c3a73317eb6daad8ab58f1850d3623ab6d9 |     
 aarch64_be  |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/b4a866eb1e2fd7302f7a9d62a8fa9e28f59b8b96 |     
powerpc64le  |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/1a9317cf41c22b260e41e24f0ba5d998a3bd5ebb |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/29af63afc32f51d9e9b3583510ef82547e2bf871 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cb75c481d168cddd54c7e2daeddbad837250e7e2 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d54d071c50066405fdc25e81253771d977f825ff | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
