Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F29C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 05:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 436D24115F;
	Fri, 10 Jun 2022 05:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yX524I4snVv2; Fri, 10 Jun 2022 05:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B70240A93;
	Fri, 10 Jun 2022 05:38:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9CB1BF86C
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 05:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C0D081B25
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 05:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWtr43cAc8j8 for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 05:38:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA78F8184F
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 05:38:39 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5CB11FF803
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 05:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654839516; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nyaU/hrEM3DIRNcueV17FZ4U7+UXJPGKgxr6JVAWWPI=;
 b=lU29vROY/0lWEtB/VLNYtZJzbiCfEt0WsLlFMlNm9ukbO0uejeZy8sNyChv6KIsCwdErYA
 PZJhkg9oz53balJJNHs4cup4TFHW0hT1i/GLxm1ZmgnMrmUHtasqvdjntw53wJmahqqunf
 VFo11KzjKdMi+A1cbO6CPyBsnJ+bwIfHEU2tTaLn2vmjRvcV5vs+AgWsFBMj/k0JfLq8sD
 nIH7Jmnz0NaKo2t4Fp3diCWjCAk4V5+8Dw3sLkcS+o1FULoHHHwAAxyZcWkoYyi7pltWgN
 IVa/qPuUOs6XHoZ5gj4thRTAjRvGlEp0r3lG1hK/ZFOfmB/Qaklqmy0W152BCg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 05:38:36 -0000
Message-Id: <20220610053842.8C0D081B25@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-09
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

Autobuild statistics for 2022-06-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 12  |  0  |  0  | 12  |
  2022.05.x  | 15  | 21  |  0  | 36  |
    master   | 195 | 228 |  0  | 423 |

Classification of failures by reason for master
-----------------------------------------------

             libopenssl-1.1.1o | 13
host-pahole-73383b3a39afe86... | 11
                 zlib-ng-2.0.6 | 10
                     refpolicy | 8 
                 uclibc-1.0.41 | 8 
               protobuf-3.20.1 | 7 
glibc-2.35-96-g2c4fc8e5ca74... | 6 
                 linux-5.17.13 | 6 
                host-go-1.18.3 | 5 
           libfreeimage-3.18.0 | 5 
       linux-5.10.109-cip5-rt4 | 5 
                   uacme-1.7.1 | 5 
                       unknown | 5 
                libressl-3.5.3 | 4 
                bitcoin-0.21.2 | 3 
                 dash-0.5.11.5 | 3 
                  exempi-2.6.1 | 3 
  gobject-introspection-1.70.0 | 3 
         host-gcc-final-10.3.0 | 3 
            igh-ethercat-1.5.2 | 3 
                 pixman-0.40.0 | 3 
              swupdate-2022.05 | 3 
               apcupsd-3.14.14 | 2 
                    brltty-6.4 | 2 
                busybox-1.35.0 | 2 
docker-proxy-339b972b464ee3... | 2 
                 fdk-aac-2.0.2 | 2 
                  ffmpeg-4.4.2 | 2 
host-google-breakpad-c85eb4... | 2 
              host-rust-1.60.0 | 2 
                 host-wine-6.0 | 2 
              jpeg-turbo-2.1.3 | 2 
              libgcrypt-1.10.1 | 2 
                 libp11-0.4.11 | 2 
               lpc32xxcdl-2.11 | 2 
luajit-f2b37f51f69ba7e9f8de... | 2 
                   perl-5.34.1 | 2 
                sg3_utils-1.47 | 2 
       shadowsocks-libev-3.3.5 | 2 
              strongswan-5.9.5 | 2 
                  vlc-3.0.17.4 | 2 
/home/buildroot/autobuild/i... | 1 
             18xx-ti-utils-8.8 | 1 
               acpica-20200717 | 1 
                arp-scan-1.9.7 | 1 
                   atftp-0.7.5 | 1 
                     aufs-util | 1 
             berkeleydb-5.3.28 | 1 
                    bird-2.0.8 | 1 
                  bitwise-0.43 | 1 
                  boost-1.79.0 | 1 
                  botan-2.19.1 | 1 
                  cairo-1.16.0 | 1 
              containerd-1.6.2 | 1 
                 coremark-1.01 | 1 
dahdi-linux-5c840cf43838e06... | 1 
           docker-cli-20.10.14 | 1 
            ecryptfs-utils-111 | 1 
                elfutils-0.186 | 1 
               erofs-utils-1.4 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                      gdb-10.2 | 1 
               gocryptfs-2.2.1 | 1 
                   gstd-0.14.0 | 1 
              host-delve-1.8.0 | 1 
          host-elf2flt-2021.08 | 1 
         host-gcc-final-11.3.0 | 1 
                  janet-1.22.0 | 1 
     kvm-unit-tests-2022-03-08 | 1 
               libdcadec-0.2.0 | 1 
               libglib2-2.70.4 | 1 
             libgpg-error-1.42 | 1 
             libmediaart-1.9.5 | 1 
               libtheora-1.1.1 | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
           libwebsockets-4.3.1 | 1 
                libzlib-1.2.12 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
            luaossl-20200709-0 | 1 
               luasyslog-2.2.1 | 1 
          moby-buildkit-0.10.0 | 1 
         multipath-tools-0.8.9 | 1 
                  mxs-bootlets | 1 
                   ncurses-6.1 | 1 
                net-tools-2.10 | 1 
                  nginx-1.20.1 | 1 
                nodejs-16.15.0 | 1 
                  octave-7.1.0 | 1 
              openjdk-17.0.2+8 | 1 
               poppler-21.12.0 | 1 
                    pppd-2.4.9 | 1 
                proftpd-1.3.6e | 1 
                     pv-1.6.20 | 1 
rtl8812au-aircrack-ng-37e27... | 1 
                    ruby-3.1.2 | 1 
              syslog-ng-3.35.1 | 1 
                   tor-0.4.7.7 | 1 
uclibc-ng-test-0844445e7358... | 1 
                 wavemon-0.9.4 | 1 
                       xenomai | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-5.4.9 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/c5d880787c2543b037beadc3c4ae2bed4e70b99b |     
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/17d90050b7551aadeb1bdb0f174695dc0af1d2e3 |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/cac0af72d88cc0096c58fe678d9fe4fe139ab544 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5175df415fa88381af8362ff1551e5fa468f152d |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2a249ee42f17f6fdb06ac6d7145958c15f3be4d7 |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/9b79e551910a20235dd3cfd0222127c8ccbea48e |     
    m68k     |          atftp-0.7.5           | NOK | http://autobuild.buildroot.net/results/c212be0ddeeb1cfcdd4aeef03e1895ff11e3e904 | ORPH
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/8c6522e91f52cd04380b62e8c653e64eefbc21e0 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/72d306b6e6f8b3e631c5889a35e9aa28c5f8a159 | ORPH
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/9f97b0fe6e1743d6039ed3fd540beaced4ecf57b |     
   s390x     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/b7b087ffbd1a6870fd72f58a92ae3c128eb4af90 |     
    mips     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/ebd914e87a5d9a2952a848bc168e2ec2fab3983e |     
    mips     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/efe8376b67cfbec664c7d8a8354908dff62c955b |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/028c01ed4d29569534f15019cff2b8525d9c66ee |     
   arceb     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/1c149a2e41f898a5545ef0ba1cb7cf3138bd29c6 |     
   sh4aeb    |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/c500e7e932dfc23170bcb98a7924e2d664bf1dd2 | ORPH
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/a763696693e4bc060dee980db112a842eaf41535 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/24a47fac956f018264ee239409743fc4ac9f6834 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/29a1a5a1786d4e912434e141e9943d041182e809 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/aa132a227fd7631bac043cede9f756453daf30aa | ORPH
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/2c52f3c8c354fc4b0ce78394cafe233f9b341613 |     
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/3b190295f369673706e20790bc4852fabf9ff8f2 |     
   sh4eb     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/a0a66bf9208a51641f96f9568e0737491c7ff491 |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3e0532074bb394e56376e4ff308f86891e80b8f9 |     
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e5ee3aee6a9393d0857c7cc47310d606d8d71d66 | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f351cfad2374daa80d7322de4694191353b566ab | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/94553bee0e25b8fa0edf6bd1d126d4c94501d6ed | ORPH
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/324464745521a5893eaee28fb965b3115f352866 |     
  aarch64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/55cc2a6b5446494fa40a142f4aa58fe4233c7ec8 |     
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/2340de947d8c8aa4d13cee62587909c7c6632fc2 |     
    mips     |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/ea16957e8f048b713f5d2713aa5f0c157b62f574 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cc3c1eaf28303595239770c51fc1720b57b5a639 | ORPH
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/2daa0f7a7418f7491b8b4c5495904abb86efa809 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/b93c654ff9fe31bde69932bc5529373d36b0ed49 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/bb107ab627d47c78008a28f81a561aa0909d6360 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8c11dab739ad19b9e5156ef685baf4c221083568 |     
    arm      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/2a0661127f8ca96a0b0a30359f6935ac76fa369b |     
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/47b7302aabeaea41e9248b468338cf6c78a8431a |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/90e038600b7d8c9f402816931869a818a3cf63ae |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/0f6677f5e62323c43b24f5708fc08f2f3f3d64c6 |     
 powerpc64   | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/da9e19c594e65d8a11c17b0eaa036e5e670a68ae |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/49a4394919069a65fef6f8ebdb531d4868d68dfa |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ca3b07e2e8b2f70d54bef52b85ce259cf0745876 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/c86cb98d07ac04e9685a188c63c7e82304484646 |     
   mips64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/f9faa633d4e8cef2e3343cbb56591bb1e137d192 | ORPH
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/2e616edb83bb9ba91e69633017ac57c132408fb7 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/9dab0e0e518b0a0c271390689759316c1c80e62a |     
    mips     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/291830c41e422cc886f6d24ea590b2dbaf57859b |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/9dfa8cf453a5fe418127b0ed533da50c68dfba5a |     
    sh4a     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/8ccad58fdc767fc0db38bcc69757b3bed61db224 |     
    sh4a     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b48c0124f12ba76d56f8dd62138eca646fcf68ed |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/06a78aa08b662299a6b1561fa83cacf6558a44ae | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/89d3364b9b5f4f9cf6bdc7d42bcdc8e703fb11dc | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/f9cd99faa88e09fc1c73625f4df649206f12db80 | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/e88e06ea1ba1692d684864f121dec7c9356afbf1 |     
    m68k     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/38065556f1f06838c50124a480cc121c89121b2b | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/7161cdfa32d88d9f9b35cdfc1276f87104fc34f7 |     
   armeb     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/65257432c019cb859f8c012e22346b1b93c28939 | ORPH
microblazeel |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/065df62c42dc2ada5c2128daf65c0dd895a08e51 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b5b1096bc9677607acb3cdb90a539f5fb88603d3 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/57fd447bebf979632bd2e6fc44dc98ea61730688 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1de3f91798ad48d54ea8335cf6f6c97205befbb3 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/2ef9301fb10dbd19d01d8d2a712f0aa015b917be |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/676c715e003056e743c531d1895cffbfdf4c4fca |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/bbfadf83e82d5a1f0a3b8fbf830f1dba963e1e3a |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6800c55cccf0337537f7a2473e56bde5438441d8 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c971b9c01843386d496bc05deb81cfcc11cfbb0a |     
    mips     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/6721e694afc0ad2b1bb31469b63626f55764d97b |     
    i686     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/6babc579566a2adc4eb97a0a27834ab1071ddd81 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1376c1a0ec020c55302f61af5f33f946c5a89d64 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7b3f560a773791e00b8bb32f64c0d39749b809b1 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/289eb5d43371f778e8c1cb4b9ab26724e2ac9b06 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fde62270da0731f7ee907100164cc059f4d50f0e |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/819cb2c2f9c9241b9488bf054ee8b0741ba42592 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a5b6ee27ce4fdabd84eef47228bd34ed5710dee9 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/dd5b7d9bd8dc8d8c70f6afd53b5f7a02e585493d |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ea0c951dea8488ac726523ac201d898546c5451a |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/30aed8868f5714fdb6b4e45502c5d317d757e66e |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ee1247c70c07f7089710ca88fa684abeb1bcf693 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/36ccceb075562bd93bb35b3882a52b24418c20ee |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/24e6f3e7f216ecf14d42ab9f1a6b0be1b4c856e0 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/8d091eb3a2927a4731ee76f72feddd1bc6f74068 |     
    i686     |         host-wine-6.0          | NOK | http://autobuild.buildroot.net/results/bbc22f95f229c98212e402bb7d8c7c5a382d4ef8 |     
    i686     |         host-wine-6.0          | NOK | http://autobuild.buildroot.net/results/b5acd3631e681aaded7b7aa78e7ae1ccbca2d3ea |     
    mips     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/6948deb6b89c64eeacdfa4b128dbf0fdb82d28c1 |     
   armeb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/0f8f7dbf5b52ce32e46e05c3bcd554db7bd5ad21 |     
   armeb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/9a7e1df317a0c9dada6744475533209832132741 |     
 microblaze  |          janet-1.22.0          | NOK | http://autobuild.buildroot.net/results/76558776acc68b83b02a0e533b8fc3b2016a3d48 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/55dd6631ae3cbb1aa6800b88f8c6c82125b6f6e9 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/8ba67842ff3de0be182311d60050210a0fb78f55 |     
   armeb     |   kvm-unit-tests-2022-03-08    | NOK | http://autobuild.buildroot.net/results/1da135e588ad4f2eb3879eba8367720d00b52067 |     
   armeb     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/4fd1fa97d1ded03868d445fb4a599082be17e3e5 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0960033ea3e7f28ec22bd31e8cd388ae5de028a3 |     
    mips     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7644e85da91818e5bb9e578e2ac040f079a5313f |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8f3b7627230eb9981a47491472a680e509a6113d |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6d660fcb02fde6823ba9d17eaa7555959cd09d03 |     
    mips     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/f6523631fcdfafeb9f4116d42ff8dc6ead891751 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c8fb963ec633931331dbc9d14d76768679670da1 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6c8b52916e77d51fc403acd440b12532b24300d4 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/5c44bea5f9b6e08a3063b54a3a32932d70312aaf |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/eb8ec351964111af3dc262fb6b11f1fb95bef61a | ORPH
   sparc     |       libmediaart-1.9.5        | NOK | http://autobuild.buildroot.net/results/39aa4ecd37de774e06f67a6e1c4495dc1f0917b4 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/033687da6d6ab75760370d64ef90c9f5d7b2baa7 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4471a586724a354abbdad6886967271c1d307b68 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7c09753748e8ddfe6ba93bddaf97c1e27c47fbe3 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/543515e40fcd2cc02a8d3054a10e47f71cad5c29 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/209a2c7db11cfb48a5366ce4563b130f4c7cf539 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0c3e6adc40d3caff5f8a5487b6d5de5a855a7da2 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/fb93e81ee1cc08a4f24e95bd6bc89888d05b64ee |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b86d403aa32d68289b43ec38bf4f09c5a5a31f3d |     
  aarch64    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/3c703b496ef51a6a3ad4046ef3a1985ee939cdd9 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/2a4374046016b10e6f146102bf9a92cb8301f10f |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/769d71c229ef746170a9d8de9cf68e0c95cb6ad9 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5d8a1e6c991055f9a3a3f052c0dd8d4e533fcbb7 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/63deb0f2327b98ef717db6e082682293d1213eb5 |     
microblazeel |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/98601595024d94c5db9998b41773f9c5a5d962c5 | ORPH
   s390x     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/d768868b14a06526d89ad1ae84e9e8d5a169c70a | ORPH
   xtensa    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/0a04488ff0c028970b9dabeebbb0c603c6697142 | ORPH
  mips64el   |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/50da1f1e8de10298f7f84b3def8b7b993dd2b7f4 | ORPH
   sparc     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/70a8afa1a75873f524680a99f9353f84ab24e721 | ORPH
   mipsel    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/5bb8e8066c3c8b51a43df8f38f51e5d4eeb81d00 | ORPH
   xtensa    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/5725baeb34aa7eee152d88bad007ad2176537b73 | ORPH
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/c2e50d0e56206b8315669aa8b0aeff4e7bf2ae97 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/73843460f01f48e991be1af0f6f55d19161a9cda |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/e5dbb93f8d77ee03d66fb13749a5a132c4df129b |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/4d21fd7c61c49b61e3070afd57e8d7806e610b9f | ORPH
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/7c9af5f9c597566919456037d761ac0d8ebf165d | ORPH
    mips     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/aa525173e3a7985f35776f15bbf1992eecdee8db | ORPH
    m68k     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/b05420a9316453c604e209147c103aabf619c202 | ORPH
powerpc64le  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/90fa73ce1f88489dd427fe7a8b743a83b74472be | ORPH
  powerpc    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/20fec743c605f226379c86c4d012ce32346faa58 | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/60a0a77a37b23ffd472757b123a46e4d3542437a | ORPH
   arceb     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/cfa3041bdf62515f36ffa2a31a486078d6daed74 | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a01c5df8afc2a8329c53e56ed7a7eac3ef721c99 | ORPH
   mips64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/ff1bb632b9b747ca1eddf4500912a45695670705 | ORPH
  riscv32    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/02ca0d606e21c3dd29e75a58e9de1550163ab6b8 | ORPH
    sh4      |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/3be9db16cf4ba45b80fbe94c390071f77c6fb1de | ORPH
 microblaze  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/4659b0950a1a6409b90884ea1dddc22843280a2f | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/73afab9b90224990fd3f3065df45e6b803b7de28 | ORPH
    arm      |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/710f79b1e3344712902bef239e88e60837a11860 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/9c2582d23db4bae9a5109a14e0cac827a029def9 | ORPH
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/719f8892652b833ee1b4c88581342e89ca1b5099 |     
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/7dfde39a5ea5ecf05490bedc6cb3784231f27fc5 |     
microblazeel |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/ebeb3282284499a0302a304373e59ff9eed75d4e |     
    arm      |        luasyslog-2.2.1         | NOK | http://autobuild.buildroot.net/results/d9fbff0687c6438596b158cc1c4db7bc9db289cc |     
   x86_64    |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/ad15f2e0b49f533ba359d2c0b4c69855df3f1afc |     
    i686     |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/ea328e2b8c86eaabf4629fc9d7189208a2234b4b |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/87f93ae472444235d35a7c32339fab4ccaca59cd |     
   arceb     |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/60dfc14d418f1ab5bd276793b33cb5e42152d001 | ORPH
    m68k     |         net-tools-2.10         | NOK | http://autobuild.buildroot.net/results/f60fdfe68f34b5b32298d1298a87e895afcbe355 | ORPH
    arc      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/cef84319c245b16a2f8226723c991dc43c88eebe |     
    i686     |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/7903dc2718e00a1ae9b5173c59b718b65b153115 |     
  aarch64    |          octave-7.1.0          | NOK | http://autobuild.buildroot.net/results/2e37111e08cddbf9f7d7aa385067b8ec77c36b0b |     
    arc      |        openjdk-17.0.2+8        | NOK | http://autobuild.buildroot.net/results/b643e77bdf52f13067a167af962803965da86271 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2333026d2978111f2fda405de0e62ad17ec689a1 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1a1044a27ce8c8cea5cd2ed4f3f73266c835cf8f |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4a9b797d4864e95df52ef763a1302559d542fd71 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/928edcc86aa5edc883e591f04e2b868b452bbf36 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b80684b30da003af68145dd8251d6fc524e0f67c |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/912fc3aa6385d58d4afb793735c172c300393d25 |     
   mips64    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/af4bb8cfc7107e9d325a36c7cab97dc2d7d6fba5 | ORPH
  sparc64    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/9dd57f70183dd99093fc6c142fc02d156bf0f0ea |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ad7ea73ae9426ff932ab3adc0e21ad0209d35f91 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/621e2053e9ed8466397fbfd172bd5c33528057e9 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f34a87796346727c5562a7bff56163060567ff33 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/470e5e7a13f4bfe2714f4b41a0f4ef74efc8c98e |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7cec836575fa50bd9f06225db86999e7107e2b10 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/74d839edbd812c20126f83c3e9a02842b3b4fc9c |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a823a95fa70b265e4ea451f2d96eb417e542bde6 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/7e3f13de75daad7e036f23b3fa170c0b8f21a653 | ORPH
  riscv32    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/a44f4f27957f5a05e6c210193e90cbb92f004916 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/bbd01ef4eb7ebe7608757314713e85087b36ef78 |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/e291531207c576ad0d5bd92ed99fa6eb6bb2e492 |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/877e68690dc6ab199fc0b1d708678505ca2f49c2 |     
    arc      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/aa939cd309ec1c0ac67984d8b9f06152288f8560 |     
  riscv32    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/bf2a50a848a98315cc56ce637e61c4129abb3e94 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/7da0e447d58c9d0ccd4e8076b28e28bf695ac1ba |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c291b388eddb349034fe08108ca20bc599973c4b |     
  sparc64    | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/b3fa0fe7a14e837f67749748e10d356c89945382 |     
    mips     |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/9b2622fbc4c2c2b787578ee83fc6a23795a84415 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/b0d418c38de86d23f2610e967ed21447256cf640 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/a9e19503ca98004e9ef49c82dd7548119c171956 |     
    or1k     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/32ba684c172d97b1d93f92f4eb6597143ad21594 |     
    or1k     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/1fd030fba581601499fab022cb4082140e93e4a3 |     
    arm      |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/cc4e4971db71b2e3e6736888b1e7d47262f97f92 |     
    i686     |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/5bd7b00668678f737414ed1cd98847ad5e181df4 |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/babac40c17d157a5569a86e0e7198cd359cb8116 |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/a29d55bd4ede44d2ed67740cea952ac097de5661 |     
  riscv64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/798c09e2103a802760861cd8c5cc04ff734c4ded |     
 microblaze  |        syslog-ng-3.35.1        | NOK | http://autobuild.buildroot.net/results/18253243819d8a3b60cd5daf870f4633e79f4c34 |     
microblazeel |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/cd06f9116d8eec92874a001929e792739ab66bfe |     
 microblaze  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d |     
   xtensa    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/63ce5dc9dcbe96eb18344e1f291806539a446d96 |     
 powerpc64   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd |     
   mipsel    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/3bf145c372b8faf8b58fd30a60de14917eba9c71 |     
 powerpc64   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/da91bdd2229ad0e1387d15cd8bc6c67c46eb4651 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/93f1df860d289db7761af0ce563cf526aadc574d |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7229383774c66482b5bd8fea1e3fc6b5507e624f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b2df0521d263fcc7ec31f497de8dd40311b2b62b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0bfda782d9c723f35b6700028909691fb14ef50c |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c6d9bff46eb2da37a9f1053bb4fadd1817eb142e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/469244a08635d51f418de685f2bd2e038465269b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b046a4c64a5947f95b203fb4872a632850b792c1 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/eddbbf246daedf16b38ea44fc76426cd569159c4 |     
 microblaze  | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/93496892addc9b1cf2b61bb60fa8579a08476eff |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/7fdf3c7277c76f434498619181652ca00f31e7e1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f5854c7fe7ed353b7c9c0dc4aa7b538f6d6fef49 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/199514c92e2bfa33b8108244e1faf6bf2240fdf7 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/1adfcd5614aab5e6d3679494c455ac2f7d108113 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/4400d636121f03ddc729f0e5fed868e2e1eabfc6 |     
  mips64el   |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/028764b1324d099d95ce05e7d3374c3ea84635ab |     
   s390x     |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/96c3ac00f0b4eb97b401d2af11f703f2aedb44f3 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/10c48dc96c287602c791ecba9372059610b4d903 |     
   x86_64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/035a2207d5143a45e3f7ad7b4b8230287c3785e9 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/a9ecce80e52a4a3ba619e66f69a30a98254c7559 | ORPH
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/a1d50bb422f5a6a07fa307aca58e047f104b407c |     
  riscv32    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/3ea2859cc859d67141561630c1187bcca80ab51f |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f32e3ee75787fcbe6d56ac26db40cf25fa16c196 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/01e612ba575471ecbbab828d317a0e049f31e214 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5858ddee5dc11dd5084076fce03835cc893609d0 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e04ecd02d459e919d50e3e7c67fe114c5692741b | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/73a97415adb28479e770d43c29c8526a8864db2c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/91ab80e38731916dfc7b3182f4e9fa9dcbde2f7c | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/599d458dc29ea3fb0ebfb3ad719e0d0e83daa019 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0b225f7b795153506040da474a9f948f7e0c1a2d | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5893adedd5a0c8db24115f93a52a11ae95c0f055 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c2ea49e199d7e443c37a8355ccaf063e268c86d3 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/df98785b8678aabd175a23437a8be31337836b41 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 3 
               protobuf-3.20.1 | 2 
/home/buildroot/autobuild/i... | 1 
             berkeleydb-5.3.28 | 1 
              containerd-1.6.2 | 1 
                  exempi-2.6.1 | 1 
                   gstd-0.14.0 | 1 
                  jack2-1.9.20 | 1 
              jpeg-turbo-2.1.3 | 1 
           libfreeimage-3.18.0 | 1 
                   libnss-3.78 | 1 
             libopenssl-1.1.1o | 1 
              libuhttpd-3.14.1 | 1 
                 linux-5.17.13 | 1 
              liquid-dsp-1.4.0 | 1 
              python-pyqt5-5.7 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e8f2155311c91b38466e25fcbffbebb7757119fa |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/c048d0853910d4912ded508ca41d6a6b4a7ee884 | ORPH
    i686     |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/04fc79908503331e301ddee5c4eb893a96d7660d |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/84959eb267e8e5558a9748ba19b9edd2e7b49c66 |     
   xtensa    |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/aa3ecc17eaa3e485e1b682bafd95d3291f14d321 | ORPH
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b5045623ffe614843707ff4bc4813a779b2d7300 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/52d0b27fb9ba06da66b37742d14171bf656b1061 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5834f38afd07a336167c6fa5db7651e41245f42d |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/7616dafcba4ada119fd70b16faca7b11ca055e3a |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/21dc520d4e7d8c9b0a2eee696be01da7b66445ad |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2ef9b7288fb276dd5e90882d6f0cf02b45432597 |     
microblazeel |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/6e471d3b9d64fe7a0212dec2f7a0098d877eb824 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/2e6c89e6491110493bb81bbbb0ebf2d5837775dc |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/015df2c7df3c98081666d45259a109fedabb2a37 |     
   s390x     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b951777bea8dd7dbb1567e6531d54f5f0b733c5a | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/440a132a3c8a6e0c3756ab19a9680fe23691b280 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/761f3f4b0dab91c0032e01c08079c91e88489b59 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2ed8ab45c714236bffe7fd9d41feba22f0d9cf8a |     
   x86_64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/57028d3e761874fb02b64710af5372c12186029f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/01fad25d35194116af8ec2583c92d4611c33e3a4 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/720b9f21e17ea7b30cecf3671653e829a52b33d8 |     


Gitlab CI results for 2022-06-09
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

