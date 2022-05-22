Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C133C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 04:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 937FD83F93;
	Sun, 22 May 2022 04:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQTFMHClGxn2; Sun, 22 May 2022 04:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D0B583280;
	Sun, 22 May 2022 04:39:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5653A1BF3C8
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 04:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 524E540535
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 04:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xHjfvseRpVl for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 04:39:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89AB340470
 for <buildroot@buildroot.org>; Sun, 22 May 2022 04:39:53 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 14310FF804
 for <buildroot@buildroot.org>; Sun, 22 May 2022 04:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653194390; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uM4eszprQ2DNMhEZzeXOG81qRalZvDwmoS99OTvPnsw=;
 b=AWrGLqIuBZwLeLq0IMVIDnAc+6mcIt79v5PQFfw2X/jWprIMqmRttjDy/EZV4GUiiDrXv8
 gZJ2QgcdU/LuKaRGBt1JqF9x1vjf+wE1YMew3vAbB01O3gxbMaET+gJBaAVjHX71BSGlmn
 CWCk3vlU49qUgK+D97eEJrcRHrAI6B+Ss6paqKM3yl7ma5IeAPAUOwNCtgC75p3dBMCPGa
 q+uan8rvvbEvaR8IeqxcZFUiwZRkQdF0+sz3b1AQO7smXrTrfYtO73UMMwY5zsoo5PpUUd
 LzUPO0y1QiSO5q/SGak67R1CAOUdyHRw8uWj9xtQYBNoYk3/gNX2twXJYrTXNw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 04:39:49 -0000
Message-Id: <20220522043956.524E540535@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-21
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

Autobuild statistics for 2022-05-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 24  |  4  |  0  | 28  |
    master   | 142 | 207 |  0  | 349 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 28
           optee-client-3.17.0 | 20
                 uclibc-1.0.40 | 13
               protobuf-3.20.1 | 8 
               pipewire-0.3.51 | 7 
                  boost-1.79.0 | 5 
         host-gcc-final-11.3.0 | 5 
             libopenssl-1.1.1o | 5 
    toolchain-external-bootlin | 5 
                 zlib-ng-2.0.6 | 4 
                  exempi-2.6.1 | 3 
glibc-2.35-96-g2c4fc8e5ca74... | 3 
  gobject-introspection-1.70.0 | 3 
                libressl-3.5.2 | 3 
                     refpolicy | 3 
toolchain-external-bootlin-... | 3 
                   uacme-1.7.1 | 3 
                 wavemon-0.9.4 | 3 
               zziplib-0.13.72 | 3 
              alsa-lib-1.2.6.1 | 2 
                bitcoin-0.21.2 | 2 
                  bitwise-0.43 | 2 
                busybox-1.35.0 | 2 
                     frr-8.2.2 | 2 
          host-elf2flt-2021.08 | 2 
host-pahole-73383b3a39afe86... | 2 
              host-rust-1.60.0 | 2 
           libwebsockets-4.3.1 | 2 
                  linux-5.17.7 | 2 
                nodejs-16.15.0 | 2 
            ocf-linux-20120127 | 2 
                   perl-5.34.1 | 2 
              swupdate-2022.05 | 2 
            altera-stapl-0.3.3 | 1 
        at91dataflashboot-1.05 | 1 
                   atftp-0.7.5 | 1 
                    bat-0.19.0 | 1 
                  boinc-7.18.1 | 1 
                 coremark-1.01 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dash-0.5.11.5 | 1 
docker-proxy-339b972b464ee3... | 1 
        edk2-edk2-stable202102 | 1 
                elfutils-0.186 | 1 
                     file-5.41 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/squashfs/squashfs.mk:56:... | 1 
fs/squashfs/squashfs.mk:56:... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gmp-6.2.1 | 1 
          host-gcc-final-9.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.18.2 | 1 
host-google-breakpad-c85eb4... | 1 
            igh-ethercat-1.5.2 | 1 
             iucode-tool-2.3.1 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                      less-590 | 1 
               libglib2-2.70.4 | 1 
                libglvnd-1.3.2 | 1 
                   libnss-3.78 | 1 
              libostree-2022.3 | 1 
              libuhttpd-3.14.1 | 1 
       linux-5.10.104-cip3-rt3 | 1 
               linux-pam-1.5.2 | 1 
                   linux-tools | 1 
                     nmap-7.92 | 1 
               openpgm-5-3-128 | 1 
                    opus-1.3.1 | 1 
                 pixman-0.40.0 | 1 
                     pv-1.6.20 | 1 
           python-orjson-3.6.7 | 1 
            qpid-proton-0.35.0 | 1 
                  sudo-1.9.8p2 | 1 
                suricata-6.0.5 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-codescap... | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 
                       xenomai | 1 
                  zchunk-1.2.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/f5499e16a9278a920772b91ff548597b1def5c4f |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/457c40e95199559e73655f439cc6384d8060e304 |     
    m68k     |       altera-stapl-0.3.3       | NOK | http://autobuild.buildroot.net/results/8a77b35b7aec6dfd4972e2a9a31f51bad0765dc3 |     
   armeb     |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/80affafef3fa1d0fedd93357744b7b4ac81d354a | ORPH
    m68k     |          atftp-0.7.5           | NOK | http://autobuild.buildroot.net/results/ed269e44531164f6d711062ea5ca639002a165cc | ORPH
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/dc4e5d75e877c12771765bf137356a7ec3ca142f |     
    sh4      |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/e37860e5b8de6297f351cbe5dafe6edddd02e6f3 |     
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/92e7c92459e27e53c6372a99dec6f698abacbb80 |     
  riscv64    |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/d5d7a54ad6303e92ea21c47886c9bcdf141ba10e |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/cc26c56c669d2eb23492008908938cd0f7c00d67 |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/4504379b464eb144a4c257001eb4d316bb1f5e44 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/0970291041db15585430b2fec36d2d79ed4792aa |     
    sh4      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/d3ad7ff6b8b6830aa23b86ac104cac7277a05984 |     
   xtensa    |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/1163802b1c657315618fc42551f31d798192e583 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/318b53231d7073df949e9ccdc58b86ece439aa38 |     
microblazeel |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/1a783ce0df5968d2533921a53c500a970681706a |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a7566c8bdb86ac5238d76e4c228b62eb1fac4f10 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/cfe6ee4c092ce46e23b3156d4c5e90caf7a47a70 | ORPH
microblazeel |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/c0381fc2dc779b8d8bc60a171349b951e9231f78 |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/a6c1e78a5f17ca58f334bd9136b1d32710c47ec7 |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3342a9148b3b39f64e1f1cd1e1a19400208c19a4 | ORPH
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/c18a2203df7756363747cd348d2ebffa2d2af2bb |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/915435efa8045cdb9a086e4c53c7899fdda10373 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f221ea3dfec6d5261ba2d03beea5ca5b09f2aa6a | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/80b5ab47372b4a4fc184d7f44115a15ede5aae96 |     
   x86_64    |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/890fccfdf047eb00ab88d7d1c0644e58c491272b |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f7e8b5140e0a2fde1be4979fc2d0f8d1cbe60133 |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/7c70dcfc1cd837da224ffe8d5fc77e416f9f4950 | ORPH
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/3d1c3e44988a6abf4193ae25bff75da530726792 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/627de5128fcf082a445dfb93fe957e5ef1174b07 |     
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/1709bf7f2684f7dabbdf5926528f126a1676b8b4 |     
   sh4eb     | fs/squashfs/squashfs.mk:56:... | NOK | http://autobuild.buildroot.net/results/19d3fd17e07bdf2dbfe57c117ae570ac4d68cd43 |     
    or1k     | fs/squashfs/squashfs.mk:56:... | NOK | http://autobuild.buildroot.net/results/d5355f6ab942217702b4a1242f91a9d0f58e1562 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/92d81e65d1249b04b2dc31526025bd124b828d2f |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/beb6a3d9d07cbbb02b54de60d0bcdb2a706bf3d0 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6d621de4a06b66481f51b9ce82fdfdcc4d8712d1 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/58a0e97cba398fdf799a98b3c71c50990c9184d4 |     
    i686     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/c579c30fc4b7f4ab4d82186252730231c51301a2 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b32e98a2384c63cafa8c8f1e249f149c1e781055 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/cd76a43041560e0c1631be3a0899f64b553c2c65 |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/7e4631913db248138568a5f8c1bb4b54743e994c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/87b69c2fe0b35c436f2f06af6046aae8f261f5b1 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/b51fa87cd040e0324b0fa7de6747bde3203f5dc8 | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/5468abd3101268c8102ea836e3030351b18de776 | ORPH
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/52faf4664f59bbdc6d5ef4535a3b709b86d999c7 | ORPH
   armeb     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/4892e2e8714cf9d7cc76edcbaebc96e346ea9790 | ORPH
   armeb     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/a0c730620f758421428d3654d40f465013ff479a | ORPH
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/39e98ae05baed83fa30ffa78e302c7544656d287 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/aba8eab295e9bc0a7e2feb0bf1d7fba6b9c1de32 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b92f36bfd1d05c477e4771bb1eaa87d0a458f02f |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cfad1ccfbc9192d4918e76440abfb99331c72a68 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7478006e11078750898d9c9ca4e7399a106465fe |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7b960612adab33451ff48cc6a742d8b3f9762140 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f5a4ad128c3479a18035af9e9dadd7b0ca22c4b7 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3d2c9275294a5c71d3f9df41ef4da5b5dca99496 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5103af64816ee3cea94422d0994929c101e954bf |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fc4bfa60bd8871b3cee4209e0b7ea240a962395b |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8cdbc5af7038e5e146833d18effd24afee4b0341 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/610b3d1b03bf20b310ce8768e3c6262521995b14 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/edc5e08e1207d45296837a8141c159e12a874958 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8b7f20c75d92d3184068b9ff4cce38ded611b794 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/acf299987eefb79f227c3e59b037bb8a39e250bf |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/abed3704598876864bd545b258001d179a535c09 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/adf0f6dcaf31fff558a9a1721dce2012e89f93a1 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e8e676ff0f4b773f90eecaaef266817b8450c806 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ee5f03928423c636202e1571dce6b5b397322553 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c3c44ff2db6f23cbfcd590e31af2ededd43a995b |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5c9de1a01e575305a85b966cdde0d57b97de8889 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f4369fe012dd9ce75f3becf16a51f650f10faf9a |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/17cd4862162af4b083e99b140eda7a88d1746009 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/490ce828be4bca6049ef62ccb54e1052517821d7 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ae7558446a078e3fb78d8c85b27cd6af71a70241 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0e3006e1312c2deba60a4f428a7c57e858880969 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d58164a84620be095f346f809c8f1305427f285c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b093ed47f0ae17afef7bc83743ea45ed867fe393 |     
  riscv32    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ced929a6bcc86de5c82d117666577405fae7feee |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/612f234841a1a691554ee0b343e917fac7cdc9e0 |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/35ed553bfd8f222a45f4a789e77252983c5eb2b0 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b4ea48deff1191ade1b88b9b620c83d354899b71 |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/5b153c18d986915a2545276328eb0885fbafe840 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e2f7548e2219da3448a5ba7d97affc6d587542e9 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/5f64e0c84262ddde39bb61a6212f6fd9f94fd441 | ORPH
  aarch64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/cc24d78eace6c9e2347f686271ad4be44d124ca2 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/d81f6b9773cb789f13774792942bd170c6f6de87 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8fcef56a9370d568688f479aacc77a652a7f53a5 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/88dcdf6c468b29f4aa28844243c298ab710fcecf |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/7ec9f256fe81fa71494ddd1d24995d60c925c7f6 |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/df61dbcdffc7f9d8a04e081d72595a3a4c040fa6 |     
    i686     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/7ba26bb5204ecb694017a8a3afcfd333aa870dd1 |     
   x86_64    |       iucode-tool-2.3.1        | NOK | http://autobuild.buildroot.net/results/f9e2eb64c63ad36f7b0aa11deb0437e549d743c1 | ORPH
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/8a70f334405472e25b26923d977e0a499c6cb67f |     
  riscv64    |            less-590            | NOK | http://autobuild.buildroot.net/results/11a5df00dd915427527acc62e1ebc14eee83fb80 | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/279e4ccaf13d0cb4d0c7a19b147c46d127550117 |     
   mips64    |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/a41ff6772194da4c6a8d8602d8568d204cb5838a | ORPH
 powerpc64   |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/67500395f19aa698b98404cde8d20463e55504bf |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/59dd705eed273d61696de1ec06ad73ac67bb6fa3 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f53e40be8cce06d43cbaf04f42457b85ad6ed0f1 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e174b68e7bb5a3fa9758d6301a0591f46972e5e4 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d892dec09301a5f1a959f71a1660556d8bd944f4 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5c6bb2c7a76bd0f6e76074409422fa4398395646 |     
   x86_64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/eb51a15cababb26b403dd262a5fede19549d062d |     
    arc      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/cbcd2e6f91ec4f095f7b7af4015f119447618ad4 | ORPH
    arm      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/3d7f64742b118dfce42f1ff3650964c81581a291 | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/9d2f6bb3a697736262a411dd714e187847db01e9 | ORPH
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/88959c700d69a082e1baee3141ce5a7628917d19 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/4547916f71ee79e5bb53809861140bcb7a7aa4a0 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/11526a253059fdc49b8a28406bb5ea9f87d9a651 |     
   mips64    |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/77d693906ebeec5907e04af1593e328a3d362ac2 | ORPH
   sh4aeb    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/b8eed19cd3e28857607db46538aae9b7df9dc79f | ORPH
  mips64el   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/fc162bbfc9777d02212d40639927c97aeee65879 | ORPH
  powerpc    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/fbaaf58aa040dde5ed5000e37a0c897a7bc4a38f | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/6a79ddaeb0a27cdd23bb8e4b8c80a7e921d001d7 | ORPH
    i686     |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/2e6eebbe2ed8305b88047bc92c19350c1ecada16 | ORPH
   mipsel    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/5c237640389d21a3273f9d85be485675f9404834 |     
    i586     |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/89efaaf7d532a1ad0b0e9df2e35b31e8a11c0123 |     
   sparc     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/8ffe046c15fd8ef1ccbac0e63071b2d7ca9ca9de | ORPH
   arceb     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/0f0d4e5835073959a8577c50a6672dec4daec071 | ORPH
   armeb     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/856f3d3e01f0c7cbb2617a20876cb3904544523b |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e93f8b0f6d26c34fe889e0e1f12b4cf84c0cd1bf |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/08d3e51a90ac4443b0b5a4e6bdde307b4315c650 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ce19e618e8a8f4c94bfe3b05c0c774abdcba40fd |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9e60a5bf2af9d66c47ba207c4f58c4fc0692c0ba |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e6163e3740a72e619810d53fdcd8ee4ed60b605d |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/41886bb656785023d6bb08cb48c754d125943532 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c061c3b041a221bd0050ab6eab09fe2b3d24bdee |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/18e005948de66786ead200c1a7df7bc1beedb9c6 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/751f3371293e5852324b57bb82712444406f4ec6 |     
   armeb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7e5ebe7dbb10ecf854227ac2d3345ff1d95aa9c4 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/beb122aa0fd802a3df897461e4af75418f03d539 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e16c76aa0ad1a4e9f00499d21a95ac824e9e2c2e |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/997961e2c377c8766e8f16bf4df2c6f6fe4e71ba |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/16802e81923e025db6295580d56dce4f4589084f |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a969b31f656207679b8cea2365109ffa59819221 |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e7185e60eeff54d1a119034e2d960fbc6411b38c |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cac4544aa55a937e918f074c7d86ba6e57478265 |     
    i586     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/13456f1c48cd46156ce8e3e7be17ab80d7820fcd |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/34fa53ef3aa55c46cefc39580a78f6eaf6dc93b3 |     
    sh4      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8586578ada474d524c2a57fabb5d06b2d6d95d87 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/5e66ab7c232511393ef551ef8fc1802c5ec5e7dc | ORPH
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ee4bc1880f41a30e5d6437625bebbf53e855afff |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/056a3a22f5b6ee89a9bd5dfec1dfd1e1c6283efb |     
microblazeel |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/5d7280652f493440a76dad52bd507cba643bc632 |     
  mips64el   |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/e05c7ad25f4e9b29c42cfda0ccb94c2c0d50d1e8 |     
   sparc     |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/297f576c5f15466bd0a98ba1069026746b787387 |     
  aarch64    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/658ace73425c93dfa34212564d19395c9018f3e6 |     
   xtensa    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/b572aa70f8dfa76eb9bb94c29d1d66c6370a1b18 |     
   sparc     |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/d7c8bb8bb91d7152d3bf8a0880018596efeb6422 |     
  mips64el   |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/bd1dc6f23392b8ffe7997233c667a06c29999e66 |     
    sh4a     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6a1e125e4788715c99fdc5a14fe6137d8988f566 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e62d6cbdf8dbbb00c4311f8888d0c2910d058c55 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4aebe30b863db43df5f6f8b4df35b0e309f7de2f |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/935a8c941b23492e43a069c995a0fbecd29decd9 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8fddd955c3f8883190698fa7825aa7c812266b4f |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/71d94012c46a25109dd47eb82f980cc0fae5791c |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/002774b82c5add1d2ee413f9f93b68330c9c7df5 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6e006c650b352f851ba2b9f723cb3b86c587aa6b |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4e735e8f9e4afc083b11794dcd28a6249219f880 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/b5d94a44c19ee9779eff3eff1e35df3fc1cb626e | ORPH
    i586     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/50d5a6cf88b1e5cb01420e801e51e6705e77c2aa |     
 microblaze  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/76f8deccc9c4eee29eddf42586cc28e96eec0827 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/879870c544b53262f51c78509218320c9244a52e |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/223e602904b9eca12339033b132206790f121c8d |     
    sh4      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/5aabe3fef9c2f641c6e23d12bd687d8a432c83af |     
  mips64el   |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/5a424478a7d397cdad4338add1f821bbd587d28e | ORPH
    arm      |         suricata-6.0.5         | NOK | http://autobuild.buildroot.net/results/4d5025577daeb781f07a5883bf2d736450fdc1ec |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/25d0e9f6803bcf6b79a6eceb01af04b172e6fb66 |     
    or1k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/45be1f94e17834538d21cc44545f55a634cf1201 |     
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/7a7992b1198728ed5e720c04788f7b03b950fb43 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/0f9df4647ae2e8304ea62275328fbf58c85d5ca2 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/4b29dffc9c30db69c58483efa4b215aa856b1391 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/0350227e0b79daf83673f326a934008947156693 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/e8f3d5aa4af46c9db4c129f344f7ba6d95306b30 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/656c477e97f74d422b8e380bcf4fdc3d341c032c |     
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a0afdbc9d5874cf27d744ecb2c4e3190f12377e2 | ORPH
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/56ac1a8fa5b34a9ca10eef98ae9fb090b8c762c4 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1974ed0044a1000a901745cdeb21f95f8ccc9ad9 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/dd25e2f2a66535d2c6e0dc8c8c0e251edbe6b83b | ORPH
 powerpc64   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/5e9bb4f9866d1e8403193f5d82538b8e6a4ec72d |     
   mipsel    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/48b3f302d6eda2afb74884fa80a36c91f6a566f7 |     
   arceb     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/bc672ad7fadccf05be71cbe4dc5daf53dabb1a40 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7a23bf138bc7f961c7f37c5c4c1ec65f4b75f3e3 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/eb60a60118300d7920a4ce4dbd8acad5938be23b |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0155dbaf8e42b5d2aab9de3095f109be9f40979c |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/376f07231e39fb190c67ee9f6b8af90a4513ff09 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c75e206d571d4c4b33ac391c588ffd95dee4d2fb |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/819815d6fb394f15ac80b739d2f52ac66d94b6ac |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/49e310b5aa3f72e366100fc889e961967eec9dd9 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/01279ddc4a6e18179ff13813b5d5f5c7cecac70f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e0f2a3286eea2909c0aa2b551de7dca3bcb37c24 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2015b70f875a987243cb19e0f5ae354c4ded97da |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/11c89cea717627ed8cefa296bdf67d7541e9cbc7 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/304fe63069f6365256251037d3252258506f307e |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9cf6060e2c42856ec14bd2d612e2872f3c92e013 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3a78f087f29590b8b6b94fe18f67667569dbd6da |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/75789540da6fb7d5300c90fadb1901c21460a0fd | ORPH
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ac6f1e2ae8fedfd95aa22e0f29800030934488da |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b29416b2edffe3bb167ff8365bfb1791496f6c81 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9523707bfd355ee7557da0247a666655ba659881 |     
   mipsel    |            xenomai             | NOK | http://autobuild.buildroot.net/results/fbaf20f30fe55cb1a6edf6aa74960864097f209c |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/026fa06f31de04471a45b573d5d6bcdc626bf420 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1c4de70474564eb335d0c2f55f6bdef357c956f6 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0d934bd2d0579c12688cb0b78555f43b6b120068 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/95cd1471a8207b1ad9354edd690200d5cbee55cf | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/561f20696a7e80804bd59a8ae2c86c6dae02172c | ORPH
   x86_64    |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/5f5ca36e0be6f9eb74788fbe90d6dce3b45d3c2e |     
 aarch64_be  |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/f0be5ec3c10eb8048987e9a21f2cf760814452da |     
    i686     |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/59be8bc7bcb3f84e475389b3d1350ea0dd7cc665 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

qt-webkit-kiosk-a7720e50f2b... | 1 
tvheadend-1295dd2be863f5beb... | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/29b65b2736900b5e1d3de0cbf77c07c5efedbbb7 |     
microblazeel | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/1f8834ccb1e18b7d522f55b59623e5989eeea662 |     
    arc      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/aa19dc55ae302f16dde6708870efdb2d10c57505 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8d3fcf5f1e17958f180ad279e704f86e8dbd51ab |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
