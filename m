Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435EEC433FE
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 08:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9EE7605A0;
	Tue, 29 Nov 2022 08:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9EE7605A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVimVKJMqs27; Tue, 29 Nov 2022 08:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C0B60BBB;
	Tue, 29 Nov 2022 08:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C0B60BBB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 431A31BF2C6
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 08:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2F9B818A7
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 08:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F9B818A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWo1zp8rx32Y for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 08:11:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA0CB8144D
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA0CB8144D
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 08:11:08 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 25A0024000F
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 08:11:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 08:11:06 -0000
Message-Id: <20221129081111.F2F9B818A7@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669709466; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ubV1ladTHsFYsChLFErOISntLpxbgFE0SFKaTiXZWM=;
 b=VnVAdwK92G7o/kWr7FfBgXKTke159ms+seBM/gHJ4SFTDBJDzjjwzwjxg8qCcokcn56SeV
 Zc6z/Bk/k9srBDzNC8hxUXfOMOc2+g4LbnjLFGW/fDD/wIB/1SBVOAQOMjIzJkS3/yfMcW
 U4ncs9V81fVvYZS9o5tUtus1/p1EXy6PJ1zEfi0Tds0Q6xCcCmQ5jmTjyt/1ASj57RIjn0
 Suo8usTXZnQCbjjJaII2ECDXviio4KnKjScdPcyyy0AHnj5gr9FlnGJFc0bDvemycD8adN
 YTk17Q3zmqXr0lSHSJEuOl3oC5HZAurXpBoUB/IDVehKCTQwm3xj/O9ABwXQmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VnVAdwK9
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-28
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

Autobuild statistics for 2022-11-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  1  |  0  |  6  |
  2022.08.x  | 17  | 26  |  0  | 43  |
    master   | 245 | 246 |  0  | 491 |
     next    | 10  | 22  |  1  | 33  |

Classification of failures by reason for master
-----------------------------------------------

                      xz-5.2.7 | 17
                host-go-1.19.3 | 11
glibc-2.36-66-ga1dc0be03c9d... | 10
            host-binutils-2.38 | 10
              host-pahole-1.24 | 9 
  gobject-introspection-1.72.0 | 8 
                elfutils-0.186 | 7 
               libglib2-2.72.3 | 7 
             libgpg-error-1.45 | 7 
                   linux-6.0.9 | 7 
                       unknown | 7 
           python-numpy-1.23.4 | 6 
                linuxptp-3.1.1 | 4 
             lirc-tools-0.10.2 | 4 
                tealdeer-1.6.1 | 4 
                gerbera-1.10.0 | 3 
                     gmp-6.2.1 | 3 
gummiboot-2bcd919c681c952eb... | 3 
              host-rust-1.64.0 | 3 
        ltp-testsuite-20220930 | 3 
                    php-8.1.12 | 3 
                 uclibc-1.0.42 | 3 
                wtfutil-0.41.0 | 3 
                  zabbix-5.4.9 | 3 
               apcupsd-3.14.14 | 2 
                      crun-1.5 | 2 
                  ffmpeg-4.4.3 | 2 
                     frr-8.3.1 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                gnu-efi-3.0.15 | 2 
            host-binutils-2.37 | 2 
                   libnss-3.84 | 2 
          lttng-modules-2.13.1 | 2 
              memcached-1.6.16 | 2 
    python-cryptography-38.0.1 | 2 
rtl8192eu-1e15b6d451731bc4d... | 2 
        s6-linux-utils-2.6.0.0 | 2 
toolchain-external-codescap... | 2 
ulog-0389d243352255f6182326... | 2 
                xenomai-3.0.10 | 2 
                    zeek-4.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                alsa-lib-1.2.8 | 1 
                    bat-0.19.0 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                   bullet-3.21 | 1 
           crucible-2022.05.25 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
                 dtbocfg-0.0.9 | 1 
                     efivar-38 | 1 
                  exempi-2.6.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/axfs/axfs.mk:32: /home/t... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
          gitlab-runner-14.5.1 | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-11.3.0 | 1 
       host-gcc-initial-10.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
     host-moby-buildkit-0.10.0 | 1 
               host-runc-1.1.4 | 1 
host-spirv-llvm-translator-... | 1 
                   hwloc-2.8.0 | 1 
                  kexec-2.0.25 | 1 
              libblockdev-2.26 | 1 
              libgcrypt-1.10.1 | 1 
                libmad-0.15.1b | 1 
               libmdbx-0.11.12 | 1 
                  libnfc-1.8.0 | 1 
                librsvg-2.50.7 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
              liquid-dsp-1.4.0 | 1 
          lua-cqueues-20200726 | 1 
                     lxc-5.0.1 | 1 
                mongodb-4.2.18 | 1 
                    mosh-1.3.2 | 1 
         mxs-bootlets-10.12.01 | 1 
                  netsurf-3.10 | 1 
            ocf-linux-20171122 | 1 
              open62541-v1.3.3 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.1p1 | 1 
                    opus-1.3.1 | 1 
package/qt6/qt6base/qt6base... | 1 
                   pcre2-10.40 | 1 
                proftpd-1.3.6e | 1 
rtl8821au-e0b443940471c166a... | 1 
                    ruby-3.1.2 | 1 
                    sdl-1.2.15 | 1 
                     shim-15.4 | 1 
              strongswan-5.9.8 | 1 
               tcf-agent-1.7.0 | 1 
             uccp420wlan-6.9.1 | 1 
                 wavemon-0.9.4 | 1 
                     xterm-376 | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/af5beca3489b87aec883b4fd9591cdb2c120dc05 |     
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3d974e27696b900005b55d25c362b19c16279af0 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/cba43e8edcf28755002c0da8d1dec958e55109f7 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0b0e2330f12ccde0acb383d0cb5c5008058f782f |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ec44c9ffa474535178f01c575faf04e5c0824b2f |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/cc1d7ebf9a03039ab899d16226c0b056a4f2d245 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/48d4ab9efac0ab9678714a7dad1e93388afe1de1 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/b0d08453314830e633eb14b36693094ed31ca7af |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4b14ce9564a487454db12b52e47d422a4df87ecf |     
 powerpc64   |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/92548bcdd9edb5505d595eef916027c307afcb4e |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/f3a58be15ccb434824c458c275235bc5f043e864 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3e3684e327bd4d0ecddf1ecaab7f7a34d10e8928 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1dabf514c6b25195c84aedcd0e676bafcafe601f |     
    i686     | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/21c042751f17ce7e674fadbb0c8e60895a075246 |     
  mips64el   |         dtbocfg-0.0.9          | NOK | http://autobuild.buildroot.net/results/7730030b72c230e626215f6918453ca9328acacf |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/3d6b09dc83d047f278c085ff132151cf3182ecfc |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9c540c94e58bdfb9ddc8e4643049a64833a9c793 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fd7acc752d00caea27bac5f0e238ba06447e9a63 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4c05ead1a78c1194b0077feaa5ebfd28b3ae8c15 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/15c1b7bca89fc0bb7d519fa9ad7b16dc011e4c13 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d29bb32166955a5df3e7267f3b730a75c7c4ccbe | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a7c9a78dff95923bb45e946939e63c80b3961eaa | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0e1b9b50030e66e85e74652b9e9e9522a97a2545 | ORPH
powerpc64le  |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/a0461659e75e021bb5687dffb7e152da943554be |     
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/ebf5cbc48ca46e62104439464e8f82863d0637d8 |     
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/a510ebe1324aaf613b9b0387bb4430f20c87f10c |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/e14395434b5129a3ae704461da26e8b7825c0d1b |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/4f068bb541b9e01f800e9f9f7f5692683c58d10a |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/7af3cabbb5acea61230148a0135623aaa73db7a5 |     
 powerpc64   | fs/axfs/axfs.mk:32: /home/t... | NOK | http://autobuild.buildroot.net/results/5983caf642354dc1f8613f52a4246cc8128947bc |     
   mipsel    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/77e3e76e5653ae6ba8754db6a6dc5ee350836879 |     
    i586     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/98c7df702fc15ccc253575cece3c0c107036e46b |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/766999cefb36416addc6485484dcb26f39885a9e |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a230c3878e9c4525bbdb5498c34a4d8da5d1ba21 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0ba2231efd478f9afbf13bb3fb0f8fdd6ce1d65b |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/67e47f50a8f5a7e0d3c8a47526f2f8c0f592cf7f |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ba2a1bf2fd5f61b135cb3a2ce6dc82b065c41fd3 |     
   nios2     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/4098b78facd7977eee67789f330fffc0e700aee2 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b2ede0d1b37388fc1c3c8fe3c015ff83b55cfc23 |     
    i686     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/cc2df863ffaa23b3914e7ed982e9cdf6d19d84eb |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/88ff43290137b538212ad33cdbc4e0942d54a141 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6aa7e05419246d1133d13f31e1f397ef6141be34 |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/93bceda4d81b1f7d4369df77524a3b6c0a567c5b |     
    i586     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b80ec6709f2effe53f3b92089375f24fe8e740a4 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/85aa0236852e8bd3f08509da1abbd15226268f64 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/64325a8ec989cc4b13300a5fb20940b807813487 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1c15bfa5e060b78f0c0d8ca4baac78ed1b508e0e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f34f880cc9c8cf9b9552d1caf7957d48c261d402 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/79f94ef126a8dd4c3ce99a8910beaaf24fa273d9 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/754108fa852e96fe23891ad52ad21b684f001a53 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/818c58827959cfcc845c8b198708725a39d3da95 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/2d863d9fdcfb874eaa5ccec447459240702e672c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5c6899fa68c0a432781b1e6ac46b702521233ae0 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/dcf5c1eebfab3fe71ea7b7863268d502e8a31c2e |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/adf041183003312425700a9c43faac630dfdbb58 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/169ca09ab0649294feec0fb7252afddb8b10ed69 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/93b3de91552ef2242e41a452d1c0d73bcdef5be9 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/d749046efe79636d8637cdad2b9e8eebbe36c2e9 | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/25b6fd1e6c29bc22276364b8650e57b1ddd723b3 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/5c3825134491cfe6b5ce112c2ab92a0eb234d09b |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b254dd98cfaaa9c97c42092c93c11c29c688a7f8 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d9fb65f9bfa092e5a8be86bef70cb9f73ae97816 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/52a401810d2a9e3e61f86336773b488cc455b61c | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e8792d735cbe451d7c308bc9b5a321ed0bb4d975 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e667528ee5cdfc5a0644254e58301679ff39beb1 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2906c5784e41678571eb8195a2daab417c3ff894 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b466fc18293ad5f1a73cc42a2e844253d548f1cf | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e1ac09d7d9e72c8d1486d3012a8e9fc2c6e9241e | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/2e8915a6604ca1e6240fad685a4df181d9a16329 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/4e046f55b606dfe170170021282bc31db1a2fa07 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/a1b8747dfe428732b4184b5dba0cfa726dbdb2fc |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ad0a08c420a92ecefb942d295a6fbbde15f543e7 |     
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/6ab620c0db98f3954262c7b52a42bbc0da114edc |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3278b10e28577cf833b650d7ab24f20c4b3f5629 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/590692afa5cfb7c057af4477517f002280b479b7 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6b028b7988061c9ee72869723482416dc405a46d |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2ae62877fb059d5a47b5179d82aa1bf0e54a93d1 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f533df238a657459b8cbde5d8c8e7eacd4aab3e2 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7c046fcdb23f5b07838c8e50ba69f3cc7c664cbb |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1bd135e3e5a8a8ad7aaea77641133e596108e918 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/130d3dd481a98e4e82d1f7e115dacdef3b018aa6 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1849c61b0fffed7f49bfd812ca184d3ae07cab85 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8b3d2764c5b7471a45b2cf2b71644df0f6b31139 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/d701a0d9b0780f77342b9be6b471f47adf9349b0 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6629369b43a2266cf0ff9edcb73d7146f64ed9ad |     
microblazeel |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/c660e6043bbafa7cf8762ee48fff2fd0404ba300 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/c9790470de2cce15caa5e0b7089adcda34ca05db | ORPH
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/881d10d49aad9a60dfe7fb5d277315ac2b0d4d10 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f8de14039d21baab3420e359707ed898cd7f8d71 |     
  riscv64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/43c3ff47d9d8a4fdaf0731c18019122e78791ac3 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7c0ae78340f4a7409742038b5a5d5b04762833bb |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7bf61c3715d2ed055002e83855f8a21d5da323ac |     
    i586     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/2c3479faf6f6b403769fba6ff02c24cd3e855ab2 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/86830be015ecec4ebfba3a19663c1180e11b5d1b |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/4f894bc471c4da495bfbbbdf2dfdbfe1eea49680 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/1dc27e8c26753069e80fca4f3a3948c95589c476 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/cc2c0d46441a20c41f8fc3e3ab80aa70d18edcf5 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ad9d5c46410059907f0f60c659c35eecd11127e7 |     
  riscv64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/d82d943387ffaad7f547cc2aee956413cb2558a7 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/03fb92c80dd13a6df22b1bcfe475e77e19cb4263 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0aace81c072c4c384c4e6747fb031ddcce38773f |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/49789a96f91a39e5f2bd75c19262198f4cf424bc |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5cccc0041fca859c20c8c4364863396bb7067116 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a3b30df3d3c50341bb821782583134f20bac6415 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/066b5fb2b56b3935e43c1bc9cbd27e852371e9a8 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3518b0bf7305f15f2c0cc934b8afc592cd812cdb |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/eb074985d0a58f4f80d15e4b5b51b86bad6e25e9 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fc798b9bb5f789f3d9af42d1c45e6084119f1c3e |     
  riscv64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/6aae55d2701b504993d1d8b0763f9df57a3c4887 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b0dd69e6bf8b962457a29861ba4889f9dd7cef58 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2ee077bed1f753416311251db9446eee7aa35334 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e6cc38ecde9b06b87f1ad0d7aabde9960262cb1c |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/4f9933fc4249806f4b0f89b4b895d306ffa1b6f4 | ORPH
   x86_64    |          hwloc-2.8.0           | NOK | http://autobuild.buildroot.net/results/bdf74badf04a44c69994de7a3abf16b2f78635b8 |     
    sh4      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/ae218bd1cf377b46ef69f7052059ffad5a50dacd | ORPH
    arc      |        libblockdev-2.26        | NOK | http://autobuild.buildroot.net/results/4a7ccddd6f556584110f6f184e12eab6b4de1aed | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/24ed03152f154c487da55d8c35f2741f4b6e90ee | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0bf3e7ef0afb4caccd632c7cb4c4bbdde11e2cf7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/047e3e9605cd691522f25f12324369df5837c163 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2f525f133d5db18c699c5c94e688df95132a2ebf |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ea04d10f71ec7e417ddf97ea1b7dc9c70eb4556f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/46dcf49fd48734f59068b87b432be372300a809d |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5a5fd1f953f8029fd5bdd52c3416c927a9eed868 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/38f51e5c5b8ac1764ad5ae289199477a80e3947a |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1e445a7955bbdc9d9ca9e0c493b719f35208a7b2 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c229c1bc1712305d18b5a6cb3f04b1c2b97d4e19 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/47064b6c3fac7db85275f9bd1cc87f366a342eae | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/74c383cd6f5afe9ed37ab77e7b570f465bc0a7a2 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/55fbb9696e0835dcab66949418242f2d5847cb7c | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/61ecf60f9139907c49d93c6d40dabec335bcb753 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/99ef8967c7c295a50f56f5ba3743276b139ac870 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/d35644d3eb7f94ca2419455e72bfd22de4838cb0 | ORPH
    i686     |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/9e300a96561a100c05473b2da7c3b156984488b5 |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/ef51845e0ff4c85b12004889dc78472008b41f48 |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/504c26e2c9c8ec07f768c6ee21355f9106f6bc95 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/bdb4df265979fc0110360104e42352e613ea2455 |     
   mipsel    |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/54df4d828f4ec6e9108358ff8a0cb4bb96f02472 |     
  mips64el   |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/603696e4b13e8ca8b1a9b2237d7c16307e074156 | ORPH
    arm      |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/c52913f45909f4fbec8153418ef5bbac4d843470 | ORPH
    arc      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/be06a5c500fe1b75d6f7cefd8ee3f2abf565058c | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/891fd52ef36120e591eff61f29e5712110324c09 | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/eeff66c4505385aeddea01ad515572a37fd80954 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/86ca2aed32b32dc5192a9c608165c7616d31bfb3 | ORPH
    or1k     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/8cbb3411a8d0eefab6400f5ddc68e77a81745cf4 | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/2315a090ce46668020414a722e6985b0e07700f2 | ORPH
   sh4aeb    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/8bc31a9e393b01c4e31ca0bf2df0657fb5e8d574 | ORPH
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/ecc32b34be461b8e8d229e633f40d87f03b055cc |     
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/12a8ab12b27ed7cf9e9336a9f0fc26d4babf60f4 |     
    arc      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/bb3b71f5054ab0dc31194370f6186fe26b1e1654 |     
   mips64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/846a8cddb4cfc0b9342f0d7d98326381ac46a790 |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/5ce5aeaa8e849761e49ed14fa72c7d24e0942621 |     
microblazeel |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c62fb722af5b208168f46c6344854cc5fa68b0d4 | ORPH
   xtensa    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/4c0a2297fc26dd818ab50fc49c38d4f07d90d587 | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/81a0e8331b4456435614a4603a140e3488e57d6d | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/e1fc44018d3afea560d8ffacfba7cd322b690591 | ORPH
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/c7d03a79aea6cd85d09794d46e2bf664d44be59b |     
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/079b4d5093de0bd84ca52f30fb2423269e6f10ed |     
   sh4eb     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/6a2493c1fc1d96173ca80bda50c7952cfed3fa28 |     
  riscv32    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/e3dce8110ea45b519d3ce24e10f2866626645b5b |     
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/2fb8ee00fe383e7c6ae71f3eca7f735f1c91ba26 |     
  aarch64    |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/990ff8feaa119511b60e29a374337621c0a50324 |     
  powerpc    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/dc8a1b560af87a64dd4432443b3bb9255c63834b |     
   armeb     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/9ce7758b6d84a1eaea601fee91d7a80e188a4118 | ORPH
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/c1138c10134f3b45ec8c0d99239e6a4249fda5f4 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3010d2730cd9203fa7ecba88ced7ec72556e56e1 |     
 powerpc64   |           mosh-1.3.2           | NOK | http://autobuild.buildroot.net/results/b5200ca618fd639a291075fca2db14b2e9186e21 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/e1a7ac7395fbab5ec2b7659b76ab7f4e224a48e8 | ORPH
   mipsel    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/2c4e6cf7596abb316cf0c2a99888cb9535327ce8 |     
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/58d67eee43660872e13f931d2dad28e089dbe4f6 | ORPH
   mipsel    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/5e386ff0c95809706f4b1c7c68a64bb324fb7a0a | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/d11de88bf80b6956498e93efc0aedbb456b85bce |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/4934057685e04441b6269ac1eaaea95f9ef11436 | ORPH
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/7be95ef25326c2c9affaa1baad3d811f482e8551 | ORPH
 aarch64_be  | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/6a070f4bed815ba5c71e50feec891f1c05dd2c39 |     
   mipsel    |          pcre2-10.40           | NOK | http://autobuild.buildroot.net/results/a647751ef273d50052d771d4235dc26a243eabb0 | ORPH
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/c471d23142f47be3b91c962f1f7683a4e1dac8c1 |     
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/a139c406f3f74f6ce7f5799c2462875e8fdbdd99 |     
    arm      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/6b342d80d205e171cfda7593367acfa714a4d21a |     
    arm      |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/f572ca164d4502ad810bf2cff1e29ec48273a154 |     
    mips     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/c54b0f760916410b1cf50d76c744c3e946185d27 |     
   armeb     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/1e5ef63bda1dc0432d3536f6c2cf3b08127c4ffa |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/aabc45abd6fab3be5ed3b490d8862805216c0e4e |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/ded372c14ded34d44624f2555425e1cee71f65e1 |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/cc9bc2febb5fbcf47e92a1d1a7d247109958dbdb |     
    i686     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/bed64254ec13ce9f0121c7a93801a34aad258b86 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/22c66fd49b0501525bd9cdbf247640fbb10e312d |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/2f2b7d6a687ae7e556f7b7211707188f683fd47a |     
  sparc64    | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/19b0c32e86ec85bbaa10d28f0364e3f7206da613 |     
    i586     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/ace306d9575f93de0ff63d1c229aafaf2c8d3197 |     
  riscv64    | rtl8821au-e0b443940471c166a... | NOK | http://autobuild.buildroot.net/results/4526cb70ce91bcd5fce60ebb4f704a63f1ecd249 |     
    arc      |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/e6e35a715060e0e45021e989c661f31f0808eff4 |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/5a58bd1a7cca2aab74e71b36ad10a249af3a6ba6 |     
   mips64    |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/7345355b4196ffabed9e64c15f1ec537da483e86 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/01d081242f2739b3b84f7e04f3e7fbd0a54fc1db | ORPH
    arm      |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/4b766fe0c57b7e76ba7b14c0817a9708bf310e68 |     
   mips64    |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/0774fdc9e65416480c271fa7e8d95f787d79cba8 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/7a45f5df5448e26e0f1b38664b86cb0d7ec8943b |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/5521ccdb6c88efad9cb7134a0034748eb7cddfc6 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/95b61526a65dfbe16699e67e7c6a05c617df0fac |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/4065589be59498797e918cc1c29d93ec2701c190 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/fdda2b4969f9c7e95e27f63a337cf6c35258b099 |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/fe5b979cecf1f2f06bf65c77574ae764110d76af | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/c4282563bbc3b2f243b2f03a4cbc895b0fcb78f5 | ORPH
   sparc     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/634c7e194c7cb4563476651ec7dabb9fc9c6cf74 | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b13736509598401adca91d0548db720ad8998120 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/f7c9026d2da2a7eec38d43fe7877683ff5bef065 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/bf9329d5ecca45c88758d33234763df38a96e960 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d4082a4752b9c955e8ebea08db7188e6cc3c1b38 |     
    arm      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/08c9dd2d69d7a5b12759734df7fcd0397f978220 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/73f462681e1053b028eebbf16a962383a9521812 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/afce82bf5eab5e9d7e2d0505cccdd1542b554b6f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/48a46273253595d863b0095f5ef7cba770694d9b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/a8145435d4fe444cdc417cedc10d01c3fe732997 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c01bb6f1143cc93117fbe9a9e433713547eae14f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a3bc262887279de53fa5f77b66c7841c7256e985 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/3e58797da9220b05958b42a59445777281935f7d |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/07ce5f7baeacd865baa469017b20daa3fe4260cc | ORPH
    i686     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/156e8a4d500d884fea7e95bdd14ed062dee895f0 |     
   mips64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/40591671bfaf8bf05cbe3457ed5b5613e5d9a3b8 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/c28363993a077ee61a23014ccdaeeadac72bbcc7 |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/98f5f661cb7a20073e9c895476177a694a7d0721 |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/72f90e857d259953b74c1a75340485a35db18e12 |     
   sparc     |           xterm-376            | NOK | http://autobuild.buildroot.net/results/d02191c1a78f06ec9ad00ea57bf278e9e2df4d3b | ORPH
   sh4aeb    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/e31c59002286cfce4986dc4fd000a8d76356ff21 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bcc2d88369677935501985aec0a4d28e624fa942 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/daab30eb8d34a0ad471ca8875f80692a8c69d758 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/482d0c273077f17f55d20866e01f9eda47b91c84 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/3945ac25078cdd0e4f46af4ef62713bd5c44c3b2 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c7b7a517bbcc6a97f92944951934fe5457f7e228 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d5720f8d162affd650e031d000679c043ab9e35c | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/ae01b4d75233863846aedd182ececf9afd557ddb | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/54c0846507ce5d652163136e8b0de6f93a075bca | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/63c23e47bdb416d5c55da75921741cd8b26d710d | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8e3d2e6ee8b3ead99e9bbf44e5b2b8473afaaedd | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1e12a600d28f84dc0f282ec3b2ad14283b1d86ef | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/97b22c674b0f226425dbf119a0e367c0a4b4e574 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9c1638f44165d4b2cee4f48c42d594e7c24f953e | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/147f87137b820271b9bbed2fa888f09a75727789 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5c6239de024b699eae883135a49426ae000b121c | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0a1e7e51d0364aa31b94815b706fcc224d830772 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/26e4d5e3c4ed0fad3310d513a4e81a7b02039c56 | ORPH
microblazeel |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/428004dad8eb7f6a565868edc9d2bf6e36548a8c |     
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/52a16da67329aed718c0e48754495b5807123701 |     
 microblaze  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/d3da5782c51f2e0ffedb311af854eb86974eda8d |     
   xtensa    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/b3311f99580f76fc4d0caf5b28e9fc8c9b18a103 |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d5f4d115c0af3dad161f948ab61639a778767ead |     


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 3 
          imagemagick-7.1.0-51 | 3 
                gerbera-1.10.0 | 1 
         gobject-introspection | 1 
         host-gcc-final-11.3.0 | 1 
                host-go-1.19.3 | 1 
              host-pahole-1.24 | 1 
              host-rust-1.65.0 | 1 
            igh-ethercat-1.5.2 | 1 
             lirc-tools-0.10.2 | 1 
            lttng-tools-2.13.2 | 1 
                nodejs-16.17.1 | 1 
                     pv-1.6.20 | 1 
           python-bcrypt-4.0.1 | 1 
                    ruby-3.1.2 | 1 
         s6-linux-init-1.0.6.3 | 1 
                 wolfssl-5.5.2 | 1 
                wtfutil-0.41.0 | 1 
                      xz-5.2.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f3e75fffcdc73a3a4933f8032a736598720408dc |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/97612599475b3b6dbd4c9fac5ef1fc599d4b84de |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e87fc213aabc09224779658a25ba8b89a245511a |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8a75019339745b9416f25992b5c35eaf9a2d4855 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9ffd17862cc7a8ec4c842351226cd76ec57751e4 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/8a3f5d4e16f4f3623a886d0d10f28655b467c902 |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/e670ed89f0b08aca686fae6ea1869096db46020a |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/589c67044ef2b1e49b38c739bada485a99da1a38 |     
    i686     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/e0bcb9f65109590de4f282cdfb6d2fd913375764 |     
    or1k     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/0560bac65b79875ba42966323e7c07919fe9fded |     
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/4de527d0b06220a3ce83c3bee97e5d316c0ace74 | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3f57f2b27f383d850525a48e5e45e1b855ee24db | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/36d03e174882a59bd51a9247d4df3393c011e5dd | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c02bd8feee0f998b4fae5d3bcd7f0fed151dda96 | ORPH
  powerpc    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/4d912da3ada3058beebe343218fd56cddfe87e49 |     
    i686     |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/3f4220b056e1551f9351c8979a788e6eee2d7a47 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/25a1d7274145f06af30dce54a6b9347bbc4bbdb1 | ORPH
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/9c68503a8848923f42e1a0e5207eb05e86d3e17d |     
  riscv64    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/f443cc483a7b2ad88eb8c6133dbd04360b53c0bd |     
   sparc     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/01645258ebb225491dfcd7b48363f708c92c6869 |     
  riscv32    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/26590d058c9e1cea6d69ee94c9c8c8dd6373dc98 |     
    i686     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/6a07b2c5dd2cc3e45bc58a0ba1af25e4d915f8c7 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0b7b95195363ba944475c6734983d065c8b5aeee | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

qt5webchannel-fa8b07105b5e2... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | qt5webchannel-fa8b07105b5e2... | NOK | http://autobuild.buildroot.net/results/eaa3805f5191ede7b996977b7cb649acd120592c |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                host-go-1.18.8 | 2 
host-pahole-73383b3a39afe86... | 2 
/home/buildroot/autobuild/i... | 1 
                  davfs2-1.6.1 | 1 
                    dust-0.8.1 | 1 
                elfutils-0.186 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gerbera-1.10.0 | 1 
  gobject-introspection-1.70.0 | 1 
              host-rust-1.62.0 | 1 
host-spirv-llvm-translator-... | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
               mariadb-10.3.36 | 1 
                  ntp-4.2.8p15 | 1 
                 pixman-0.42.2 | 1 
                    sdl-1.2.15 | 1 
                 sudo-1.9.11p2 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/90d529363d4cfd1655f8b362b9cdb269484e24ef |     
    mips     |          davfs2-1.6.1          | NOK | http://autobuild.buildroot.net/results/3035ef05aba47e0c7d61a26da81b8eb12949487f | ORPH
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/c9f34ce10f7ff9ad1edfc40e7902259fb53eff2f | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/39a3f7489ac7a945a0a4b23557507ee3b1a3cce5 | ORPH
   sh4eb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/20e274becf977c22ecb9d821a85e2aa5e320354e |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/07b079f23d6076cf3697df01dc1a1f9d0e49762d |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8ae85ced0055a30d32c594f76d2fb35f372664b0 |     
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/0868dd83e186a0223a341b81df7e125b25f9a0b7 | ORPH
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/acfcadee63cb9e3500fe59b7f88bfd5f47dbc135 |     
powerpc64le  |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/f4f9d19019b7003100e13b4a511639093fa02fbe |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ef27b7dfd0f5dc7c68fbcaf5b02369ab4c0fbfb0 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/14c7b4864c95b57705334359eb7dcad93f4dbacd |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/5e871f2b181ca6759a9416e5e438c0d53a9538b7 |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/6fb17024f227ef740709b515c3c8f0fa235d49fa | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/180680a71b28cc66634a1a536d8493712017af21 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8bce5b101294eba0eb8c25a9cf438214379af23b | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/335a8822eeeb4bc8f169b4c8f4371fe710ebb6f8 |     
    arc      |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/4ab5c33026d7f4d99d602016639cd10b8f69a7a3 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/b6101b206c118cb1263cae141cfd6860295cadc5 | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/edce4965b49f54495d8c26eb87b72bbd94aa6ed8 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/3efd51839bf82922e109409e8eb5966f8a94417d | ORPH
   armeb     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/6680df849d4e72d096fe84f02339bc24e2cf2360 | ORPH
   sh4aeb    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/03434f69c581cd7efe647bcbcfda38ec72ac0a09 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/31ef704a28dd4fc978ddcabd54544d4b412271e3 |     
   mipsel    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/08e19b6a8948556668b838479990dcbdc13e3fa1 | ORPH
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b647979b6a62beb42b2455c2ee86c4678806cd58 |     


Gitlab CI results for 2022-11-28
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3386178738  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
