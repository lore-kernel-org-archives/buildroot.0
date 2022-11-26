Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC739C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 07:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11ADB40354;
	Sat, 26 Nov 2022 07:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11ADB40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPpBXG0yPFsu; Sat, 26 Nov 2022 07:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADC8B4035F;
	Sat, 26 Nov 2022 07:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADC8B4035F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEA901BF3BC
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 07:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5BCB40354
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 07:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5BCB40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2oLFo6A1Uem for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 07:38:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B15640294
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B15640294
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 07:38:21 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 62D502000E
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 07:38:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 07:38:18 -0000
Message-Id: <20221126073824.B5BCB40354@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669448298; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oSvwR/V4DhV2+cAFjuwCHyjcu2/uaihV297xDkigbRU=;
 b=H1Je+isM8ChGwBMUbHY3UvHVGjS2VA1/YamU+ZduDG/wE9r0whhwHdlyP43MLePSI7Yqc9
 STSdleZLNCgJYVexlzQ+lQFxSUx/wuU8/IQWzk84BYyaJFA+9jJAuN0tAHNbsNhjc1A/v1
 1ly+sxwRg2kkCdxOw3CJmqE+7wg1LWalRwb0E089U6BHIWlx3Sg74LJEJVfyNT23grEZil
 ytWA3x6Nds8y6qjMNztQW4zs4SBS47CHbTE4DJo5AfBu5zAVWOc2CQaqSVRvIYL9CzY6f7
 N7MiWuOb7c/vgX/+hXJj+A0Z09fMlairRrl+pYLBQC5mcV4hqcJVS/ReXWisPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H1Je+isM
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-25
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

Autobuild statistics for 2022-11-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  2  |  0  |  6  |
  2022.08.x  | 17  | 10  |  0  | 27  |
    master   | 227 | 214 |  1  | 442 |
     next    | 10  | 21  |  0  | 31  |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-66-ga1dc0be03c9d... | 15
                      xz-5.2.7 | 13
            host-binutils-2.38 | 10
                host-go-1.19.3 | 8 
                   linux-6.0.9 | 7 
                       unknown | 7 
              host-pahole-1.24 | 6 
                elfutils-0.186 | 5 
  gobject-introspection-1.72.0 | 5 
           python-numpy-1.23.4 | 5 
                tealdeer-1.6.1 | 5 
                      crun-1.5 | 4 
            host-binutils-2.39 | 4 
               libglib2-2.72.3 | 4 
             libgpg-error-1.45 | 4 
             lirc-tools-0.10.2 | 4 
                 dash-0.5.11.5 | 3 
                gerbera-1.10.0 | 3 
              libgcrypt-1.10.1 | 3 
                   libnss-3.84 | 3 
                linuxptp-3.1.1 | 3 
              memcached-1.6.16 | 3 
                  boost-1.80.0 | 2 
                 dmalloc-5.6.5 | 2 
       freeradius-server-3.2.0 | 2 
gummiboot-2bcd919c681c952eb... | 2 
            host-binutils-2.37 | 2 
              host-rust-1.64.0 | 2 
                libglvnd-1.4.0 | 2 
                libkcapi-1.4.0 | 2 
      linux-5.10.145-cip17-rt7 | 2 
                 openssh-9.1p1 | 2 
                   perl-5.34.1 | 2 
                 wolfssl-5.5.3 | 2 
                     ace-7.0.6 | 1 
                apparmor-3.0.4 | 1 
              asterisk-16.28.0 | 1 
              containerd-1.6.8 | 1 
                   cpuload-0.3 | 1 
             dahdi-linux-3.2.0 | 1 
                 dc3dd-7.2.641 | 1 
           docker-cli-20.10.19 | 1 
                    dust-0.8.1 | 1 
                enscript-1.6.6 | 1 
                    flac-1.4.2 | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.3.1 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/cloop/cloop.mk:33: /tmp/... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    gdal-3.5.1 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
               gocryptfs-2.2.1 | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-11.3.0 | 1 
     host-moby-buildkit-0.10.0 | 1 
                       kmod-30 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
      libabseil-cpp-20220623.1 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.12 | 1 
                    libev-4.33 | 1 
            libnetconf2-2.1.11 | 1 
               libsigrok-0.5.2 | 1 
               lightning-2.1.3 | 1 
          linux-5.10.145-cip17 | 1 
                   linux-tools | 1 
              liquid-dsp-1.4.0 | 1 
               lpc32xxcdl-2.11 | 1 
            lttng-tools-2.13.2 | 1 
                   luvi-2.13.0 | 1 
                     lxc-5.0.1 | 1 
                  mender-3.4.0 | 1 
                mongodb-4.2.18 | 1 
                  netsurf-3.10 | 1 
                    opus-1.3.1 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                   qpdf-10.5.0 | 1 
                  scrypt-1.3.1 | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.12.0.1 | 1 
              strongswan-5.9.8 | 1 
              traceroute-2.1.0 | 1 
             uccp420wlan-6.9.1 | 1 
ulog-0389d243352255f6182326... | 1 
                wtfutil-0.41.0 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/6194951f2700d9f1dc2aac7b5f49dacb1367b73f |     
    arc      |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/d633f576ff3ff1bfe5cab1136389503e14c29aee |     
    arc      |        asterisk-16.28.0        | NOK | http://autobuild.buildroot.net/results/b8b6c90e2def647720c453e5428b9bd1ed0d4bcb |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/934a822a1b32ba213acc32abbad42ed0b41d90a7 |     
  aarch64    |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/99fca0d96099dd572d402cbd227e3a17587c8dd6 |     
  aarch64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/0b4c659dea0d359bbf15071169f03d3515179585 |     
   arceb     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/e92c5e3c83b50cb9e3696e7180a78067e5e342eb |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9aeeada7c8da072cd85cfa9785c09514c013118f |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6baea219ce499c7e0a73e3a1b060d105659eae8e |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/24570808f1d027135eae16931efac0dec6197514 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/27223a7b37777058010ff39678173a943cf7ff4b |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/ba3e5bd3d46d181bad8c9d4f547d01ac1fa51db1 |     
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/55a38e0e45212bf7403d9ccb626c9422e3affe72 | ORPH
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/137d39cc5ec436759a2fde3f26ce5633e0ad6c2e | ORPH
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c386a526498b2a3d76e48e1c91a6a2b2a0f554d9 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/07c78ca11c2fb337d4c1d53e6ef3cb9ae2a9ba64 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/b06c1baa3844713752352313006d218da4037843 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/08ba97d525264908c2b116a0da067dc547d5800e | ORPH
powerpc64le  |      docker-cli-20.10.19       | NOK | http://autobuild.buildroot.net/results/a5f854887cf754b04f3675191ba3fcc756c514b2 |     
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/836115be3f59a46d30b351547fba3f5eca3fdcb0 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e2d47ae2755cff671c3d7ddc48bd794600d00907 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d2098452e1c364069ba39d202b8254b5b2f0ea82 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/399e4c4c835e42f4a2db18cb5323625be6120272 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7616b9fbfd59ec4ba09e8902cddf7bdbabcdbcd0 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1840417bf0a304dd14126fcd88b60e91dcff0929 | ORPH
  powerpc    |         enscript-1.6.6         | NOK | http://autobuild.buildroot.net/results/d04bf8ccaefdb31a37e7213c12abd4e7e944c4f5 | ORPH
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/1002bec25b31d05e92a887d81d0a93be78f12366 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/5caea84a23afdc6cef3b03ef01aa3cf059ee0d13 | ORPH
    i686     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/65cd87b39f5363f21e2dbdf2b195e22f3d606d63 |     
powerpc64le  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/fa2d7b9be0d9f18c8e04b0c2e4885cc584c0bad1 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/783433fc2279fca1af51a73870631307778ab7d5 |     
  mips64el   | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/cc8b49a618be458a64410fb2ceffc26a82722c0a |     
    sh4      | fs/cloop/cloop.mk:33: /tmp/... | NOK | http://autobuild.buildroot.net/results/f420bd7e858b87f571a23fec23ed1f1480bca7a9 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/2a935c2011628cd979de3b59a61c2ad9485565b8 |     
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d1db752067daa08c1c880f9cea503a39fa22af02 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/fc8dd3b8a43899175244c9c0fe0fb22baa82af6e |     
   arceb     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/028ae9d9731c99ed9abd2213ed63d311bc79143e |     
  riscv64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4c769b107e061a265daf7e60146733df9061210c |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c4ce7df4340474c8199bbae99d4e934201207701 |     
   nios2     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/394dfe7afc2554ca45ed511abacf46f794517698 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/1d0a09b98218a792744e9a03e4e4a7df4fc9e3a2 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/4ba8357e6b97806b011749bc3b711f2697fd62c3 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/2c0fbd332f7f9173aab04fefbdd14cb708cb4976 |     
  riscv32    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/e855efd45a448cb02d0130d749421dab3a38c94b |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/a5bced89c3142a50eeaebf101b498328d097f668 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/cccd33e0d50d74ef930a0f62300021c647df1fb6 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/de62d3c6d510caa69bbc72cec710e36590f7c1ee |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/753b7eb12fbab90b95f35bfa7f4c0155a77f3a33 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bf5606d700014795169c8112d6c94ca34fbaf94a |     
   sh4eb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d0e3be8165ecaedb4752f5b5db9c1f746d943a9a |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/12a7b2de4e74aad2ffe2076b09c5163a726bff11 |     
    sh4      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a164b9a299e181fad923c2e1fedb8f43d0b6e8ad |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/31d23485dc6759bfdb7186c876680ca4cbf348e9 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/bfb87b296e568a5f849520f0223f90b67280e3e4 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1d223a2c957f4942fe0e7d7e411486c0e1c1f626 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/2f263139198e4aa4d5eccea53a21a250decd8e8e |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4c32c97c66e460825eb62b78bbe11e6635cc941c |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/34bc25d0a0708b68c3d613a0a81f167e7bbb2c2e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d6be201eed9ba081247d4200e7803f0230d226fd |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f6a59d37a2a3e66dc393ecf630f86d097f6b226c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3d0cf14a18ff252aa6446e1017cfe7e1dfd0a58c |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6253b7a94daeb31ca7ab175de5005eb8ce4fa5d3 |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/63048cb90074ac5ace2db1de290417aaed340f7a |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6038709c098b276f6355b2560262155e9f3cfd8b |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/685635b3dd1e4450243de286153b31fb0ddc02ce | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a14304fef230d6167e571c57c983ebfa7604c0ce |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e47515341e079c1f255c2e1d809c25bf708c4ea9 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dcaf46c65b892b4b6bc245ed9ea43db1d3929a89 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b69322d5fd7d56962ad640e9b538868981f7abc9 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/905b48d146b48381f31bb86e8a177fad46e12afc | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/289e4493e906d850b4fd4ebff4810f43384e653f | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/a71599aaaf77b85b1c59dacf89f5285a73199a9a |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/fba206afa4f77240015c88fbc986c0f5ee96aeee |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/99f15746271355b86b37e66c1d033457579212cf |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/5bf7d2f23f3b928749bce1da9dcefb0a61e79fd9 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/351c28c62f130ad630fb659c350e158a8e34326f |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1bbc1d1ad9eb08fe17221c38736566574a55ce7f |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3512da5d62666cd619d6e9d715173dde3d9fe065 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7590a022da4995e662f539a185299862898c27d3 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aa7e5336a1902408e27db2dd26cf633fb629b225 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5d70d46df678a208e0f92453350644fe29d59e81 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6221f44fa01e16d55c11b4c6e22e8bcf3816f582 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d7a3cd793439301cce3e85d7e38976b181d53ccd |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/988ad017c132fb87ec89a217550d1af9d0775977 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/addd9694378557c71f589516795ab024550f9221 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d0758be12683f689f759907d5ebaa9431be0a828 |     
 aarch64_be  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8bf3edeed837245ff4c660be49602037dace1ad9 |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3f60a17b9b73ffa640833f64a03606940deb1cce |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/044e1acf8925d6fd2d2fca80a5cfb2a5a3654be6 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/325eb22df101f6dc167b7fa9a8c4071678e1be52 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/6b7564758872e3efa634db590ea119c27b6f0673 |     
microblazeel |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/bba7211a18e8a6c55662576e1e12fe3e6a2f6b1f |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/c1fadadab21360ee046c671eb7589fc7768340d1 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ebc0aaa28f70fe93866cc5a507cc1fb95ea8bbdc |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f9aeae058145f989c37cd29180e1135b38eaa621 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/248c62a1cff9a5793fd8a5babf12c3d94948a4df |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/971b07149f030243f82883e7cc3135003c9a13d3 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f66eb04d405d12f7013e0546c40f00366549c31b |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f1888242ed0597e5c30110a8efa38ace8e9224fc |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/2755d0933a1ed02a3945cd232bd038e095d2f309 |     
    arm      |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/5f130f64d26483cb27f5fc20c438543751be1243 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ea1a394c574e6ca5092c461649cd3de85f681874 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/138531ae7f79f4c9a682004f9fbff6f7fd72c463 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ad96e6e347c270cf55b8fe63d0bb524a3b49e7e9 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cd5409f1e11c4a3d0ffc81431ae6741b1d02c38a |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/bd8d35f74e15a3c4dc089f68e4ad2e8c62ddefb0 |     
    sh4a     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ca17a250096c43487368985ce4f3f45c054480ad |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/88143892aef9bb2fdf1dcc076ee8b558a93f27cd |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e657d2bc71df927b95a6daae960e4783a9f80aba |     
 aarch64_be  |            kmod-30             | NOK | http://autobuild.buildroot.net/results/e2c2a3252224080529ec23a99a7a3b5535b12888 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/4cdd84742c1f1308e9c5726c40120f327e5a6ccc |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/0b0ffcdf2b6b83af9e1745af6550345a291904dc |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/e6b965b1d681b0042b35052b39e657e9978aeff3 |     
    arm      |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/676e4d2546e3758aa810d7a78a0ad7a7f005ca7b |     
powerpc64le  |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/c6f9dbbba0b5a8046569c27aad9a2b3569f364c8 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2fc7ae7184885522162d6976ed1baab8b83cf7d9 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/846b2432784c39f74906d9212028339c549bfe44 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8de2dc394f15efd591bf522adc8fdd23542b1db3 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/39813bcf8b9ac70bd32825d3e5a7bb85063918ac |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a269af8c8a92ebd4d16b34ebe3773957df6fec83 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/031721f915695bfe4c11d148a113d059b9b2c0eb |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/64b56dd3e0f92e02fb605ebb3bc824983577f99f |     
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/61b0ce63cf9bc1193fdc9868fec176a3f3444ce5 | ORPH
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/cef033320717871be9d208701c9069cf2105a07f | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/bad1c14f38b69b757b728f5a906bca84e01aca3b | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/83a93df09e9c78d3f2e119f9bb54f7eb0a8267d0 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1c97d070be022cdec4f594794fadab4620d835d7 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1c6740356166cf1dfb728860db24a4b69ecb2c31 | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/4470efb5a078c0e368f6bd4f5ec455eea5eeebb5 |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/4e5f2e17064800676df0bb94e5a273653b933397 |     
   mips64    |       libnetconf2-2.1.11       | NOK | http://autobuild.buildroot.net/results/1fcfb9929b07a6b89d85dbfa4c7f2cfeb4b3ae1b |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/38c47613649d9c7f4bc8e228e80913a621446dab |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/144940189542969e923cf974730dd86d3d892530 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f14c6c115cdb190c982a3bb43e5c3566f0512ade |     
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/fea93000de3707adc4b57a908222ba6fa2975aab |     
    arm      |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/d2d334331f7dad2f720d5763238b5761525af37c |     
  sparc64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/050bc24d1a43dfe9ba5294606954954a03d95e46 | ORPH
    m68k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/0edf249d791b63dc020f76624228906641e31486 | ORPH
 microblaze  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/933c047bd86d55753f25810e4b1a87f961a7f8e9 | ORPH
    arc      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/4647601da0ecd0c2f18ff9e56aa946bb585d302e | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/65eb0a462b2f3058917bdcabc25d257a8b92918a | ORPH
   arceb     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/a4d9efee35f0788a86c7144e0d5e7c58885ae9a8 | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/0cb2edf9a8467fdd46d9fac4596a8bd6de95f3a3 | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/cda0398649de64b9ee1223938b855732b95ced02 | ORPH
   mipsel    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/a51c12030edb755e736ef65ece1fa4448fa4e03f | ORPH
   arceb     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/538b5f8683147e8f468c4bdfa4cddc7b90062993 | ORPH
    arc      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/abe43d6413969954b021479db0c5eee4bef7f7d8 | ORPH
powerpc64le  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/8dff570499024da0f9d0c922619c8f07462633ec |     
   mipsel    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/31214bf6399e7f1bbafc96fd7055ca4629c4021f |     
   s390x     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/30e18e048fe426ec6a1522875cf37fb224b56bbf |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/e0ece4946f879386ca3b0e6f6b7af04a77acdcf9 |     
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/d7a28cc2f9a0a23ba10bdd59e93054607ec61f85 | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/70203292f3faceb9454352c3570cbfc3328919e4 | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/aaac660802b7451e2769b223a2e509d62fc4f734 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/a21472c91b07a35cc273bd5f17c7eeac94865884 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/8dc2e845ffb24660e5f51e4ee4c6434ca32f7123 | ORPH
   armeb     |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/2771798f221ae64ca0fa7fcd54cfc7e8da75fe07 |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/9fea77d55b37971d708c245b5e6dc2a1a22f4198 | ORPH
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/e49d5e135b7768c6526f6c58062ba34034c9d9c3 |     
    arm      |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/758c5aac416a6cb9b51a448e2260fbf59203d3a7 | ORPH
powerpc64le  |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/3f7bc91094999433ad9359aa6c8585e460d85df8 | ORPH
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/745b04ffc27c93fd59f7bc6d871ae6814709c258 | ORPH
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/b8b8ec468d05dff9cf0e5402300d6bfe048060b1 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/de755070ff9dd4b6b613758ba61d2529507a42af |     
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/7c0ad61f25a95ba7d5bfa370925410ca05bde6d2 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/551ab1d63b9a6bc5d4de79085827e5cd75622354 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/adde0119be73d5439c1e8edc33460c0fa69f3835 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/d307ef82c275afd1a711624270cbf45909f0c3e5 | ORPH
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/29d8861035553efc8d816a58ec0b939011f8d1db |     
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4c5571f64ea5880a2058b09f638d5b07de18d20d |     
    i686     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/b2b22e4f9684aca0246650673fd8c33019712ddf | ORPH
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/071a14465411732ab84095713f6551cf39864f45 |     
  powerpc    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/2d6b9c009f9e3bcb582bf9c2c8901e2e0a7e38b3 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/45a1105734219672fa77f64b1dc2d713f2f56a07 |     
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/ddbe1076aca95115d39b8e68e47660f26a942445 |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/1a7953392197e1f7c0ef59e9129d62acf7fb0c9f |     
   armeb     |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/e2f1c25b4b95e9cf17e6ce892b3833f9dfc7b0fe |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/b7423924333afc0fed7fb18c37dfe618b4b2ef25 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/539cadc9096362fe3e6e02b22ad501b708df719a | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/606f461bc324588d271126f259b540837590de18 |     
    m68k     |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/40012657d28593fdffe8b19e5592b6257d9dac75 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/6c1ffdd39bec7ea9aafdba290c57ddf150c0f4f8 |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/93551b932fdbe95ca3911ff3034d7d54fbaf2de0 |     
  mips64el   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/ba9173558cd8b1fbfd736e401151795030b0bd6b |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/040ffbd1fa898dc188e51f306add929b6d59e1c5 |     
   mipsel    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/5a26bf8bb93ffe0077b9e9d3a5cd733e8d4a4abe |     
    sh4a     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/696ab133384db05c661185c881305c5d9c669390 |     
   nios2     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/541ab5399d2a070988f4dd40a0ca1afac169ac91 | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0afaa94d8fccf63e1c0823393ba7c2bee257ecfa |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4d1d3d6b4793c6b1a5831e489e98e99da03a3cb3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4057089bda194e7e81c315a4746facb5600a9ae4 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d1e1b4a0504641953c3d3e068e9a8a7bd53d401b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/dd5603daf3ef4104706bb956291b0812ef8046e3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b37fa82cd1123f8b026829f2a786d315c870ba51 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/77d2a1ff7462b43cfc1d92329e3328531e3f4749 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/42ebafc1c3f69ada336da9c87c9abc9886155326 |     
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/dc46369b0dcbfc35de2e527b5e05eb6794df51ea |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/dfb009ba831af56f30febb16ee3aabe75853fc65 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/5bdca4fb878173d9c8e7adefe1e1fbd06b3b759c |     
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/15218db1b78c55df022b61e1046881af7ac2d76b |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/3db70a4a4a4b910105be5a05e2ff1c35949c6860 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2835750152120e3ca10cbb7b23ded86a23446114 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b621ef35e1eea27af86962c81864b0a14d4d8b45 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/df323cf86ae497c9759869b9694d95aa7e5ce8eb | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/98618f0ba9723012b997b0e96795620d0dde04b3 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b5333e0d22762e8d19eb56b2b94d7c85d2c1312e | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/55e24b74f50b92614eec221d71c275f5c93b4417 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/eebe4c06d5f6e649f59cf9297650b3e139eac83f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8696a0c2ff3c4927a13d45ae3bc8228ef76333e6 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5f911da4a943c8ee42662cb1c404a0cf86d14d74 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/68b9e089c818af9460ac811a21236c6d3d7ad475 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d8483c78060780df92b9f9b8e063c18f8cca4b9d | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7fe453d089f5b2c0afaea474b6209707f033e1a8 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9fd40486dbaf68a4a7ce6b637488f39817a0cddd | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/b3ed1a4740c0dacef4373f6ee720e80493993642 |     


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 3 
                host-go-1.19.3 | 3 
              host-pahole-1.24 | 2 
                    norm-1.5.8 | 2 
              alsa-utils-1.2.8 | 1 
                     efivar-38 | 1 
                  gensio-2.5.5 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
              host-rust-1.65.0 | 1 
          imagemagick-7.1.0-51 | 1 
            quickjs-2021-03-27 | 1 
           sdl2_ttf-legal-info | 1 
                  sscep-0.10.0 | 1 
                xenomai-3.0.10 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/2e65df4c352d4c004d5b71f4c80a3a6d7ed670b0 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d6894e598b681c8fdc392486c65ce5f68a67b91d |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7b5699a0856a3c7e47d518d432fa5c7065ea89fc |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5783ff7e35633feb0b0e3ad2204c6cde05b7854e |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a30189bf4823f8c8aef32da05b3018449de15cd8 |     
    m68k     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/da6f3161a931c1cade38f6da0d5cd5a528e44f98 |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/93766b40fecfa951b20fa78e8c19f18a6b3e402d |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/1f77b2587667a7844c7a88fcd119535a31ce012d |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/c956a2feb90656461879078aa69f861d5960f0e0 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/a0a4edc5d63e1dddf9c7775ba1e2a4f3f9a05211 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fa4a33deaaa21ada2b1776da110c46226025a4d0 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/008540de208c0c07b60738b97a3c0d613d29c3ab |     
    mips     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/16d0d8a4e35e26442809646b6532b0e1b1f608e6 |     
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/91ed1e2493f23ba1cba76023436871881fa51a0e | ORPH
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/48d87ac7c9fcd337ad7136fcc138fe3c4b1f3424 | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8aa7d3d7190887cb20cb37c20c6e058857d9bf60 | ORPH
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/a2f3b73dc861b824634b94431d8a7a989ab97614 |     
  aarch64    |      sdl2_ttf-legal-info       | NOK | http://autobuild.buildroot.net/results/225f63a605eba1644f140f2246276bb8e3e3c26a |     
   mipsel    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/f2fe9bde9edfcb41600f240f3f36599a26c95cdf |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e36867c4023b0de7f270680073ce06f29fd5dab8 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/f2207eeaaa818972dc7d50d1fc738f975be86376 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8597e854806de0825b550f2bd4707ba55f9e8f6f |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7759165a45c22311faa10be8c32507931aea9140 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 
                     ace-7.0.6 | 1 
                  boost-1.79.0 | 1 
              host-rust-1.62.0 | 1 
                  ntpsec-1_2_1 | 1 
                 protobuf-21.5 | 1 
                    sdl-1.2.15 | 1 
                 wavemon-0.9.4 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/d664de8116993ae160f785eb5ad7a72ee6a69a0a |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/d6024d0cdfd4ab6b6c0dbd40c8d0c650852940e2 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/d5af1d2ce15fbb56c2dadff38c8bd52fde058682 |     
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5aafd8dacc6d6b72da00ca72518f021ef0561267 |     
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/bba92fa01b3bfd1eae8f9fa2241591f7fe60dec3 |     
   xtensa    |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/07e876a1ea7535795e8e1b55cf3659607bac145c | ORPH
    m68k     |         protobuf-21.5          | NOK | http://autobuild.buildroot.net/results/11b55b2fcccedd7c9ede494fb8e9b13c07c89130 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/7bcc399b5e73199269c4ef988143fb55aaa8918a | ORPH
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e9c605114b41e8861ff4029cbae936a0b29b6c5f | ORPH
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d9b2ff94059940af94150b6a4b15b2e6500b8600 |     


Gitlab CI results for 2022-11-25
================================

Detail of defconfig failures for 2022.11-rc3
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3378473506  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3378473592  |      


Detail of runtime-test failures for 2022.11-rc3
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/3378473661  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3378473971  | ORPH 


Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859364  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859466  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859632  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859633  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859634  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859635  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859686  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859725  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859787  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859793  | ORPH 
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859807  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859840  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859882  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

