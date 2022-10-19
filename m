Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4612C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 05:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BF9B40C2B;
	Wed, 19 Oct 2022 05:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BF9B40C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0TQjccP9aqG; Wed, 19 Oct 2022 05:41:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2096404ED;
	Wed, 19 Oct 2022 05:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2096404ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6AE1BF330
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 05:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D129F41BB4
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 05:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D129F41BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rLqugYOuzuV for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 05:41:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B972041BA5
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B972041BA5
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 05:41:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F063F10000E
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 05:41:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 05:41:10 -0000
Message-Id: <20221019054117.D129F41BB4@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1666158071; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3JYkJuAgP+LbDceT11K/r5zOJzSpuWs6pLZHomcqqNY=;
 b=UU9uk5R6PXIFLYSNfrppU3b8uSVjbA9HUWsHHQ8mB6rmxwmGtnwqm8TwNkuPcYP0ib/wgp
 xtHFaMw4K+vSv6FobvUj7feCdWRrMnN0LYtYAlOSi34HtGNqSuHFH5K2jyBxzHdc72mgOU
 pEojdY2dqf8jfBnk9/tx6ZkfExbUo8lE4Yl68NczwAGd0d7jGMNxdhvlAaxOl2Z0+Kocck
 El0qiHOMyLP6+qRiyvBkR5loB+fiySHJPIOoCv99tZtTtW0xDhUs+g/B4x9EVcM1SXeXaV
 zrrlnZHHKeqlUm42yp3gzpBcCL3wYQThb5bgPlcjbhIYYfBcequqn4DtAfcBGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UU9uk5R6
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-18
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

Autobuild statistics for 2022-10-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  0  |  0  |  7  |
  2022.08.x  | 14  | 19  |  1  | 34  |
    master   | 151 | 341 | 12  | 504 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 18
glibc-2.36-44-g2628500f5dff... | 17
        host-sentry-cli-1.59.0 | 16
        host-f2fs-tools-1.15.0 | 15
                   linux-6.0.1 | 14
                        brltty | 12
                 sysvinit-2.99 | 11
                  autofs-5.1.8 | 10
                      crun-1.5 | 10
         host-gcc-final-11.3.0 | 10
host-pahole-73383b3a39afe86... | 10
                 systemd-250.4 | 10
                      xz-5.2.7 | 10
            igd2-for-linux-2.1 | 9 
            btrfs-progs-5.16.2 | 8 
               libglib2-2.72.3 | 8 
casync-4ad9bcb94bc83ff36cfc... | 6 
                     efivar-38 | 6 
                 dash-0.5.11.5 | 5 
            host-binutils-2.38 | 5 
              libarchive-3.6.1 | 5 
                  assimp-5.2.5 | 4 
                gerbera-1.10.0 | 4 
                host-go-1.19.1 | 4 
                linuxptp-3.1.1 | 4 
                       unknown | 4 
             batman-adv-2021.4 | 3 
                elfutils-0.186 | 3 
            host-binutils-2.37 | 3 
            host-binutils-2.39 | 3 
             libgpg-error-1.45 | 3 
          linux-5.10.145-cip17 | 3 
            ocf-linux-20171122 | 3 
                   perl-5.34.1 | 3 
                xenomai-3.0.10 | 3 
                  cairo-1.16.0 | 2 
  gobject-introspection-1.72.0 | 2 
         host-gcc-final-10.4.0 | 2 
       host-gcc-initial-12.2.0 | 2 
               libcap-ng-0.8.3 | 2 
               libmdbx-0.11.12 | 2 
               linux-pam-1.5.2 | 2 
                    lxc-4.0.12 | 2 
                 mesa3d-22.1.6 | 2 
                usbguard-1.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                 a10disp-0.6.1 | 1 
                  acpid-2.0.33 | 1 
              alsa-lib-1.2.7.2 | 1 
                apparmor-3.0.4 | 1 
                    attr-2.5.1 | 1 
                 augeas-1.12.0 | 1 
                    brltty-6.5 | 1 
            cppcms-2.0.0-beta2 | 1 
          cryptodev-linux-1.12 | 1 
              e2fsprogs-1.46.5 | 1 
                     exim-4.96 | 1 
                 fdk-aac-2.0.2 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-server-3.2.0 | 1 
                     frr-8.3.1 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /tmp/i... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                  gensio-2.5.5 | 1 
                gesftpserver-2 | 1 
                       gsl-2.6 | 1 
       gst1-plugins-bad-1.20.4 | 1 
gummiboot-2bcd919c681c952eb... | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-10.4.0 | 1 
       host-gcc-initial-11.3.0 | 1 
              host-rust-1.64.0 | 1 
                  jack2-1.9.20 | 1 
                       kmod-29 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                libcurl-7.84.0 | 1 
               libdcadec-0.2.0 | 1 
libdill-32d0e8b733416208e04... | 1 
              libgcrypt-1.10.1 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
              memcached-1.6.16 | 1 
                mongodb-4.2.18 | 1 
                     mtd-2.1.3 | 1 
                    musl-1.2.3 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
                    ocrad-0.28 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/openssh/openssh.mk:... | 1 
                 pango-1.50.10 | 1 
          perl-net-ssleay-1.85 | 1 
                    php-8.1.11 | 1 
              procps-ng-3.3.17 | 1 
                     pv-1.6.20 | 1 
                python3-3.10.7 | 1 
                    qemu-7.1.0 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
                  scrypt-1.3.1 | 1 
                sysklogd-2.4.4 | 1 
                tealdeer-1.5.0 | 1 
toolchain-external-codesour... | 1 
              traceroute-2.1.0 | 1 
           uboot-tools-2021.07 | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.1 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/34d18fd284627bdb593fb7d833be0666f0520800 |     
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/14315c1045e8779cff10a004eb72acf3d5d14e0d |     
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/700177e585c52ab85ce1f2d3fb28b015f91a9d7c |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/0d3657f11b6f8997d9feccfc9d6c28a9c445a0bc |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/418bf0b1e012208f6838767d4b2becd51b86e8a9 | ORPH
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/f57f70122535f725c66a835abb6925665e444797 |     
   arceb     |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/a0569f11c31642625edf56856ca4a473183c63bb |     
    sh4a     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/90acbc0ac1704b7f51dbdbd7061201a85537c8ba | ORPH
   nios2     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/9f77387212f680bbd826cf7985f41c3d16bc56c4 | ORPH
    arm      |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/785376f863ecd19e622cac5e2f5dbc60cb38a807 | ORPH
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/04f402f29b94a6e30b17956950fb4794151ab5cd | ORPH
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/b4e2146a1b5adfb87094565779c1a9692becd129 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/b870bc8c6093aeff98579b3a62139c131da2ab94 | ORPH
   sh4eb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/28336bf79f5191fc78f67a59311024838df3c853 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/188fbddffc6802c445e2a4eae9e83b0b5a40db06 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/be60a4d35b35307e67ef8a0c0421b3fe196e3e97 |     
  riscv64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/6c7d3f65e798787c858851fd3d4037ef707aa92b |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/3550c4a4cb3a86ee823c8b95b3e7152d82f66ae7 |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a630be428abcef270b4a59a9bb6994ca29d6b670 |     
  riscv64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2b8639ad906b5c6078efb3fa6d908cc9775d1ef2 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/ea885421a5a03acb9a1f62b545b8cb654c659e27 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/623b2c63466c8485e9f0d2e0a8e77ef50f0692b3 |     
   sh4eb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/cfd4229c3ea6397c395d86961e47ccce1f602f59 |     
  riscv32    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/93fc048c8f2ba1c78dcfcef89d2c0940fc0dd19f |     
  mips64el   |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/4ebe1c17d8284237a26370b0593be0dbbfeae14c |     
   x86_64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/4fc407e56c99b23225cf4fe5f9c21913c51f3072 |     
    mips     |             brltty             | TIM | http://autobuild.buildroot.net/results/2302771d580a2ae1965993b000504dac2a33db13 |     
    arm      |             brltty             | TIM | http://autobuild.buildroot.net/results/32829a4ee398444a414b72f11daeaf585e638e62 |     
    arc      |             brltty             | TIM | http://autobuild.buildroot.net/results/44df7848aacf43e9da7337f73ccfcf5ae0b79e67 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/f042cc115659339bda2da446def7d1e8c6ca7257 |     
   mips64    |             brltty             | TIM | http://autobuild.buildroot.net/results/d3190ac8d39ea0f1a7ef3cfbc5a237430ee194c8 |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/6116b05c4f27399fb491abe5c06ef77a414cce57 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/2ca9de7e1d36457d6a05357120ba356684e1245b |     
   nios2     |             brltty             | TIM | http://autobuild.buildroot.net/results/b02b45dd7a6c7a47a2246fcf0b257b618cb30424 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/5a69b8562fca8227e77dc0d4ca4fc8ee9537f658 |     
   x86_64    |             brltty             | TIM | http://autobuild.buildroot.net/results/a3c3f42b72b540920873cf233b5adfdd5f965059 |     
   s390x     |             brltty             | TIM | http://autobuild.buildroot.net/results/0b0a1cc22051abf1e577e8710bd6d4bdb2decee6 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/c9df3f49688b2034e8f63cbfbed25f45b302d06e |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/45eb39e88798ca297aaa41dd9cb09afa6e7a201a |     
  mips64el   |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e9662b9d3f7918c29201bd6006095e0003769e93 | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/6e3f58188333677918ff23fa26950203bcbcf17b | ORPH
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/097fb3c82be2817a6f128986cf86004d2ab1bcd6 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/6697e5b21801d197ddcfbcb5cdb42cb62ac57608 | ORPH
 microblaze  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/2af4e5cd527d7deb0d03a59973571f0247db8bdf | ORPH
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/42cb775a9f921091b11dbac3bd8d1e525da700ac | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/ff9576129b0acc3b1a6a13ad8d599c83998a1912 | ORPH
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e8c0441d28478c613f3cd2a856098fa96f813945 | ORPH
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/bb0827eda406cf973a6c2c17669813285407b667 |     
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/57bf6a6f92f28d54e0c71d0353526e7533a58d4f |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5521e13b3dee3f16d5ab64a658616ee69f002635 |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/15dde583da654f38ab24bdc0f2364ec546365574 |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/8671225998ba47f90ea3e01a10830c61bdbf5d9e |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4c0a4a4cfb576448463795fd8f60739ceceefe11 |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/ce8b6b89781196c89eaf5c9014157240558c6e88 |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/e69c9b374203f375226ab719bc9f3e5642f1bd29 |     
    or1k     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/00bc902f9e93dcd94d7f4b0573ec41da132835ba | ORPH
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/72d35382b9af437f63f9b22a42b31aa20b0016a4 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4b1ac8aec00c044d1ecba1795edca94a97519197 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/65ad72518ff469a9b0a939f1d68f7aa43def0ccf |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c17d2a21a05517036be3197be8e6574ebc323b5d |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ee79feb6ec4564b91880c91eaa77c194ed001c2e |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e228bdc8c275403bcf1c404f6c27808615cec27e |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/81f9e76fadc44596d37f9b8e109989336d98c3ba |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a789b3ffa7f90fa24695015317562695acad5d29 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/88adfc26d948bdea3997125e31d7bd65eec5e3c3 |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ba610af39eec8067aa17abf7ea983099d68c4a54 |     
   mipsel    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/bb73a973a03348644cd847aef9d0137e8c065baf | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/66cca6852e924dfe4138997271b5663ef2457051 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/938a1e425d91ab69e1b1ff69fb15a2776959e07e | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/40b905955e7548f43dc61e09972a44cdc5d28084 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/85e072c4f105a25d987e874286bbf0139a163004 | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/eefbc09173d8363a4fea289d12e4f4e89cd2a47a | ORPH
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/69168ddfa9edd3ef78c74ced61940e6b79e9ec78 | ORPH
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/856d2ef018090c564b53b79e14e3b0a74492a6b2 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/177797c29829b63b0ea33591850c4f2cf3e47fa9 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/b826a0c7815b4589780659251f83a507da491c06 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/ce31ea71f04fef3f263e72e7b1cac86367b2b248 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/900eabc70a88ef0514917b9c91c9e06436e22250 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/8a4113ec94301dcdf6654b9a9ea7c21229c48df1 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8f0356f82a27c78e7eefd9775648e04d245e6518 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/534825288c912dc8aeaac3310c86819a5e3a67da | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/55c1aeb20ef60910db0818abdff122c7966d1c76 | ORPH
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/31af7179d01f68888e75b92fae359fc7d8cc5afe |     
    arm      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/8df59c82591412248da2596ce51b1b852c24d588 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/bc8770486dcd560a56abfaf2f19770eed1dc2823 | ORPH
microblazeel |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/0330d42bab234ff613a85df7e3747844d10708c2 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/ed053af5e995c2ce2ca34a172d939abc63caece0 |     
   mips64    | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/3776adfeef0a721d7e7dda954fdd5369b68ffab5 |     
   mips64    | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/2af6801cd9610d8f9a47852348970ef3b8fbe7ca |     
   x86_64    | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/28e95f5c537f561337bf7f22fa45fab239ccb776 |     
   xtensa    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/217c042c9e08bbf9ce714a6f19895b5552742632 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5f43787e45216b4950e3e3e197ffdc05a47f6a75 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8ac7be703435af21e9c0e4f9410d79d7ca3a1820 |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/d16a735c77fa23e5dc59bc2b2b0ed669a78caae1 |     
    or1k     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/0501474851f011d18dcfd92ab9895ba247418572 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9eb3ad8c04b77b6d5e48b03649d84b1df990639b |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/aa941983a7ffc240b219d20622c6a1442a227171 |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/57c5db58acfffaef3a3b9bcc2b780bcedb1988e2 |     
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e454a30a607322c706a8218bbb1a544972f2c6cf |     
    arm      |         gesftpserver-2         | NOK | http://autobuild.buildroot.net/results/2795213c07c4a961cee0ae7a4e7cccb8bcd6f68e | ORPH
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ee3337566150f1d3d90f011bf0a5e0db9eb75637 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/77d47a0c2ba7e91508fb9945328f68b4d61b8374 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/02cb1cd2683f2bbdcd37cac98bae2493b3211d11 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/08ced72efcaccefc68b7c34bdd52f43e490ee12a |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cd06577e10e1d0d2a9017335f1f97437252b4ab1 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/39de331cfc3338feda5234b706b359cbc06c917b |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/de1f7c94466c06e56ca902bccc42e310377e2ad9 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7a144107556d784fc9f6cde29c1631db5cec15fb |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/af6373b9d2f3230ef5042241a533903e293bb3e6 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7ba9ad9a31c42a179ad7551e17aab5c9db2c95b0 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/519d616b18b2c111efb0d6c33544dcd667f6076b |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/38954f19fed10838b9f0f5c638d94f2f6cd1b6ba |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c598c81a366135f0fa6bff97e3c601769861de51 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/200cf19cfbb125bd46c2433a72e6c335a073daea |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5cafa792a55f794713ae011f2b5c009b82de6dc8 |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2f2e464ccb8b329bef5449ec0d4ca1fee3e2fcb7 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dbf6a71d9d5c0ba164b78300edf4f9fe608e03ee |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/671a7f791f81bec7338453e15b7af04d80a0648c | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4a524f21898ce0ed4f54f55454581535353cd718 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/1427fc76926c65a92d135f246eb3116f7801be96 | ORPH
  riscv32    |    gst1-plugins-bad-1.20.4     | NOK | http://autobuild.buildroot.net/results/9db614deede389c49f66c742e60c5a04b90d304e | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/ce0dadc77c874ad4de64c7b71fc9a668c3c226b1 |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/084ace7677d7ab3abe17f3fe0819449d42ee8a79 |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9ffdef1beed12e9baa383918bb5eb220cbc6e2aa |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7f720f946137277ccbb18833c31b8f33126c0c1d |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3e865de7f17a4833915b8231cc7fea6fd26f8218 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5207eb10cca89ba5752f5d4b846bf93a7d67fee6 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0b4dfa1b5802940fb410900a2200509528e20e57 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5dd829f9e387943254773d5fb75c2ce8c629717f |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/05d599d76829a25ee7aea0793fa1cca2740b2a9c |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d054b1bc46eb11fb92d9578846e2db8dfadf5adc |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e66505dba84125f164dbac59c93846857216e983 |     
  riscv32    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/daaca7d2ba559a5b4a51e9f273ff4cb45670ca78 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/b42ed204b10cdfa5ecbafe661426d22e6adaacba |     
  aarch64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/17437dc7c33d4a52579f8841f9e713aff62573b9 |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/73553950eae577e084a9ccccbf21afce480a9c2d |     
  sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a4932e0cc67a685af1a37030666f8ecbe7785566 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d9fd668afd97b8394160f9199e5cb63b05bdf757 |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d8804e1dd9d3f873b8a8efbd9784c75c45d91de7 |     
    i686     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a91534ac3e06f02cb88d61395464df2510267db5 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/757e1026faf6a5d96e9f495c75b4f8f19775d2ba |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/c902b83facef09442d9cb058a744753c2b5801b5 |     
  sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/304c1e5196e175ecc09924e6893c17cc1d96ec8a |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e3c4932a7f84a593274df3fed2e09b06657215b6 |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d408b4171c0f9a056aa2d38c97563e7e25b44d00 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/68bb66d124dab3ebc8c1649c699357821d414c86 |     
    m68k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/dd90ed14eae2500b9bc769e883f5c15734072111 |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0e55f4b07bf2ebc0eeeddb68bb9b0a345b9b1660 |     
   nios2     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/bec76a3d8ac9441f5c40f420eb8ddfd08ad6031b |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/5bcefdb6bcd96a602337255c4b0dfc5dd14e4ad3 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/1fbd39a9f6437c7f00da0e5b934cdd9a8990701d |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/7bf503151fb21a2e6e7d0996e946fd3744cd64b7 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3046afe05bdfdc8d110f63d107803850a8a4a8bb |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/866318b01ddc0c3cc9201465bfff5c7955b3970a |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/cab5d67ddf92938e1cd14145b1222f346381aab8 |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/eba6ec4b46ec1e185b914076d9aae5a20cfbfc93 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6f673d94fe9e29cf0bcf720f8cc62385c56a78e7 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4d9d79e05693318cf1a20543a9c4dbc4dcc09b8b |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d700648dc17e3f47463303eb330dbf93a7f4a70a |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/eaa9bdb72dfaa43453f98993dedb8f2abad44cfc |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0900ff5784f411113372fe5304dbc00d70ee4446 |     
 powerpc64   |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/451ef03151fafc330bf1afd62ca004f9f72ef19f |     
  powerpc    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2b357f5365c5c7e11ff0d2f47a03d01135852576 |     
microblazeel |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/9422578eb1d86d0371dbff26f3ca2d42d6333bbf |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/8bd14cc5499fcabd81d11fb0ed8833759b78bc52 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/10359024f706e2d3ec0de20bdeca504cc8c71698 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1e07ab8806658601f51d25544e285222174e23e9 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/2656fa69c5a2a3e2995121a1d429ee655e0cb4ee |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/5c3508aa93391370b02dc17a1e0aef941aff2c43 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/33bb157d1b43406c23cda0fed32376013b7ab64c |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/568e749d5ad7086751ac4d1275ebd2bb9a851480 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1dc88850c6bd6593a79b5694f874111a30d1586a |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/87a7260ac018e193fa81c2bc61d5224eadd0439b |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ee4e5e8d3f2e1cbccccb9e8b09ba7407de6dfe82 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0bf0728816cb16e25ab156b7e29ec535acd1a3c8 |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/333ea21884198910c3933dd90520190daec8af9b |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b265101ef8758b92e6821821617373726258627a |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/124739328dd6fdc48b73c1e40415ddc29b3be752 |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4c8f6a09d463363691b5db5ae611cc65ff2e2f36 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/883dac69ab52b8d49936695fd047ad600db3f5c1 |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/946db68ca1d8c01e5fb2f15eec6dc485983daafb |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/367d79436b9563d92d96bd8703d5615c3c329cd1 |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/ed2522fc550ae808512d10592d857bee91b0c14e |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/bc0f71895fa40b690f4a4ff55b8bd5a98c664ad5 |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f1e09fa6b67f4b4ca0ae24da5f2966ce03151562 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0b3b908c7fe4e86e2f9e710f71bf3067102f61a4 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0ff07390d80e492470c7b75bf4c640c2f7a8c436 |     
   s390x     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e03becdd7b7b778188d0234852a6ad6522d413d7 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/782c7b234c56672c1d87d546362bf6d4565d1187 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d3481e67abb0bf29284369ef9db5104895e63525 |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e2a71dd615190358ae043f06800f0e9c0940b8b8 |     
    sh4      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/043c43c06d29c33cf8c589877df180a0831197ea |     
   arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/ead3f0afdfdd2abf3c4c2ecedc00c85d497afffb |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/510df43fb8657b5d67a43f34b04fae6dd44ebc1b |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/41dc09051a370205bc51a5525e1d3d413aaf6335 |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/97bb174f7a594a516aa55b5d56a8092ed9085b66 |     
    sh4a     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6e61163a5d98103b60827be328a3cb374d315d5b |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5e8d215b4b2faed55f72aa796a7439bed1a60153 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/aecab3caa6633e38a746375be453e48b88c5d1b8 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b922a96cd8a2bf16916230fce78c8273ba8396d5 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/be9a73ceb229fc46ae15dfb7a0dd1a900b0bc9b2 |     
   armeb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a6ad4adab849b26b94a2a835dffed162706e592f |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d1f771613f55c14bdcfe44a9c8445b6882d1a65c |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8ba49861848d548640374985103e4da77a8a5e51 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/144531410b4a8e08f25d5fee18f4223fe4339a20 |     
    or1k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/cd98dba9b023b5a77de3f5a331cefaeae73116ab |     
   mips64    |            kmod-29             | NOK | http://autobuild.buildroot.net/results/d56205797a77af668574c143394f470e100f8b5a |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/0aec0f4a8c755506b8a196701018b23b52361299 |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/7d5ff16630923a261ffecbaba23c149b1651816e |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/7095a304b6f489ea526ca7c1fbc16742ec36d70b |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/8e05a591b21d723437ea565e684e2d6949216681 |     
  riscv64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/584f1ced58ea77896713abbb56d9426a5a031690 |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/d1d1368db8472d01423e92a0b083e043c5b72b27 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/80d0bb5ba9313f3892c98582478849d32724908a |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c1bc63decbf82b4df4108410b959e215052b6178 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3a2a613fcdc8e47c77f524e7b0034052aabfdd8a |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/ddb6da55c417ffa3892b6b0f4dc0eefb796f964a |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/7c4b1c42ea71141a5e4a39d05899da372793eb34 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/56a77d1bdda169d2b57f3d3a1dfa34f6a80dc776 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4e979fc7f04a6b883acb6c36d9b4f1819543aeec |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e07fa45d86a0be05c4000a3aa3efca142786b382 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e07e704c8439a9e47423de0c3919adb6ac7b2b46 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e315dff0e99bdced3c2438efded6735d17754e90 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/58c24e82f79129081cf6ce1a4616ff37116029d0 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4f8d9bce83c83268352f06002fb37223ef593b97 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8391bf2242c2941208b94588ac72c03c79763436 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/098a30553d9c7cb34aafe04e05f284cbb1cbe577 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/ddd23fd9846a40ac3838c497f04f8bd3b6261144 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c32b65655415a353c4b5e9abcf19cb16e7875546 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/485d6e6b83c938cbb078dad06450d431ff373c7d | ORPH
 microblaze  |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/d85d1cc22198f1c070fddf8ccd0afabc92ad51be |     
  mips64el   |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/1d8f5c13af8308a2b03e63037bbbc3a4e4aa9d4d |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6a267022b08ac756edab2f5ea44cdf69293471ff |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f27b2acad774a07bbb43521fb48065bbd8c377af |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0442abf8cac36d0c6d541a30fd52a1d9813e8f96 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/637cc53f5b49f5aa8bebdaa67e6e70db24298e82 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d0cab4303cd198686e4ff1b4642018f0f0fda435 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ae6ebe942b57d70e044bd969e0095927827c3538 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5d15bd85f0ed426ba344aa96b9c6599408118cc1 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c15ce5d526a88e55f7afd380eeac975c3504625c |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c41fd7d77cd72c3644c9c5d17e20320f72e24be3 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/61c69ca25cea151f48c2a89111ea8f5ea06710e1 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d61ef100e56d98bece62aca0e3ac29dbc08eb164 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/936245aa3f382dada6a3b86552bafb53f88c5687 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1b53d80ab3a44658b59029de04e1f9be84601983 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2de081ee64c5ab9ebb79d4a58beeda0bee9deb27 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5f5ce7dca30d171b69028b30f396ddbd81e45950 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ffcc34eb2d8b48b683e67a105fcf817477747719 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/85f254cb6c2d2b33842dafdad9291ee0bef3c43d |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6df9d84d31c8f865cd62b6f4da340331193fbf4a |     
    i586     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/79410509ef985f72ce2213a179f42bd3ffed5ca0 | ORPH
    m68k     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/127d8847607eead74938e87691193408e57274d3 | ORPH
  mips64el   |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/31f29406ef0810faf0f56c528591934c92ce80de | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b569f70f9cc4fcd7e8c0788e3103e2404884dcb9 | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/89862aeb0864027c95f5cbf95c2d92e6da6a3a10 | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7f850823d88a435495017906dcaaa233fde5221c | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/4297563694f9b4360e61d09ff0b7d87a35015db1 | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/4fad9041b1a0a7d5ebeacb33113dad5146b477c8 | ORPH
    arc      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/ffd39687c2888c8735f8146a6eb2381633737f6f | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7581a3c3e15507b1ea2db9ea46537df2c28fef1e | ORPH
   sh4eb     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/20555660a089fe5300cfda2eaa034a87966e86bf | ORPH
   armeb     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/0882f8af1f82e571074fba9c6bac6e17c4cdf42f | ORPH
  riscv64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d216f65caabefe9e736b133b999e71fe3b07a291 | ORPH
  aarch64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b88deebd1196dddc15dadbb501945ab778784a4b | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b78c743a9458a7d2d36780b8d110c14740a80087 | ORPH
 powerpc64   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/be0958c97c94379260eb4ed1355bcac68a9abfdf | ORPH
   xtensa    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/657dff29f456cd65b731d9815f6237981f2fa9fa | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/0a20ef40a34efa00978fac27eb4123f657c062be | ORPH
   sparc     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/081700482007df4e538ef56a57e14d4c27d09abb | ORPH
   xtensa    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/098c9ff57e1a968caa78e80cb24941cbc901c92d | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/09aa73a0f13337dc80788ac5362b4d8aa056ba10 | ORPH
    or1k     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/3d18f0a979638cb0ccd8379273dc1f24bf0beaba |     
    or1k     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/b1188e7741dd0cce71189d4129330cdd8cd9ca94 |     
    arm      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/f1938d4dce340ac75e6d2f582048d11c42c362db |     
   mipsel    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/86d767036402e0a97a695c403f0200ceebde4092 |     
  sparc64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/37084a9e56687919d67b5b329f5e3d400862b7db |     
  sparc64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/f0bc5051676711ecea609b217f3c8398806ed8c3 |     
   arceb     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/580be0d45e5bc241ee9c9d27c48acab416ef4ad4 | ORPH
    or1k     |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/edf3700b281a450e82a259a79613749f6a559cdd |     
 powerpc64   |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/cc5bdca284e118b28d89b7d3812b230397f27434 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/cab2919965d9b6e00dc1abd3aea5b310b398e961 |     
   s390x     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/1b347e11d21343a948f2ccd7f2c59318c3b8e011 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/a0f6a43ff86c5276d78d4285dfb293f5315ba51c |     
   arceb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/3c413978d830f3b7d3e5fadd08ae86a8ff821500 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c0688481f48356cf50197fc0d566fc3535ed165d | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f308c3f0b9e7f9e69f3b29d699b0f37379e4f10c | ORPH
    sh4      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/28b7b4850fe7c6fa8480a246553e7ee62d0b724f | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/497023cf0881c73b4bef5552808273fd0013e6c9 | ORPH
  riscv64    |           ocrad-0.28           | NOK | http://autobuild.buildroot.net/results/efd3f3f843dee8c22c7360dbbdbce54756d87e3d |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/dd20080b3a4343d3443df825456bfa5dcb4a3c96 |     
    or1k     | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/9f1ac31bb5563046757d282179e2af6877916e63 |     
   x86_64    |         pango-1.50.10          | NOK | http://autobuild.buildroot.net/results/d488649ddd0b3cf0ea1fad34f05117994c26e9e0 | ORPH
    sh4      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d0c4b04c5b4c3215d11d9c90faf8b4830eee710f |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7280e4c40eebae171325316b1a0c12d5734e81c4 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7d5dba211c6a23c04260bf346d0b1d2ddde00653 |     
    or1k     |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/12764dca40f7c8d4c8fbda98b6c7b68806bd9e03 |     
microblazeel |           php-8.1.11           | NOK | http://autobuild.buildroot.net/results/a3c20e9ae226a8e0c9ca4bb85f3bc4d9487f5cef |     
   s390x     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/022492f792a77428a28d8b79346bbc95c64ba9c7 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/e986c4701df0f387037bb5b6594b6df0cdd7f7b6 | ORPH
   arceb     |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/46da889f314ba007a77798276a7c59be46fdebe6 |     
   mipsel    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/e8683aa24fd7d2addeff1afd530dc3d30994f8f7 |     
   sh4eb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/2888b4699cfb555c7618c41b0b4ace56c1196e11 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/d5dc63afcbaba25e175a29f36e4b046edd79dcaf |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/de7f03abfde0602249d6f2d012c2b202d2a14658 |     
   xtensa    |         sysklogd-2.4.4         | NOK | http://autobuild.buildroot.net/results/477fdd82ef1f1d900aac6fba41471338a99dd30b |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/3c071dab091d0996232c07169bd11e454a7a414f |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/46d3f73cd451e10c935790eeea17eaa0fe52d3a4 |     
   sh4aeb    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a6d5faa0bb86007ecfd442ba36fbdc32b10f4e22 |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/655abaee1501ea98c41dedc12acfb734c0f3b82b |     
    arm      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/7d4a1bf54903d158fac5671d56b34d337beb144c |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1285ca1528f16dece64ee04495bdc7f8848a4323 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/065b213dc4074614890c0eb59b95dea9ae75177f |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/cf4a285bfcdd4d00a17faab8b8fd908552faf286 |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/16b6b753871ccd47a883d8700cf6a85a06b01c01 |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/048cba6cb795fa0d31d3f29caefdbdc8fb835a08 |     
   sh4aeb    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/de61fdb89083173fdaae82b603a287713434400d | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a02b4545cb0865a98403adef86a219a3c8ed62cb | ORPH
    mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/44027f46165c3224d550527b999e8ef1674236bf | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/99d79e36eb04df73d33eb62df901d2ee2acfa117 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/1d81cede31ccb30f1df14ddf8799b8a9278c363e | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/048b26cd5403fc189b62ec20a014ded65eb795d6 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/971f12e4f770a3c5195a1b5a03238f4cf2a57e9c | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/55dfc37fb703fcbc559d294f6bd88ae6fe157b2b | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/322c00d563da18a60b5711a8f170642d79c28b2c | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/1ed6322f444aa5b903c69e5ef02895d7560bd5f4 | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f41469b610a9e3d396aac402750a6dd830eb1212 | ORPH
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/9eb128b57b5a9f658cfaca2d3c3774d6aa38b5f3 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/2cddaa30895583d963be931b4e7c3f6e06faab5e | ORPH
    arm      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/f274dd2db445a04fc098b51ac327d1d2b61eefab |     
 aarch64_be  |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/96206a6910fb267b22b0da8b8b0e5c185885c3bf |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/b5b698701f00de42aea9f15b1ce5f00eebe0cd51 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/9599892eb328bb989fa37487e9ab96a50141c487 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/0cd180cf4546fc6ade4bc1dadd0622ca06ca0709 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/3134f0a93b22781d0b02151053ad24f4c8fdd0bb |     
   sh4eb     |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/28cdd80137f495d2243ed171e307f86025e2b5f4 |     
  sparc64    |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/411bf698a838e847aad40901433c224464093894 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0d7e0b77b264bf61f8fad55e406152fb93a45b01 | ORPH
    mips     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/cc2bb23abc306f140728a325e6766ee2a99eafd3 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/e3f7275e458db1e8725ca2356fd0d48782d4b7dd |     
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/fe2be0125d0ea4b6d50ee3637102f741225975c5 |     
    i586     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/98a82742bd341e727e776f558e66ff628fef6265 |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/85dfe2c54f9e99502306e8c19301ae93e64886a8 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/760a6ec8d28da2dcc8dfbc553cfb8b3d4cf0265b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4ef269fe078b3943b325c185873a010363f6f781 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/695cd46547965b0ae0a90c9a5b28aa537dcc66a1 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c3ef90f8fb91fd75b6d96ca41a32267f721c0fb3 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4c56d5cc9ab845beb0fbc92d7b805f0920b6e54b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f2351aa970d67df19bf7e3e6e8455901819d9afa | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/65ee32dc9e124bb5cc9c816ea5b2398344691c76 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7067657c3c20e3116cbfdb029d33bce1e79f34fe | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2e47cc62d9bc1d826a74490a80924775387b3f14 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f7851622c5280fd9e219b827abd63bda756e748c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1641d915bbfce043eb82e2c50d8b34b975c32f94 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                gerbera-1.10.0 | 2 
glibc-2.35-134-gb6aade18a7e... | 2 
            igd2-for-linux-2.1 | 2 
                 linux-5.17.15 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
              erlang-22.3.4.22 | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.62.0 | 1 
host-spirv-llvm-translator-... | 1 
              libgcrypt-1.10.1 | 1 
            openssh-legal-info | 1 
package/openssh/openssh.mk:... | 1 
                 sudo-1.9.11p2 | 1 
                       unknown | 1 
                     wpewebkit | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/75666e33f18a966451adb9ae88e2e84a1a961d84 |     
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/bff98d772d24dcbd0ed6203bc764c47c1e6be3e3 |     
  powerpc    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/d4ea60a504890776fdadb7d95ad8965f90a82242 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a411c934ed7494469c64f10faf33611d267f7da3 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8fa2baf3c0ed11b1b2a76bdc9ed1261d324b7a7a |     
    mips     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e4bdbed052d89c2aa80869b861b6f7f553f6e089 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/3b7571dd73a220e941744f7dbc8dc08b88dac591 |     
    sh4      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/941273859f8062353c0b8b64f09ba28354f556c7 |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/afd71a8219e90a86deb922da64759f9c9bdb14fa |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/075ccac45aded28fd805d31626addb12d7f14d3e | ORPH
   armeb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/0fcb3e53553c84f544361502b20463339a3dc1e3 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/558dd625cf56a14758244b1939df577649addc23 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/d38d52501da858716fe98089d5965059e08ccfb3 | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5dbf9b7fd20b15ca984b24a0b64b3a1b69a2f97a | ORPH
    i686     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c848d3130b49a03621a69b9c834a994913cc5c74 | ORPH
    arm      |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/cc0f81fb7b7d7c97b864f1931b3ea1529a308861 | ORPH
   mipsel    | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/00d94124de3d1e91ee44de3b86c44263f1e7d3ba |     
   sparc     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/602d67cf4fae4473a1ca1040d2bfef051618420a | ORPH
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/c84de89b6b90fcf64700ba6031f4a2f329b19f63 |     
    i586     |           wpewebkit            | TIM | http://autobuild.buildroot.net/results/90223b33d3bf7a6fefd5a04674afdcb1e818045e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
