Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B053CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 04:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A07141054;
	Tue, 19 Apr 2022 04:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-utzZQdX0s4; Tue, 19 Apr 2022 04:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B24B141046;
	Tue, 19 Apr 2022 04:43:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3CC91BF2C8
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 04:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0AD841046
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 04:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yE1tiQxv4R_o for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 04:43:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADBAB405DF
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 04:43:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6E9E5E0002
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 04:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650343397; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c1ietaRA0Slge5pHROPlUy/70dzJjgP6B4/50wRnwkQ=;
 b=Ka05CgdNhhbZSBrvvUH7KGXSSX4lbjlcroocPxmY8GvvSFxW61mUzKVI3voe+5a168gx/x
 WQHjOIr5pWhzkVTrKJSCmfA4IWsHYIj8kHXvYDTmuJKOyFrOS4hzs1AsPlvkn1C7ttUppv
 P7kdSwk4FQTiTgr9C05YTEB+XQ8y+M7HP0hzd0YvM6TZiRcna+6kM/DFbEKwXVu0bGY2+b
 lQl1u9AbFWTpSeAUYhAklZ9S3LKtXx3Igsq/rB0O8sLQWytTk+fFcKtorzOAFh/i+iNblw
 DOyrLsDVuvv5JRJ8oQx/0t6qJlsNErNq1ez0hFnVLCuG+TZq1TLvrP2S7fCh/w==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 04:43:17 -0000
Message-Id: <20220419044323.E0AD841046@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-18
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

Autobuild statistics for 2022-04-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 25  |  8  |  1  | 34  |
    master   | 197 | 407 |  1  | 605 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 52
         host-gcc-final-10.3.0 | 21
           libwebsockets-4.3.1 | 18
             libopenssl-1.1.1n | 17
                 uclibc-1.0.40 | 17
           argp-standalone-1.3 | 14
glibc-2.34-109-gd64b08d5ba7... | 13
host-elf2flt-7e33f28df198c4... | 12
              fetchmail-6.4.29 | 11
                    git-2.31.2 | 10
toolchain-external-bootlin-... | 8 
tvheadend-1295dd2be863f5beb... | 8 
                    ttyd-1.6.3 | 7 
                host-go-1.17.9 | 6 
                 linux-5.15.33 | 6 
         linux-headers-5.15.33 | 6 
                 zlib-ng-2.0.6 | 6 
                   expat-2.4.7 | 5 
                libressl-3.4.3 | 5 
                 pixman-0.40.0 | 5 
         host-gcc-final-11.2.0 | 4 
          host-gcc-final-9.4.0 | 4 
       host-gcc-initial-10.3.0 | 4 
              libgcrypt-1.10.0 | 4 
    toolchain-external-bootlin | 4 
                  boost-1.78.0 | 3 
                    dhcp-4.4.3 | 3 
                     frr-8.2.2 | 3 
fs/ext2/ext2.mk:65: /home/a... | 3 
              host-rust-1.58.1 | 3 
                   perl-5.34.1 | 3 
            qpid-proton-0.35.0 | 3 
                  acpid-2.0.33 | 2 
android-tools-4.2.2+git2013... | 2 
               arptables-0.0.5 | 2 
                    brltty-6.4 | 2 
              bubblewrap-0.6.1 | 2 
                 dash-0.5.11.5 | 2 
fs/ext2/ext2.mk:65: /nvmeda... | 2 
fs/f2fs/f2fs.mk:64: /nvmeda... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
           host-wayland-1.20.0 | 2 
              libeXosip2-5.3.0 | 2 
                libkrb5-1.18.4 | 2 
linux-headers-5.10.104-cip3... | 2 
                 minizip-3.0.5 | 2 
                  ntp-4.2.8p15 | 2 
                python3-3.10.2 | 2 
            quickjs-2021-03-27 | 2 
                     refpolicy | 2 
rtl8188eu-60cb0b5a3cfc95e3f... | 2 
                sg3_utils-1.47 | 2 
                     shim-15.4 | 2 
               util-linux-2.38 | 2 
                    vlc-3.0.16 | 2 
                       xenomai | 2 
                xenomai-custom | 2 
               xfsprogs-5.14.2 | 2 
               aircrack-ng-1.6 | 1 
               apcupsd-3.14.14 | 1 
                    apg-2.3.0b | 1 
                apparmor-3.0.4 | 1 
                    bird-2.0.8 | 1 
                bitcoin-0.21.2 | 1 
                  botan-2.19.1 | 1 
                  brotli-1.0.9 | 1 
              dieharder-3.31.1 | 1 
                elfutils-0.186 | 1 
                  exempi-2.6.1 | 1 
                 fdk-aac-2.0.2 | 1 
                flannel-0.14.0 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                  gensio-2.2.9 | 1 
google-breakpad-7515ab13768... | 1 
                       gsl-2.6 | 1 
              host-delve-1.8.0 | 1 
          host-erofs-utils-1.4 | 1 
host-gdb-arc-2020.09-releas... | 1 
             host-pahole-v1.23 | 1 
                ipmiutil-3.1.8 | 1 
                  jack2-1.9.20 | 1 
                   json-c-0.15 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libcap-ng-0.8.3 | 1 
                    libev-4.33 | 1 
               liboping-1.10.0 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
              libuhttpd-3.14.1 | 1 
               lighttpd-1.4.64 | 1 
   linux-headers-5.10.104-cip3 | 1 
                   linux-tools | 1 
                    lv2-1.18.2 | 1 
               mariadb-10.3.34 | 1 
                          mawk | 1 
                mongodb-4.2.18 | 1 
               netatalk-3.1.13 | 1 
                netdata-1.33.1 | 1 
            ocf-linux-20120127 | 1 
               openblas-0.3.20 | 1 
                    opus-1.3.1 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
           python-pybind-2.9.0 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
       shadowsocks-libev-3.3.5 | 1 
                tinifier-3.4.0 | 1 
                   trinity-1.9 | 1 
           v4l2loopback-0.12.5 | 1 
                    vde2-2.3.2 | 1 
                 wavemon-0.9.4 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/8a70b0e14da16f68c849e35c880eca09424a38f3 | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/e9becdc0514c506484b33ce05b9545987e658f1a | ORPH
    or1k     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/cb816af4e72982e44c13ab642d0734e1d79c3fd2 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/04156dddc898cdbc82d4cbc55d24967a8a01fe0e |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d3daf045dc493c842e4a457ad9d912574ac1ce26 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c13e52d8580bc243cc25361514f5c0861951e04d |     
   armeb     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/7292747af071c8765791298b84f0f00c8284e43e |     
    i686     |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/3f01740f337d322cd46064cbe09a7071fe8e2fac |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/d50e941651be91a65d214d8309430779ac27ac3f |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/00fb24523903d63d4af9671439ef491486fcbd89 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/f5938d944379076a55550f6eebd2f5a94986129f |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/af3b47fdbc9f92a6677a392119353574d1b93ac2 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/74e92a367ecc429f5ce4dec419ff888b42685e32 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/d121042fffb0f84dce2868679600670d9c3393a4 |     
    i686     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/8946eccb7b8b6713339b0573718e0addd569aea7 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/1afee1d332dae07207f5e21395727071f4801ae8 |     
   mipsel    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/e125148e80d9fac125f78bc371accbe066426653 |     
    i686     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/1d7f7ba390a0e656c663d01b0fe738a7fcdbe121 |     
   x86_64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/5c525dc4e30c076e123a054ac211e6b7283ae991 |     
    arm      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/99eb665b16149c1ef1677fb089aad93541633430 |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/12cfe6c40471e24001fc249ab9733f3076da044e |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/fc62878e15c39cccd726efca8d3542d17dc8ccd4 |     
    mips     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/81cf23a45d2261014dfd08e62f4c484e11668e66 | ORPH
    i686     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/19c062be0f500ea07d39db3f9fd91862d5a702c0 | ORPH
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/efd89697d9b0439c792f005ccc49d90f21bf007c |     
 aarch64_be  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/cd494f56f7be37f6aa34d9e260d2032f7ae12f51 |     
    arc      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/e835895c9f06e21cb00632f4595cd1ed9cb77930 |     
    arc      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/9f45e10a9b6087921ab13dfd51e09c2f9c5ebcb0 |     
    arc      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/9d011b308d5a5ff2004f762c9330f4aa1a0c0a07 |     
    m68k     |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/f237c9345faf8c28f3c73f7d8acb49271fe61780 | ORPH
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/db6661b1c107a2e49f638daab3dbb36d6930d4ff |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/817760187c82eb562bdb7508a51b670ecdf365c3 |     
    m68k     |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/22aa23575b39a11311dcf805f29158a4253b2aba |     
    mips     |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/6268da7dfe0e70cdf0b499967611f1e8706ce119 |     
   mipsel    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/65442cb7a44ab4a0eab06b1bdab45efae66c8f5b |     
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a9df82eea1f90da0b742a21ba00d41a6e6edf7ab | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/05bd115ff9cfd65e22a8d5ae810efc6c25807e35 | ORPH
    arm      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/b77c9463f2dbeea6f327a9cd198ee66964fed1c5 | ORPH
    or1k     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/ba3258d8df00a7626784189125f0202fb161c40e | ORPH
   armeb     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/074786f3f1e7ffc858dcb1de1855ee138793869e | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/ae15f77ee783d0f2d46770337e6a6a8c58388f20 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/355c331675dec5d28907bda45b08c6f435456cf0 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/fba68264903ee8bd9f004930fcf66aeec6798ec6 |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/1a1c6593d1db11414ed96f7a229f12b5994eeb9b |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/d1159e72cd5558c2ba9172f9677edb753ec68afc |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/e628ba2d39fff56d60cf5642f1e756326309d701 |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/43a57f28680184fbfbcdd51f18911cb81f20028c |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/95b6c7e0b43eb7d9704e2e1b2229d8ef28db16cb |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/194565ebe43df4bf6abaf2ac6672e652c7f11316 |     
    arc      |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/0c6392e8fe65e68203c7bb6f039ee3bc2ea88403 |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/d2278431e8f3a868a4f39fc67fab8052aa722d95 |     
 microblaze  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/88e17c964948562d3f27449da26584e14157fbd0 |     
 powerpc64   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/5b48843c82af66ca3fc39bdcec67fa5f2f0e074a |     
microblazeel |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/62958b96a208dc281d8571a1a2b07a917bf86897 |     
    mips     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/9e97a2f6c32bab5f72933415ad2cad8ba86f2310 |     
 powerpc64   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/413f1a289f912ea4c8ebbcf2dc976ae30fa7b75e |     
powerpc64le  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/1eea751dbb2939fd16f8bd2bbf9b583ddbf49b44 |     
  mips64el   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/cee09e853294a45577febc4af824df8f57fabb6c |     
   mipsel    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/59195d6582637141ce00e0001ebc1faff0b5f62c |     
 microblaze  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/9cc38b2bce911614ef398d6daa7706a64c4d034e |     
   s390x     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/166987167b4269abd25137a7d818eb132e1e3b9c |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/8055f247c48ee1775268bdc284dc37b210e4cfcc |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/7a2044ad1b87acd7f59acf3035fc21fc9d72ca35 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/8737aba26f3b16a46e94a67178a61ec8ff8b262b |     
    mips     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/7113866a2f80868963ca26be2abe28b570db50ec |     
   mips64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/3706ab3be02c410fd19761e9c364efc0822028aa |     
   arceb     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/9a57efbc6a2dce680d8e24e050648d074b4c021c |     
  sparc64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/9b9a5c68cf8efa10cf6da61832acf4fd4f14a46f |     
   s390x     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/45755ba08a37d6d34f90b991859b2882a04c12d9 |     
   nios2     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/85e4fd73f4f2d3fb5606176575182f99ccb84e99 |     
    mips     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/86cb40ed293506ced86d1a0fc483f6d6e64c9d24 |     
powerpc64le  | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/fae5e0d2b48bedcf46ac077e96bd265729588d49 |     
 microblaze  | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/03b7bdad73af30eaeeb2de5cb566f1c8f9f8d773 |     
  sparc64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/40d2b193b4f6e647006036c70de4ba5c92cd5b25 |     
   arceb     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2ce195704e841df764f3907b82f2ff1e59f1527a |     
    mips     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/bab609e506681a1cce88dca8b1c50ed98a6110f6 |     
    arc      | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/f89597bb005b716aacaa7ebf494d25bcb74270cd |     
  mips64el   | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/7af10274c7258ae267e77a6c48d25c34ad59eb41 |     
 powerpc64   | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/96ae338d6066759a15ed5d1f9d19d6c5eea07f96 |     
microblazeel | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/dccabf8a6df9d0e9ea0141cf8c28b56147598ea2 |     
  powerpc    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/9fa18f8dc09f7496b7a76a892f709ea45f6675a6 |     
   xtensa    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/a16cc476dfdac7ad9a623a418cabcc2f7c9c7a38 |     
    arc      | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/a276b5ce919dde87b5cc07d243e9113ec61193e5 |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/689e98f4ba96a8144eda3ae7c07063b5e8a5955a |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/de7d654564871500951808b165589036fe91bd76 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9f26d569309104eecbdec8c0e28e2a6fa425380d |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d3c5ba0e71cf3bf124d2dd7e0581708f202b61df |     
 microblaze  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/9605cacf2f19ee9ef72bdd7647e85be7656c2ee9 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/4085be0e7ba531eaca8ef4641ac2715ecdfad216 |     
   nios2     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/0cd84e076c473e42e127a30e2e2045aaa9a04866 |     
    arc      |          gensio-2.2.9          | NOK | http://autobuild.buildroot.net/results/b8fe3b936bc9e7611ee007e88c33c87501b311d2 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/43186dc798f7456c006e54e7272de2c8a4bb416b |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a270de97a2a055019ba70dd5deedce181017b3cc |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/087f8bae62942cd327195286d4c4bc069ac1b355 |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/0ab2777a314edc2b36a0f623d9cc8f70186552fd |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f807a12bca5460a2e0107ca282849058eabf4bd2 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/adf7d6707d8e0df58f1608927060fe5517b3b056 |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f1a4a6edcc940d417f9421f01cec4610b6faecee |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b76d17dd689564e8ebea2d7982e38e63455f706b |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/bc8794397cf1937cd5a9ec9a842cc7d2bd6b7d24 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/34704457bcf92d57f4a6d2ff8502ac3adfcf17c1 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/a3e99c79becbee41d9984fe24fbeea2affb3f74a |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/fcfa9698977671803bdb6e02e92907ed72f6de1d |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/e9905a8e5ee856f444efe90e126d53729d8d3047 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/c5f5bb5384f07de28aca4d6a82531d3ed46ff676 |     
    mips     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/71d46a7d3e7bcb3a13fb26e81cc5f049bedb6b97 |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/e8ff47ae6086e1afdd75f43cc51c94428fbf8523 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/c6cf52a666698d00accde4cfbf628af5e725ca97 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/d2bb2d0aefe57967fddbfb6c1584eb93135421c6 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/57f204a445c40ce5cf8ef1b119bfe0a0ec6a58e2 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/665cdb440162d57cf61904a7132a53a5a0dd5a2d |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/c2fe6f8d712c819dbc6da3c6a1fbbf7d99a7c3d4 |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/133da3ed72f3a3baa35d33cf4dc2ea9cfb377976 |     
    mips     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/44e32c78d749768aa6925b4aafb10cbcb8b63422 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/d370e92e6a9300d261438a511daef409dc8681da |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/b99286baf36ea99e0dfde92937a84d9fc1bbf323 | ORPH
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5a7460e18015b9e908adb3528cef1ee8c2b18a4f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0df3b2ac591ffb73262ea94c18777df8eeec8400 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/44d733a2bd83fdc78f4f52b6e4479dff3a02fa9b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9209bc25a081e7cc69556268301aa07c961cac5c |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c3b1b1e0dfd8d7160801c7dcb68500178a205eed |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/51e0f23e5ae7f5683e328d1e5a96c89ad9b53121 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f8a767c4e01a08e1bf031231a0223c0a14f39635 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d0fa2776429872023307cdeb90ef4463a06a3065 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/52316fd063e512732048e45c06ae84860d51897b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/89b6529c534fe6803730f86bc55c014421da12eb |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/476de1d9014e9110016024878cc37a5e761b36b7 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/16facf996176b718834d85d81a8e2143bf96f1b8 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/37bcd4f22672a3078930bf53fea66a9425481d5b |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/096dfee7a3596421f8b955c07a4feac1d3620ac6 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/14ba6faa7925f0b5e9cc23ad715e7438095a17fc |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b0b7a02ad133aff6e02913da89a78ddcc850a529 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6875d305173855a7b69e41ce6ab3b87ae0dbf8da |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/41758397599f654dee9056ed241e0467160f3bb2 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/907ae8375b0c1c093e0e96b989643b49aaddfd1a |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/28353b8e3a3f039dde335f5433747f48e3a42ad5 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1e171843d431e500eac1d33439096f4be4b7c74d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/07cf4ff74d197eaff642c73b9bc32de19ed2cb8e |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a4e84dce469d3b397f829feb1f486d7f60c4388d |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0df4273ff5ca7c9c9bdf91025b0ad548fc454662 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a5a8d3e84129481b0813ef0701e8b77f559c963c |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/659af106e5437f7c41885e76d2335fe0a5118ec0 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5707b74b61b265149347885f3f9976e13f7048de |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a8c68395ad993cd25f3ef48b4640e52c0e2c5b89 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/48ea633fe0d476b0fb8fb24825ff25a62b8dd530 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/265d4fb780482be8c966430ac55a0ac4bf02fc09 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/040b5315462e5a3abd8f25242bb4adf05ba0fab4 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9e4c62d6a6f24d253efe0713ac28577ac1c0e3ec |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/dced5c689c08970fc8d96461d6661fcdbd5b31cf |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2728b98ff3bb49308172595903a11d15de7ab81f |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bbdad3af37a35df4e8f5ad330febd7aff97cfff5 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0a05c0929c9bf73187769e8eb6ecdc9a6c5e1379 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bef615e15633998fdea1cb663b9255ac84f70839 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5d26dfe85a769a84a461078090170c4f5befcf0e |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7b127d054d3f8c27871aedd95563d2cdbfe02269 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a51d6ccd35901facc0a4dc023daea3e4a8e8303a |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5da6440274d777a9c77427db291f1d2fa90505ee |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d4d5df8ee7050695236f87b1c688ee732013684f |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b260216163878e98bb17dcb01382de6824e0adbb |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8a07105b6adb8e637e8bcecc69e32284e9222b5d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/543a1169eb49ab146a2d0234224afd7e6fcab6ea |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6d66c1a8ab30d202cb1dc205b3c5a5be95d0f645 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7f86c5c03fc56036823f1cd46aed171f283d08ab |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/000bff4cf0c7666bb69ffe474510f0016db388f6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0365186983352c6a11317d309a5ea547f4395ace |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/966c049c00dd09e569d583bcee459df6ae2f90ef |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/26349182c27f66d756c661cb9af505270b50310c |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/003d2eafd8b2836096d2e0ca590096932157e0f1 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/332225fbe9d3c6eaa9dea4042c4ea3f64b829318 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/efa667cc6bd1970664c62208e4813ad0ede978a1 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/41dae5c57ac46ea68b9551248c418371ee2c0735 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/34db489c5f5116bd3db1687f9031d9830fc4783a | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/88d95ef984abdccacaca15bd63969906e0d1fe3b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/368d9c2127100f6862c9cca50ff04c5673d3bc3b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/719e58e2f6e65898e2e29ef8a669b2d009395cfa | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/0f3a53778f11e5a2e9e88b13e9e6a461ac7380ac | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/0292c9cb15e3e1831bc2e605333452e1c218e95d | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/6e41a75c6d90b13f6f56eb5f0b7adee260078727 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/2a7e79775a45c8c9eab199b2f909845d8ae40839 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/2301e65950827dd3f83515cd02997fa6a22e117c | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/27fd360b5458d7eeb80069e13c3ac92afa105b36 | ORPH
  riscv64    |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/61e003f9173f1863d93f13be6d72ccdda44a38a0 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c635453b6d34f3593fbc4d4ac02cb5c0f3bec79c |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/286ebf4cdceeff372fc802c4e478f8fa37ae1918 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d2016168be888a7cc84b90f730fb27799d8a49b9 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9eb7dcf38e474cb9e7a7f9e4d7b759aed2359821 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c4ec99b1dd474163f268614d114a369bb81f9ed5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cd8bbba3a79dd847c0ba1eef36201a10c9f41a22 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/37fac884ec75665febc3370685d70f17257c16b5 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/688001b2244ddf5508ddc96c49c786f8c944c35d |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f96e3967ea0269130f62b13b67ae8ff45c880840 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a4ba8dbe919c7955121ce25cc03b904fa2272966 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1265765d69bd782dd44ce621b508a2eb97b7f486 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cfbe07d1ab933cfb5b9c4fbc111d75dea4dce4c6 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c564f866648583fef893c9b28fbc0b4cca9caed4 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2c62f85f75a06dff5e245bf376c63b21ae53be98 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0d71445600b1c5911fdf6fb85d8588df62264baf |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d9b5874a1d9f16442c36ee4adba1e098605afc56 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/faaa7ba8e7617da62f45fadf716319b3033a7b37 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cfc65dcbeeff50d5c1a1dc3b9ac932b9d4d6161b |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/53a957530b924aba3c603629b3d95adff109ee79 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8085d20bb76e9b9779d42ad849074d63f37d2e30 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3d3b6c3737aad680c5edc2ce14264c0959f10b9f |     
   x86_64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/1489bf829de89d77d9b66922025c50d5104e182d |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/ba0c05c8444b52c311f07a4514089be41afaf2ba |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/70d2d6a631b909022e1ce7fdad94f6defab7f111 |     
  riscv32    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/099f07fd16b7297bab80bcdb78e6cf96bd88ff9a |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/0ba252e45c4029bced4fa7c8c3dd63a1de3c2358 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/90b08d1ab412d6d298af9a460e723a2e84186bb9 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e894fa65e1e5346f75ea439283a369ae97494706 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/c7e6e94ab7ff4ed40c7692bc0ed3bf2ac348437a |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/929bf9133a0366986bc5f95b0ff6119025dfa535 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/24f63e9560172afda5cae4ac2051f054f4dea09a |     
   arceb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/1d3c3a51ccd1375c57e1c6c95f34b30888c23502 |     
   arceb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/67dfa21f048471b2064555e4c5a959d9a5bd4b5a |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/5f9e0fd16474e6b1d8571acec98167ed9afa5499 | ORPH
    i686     |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/a9ad4ee5d1bd5b3a2cb1c398f1b1c67ac87edf77 |     
  mips64el   |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/fe9898302996c398da1543aad625790d6d2d833f |     
  mips64el   |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/d68efabfcaa55c9d1a3b09d67bfbfce37dfa38f6 |     
   mips64    |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/0d3ca0801b04dee948cd435431d55239b2f86bda |     
   mips64    |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/99ac3e161b5e711eda485253ad5d7c845c3fd7e6 |     
    i586     |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/6334e823ddff51d02428423bf46434fd62ba7fc2 |     
  aarch64    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/bb86bc21a3d8c013f12f0106e8e8856083edefde |     
   x86_64    |        host-rust-1.58.1        | NOK | http://autobuild.buildroot.net/results/717cc0a37790a10e600a534f08cb8eb51ac1cfa2 |     
   x86_64    |        host-rust-1.58.1        | NOK | http://autobuild.buildroot.net/results/951f32d1d8fe34f9bcc60e80640eb40d177dfda7 |     
    i686     |        host-rust-1.58.1        | NOK | http://autobuild.buildroot.net/results/8b34484ecfa82edee33a2c6e849d4805983af5f0 |     
  riscv64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/3040c9a8cf08415a7f4338185f6dc7245c68c64c |     
    arm      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/f6ef369958cbcc48270e0fb1f777ba5e516ddd92 |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/34180f7ab3ee62d7caca56cebb143450448527a2 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/36f876a6261c8082a3baf1ba8c586de3ab77b06a |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/702141e155760c28970d9b4fd7426bad9101947a |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/d87aeb070af9ae289faa42d103d47742115c0a47 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/4075f6234c74bae67894ddd9f450a0f5872f9e3c |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/2826ae6537e0c016c061aec9c188967f5abb5e6b | ORPH
   mipsel    |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/bb85e18e6cd32c0938d59b3994d61a222a3a899e |     
    or1k     |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/69ff6ebfc18775508ccbe9f10329f6cdbef5c93c |     
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/9b1aa3c6f6386269662bf7e88bd7f02cd44c4b2a | ORPH
    i486     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/13f5ba1094fcea1ed5dde882a23ff883dcb83d4e | ORPH
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/878ebe46010ca309c453ef91758a5da79e002d8e | ORPH
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/c116426d74eefeb380a66d1d970dedc4e5c0c391 | ORPH
    mips     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/8ef1cce75ab4ae2dbe45a614b5f908867b476469 |     
 microblaze  |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/0918a95bfdaed7a73548c3e9e63f37e1cf695bc0 |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c1e524e0903efd3d0f89b58f698e6f5f8beafcf4 |     
  riscv64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/d1b56dbd373249a7be108cc1fbfe9acdb1561297 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/46b0f37e0bee01477cafaa238d0c0c09906b0761 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/667f398dc42a8a1391889f744f3179f2d6ab52fe |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/e589757467da566c1e60cb378ead196a3be4a35b |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/fe5730877ce50ef013322489d381617c52aed121 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4cbb638d496ce664d57ab6f55d00af757f390cc0 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/26e6ca5d5982a761d2e875f7323587df60d4a219 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/ee1d9271751c111abac56891d360d4989e7e2fe9 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4e88f44ae4e5e37e7cdcc81fd1518097dc0e6ab1 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/7059cdb2d91f0296b3e8b52506cf091fa3dc86d7 |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/498c3a4757e7f376d8aa64658bd2438ed5477af5 |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/fc4fe44a4c767ffe083ca207be64f4d21ca2fde2 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/f0e855537bd4203dcd5772cd7302cfabb3208390 |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/50cf26de3e7796ff4d6e4efe0adf6542d8fa40f1 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0abed8eeb8ff549670bec0270d94bf91a42e7193 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/5e0ff87e5edf95b4a771e59582feda31e8f157c4 |     
 microblaze  |        liboping-1.10.0         | NOK | http://autobuild.buildroot.net/results/c9614f4fb61b8fea9c63d536c95d40d03d431fb8 |     
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/7c0d9a503c5cdd97de497e36d822fb3b1df89773 | ORPH
   mips64    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/42c9d71b0c8f655b205d174d18e2198f90bf3225 | ORPH
    m68k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/f63ba0db668ca1dab393fdc09e4c8b309d60c4f0 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/d862bc83cb42c8b15a196fbfec49ad7b82a95ea7 | ORPH
   xtensa    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/f2a842d284b15298e1ad046cfa1be5966d8d2ac4 | ORPH
  mips64el   |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/22e9a47be2ac1976ce18bfa97521323f1c64e298 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/ab2210ac9acd209bcfe8a799155e15d1290eec30 |     
  mips64el   |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/06fe94cf5d438621123ab298070bd5bb04a4a159 |     
   mipsel    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/919e3efa02a35782051954eebae3fce719ea6089 |     
   nios2     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/081d9f1a3db078dbde8bbd6207ab1d4934449aed |     
   mipsel    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/59d8d64ff7c85a6426f31941da6e32638a0a76d8 |     
 microblaze  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/701678b79c8b6a3dd873a1cce127132c4dfbdc6d |     
    i686     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/16da8b67db5af0dc6ec452fb702e31c7cc1eb3ea |     
microblazeel |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/1257d467c5b1e40ff210cc5edd5e35da93b84433 |     
    mips     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/8c7ddd6d9c9f0c1a64ff849c84d85b007c3294d1 |     
    arc      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/2f375a0897d2a73a05ba80504de08277fac7a7c5 |     
microblazeel |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/0f5e201fad6107cb178da698fdfc87168632375c |     
 aarch64_be  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/c7b19472c2716bb34130993c8ac9499496d82ff2 |     
powerpc64le  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/37b7e5a3c912295150338d7026de619f19d78391 |     
    or1k     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/43228885d96607a22ff70c213cc9c84fdbe37290 |     
   s390x     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/56fe179942f4eb563c8b358ed8ed1b162ada82ef |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/0c6a43a11a698d97ee13e2564106e7cfcef95ece |     
    i686     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/0c28d1df2349b8c45ca41090b7f927f8b3a01cec |     
    i686     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/81acff88837e7fc76002adf634a420d4e868312e |     
 microblaze  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/71ad4e84c9290f3dcd0b5018634df6f9974453a3 |     
   arceb     |        lighttpd-1.4.64         | NOK | http://autobuild.buildroot.net/results/355cc420407ce69db5c6c740a4c58a57fe94628b |     
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/56956ae61f858e8baaca5b405d5ac9e55a7ec774 | ORPH
   mipsel    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/10ebefa3d748d42d5ecf13898cb7147b56008c9c | ORPH
  powerpc    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/5962c2a1cecc5532f0d09877015d5bbc7676e1ce | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/dc41c081c4fd15c98edb61c1668e2ad907ae3521 | ORPH
   mips64    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/92464bf73f1da274a71655ec5af409b339ea431d | ORPH
    mips     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/a6bfdc10e673cf5fdeb8d14c31e3e23892771035 | ORPH
  powerpc    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/a2cf1237625ff39db56dc7142702d939b7edb5a6 | ORPH
  sparc64    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/dcd3735b4c060acb41ccdb1f51229341a77b98d5 | ORPH
powerpc64le  | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/b63153f921bd4bb8dc31f09b50dc7a7d9e76e4d3 | ORPH
  sparc64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/8cd5fb38caf8f0928abde06c5a3e99b961eedc4c | ORPH
   nios2     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/8d33fb49f931a66485227ef3d644a20ea698390d | ORPH
microblazeel |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/aedcd69392444b6877272f10709c489b70699d23 | ORPH
    arm      |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/a733b3dfcc83e816ca684ce75c7983c079a334e2 | ORPH
    or1k     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/4d13fb83fa3fa16d1f5dd4b91d97c1e445d068be | ORPH
  riscv32    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/3fd0d40c05937825acc4f8e5ec180a6ea48b6f68 | ORPH
  riscv32    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/8b412c0e0f8f99644930753a84a0496a677122b4 | ORPH
   x86_64    |           lv2-1.18.2           | NOK | http://autobuild.buildroot.net/results/bf84e2ab21c282e63ace37fe6197ed2a5bc1c0d5 |     
   mips64    |        mariadb-10.3.34         | NOK | http://autobuild.buildroot.net/results/cbdbfcdae4b89ac678e1bf6bcded96872c7223ab | ORPH
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/1c73d9fae6470f05537e3768df9445ac32f34ac4 |     
   nios2     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/11f5a79ca6c55cc62fc646fdbd305754d0635130 |     
    mips     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/854c9cf9267d60f9db789836489b1ae3779d055e |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c9523ebc4aba1286867ae3f74d9587ac86d8d8af |     
    mips     |        netatalk-3.1.13         | NOK | http://autobuild.buildroot.net/results/a90a5d06b2047b5aad97f6f6dead257335785e81 | ORPH
   x86_64    |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/ee62dce18cb843917d7bf7870a6751db02dfd049 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/d4a3e8f6999e1f480f9fae29be8405d893220e3d | ORPH
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/56a532bfae127ac4dfbedd9acca05009e0946793 | ORPH
    or1k     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/a5478b8eb354afb554aee01d72a47bbff41f954c | ORPH
    i686     |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/5ee2524567df08df8834100e750e54663d15c5c5 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/eddb0d51a9ac5bf001b9dfbce5896a6eeaced5f3 | ORPH
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/df2dfef25e14b1c750c754da4c351e90fad228f3 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7f00f30ef43a6d17af9010350bca73dfce52cacc |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a2dba4b8bca0a7213935de580a6d36de83bd294f |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ac487b9efcc28cb07bd5b2fabf52becf9355daba |     
    mips     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/75267aa5b5a631f091d4c8cb6ad9baeb5f72ee11 |     
  mips64el   |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/994f9ef16234e9925bcf26b4f13bc92a9b53e104 |     
   sh4eb     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e49275935818d0b21e90fe9b299270651acc43d5 |     
  mips64el   |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b3f18de848e47854abf050d1e62ef29a6ed27f72 |     
    i686     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/e9c25f7ead3bef0256e92565228a3c5fc280c95c |     
    or1k     |      python-pybind-2.9.0       | NOK | http://autobuild.buildroot.net/results/90364b752bef3f7b4b1fd9181e21030349e0e529 |     
powerpc64le  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/a28e6de27c49e277057589a456dad72b6073dd28 |     
   x86_64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/d3c75fb05ed0bac5f53df6d9ff1de686b4528a45 |     
 microblaze  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/bfca042b47ab9ffa8baff61a750970c3285ba8b2 |     
    i686     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/0062ac4f29f35810406659bbc54aca175a747701 |     
   mipsel    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/86b17598461f32bb4bee6dcf808df4f591ccb682 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/92da4653255ac221d7f142d0489ccd4a838f0a60 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/94a3e5fb5f9ff7fd0183c38fa17f77f4b0c55258 |     
   x86_64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/36cee07924d371204f8badd02e03f6b1daf9ce06 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9019b1daf73109f6906e217187f1de382ae9755b |     
  riscv64    | rtl8188eu-60cb0b5a3cfc95e3f... | NOK | http://autobuild.buildroot.net/results/3c1d55d61855bde7fdc18ec4aa5145dead0b8282 |     
microblazeel | rtl8188eu-60cb0b5a3cfc95e3f... | NOK | http://autobuild.buildroot.net/results/4171a99b48ef566c2b046954475bcb529c6e24be |     
   sparc     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/fd81f82b69032ca643618671b3c35bfefe8bb395 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/cbf18ec8bd17dfb8b9b0191de9e428ce95cefc2a |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/bb8af18cd2ed0aebd40f01696cb287ebde885990 |     
 aarch64_be  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/8ab536828b5b45cffc530212daa0a8f484d04744 |     
  mips64el   |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/71c355adfdae276297ef6a76daf86bc0660224b6 |     
  mips64el   |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/e65afb09cb09e639682f4d0d195a84bc8e511aae |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/5dd26384342620b9b9121fbd3a176290ef00d921 |     
   sh4aeb    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/675f1aeef79976a6628c8327e380b8ba3df24f34 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/476cdd6c1f2d6ea98f1081a762cbb581c3419187 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/678056daca6ab7d1a79ae28e1f59b19e4525f0e3 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c0ee06d55c63c241fccf076a4ecd595a9cafaf95 |     
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a53e1917cd59659d7c875c704c13d1241284fd54 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/90ee844457c8516244d78aea69546297cb401851 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/749ed12738d01a7c0c819fe0a74f76d90f003917 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/be8c986fd5ec8df290f0ca398f236bfbfee4dc71 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/170f1050f72042d61f64fa7e3775789409491204 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/933da4977db5819e8ce54b94662b405cec2a5f03 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/42c7f4a80f6648e2172b1e24c2ea06406492a8d1 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6d07dd9c35c0e75703e11cbe5421e9676aed6648 | ORPH
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/d0a32a1ce4b0b8ae3d6f9b27b00e77a637a2dd74 | ORPH
    arm      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/0f7952eee8e3dcdd3f5df1b18ce561cca78ba7e0 |     
    arm      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/0b6a917b9572574ce8585a7978db86729a8ef8d3 |     
    arc      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/e1636589992b8896477ed2229bc7ccfc18847e9a |     
    sh4      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/f28872352d28b1ce67a3c81d524feb0138fe0284 |     
    i686     |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/e488a1035c2de3a5d58127c0363390dcb9a0c68f |     
    m68k     |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/66045099ba830c1527a75c0308bd55d4655df20d |     
  mips64el   |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/d198d6285847d570329c2d2e1ea86a2f423b2829 |     
microblazeel | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/8def1e2e5386f40b9a1fc29d089a19535887ef55 |     
   mips64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/6b2276fa3c054c0953a2304e51e63f3546dac0a8 |     
  aarch64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/d3c369c0c40410c93e55ff5a93fdf8bf1e788bf0 |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/ef71ae24da20c73d5ef2458f777a5d509829dccd |     
 aarch64_be  | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/b9d13e757024a131007208ce2c4fc6f4c0d19f76 |     
  mips64el   | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/beb35fe197931fb17567f97ef53372f32dc6f671 |     
microblazeel | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/e5c785777b0ff0434dab004918e35803d0fad2aa |     
  riscv64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/dbbfae09b7bac1f6ac517578f32ba551e40afa10 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/35f92c91b7d1dea36b030b8e0b0a513afbcd82d9 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/03223f79c1c38ae7fce79f7a49432f5e57e47440 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ef9cb4f1c60a676c2a1dde7bee4f2a4c5f451dc6 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8af00cfc2ddd2395cea491b26b4251509053025a |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/690fd4d35b52d93d0b89136bed5a7abc9a572370 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1341d26b99e2b8b4c5a71130cdf3862a809df382 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d3c224eac2610ed6ff29e0c31ac250e68804d67f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/50911267ab72e21fd3da78cffcc9bad83171c624 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4e74b9b44eadbf1e85e1177ab741e391864982b9 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d995b69aebcf7ddec06a5ed85393fcd13788d0ee |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f17ccce9542153210e4d80fb2049df6436046b7f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1b99b36b5ea6a4fffbe97b329cbf95cd15d33f99 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9064a54925d8a967f3552b19ef89a40348db966a |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1af93be6347a732fb08a801b4b62421b6d3bf84d |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6ad7eede6186b2613574d1ebc616880c0bb8e856 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/246dda498917d9cff03361e1f00610c1d65baf17 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ecc655fea7d0d6a423611ecaf992786fba6907a1 |     
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/1370c729481cc69b0aa167ddc289d0e63dde6ad2 | ORPH
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/5908406984f3748fb220c241fbc504ff86b5639a | ORPH
 powerpc64   |      v4l2loopback-0.12.5       | NOK | http://autobuild.buildroot.net/results/9620aa3485b3a20b59a5e7b4098dbd035339c67a |     
 powerpc64   |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/feae6db9d883e121ed20918a617e57ae93ea77c5 |     
    i686     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/d527dbb6122ccbd4a3e6447f5fa47100583cb611 |     
   nios2     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/2bba446a0cd86a428f55f2a7748bdd40c3db3e2f |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3b2d4c42998a44d12202d6d6accfcca863c6155f |     
powerpc64le  |            xenomai             | NOK | http://autobuild.buildroot.net/results/2a6378b67620539a6f68d5c369f7c28c36911cc4 |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/149b563deb95b4780fe2b435286db51fa83449b8 |     
    or1k     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/837e77134245ecd7806f9c9e2624adfd7721e7f4 |     
   s390x     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/58e439c4aaa93a88f4dcd397e57c2ad012a796c2 |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/3296194907baf7d3fe039f59bcbf595aa8107a28 | ORPH
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/5efe7d0a4945d4044713de419bca7d28f06c20ef | ORPH
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/14080c60154d4c711723f5f3f28b8ffb1cc3a3f7 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f49ad2c6dac99cba707e4d804348785f8c28fd52 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/03ea446b506379308cb1b66422c4217101705e93 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/73eb9245d3d5b258ab16f5496bb43d1893b5e9f4 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/456690fa7f53b2918c4a3ac09d2ab61186b84431 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5684d1782ce5e78ac2133eb27a69b1e02c3d790d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/077a4d65694f2a3a57b9f630afdb5b2c8463fcae | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bat-0.19.0 | 1 
                    dhcp-4.4.3 | 1 
             host-pahole-v1.23 | 1 
                       libuwsc | 1 
                 mesa3d-21.3.5 | 1 
                nodejs-14.18.3 | 1 
               poppler-21.12.0 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/5494ce87cb7dab26eea2fc8abfcb25e4b98308f6 |     
    arm      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/6c91c5016fa7f882173deaf2769368ad0ceff948 | ORPH
    arm      |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/3a883458498e9f780e6ab2c05b5d3ef8e6be4630 |     
    arm      |            libuwsc             | TIM | http://autobuild.buildroot.net/results/f929ae1db2146a73a9e620305a4e4bd51eeaf9bf |     
   x86_64    |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/0a8773c3ef3c952a4624c4a4a5768d3a315e9902 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/588f517f8dacb09a3cf62947cdcb7c3a96c0c2f6 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/ca12d6b7a2451884b64fb44cc4442a2a0b97bfb3 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4dcfc9780cd68880e4beceb58f14964b48f8ffb0 |     
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1eb633485214c673057b7f0a4df9f3e94b337318 |     


Gitlab CI results for 2022-04-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/2344671841  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2344671663  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/2344671684  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2344671730  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/2344671726  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/2344671737  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
