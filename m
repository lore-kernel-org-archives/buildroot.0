Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6359CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 04:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5AF281383;
	Sun, 24 Apr 2022 04:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NcUTSocNN-W; Sun, 24 Apr 2022 04:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37EEE81364;
	Sun, 24 Apr 2022 04:39:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6FA1BF5DA
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 04:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B12A81364
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 04:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmfZ6RgjTlDM for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 04:39:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D19A481362
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 04:39:40 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E80E64000A
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 04:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650775178; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FeoLWb/HwwVmrwHPJzXuF2PCL9l7f3nV26fU/pn2PI4=;
 b=lPwJmeS5igp+lpslpcE5fraQD8+82XNRrCtm7HR1lfkdCMyOgUYwn7XJZU1BY7eHL6Gspr
 RANHa9DROcNJE+8oGNBrkKcCG65NOeji4CGqSD4W58JUdBY0xp2G2P12rN4JXKRnl93GPu
 jhntFoE88QhOcyAwTWkgCqE+HpLMvzO7JLR6i+WB4sgDAxA+YJTENjWINl3AQmzT2swB9B
 ivk2b6B4+da0dtZSzKvGEWKA2I5VzTzG3qJibzl/virn0vX0OVMIiO6KM742cMi72lNb8h
 aJDVaGPf4WkOJd1wgynBL6AlgIcmoIETaDHr6aqkfwK+dIJUScHP6X2/knaaRA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 04:39:37 -0000
Message-Id: <20220424043944.1B12A81364@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-23
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

Autobuild statistics for 2022-04-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 24  |  5  |  1  | 30  |
    master   | 164 | 338 |  1  | 503 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 42
         host-gcc-final-10.3.0 | 17
                    git-2.31.2 | 16
toolchain-external-bootlin-... | 14
             libopenssl-1.1.1n | 13
host-elf2flt-7e33f28df198c4... | 11
         host-gcc-final-11.2.0 | 11
                 uclibc-1.0.40 | 11
                    ttyd-1.6.3 | 10
                  zchunk-1.2.2 | 9 
           host-libselinux-3.3 | 8 
           argp-standalone-1.3 | 7 
           host-wayland-1.20.0 | 5 
                 linux-5.15.33 | 5 
                 zlib-ng-2.0.6 | 5 
              host-libcap-2.63 | 4 
package/pcre2/pcre2.mk:33: ... | 4 
              pcre2-legal-info | 4 
polkit-a2bf5c9c83b6ae46cbd5... | 4 
    toolchain-external-bootlin | 4 
glibc-2.34-109-gd64b08d5ba7... | 3 
  gobject-introspection-1.70.0 | 3 
              libgcrypt-1.10.0 | 3 
                libressl-3.4.3 | 3 
                  tbb-2021.5.0 | 3 
                     ace-7.0.6 | 2 
                  acpid-2.0.33 | 2 
               aircrack-ng-1.6 | 2 
                    bat-0.19.0 | 2 
                bitcoin-0.21.2 | 2 
                     frr-8.2.2 | 2 
fs/f2fs/f2fs.mk:64: /home/a... | 2 
          host-erofs-utils-1.4 | 2 
          host-gcc-final-9.4.0 | 2 
       host-gcc-initial-10.3.0 | 2 
           host-nodejs-14.18.3 | 2 
             kismet-2022-02-R1 | 2 
               libcap-ng-0.8.3 | 2 
               libglib2-2.70.4 | 2 
linux-headers-5.10.104-cip3... | 2 
         linux-headers-5.15.33 | 2 
             netsniff-ng-0.6.8 | 2 
                   perl-5.34.1 | 2 
                python3-3.10.2 | 2 
            qpid-proton-0.35.0 | 2 
                   uacme-1.7.1 | 2 
                    vlc-3.0.16 | 2 
                    zstd-1.5.2 | 2 
         argp-standalone-1.4.1 | 1 
                      at-3.2.5 | 1 
                   aubio-0.4.9 | 1 
                    azmq-1.0.3 | 1 
                  bcg729-1.0.4 | 1 
             berkeleydb-5.3.28 | 1 
                clamav-0.103.5 | 1 
              containerd-1.6.2 | 1 
             ctorrent-dnh3.3.2 | 1 
                    dhcp-4.4.3 | 1 
           docker-cli-20.10.14 | 1 
                elfutils-0.186 | 1 
               erofs-utils-1.4 | 1 
                  eudev-3.2.11 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         gobject-introspection | 1 
               gocryptfs-2.2.1 | 1 
              host-delve-1.8.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.18.1 | 1 
                ipmiutil-3.1.8 | 1 
               libdcadec-0.2.0 | 1 
                    liblo-0.31 | 1 
                   libnss-3.77 | 1 
               libvorbis-1.3.7 | 1 
           libwebsockets-4.3.1 | 1 
                   linux-tools | 1 
                 mesa3d-21.3.8 | 1 
                mongodb-4.2.18 | 1 
                    musl-1.2.2 | 1 
         mxs-bootlets-10.12.01 | 1 
               netatalk-3.1.13 | 1 
                netdata-1.33.1 | 1 
                  netsurf-3.10 | 1 
                nodejs-14.18.3 | 1 
            ocf-linux-20120127 | 1 
               openpgm-5-3-128 | 1 
                    opus-1.3.1 | 1 
               pamtester-0.1.2 | 1 
                    parted-3.4 | 1 
               pipewire-0.3.50 | 1 
               poppler-21.12.0 | 1 
                    pppd-2.4.9 | 1 
           python-zopfli-0.2.1 | 1 
                   qpdf-10.5.0 | 1 
            quickjs-2021-03-27 | 1 
                     refpolicy | 1 
rtl8189fs-73f826f0fa74b2fc1... | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
                    ruby-3.1.0 | 1 
             s390-tools-2.20.0 | 1 
                  scrypt-1.3.1 | 1 
               sdl2_ttf-2.0.18 | 1 
       shadowsocks-libev-3.3.5 | 1 
              syslog-ng-3.35.1 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-bootlin-... | 1 
uclibc-ng-test-0844445e7358... | 1 
                  uhd-3.15.0.0 | 1 
                 wavemon-0.9.4 | 1 
                wtfutil-0.41.0 | 1 
                    xen-4.14.4 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/ce1d2b15a403c9adc03af1f50a38ca2322343f55 |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/b278c2e0983fec6a41d2c1a158e9520ecc30d7a6 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/3a2852a8d988caf649cd69ce587c1bbdd6ad828e | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/2fefe45d5c77dce95a5cfc9ab35c44bb5cd8425c | ORPH
    mips     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/26ff8b3eef8c57020f80a6787ceb627058790fd5 |     
   x86_64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/c235a45db046c4709933f2cc2ae301ece1f3d87e |     
  mips64el   |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/1ff19858b12a325cd0e5fb14bcbdd1f4a53e1efa |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/f655e5aa1edb6ad6a48bd85a7c826b7343956dbe |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/4135ca14c1c0bbcae1052b71e3ff76c0d0b3febc |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/19fb09e70be245ec21e90fc3dee0d2734aac26cc |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/44765f623704265fe778ebe997992771684b0229 |     
   sparc     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/255f875ede96cce0626deae76eb8e432e2278fa6 |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/25475c8661ba66f0ebefd6c4215142d643075673 |     
   mipsel    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/adb9c4b747352497adbc9df866709b17fe0f9755 |     
  mips64el   |            at-3.2.5            | NOK | http://autobuild.buildroot.net/results/73dd573b616d1223f2ed7f25bf0af63db0b7b727 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e6f0e9b09e4b611daf5bb37091610d8de80f1f4d |     
  sparc64    |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/85197b3c99b814d82f78e436f0281a705ee39321 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/40fcd346235ab5868306fb36925f3389c1503c8f |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ec765d9e9a2d85f061da8bc6ba06fc26415b3e23 |     
    i686     |          bcg729-1.0.4          | NOK | http://autobuild.buildroot.net/results/893159eabccb3032827528409c7234c55d72ad3e |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/67fb97c6230a4c783277733a8792b1c1ccccc9be | ORPH
   s390x     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/c03c31509a948b8f64eb45e2e98b5259eb8ff547 |     
  sparc64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/bec67029988e53ef9fb65bae06397e39ea0906fa |     
   x86_64    |         clamav-0.103.5         | NOK | http://autobuild.buildroot.net/results/524ee31face8be6a813829b036c4d6134ee5ca98 |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/bcd24683913b8cafdba2607997e69095c9ed328b |     
  riscv64    |       ctorrent-dnh3.3.2        | NOK | http://autobuild.buildroot.net/results/59272187ece2f6c447de1f2210f1731c514e1c54 |     
   mipsel    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/2b91250a7af9f54def574446015eaa5689d0c46c | ORPH
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/5ac7be9bfd0f6afd01d80d4d36d401923219cb60 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ec20945c3c67ac15e6d871790544da0d93804cc1 | ORPH
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/1fc55821e135d6c16bfa50e30d51d80d8517d491 |     
    or1k     |          eudev-3.2.11          | NOK | http://autobuild.buildroot.net/results/22b0b5b78ddd6159de717daaa981fc7f48697818 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/248454819919ec0e62109eed798401d90960dafd |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/9cca142c9fd842073d608b46a919e17ee4f41ff3 |     
  sparc64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/aa17a761caf84107dad7fd8e1252bd5784e344e6 |     
   s390x     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/5629675ccd580bbe0caf0dafd41c21904073f2d8 |     
   nios2     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2b0c88f7bb707ff71d86f9798c286af3c4b0e990 |     
   mips64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/a6ec1af12d5be570a9c734128d868f0b448212e4 |     
 powerpc64   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/350ab7164b4b23d91cc88d0961268fb736dc9b79 |     
    or1k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/097c3e3dd4e21a9f059cac4fa4b093939b82e8eb |     
    m68k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/7653b7436762daa4e9ab6a454c769e600f1172b5 |     
    or1k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/8a91b957fbabb7cbb6ee8433b4a87ca6dd0f6608 |     
   mips64    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/0ce507811a3b980d7632485ed9f21aafd784ec8f |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/96b57bf8889143e3e3a9d9f85fe9e5fa84fd511e |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/8bcd5cdb269aaabbb8042e547fd3c1ae413f303a |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a3c9e2d56fd73b54712c08f5e3fe2245d75cfe24 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/510c2ae8aa0042ec410638b9046a45051a4faacc |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/8b2810c4b93f7489dc5fd7d184755a0130186231 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/82b1fabd8f24e83663185daa28ca1def2fb0839e |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/388a451f683c682d79059150f568c6db1c063c3c |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/2c6cf629e3e77cdc92c3744fdf94439bf5c48502 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/42104e462a2476c9ec537a839eed6bab716c4e20 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4732219bcc7d9e0048cbdcaacfa37ed2e651de98 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/0b7cabd5ac41dc16051ab054b19b7811ced19a96 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4ba10d3b1ba332f6567122938bff04a155035afc |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/db6f65f614bbdc9fb9134ed9fc9a5efb34b578fc |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/5e58f95dd1cce0c4ea4d171d56cfd8c7d2be6388 |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/895d15f6214ce970ff2d7f301c8b2a0d485c9a6d |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f03b8828dcac0062f617f15277a0a6965703f17e |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b97423fd568d2f59ddc014a1560d9d14d7c498a0 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/da418774cd942c6a1665f8b5045323fb37a7cc85 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/7b7ac4636e27184c186efe77ad86626a260a9b7b |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/68a334eb445990fcef32374d80bcebd6190a8f1e |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1d5b225a3c31015b21251ea26817f21880c66724 |     
  powerpc    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/8d5dd2a297ee271ba4465489a88131ff62dbc639 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/38db813b7a0f132115bc1158f6d6177143cbcc3a | ORPH
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/f5cf2e1635f5d2facfef72943b12e51a837e6183 | ORPH
powerpc64le  |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/7866d6bb3ea841a84950139f5114be2ff9c43cf6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/150b2754f0e65263384c2f47d8439c76ba34bf7f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b59da5dfa690a08803f940148385ef862a107296 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5014f248a18b81d1d94a1b1ecf1ebb6dbdc490c7 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/21d86b764acdcd287f8a5fbe514bd2857e99ba06 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ddcc118ce8ac6fc9d724ed191124ff375e4dac9d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5e1ad44918feff163bc8a2b66f58ec326053dd12 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d861a1c06fc0d4e87a08793967418164b6f383f1 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/93d95659870080082b31914d16afd57d6eb3c669 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f2e1d13b10902bb6849e8fba1b8fd24768d55754 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/86e71b30e256911b033b6391c7f7416398263863 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fdd3671497fddd8ef62e53341414436e3ed04f4e |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f2137300bf7b248c888341ecb15eea1840159c25 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d101ebe98f178abcab9c2c8e126f6bd58376745f |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2830fbe1df369f9bbd874fe01187743fa2d1721a |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e219ff65d685a56118ae20ad6be8a67c5f45915a |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ba1aeba5e2357e819dbd9158835f0bf3d99cdd30 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/88afd9a03bcc359d227c9adcc707943a67d69be3 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9813eb1651f0e68a0c9a9d554abc95146eb6106a |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1be2749ba105155b25b17c55f95d16c201bb8c63 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9208ab138e5fda0efa22f57f9a588f8695585b49 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/17f1e952a2513ea2286248ab5d87a8871c296fbe |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/89a620c1f0ea34da1c246a1bd6ab13067a58e513 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/708ec49d02715c33594700f10f9ab24a020dc079 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a99529eb6ef8bb8595cc68a33d17509af52686ce |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9cea0c8369542fe494794d11d492a377db6b0dee |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ee08818d802faa366cb9147217f7e2eeb51ccf8f |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bbf521377738f66c5fae744e144ca4f950fb54ce |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d772402b37344bb7530fb638e3796c59ad993ae6 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/791bee1c384f238b21079b7d545edd84a465fe8d |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d05c9c2a439a22506c2a1f3ee0ec1abbf8117061 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/013be4d821b6b399a1ca7421740219798070fb2d |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/12f5db16955026274442e1a2a5436f88ebd3d4a0 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d40f4b573f89801557426b52d9a128b10c32dad3 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ceee8280f4dc11d74040efb2c8356082635bf379 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/48d401f2720d95b5b014d79ba064424104a17a0d |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8ddf1bf5ba685eaaee0d4f44e24dc484fb83dc1c |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8a753605c5ca054060626725068b95fe93db177b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1e4e14113dd429d49bfadcd0e39af24c0b2af83a |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6f3c1fbf4477533fd8d0c3c9860c1bd657dd1059 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/40485305e900059d2ede37c94e8633f38fcb0e25 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1394b084b5d336ddec9a83b00a45a3923ea49726 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/37d285ddfcda952f57fc09b5d76a60bc1bf7fbba |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/1f6a11830dedcfdd6c3780d497ecc82676711b2c |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/908f21753b9aa1ce864febc08348a4e8d945fea2 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/6ffc9efb7a74052e321796bec941e6e36c2a46f4 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/3319aa899a24b4cadff7fa8c86f5038871f76202 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/40bf5f1dda154bc00cd3d1072a5e8bf537e8d4be | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/3808ad4929e3f0335b9a2b208ef90607d9579a40 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/cc8828cf85ef2399fdfd2007d1a42421ee7bb3b5 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/1e0764bbcea83b5713a9bdb0be79882669f6b187 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/1605811fec7573d62c65f54fc2361ca4aec08f24 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/33f5af310a2462024bfde2cfc7ad0092ae089cbc | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/aa2258fd211d7cf5d250d72a5d816a56526cdee6 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/8ca9428ee76e9f276428c10eeb6415bb4fc79076 | ORPH
  powerpc    |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/c95a255b5fcd22026f12bea7bc9ea4cc9d7347d5 |     
  powerpc    |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/743c87306314692caee8d4089cc265fa516ded25 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/62abe44689ca5e44ab290277b9d0d0c3355ea923 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9e241464b3560058093f31158ac086d5eb9496cd |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/41862c970f935ccb5e85ef148ae14205cf388f70 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/56b6d8d15038aa16ae02ebed7df76b7620108ce8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b2473895bf83124464ffdc78ddac525cdab3670f |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/aac456ec4187d8dc0f636532d0c6969ba181c135 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/760039a4785665f8f0b06a2d8c31291de4d06ffe |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/87039bc76588617386f752c496b1c7f1af6f63c6 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a7871007e30e581e45766a0610163507747b5096 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/850355365150862c4b3a7397be50f10ebc623a82 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/75aef30ca22eecde37a0023897f8af8137b09c85 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/df3e799c7d7de3bca4df2f3e9439f6f900ef6866 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/33f6b28fe6dd69b732f1f28e931d09fcd355c217 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f035209777f7176796f9f9f6b0ab0870c5e59453 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b4367f8b92b6aa1c3afcb6e265490d549472ac1c |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/377f1de26da08262805c4b1e8625768289a63e8d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1700fe029d255bc77d6561836d3516526b8176a6 |     
 powerpc64   |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/094586de0d5f0dc35584f9f857e30190b373a013 |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/929906c060a929b9284880c6baa2816d793408d2 |     
 powerpc64   |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/a876ed81237ef2f439354e9577a84c56be192946 |     
 powerpc64   |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/063a2c1faf2fa83ba94fdf7041bd9c5f702d67b1 |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/c15f09d9139e8716728682661efc83f72cc69fca |     
   x86_64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/bd0c1f0c58917350bfe9556f67dbb44ac143bab1 |     
  riscv32    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/66d93da37a062f55fe727ba5e891399ee20cbe33 |     
   x86_64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/f26eb3a56452f74f00964f1c6b5ad346981d5978 |     
   x86_64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/ac38554c4beb0ae8855d49589db8529c2044cb63 |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/6b7144ec0ae016d508bfa9175dd61fc9c3ee43e2 |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/7bee04108abedc0d0d6afbd57e177ed1b1c7935c |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/29e4a15b91ef2349a74c6901cc51e76c8d4b23d1 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/a15c0ac69e83a9ca310ddca13887baa8d37c0912 |     
   arceb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/c2164d7f3559fb36199ef454e190fc641f86fe33 |     
    i686     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/ae05757b495acab8f04fc978afa1875312229869 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ff17384fb775ef9dadeb0e9d06186310b042261b | ORPH
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/fb19830c41425e09ff6c5dd1551e8d964a72826c |     
    or1k     |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/5529e9fc41ec8f15ea049eab4fd9029c1de790c4 |     
  riscv64    |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/76ae1a79fca75ee2d02603f0c17753557c31ed0e |     
   xtensa    |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/e7393a49d0a2e55b313e10a682e4a16c447d61ec |     
   nios2     |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/c083e94b244635f7dc7502290fad9801cedfbfa2 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/a438a322182439b35423d9180bea280f50c17b13 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0de1eb0b99ba5424d66d06f760a9ed43b47dff33 |     
    sh2a     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/bacc5971ec9b475b2fd1158d34ca0f024b701b93 |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/6d350465c0d6ea6e66d5a918d481dd82f3b57be2 |     
    or1k     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8d6e5f1fa8445d3269e92372e935c0c2e626c4c0 |     
   mips64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/d16995f0decef9c9bf58cab4fa30f7daab6918fb |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/fee8f64c8f029bb6ef696c93dcb60fdbd1dc7ea9 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/68e962ae8a8932e41c90748c0d975e06dec1d3f4 |     
   x86_64    |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/3938e7dc64372834f13431c55a5740558588ec41 |     
  riscv64    |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/d7b9ec0b771d0e7baaf6b41df4b631f6ea73eb46 |     
   xtensa    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/2665cce484b529b27e859b9949e11bb180759c98 |     
    arm      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/9ff7f7d2591e8e4117599b1e869a6b1f08567406 |     
  aarch64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/601036e25b95d5dfab35252d3eb5afc94a760cfe |     
  riscv32    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/877f6a3c21c64ae8373d1e6ef3d7af3c4fa67aa9 |     
  mips64el   |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/73c7fbb5c8e655d54c5228629953c9e1618e3627 |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/09e29529d8946d092a846f43d3c70caa688e5226 |     
    m68k     |       kismet-2022-02-R1        | NOK | http://autobuild.buildroot.net/results/570356f958697d4e8dd3fde7618ce9a6c677a2a3 | ORPH
  mips64el   |       kismet-2022-02-R1        | NOK | http://autobuild.buildroot.net/results/6dead0f327b18bdeebafff30bf9e28f66676dc73 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/582a5192c1bd023dd9bc262829225b4c93dde04d |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a4d199d466d55b1fe037c766b134630915a081bd |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/b977b4b7ced11e8f265516c81f14b3d4170acbcc |     
powerpc64le  |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/1cccb88db1cb4aa0c4ec6c9025b2c1a1abbf83c9 | ORPH
    i586     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/c194c45d94537917eeaa41806fb0b4b672f0fd91 | ORPH
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/20b8c796d40fea4f8af259e05b868df2209e4817 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/b2c37779fb3b08ca4aa182c8c74d4692771c72df |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/470a7e419d17298bc368b5e2885f93da388b5343 |     
   s390x     |           liblo-0.31           | NOK | http://autobuild.buildroot.net/results/82e034d80530b825c4a8b48a6c9f3cb53d9e16c9 | ORPH
 powerpc64   |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/3e857c00093579aa4d30df2a12541a3c17d908a7 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/eab02bb0e4872ae133e9db73b2802f82ce5b4f27 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/b06bd5c54b82ec1961d70d41a2cbd38458746153 |     
  riscv64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/7e839da76258b3356edc3ecf86646480da1ddb23 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9c173ee09639d175be6cac41e6191bd9e6e4d199 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/b4579e6c2abbbb209e94aa902eee384fad489524 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/556c48f45039d7f9bed3f5ce663c289e9f6a3cc0 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6ba83db8cdd2c8df98359a07254b905d35ba41b4 |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/92465e21dfeb718745affb282ebe62fe86625d5e |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/2989b84ade80093792804deb8b77882d3464eb65 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/a0fc0f5e1dd96b0c9a5a0d566a799f0b7391b11e |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9490fc0cfa00b0fc6bb805c19449d9ffb04fac27 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/e2257241834d7cfc8931ae48cc7e51797b45df6a |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/215ab3d526fd3d361dacb09bee6fc4d05e4e4a54 |     
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/69a014c15a0728109bdd6c73e322ad1e69bc2398 | ORPH
    arc      |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/57b744fefee4fce88c58cfae874ad435c75883b9 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/cd396d413a321cdcf722032e163213ec03c54118 | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/8d00164d6235157bf2b76613e5cb3c41b7edaa12 |     
   mips64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/7e39128718d07cc045bb9d2980628532368a7929 |     
   nios2     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/dbeb32e14d4fbb0fb28cb45ad38bcd7317f31f61 | ORPH
   mipsel    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/1c8b7e7674767d756cd41272471fd7192f6e3ae2 | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/ef85e0644149b43dee51dfdd09c7b93e759ba88f | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/020a5857059f8393ff3d22f6be2ec435f834d452 | ORPH
    arc      |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/6f3456f744c9d24abecbe90caed627461ffc2ec5 | ORPH
    or1k     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/a7409555962b03ac1617b0a70fa5551d34b61901 | ORPH
   mips64    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/e88984af0fc8e885d0e0e20fdb37cd2dfe154439 | ORPH
    i686     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/9cc760aaf81bbb5841e18db1c7d0d9f6443f85fa | ORPH
 aarch64_be  |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/5538f258c2b97769e6e22803cbca53b826562564 | ORPH
   arceb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/0cf662be054a99a61eaa3654c3da6121b911cba0 | ORPH
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/a77ee3aceca41b82b533348cf86d73f16f13e95c |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/da8ae226842567a144f8b2aa2358885bbe729631 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/6623a24008dbe8a23405dd65760a1262c3d2f379 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/8dac04915d8924e055755df56c8c3438dd0c69c6 | ORPH
  mips64el   |        netatalk-3.1.13         | NOK | http://autobuild.buildroot.net/results/adb081da4d57aae4a018b278e6eb5093acdf66a3 | ORPH
    or1k     |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/41fbffc1d40a2fff2f94562032c6f87ff8da8036 |     
    mips     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/dfc442162b7351866a94f7f49e3c8d06d24b59d9 |     
  mips64el   |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/4fd1aaf9658a303b5d26ef3fb8e760d2423c9a03 |     
   mipsel    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/51d1ceedef498cadc031fc6fd427cf2c26758258 |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/789e37fea3fb21cb5f11b6e95b27297b7e625b74 |     
   s390x     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/4f052e8a6d95e234b8fecd241e441bb40859d74f | ORPH
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/4be8ef7f9ea976be86bec398cefb4be597c7c181 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/41fae0bd6dde3e412f2053e9e11472ed6901516d | ORPH
  powerpc    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/074fa127952e0a688fbb81b914842fec6f212687 |     
  sparc64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/236e026b009b6239e04954075edc21d4530383c3 |     
  riscv64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/f3a2f62afb002dfc91f000d10140cfaf9f29c2c5 |     
    arc      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/e8072df64d357db5f063e7fd19da379e0c3cb76f |     
   mipsel    |        pamtester-0.1.2         | NOK | http://autobuild.buildroot.net/results/7e692465d86e8f36eab8c9d06048c72ddc7dc796 | ORPH
   arceb     |           parted-3.4           | NOK | http://autobuild.buildroot.net/results/4100fabc419e4b68be8200660b875b9cb3e424b9 |     
  aarch64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/275c5478d63d3d4016d440870e96f04230df69d6 | ORPH
  aarch64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/4081ac1861566409f0d3a6138a7509c2703775d4 | ORPH
   xtensa    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/947d049b551e4eab4476e786fc5d3bad0318e17a | ORPH
   mipsel    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/596551e6d0359a6e666f9dddd27b7ed7ac85670f | ORPH
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3992ade25915277d67adde87bf001fb94863ad5c |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/830c2e6949f7aacf52a7216b3439bdc1f556712b |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/b1dea433a458ff4206f0b86366d5c59646c95b6a |     
    mips     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/a410d02bff00f7b92b070f1e97cf269f2099cf99 |     
   s390x     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/85ec983ab31257b52d71e37ce8be452e30e5087b |     
    mips     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/068481edf15c35d4a4f7a931883d7ea420504c24 |     
 powerpc64   | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/a30854c20b47c1a1e368c8c45dae6f90a861f339 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/d2b2f402b9c0fbf0a75667da95be690c6c9984fa |     
    m68k     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/1301e8a740bf0d192914a8d432b8f57acff4a67c | ORPH
   nios2     |      python-zopfli-0.2.1       | NOK | http://autobuild.buildroot.net/results/442ae4a02e691b4039d1694620f6284906cdc97f |     
   nios2     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/3eb992740b1a943a6f95e09393ca7f307aa8e480 |     
   nios2     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/703a225405a3ee0ab77267874ada2540c5b3be23 |     
   sparc     |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/b69e6e380c47bc64c6555899c2f61f57bdae7ecc |     
    mips     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/8a68832e8b0fdba68b41c39c5149ac1955202eb1 |     
   nios2     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/53778bae83ab2b2fbd1a2e14ae4dfc36893e63c2 |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b6096d84ce3efdaf6303479d33740677a3cc6f00 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/58a606a085873de6b6c4d69608b2de163a84f06c |     
   sparc     | rtl8189fs-73f826f0fa74b2fc1... | NOK | http://autobuild.buildroot.net/results/51e95561103e40ae94f38b9bb944bdfcd4ab50ed |     
  riscv32    | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/74b8cfc44ddbe72bbb6f0f27ff8eebcc4d091584 |     
    arc      |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/7104fb94bed1a5cc30bee3b647d83aa3b1e1867c |     
   s390x     |       s390-tools-2.20.0        | NOK | http://autobuild.buildroot.net/results/b06efca9b6e0c58792834b16d15c8c2d0f1c3e6b |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/8eb33d1f552f63a38e7b29c8939ec5076a001ad6 |     
    arm      |        sdl2_ttf-2.0.18         | NOK | http://autobuild.buildroot.net/results/bff32aec18eed89641e3130d547a1284a196c146 |     
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/42e1c0c0c2b338cfa4afa17dd4c00433bf3ea334 |     
 microblaze  |        syslog-ng-3.35.1        | NOK | http://autobuild.buildroot.net/results/03cb3f6d826c2f5f02f34f071d97b36b9e370f3a |     
    arc      |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/a1fe1a737895ace8fe999361b1e6f16da02a4124 |     
   s390x     |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/7c73f311666a463ac0ed410e7dea606c8828f3f2 |     
   s390x     |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/f5c3607ac35117dd1a831cc92c534897d985ed1f |     
   s390x     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/5f26c47e9d83738672e1297ecb15b24950538d52 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/ef1b603904c6d12c2e1ba779f19ea08d50fc95db |     
   sh4aeb    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/d7185ba67e4176cb1d9a8c5d353494abe8fdd1e5 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/bb573c2fdf53e32301e1ca0e8714cdc9d0d7c7f6 |     
   sh4aeb    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/3665d80bae7f4ec92b4868c5e0515862f456b933 |     
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/05b01deaa1bd422b818c24e3453410d1666fff0b | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eba66342a820e9a81a49d4099b62c0cda058a9f7 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7ad00b51c0cbfed3a7c69912822a4f1464ba6abe | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eec0adba76d51f0f151208767380f8cacf05a874 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ad58df0343ebb19ecddb1da5c29261b3ee3a37a7 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5735dd85e050fc5120a096a8f4e0226fa3485d18 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ee093a81721dd3dc97ebb2895b29d31e8a2303ec | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/71f559374b0487731ea86bca405e479c3d9b91b8 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/24b1695c19f6d22826b36e1506de6e0ee88a70f1 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2c07e2396475b0831417dce92b0a24eba918b8d3 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/99cedd4820357700a82ef24cd4b08204d94b15cf | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d181b575ed6bf4151890ae1b5e038ebffe8d991d | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/45c44f3520820552616851f0e1197a305d705adf | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ec68a4600471b09851661379ad70ee5ae0d52cee | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a7a53846b04ca7c368694880af769b11748904bb | ORPH
   s390x     |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/d7e28fba959a288f9c102e9e580391c2054f23d8 |     
   x86_64    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/3488de6873893b6e5fce886ffdcd3079c7faa7e0 |     
powerpc64le  |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/2a8c253f2813b2f1ce9b8c704f072045296509e9 |     
  riscv32    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/da7982b1b3e43b60bd05f2b9fb75602dbdd9295b |     
 microblaze  |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/b25e68328345bb3e3e08e75023a856efc7bd7685 |     
 powerpc64   |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/b194175b43912f43aa91bcbe13e38107217683ed |     
  powerpc    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/64b7852cafb66847acce19b4e8e908d348b6a29d |     
  powerpc    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/3e4b6936a03a64489525c86dde47663411c5fe22 |     
  riscv32    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/6cba134a7802952ff610e3be09d29b4b74d3e048 |     
    arc      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/ff8e03128e94905279caa58cb5b6155060826214 |     
 powerpc64   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/e11ae53f8ca04547cee844c24f25f546c5279cf7 |     
   arceb     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/592ca93af693636ae2f491b82a428ba60f0f1129 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7b5770169526af9af8df8d9594b55b57bf23188a |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/cc2d52e552dc3f6446411bea7aaa3d36c6582595 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e3480c8cbbe2fbad7b878c4f54d4c470bf3db5ff |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f721e20428e192421b9295f73d27642d162b8ec2 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7339f9891c84c2e486b2edc701ad04af71df40b2 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d5aa4cd9e2c5868b2571c117edf6b4381334bc86 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1007358011be55ccd49290de6b9aa06ea5067668 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/50e0f0f817e2100357c7b84a9a384c9f81bb7ae9 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7bfa856cf2fd52e739e3f62278976641d805e3c8 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c14748591f374018274bd0eec35db692940722f4 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b82df5c3956e822f343e25bf3fac32d9fc6774c2 |     
   mips64    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/e4956e8c0f1cbb6441bab17ebae9e414f842e8e4 |     
  riscv32    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0b91bca5fcda9d16c0196fc678e4266c28da8db2 |     
   xtensa    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/05619468a8f1be8676c556ccb646cfb5ebce2955 |     
    m68k     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/bc8e2672592028d09aad3f7e39acf46aef931300 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/947faae47c5ff605cc94933da10ed4464dc9f916 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/3ef9baabddfc1c5d39c978fa9c56afe32d4edd61 |     
    arm      |           xen-4.14.4           | NOK | http://autobuild.buildroot.net/results/779c95c959ac9f59dfcfb836cf1b84101765e1c9 |     
   xtensa    |            xenomai             | NOK | http://autobuild.buildroot.net/results/8e7e979a8c5017cba28883740e6290cf094a9cc2 |     
   s390x     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/82c456a714e413634416c937d4353497e51c7398 |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/8b24eedbcc0f446c8ac4912847f997f65e4462ef | ORPH
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/6615c04510286c8649a2ffe3e865cd3f301e64bb |     
   mips64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/273be05265647e6a4933238c8e51f96ce88f9f18 |     
    mips     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/3d33e5b7544b71897e4fc7ec58de4c62188d41c0 |     
    m68k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/6fbb531acc9810149f36fd4f913ef3c575c9cbf4 |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/55c88543f659e6fcebe0cf64346c19f7253003fc |     
    or1k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/b5e243be965e7b198648bef198f420f3fd1dc882 |     
microblazeel |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/51b968d51888ff4efde719a6ccba906e360ccb52 |     
 microblaze  |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/3f473e17382e4cd7d0f90a4ce2776258d00e0597 |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/32b5225a3e973a48df940a5a648ed9db550f63b1 |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/28f285e412c90185eecbb8905afe412f0fee2816 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0c05f5850ec57fb608354bade37b212269606d49 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f73b5cb5157b478faccb5e3e003c6086047f72f9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a8629e263e1ea731f1f2bc8ccfeb4982bbd4c4aa | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/41b5b34adac9f2c4b54bbcd7b0f09a41b8c99d09 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/33c8887bdd745af20da34ed54fd347c9e0988715 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/7d52b523b1b9e5b1aaff8d63d2929d847f6126b2 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/db26d7284cdd4d1d8d3262fd67b9db38e24ceecf |     
    arm      |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/46132594ec9e4ea5f69fe567697d8243ed716bb8 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 3 
             host-pahole-v1.23 | 1 
                       libuwsc | 1 
               poppler-21.12.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/45dcfee26ab78f50fb6f8215041455a17931ab0f |     
    m68k     |            libuwsc             | TIM | http://autobuild.buildroot.net/results/9ab10fb18c26481f99cb50abd1ea778168737568 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/7c1cf4dbaa6d47ef87c29173861c79bd74a51e35 |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/04d591533ec086cfc075e2d9462ea592625597f9 |     
   xtensa    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/59a0377c8c8d39dde7a046c39d1181ffedab3c08 |     
powerpc64le  | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/7aaca34bb51c9ebcd6b2cfb798ab15dba4b8232c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
