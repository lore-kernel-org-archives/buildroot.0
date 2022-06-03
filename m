Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70121C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 04:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE1166104C;
	Fri,  3 Jun 2022 04:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUMwEkX8whba; Fri,  3 Jun 2022 04:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A3B461096;
	Fri,  3 Jun 2022 04:44:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48C6C1BF2CF
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 04:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 378C761096
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 04:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecpblTUe4OF6 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 04:44:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2FB16104C
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 04:44:12 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3BBE71C0002
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 04:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654231451; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jmz1Nl2FWRTuzTMnzSXzY5dlBShIa6OVS8NENInfWsM=;
 b=Pp2HXeUVyJLT5HIulZ96y4GhZ+CgsJ+SbhNIimdVYy1539cNDuIPwgKL3adA9fXA2BMIPt
 QRUvbWazmH4Gp31co3YjNrz4hrpxnKXwvo1zRJfiPW9MKAo60NihMIit2g+1+kHYmWg0QF
 e3FDdsNED3HeBcf25DEKvpkNINhY1OZ5g/Wlz/NtHk2sZjdz9g6IwQpQVTCu74PkcUUzk6
 028uMkmdZ+pJoMg53Fi/uEi61V/1KS2YAc2TX72vmJO64uo4EVDFDAD4/Qo6h/j4D3LFRh
 27+KVDH/BLbJTSLLCWlr/JrESM7bHdhsqIxN4FYxTLjEJkxjBoR9ESc/556QyA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 03 Jun 2022 04:44:11 -0000
Message-Id: <20220603044415.378C761096@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-02
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

Autobuild statistics for 2022-06-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  9  |  3  |  0  | 12  |
    master   | 195 | 156 |  0  | 351 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 14
                 uclibc-1.0.41 | 7 
           libfreeimage-3.18.0 | 5 
             libopenssl-1.1.1o | 5 
                libressl-3.5.2 | 5 
dahdi-linux-5c840cf43838e06... | 4 
                  linux-5.17.7 | 4 
                     refpolicy | 4 
              swupdate-2022.05 | 4 
                 wavemon-0.9.4 | 4 
                gnu-efi-3.0.10 | 3 
  gobject-introspection-1.70.0 | 3 
               libglib2-2.70.4 | 3 
                   perl-5.34.1 | 3 
       shadowsocks-libev-3.3.5 | 3 
                   uacme-1.7.1 | 3 
                 zlib-ng-2.0.6 | 3 
                busybox-1.35.0 | 2 
                 dash-0.5.11.5 | 2 
                     frr-8.2.2 | 2 
glibc-2.35-96-g2c4fc8e5ca74... | 2 
         host-gcc-final-11.3.0 | 2 
host-pahole-73383b3a39afe86... | 2 
                libglvnd-1.3.2 | 2 
                libpcap-1.10.1 | 2 
              liquid-dsp-1.4.0 | 2 
               protobuf-3.20.1 | 2 
toolchain-external-bootlin-... | 2 
                   tor-0.4.7.7 | 2 
                       unknown | 2 
                    4th-3.64.0 | 1 
                  acpid-2.0.33 | 1 
                apparmor-3.0.4 | 1 
             berkeleydb-5.3.28 | 1 
                bitcoin-0.21.2 | 1 
                  bitwise-0.43 | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
                cryptopp-8.6.0 | 1 
                  exempi-2.6.1 | 1 
                 freerdp-2.7.0 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                  gauche-0.9.9 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
          host-gcc-final-8.4.0 | 1 
       host-gcc-initial-11.3.0 | 1 
                host-go-1.18.2 | 1 
host-google-breakpad-c85eb4... | 1 
host-imx-mkimage-rel_imx_5.... | 1 
                    ipset-7.15 | 1 
                  jack2-1.9.20 | 1 
                  kexec-2.0.23 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libdcadec-0.2.0 | 1 
                 libgsm-1.0.19 | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.104-cip3-rt3 | 1 
               lpc32xxcdl-2.11 | 1 
luajit-f2b37f51f69ba7e9f8de... | 1 
                 mesa3d-21.3.8 | 1 
                mongodb-4.2.18 | 1 
                  mxs-bootlets | 1 
                    ne10-1.2.1 | 1 
        network-manager-1.36.4 | 1 
                  ntp-4.2.8p15 | 1 
          perl-net-ssleay-1.85 | 1 
                 pixman-0.40.0 | 1 
                    pppd-2.4.9 | 1 
    python-cryptography-37.0.2 | 1 
           python-numpy-1.21.2 | 1 
            python-ujson-5.2.0 | 1 
            qpid-proton-0.35.0 | 1 
                  reaver-1.6.6 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                 uclibc-1.0.40 | 1 
uclibc-ng-test-0844445e7358... | 1 
               valgrind-3.19.0 | 1 
                       xenomai | 1 
                xenomai-custom | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/7e2a056329a6ff0134b8d6f4a0bb9d9e984900d4 |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/bc9824798ce5efb92f9be031590831f617d2a41a | ORPH
   x86_64    |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/2312363bc9415f46a776d65490b1777a4e4409f9 |     
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/dd38d9622dbae5b134bcd749612ecdd6e8eeb852 | ORPH
    i686     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/f1a3e41e6a9f8bc29a755269d96ebe1fdbbce136 |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/92680d253712fad28f6239048e12f2abdde38bb0 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/fa18fcae66a7402c16a8c6340be77ae8215518ff |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/26eb60aa96f226271d4a9522afff17d91482b131 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c7cde1fdad9d4797e615d0098bd4bdad4172d50e | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/d1ec981c1bfbb0d530135f67b1c09417ac46830f |     
    arm      |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/ab9fef6a15d6e8303851392a90bb5bb85ddce72f |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/301e72541f9ecf06440849e11ef5053bbbbcacc7 |     
   x86_64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/bd5e2686ead35469382e2b1c34f33a576751cb55 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/4a82dd71c747b99f8f4603b04ba1e18322dc0f8c |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/e6c2c49d84180f359b73764dc096c9b62b5af5f1 |     
  riscv32    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7484377b3c54cc3d6f5646d02e68f4bebbf8ba09 | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/25be35eb80f17f1439a87be236a70e42cffed794 | ORPH
 microblaze  |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/de5e1d9498b399cfbfca450bff6d4a57d0cd2f19 |     
   sh4eb     |         freerdp-2.7.0          | NOK | http://autobuild.buildroot.net/results/e882dc75b85a460a899207fcf1b27241a393fcd5 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/66497642a750193db99f36e5727bdb2d6d365702 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ef9970dfd29f4dd4735fbf4c687a846959db47de |     
microblazeel | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/c109b81e1a4660e9114791668f3275436e170cbc |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6b7db205402bda53e01b6b7889c755dbb0142e2a |     
  riscv32    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/75a4baaba6c0ce7ecc67cc984301a5c49195f534 |     
   armeb     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/21bdb8a6499007ed850673b189985e08fbbf2123 |     
   armeb     |          gauche-0.9.9          | NOK | http://autobuild.buildroot.net/results/ba83fb990fcb6d2445e2f674ef2cff3c1bd0c8ec |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b28c33f18cb5f609e92c865dd2cdd7531ee7182c |     
 microblaze  | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/fd502068ca3b3d4edcecd744c6b725fc22edb3ff |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/ffe98751556d826e6ef196e701153c4758ff5257 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/faa18405728d2914e8057d3f5889c2054477890c |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/34095cdcda959e1ea1267ea80b00064f1d1bb725 |     
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/615a11c9f4b024a94476be80b2c91b967739cb3c | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/85de1113539d2c85195e909f82d103c417ba9002 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/913bcbd800fb3ea971876a0923539e3b618afee9 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/18598546dad7db507cf629294931a23e6d87d535 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/5edb7d5d20b800ea78b35c576fa73cb41217f194 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d92c0e7cb51e14fbbd2ad66b2181ec8d821dcd68 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7f9410dfd50205c52b20b259043f2ce7b2fe6890 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e5fb546a805419ee2e62d2fd85bd2771d5e7b42e |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8c611e914a9c608851245b1966621214a5fd825d |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/57b08fd28923b20478a7e9a5a06be32b66fdd40d |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/54a9181d4b15bb01b16001c6fed4e0543eefb6b1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d6153b52a57a6dfc00103544e3b0de5e03c84ed5 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4e96b9b5688a642dac13cffd0927648e78d462bc |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dd6f2dca69ced8b2156305ca0b4518cb14635f2a |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cfacdf15745b35abee2a36551c2ead55f1ebf2c9 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e889824e33949118ddc3cd574b0170d4717032c8 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/58da2315a500486b029154d1c80b13319a242a85 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5d695a10a74ec688ee881c78ee202d348f3d953b |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b3472655be02867874291dd5a3a7195b4d8726f5 |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a04f826432de89fe8e40363c7fb226fd17af9669 |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ee21a45e4027e85aef68800d291f6bdc4bbf8d50 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | http://autobuild.buildroot.net/results/f0c292df0b4462c5f97fcff0f25dcbb23a0f9899 |     
   armeb     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2ac2ba9ac18d8e8545213756b495b35be3fd7063 |     
  aarch64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/24c9186f5583e2849fa1753f3bc3cfb1441c5a4e |     
    i686     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/754f38f76a3cf17f7efded2f44e1fc1be086a960 |     
   mips64    | host-imx-mkimage-rel_imx_5.... | NOK | http://autobuild.buildroot.net/results/cd784c71a747b1c457d4ab6f85e2b5a8bc8212ef |     
    i586     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/aa37fb7f99b2939d6ce36641695e81e1207f1cc3 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/80205f09b06a5edd7c80fa7a4572d2b805540fc3 |     
  riscv64    |           ipset-7.15           | NOK | http://autobuild.buildroot.net/results/57d973e8cf9cb716156db7cb4d11814f42d52c92 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/f5f56a3d999431c57b2969a8b960e31376793093 |     
   armeb     |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/f6be785278ced770a01cef3ca9cf4f1cc07afa47 | ORPH
  aarch64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/67b339d22654ae45e1f1478ecb25570a03d25112 |     
   armeb     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/def32ee5a0c022f5ff0f3fa088095196f8a24894 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/62218129066117d2b53c21a00f7f2ce3a8961d67 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e23ad96e5c42e981a27476d33fcbeef12f4d56c6 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1a1add4225dc9d1fde70e2e1aa2dc2f0452d548e |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/577b7c7c122c9d06c8903c043fd862d2b48bdade |     
    i586     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/cbb9a34f17fd56ee1896f822f3cd4010328c6b5a |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/cce0888ab24e42eb0c58158b6dc72e34a2678a1e |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/6f5df76b6c1c269c42d1e092ad636ad960c21c41 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/ebc6c4480ad9ae79468c4a6ecc5f87b76169fbf2 |     
   mips64    |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/3f43a4f3a3eed3afa9570f30b928a7c77311c825 | ORPH
    mips     |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/3ebeb1a30da3922f63cd2097e48190613a266752 | ORPH
   sparc     |         libgsm-1.0.19          | NOK | http://autobuild.buildroot.net/results/8fa6518cb7ec111325f3281de8f68c9d02689bc5 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f5cadef1c8635cc6dc32555715a0060df71ffbb4 |     
   sh4eb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5f197af847125f49c072377d8a90023e7b41efac |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/a9af33d1e6fde0643b53b302ad62ef47a8a344ab |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b57bbd61df2bb9866369d666567a66c0c4a24658 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/cf02767fa86d1caac0a3bbde25e8babc060d8090 |     
    m68k     |         libpcap-1.10.1         | NOK | http://autobuild.buildroot.net/results/0a240f4b22d3e114cc60679aacb86d16bc3b30e6 |     
    m68k     |         libpcap-1.10.1         | NOK | http://autobuild.buildroot.net/results/7c96bcc3f0ebbf33f67ac0c5ac9281690d79b8cb |     
 microblaze  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/729230b04203ec70122fc74cb55d9eda7307480c | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/a62c53c1906695ba6ebca86e0035d39a72eea6f0 | ORPH
   xtensa    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/0c4750a85837c028a04fcdd7dc982320e0035238 | ORPH
   x86_64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/32ba12c3c13a4caf9b5bd9b621608271a3007a58 | ORPH
  mips64el   |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/df8d084b153989adb94af43758b2525491315031 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/a64e7e2a2ae03c633bda6c84d6b5b8d26fae6b43 | ORPH
    mips     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/4479fc6335a943bce221b88d14bc9601e5f2614a | ORPH
    mips     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/a565dbbd7a6054cd368b33bf6c9c7c6fbc464aab | ORPH
   mips64    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/6656084ac7dc46989d061d744fc58de7f058306a | ORPH
    or1k     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/6ac2e24f91ef8276db6b67386081ee35469e0c93 | ORPH
   mipsel    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/fdf230ecb6830adbeafef3fb5a6f3d51cbc9e256 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/bc184b5124eb437a45837bfa6f326027df48f1a2 |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/e0feb320eeb4cd941ea7498b1aff7b2ac45af216 |     
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/17c7eca73e966edd96603f15ae8051f227f114cb | ORPH
  powerpc    | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/5e4318d3caa12175f9f4e23b7a79c6ecc89da6ab |     
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/a94ef65001c8b85d4e1b0eb4b47151137866be70 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/7268e72479d727843f9c2a33858ad124c882b8d5 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/952e82eaca2e9c3009ac3251d73eaa185f216dec |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/0b8bbf494084ea44929493606b8c24e877b28031 |     
   s390x     |     network-manager-1.36.4     | NOK | http://autobuild.buildroot.net/results/ac25c42d73161bf4cdfae3e53de8826f0b8dbf9c | ORPH
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/240dc83a9300cec93cd84ab6263d718a199e41f8 | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d1234fad88643f78ca12a83a1885e2495f5af4cf |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/08f840b262da9d53d4de8e5375b4e2a96db64520 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/286cd3a56a7efd045741161e5884543d5bca83c3 |     
    i686     |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/9576f77a9ad0746ec991e662b4a4007364dee03f |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/62def5bbc31775a1ab567554798cb9dced8fc192 |     
    or1k     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/df29c964c72cbf083e5096a71dcd0ca3cb4b5e26 | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b410a00bf9f6e5e357d7210c73305ee9637318e4 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0b015c6a9df8c58e9a630b42bef1663e1729e2f0 |     
    mips     |   python-cryptography-37.0.2   | NOK | http://autobuild.buildroot.net/results/cb9ae9fd99524917a8597734306657b254923871 |     
    mips     |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/82c405834e0abdf2423b23c9660a9590ae5e4260 |     
   xtensa    |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/28ad31b4bd194ea3636a3d304b7012348c48002d |     
    mips     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/3e7c52c19e954ddc3e4287103206b8d3dc4b58a7 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/848277f97e9b48104df72e6910935d106a439079 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/f2700eca5f001af914cc8eed7c88b48b7aac31a1 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/929c3a5de0795af2c07e7d6b0e7d250ef1099f1d |     
    arm      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/af8e6aa7b7333abb7cede85f59568eaa8990dc67 |     
   x86_64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/24a0ad4345d22f78d4e1e3ca085dd92ce169017e |     
microblazeel | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/3695fd7ba2d33c215991c1105d339c6e9da6b929 |     
    arm      |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/afa07a57456edea206cc06abea994df348592c96 |     
microblazeel |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/efd7678636d47cba5d5fbc19b3a97d41b58181ec |     
   x86_64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/79cf570b44b293571a0fe86e0154a3a12f1f4564 |     
    m68k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/249b8cd45f6596d4fd2a119ca1f6d1e14749c4bc |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/80a9c036313b859e58ecf0f91b831e289e011412 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/3b7e21d39df5d133da4664a4210feb920f30d7d0 |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/66a9ff583d4c3228e4a140b294977037f461338a |     
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b006b9181ed43096674439f83b00130957b4778c | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7befbb686bb972016ba4e742976dcdb3fed1be11 | ORPH
    mips     |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/149bbb99444057dc6252b408234eab9328f2c91c |     
    mips     |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/ba6906cdc32a9d13dfe93857ded0b2777d3b869f |     
 microblaze  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/d599a995436f69b1c89b1c74dcab2e2a9f660297 |     
  powerpc    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/f4900e2ec85d18318b3a42b3015fd2c48d71972e |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/b8c8e0876922be8912e2753fb2c4fcc408037013 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b80429f86a08edae9199a2e1d6c0c664f6ca0bc5 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f4c731ca414ea2a50f33afc749003f4688257937 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f1c811a524bcda24e5d7de2ec5039115f64eb5af |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/21d6ae35d6089da438c97b666438aca695de100a |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/174be87c4ddfbf70fac51a3539c0cbc5563dd912 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/31c3502aca3b354b734af8e78caf20536e07c46a |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/43ff9c3756a267b8dc2648d99f627a43ec6d0086 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/283d12a04835d4b4f2c97a2ad6df88a22ebd62e4 |     
    i686     | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/20f91c225cdda31b8e8b29f7cc6e2d8c680ab6e7 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e8b7f6632985019fd5dead97a73a16b0777128d7 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/092dee22b7c193014e851b7d665f7798381fd4ab |     
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4318ea27d22d2881f89599e586841d23737105f7 | ORPH
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fcf4330de4523ada46c18ba281ce4dbb83b98f23 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0e105c5f8ca8f86e3977ff9efe86d3a2739ab962 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/81e8fd143cd5f4291257f7d1cc8f5c83ad3d86ed |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a4eb2eacfccd9159ed2f277bbc23c2c4e7d9c8dc |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/aff5913d189a53bdef09a6ffe58c5311d5b9edfe |     
 powerpc64   |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/3491f02e375f8b8cca330fa174c5b45ad2fe2f43 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1e47edcc0fe8d025418d1c13ccc93737bc4d0fe5 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/77a5ff7605243b4da7fef398669605feb35c8720 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e86626307abfb4bb0e997a78379b78cc80854368 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bat-0.19.0 | 1 
                openobex-1.7.2 | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/d7914e29948d782f003674b2d3bf8cdd764c34f3 |     
  mips64el   |         openobex-1.7.2         | NOK | http://autobuild.buildroot.net/results/b2bec428fd588e1eed4a68503537d2f708fa9c02 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/664f3f4191d739a8f17e8f06200dc5c3e14c353f |     


Gitlab CI results for 2022-06-02
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
