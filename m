Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2309FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 04:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8052A80CDE;
	Fri, 29 Apr 2022 04:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeFxCqFTNpfm; Fri, 29 Apr 2022 04:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C6780C60;
	Fri, 29 Apr 2022 04:46:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B86D1BF861
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 04:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F11060B96
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 04:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EtfZc88rvp9o for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 04:46:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3270660B74
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 04:46:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A497E000B
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 04:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651207576; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7UNopuJLsoRo3ofFIQVIwQstQGxX1bx0EWSs//+u+As=;
 b=fa0SxGlE85XutJDnPU760Y3ZwYGx99lp0z+BFNbcvfwevrW+ZJmCVtLPp1fiCfyYTZb7vG
 jcCgB3Q1qLJZ68vrsaInT/lrrGiV6hRRQGmQXe8dE9hsGMEHruoLbu54C9CC+H1B9x74Kg
 WBKQgUcLR/Q+QQJdOdpvH3SM9kepJvEaUFNRWTFpR96zCcBc7n7nvwVUhGhQSJeu9DDqgP
 U0Wak3O/9XJjIxso1YHNNmenemeHRJk12Po7sZNgEwHpc2NV0pQ2liiQeAyyMIDrg9qunv
 Q+TpZbNy2d+NtQYfDVwJya5U12LdeOerB0XyE8G3ela3L4tkNmc14HDDkUILnQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 29 Apr 2022 04:46:16 -0000
Message-Id: <20220429044622.7F11060B96@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-28
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

Autobuild statistics for 2022-04-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 23  |  8  |  1  | 32  |
    master   | 159 | 270 |  2  | 431 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 24
                    git-2.31.2 | 12
                 uclibc-1.0.40 | 11
                  zchunk-1.2.2 | 10
glibc-2.34-109-gd64b08d5ba7... | 8 
         host-gcc-final-10.3.0 | 8 
             libopenssl-1.1.1n | 8 
               protobuf-3.20.1 | 8 
                   perl-5.34.1 | 7 
                     refpolicy | 7 
                pciutils-3.8.0 | 6 
                 zlib-ng-2.0.6 | 6 
                     frr-8.2.2 | 5 
  gobject-introspection-1.70.0 | 5 
          host-gcc-final-9.4.0 | 5 
                libressl-3.5.2 | 5 
   linux-headers-5.10.104-cip3 | 5 
            qpid-proton-0.35.0 | 5 
             host-pahole-v1.23 | 4 
                 libldns-1.8.1 | 4 
                       unknown | 4 
                 dash-0.5.11.5 | 3 
                 libv4l-1.22.1 | 3 
               pipewire-0.3.50 | 3 
                tinifier-3.4.0 | 3 
                  tor-0.4.6.10 | 3 
                 wavemon-0.9.4 | 3 
                    bat-0.19.0 | 2 
                    bird-2.0.8 | 2 
fs/f2fs/f2fs.mk:64: /home/a... | 2 
fs/f2fs/f2fs.mk:64: /home/a... | 2 
         host-gcc-final-11.2.0 | 2 
              host-libcap-2.63 | 2 
               libglib2-2.70.4 | 2 
                   libnss-3.77 | 2 
       linux-5.10.104-cip3-rt3 | 2 
                 linux-5.15.33 | 2 
         linux-headers-5.15.33 | 2 
          perl-net-ssleay-1.85 | 2 
    python-cryptography-36.0.1 | 2 
       shadowsocks-libev-3.3.5 | 2 
                   uacme-1.7.1 | 2 
                  assimp-5.2.1 | 1 
                   audit-3.0.7 | 1 
                     aufs-util | 1 
                  bcusdk-0.0.5 | 1 
                  boinc-7.18.1 | 1 
                  boost-1.78.0 | 1 
              containerd-1.6.2 | 1 
                 coremark-1.01 | 1 
                 dmalloc-5.6.5 | 1 
docker-proxy-339b972b464ee3... | 1 
              dropbear-2022.82 | 1 
            ecryptfs-utils-111 | 1 
               erofs-utils-1.4 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.1 | 1 
                    ficl-4.1.0 | 1 
                freeipmi-1.6.9 | 1 
       freeradius-client-1.1.7 | 1 
fs/axfs/axfs.mk:32: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                  gensio-2.2.9 | 1 
                gnu-efi-3.0.10 | 1 
         gobject-introspection | 1 
               gocryptfs-2.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
       host-gcc-initial-10.3.0 | 1 
                host-go-1.18.1 | 1 
              host-rust-1.60.0 | 1 
           host-wayland-1.20.0 | 1 
            igh-ethercat-1.5.2 | 1 
                   json-c-0.15 | 1 
                  kexec-2.0.23 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
        liblog4c-localtime-1.0 | 1 
                 libp11-0.4.11 | 1 
           libwebsockets-4.3.1 | 1 
           linux-5.10.104-cip3 | 1 
            linux-fusion-9.0.3 | 1 
linux-headers-5.10.104-cip3... | 1 
                  matio-1.5.22 | 1 
                       mongodb | 1 
                    musl-1.2.2 | 1 
                  netsurf-3.10 | 1 
                nodejs-14.18.3 | 1 
                 openssh-9.0p1 | 1 
                 pixman-0.40.0 | 1 
            quickjs-2021-03-27 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8189fs-73f826f0fa74b2fc1... | 1 
               sdl2_ttf-2.0.18 | 1 
                     shim-15.4 | 1 
    toolchain-external-bootlin | 1 
toolchain-external-codescap... | 1 
ulog-0389d243352255f6182326... | 1 
                    vlc-3.0.16 | 1 
                 wolfssl-5.2.0 | 1 
                xenomai-3.0.10 | 1 
                xenomai-custom | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/cf0f5662858f57c0b750c2f15e7dc9c168290f36 |     
   armeb     |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/fbd2874a79d0638eae9d6c80486319e3b32bee4d |     
 aarch64_be  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/d5dfd8bb0cad54c8236655c5b01999a5a88c6dbc |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/70c22db3939cba100dd14b3411bf53fd96b2ad5f |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b6f17643bfd4de3bd31f76f2dddf15f08bac988e |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/f8ebe5aabf5212e9bcf9ab774c5b130de054924d |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/d3d5edca08c311a6bd9e11e6fd9ae832e7e8b466 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/d543cb89df3d8d5aa34f516681479e08d0b7c989 |     
   x86_64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/15cb79d1597940a82362f21014188ef83620e8c9 |     
   arceb     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/c68c186049e85d509665a3bf887d581b6534c3b4 |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/2d7a8d1ef723a21d1274819de80f9e36ab17dc64 |     
   mips64    |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/3c487b47241ea1293b6e893944a2e8c6967faeb0 |     
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/6426640af280b6bae6579e2b9cec2b3c9b7b8a8b | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/62674b52e072dfc8713e20a8f3bcdcca8bff402d | ORPH
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e9efa01d9952ffe010944d3b3b5d4d5696122bb2 | ORPH
   mips64    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/d2ed6554bcfdc29047d5931dc613d93b6e33ec39 | ORPH
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/3c2830173693bbfff2f7aef794ca3f6f5bc5fd9f |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/18dbba78ae663c316c989f1272ab82fdbb8fc6b6 |     
   nios2     |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/7c79e43d32f695fa15e4d2f26fc7ed07cbd79f70 |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/44f14d5bea3cec8aba2687c808e5de1775ab3330 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/afe24bb0afcfb9ee50125d74e66b0dfb84c86c6e |     
    arm      |          ffmpeg-4.4.1          | NOK | http://autobuild.buildroot.net/results/ffde126dd81c98d71c8a48ec87d5753cce8939cb |     
  mips64el   |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/c28987eeea367ab55b52f42d34fd40125add3df9 |     
   sparc     |         freeipmi-1.6.9         | NOK | http://autobuild.buildroot.net/results/019a6616e1b79fb5c2ebccf31f972b0cd74c4023 |     
    or1k     |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/18fb82f08aeeb0cbc5eb26edbc6209217830ce32 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/483f1bfe8e1acec1fb39c7cb212655dadecc586e |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/991f3c17c45211ac6ffa3d1a0eb52cf594a4e25d |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f95d7a3eb05df86dff3f8360cf6e5389ff99609f |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/5a68a5f48f5c91b861d492285e5a6a35736c1702 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/921f6608fb321c3ecce330f1e511da5b6ff2ddda |     
   nios2     | fs/axfs/axfs.mk:32: /nvmeda... | NOK | http://autobuild.buildroot.net/results/e54e64b872a7989c2e8e05e7e5319eebf5a52647 |     
    arc      | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/a3c68cdc515353c0d2650ee743aa3bd8ab99a418 |     
powerpc64le  | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/1ea1982428e5b2b9883f829e657fe676508a99ab |     
   mips64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/04aa29fefd1355fcd8ed26b950c7a2b3b339b625 |     
   sparc     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/ad426ff903d78a92de8f0208876e2196136a09a8 |     
   nios2     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/b3e43dafa2f3d7dbcbb84eac26f9c85af8f19fea |     
   xtensa    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/9a0ab0b3925a7d61cb1fd1ff47573041147d43d6 |     
   armeb     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/5fbc34d6277a6dfa93553da2569bffd5d6310c97 |     
  riscv32    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/7169578883e2668979bc6d14b3cbab872c5aee81 |     
    m68k     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/1944288658bba48671db970c6a311a8ecbf44cb7 |     
  powerpc    | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/9988e2b4c3eb5177eb25a0441d243c304a932bb8 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c351c5ada413fbca9c746d3f2e83f96471b820d1 |     
   arceb     |          gensio-2.2.9          | NOK | http://autobuild.buildroot.net/results/17f2f52559a5ed5edd36d22680ec506e0b72859b |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f0bfc96671b28b0093432f654d8498eca54db823 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/3b3d72414291d0688d31afee586313d9aa783c9c |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/6d637aa043496c16908cc05507aa7ed246c31351 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/ac34c6fe98af04d3640d061d4fb1343ad6d62c96 |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/1cf92d3e542093bc69840c4989d82d267e58e2c4 |     
    sh4      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/8a7c1615d498c511e297f02181ee6300e8cde21d |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/9684af6f89fa6ec083059df29aa1d359123c8c42 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d18905a7c845ee93ec8a493c60a948fc23c5dad2 |     
 microblaze  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a4770fbdea9b9c5a9e35c3145610584111d986df |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/648ef7664c8db3b87013524d6eeb72239db566bb |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/1875c5728f16624322154d441a22289758f8ebac |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/97b2eae0634966dc05b71fe5befcb8694f6be723 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/84be207fc06e0a10adbe7068a4b69d5e443d5211 |     
 microblaze  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/5796f8704dd9f37f548a55dbdfcbbc2f164b7f68 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/b91ea26c92b010d129e2793f84b8ab2bdf9eb8cd |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/a905fb65121945ff6b359b12b76f30671c4618e1 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/1c4cf21ca8d14795e09f0e1c4bdc33392f482e96 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/9ae0ab8e95b835714aafd90f6c09745da6fa55bb |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/f49de588bd6ec7d9ceafa551908ab86071d350c1 |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/2b1818987c6594dc0a4daf7ba9d8a38a96a3d685 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/db21242af314b10d845ec29a1efe55df11bbee02 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/584493c8cf9d81bbec0482d4190f302b32a39818 |     
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/4672763c884fa3334818b5fcaa01cf360b76ae17 | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/55db77ff2842b7ea3275ed1fbf20f8f82c0bbec2 | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/1958f1b88cd1cc10f829947ac4a90e723cf342a5 | ORPH
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/241fb150833a23f691c88a5203814b1e0e5f337b | ORPH
 powerpc64   |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3e3410bc138e83f4becf5082059a6ffa1bb048a6 | ORPH
    arm      |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/12c492c7f621cf3c02dae8b22859f750c0b86e66 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/e6045fec66bd36c46bcd7341e7718b5ca8ec6095 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b8fa87b86c00572f5544f108ae8020aa2ec70c21 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/612411e2739450e8d472ce5e93bc447e0b57d8d4 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bdbef6174d90a8025ef247b98d1e79c172f0bfcd |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/454c1f9872e6f7efdbf7f71d40be404c6d492588 |     
microblazeel |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cb03b6b8dc863e8b022851ce9f553f2077153ce0 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bc708f31d00f66b788c7d9ee23e109f3df19cbe2 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6289399a4b7f69804081a1e01378d6a759b0ae1b |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a3fecb59bbf5ecf66a41cba6c65fa1b91179a50a |     
 microblaze  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/6735e280a33bd7ecf8a7c640eebdddfde93a9f67 |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/3da68ce9a584b3a8172d5cc4d099596e2a38e880 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/0bf88a05483e9831b593e757a7ff8239b2dcba55 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/b15d90d734cbd349e451af95cec4857bf33ebe81 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/47fd5c8bba5ce64e36eb76136fc523927952b63e |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/2d529a08b657af042f46fc78795cfbf70a787e1a |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/b7f1038cde27ca4bc2796b24a7041791c4d1acc4 |     
    arc      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/8a5a9c48349a6752284ee8c2a44b869d69a66f83 |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/a4a769fa9f1aa3d186ae50ebf52a492f9c8ad714 |     
    arm      |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/48e3a9822bf1c49d8e7bb182293f8b5cc98d38c6 |     
    mips     |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/0abba8cd16ee2b7f48ee026c4d11a0c35908b11f |     
    arm      |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/1f96ca373e736f87029a75aa0959a558eab4195f |     
   mipsel    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/4717d37729014a8e80fa5a362111a6d90ca53b0f |     
powerpc64le  |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/0b2c97f9b5aa2f807d5de2de5a509629aaa929bc |     
microblazeel |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/22ca044ecbc3656ed0cb4be8089f2b9e5620e593 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/6e8972e22e80db8d92710a0e5791b746cef54276 |     
  aarch64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/8fab0cdec6297d1a969e24e96b1ecdb8a9f15faf |     
   armeb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/5e734e202bc4fa08d57675823f55633c8040cd71 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/27a6ba133c58bed046c2ef7254382f643fe39217 |     
   armeb     |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/d7071499060a82e4422ad5f8f7e820969567e3eb | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3774309092d7f0e0556de1f957b789ab21b5c367 |     
 powerpc64   |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9e1b9d4fe25579069b37d749ad1ef85631881590 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/792aa42ddd2754453314fc1927feba7058abff8f |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/fa8c5262a628b8524d530b0ccaea78ca90891f56 |     
microblazeel |         libldns-1.8.1          | NOK | http://autobuild.buildroot.net/results/76e52a573738d5491a84f7f5aa7472a7759467c1 |     
powerpc64le  |         libldns-1.8.1          | NOK | http://autobuild.buildroot.net/results/751dd5f71c8611f3382b5b52d6bd117d14398ce5 |     
   xtensa    |         libldns-1.8.1          | NOK | http://autobuild.buildroot.net/results/d754fbaa8f6687597682fbf0b71c16527c8cd603 |     
   xtensa    |         libldns-1.8.1          | NOK | http://autobuild.buildroot.net/results/6d52b4962c7974a16c358d5ef5431841cd9af9bb |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/283ecfe37e56df7b1f5205271fa5c50f769ed48d |     
 powerpc64   |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/857afe10cd3abfc192d6867d9e62f5ed5eabf900 |     
   mipsel    |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/0d891ce79dcf5a0587075b41ad838fa2562a1010 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/ec9cae469386578563c33292cfe0f687aad176c2 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/558de5842fa64fc317f6e28fcfce7ea39dc57e6e |     
  aarch64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/650bf4e30f0685d768d019000fe9e7f49029bb74 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/495fd7acfd7ddd744db8001890b5ada43e8d1e0c |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/896c84f5ae3905e35e44171d025b33142bb1bb5e |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9ea46a56b85dcbc11f6004db33c5097110b721b6 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/a5b0e33e3bfe71dfa256554d04a1bb85dc587481 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/aff0a8ee45728a448f10b5d115e1c081ff1bc905 |     
   s390x     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/fd32bd48e0e1a41cfb58e3f637a72e6cf95834ea | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/ce7c4a5b1a5be0a0b84d725cfc257daf698eb4ea | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/953a42bd91bee010b0736de6fd7d125703cc5d69 | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/a2a71b592a3b754eafdbc9eb2006d3d5429e3651 | ORPH
   x86_64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/4a237a3bae851507b919e909f48a0dbffebc2f26 | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/52f15a47f6d144d2946664f91765bdc6ede0d867 | ORPH
  riscv64    |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/f4513c4626b2af315dfafc57c04d679cde428b3a |     
   x86_64    |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/fe403a46158380bad5683d32a16e27b9c73aeedf |     
  powerpc    |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/b26515b553d8a54777fd5eb27dc891efa26ec821 |     
   nios2     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/ea3061f74d646703ea40058a4edac8840d14c0f0 |     
   mips64    |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/290059ae014bfc3fed92953571be8ee5e6028737 | ORPH
    arc      |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/a8b19b7452fd3322a6db9f036f68693cd30c5561 | ORPH
    m68k     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/fde83a3dbec846e798c612f5802403839a68499d | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/83b311d6621e916e8d28243e79c42e69940c4550 | ORPH
 powerpc64   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/2365fd50cc3edb4f83963c4679fc9f0d346d6a2a | ORPH
 microblaze  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/2cdfdfeaab9cd11dd18c0507e7584fffdaa7c05a | ORPH
    arm      |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/58d89f3041880a99afed8e3999f930d232dd6521 | ORPH
 aarch64_be  |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/c88e63c01b5ee8ddb6e2638d731f870928cdc2fe | ORPH
   mipsel    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/84b2a75daeba172fa354db7d34088564c08a7619 | ORPH
    m68k     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/44528482a2b3ea013c72db6ac8156e5305c4e946 | ORPH
   s390x     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/a6be1b615f74d28086fc824fadb6bb6747c0d57e | ORPH
   armeb     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/b435c4dd6b298e6bdf3e219f61d777d78f712b38 | ORPH
   arceb     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/95b93b600531a435391e7c000eca72f4dd405a71 | ORPH
   mipsel    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/52b73f44452061f8f28585ffa0ac700cbf624edd | ORPH
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/ba6010f2a6bf5325a290f8afaf400f2ca432b6d3 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/835ff147eda3e87b424105ff431323df5d5db357 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/ef5f11cf2c5cb7f34599c6de3bff28eb691155e5 |     
    i686     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/18c4b31d7b479434b8a3f2332e41f5c7d620c4b1 |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/4ec45e60011323727f352aa6ca582b17f7a3a024 |     
  sparc64    |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/ac23163d1c32c6ab26919bb180e62160cc389c24 | ORPH
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b72dcea2bb13d4b113afc9ee4237bce76539814c |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d00a6049766e9e303c7d87da2fba99d2ae56ce4b |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7fb6f2296647706d231400f5ec244da0132ec009 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d140b65814703c934e3364e7b928ea7bef862425 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/14fa9c2631b1215946477c2cf1a5a57a42d7fbc0 |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cf4026d7c471de319e9858288958cd4c0bdc6d88 |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b3ee5b49674adf4d69da0535f9a924f79d8a140e |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c17a68fa708e7afe303fbb5bd68158690e02330b |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0e07e390874c3ef072797cd8640f084a10ed13ee |     
   mips64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/23f0a2d47615aa8c790ff94cfcd278d9fc757df9 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/66689125d1f6105e8fba2e4bc01168eaf10f39ed |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/dbc2f4925030d32004565dc6c121d8d21fee262b |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a3bde310c27f4b31f494942bb0b9d2f3877e9018 |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/dfbc360f36191844854c02ee0ba4173dcda8b2d8 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0e08ed757637283fa44a6f053c03949ca2e26686 |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/62002ad2f4d166c8ac244fa5a0f40022b0b7d182 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/21384cbbe6695faeff77daa91424b5ffb44ebd09 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/99b6b92dc717037736889c3542b5fb21320ef9b8 |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/bb70f07dc49c6dda7e92b70cc45fe086807fdd58 |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2f3f99d102f171826827ff82e757db969ba13b0b |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d7d044fd7d5dc9b28aeb1577c92152652937481f |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/23155cec0e18fa4bcf1f2d0ee2835a6a2ce0774a |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3e11332c4571777c4b9a78f7c406e68f36186a43 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/35097ec6c0c99647c34617d999242fc3e5ad30ad |     
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/88a23c385f5a21b11bd816f2e0ad1212e4803a30 | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/a5de6de2206ad6909c28f72bf323c2980a2db594 | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/1bfa5ab365fccf4a7bbe58e64471bf1af5577e5d | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/452f4397e26ceec8b76a371e5511e071513093a1 | ORPH
   armeb     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/de1221e98bb2300a1df9f3af1f6d5ff7b5762145 | ORPH
microblazeel |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/a4b4fc40d261e56af9d69dd83e573f951d761edd | ORPH
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b05b818679466a77a4a81696546be6564b373062 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/01170a8c7a932cb6f58ecfabca5156c31429dbaa |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/eeaedf83dad52f477a9160614b18627d7e5f2938 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e4471aa07b315a6324687e38d194980f5e498f57 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ed5026ed98b7ad59b4be988ef0ce062825821cce |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b26d6733309dc64f2b3ee62bda0b7ecfaf6590ef |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e84ba0bd106cc84c8ecd21df352df811330582a5 |     
   x86_64    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/2397c4ae7a3392c6859b296eb3312cb9f0b0e286 |     
    arc      |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/9db9839386a0b27cf006d1c0981747ab4cd2fb0f |     
   x86_64    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/1367a5eb3dd2842309f138f2b878e913bc8a5290 |     
   sparc     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/7c9b1e15f75135670a974d501e7cc2e496bffc1b |     
   sparc     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/8d168ed5b3056f28ec69a1f76e12bb922aeade6a |     
    sh4a     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/09ded6a85ab82ee181d28bb1002d1945ab961649 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1ad5ea447d74293ba586aeab336e476cb2e4fb20 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b92dd7507ada955ea6eb8422cae4a5e9aef1c1fb |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bc9633d2949ea8c44b5584e1b6082f3f2fd6233b |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/10f590bbbffed2660696aeb45c8eb03cb3c597a6 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/392a1602821405b8e65f5d67860d75831253fa13 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/08066a499e977288a29fb7f8a495101ea406a5cb |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/73cd4bdea01e3f30219a3eaefa20b5e0c6ccbfe8 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6a26224c1de6303705c02615a554376312c7e8ad |     
   armeb     |   python-cryptography-36.0.1   | NOK | http://autobuild.buildroot.net/results/56a5bfb221ee6c59c073cc164a13d04fead7b32e |     
   armeb     |   python-cryptography-36.0.1   | NOK | http://autobuild.buildroot.net/results/3e95e3c5d633cd90bc435ec425e0903aa7e5d5e5 |     
   nios2     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/2170bd8390060b991ecc8c7a44eaf981489e5e18 |     
   arceb     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/27d02540d6b1ac50acf36fc2da5af27ffb81c532 |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/6d4713aaae4c20c89c0d245aa468725d58662541 |     
    mips     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/4a7c09d8ad56c0a3221f11edf55dd1a77f716daa |     
  sparc64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/c98c5d9878cbc1db2df59fae3b7337f5be217b45 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/d1d02135fe2d272f931bee1958db67d225218ecf |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d912e55fec8e1fcca00658f81787b6904f3bd6fe |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b7303e296b502ab4a9650a7b7930f172cb4c7e18 |     
   sh4eb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/cefa32387b245b1d455ddae52bca5a8ccad4db78 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9e243908f4309aed208d2bdb7db245722f8d23d0 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/80bd99e9b7a1404afc9c41a76892b53f0516a403 |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/52f7d95c0a7be64ec91953fdeba59d73e3888629 |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/543d70eb26d907133702d7a7902f884660a17d55 |     
   s390x     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/031df8e5b9b4da5c16d0efc2d3a8df8d86a495ec |     
   sparc     | rtl8189fs-73f826f0fa74b2fc1... | NOK | http://autobuild.buildroot.net/results/896ebd3684205731f04c7622f650071b26e0584c |     
    m68k     |        sdl2_ttf-2.0.18         | NOK | http://autobuild.buildroot.net/results/ac8b366558bec61ada84ec15cf27652fde2b63b2 |     
 aarch64_be  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/33c08e487dc6888a3900712295522341aee5804e |     
   mipsel    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/d0ae71775342a0a0b36fa40ccf36394c389932a5 |     
 aarch64_be  |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/fd91064cc26e0ba4f965f112d859e41483c2ec10 |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/60851716be3644db245999d36f041c3c967e9612 |     
    i586     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/5dbf4d178b69b8e1ffab9193f492ffe90db10dd8 |     
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/ed1ca90f062d2f1f7be116ce06e073f10370c96e |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/2ef5a1a8ff6ee44c672ec40fd53148938a27d99e |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/37c98b47bb51e6a030caf512795ecac3386c3b45 | ORPH
  mips64el   |          tor-0.4.6.10          | NOK | http://autobuild.buildroot.net/results/65fef646f8db401e6e14ade758aece06f93d2c29 |     
   arceb     |          tor-0.4.6.10          | NOK | http://autobuild.buildroot.net/results/459a2cc9837d4d5e797c2a99c241e6c923dce6ee |     
 aarch64_be  |          tor-0.4.6.10          | NOK | http://autobuild.buildroot.net/results/bf307b3d64d7dc69be894b963b45a8fb0524495f |     
    mips     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/459c643c81f0889a691417a725b334d2f441e1c1 |     
   xtensa    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/01a5d9b367b7d2d342d391bac9ba7fd769005186 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/afa4db648a48ce82a2b752442971c7776763f849 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9852d9499c91fd01fcc084f84a71a887fc4d9401 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0114f52b4f43ae8485b3887daca9f2fe66d99ab7 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6580bbf24b4068021ec03e49b0adddcf8b1cb20b |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/fe1611f1e36895524666b32c857f7c6f35afc27c |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b66b07abca4dd86fdd3dee81aeea687b98a15930 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/21c5e15560e5ecd8a6eb8c9405906c269d9c0810 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b927ddb1d7295f914871a26568159c03f533ccb0 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/bc60c467db2778313ecd7f16bf190e6d04171ae5 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a647710b05e6941bf007965ee04c671abfedffa5 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/21bb0dace6ad8a9214261ba9d3353ce17daaed29 |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/8017d19d5392df860367b8e20ea8ac0241eac503 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8530036775572c54db8677c75821049a665174f3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7120a2020d4d59c05da980044a783b7c50e01c66 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/90b878d8c879160d2bc7ee44bd822495bda6aea9 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/99b69763fd7357b520f7a146595cc44b769ea692 |     
  aarch64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/2def98c0caea3dc9e1d75bdb5ed7752071150563 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b5e971612153522f4ffcea6f606fad6d7b8e4f0e |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/222bd23aa3dd1797823d1d57b75f5b51faed5b12 |     
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/63f0013c369096387c81fc4304b6be526f7f5760 |     
   armeb     |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/e8afb38dad829d391ae09396451bb0e15c3985bc |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f25f0c32f06f200aefd7703c2db7cadbf9fc7191 |     
  mips64el   |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/a277c3af713c4926d8697852d6abef82a1d29693 |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/ad3af73f69b973de75f92ec0dcfd6b0172edd1bf | ORPH
    i586     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/adf8faf642108b8af85744e46efcdd02a39061ba |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/58bc2d482baf8c77a5517bf6da52e9e7d33497b2 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/74c6117b5ecca072cbe8a7b0955bb3d626c1da87 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/3e6fca97ee67ef6ff8fd5b1571b204bf6efe9574 |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/eb3a7e2de8d65f07700c399d8d1f0c9e70def8d6 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/d514660495ad91f261aa663bfd9a13dae647812f |     
   x86_64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/e5b67f6905cec387d01d594e5f6f112ed01f62b4 |     
    i686     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/f27edbde7b0913eded78f479e0504020f3ce2729 |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/fe49bd4dfebe4006c257c772b34ba20d85ed60e8 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/0dae5432183abbc775149ef926a30caf983dc0cf |     
   sh4aeb    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/7cd2753461a6b8495859ee6180cd57c935fa582b |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/aa2165a7dd37b1467737376a46194de859e33283 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f77a4fd1c37278ceef75449c39bde518257de355 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2ad46d70d515e7b536ae2e9825fc6f34d93cd528 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0b60fed9e046b8e1100a9413f29e78461bb54092 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c05d3c0a3eda4a93c5388b50e8281758530e8240 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/da392bb8bb42fb97bbaa0175979f8503f88373f1 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 3 
                 wavemon-0.9.4 | 2 
             host-pahole-v1.23 | 1 
                       libuwsc | 1 
ulog-0389d243352255f6182326... | 1 
  xdriver_xf86-video-tga-1.2.2 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/c029728faa38779ee885275f5d18a266d91bde8f |     
  powerpc    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/bd3be3c00213c4c021c465517f746f5d65d19776 |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/253d4638bb26eab57d44c8271516fea84ce4e521 |     
   xtensa    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/0dc0ded89276e9f9de7762dbe8ea40b9e07f5219 |     
  mips64el   | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/736a84930743cf60ee6c832c36c2dc3628be7946 |     
  riscv64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d44bec876105bd56a774645a53d7376b88dec5bc |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/256340d6f690c709bbf7061d9241370101185579 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/41e4e761e05ccdf261d8de774d91a15b86a10d5d |     
  powerpc    |  xdriver_xf86-video-tga-1.2.2  | NOK | http://autobuild.buildroot.net/results/a81960d4a0f3280162cfe28fec843edaad03c5a2 |     


Gitlab CI results for 2022-04-28
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

