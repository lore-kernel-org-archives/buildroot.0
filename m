Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590CDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 05:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC23460B58;
	Sun, 12 Jun 2022 05:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4Y6yyYFPZiH; Sun, 12 Jun 2022 05:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FE6760B11;
	Sun, 12 Jun 2022 05:34:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A36DA1BF4E3
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 05:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86B7584090
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 05:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65nTyxQCJxOA for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 05:34:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BEFF8408A
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 05:34:46 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0B11440009
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 05:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1655012084; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cQBgscYjO+CeOk3FitkNExZg4oJnOM3KxmyIzXGo7y4=;
 b=YDblsI5PWitnVKiH0/ER559dNTQFD7WLeEsRw6PmW63hapF1srsjsLpU0mD+MESiNnrgz8
 14dOm74LcSxBGcHSEMxLBL9H3T5VuTqN9b+08fQIjSqM02tPdf2cL/W+LWhyPiwx6LnfOB
 zbkSvy4Q91jiuvFkVIaV570/8EymlFQeslTbRFYUvKivQy91hJnnrc2cFcr2txF9RymR7s
 mJpJ9RvLjgB+wwOOWr9/p7syvEeVcUDDBdvoFFZy3/9j89nWZ6bJphABS6u1e22tCrCA9X
 FgPqF5taF0FodQvW00NEexrDw2OLT+VJUNTKkrg88f8o7r1bu2fKoHTHzYoOWA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 05:34:43 -0000
Message-Id: <20220612053450.86B7584090@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-11
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

Autobuild statistics for 2022-06-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 12  |  4  |  0  | 16  |
  2022.05.x  | 32  | 20  |  0  | 52  |
    master   | 236 | 268 |  0  | 504 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.41 | 16
                host-go-1.18.3 | 13
             libopenssl-1.1.1o | 12
                 linux-5.17.13 | 11
           libfreeimage-3.18.0 | 9 
               protobuf-3.20.1 | 9 
              swupdate-2022.05 | 8 
                 zlib-ng-2.0.6 | 8 
host-pahole-73383b3a39afe86... | 6 
              host-rust-1.60.0 | 6 
                libressl-3.5.3 | 6 
                       unknown | 6 
                busybox-1.35.0 | 5 
              jpeg-turbo-2.1.3 | 5 
                   perl-5.34.1 | 5 
                     refpolicy | 5 
                bitcoin-0.21.2 | 4 
dahdi-linux-5c840cf43838e06... | 4 
                 dash-0.5.11.5 | 4 
                elfutils-0.186 | 3 
         host-gcc-final-11.3.0 | 3 
                 libp11-0.4.11 | 3 
    toolchain-external-bootlin | 3 
                   uacme-1.7.1 | 3 
fs/ubi/ubi.mk:51: /nvmedata... | 2 
             fxload-2008_10_13 | 2 
glibc-2.35-96-g2c4fc8e5ca74... | 2 
  gobject-introspection-1.70.0 | 2 
gummiboot-2bcd919c681c952eb... | 2 
               libglib2-2.70.4 | 2 
           libwebsockets-4.3.1 | 2 
       linux-5.10.109-cip5-rt4 | 2 
           linux-5.10.115-cip7 | 2 
                 pixman-0.40.0 | 2 
                   tor-0.4.7.7 | 2 
               valgrind-3.19.0 | 2 
                 wavemon-0.9.4 | 2 
                       xenomai | 2 
                xenomai-custom | 2 
                    zstd-1.5.2 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                  acpid-2.0.33 | 1 
              alsa-lib-1.2.6.1 | 1 
            altera-stapl-0.3.3 | 1 
               apcupsd-3.14.14 | 1 
                    bat-0.19.0 | 1 
               belle-sip-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
                    bird-2.0.8 | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
                 dfu-util-0.11 | 1 
                 dmalloc-5.6.5 | 1 
docker-proxy-339b972b464ee3... | 1 
            ecryptfs-utils-111 | 1 
                  exempi-2.6.1 | 1 
                     file-5.41 | 1 
                     frr-8.2.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/romfs/romfs.mk:32: /nvme... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                  gauche-0.9.9 | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.10 | 1 
         host-gcc-final-10.3.0 | 1 
host-google-breakpad-c85eb4... | 1 
            igh-ethercat-1.5.2 | 1 
               ipmitool-1.8.18 | 1 
                  jack2-1.9.20 | 1 
                   json-c-0.16 | 1 
     kvm-unit-tests-2022-03-08 | 1 
      libabseil-cpp-20211102.0 | 1 
                libaio-0.3.113 | 1 
                  libbpf-0.8.0 | 1 
               libcap-ng-0.8.3 | 1 
                  libftdi1-1.5 | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.3.2 | 1 
             libgpg-error-1.42 | 1 
          libmicrohttpd-0.9.75 | 1 
                   libnl-3.5.0 | 1 
               libsigrok-0.5.2 | 1 
             libstrophe-0.12.0 | 1 
               libtalloc-2.3.3 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
           libvncserver-0.9.13 | 1 
               libvorbis-1.3.7 | 1 
               linux-pam-1.5.2 | 1 
          lttng-modules-2.13.1 | 1 
                     mtd-2.1.3 | 1 
                    musl-1.2.3 | 1 
              netopeer2-2.1.16 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20120127 | 1 
               openblas-0.3.20 | 1 
               openpgm-5-3-128 | 1 
           powerpc-utils-1.3.8 | 1 
                    pppd-2.4.9 | 1 
    python-cryptography-37.0.2 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
rtl8189fs-94a61cbf46ce87b7c... | 1 
       shadowsocks-libev-3.3.5 | 1 
                   sord-0.16.8 | 1 
               tcf-agent-1.7.0 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-bootlin-... | 1 
                 wolftpm-2.3.1 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/fe25ca4e514c705c9427c530cf742a39b1235bd3 |     
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/c6df243e484cbca412bcf89638cb1d0efbb15b2c |     
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/331c7781d1ca7f73bf6cac7e1e89fd88bf2ab895 |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/b5fe3cf212011d9e6b58442ffba0cb5923aec3d0 | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/ef6e7d08350760fb5311837c500b3038f625060e |     
    m68k     |       altera-stapl-0.3.3       | NOK | http://autobuild.buildroot.net/results/688dbc038c5c79bb388633ae471fdf5a2726f011 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fb5d9d3d5a4cba2c9e7de3c12f1462e4bb320986 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/9db3de9c3913e2000148bbf78991893d6295a55d |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/6ad45a959850cadcedca51d2c13858ee42114516 |     
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e310b3cb5c47cb46a492c29a68e28efcc267a04a | ORPH
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/969689c79ec394c1d46fb7c7126b29dae391800e |     
    or1k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/22739a6ed2e137faba6b2e68991038fe70eadaa1 |     
 microblaze  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/e444e4e59d2ceabbfe2e3207d408ef0d187af0e8 |     
   x86_64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/2b262d63f259afd0a84d1920ca0168966d606dc0 |     
    i686     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/5f000104dd5f2ae957983eaaf81823a0fdbe4c5f |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/40043dffe86a25c6431b95889ff1817ad1d187b7 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/3ec57fa2887f437320dac6b1efd8f7c85bf9c1e2 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/d97e39d5372eec17c327a530fd07031e69c3ef50 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/357757f3b317c6526844b2d796e4778b34dbdf3e | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/9cec5bb3c9d653fecb7a03e736ccb30bacdfc063 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/2e235940dda053a47b379537ad1e4203085a688f | ORPH
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/98e8344e30c1198bac40c813fdafe0950153b772 |     
   xtensa    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/66c6323d923a40ceffe825c98e19f863e47a1b3c |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f836b2d0baaec785ef41946918a0c9049b4012d4 |     
   mipsel    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/cb8770b624f912fb79e812cb9d086e3ed45110ee |     
    sh4      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ff142374d8817c0d64df19a83d6d931214e5fec9 |     
  powerpc    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/411882008ca48477375167a845401785e26b3fb5 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/501ed54c667c85198787414d18b52984a9e3bcd9 | ORPH
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/881147b4a03256864c89a13607055e831593d647 | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cc4b67918945287915fbf685fb09869fe81dc1e1 | ORPH
    m68k     |         dfu-util-0.11          | NOK | http://autobuild.buildroot.net/results/ed98a19551d50f4b790c866f62d0f3676c282bd8 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/df201a3c56a37fc494626116917156c65b0d937d | ORPH
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/62a4bfc3684cd4d30cff7557c1aed0596ec3ae04 |     
   x86_64    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/abff218d941faadc7eeba64107628f1fad7303e9 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5606e39335eb640abbc5252705638be7d7cbfe6e | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/317b6caa9a10b0f45105ecf53310079be2334b19 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5f8d9226ac5d70a3c06dc9324d4c6be99af65b44 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/ed7cb7608907e4a92409159dd7978b76a453695d |     
   armeb     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/edf1fa21d68d613ec4e269c443ab385c3be76154 | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/0a53373eae88b528e0c18e92619c384f8d3aa9b5 |     
   nios2     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/272295c2ae729b90617668a1a3bcdc4d3ed71731 |     
    mips     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/385f6d155dfaf3cef2d0ac27c4a7104332e0a7e7 |     
  powerpc    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/f5b6343369f6afcb413fb02078ad83631bca0a39 |     
   arceb     | fs/romfs/romfs.mk:32: /nvme... | NOK | http://autobuild.buildroot.net/results/5b8be71b1fa27462fdf2eed6198412d8e235281d |     
    i686     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/f10ee0137131c461b7d1cf6f01801b824c7d02a9 |     
   xtensa    | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/69c28f0d1099036dcbdb36b5ebddbba49c3f7506 |     
 powerpc64   | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/ae0fdfc32df3084a1b48161f5c6170127ce68ca4 |     
    sh4      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/67fdc4d6eb85f8b2964565f1616c3a662c8fe905 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1685d5c2705ffc2f0b1bcb6e1362ac2f78f96401 |     
    i686     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/f73c396346c2850359b097baaba0d93194e4ea82 |     
   mipsel    |       fxload-2008_10_13        | NOK | http://autobuild.buildroot.net/results/fe3ec0fe78fc0fc7818c9e8ff20cf9caa190ab57 |     
    sh4      |       fxload-2008_10_13        | NOK | http://autobuild.buildroot.net/results/bca28d7a6d2b324fb61fe99b8af4b86caa2350ee |     
   armeb     |          gauche-0.9.9          | NOK | http://autobuild.buildroot.net/results/114ae681a59a4edf2ccd5c37eff778110ecc57d9 |     
    mips     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/a2375e9c8b8ed0e93d9ed3cafda97e03a582acff |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/6260e1823c760c092240c6f460d7463b0102ebf9 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/34a107ac206a720c0543e73d8f52c43cb0b5836b | ORPH
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/93a73bc34ddaa69b4fdad510b4a6ad0cb616d908 |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/07b216657e741466d5f2004d9652b9062a244081 | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/2b7dd37becddaa8966ee97f6bae18addec549063 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/52336d56a6e1dbd89c773f32560a8a743742d24e |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/a8a4b0bb9df6adf641a973a44c4258a47c6a9910 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/18bcc157de708e7f74018cdc96db7cc95e2944af |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2420fcb6a74b61643d7999c389da9b3d5b1c28ca |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ac122f81a0a61a3284df169a8f231fe63eb30fa7 |     
    i586     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f4f977f6cdcc064771c6ceb1cfae06d304ee5280 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/d1fb161e0c10ba5da08840382d274b1a6f3ff58f |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/7dfbe8b48d7f4a2902921c2392dbc9d7736e0f83 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/ca4f680596876e3eef6b9be8fb7a3a18a5a77917 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/5f507885f583214652289bfd18d9f63317626a1e |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/8a93b895d402e3d95bf7e9f7dfcf2462206ada70 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/aa0c4572f66574b035a0b6baba7dc431076ded09 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6211c9a8b7734ab3e3d0b7a9bb4965ee20dca90f |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/052b27812fbeaee3b9cdd89661cb4bf35f3fe18a |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/7322be790f28be37758f6700f9831080db596321 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/171793fad75bc029f7b5b5c64f1036c0972f93f2 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/e488ca23c7ba2e4a8a9e09fa7a41e5a452c9e75a |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/8c27270a34740939d8222a20e9c9e9fbc7b5d15f |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6dbb88e5aed56ded3b0c9a1c85be613157e0f8fd |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/32de60d68e994f8f17bd8b568f44ab78287c34ce |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1c1fbd6994da1a099acb682dc7a4105830ca6563 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/509db2ba1ed35676d984bea53574999f32b7e140 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/71d63e45d4fbec176fc84043615336f8fc511d5b |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b131fff83c302472bc73bce45fd3cb07e30df09d |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d0a22e5f789c857e98de085f6675b5ea90d098e9 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/47bf8c6e7e2baa9818c32365ec58a8d43658927e |     
 powerpc64   |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/2836391b8170f4dc7bcf97c21f9b5bd74bdadd35 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/38299d388dd07f7127813159cc4d86ea860925de |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/848987fe588c20dd76910aa2fb7445cf2235c0fb |     
    arm      |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/cf563b2b32c7d7c85c969d05cb7a6b89604535a9 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/429b9b1a813322d97c9bccd2a062a4ee3bdeedc4 |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/37ed8506f20fc5141764a4e6c2b2784cde8c618c |     
   xtensa    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/6753ad83ca23de623e92be70875dd269f659a0eb |     
    or1k     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/78aff02e4d85342439524a9b2902de534a64aed0 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/3054023a212aee1707f7b1001e70b3ca60aaf500 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/d2ced22439d820dcb4f74cc60ed2bc0adb3f61e2 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/6591d808b3d2e2f1b5911b778d428d62d12e1961 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/035909447f85936ec1d5dc6771e0949e127c70fe |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/6eca2eaa4b6fd428da8ff8975691fd6d9100efb6 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/7a6c0707dbee41110e03b2b9cbd6521754b37f55 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/08967498c4a7d6c24ad67d5e5ac76e908de0e1f4 |     
   armeb     |   kvm-unit-tests-2022-03-08    | NOK | http://autobuild.buildroot.net/results/e07310927a12dd1ec4fda5f87c97d5469c279ab6 |     
    mips     |    libabseil-cpp-20211102.0    | NOK | http://autobuild.buildroot.net/results/3fa027e602bacb22316fb5d9b233baa0b0f0e845 |     
    i586     |         libaio-0.3.113         | NOK | http://autobuild.buildroot.net/results/8dcce6455c2af34380752ed3aa2a6bc30e56213b | ORPH
   s390x     |          libbpf-0.8.0          | NOK | http://autobuild.buildroot.net/results/2ce278231a9e7b9a0ca275970a9284c1994ac74f |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/390464590d08357c2c0ff8d2cb2c7ae102f33a10 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2095db860d817150d6e37eb1765eae35dbbf99f5 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d591d04937bc328dbd92c5ac982a61e68df26509 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5962fcef67aec3e7f306053855f9ae12a9781cfd |     
    i586     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/41c3427e8432adbf26125ddae731a594472dd1f5 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ab3367f2b0f81555bce685f15dca758aeeb589a5 |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a1e1f939b9a1f41c8c892273db6cec0ba219fc3a |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7e4221d7c777ecee36282587bfd400c877db483e |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3c764b813f0859f609778ad574ee1f450a5e71e3 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/94fe0f32a134e3ffe79c73e819c94cc5d8bacfb9 |     
   arceb     |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/cf88905289b3c44287217c9eea29c6c050b11904 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/394cae529cd1a938ac8676bf85fc31ff2a4eedc0 | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/709b0d36de2c8f4f18b8c0deeda5c4ef0ab96601 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/6c21baa7a5415b2587070f346c294b632103ca45 |     
   mipsel    |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/205aa30bb32a93a7804c2c8b86f12715c55d6ad7 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/c236ad055ca094feb75a9ac0f5b466965f3f4cca | ORPH
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/f4332f03e82e75422a1ffcbb1fb42e993d80253d |     
   mips64    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/66b9e91f9302a403f261d1abd67a8c30a5cc01cc | ORPH
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5b966681551f001ff67a2d58195302d47516bd11 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4bf92f279075c69fadafea5bb5461491ee50a114 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5f43db7ed855f89459920a16590ba1434adaa972 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b4feced68a0796c55853bd97d2ab69700f719b1b |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7645baec94785d3e18727a0073b9b382615f17f8 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/9d7cc9e04204b4b29cff430e2d66506837cc198c |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/67d0732fba3ba3d517de73ccc8cb58213e095a77 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b4a4990f3ae0099d5f31814ec837ea8784a0d6c2 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b5d552329b7ea3210a802ad5f1d3ddf760aa66e6 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6321373e33dd143a46ca3abd4a91e70acdac4141 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ed45acd5b96c207c5e3fafbe7fb0c9ea814a479b |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/9a4d78915f11543b872d3ca190be60963e23bd8d |     
    i586     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/1844610944c7796d4a9ca7efc86d48258ce154dd | ORPH
   nios2     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/e30cd782301c2a74baff3765473678cb500573ff | ORPH
 powerpc64   |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/fd6a91ced10a281177e2596dc3f4c87e5b9f881d | ORPH
  mips64el   |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/4f91c372928dc26cba34ccfcefe5d03a8c9a5d5e | ORPH
    mips     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/bdd8a39e4408786d10803c0275fef7168a2d68a0 | ORPH
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/a2d64a494d63cf7d67c71921d2a69f2ae85aff96 | ORPH
   sparc     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/25f4c252e5ceaeb5aa27f6da8069bfef010b96cf | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/4e73b454472f9ce4034cda5646f561009e9526f9 | ORPH
    or1k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/997472b2b8367d372667d47293eb798ca612c1e3 | ORPH
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/b287c467fdb1e08cecc9dc2674f8702fabe7ec8d |     
   sparc     |       libstrophe-0.12.0        | NOK | http://autobuild.buildroot.net/results/5881246c4e9f7560181d2e60185d3bb5cf4f5a5f |     
    i686     |        libtalloc-2.3.3         | NOK | http://autobuild.buildroot.net/results/3d354c4b0b19a0366a0c2f94789422ad1df35550 |     
 aarch64_be  |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/b754eff1896a8f0a2067c92d4f684157215fc835 |     
    or1k     |      libvncserver-0.9.13       | NOK | http://autobuild.buildroot.net/results/998b5021a66edacd74464c5a2b976a58318b0385 | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/951c01a125ddddac7a546c3c6d1aaa347ca0c8ac |     
   mips64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/0e07204aff7176a69c7cc41a0f9c76d72a8f2d70 |     
   sparc     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/f63c065de9f5b005d11d1e8940379e0521c86be8 |     
  mips64el   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/a7e302a3c80cd1a4695c2684339095f471f3a1a9 | ORPH
   mips64    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/b9e1433d0218f42fbf08625b7510abe79bd77b5b | ORPH
  mips64el   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/296a44940239f26b96bf6125a718070dbc561dfd | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/aa912a13c12468e7047cf151eb4f9f5154f25c9a | ORPH
powerpc64le  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/f93681b49e7bb68bb0e0e8e9f031ee27a95a9afd | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/f7f9e366b9d546df9285990713b0b06297ae8df8 | ORPH
    arc      |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/565550a12e71ec75c8ab7a004a9084c08c17aa2d | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/75405e566afc7bbe2818709a37a8b21ab9e8ebfd | ORPH
 aarch64_be  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/592b56c8e29841599dc5a6fb89bad51a907440f7 | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/d7e28035887280e5e13c27488ffaf71bc943eabe | ORPH
 microblaze  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/057d800f8da644e10cb668e4815001c410fdec0f | ORPH
   xtensa    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5264ed3a6c326f6de288110bddf2114860fb1620 | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b25ded79d5eba92ffaa8c3d3869e2dc2a7d556b5 | ORPH
    sh4a     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/59c6df7947588df980ae54aa89b73f9fe0dcabda | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b44e979883363e6f47c1f14670f385406c6c4668 | ORPH
    arm      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/3836ab84afbc9120736310bdac71412403a617a2 | ORPH
 aarch64_be  |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/5e0e71ad99db478a47f4925d7dd12a4c0f03d20f |     
  mips64el   |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/507fb62834652cdb50b5fada2a0b858594eb5f23 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/a9d0b4f2d8082dfe51c83548d72cd227f57bba04 |     
 microblaze  |        netopeer2-2.1.16        | NOK | http://autobuild.buildroot.net/results/7f9a114a477e859dfbc62a53ab66c58eddb2318b |     
   mips64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/0766d695e669d6104466f1dc08514b307333f864 |     
   sparc     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/a8af7e2da389f3a00db8754782e1d9dc40edc24f | ORPH
   mips64    |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/a921732bb6ed21d1ae55aabd78fa93603cfce9df | ORPH
 powerpc64   |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/6795e7749e14c7698a162971fa048feaa7929d1d |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a0f21b188160145420c6538ffec6aeee9bba06e9 |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b699fee946598107208a8e52d22e838673a113f0 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/56a4c7b6cda7b5e9c71de2e26ca188eca1c0998d |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/30e6db0d5f790843dbc8041e1c09c1d726d80b90 |     
    sh4      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e2afd409b1fc776b0c0194427b50b0b6c6418b15 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/33d795e7fa680e5f5abf2d11b2d9b32f35f8690c |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c96faed557aaaf57ab1b0c8a6d5aa45714ea11a3 |     
powerpc64le  |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/2a964a9e64240585eac9765c5772796cb1fd66b9 | ORPH
   arceb     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/65480c82f0209a1cc5a5e9af62e9bdf6473a2427 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/836beb1bfe52cfc583e453f6e305e3692e721bdf |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d30bbbeb78445abf8b7a671483a7bb34bafaf840 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/67828220c0427739ee3573a8fa913d2c3bc54259 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/72ec0d424917c6f4a7112a911c47a00ef88fc142 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bbdef9f3d4eef5e1335ca3a801f261f099bdf4a7 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/61178ba0d7f69969e811992899bc3528d5a1ca1b |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/73d4dabdadfaa9771b3fe0ac99243226a36065ca |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/25dff274137ad6ea8493386fb482b85223c2b94c |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8528158a01cbadf49fd7f376958e9aaed050b0b4 |     
    mips     |   python-cryptography-37.0.2   | NOK | http://autobuild.buildroot.net/results/2dbb0d57c07f77bcfb5697cc3b1ccf66f5be7363 |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/8c9cc6d62025ac5148c58ab7670c46817ee1e080 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/c467662ee13f7c591cac84e2dfabd837f6e544b4 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/0ad9dd0f21a0bfb16cc1f79d97a12c8ca0ebeb76 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/2e9eb2f61176f55b82839701bfafebd5286f1099 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/53398a02cab75f00e0a53dd942f75044c930dd26 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/5646d9ec34e037111d96b3e1d90e3909e0860b44 |     
   nios2     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/cf38d903dbfeff0d777fd09dae5ace213eec288f |     
   s390x     | rtl8189fs-94a61cbf46ce87b7c... | NOK | http://autobuild.buildroot.net/results/3188aab2113096d36e6fcb9fd829e57a591ff578 |     
   mipsel    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/3e38884f7bef987804d7d1e0d7ecd657fa6acf57 |     
    i686     |          sord-0.16.8           | NOK | http://autobuild.buildroot.net/results/45e67a79e1af63b642057b0732999a5ff7010dfa |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/77613e16064d51983f5f8edc964fabb08bb6d7b3 |     
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/b234293866565993c253eba07c3c8a36475fd913 |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/40fb04d745ff06cd23c1c0fddef811dbd9be7d63 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/cf7af88014d4a2d15434e6e8df90bd1f7a40c061 |     
    arc      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/d9f9fbc2e597ff330bf714682e4e5c6f20f55e64 |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/4e294c0ca476895fb3bb83cd2fb621c3301389d4 |     
  aarch64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/c38ac32d40102ce128ccc0a2ac1f44d810aa8b4c |     
 aarch64_be  |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/d6fc23211f93f4a198f0f80b360301089189ca13 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/0b9dc3525e4e6af6af5a1f9316c9d1d0261764a0 |     
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/2ef196f1fb35e2482a39f88254d05b1dbe30bd8a |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/3eb625b3f2ef1611fd542b3cf48994e6808f40e6 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/daccd01a5ea18d04587faeb1ca7c4d61f13469ec |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/8adeb20d00d255d6d4ea693f1585a42b289ad490 |     
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f15b55d6b92b6f853078aedd2c430dfef0a530fb | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/85fa34dbc767a0ab15d879bb2c503106829ba328 | ORPH
   nios2     |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/786435a30820e2f2cdc6162804d360bed1776970 |     
 microblaze  |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/e23e630d372c62335d7b70f69585666c8ff24f5b |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/835b862be397aa4c14a0ed7438b1c8da44637bd6 |     
 microblaze  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/bb82b1436d9149272514c103cae5d9301352de8c |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/262ba5ca1d65a853a5ef9dccf602659e5e0b57f5 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a512caa3ee5552acd14f45fc615035a50767a8cc |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9d6614fe2c5098885255a74d87c2b19d9d8b0052 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ae92da011926b3358649dbc8a8ce211343d1636f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b1031e7d44fe3df0e4c50c538fdf5533e91c194d |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fe68619a7621ca50fc81729a1cfd419133198347 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/931dafce745f44f87074635d607d874ea535803b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/da44074616bb9c08e3194600ec0a6c23d78091b2 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/011849a82ad00abbea9ab618968a276ebbb9f83d |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b1963eeefce4eed414a37012e696ea41d3a0b7cb |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e6fcaf25b3a9360e7ecd11ed0c314ac214166966 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/17284a150f2d5023e2cf389741485f09fb63a444 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/39277a2a1971d98d231af767a8f44748de9cc889 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/5c9e37c51b5655c967edd0acea76eae65556b6e0 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6a799a2250f1ccebb4e8cc54b71fc411f6e24e1f |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7a99aafb0b522b56f6134bcbfaa2f2790eeaa9af |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d3d004bf5de8405c83975576d3d7bf038809a002 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7858ea6f65db6d0c23952c75a0549752203cb00b |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/98ffd5ffce3f3340489b0652cb8ac341f1ea35f0 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/a1ee4a3d52ba41544cba0fee9c4f7228ed9e1a07 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/917f4342c8b6439c8e95287204f05a15df1e9a2a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a6be740c06899e9a75b289d90b29af1c8788b242 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/95edec7ef2762e43207811e4da0726b9f9aaf3d8 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0205732e99298fe45b52ceec0fd12fbd8c867b73 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/901836c3b9d9246c7033e628c7fa641ead944fa5 | ORPH
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/88ba215d5eedc93f246922ec95ba624fd9ccf680 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d94a0c44e1b6d0d3f249c72dfc43f4d376ae13c1 |     
    arc      |         wolftpm-2.3.1          | NOK | http://autobuild.buildroot.net/results/77a93521b909e701ef4e86f18524258b9242c721 |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/3d73c7d62d1ce51a33f5f353b053b5fa7df2e2b7 |     
   armeb     |            xenomai             | NOK | http://autobuild.buildroot.net/results/dfb9d8a62f3c261b414b62a081c1ba8d7b7710e6 |     
   xtensa    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/35b9815bc2363c51707e68787e18a786475402f5 |     
   x86_64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/780a87654c67f1a163275e7fecd47502a40825a0 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/a503d59a764a2f77d21bca1e78326b8f656ea22b | ORPH
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/786d8f53a5fd95bb701f31e670b88e1a2f594f00 |     
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/55e83457b9b376262a1005e176282b7b2873600a |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2b3c2a9a986f1c1b86e2a1a785e162a341370ed5 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b29aadb960dc3123a725f9e85f763dea86a53c7a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7bdaa4100c43362a04e39ddebd68ed9c0a558ab2 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/04e992a4bba0c23a4cfed85ad8ce6a91ec54ec3e | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b7a8b5e28ac661bd14300c77b24892ffd8ac84e2 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d2fcc987e0485085c2cff68538b5b2bf51261476 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/db530b5912342da24f194c02ba31a66eac25ceea | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/597340733579ad1af4b07ddc9c99ab09289d45b4 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/940d1f402ef3a4ef26d214c33976adab4f98c01c |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/eb03fa43b1c4dbe7d5e1e677351ff55aeb57b316 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bat-0.19.0 | 1 
           libfreeimage-3.18.0 | 1 
                nodejs-14.18.3 | 1 
                sg3_utils-1.47 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/87ce77267b293aedde58a02c661e8b2d7f37eadc |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0a06c362c9c488d3eb478b10a408ec3f4dd4ca8f |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/eee6b5a5f28be4909a04b63d801424c0eb0630cc |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/3a6070d12e6857dc4b95217432dc02c5a5748283 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                 uclibc-1.0.41 | 3 
host-pahole-73383b3a39afe86... | 2 
           libfreeimage-3.18.0 | 2 
             libopenssl-1.1.1o | 2 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.2 | 1 
                host-go-1.18.3 | 1 
              jpeg-turbo-2.1.3 | 1 
               libglib2-2.70.4 | 1 
                  mender-3.1.0 | 1 
               protobuf-3.20.1 | 1 
            quickjs-2021-03-27 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                    ruby-3.1.2 | 1 
               valgrind-3.19.0 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/bde28e5d6d73fb17683fabec8cab1a2c81838a42 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/6dfa5e60156002e54f91e52786dcd5cfe27c9e80 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c7fdd6586d2d4f6a6f66c25284c2926f43243925 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7e5eb2c461195cc9c953b43562d6688f5ab9eab8 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/153bbb02b557abaa32eb53418dfda438a808586e |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/1b0f3194ac05fb68a3c9cdce8e8b5e308820b90d |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/505e29894162d299420458749d0ad01ea3e0b89e |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/eb0ec6b2f186d14fdb9f74ad4b9839ca4b0ad897 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/9818caa57c83c6ec66c14ca1a3c5f1fb0146c64d |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5210dccb7fa0338e751335795df65d03dfee1bff |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0aa1e7d6b7cebdd260276922e1781f2790fe33fb |     
  aarch64    |          mender-3.1.0          | NOK | http://autobuild.buildroot.net/results/1b42f5a13c2f5cc170989d62a65b19bf3c504a25 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/5ab6868560cdf393b05753ee40c8326805547427 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/a0b76b4086dc3a8d4f95f63245dc04f3cf3ec057 |     
    mips     | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/88ad67bb4a848b6d553a9d6c3a44ecf07df52337 |     
    or1k     |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/c1c3bf76eb7ed6618002e48b9e8355fc8a1d4263 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fd89657217c73cfd9c29698f5970f46056b75de1 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7fd3583cbb5ec9e380d9947c437c2cf5ebad984f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9d542e0163a77146877c25f43d4f89a16f7219f9 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/1cd99b0384ca1cbd850a92656a5fd2e35256fb4a | ORPH



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

