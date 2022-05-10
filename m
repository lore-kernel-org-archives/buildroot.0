Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 04:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A8481521;
	Tue, 10 May 2022 04:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixASYG0G83pa; Tue, 10 May 2022 04:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF8F1815CC;
	Tue, 10 May 2022 04:49:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0741BF977
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 04:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 316164024D
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 04:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxs3aS7p9Qyo for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 04:49:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB0F440211
 for <buildroot@buildroot.org>; Tue, 10 May 2022 04:49:14 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7596124000A
 for <buildroot@buildroot.org>; Tue, 10 May 2022 04:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652158151; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t78d6coYMqCEfNbG6hQLcnZV/ZsZCNw9OKknHePXsGM=;
 b=FqwT/n6D2TO1zsLWWIve1QTbmAbIdYJvmBT6/foP3zVOXCMH8lg0r56+qSI9k+c6OtK2h/
 cRwp08/gWvcfBBjAaq2PWSi0TROutcDNC8zAZm9kE+n+kiy4UDKvhccWEh2ksYVtujBVFs
 0ZglE31EX5SPWgkyFkFXq5urpec+uyJNBaGrnPK3XxHBxbTsO2lbMvrNmxhEheQC2YJnKO
 qoeVihWthFNaGszXwSGk6vhRvsZqV1hdS7UgX1VI+eAsc3/1+2Aih1mNzyR9xZT5o+dxhg
 11N7pQi4YVNLPXacEiZqFp4ig8yz+zYA2HqJA/YIG04u50wVeeSe5kp2ruFEig==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 04:49:11 -0000
Message-Id: <20220510044918.316164024D@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-09
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

Autobuild statistics for 2022-05-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 24  |  6  |  0  | 30  |
    master   | 156 | 206 |  0  | 362 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 24
           optee-client-3.17.0 | 21
                 uclibc-1.0.40 | 14
             libopenssl-1.1.1o | 9 
                pciutils-3.8.0 | 7 
               protobuf-3.20.1 | 7 
            qpid-proton-0.35.0 | 6 
                    git-2.31.2 | 5 
                libressl-3.5.2 | 5 
                 linux-5.15.37 | 5 
                 wavemon-0.9.4 | 4 
                 zlib-ng-2.0.6 | 4 
  gobject-introspection-1.70.0 | 3 
         host-gcc-final-11.3.0 | 3 
           linux-5.10.104-cip3 | 3 
               aircrack-ng-1.6 | 2 
                bitcoin-0.21.2 | 2 
                    dhcp-4.4.3 | 2 
                elfutils-0.186 | 2 
glibc-2.34-109-gd64b08d5ba7... | 2 
          host-gcc-final-9.4.0 | 2 
       host-gcc-initial-10.3.0 | 2 
             libgpg-error-1.42 | 2 
                 libp11-0.4.11 | 2 
            ocf-linux-20120127 | 2 
                       opensbi | 2 
                     refpolicy | 2 
       shadowsocks-libev-3.3.5 | 2 
toolchain-external-bootlin-... | 2 
                       unknown | 2 
                    4th-3.64.0 | 1 
                      at-3.2.5 | 1 
                     aufs-util | 1 
                 batctl-2021.0 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                  boinc-7.18.1 | 1 
                  cairo-1.16.0 | 1 
                  cmocka-1.1.5 | 1 
                  cpulimit-0.2 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.14 | 1 
                  faad2-2.10.0 | 1 
                     frr-8.2.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gdbm-1.22 | 1 
                     gmp-6.2.1 | 1 
                      grep-3.7 | 1 
       gst1-plugins-bad-1.20.1 | 1 
gummiboot-2bcd919c681c952eb... | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.18.1 | 1 
       host-libodb-boost-2.4.0 | 1 
                  jack2-1.9.20 | 1 
                      less-590 | 1 
      libabseil-cpp-20211102.0 | 1 
              libblockdev-2.26 | 1 
                libmad-0.15.1b | 1 
                libmdbx-0.11.7 | 1 
                   libnss-3.78 | 1 
           libwebsockets-4.3.1 | 1 
                libzlib-1.2.12 | 1 
                   linux-tools | 1 
               mariadb-10.3.34 | 1 
                mongodb-4.2.18 | 1 
                  mxs-bootlets | 1 
                net-tools-2.10 | 1 
             netsniff-ng-0.6.8 | 1 
               pipewire-0.3.50 | 1 
                 pixman-0.40.0 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
rtl8189es-39c17661136da48f8... | 1 
                suricata-6.0.5 | 1 
                tinifier-3.4.0 | 1 
    toolchain-external-bootlin | 1 
                   uacme-1.7.1 | 1 
               util-linux-2.38 | 1 
                  vlc-3.0.17.4 | 1 
           wpa_supplicant-2.10 | 1 
                       xenomai | 1 
               xfsprogs-5.14.2 | 1 
xr819-xradio-16180b6308e3c5... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/62a3ab7834533c998b7616686cdd7be07f364308 |     
    or1k     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/017590f68f52025bbb208f5a3dab238a495bae7d |     
   x86_64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/c3c92d3d9d0074abbb68efde7ec7d809da502070 |     
  mips64el   |            at-3.2.5            | NOK | http://autobuild.buildroot.net/results/e845851ec2639423d57d9feffb6c289d09bd99e9 |     
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/10be0b0b2dd21474fcbcb62f625d5d5178228a9b |     
    m68k     |         batctl-2021.0          | NOK | http://autobuild.buildroot.net/results/39ffdfe98feef9568a34e658813f9063dd2c5fcb |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/60f0858f209d8eaa1c598821954d59600743ee0a |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/87a47927b2d448bdedb2a7a080c0008df6c40401 | ORPH
microblazeel |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/dd30af4446c0a2b2619db8f0596f94a384f7e3eb |     
    i686     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/2414237568f6cd59ae527378a04fe5343552604c |     
   mips64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/f4fa3622460810dd5340d10311d445c9629dac0c |     
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/951fd5a7f30f2c428f70869b855af1cd5151264c |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/8fe8ca376f23878c8eefd562a4bc8797237887e6 |     
    or1k     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/2a9cf20949beac46d1c689df2c5b7ab0d59c08b5 |     
    arc      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/15c8634b153ba0ea11686a13922640fa21db9d9d | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/6c0e01266c43c47ca554a9c66cdf7e6651a75a12 | ORPH
    mips     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/8eb94fbf0f447ec840989fdde2cb2bacc6d87ef3 | ORPH
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/c3bb91cc74ed65ee80e34f4c8ef907350bc3e8b9 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8998eb9ffd5bda873decfa021094d2fb4d8822ba | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c8f954a4928d13edb22aad3e594f6c720eb09c52 | ORPH
   sh4aeb    |          faad2-2.10.0          | NOK | http://autobuild.buildroot.net/results/a0bf66719f31f5073a8a0f541047cd507a557765 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/3c6bc1612fa939e00dd18858232675db8378009d |     
  powerpc    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/f8ffcdc8fadf03932db608ea33b37c54520c73ff |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/3a35ad47a8e4a6ec3b78ed5fdb4d013471189677 |     
   mips64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/4e9144c44de822783d8e3f355ebce28d9de31434 |     
    or1k     |           gdbm-1.22            | NOK | http://autobuild.buildroot.net/results/3b1021ad6e129a7f06c1396dd4a3abd57ab1de1f | ORPH
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/7d26f0bd5bd0b1576ce1b3c6900ca84f2c5c308e |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/1ace2832776b0f28173eb230d9f154356deb3197 |     
   mips64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a309d20e7d5aaeebd744c612074b652d89b8a853 |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f3792f07ad796e659f1b58c6f4df5c2bcadef3a7 |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/0afd04bb32bf32c003e40cf56b1d76f9639ca2b9 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/89eae4c6e28658444ca5bc67caa2644358de97b7 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/bee990c9c34d391cfc4a351a30abc1a0a53a2415 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/5e1c21a329e65eab71e3cbd64c6b7290de901d81 | ORPH
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/e9a359cc06a26850254f4807dba9d47db449b2de | ORPH
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/27e12029691ee5c94a3d2bfa7750497be069decb | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a9d4c4c29df96a0a4ee862c11afccb862ea4fce1 | ORPH
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/2d7b5ecc5d779fb9af279fcf92f5f7dfb378c2c9 |     
  riscv32    |    gst1-plugins-bad-1.20.1     | NOK | http://autobuild.buildroot.net/results/6d0ce8b7b3b596a75a08982f49eb02a83ade4b3e | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/d5901f37c2f2d75cfffae671dbe2d359055830ca |     
  mips64el   |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/0529bd903b179b10b369dfad6284a0c5cff90ecd |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/aa92841eae51cd734552b129bf62df5bdeff5c95 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1f11fd3682159c83335693da27acdaed95dac3d3 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1656c5c500f9e576b24990e5d8e8b4a50a2ed605 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4c88c8f00b88793cd74173cd5c97b7df21d3501d |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c3496941d208202d20de076f29fc65c8fbd4da5d |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0ea9576e612963a470df5ffa963bc3712989947b |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1ac89f8ca7a6be6a66ee2fed8da6328b52619b4f |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/42afe2c17ddb6325d798b3946e1908e39ae97fd3 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/da8e50be543f58fdc0245773c45fd5fd4f1c1db4 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c74c16622ec6279ea7617d379f02fd2b9d2e5c27 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c6a75c124b9188fe1e27593848c32e287c417ede |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e7ac0b6f633d697b830d22da4cd035a7093d0587 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/247e06c062d68aa596b6c686513f7ce531c63d1c |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2fe203952f9ec2904f5c89ce9540d0da83547287 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4a0ff765596f3751b8b6ac35c33777568ae02382 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/87538c63dd6760f2fa6c50515b838dd56bc23a07 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9d7d426f520606e04e943a4ffa4d006c5b165fea |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ea23da7fbffa57f03fff0532a90e7096aa865301 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9f06277347250be8e2725d81c94cad0da068e751 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/900b88eb7d7f791a816b96ff10bf77e19db61cdb |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/435e07068b705d906bc1cec6e469e14ae47c8594 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/21883821c24f78eda54825fbd046e63b5f388990 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b25cfa282db28d87831b4e7950f70aef31a66b0d |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/64c9c4d5d8a75ffd2fbf7e912adc43b7b4d31eaf |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b92e9079bca9285a0bae0cd156359e044bbe199c |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3efafb7b548ed032bd0bb4d97373bb73b0474b37 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c08beb1c3aa9ec2be765506e6dacf88e250341f7 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e14df4f1959c80b516c5db31d7765f0c23cc91f9 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f4bdbae02936b1f258a0f4c281afe6a60ff77593 |     
   armeb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/62dbc3d510d7ca8c35c0ed84659ca78f65cd55ad |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/29f9608fb34ea816ab43f202e6670f63abc4bcf4 |     
    arc      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1a8cd54a33d484dcc008f6568285b73f52a79d9d |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/f82f549442a31d8a5f760c8852c7e4581aee0a1b | ORPH
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/bdbc9d2089682575ff3c2e94354fa3d3671bbdb0 |     
    mips     |    host-libodb-boost-2.4.0     | NOK | http://autobuild.buildroot.net/results/e1ad575a1771adf5b3e844193f0311386a6d6b81 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/7d99c25441c68e4d868b5c5ea37ab129b259f4ee |     
  riscv64    |            less-590            | NOK | http://autobuild.buildroot.net/results/82cfb2d8ef46ce80a35db28a2c8c8747a4b5be5b | ORPH
  powerpc    |    libabseil-cpp-20211102.0    | NOK | http://autobuild.buildroot.net/results/90e390784590a1a2237ae19f893390c4f7c6c8bc |     
    arm      |        libblockdev-2.26        | NOK | http://autobuild.buildroot.net/results/0ebffd46a2333312b3867deaf108a0c4be276576 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/e58e1bd09c11a8088b86a135d8aa1f36238fe8cb | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/3c3e5e958a8b4cb7ea782eeaed8ff8ac983ba040 | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/f8ec4f4bb6c1f2a4e7c30c261d7b5feab2a85c68 | ORPH
microblazeel |         libmdbx-0.11.7         | NOK | http://autobuild.buildroot.net/results/70ddf1926db0a7da946a223daea814b3bac0196e |     
    or1k     |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/77b4c51a7239a5fc18a09c5f2fb84c9612b9254e |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/169dc210e4e37e60e6db7cffefa1edac3ad4afb7 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/99a655b32bd3579d8f0f2afdea1a42478b4583f1 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/cf7bdc1c22170a3ee8b4622d8feee52da85d0c93 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/baa9affa3517c9c5ed9fed5329c4c3a5832ebe61 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/24584a4ab7b8f9813d418d54e0b277c20f2011a5 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/be282e4d1176950d06eded9a791f83d2b253c8bf |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/510ccd8c9263ec5f03ef9402e5ab0411e8c562ef |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d261f83226cc56a5bc9f7282be90ac527a8b2460 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e2b3166fd88bd48f5f6a8072a6fed21a26fea35b |     
   sparc     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/4ed729f909e0dd20d183ae9cf690c8261cc6e365 | ORPH
   arceb     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/3acfa1419b59f7daa58fa8e61abc63ecb00f853c | ORPH
   mipsel    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/4784e4e4ac4a9a58f2435aa0bbb9f6c1d05b8c62 | ORPH
    arc      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/96662dd690cb481f910bd06f55e2b87bd1a569af | ORPH
    arm      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/226c2cf3fe461648b358e13e910aa67f844f4bed | ORPH
 aarch64_be  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/41cd17862bf29da84b9a8740ba5af54a0decc2ab | ORPH
    arm      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/17ad4df7025819cdee362a00d31e3818e57c590b | ORPH
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/ab273198a57749fdc8991785bc84fedfd036eed7 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/0709eecfb2cafafbf8180e470ad03b3a4f482702 | ORPH
 powerpc64   |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/8c027b99f012364310bfb952d11e6bee2392168b | ORPH
    m68k     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/f621b0887b226fd37a54b0a92609b8f23ad8d29d | ORPH
    mips     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/1c358f26116e617ea9abb8b595b6232ffe7a5fe2 | ORPH
    m68k     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/9a8d0a80664daa22f0949692cca38f8b90078650 | ORPH
powerpc64le  |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/b1853becba78718c9e219ad09a12ff7555a2e763 | ORPH
   mips64    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/cc0c25ce7e0d2c8b4df78096693e908fc2f0f9a5 | ORPH
    arc      |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/2c239b120a359a2ac61d0a4133a54e3309d65398 | ORPH
    sh4a     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/35dd5db7f620d31d221cbfba26d3f77fea237a79 | ORPH
    or1k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/a2a5e9624f6f540f7e9d220f29076c0a94c33a24 | ORPH
   sparc     |        mariadb-10.3.34         | NOK | http://autobuild.buildroot.net/results/e973e03690d79363ca7e070d1315473198a2d651 | ORPH
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/019b819a8d391a40fae6a2da870814944a7ef813 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/3b0dbeaf856e9da28ab35e8640ec93d4fb436940 |     
  riscv64    |         net-tools-2.10         | NOK | http://autobuild.buildroot.net/results/212cebb1e5c80ac846eb7765a5dcfb3440d52f43 | ORPH
   mipsel    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/a9ebad00c82c10f54bee490eee91fecdffd4a3af |     
   x86_64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/c0553f1109bb9fd38a2116f59517c8ae1d1823c0 | ORPH
 aarch64_be  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/4d07eac15ef06eee66d6b3fa53e90c91a3dc3a40 | ORPH
  riscv32    |            opensbi             | NOK | http://autobuild.buildroot.net/results/9e310818256646d73beb3c0c23bfb4008d533c6d |     
  riscv32    |            opensbi             | NOK | http://autobuild.buildroot.net/results/5138c7a2978788df98fb7682eeabf7ba4780044d |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d6bade948e794ee95074e1af5413c202a000e905 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7afd31cfbcb1dc67c5b3c3d177b57e6beb7970b7 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1421ab415c669e2e45e54cdbbd959e3d9e0ab166 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2249385f7aeb5e3f65fdf6f33e5548983cd45782 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6dab331276f5bd629b29a737f83b37b8c3c50211 |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cf413c55c10d0a46dc044b2cb1a9afa9c4f272ad |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/90a6cfec5ae013a906f0e0e834767c2a6c1d3e8c |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2fdb986b66482d8c5097b91dab391e75445eb57d |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a436ff30161bfcf44d2e78f913305f840a05edb2 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/31c240c22955130c891d1f4adba3407c8d2d0d3e |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/659c66ca33139dd3b4cf09b9411d9954f439fd5f |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d84ae80e2647b91fa3c54b519be35fc8b02e3a6f |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c36fcc06058e8e3658c2d6c7611700caa9daea46 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/5d7250ad31910f688c04d95dd34ae791e711d0d3 |     
    i586     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e98cd667fdc093b9b9731d4df42d2c5e0009e413 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a17bc1d267564a762f5a530b26511313b0d97d13 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a69a8869f755ac7070fc7e85851471ba9c6a273f |     
    sh4      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a0311e79f39b0b8c4fed8468f70be4714a42be2a |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2a656b481499aed484bc4d0700320df861648698 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/68ac2baf2e96bb882781a0af3d7216bccf57ccd9 |     
    sh4      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/51a3d40634934183ab8270f2970a35bfd05856de |     
   mipsel    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/fb719bdadce63655acf9426449697d4e9b58e582 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/dd063fe221c3b228d9d931d948caf271b20b5e4e | ORPH
    i586     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/5983aadfd0e5c1bde3fab38bb9e06022a4244491 | ORPH
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/8e2e6a7214c782c074322833d4f39b9e722a6f63 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/42bcde6b076aa8bea96df1aab90e16a16986e54d | ORPH
   mipsel    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/c5f46a7d7df6da4e925820dcc98e9866952eb29c | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/36de7e704682c8a03f63fc1947f5d742d11521eb | ORPH
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/f54c8c0d53c9ab367073c05d57b1e2c7573259db |     
   sh4aeb    |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/261fe1a8f23527214ef05691d8a48bfd51a66c27 |     
  riscv32    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/a9cc48aed78353c6d4b2d206bd6cea612c4581b8 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/da630347308f548dcc87e4a940a2fac86cc4440f |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/518c4c195c6334c4280a3a48cb1877d024f291c7 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/db87724653ae63ddcc664018912dae968e81d266 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f55f298ceb2accadf64972419ba5d494f89fb333 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/23cb17edc75fc2e1a29b70b80ccd58fdaeb1c23d |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e64c054ca6e6e5be66d8f82f2057090dfc9dd3d0 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7e95df95861316416c6796910ba72f2b789ca647 |     
   xtensa    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/1ff47fde0d3144d3d8cb6874ba0818fa9410f98c |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/5a6ecef6e0649b97a4d4982aaa23982738503919 |     
    arc      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/143365c522b70d07f35d22166994b73a68cb872e |     
   mips64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/2e2beaee39f463620b2e692d757eaae0fb944517 |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/5a3895a1f2a06f0116528ce3c6e3791be27967d6 |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/46ba7b98bca08d27d38129c59011187289d56e67 |     
  powerpc    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/7da6065eb2a9703c92da19282b61dbe6136e4ba2 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/67eb1666b8df2ca6f2ce4d6e59b91ce6641574ad |     
    arc      | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/d5c7bcba9216ed3a17b8cbff93ca3beb833d4cf6 |     
    sh4a     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/24ab83e1825865f7ac94c538ed2e88d6600ee41d |     
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/e5c0786154b20e6eeb083ab2a7a3699103ab18e6 |     
    mips     |         suricata-6.0.5         | NOK | http://autobuild.buildroot.net/results/682ed5174ea872809d4037d85b1154f46e3368b3 |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/06928252801dcfd9f3002e1601216e904c7c9e98 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/8d6e91f11ba374f37a1a0dd47bc562b82fb98cbb |     
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/bdfb2b562d1a051b968066599594335e9c2ed48a | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cdbc1fbb861ff20349345aa6617d51f403100977 | ORPH
   mipsel    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/e39988c7d8275034de8e710633ea65a43ca9bde8 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/5817f2012db233250095cf79babe4301b7ddee4b |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1d186b6fad53734923884d58349531458486ec90 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/47c0e6487b4c6f630776528bb120c91ab623b58e |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ba4ec5272f89dd18a2753d5f22cb5d82b05114d6 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/3dd779131ecb1e316e1bcdfc5c82c0ed34f9351f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/5e3b9660828b939d1e329cf897e74ae641fc419e |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e611012f5af3b37da496ab1dd0bfefe334c874d3 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/04191330e0fa1ea6082e2d8e28751b79d4bbfa8c |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e045bbafb01bf97a8a1d891fd4b0e9d6080eeb8e |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/db1da4921b06a116075e5ff622a69ccfa93598bc |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/58fb570e7e4c82917b285d3e9bdf6d617eff8c5c |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/96a1ce6aeec7af0611c208aa47935f00a5630267 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4047e8bcaf6f35f00a2788ff58fa3e5b75851690 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e226990886e8539c6a38c146a514548a66479559 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/6782823d4e011739f9ea74b0c6b071b50ad98ef1 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/7624576b38ca8c612c2e5d29a542c704b8108e69 |     
    mips     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/a2f65d92e0350e6d3aea273924d28a16d39af648 | ORPH
   xtensa    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/1b888948f4d54de0c5673a0470490dd6a4dcf482 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3094c13b8a23ecae58f79e4751a959370e687351 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f7a2d6d5e050526e5e51c2a0e440a40b0341a998 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/036abcff435fc82d12f1f4006b47fb2fe6c1be26 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5af06b040294cfc04c2f042c087ca21c3e7e3543 |     
    mips     |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/6bb619eb7fdecf7824fcc549c4ccb8e487665d10 |     
  sparc64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/393c209671ccafb2c17739435c139f0770c6ff8f |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/774156ecac943eb5c0daadb3fbb293866c6ff984 | ORPH
  sparc64    | xr819-xradio-16180b6308e3c5... | NOK | http://autobuild.buildroot.net/results/b0b6fcdc1902bdaa2d74fa3c871b462f439be1fe |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/56d74b4fa0ef1af13ca18c26c3445b4a9f54d4e5 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2654cad2e31069ae89f8b2530ef21c33c9af123c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c1a892c8d1326cfeee953cf4e1f06cbd4eb486cc | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/259a2c8c7c099510d389265e0b58a9d2016399e5 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    dhcp-4.4.3 | 2 
tvheadend-1295dd2be863f5beb... | 2 
                   perl-5.34.0 | 1 
               sdl2_ttf-2.0.18 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/b135719c3ca4d484f3eb9d17164d019aa3e120ef | ORPH
    or1k     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/3961a861e293160046bdff16f8ffa71d51cf99a1 | ORPH
    arm      |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/2ed1251b45393bccf0b31774fcff75ce387d3401 |     
    arm      |        sdl2_ttf-2.0.18         | NOK | http://autobuild.buildroot.net/results/78fea175eb13b7542196ae2c7c168374a2a48c3e |     
  powerpc    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/3e13dd18aaade936234732d02c40d9ffb441121f |     
   nios2     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/daf9f251149c0b48e998121344885287c9d809d4 |     


Gitlab CI results for 2022-05-09
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013469  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013555  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013711  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013708  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013770  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013769  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013951  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013962  | ORPH 
              TestZfsBase | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429014006  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429014008  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429014010  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2429014012  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
