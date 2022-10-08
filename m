Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7BFC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Oct 2022 06:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D06BB41887;
	Sat,  8 Oct 2022 06:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D06BB41887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kze2v8yM4XZf; Sat,  8 Oct 2022 06:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 247D8417CE;
	Sat,  8 Oct 2022 06:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 247D8417CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F388F1BF5E6
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 06:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C38E28258A
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 06:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C38E28258A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zni6878S3kSl for <buildroot@lists.busybox.net>;
 Sat,  8 Oct 2022 06:34:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67BC78254D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67BC78254D
 for <buildroot@buildroot.org>; Sat,  8 Oct 2022 06:34:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 938BFC0007
 for <buildroot@buildroot.org>; Sat,  8 Oct 2022 06:34:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 08 Oct 2022 06:34:30 -0000
Message-Id: <20221008063436.C38E28258A@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665210870; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ImrsDGir9hCwnffap6CRVphfw47fN0dvrET8j7QPm7A=;
 b=niHwFuOKvr5QClDTogmbxBCWN14zOl7HXm026hnyMTey1WxG+mXfH1dnvg+WC7JwytEx4I
 TcC9LyGkivOzxiiSgHPcCm5FMhWc57PZ4t2oNRPAhp/R2y7sZCpwYwFHzbOW6H6qrr3nDg
 1+iMmHkrQvhBLY6IKOtqk6GbjuXDlhO0ghXbzevfplAMXWVMAVN1Q1VccKPRH7FaSmHSm/
 Rmo5DqRMTl+cED4fAM+c9alklkdSOV0jA74sQSB13WCmsmauwtnA+KmqpRiVOhkuXXA1qn
 HPaKtyWkUwzoRvXAayKSidHZVCq8ajII345MRROuMBg64y9gHrgK4AIulha/NQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=niHwFuOK
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-07
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

Autobuild statistics for 2022-10-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 12  |  2  |  0  | 14  |
  2022.05.x  | 19  | 11  |  0  | 30  |
  2022.08.x  | 14  | 10  |  0  | 24  |
    master   | 202 | 397 |  0  | 599 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-44-g2628500f5dff... | 21
        host-sentry-cli-1.59.0 | 20
                 sysvinit-2.99 | 18
                      crun-1.5 | 17
                 systemd-250.4 | 16
        host-f2fs-tools-1.15.0 | 15
            btrfs-progs-5.16.2 | 13
                  autofs-5.1.8 | 11
            igd2-for-linux-2.1 | 11
                     linux-6.0 | 11
  gobject-introspection-1.72.0 | 9 
                elfutils-0.186 | 8 
              libarchive-3.6.1 | 8 
            host-binutils-2.38 | 7 
               libglib2-2.72.3 | 7 
            ocf-linux-20120127 | 6 
                       unknown | 6 
                 dash-0.5.11.5 | 5 
         host-gcc-final-11.3.0 | 5 
                host-go-1.19.1 | 5 
              host-rust-1.64.0 | 5 
               linux-pam-1.5.2 | 5 
            ocf-linux-20171122 | 5 
host-pahole-73383b3a39afe86... | 4 
             batman-adv-2021.4 | 3 
casync-4ad9bcb94bc83ff36cfc... | 3 
               fftw-quad-3.3.8 | 3 
             fontconfig-2.13.1 | 3 
                gerbera-1.10.0 | 3 
                   hdparm-9.63 | 3 
               libcap-ng-0.8.3 | 3 
      linux-5.10.145-cip17-rt7 | 3 
              memcached-1.6.16 | 3 
              open62541-v1.3.3 | 3 
                   perl-5.34.1 | 3 
toolchain-external-codescap... | 3 
                wtfutil-0.41.0 | 3 
                  assimp-5.2.1 | 2 
azure-iot-sdk-c-LTS_07_2022... | 2 
                    brltty-6.4 | 2 
dahdi-linux-5c840cf43838e06... | 2 
                     efivar-38 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                     gmp-6.2.1 | 2 
         host-gcc-final-10.4.0 | 2 
                libglvnd-1.4.0 | 2 
              libostree-2022.5 | 2 
          linux-5.10.145-cip17 | 2 
                    musl-1.2.3 | 2 
               openpgm-5-3-128 | 2 
               tcf-agent-1.7.0 | 2 
                tealdeer-1.5.0 | 2 
               valgrind-3.19.0 | 2 
                 wolfssl-5.5.1 | 2 
                    zstd-1.5.2 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                 a10disp-0.6.1 | 1 
               acpica-20220331 | 1 
                  acpid-2.0.33 | 1 
android-tools-4.2.2+git2013... | 1 
                 augeas-1.12.0 | 1 
                  bcg729-1.1.1 | 1 
                  boost-1.80.0 | 1 
                  cjson-1.7.15 | 1 
                    dhcp-4.4.3 | 1 
              dropbear-2022.82 | 1 
               dvdauthor-0.7.2 | 1 
                  exempi-2.6.1 | 1 
             f2fs-tools-1.15.0 | 1 
                     file-5.41 | 1 
                   flann-1.9.1 | 1 
fs/cpio/cpio.mk:117: /tmp/i... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    gdal-3.5.1 | 1 
                  gensio-2.5.5 | 1 
          gitlab-runner-14.5.1 | 1 
                 glibmm-2.68.2 | 1 
google-breakpad-c85eb4a59b6... | 1 
hawktracer-2ec19d7192334414... | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
           host-python3-3.10.7 | 1 
               host-runc-1.1.4 | 1 
host-spirv-llvm-translator-... | 1 
          host-util-linux-2.38 | 1 
                   json-c-0.16 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                 lapack-3.10.1 | 1 
                libcurl-7.84.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                   libnss-3.83 | 1 
             libopenh264-2.2.0 | 1 
             libopenssl-1.1.1q | 1 
                   libqb-2.0.6 | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
          lttng-modules-2.13.1 | 1 
                    lxc-4.0.12 | 1 
                  matio-1.5.22 | 1 
                 mesa3d-22.1.6 | 1 
                mongodb-4.2.18 | 1 
         mxs-bootlets-10.12.01 | 1 
                  ndisc6-1.0.5 | 1 
                nodejs-16.17.1 | 1 
                  ntp-4.2.8p15 | 1 
               openblas-0.3.21 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/qt6/qt6base/qt6base... | 1 
                     php-8.1.9 | 1 
            python-ujson-5.2.0 | 1 
                python3-3.10.7 | 1 
            quickjs-2021-03-27 | 1 
                      rauc-1.8 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
rtl8723ds-76146e85847beb242... | 1 
sconeserver-8d1935919a20133... | 1 
                 sqlite-3.39.2 | 1 
             stress-ng-0.13.05 | 1 
                 sudo-1.9.11p2 | 1 
uclibc-ng-test-0844445e7358... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/bf5010120eac4c0f4702968ce637463cda643a73 |     
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e1951ff6fb915f66283814c01831fd612e37211f |     
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/85f0e19d1fd3c0840a1c8dc291e503e5e9b546e4 |     
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b5f0d5b3a7ea6503c5927453f38829005e82abe0 |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/421e971dcd40f5aa56910d46fb4f13f45e1c33c5 |     
   mips64    |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/550b4b9d4650a77d969413f3d83580978965c39b |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/3c88c9b4261a0d1484ae2fb7588bc508c852f4c7 | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/197999e8f63cfe79892153f69c8ebd48d1ac397b |     
   sh4aeb    |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/0d523af1fd58d09ed05cf6bdfbe6e0c5fea91b7b | ORPH
   mipsel    |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/24bf4d156a8967bcc721be977a94a7ab74114b04 | ORPH
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/6d8bca700b32cef4f67a73f6b6b24e93967f2593 | ORPH
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/364cc88b98f913f6cf3f44dedbe5626da0970a35 |     
   armeb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/afac24e4d3d2460684497a99e4cd6e99af4711f2 |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/5050a3e88d07f6c02c10d5874694bb7b924bdcfb |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2451c08a5636ea1bbd09df7571384d7fcbb62f7e |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a2cdab2993fae7466de1f084665fdcab3372197c |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/d66ceec325fe87330835e23a67aee41b8e4a0720 |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/3d0601e71e7b70946ec50ce82148b67883b87e87 |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/ef69f4dad4815141dd3cc618c91a7eecb5de876e |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/1d6cc97d21926fe7a979202e0b09295262f5f975 |     
  riscv32    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/aa2e8c97a39426fd4623b33902632af4f32d357f |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a6b5b3369d148bd05b37e840d0c4c3a8b4ae9487 |     
   xtensa    | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/be8ee4437c2dc498b56be7d6464cdd51ff8d77f0 |     
   mipsel    | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/f28f8754dcacd054ce99e27a7fd8bd19a68da3b6 |     
   sparc     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/0fae9c64db49e0c269d810c0bbdb3e3620f9a7da |     
powerpc64le  |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/cd84ad47e85ff462b2b5dc4a76412bbbe2362725 |     
   mips64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/020f7b5b7658585c4593fd3928683a53a210436f |     
  riscv64    |          bcg729-1.1.1          | NOK | http://autobuild.buildroot.net/results/1dada1972554bf805c3756994b0d5671410d8618 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/589828f093fca8583d23e5664a54553a159a36dd |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/e626c106bc0178f7ee7047fc97c25a6d08ee0710 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/b196f09b060a4841ae812d1ac31282657730455d |     
 microblaze  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a5d8e2fa23c7c2b5cd686364e9b57ad0fc3c4508 | ORPH
  mips64el   |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/8bb2698bb972b609669873261f81696404f52620 | ORPH
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/f799c0b446c8b84df3ee1778b9e6d5f75d8f85f1 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/986ccb1f141a38644788e8d53d5227fcff8cf4f9 | ORPH
   mips64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/c5197477083427174f2d73ffcb3e068d8c12661f | ORPH
    arc      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/4bbfca89090528496ebd6edf8a5c15848457029c | ORPH
   nios2     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/544514c1e0becb6ca6292aa5524ea40394e1cdd7 | ORPH
   sh4aeb    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/557ad252b25fc4d0dcc45383dd52c316cce13dab | ORPH
   nios2     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/1b9e96e06b2b798837b5448fc1d61d50ca494bc6 | ORPH
   x86_64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/3df8b483785c2b0dd00a23819bc3a3f04c8e373d | ORPH
   sh4eb     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/c6fa0f340e5ba9bbc0b6be6334f8a711bd3ee2b7 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/0ba373aef2ebbd824c577c23543e0316460cdafd | ORPH
   x86_64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/c308b73868999b4cc5d81b6389f13b42c9c49f11 | ORPH
microblazeel | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/1b4b8235149c647b477f522c99738fe80981d33e |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/545b6a5c28488d15cee3e5abf06f9fa369a7ca6c |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/0a3ee6b02d0ba13230ee5ceee5fa4ed960d37d26 |     
  riscv64    |          cjson-1.7.15          | NOK | http://autobuild.buildroot.net/results/cd983f96f1e80d3461fc620314c9ece5e062f38d |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8fad67739c18a3659df27ab778b90875d6a23516 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/611ca11ee4a7b86fcb76389fd3d9697dde8b5892 |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9c17f7c77afcefd04e53b965bf87629a590b10f8 |     
   sh4aeb    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/01f4dc8770b6b8d0f9c209a58e884c6d16b647f5 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8add1c37a6094108f637506588b4a3a08996b5a3 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d448abb6f3e6b1dca22cdb0196e21efacb87da9f |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5c4bc8f9d6584f591854072bcbe07377f06f59ba |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5b5abae01ddd40df9b13119afc6c2e722986cf27 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/dd56873131dc4a027be0a2739ff9c4b7ece16b75 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/20f9836f6e9c26d79ebb66460a6cd3316ae4ca39 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9f92c0a13fc5d4b68b302ebde26eb526f0f4c1ef |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2d4abb4f3755404cba72d36606bcc0337078ec97 |     
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8886d6bcc2782f1c9b7024f58678225c21627542 |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a25c4d83f4b7e31e78596bc697bd5baa0e4f4c59 |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7f452bfeef453b9f1138afda125a044ebd4f7e67 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a155dac73499f91d86fd1260790b46cc5b8a8d19 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7cb641997b291ceb24292e14c1de50f5a9d796b0 |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/cc57078f019771d816825dcebdbc9287175637ea |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3ca838db3a784026b8041ec9a5fc15b89cfd1b7e |     
    m68k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0343fdebc6bc77272c6d5c51d4026a8e1e87ba53 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/4c02deea65c4aeab3ef1d7f887389789ae051b35 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8509bd65ff728309a3c7d38e52f39a3ea97a0238 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2908eb59dd283dfb198d6720f92459d392a7e2ff | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f788bb556b6f97c6141a7c7ce657316604f9ec84 | ORPH
   sh4aeb    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/4feddd2ed34f6e8c0c1a4832fbcbab347e437783 | ORPH
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/ddd5e88f15d12a079a53b27891c1b2cdb20b3e8f |     
   sparc     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/6bafca2f1903ba9c8e06a28213ed4b6434aa5069 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/79bd2ff1ede0ac545d439f0134fd03b6c884bfe3 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/e24079373d1cf27057e2c2264c5e88a642aa324b |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/31cee9d705cc5c7e89aac71c62b33eb07b9525ca | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bf6c301571b4ec0c861cda70192c4cf3a69f6c21 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/70741d0e8e369ee6e4ebbe97e43dd21f07f3184c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/34e620c15e19bda26d2ffc8aee420fcec2dc2bb0 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7f3434fc41faa9c9ad7d2132324e8d5f4df5dc0d | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a7b1a906b25825049f33f06833b9d9c7cff4fc0a | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/51475f22ca39c9990eefc75d280622ba23a4922f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/06ff8e5ce8a8369c425bc3dce925ff49cba38b0c | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/e9d5e440102cf7aca3658fa62933f3acc3f31e45 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/34fd1d0a67ceef64fc51a06b03c768e6af1a23c4 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/a912e6a8e4f853e9d6b82203adbf809a32c7d059 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/53d0805a6cd431b90370d5eef5bc78c015f8c2c5 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/3b5e393133e5201e8a28fbd7b6edcd3f310582b2 | ORPH
   armeb     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/5873b40bbf1d31f63d45436117854df7b7d04046 | ORPH
    mips     |          flann-1.9.1           | NOK | http://autobuild.buildroot.net/results/cd5a4b1f8bf188dc797acbc25b28f0724e17f198 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/70e9c4ffef464e4c842a82677904719e423d3caa | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/3b98a0747c5e42774cc41f8c3ea44ecd84327a12 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/30814da3dda48fb042ebcfc013817c7d6f065ceb | ORPH
 microblaze  | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/cd8f9c883f6810b9468707a33f7fd45f304ee4ca |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/68169d9708e871d5c194ad817e788ec93435ddb1 |     
    i686     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/f2f7ef95c9841f738534dc2107f084f16dae5d5c |     
powerpc64le  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/87f27753bea1fd2f7483777331ed9fd7f716072e |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7bcba81ae984ac0267950a951ec1386e7864220a |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d8b0c5278dbee7e332c51887906a7b395c7a9862 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/845af223698c0f4cee97d27d9519fd8daeb9bae1 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0b34c470db40b87318021303bf467e6f15787352 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e7f8ccd7e1399f0f4e780ba7633964bb54cd492c |     
  powerpc    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/0cebcb314f2c04a83124255e560a9377227ed285 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/74b8dea50d861717335052121078dea7553b0878 |     
    or1k     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/acc161ddfe1edc50ba50361be7427b48c6e72bdb |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b624bedfe83a74b37727b35164f53c1f29c72517 |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cbc83e8fad4ddeba89b40f83845fdab34323a949 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c120b7181de47579aac512b9f7d2c3e5a86fb807 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/50b159096aef8b9ccdb87e8e3f95bffc9b69db68 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/00b702cbff8c9b094c9cb2a50c88048d2817c911 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ef53b62b2d94248c73156f33a03e1cd92797c691 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2045fab4c2da7a9b42cca936bd4ea8a59d75f811 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/51205f766deca4148bb5151554795a8e2db2a05c |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cd508576297b7bae4e5c2ccfc7b01f53c831d950 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/77247eff940e4dd4f0642c9d9dbc56eefb43df70 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1928e0642eedf01a5a709441e38880b4bed3504e |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7d12053c2a4db50ab5559d764dcc0dbe31862b7b |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1a7ad9772aaaaf4d044e3e2f28a6ea87a5a4a08f |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/32176c21d8faefa2824a2ee82569168fe2604c7e |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b3004a700e0ab15a1f42074c3be64b63da7ec25d |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/644feb1bfad95d8bbb39bcaa1f6382f965e39fdd |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/95a19a1f03a0912ffb16557b66ac0126ed46e551 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d221fe173ee155743e32b98bf05f7aebf1e26fec |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/10dcdb66e756fd4d8e7c77c504ae8357616c2c42 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9a45c545789028cb13c7e27e6630daff3487c543 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0c633bd7d3ef5a69927d3c93754cfe783d6d2181 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ae1d98b803bc2890ed9e8feba741bb5e10bc3c36 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e897d293e53fb2aad5232cb236b547dd43924848 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9722a67511e895a74d78ee8db051af8b39945192 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cc184ebe9d79f4ce7e1e47cccb62d6945b79381e |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/c6f22c12de8d08576f451d8951b385319b5040b8 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/6c24501f1fce84c6653855d392e682730888fc0f | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/a57ccffcbfce43518dd3f7fcad96260d7134a56d | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bf839cdb52fb36eb68c890e2127ef6d3052a4038 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/008b257738d8f97ddbc9948d5fe49c108aa0ea3d | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/64a54c4721d0553334b5e5fb84ed40b5059580c7 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/87a9fa520cc563a72aa0e58b5476dc8ca5063ef1 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/53ad6dc053dd8e50c4fe48b758e08c0e70048d37 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2714e1a99f2b0f3d69132b61d9da696d1eee44ed | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8589b19056f3d3cc5be3d595099e8e769997b60d | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ada53ddedb3949787d012d815fedf9b46b117f82 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f33caa077069d245821d58fb30959d705f839189 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/838b0b9ca8bf526ecbf14a3edee6d43a7dc790ca |     
    i686     | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/c356073750963a5998c0419c258e1a8846a9d6f0 |     
   s390x     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/d7df3789a9aec61d212144aad37271699426c0f4 |     
   s390x     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/23651f9197edc9bb08c054afdaf37385b934ca92 |     
   armeb     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/96d6f5f5bff6d9ee9600389c8f1c0348cd798bdd |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bc9b1a6f0af7503857d50a94bd1c91f4a2d775be |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d197145164c41549feb5954556b213ac3dccc7d8 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6eb3df8ece964d52f4c31f528e9c392d6ffb0d09 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2b237ac6b776d22efbf2a8dc350ce70f59790216 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ee768e8cb250ba9eef50d90522f78ce310fcf087 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/062b9c142238de7f839664b0e5334abd50bf5aa9 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c1a81184abcb6d975304194e70503e45dc7d69f5 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/17cd61c1ef1edfa2fa4e383e5a27ad0372331373 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1da3bdde35ec869d1e7bb1e84571c9a2a8f550d4 |     
  sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/7b8e8c8280cb9f78eb7e906fb83f50029c08ec16 |     
  powerpc    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/45e319116161d933570f73048f725345b5e8c7ce |     
  riscv64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/238dcff45bcb9ba41c48416c92ee6b89fce82663 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/84016a6ddea8082b3505118a7212a56617d4fefe |     
   mipsel    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1d8ef493e9e598d39768b19bca2ef639e6515015 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1acf3879bbc794153bb71ee05a60457e53d3cfe5 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/bcadece65f023a7094b239158f64b6c8bde4e5ff |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1b8126de7e02f6bc22d08b4a778022e6ea73bb3a |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/98bcb8c41c0182776ee4d396f030b6bdfb4a3032 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/64579724bf961e758c3b16826a9bf1439c56c6fc |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/89adc2fba42ce9adb6b8a3a6226c51e85d4c0b5a |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/23d0d972ba480c97ff141ac0931b2f547a828283 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d6b0d69cc7a708f24f82290f82426fe7f7956b36 |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a1e567c65ee7a39bc7b4039def94b5ae908b6d10 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/a710d3d57aba2faf004db3dccde413356b762444 |     
  riscv64    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/269a5d402fa945cc9054a8d2c8bf8e2a92e16084 |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a8c72e3d951258902c8e471be8fc107f57f1b724 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d0f89bf458e3d1bf93a60e1a8260c01c289fceb3 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2a38ca97af144e8f94f01aa1473524859a3e0ec5 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/be0f0173b7afcf0c6ef384dff0d0c5193f006710 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b306483aa4c71ea2cdd504070c041149b92e4e7a |     
   armeb     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/d4b456eda263fba50bef9c9e84d0662eccadc11c |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/09bec822b03770327baed077c7cca15f6e430dbb | ORPH
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/39558d541457f34775e19595eb689b1a0c138aaf |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1c0543df6eeeac8b897ffce5589eae47ca90a748 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/31f48f3a7f5448c9365679f08033124681b41fe8 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1b56337d3bc629c56df550c2edeffaa24ad96864 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f72b84aefe20c1a01b2a9e2307fd737a21b890fa |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/36cb60e5016cd40b685c2d5f51a003944bd2196b |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3c5f25bc848967297e2eb66b1539e5e0536bcb5b |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/501a6208580d1d7672ffbd060eb61fd20cd3084f |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a5b3b32a40a4f8135b620319ff63129430bda588 |     
  aarch64    |      host-python3-3.10.7       | NOK | http://autobuild.buildroot.net/results/8b7f5edbe96f1f41e7fe653e52ea8e0ad9045110 |     
  mips64el   |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/428b769b18e4b87e6d197709caf1a4f11ac686ae |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/0d923a3312157070c117464adc56b15d23cf62f6 |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/63a8e34b44a830c4135052caa3b6e571adc8cea1 |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/0fcaa47d16ff917b549ce6156db1ccb87b7d4e13 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/cd78f541564a119274b21e03ad7f5774e258b5e6 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/a3394795ad5d56337e33e09f29cdec1ea7cd5cf2 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f730e10d15eab108c958d8cf36225725f83b45b1 |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/29727070465f44b1747d45915c45bcf91b71ba18 |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/762f5b6b1244fd321133bee0e34deca53ef48d2a |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/81a2f8beca553f3fdab5cc7eba5e62440f92f641 |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8b9bd74bfba81d3d0567dcb8cb136f03b64ca77e |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7a1f661965c4268d502bbfd437891b6867a480fd |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/2036c091f6bb6a072d2e8e9d42c796c3c9149758 |     
   mips64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b5f6ec8b594b03e8f1e3d398ebc2f08b32c19d89 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/56a2ade0fa9b05536279af4a548edb1740d47b15 |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d469237d5108533c75594e8cfaf2a51d9559741c |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/ed502335322c61a138490de61ead0a39f369dbe7 |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7f78ffb7a6731e976e826b996941d2fa18216547 |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/94a6950cb659ba352ca4044d9f74639b1437b3ef |     
  aarch64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/20007fdd7343c783eaed3574fad747e21164f34b |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7cc6112b92d1a6cf6424836c7be929e79730b9d5 |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6b0c1d3aad56e66eae71af22cf017f4c613bfba8 |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6405f46818ae63054bec4cd245377064746e0e78 |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/1bd1994481b537415bf89dc42943b7067015cfac |     
  riscv64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/12e91668e67334b13465b5baa46853bb096284fd |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7a9c8a914fd76cb52910171fdb1e75e1032350ed |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/8ba164e8253e6a688c7c102f758e00d96ec03c09 | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/52664bfde4b73fd6e6d56b19a5df916c91b0f359 | ORPH
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/adbc27305550e6fc2f2450cd630675d4eae24cfd |     
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/0b7d87044d83e43e5b0e01f1f2b4f8d03d633b29 |     
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a30aae483bebb12b15332fc5b42d53ea406892f4 |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/cddb4dfc1cae9101f1b54e09bfdf5053379ac46f |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/24443a24116bbaafa47dd8880951a1b8395c7b1f |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/465c8648026545912e8b27d0ebdf2ec4b2fe5bb9 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/eb697e8a8e15cf3553571e767996ce2e8ccd3496 |     
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/489797c0c3f154456008b65a5418334d6a56f4d2 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c6168bf8d93661b693fcce0b9c57c83295ecb2f6 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8b12331319c2111718ca2a3e4eedab441310ca7d |     
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4cf9fe32b2c368c2c3bb579b06cdc89b9e4bbe68 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/f44007acf4463b5b11a1358baffa8393464354ae |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/a40f5aafd3baf648cdb0a7347925356045631569 |     
  riscv64    |         lapack-3.10.1          | NOK | http://autobuild.buildroot.net/results/122ce02350406d8c6aa692d81bd16cf09508dd91 |     
   armeb     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/aa46c9135561375edfa9a067dcccbeee80eb9384 |     
 microblaze  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/4b06cdb299f55c7c3fcf31502ecd59e3c2a911c3 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/dbaaf1d57f1bdc29bcc31b9ca184c69ea782b590 |     
microblazeel |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/e4fcc38eb122b63fcbe67d886e1d3ed2e8befa53 |     
microblazeel |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/dcb80bc9568b8f102726923c449088e5575383b7 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/4be479f881fa28691393ca33ffb09cb92e83cb44 |     
   mipsel    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/98948a0c73f755f6f1d5572b35eba60d6652395e |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1ac495dd97bd801da4640b36ddd4e1e6d0efed2d |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/b251046479f64fdc74f7fdbfd09bec90610ae6a3 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/13653bb18b83dd37c2bf64dd8ef2c961f9f261a0 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/4e14ecc579975b92a937bef6ed1c619a10fa4cbf |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/426031fa433bda4ee08f8cac71b3d8d4748b870f |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/98054853aeaf6205be9ce7a5b69461ee9ea8ca56 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/140f742613994672c369042cd64370018b70e454 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7e51509adc062c80121d36cbd040f7defd4ca772 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b40b53849a46d22a2fc57dcd1257065215d22cec |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b5bcfc440822d07b8cd11b30d5ad2f7c0be1c436 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9bcdceb572484f8a14ef50ad38f2a5b24f876fb6 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b20db550f713968d403a2840683218542753a445 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b556a0b89199986778bf26438901b1ea640c3f45 |     
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/960c98eba5606ba61f52477a6de1a266f037c020 | ORPH
    arm      |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/f523dbdab67c1db33632c9fcced6302d0563b5a3 | ORPH
   armeb     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/61e474d00a7de8fb1acff9ffdee768b7edba0925 |     
  mips64el   |       libopenh264-2.2.0        | NOK | http://autobuild.buildroot.net/results/33e39b33ac1499e66b21e99785e0026a8eab58ed |     
    or1k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/8386318c1c20ad5066fe90cad384331fc1296d5c |     
  aarch64    |        libostree-2022.5        | NOK | http://autobuild.buildroot.net/results/31715bf0a3724d07a74c5ede5d91bc3dc13190d7 |     
   mips64    |        libostree-2022.5        | NOK | http://autobuild.buildroot.net/results/6ed8ef43a37906a4d1e3675fed2a4defbcba883a |     
   arceb     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/48d69803ac3703898da5de0a27fb381b1c4ab7a4 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/f428fccbda0aad7e81a8f6a58f6deea04da68504 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/a5f040ce4fe5d0b1294e118bcae4e73418300cc6 |     
   sh4eb     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/a3b162613c19e9f4a0a895b278e9c98233c30990 | ORPH
   mips64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/3bf645a3cd198cfdd2657d2bb88e4f260dff5bcb | ORPH
microblazeel |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/8ac169dfb36fbf62a86b00afba6bd265c55e42d2 | ORPH
   arceb     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/6a7ba136817b7e43dff944ed34433a8afd7f4626 | ORPH
    i586     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/27c33fd3b73b3e267793a598aee5a94f0f79bbd9 | ORPH
 powerpc64   |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/bdf60e92a0469f89bdb6a24db6ace43517a946d0 | ORPH
   sh4aeb    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/14f11c085ece2148de93bee5103c34decbd3028d | ORPH
   nios2     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/bd1bed3fcc284b19a78dfc321c3ab1085961e55b | ORPH
   s390x     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/63dc74d21b1a7d14b520fc7ee50f6c7719136fbb | ORPH
    arm      |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/81bd3d3164bd32e8ba5cd0275cb0835b51f23f52 | ORPH
    i686     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/d7c2383515b0d9d45b3398e270da3ff2af922eb6 | ORPH
   armeb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/a92e0d7fefbfc3f800d1ab711d7834096a6aec5f | ORPH
    sh4      |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/c7df19ad9104d7173a7171aeb38b13feeaa4ed3c | ORPH
   mipsel    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/aeae7a6675e7877862a77412e7df8335b532d113 | ORPH
    arm      |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/151f1a4a7bb658a1b75251b1cd828d8fd78ec5bc | ORPH
   x86_64    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/c520606577bd7822ec733fdbd03b51a60d42ae2b | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/b4efabddcf8c4408c433b5cc043cbd3dcde92d28 | ORPH
   sparc     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/80ca504ec55ae2f38303376ee99a5824e45dd8ed | ORPH
   arceb     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/568e34f2f696af9595cac358026cef399378dc8c | ORPH
   mips64    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/9e304354471f866e8016d472ccc4aa95ad703905 | ORPH
   sparc     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/2690b22bbf2a83025689094027814f1d0dbe98e7 | ORPH
  riscv64    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/b04cd2c0aeea419096ee233ae8568361d690230a | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/aa4daf3d6126570d2ec7cdd5fd3b5aac4bbbe55a | ORPH
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/7645948fe9cec15b6f510b1521bdb3db2247a77b |     
 powerpc64   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/2a6544a5d789fcf75a0c7a96f0cfa69760d0f1d6 |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/53ba7a9fc655b135e33974f9a2dc0fd1ebfaca5d |     
  aarch64    |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/5d24d2bfa7ede5a756ab6e0b9ceae59f9387f86a | ORPH
microblazeel |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/fc55703a70be76c46800c1942028a292c9c30912 | ORPH
    or1k     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/9f6e28cbc448a683e42869e10d6ea6679146d3ed | ORPH
   mips64    |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/56ce9ac1aabae2d15df1dd26dbcd2f4fb0c366ec |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/173ee60cee40a02f3ff8bc7f53d366d2a7555989 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/06217a1bae3893f16c210254be190d001b4cf1d1 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/b03f52fb470511afab545848c042c8778672cd3f |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/4ba4bb3d671d5eeceef1299ceee91b8b51b5352f | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/edad6a0f467a54c6bdb5da19c6deec69f10d974a | ORPH
    arm      |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/168c5785f14a2f8777e79f1ab1b74a25fb48ddbf |     
   sh4eb     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/66990d287d6c007b9961e1c2f673ef3e4969b3d0 | ORPH
    i686     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/115bcfd6d2dd8af8b872f9fb3406e393a13e6833 | ORPH
  riscv32    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/de7b6147fd6525d45234a84f16fac6997f91f322 | ORPH
    or1k     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/f644ae349ac7b9a87c6d6a23816da16124a84230 | ORPH
 powerpc64   |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/0779b59e58aafd0e4f1a3a60d7e3f9941312a18a | ORPH
 powerpc64   |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/5b541874d2536aab3d3f69774019b5e201470d57 | ORPH
 powerpc64   |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/3233230c7154692c16ec19dd4435426ce30f1b0f | ORPH
   sh4eb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/0f40a7594320cc7c9a6613c10fe1b30f3558c816 | ORPH
  riscv32    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ac981fa73cf67c2fa5b3a47a29efada9687e4c9f | ORPH
  riscv32    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ad9a2d27ae3b3658a38edf9f8af49f1385e16c6a | ORPH
    arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/79ea197ba3c35c1a8e838bcbaa04e47ac67ee5ec | ORPH
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/123a943ce6c8ff9bab1f79aca9830c1030d488d5 | ORPH
  mips64el   |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/8065094d6401fceb5154d3054a00a3a401c5b844 | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/d4297cc16c65e789dec54cbef974821fda84a08e | ORPH
  mips64el   |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/43adb005f0c041a51ecd41d0de683f9880b93e82 | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/366c0b059c0ebec280cae2adaae4fb47279fe641 | ORPH
    sh4      |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/7b060760505f529b3ba827cc314d1f7bf9e98fe3 |     
  powerpc    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/775d5969082d8f3dfa6a5f8ed78691be00cc1485 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/7ac6bba222f3170ea19948f1d13acd8c5dcee4e8 |     
    mips     | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/56f9d33deac3739447429d04a56e00a2a8192782 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/68efe540a54475c6e8054fa426b23553ecd39022 |     
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/fee079dd938b17d13afba5a8b78d3c929a4861fd |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3bd6379618871c770eb1c2d91fbb1f10f8ecb7bc |     
microblazeel |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/099e5dc008a2505b71ce687459162065a51b590b |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/1ac7961cb00389dc9341d3ab3abfb6b482eb4428 |     
   arceb     |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/feda937dbb1401355662a806299a4ff40c9dc93f |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/fc822694b5eb54c0ed181dd5dc0f93ab2286ac47 |     
    i586     |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/682ea68d426a05371cd48b9c5acfda1081d5f0d0 |     
powerpc64le  | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/9e21bcaafe903391e6c0fe6f149e30f158620b9f |     
microblazeel | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/ab5134e68c1df0ebaca930860d21c1bd15d7e49f |     
   sparc     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/e440b4b221d54a8bb536930927954711be4cffd0 |     
    sh4a     |         sqlite-3.39.2          | NOK | http://autobuild.buildroot.net/results/999b4284a5a2652f77047aa91fef33afbd6a3325 |     
   s390x     |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/e5278a93c47460cdf6f45d50305e4dd0dd4db65b |     
   arceb     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/8bafd86876e4ea56dd9afbb02fc763261efb0c8c | ORPH
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9ee72675f9b9974d51da06b138b8265f904182b5 |     
  riscv32    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/89424754af09047e3b45c7ae88f5b4568d7be3b7 |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/0f530490e8f211b6fd570a8468e1213a7098cb78 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5340cc36ad17cb3aa21fbab110e43e71108aa5d6 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6d21146f0a92c07436e1505dafbe906ceac21d5b |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/972ba5d706a38bbc602d1161b5e3d61cb4da0d23 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a4f952b22063de181aef6922ea21abd6d326c644 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/4f10d9095eebd707f3b1c22eb9cb5d37dec05667 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/789090a8ef3689185446a3f7f5b74f55ecd9f7ec |     
    sh4a     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/75484f1334b91791e76a95b810fa2080957f52ea |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/e666fbf866bef8251736c4a41f57382b4f52a0ec |     
   sh4aeb    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/37b96267ceff449780a17c6d580480b5c28d4151 |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/bd4af665459a2d55dd8fdb9235773c25f8cb976d |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/108dddd015629cf7b03f434bf00fec52813c32d7 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/53161cde33cdc8c40a5d34e0b11724fee9889fd6 |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f3de9fd9a53260c88b8a5deec5368692a462a23f |     
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/96b5581d8558753081d263f5c683bed211482587 | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a4372edb3be1850f955c84671724b6bb0a8951ef | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/24a65cdfefc71bce29a9dca32668de699489a80b | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8707cb8ebe3621f02bedfdac82565a2b216cc369 | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/60c861f7a0afac1f51480812483faa0c7ae9a8b8 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8d76fce85c82407fa44a5c8860e1418ff5b380fc | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8584697c220502f74239094ffdc9912c45b2919c | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f7eb722e54447c6a0b839efa29473caf1afed737 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f70f4ca90fe39fa1112348730766f9235fddb34e | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/c24f3817cecf6281d537dd042233e37b620f7444 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9d0bf990f58245751113db49e4bfd4ce2cc38655 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a1c9ddf5ca27c6041719218ece5e483391ac7490 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8fe68bd01894e374ed93e743ec44964fd173b23a | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/c338c46d376960bb0fb147800d2ef26ca3d28888 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9a0ca76a692ed2e3f3159ccb642e3c846551e69e | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/b8d8b4fdb04ea2e5613afb43fce0538009842c69 | ORPH
    sh4a     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/7de423c059664041f3db6027db67e766a239f583 | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9e5cd132db83172d1ab9d7b1cd7935f02a96e343 | ORPH
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/8ef48217ae8dbf486faf38101217bbd171d69425 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/f73bc79523fc1a51548719c6697bb43869f7a755 |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/676dc2813f2e39572f496e2fb5a547d8a760a5e9 |     
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/4ce788068aa4a36cbedd6843b7c89abdf42c5d21 |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/b1f822fd1ea93b76850d42fc88477ad29bf6ffb4 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/67ea21b7d8e0977d5672e2f62c4875c628e0517f | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/8a81af234493985a84f811319aa3bfa3a6d0b8ad | ORPH
   mips64    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/be8b917109601f4184cf2787dfc13282f336a174 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/51576c9463deade1debc123c786368c24750f01e |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/78ba9c4a4e524857834f463398371ba18fc49ee6 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/cc6e142b99bec1354f2ee4d4cd0a2c93d3ab7d59 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/bdd60233019fb6386f0608f7e893d69514385ae3 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/2ccbaa767c965b1a258af8f050075ba945edac83 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6a4324ee25e235cc33149dd45d1e36113032f08b |     
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/38126e3e76573791af11475b31faadac42d20dbd | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/ee5846cd9673efb11a4eca9dfbc281ed648041f8 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/41bbcd61fcbce14cfbb27e530a19faa79a54a05c | ORPH
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9098b6348b737248de96a1a5e9703a044b988fc0 | ORPH
   armeb     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/724bb26531263a2591f4af43d1039f342d37aaf9 |     
    mips     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/85864e8b05551e6b2e7d5bbfa0b422ed2b52dcab |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/1cc77131f8b6f6651c43879e4385cd3ba272e9d8 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/e295ae11d40974195f8e493414919de93b6f4d8c |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/b312a91b70f25d40bf564bc7b20e777cd2f32a58 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c756367c7db809df7f40fa1dda7fa3d557b276c2 |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/cfc35a11c6ea28bc6ad75771f2b9be5c9811c821 | ORPH
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/6ab941b5a5d825ec0e6cb6dd6657d88bbb3563f5 |     
    sh4a     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/d1eded87587f03c2ac591d80b278024b0cf49ca7 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/92d29db54940348a3f818712e3bd4097f6eb5a93 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/425c3364da33835c6c59f4a5efb923866fc4beec |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/aa09c810ff96df5513369af1ae9f98c2ba42b178 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

libcamera-1966b9a58436fab51... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | libcamera-1966b9a58436fab51... | NOK | http://autobuild.buildroot.net/results/46254b0523fb8ae41462ae7327db844b414479f8 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/056577b3a956fe8a9163eb65385ca9bb9116d697 | ORPH


Classification of failures by reason for 2022.05.x
--------------------------------------------------

          host-elf2flt-2021.08 | 2 
              host-rust-1.60.0 | 2 
                       unknown | 2 
                xenomai-custom | 2 
                  ffmpeg-4.4.2 | 1 
host-pahole-73383b3a39afe86... | 1 
            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/cfe9acb744b9ce1a2fd84e85a456c2fc812b7f0e |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/29605a8e21437df8715330e9a382738f4ba7f355 | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/c096b276884826366f0da923134fa4b7b7138aa9 | ORPH
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9d94bb73102292cdbc6876f344d459c215cdfd27 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/2e8a089b99280672ef6f1db7423359a6ccd44472 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/a77e5477b44d3421c2ba5346fd43b03671640be9 |     
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/89732b432d7743adf158bf7a59b054176a7a70ec |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/90e5b7876c367f4e21671dc2bc1e4ed25b6ed032 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/84fc599197daf3e590bc2cd94eadc98b0ebfd4be |     
    mips     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/116f995954cb2b543e73cb03896fa41628cfd7a1 |     
    mips     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/ce47c34825decfa41ee63064c93f8e6b6f2f81f4 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 
                 dc3dd-7.2.641 | 1 
             fontconfig-2.13.1 | 1 
                gerbera-1.10.0 | 1 
                host-go-1.18.6 | 1 
host-pahole-73383b3a39afe86... | 1 
               ipmitool-1.8.18 | 1 
                 pixman-0.40.0 | 1 
                     vdr-2.6.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a5f528301ac2d3e452b94a697786ab8c4477b74c | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/92e9a178fdde030f5f94099f8346e9e9ac2ae520 | ORPH
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ea013346ac183afd34f96aa010158c39245cac7d |     
  aarch64    |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/6df50bf74e8c6442ca49db691b20c9fbe647ec02 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9207c2ed9871e5582e173165536d05e787d51daa |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/321ff3420cb464aecc419fd3d096e7756683e770 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6b30d94c1eea3511d35128e460a2d7cdfecb883f |     
    or1k     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/30efa8281e802f3ebf53b41f6a7344afdfa7b4b3 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f7ace0397d5f6132a4f63e11387c3db3d89d213a |     
    arm      |           vdr-2.6.1            | NOK | http://autobuild.buildroot.net/results/65c4f5f7149d403272bd91941ed6b4f39ed4b76a |     


Gitlab CI results for 2022-10-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229619  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229644  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229691  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229694  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229698  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229701  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229706  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229709  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229710  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229712  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229713  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229715  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229721  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229762  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229782  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229783  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229784  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229785  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229786  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229787  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229788  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229789  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229791  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229803  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229828  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229829  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229837  | ORPH 
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229839  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229841  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229843  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229845  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229846  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229862  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229863  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229864  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229865  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229866  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229867  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229883  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229886  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229887  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229890  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229891  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229893  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229894  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229900  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229902  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229903  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229906  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229917  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229956  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229959  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229973  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229960  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229961  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229962  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229966  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229965  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229968  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229972  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229970  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229977  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229975  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229978  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229981  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229982  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229983  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229984  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229992  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229994  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229996  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229998  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229999  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230005  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230006  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230007  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230008  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230009  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230010  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230011  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230012  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230013  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230014  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230015  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230016  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230017  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230018  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230019  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230020  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230021  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230022  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230024  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230025  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230027  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230029  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230030  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230031  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230032  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
