Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662E8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 04:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B0360BC4;
	Sat, 23 Apr 2022 04:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbZoWPBnO5Ol; Sat, 23 Apr 2022 04:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C47160BDB;
	Sat, 23 Apr 2022 04:43:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5681BF285
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 04:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8685460BDB
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 04:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIcRcKlwISDj for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 04:43:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46D3F60BC4
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 04:43:03 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 64DEF240009
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 04:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650688981; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KU+HOOWi5eNDVAj/+uUljrlfgndxtn7uw+ALZnr1V98=;
 b=T4m4pX1UvILn72Oc65k+x0kVg6vpTGW1aP5BnQe0TrOuxpYQb3u2G0KodIKII//GVLSFSP
 Kq/u383SHKoAuDvhHYWoreRhRWz6SV3U1B8XwgKim+VDada62ZyBMf8p3Z2p+mQrkpHEeJ
 x35bAOpSeWXJvk6Ai358avkyn0LX1nd92vzm6fNeuAZGkgI+e9VmKkHhkrx6J1Yi6zKW4Q
 l1OjA+aqMh7/4MboMO9+YB1r7EWRi4Jtkc4SWrI/ZYKs+MWfJK2wnhGangVC8R//WmZwMO
 9ONi9sSrYEEnIJ1PJ+Qti+BeTPPeGG/EzcqjE43VIuuOZP7Zh7bXNur+qDUbUA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 04:43:01 -0000
Message-Id: <20220423044307.8685460BDB@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-22
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

Autobuild statistics for 2022-04-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 15  |  3  |  0  | 18  |
    master   | 202 | 343 |  0  | 545 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 35
         host-gcc-final-10.3.0 | 30
host-elf2flt-7e33f28df198c4... | 14
           argp-standalone-1.3 | 12
                 uclibc-1.0.40 | 12
                  zchunk-1.2.2 | 12
             libopenssl-1.1.1n | 10
                    ttyd-1.6.3 | 10
                    git-2.31.2 | 9 
                libressl-3.4.3 | 7 
                 linux-5.15.33 | 7 
            qpid-proton-0.35.0 | 6 
          host-erofs-utils-1.4 | 4 
         linux-headers-5.15.33 | 4 
                   perl-5.34.1 | 4 
                python3-3.10.2 | 4 
                 zlib-ng-2.0.6 | 4 
                     aufs-util | 3 
                  exempi-2.6.1 | 3 
glibc-2.34-109-gd64b08d5ba7... | 3 
              host-rust-1.60.0 | 3 
linux-headers-5.10.104-cip3... | 3 
                  netsurf-3.10 | 3 
toolchain-external-bootlin-... | 3 
                       unknown | 3 
                  botan-2.19.1 | 2 
                  cc-tool-0.27 | 2 
fs/ext2/ext2.mk:65: /nvmeda... | 2 
  gobject-introspection-1.70.0 | 2 
                   gstd-0.14.0 | 2 
         host-gcc-final-11.2.0 | 2 
          host-gcc-final-9.4.0 | 2 
       host-gcc-initial-10.3.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
                host-go-1.18.1 | 2 
           host-harfbuzz-4.2.0 | 2 
              host-libcap-2.63 | 2 
             host-pahole-v1.23 | 2 
               libcap-ng-0.8.3 | 2 
              libeXosip2-5.3.0 | 2 
              libgcrypt-1.10.0 | 2 
   libtorrent-rasterbar-1.2.15 | 2 
           libwebsockets-4.3.1 | 2 
   linux-headers-5.10.104-cip3 | 2 
                  ntp-4.2.8p15 | 2 
    toolchain-external-bootlin | 2 
                   uacme-1.7.1 | 2 
                    vlc-3.0.16 | 2 
                 wavemon-0.9.4 | 2 
                    zstd-1.5.2 | 2 
               aircrack-ng-1.6 | 1 
                arp-scan-1.9.7 | 1 
                  assimp-5.2.1 | 1 
                 augeas-1.12.0 | 1 
                    azmq-1.0.3 | 1 
               belle-sip-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
                bitcoin-0.21.2 | 1 
                  boinc-7.18.1 | 1 
              bubblewrap-0.6.1 | 1 
                  cairo-1.16.0 | 1 
                clamav-0.103.5 | 1 
              containerd-1.6.2 | 1 
                 coreutils-9.1 | 1 
                    dhcp-4.4.3 | 1 
               ding-libs-0.6.1 | 1 
        edk2-edk2-stable202102 | 1 
              fetchmail-6.4.29 | 1 
                     frr-8.2.2 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.10 | 1 
               gocryptfs-2.2.1 | 1 
                       gsl-2.6 | 1 
      gst1-plugins-good-1.20.1 | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-11.2.0 | 1 
        host-gcc-initial-9.4.0 | 1 
           host-wayland-1.20.0 | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
                   json-c-0.15 | 1 
                     kbd-2.4.0 | 1 
         libcpprestsdk-2.10.18 | 1 
                libglvnd-1.3.2 | 1 
                   libnss-3.77 | 1 
           linux-5.10.104-cip3 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.5.2 | 1 
                  matio-1.5.22 | 1 
                 minizip-3.0.5 | 1 
                mongodb-4.2.18 | 1 
               netatalk-3.1.13 | 1 
                  nginx-1.20.1 | 1 
            ocf-linux-20120127 | 1 
               openblas-0.3.20 | 1 
               pipewire-0.3.50 | 1 
                      poke-2.1 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                      rauc-1.6 | 1 
                     refpolicy | 1 
rtl8188eu-903b6fcb821465fe9... | 1 
rtl8189fs-73f826f0fa74b2fc1... | 1 
                    ruby-3.1.0 | 1 
     s6-portable-utils-2.2.3.2 | 1 
       shadowsocks-libev-3.3.5 | 1 
                suricata-6.0.4 | 1 
                tinifier-3.4.0 | 1 
               util-linux-2.38 | 1 
                    vde2-2.3.2 | 1 
                       xenomai | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/c5de84a60367e70c1f9ce4cd2bd27b2d5ef9bfae |     
   armeb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/a9c81b689f5ce469e22c45da4b26a367a36fb0c2 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/b9445aa36baee26ef10b65ccce45243ef3465993 |     
   x86_64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/b35e24c9c07f6950b880e00a59d5d49352dd08db |     
   mips64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/8e4efae14375ca6a7a6232014a4ca4eddc179634 |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/808edb624f47b3a6119bc9474d18c8b74b9b3bb7 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/0224dcc27c5ed2726f19c87ea509cbf5b2772598 |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/4c375972f50ee61d74ed042e8e8d14bc5cd6cd7d |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/706de5ddad0d45d365951976ac6337d3c6ad0264 |     
 microblaze  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/22160bd14d9d557ee3240f29314367e84881f615 |     
  mips64el   |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/37cef94dab2d7a58e82cd5c1b34c856256eecb15 |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/124d28ee7489d2530293478ec80c4b7fc62d6172 |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/63bb39e2201bbac8957a663bba623f9fa7b2754c |     
    arm      |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/7ca843410f04c7b644a7ac08c1cc2ec46595e7c7 |     
    or1k     |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/03417a24c6794d51c1dad9701805545c9329d4b5 |     
   s390x     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/3643b775dba53318bb30b7a671f67ddc4070fe9f |     
   xtensa    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/3deaeabd975929df47f254f25b56f6a6abd6987e |     
 microblaze  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/699db97b7205d4264f93d08c358772637c0e605f |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/a0810d59c450535cb40f9e8ce9b93b02af4eb95b |     
 aarch64_be  |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/ca5a64d6b3227038f800a63e2ef6fc16fdd91681 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/161879f9c4d72c6fad2e00aa6c35cda59a058fb1 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/2636ebe77f840f2554e36b5da4849122d13ceb0e | ORPH
    i686     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/219dfea7526b1d55d65a1e0da8600e12d3ab7f16 |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2271178a36d1a8aaec2f5665b67904466ef18064 |     
 powerpc64   |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/833ef2648af518de95a8c050cf1092387087704c | ORPH
   mipsel    |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/45d3c33d832c5cf6579447ccf4763a297195b924 | ORPH
   mipsel    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/ae53dbfec4aead7e4eb188d5693f305d4e474d1a |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/193ec9824bcd08c3e6cb20feab26a733bbde4418 |     
    i686     |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/56676886c8d81c5161605f159111beb6f62fcb3f |     
  riscv32    |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/2d2acfa4d4efd1fd64c3cbcf615bef7cc8af698e |     
  aarch64    |         clamav-0.103.5         | NOK | http://autobuild.buildroot.net/results/5bb3bea6d13ac8d497f6862374d65a59bea7ed09 |     
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/f40d258a4f4af2cfbdf028e51e35c4d0927471aa |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/f9ffe18c1e5c36cad83fd998c11971fcbe5b7170 | ORPH
    arc      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/55e062c2c972502f61a49f954a74e2b6feb2a3e1 | ORPH
   arceb     |        ding-libs-0.6.1         | NOK | http://autobuild.buildroot.net/results/834e322f345eaa1875a47ca61a6e6b55bd4f1026 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/1027ddf4a6df0199171fddab69b149a3596bef6e |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/e9dbd99711266432ce10befd5527c039c07a9b7b |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/338dae2bcbb9223c52eec339dca0e7aecca881f7 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/3987476024b4ae3d2d1e49bdce585d53fa30a06d |     
 powerpc64   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/93cbf3461fa2391fd7068413db1d7350caf62b61 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a6ff2f523c5507a4fe43831d4ebb60a0c3743121 |     
    mips     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/b84c53e72c51d43b890f75e2ee984e657223477d |     
 powerpc64   | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/6e372deb3f6d7aab99a24fa3be68855f980a7c9e |     
  sparc64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/f0e27498221fd68a718499ace72917e3c52a3be2 |     
  sparc64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/d88f66fd41dfb07688db9216370579993ad56185 |     
   sparc     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/9b1b9f0835f297822b109f010661848b8472976a |     
   nios2     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/ea92765acc76971d88720ecd3722dd4069be9982 |     
    m68k     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/e98ab81bf83747ad4b90ea8c45bfd366d55c4add |     
    or1k     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/7303f4c6c6f4909927c8fc3179ef0658bed74159 |     
powerpc64le  | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/b8e0912a6ab0edbd94fac8e042319e810a615a41 |     
    mips     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/e6726b3898cd2ff1cf760783eef4d490239aa713 |     
    mips     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/be01f648fe83f178326bc9b56c82e71b57433331 |     
   mipsel    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/843d04e1f26cfde2da33b188acfddf4aa107fe20 |     
  sparc64    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/0088f8d5eaa446893e3a30938320d0f37a75eb30 |     
microblazeel | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/166222c0ee6ed34cc4f3898ae9f2b5b460f8caf0 |     
    i686     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2a2083b3f328d92e0c60f52cbc784b9b2d49e7af |     
    i586     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/b624331e174a56e1c74322f046c860f91efcfe10 |     
   sparc     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/9ceb1ead3eb2de446cc59045be84f8f3c44e657f |     
  riscv64    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/c286cc68dd84b55459e60aef243fb717b5a9facd |     
  sparc64    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/58315ca7cc8f156782fe0f765a40452e5457a4d2 |     
 microblaze  | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/e1dd5538c9d521325d26cee83fe96d27bc39bc28 |     
  powerpc    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/b5e8baac0ce0206d3d38fdbe00cbcc97759aad9e |     
  mips64el   | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/7955c06797225b38978c468bbb25938bf80e9645 |     
   sparc     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/52d7325db7439cc52eee1235f56bd9200ba57826 |     
    i586     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/ab8fae5a1136197cc9c317c7a1511f89a6dbe574 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4f4eac0f4dcee2bc8dd53f91806a3833237684c2 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/42e42e04139d33ca47d3d9634eeba360bfe68f84 |     
    or1k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/a9dad05561782bd9b5c2f6b43d202fdaa076c9f1 |     
  aarch64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/8e6e6ebe2997dee5c07754d0293fccfda5a4d604 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e0b4afae94a0fffcbc9989190a473e94a4eeda23 |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/364b4d44023868a93acbdad1a381f1d29daf3084 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4aeaf84e64a726ac2d7e7f1205712bdadb040583 |     
  aarch64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b8161f161e6fa6b982f1b444334c5abb737b548e |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b17c6409f2c0004ea85963c09c3cdb4b859e3d14 |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/662440b4a816910e7a8c6ab3645a765f070f017a |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/7849a619d232f600cb3f1e481e88459d2afe83cc |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a94940c05a09927e03226f727d9adc165dd32e58 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/e0c510ba683d7a96d3dc56c032eb650416f52469 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/bdc24e4c312109c415dea59e1bc7e66e3606eeeb |     
   mipsel    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/a5c3198611af47f3b056a45c0196287c50083f5b |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/0b2d4e9c2df71d1bf1dd0d88fe97797a9967be49 | ORPH
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/008b4fe08054845ce2be108bba62e53d89204d6e |     
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3b8753acbb931443ccd96942f2a533c21d28e538 | ORPH
 powerpc64   |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/c470a00eabdf6d01815b0ffa755e3bf6c97b031a | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/8fcdefe378612eace99e80ac16196f52ea3bf9ae |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/b7cd5099e5faf7f2490a4cd2d592c702133cb946 | ORPH
    arm      |    gst1-plugins-good-1.20.1    | NOK | http://autobuild.buildroot.net/results/21792a9839d9722815075569123df8747fc450e3 | ORPH
 microblaze  |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/026b9d8089bec59c6db6de1fe50e8e852dbb5442 | ORPH
    i686     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/0224b4edcb92e99d9ea7d340c388784443a9fa51 | ORPH
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/db2f7635b9c919320df4c67ca5645196085e0bc6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/700f6868e497c0ea485a123b573ef64f6dcf100b |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/64f6c6d5c716cdd5979a06da9d4b5566acc271fc |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/52b50b4247e8321e55c4ef27eba42b50a275fcc4 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a2409a6aec3ba1822de51739406b97ee20d2d56a |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/13533301b6916b535d9c849dbc60db2b8dd58e88 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6b84a23048d7f6e683da88f95879beae5d50425d |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d997c62b65f756f2a4bc6573799f92a9df85febc |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f5794fb8c3db27b0f65704b9277cbc9682d6b0a4 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9ceb19b3d458e26c644ca0de79ddb07420bdd7dd |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4e009f13cc42bd3f4ad4918952f2167b6b343d7f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ee23e534353e888171197ffdca7172e7c3089c96 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8fb81aff1d15492f807a6abe72583efaad9b0438 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/185343339baa561701e90ef80ee390a5eebb3756 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1b26f13d47cfc5a517be32c899fe3c94bd588b91 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/080fbeb3e9653f311a334ee7cf17747d61425328 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/668c871c1a3fa4e5c0e188eb4e92aee9e7ff49d3 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b0835c16841a8962888bdd47ea34a02937fdcf3e |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a561dd30bae73ed2aca8a2e8765ea27c368f85e5 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/27b93df68ef96b62965454fdfd61a0ce80b5eb00 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/72b118f1236792bd21913648f5fe227ca1dbd2e4 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6db25e21dd9970bb6543f2e5d9faf3a0d1879781 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b7f53a3b22b572d5dbe071a198895336eb93f225 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2439b83b7b583e9239663af4a6bc40f14724515a |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a9374391c76eda7fbaf701e712e09d7e79ee3f15 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/34624a8ebd0401a1b95c889840db083702c39849 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0d0382ce3c012c644d5829db8319301bd857aea0 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/636c1e1a4c43f3f82ad6310dcccf707100d9e2f5 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1f41b069d130127c392934483d7c9c01dba220d4 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/993d98972cda396b63849fb4259e026c7f61995f |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/98e94f4049692c8673b13fffd8be0213f2152226 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/098783006cd9e52c8ca5821609a1df55d7a2d9be |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5299648e8d7248ea844032179960eb11f9125430 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0d44483709c1fb39185de720784381049fc6e5e5 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/db492a8ce2c4ef799e8a64127fca928dd61b3bd5 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/7713e79b2f4031a47fd00a34df26944681955c9b |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/23485f7a642d2cccb0df72d3d59be2f134530f04 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/cd36c0931e7a75e73b000740a7fe3ee00a474458 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f941af946f1b9b8ded20f3de3494882aef6e94bb | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f9f3c084d7abec8765cfdabdca4658dfa9f511e5 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/dfe44fe81c826cb6c2f5761fabc1d82e56a05344 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/84b2a39a1a0edf0086c5da1be6b9e35b9fea8146 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/bf32aea4bf834907db632dd52980d4e9d4463105 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f3084664f7ed2995ae42775231537d31ca56f40b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/cc9d566ddf9bfeee69c2c6ebf927e53842478010 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/9505d54f89f9bade7bbcc50ba48105943d6b9e19 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/87c65203653bf8d85503945b21030eea13947042 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/5e731d78813962fe45ee325a27362fc5d318446b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/8c1c3921d0a033767f26ec6b68b6b6445dfd4926 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/ffeabb8fc02f2cf8b5c41a0a9ca36eb13d73fe35 | ORPH
  sparc64    |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/0147f3401cecbc8b4670c3ef7396b1dfb28fbe00 |     
    arm      |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/4ab4f46caa6de4e8f26b4c36694bfe3f4655e559 |     
    m68k     |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/d39e9501305979d086f3d31cd9c08a5bc4b9973e |     
 powerpc64   |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/613e7de1ef4af9633ef3a9c003341154158af983 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/51f83c2a9fdf02748ee6199073b6e0fa6bca05be |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a1bf9d30967d28b935e9f767316dce90b3b39ce6 |     
   arceb     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/22b11ce9e6cd9dac4c09721a43ed294cccbd3d4c |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2fb034ca144f62a6b69368e8a257a98fd5c714f4 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e5419ad1fc7a9842116d74de4595c650f7fe32a0 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1a6e4b086d1661ddc665b82ac69d5ef17d6eefaa |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/551be90a38564e17d991147d96e990659b05e0f0 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e7670944126597b185dda24fafcaa448c1ee934f |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cf821ff992da77e8c7b37a27228c8b328d6395d1 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/92a308d79fcbb398e83b6fb6ba299baf28375c7d |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0dbf85913397a20a5b3065cb57742ac4e4d79429 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f58462d83c85aae3301021bdefd8b414173bb5c2 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/608553c45d487b8f212beaea7e5ec5b096edc27b |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/68dad682310dfa8b2060f1e0940c2ab1fe817c93 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6b1f21a9b33263cc86945a551a722e51eec2abde |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2410d6607cdf93516ebd70cebbe1919591faba7e |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fc2a7e4ca3b8e311f1790de42c69ce9ea9765405 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5cee36731c7a090e3b4d13aa7613cf08c3130948 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/44f24958a6a8f1cbe470a2b56528d4166c0d9ebd |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/363d36a4d662b90ab24491a559b41e8b5253f9bc |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/eafc7559af885a0b9a46811646c7c544883fc4a9 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5beab23a87c5119393b3ffad17ef501776029a73 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9d5166adfa4da16904ae4c673ad5926e9f40d03f |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5560a7e8efe1dcd3b5af888bb86019693fd0b122 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dfc1e45057b099fc47d417b220e5c304e7fc45cd |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/751283aebafb0219c62eadfd018b69ab637538ed |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/69020d1550a9d39369151cd0e1caa3c083ab2232 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/105d0c11a24a3184a567b1d9f502e638ff20d0dc |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2e3040180d17ee62ad2286dd2381bdbc18b842c3 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fef261327a5cbc45217ee078fb643082d3a19998 |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/2782739ebe60b7341f282bce2d6cdd3f2e19bbef |     
   x86_64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/5db8910d2a05398dc6474297138e586aff65b255 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/726b684342da9cf7148a5f545fbc8534660eba5d |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/2c65b17b5db45acac769248902e13db393b4b1dd |     
    sh2a     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/a6eadc8ac47502fdd25410fb9e291a9de4dacfd3 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/e80debcf4264eeb7b568de4e228ce10cbf8716fd |     
   arceb     |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/9694a400f3e7daf0ab1f14332ae83ff77404750c |     
    arc      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/227fdf616e51194f6b961f8d917068765b027312 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/20e9d1aefd274308fd8cc67b76cb0a06e05faf79 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/95510746cfead4fd9295e5cd6311593ee682c652 | ORPH
    i686     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/35943ddc15c689815aa13a746a07c2a4867b5394 |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/1f7baa10f3274a8d792a9ca05373b7eb75e8ba77 |     
    arc      |      host-harfbuzz-4.2.0       | NOK | http://autobuild.buildroot.net/results/bbc48cb5232c617d4ff1d0bafd63bb3c9c72d556 |     
  powerpc    |      host-harfbuzz-4.2.0       | NOK | http://autobuild.buildroot.net/results/7b2430c5ae4eed51685ec12bf778c07a0a8b1701 |     
  powerpc    |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/adaf0718278c7ba84d33a726b0ea3008c9c0d7b3 |     
    arm      |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/94141350eb50eb38da2c01342628a87acc5e68b8 |     
    arm      |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/5017edb30136c5b8befb47d2616c512a5847b582 |     
  sparc64    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/ac8d3967ff7f00cf91fe81960a280c3dabeda104 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/12552b4bfa4d738d1d6f6d93585cf6a87577c005 |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/0989e5c4aadcc1c9ab555360f0a81545064dad13 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/9ca0e8d3c7873720981ed8cef93cc89c348a20da |     
microblazeel |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/43c255c375d0f83042e420bac73302044f217e8b |     
   nios2     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/6d6dc960dd3dfe6397bc6edcdcb20dbe318a3001 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/86044d15523fd3f5930359be386631cde9183839 |     
  riscv64    |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/37215068e82222a87ceff2036d76aa94e933a156 |     
   mipsel    |           kbd-2.4.0            | NOK | http://autobuild.buildroot.net/results/7e4c6f5503f55e3e58c447b050a9fbd5d9bc581a | ORPH
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/784824620b1bf90207e1a01f26949de87c386de3 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a7573e5cfe7c9c9b29618faeba605c18507b4dfc |     
  sparc64    |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/6fa2054c46a18d7f20d01a90c1b1cc7cbae71d76 | ORPH
    mips     |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/4ad86c6b6be331616cda5feb52e7c8d7779d0f24 |     
   sparc     |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/070fd4fcbe150b867f08ad2d64a843c5a2fccad4 |     
 powerpc64   |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/6679d3b238358a47b8f5e9eb0798cf7cac23c5e2 | ORPH
    i586     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/3075f85fa93b39bb04b387dd80e5da4a54f1acb2 | ORPH
    i586     |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/74f5d62045834e0a84c379d1cdedb04983c183fc | ORPH
 powerpc64   |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/5fc2973ff75fdad8f41538ccbd0291ab853ff2d4 |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/72b203e297a0c05dd4bbbdc705ca51357ce4d63b |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0eafab722e7470976b898a3f16a74b2e4201783c |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/38abba63804489d7add65457a5d49b1c767beeb2 |     
    sh4      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c5174967671ea8ce3a7f45e117e61f81b380ba1f |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/a54e1d38cc331797a864b46820647e4c28b78cf9 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/1c60fb4d9a80757f2e1c9d06262f3db2424c074b |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/955bce0593e31b9e83348998bcc8e61325355734 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/e01b137ef43fa4546050d6f5cc14e5ffb83dcd21 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/72f1e42bfb14b36490c094aa022ce65d8555bb22 |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/14a9a004d39dee4313b614812160c0feb496ccd7 |     
    m68k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/08474c0a1fe7ac90bf57dd70e16249eb390e477f | ORPH
  powerpc    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/86ffc2814c697f35839e1af9e4e8144553e5066b | ORPH
    mips     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/2360828b5969cd65eb18eff05fe4487f208183ff | ORPH
    or1k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/1a1d59765c2092a3353416900d9bb7668573bc1a | ORPH
   x86_64    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/99a2897be548482e1fafaa85923a6e59fdc02958 | ORPH
 microblaze  |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/17399bd403ed63f0c7ae4ba47385d2542b05ad60 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/04bf722d0263720fea8be053543f59a2131fe77e | ORPH
 microblaze  |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/3db84b5a340f7396881a6be45bd698e24969cbad |     
microblazeel |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/7fa57c2fcdfecf65b1badc4199fa4e4aea0c9181 |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/8cd97674cb6cc2550323bc063137e936f7c2099f |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/93ef9f6e008e4c82c731ef9c7f9850369ecf1ad8 |     
    i686     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/61f7194f7008dd37d146816e9216bd9c82b44715 | ORPH
  powerpc    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/4e7a81dcac7b79778c9bbce2429b8ade99302b81 | ORPH
   s390x     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/f57be73179995fc2e7b99f93b22253ffb5cde803 | ORPH
    arm      |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/2841ad4d97fad13340792974b93b1c3a9bbd1b47 | ORPH
   mipsel    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/e64dd8ef2825c12eecd6d74ae3d6ff636314739e | ORPH
    arc      |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/b7a888a1e11315043044628104854201292ff40f | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/4bdd1c16bca62df7bc15b5639d4898ffa038a08a | ORPH
    sh4a     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/69e22b0d0360ff3205892f8d1dcca78fc042cca3 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/0d1182acb09f1566ffac9afefcbebcffd22257af | ORPH
 microblaze  |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/919f6f8e6f9923fe70cff0a974868975a14a2ea7 | ORPH
  mips64el   |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/959c0cf697b372e9baa9aff193142a1037877a3f | ORPH
    arm      | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/f16a38fc2721349cddd654a1bcf225b055e90c46 | ORPH
  powerpc    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/3cf1020beb1b00e98285198c738c1e621ee40308 | ORPH
    i686     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/059ea1945d04a028a760856b51df3de872d955cc | ORPH
   mips64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/9b9f9b9bbec038d823eb8d82979377a1f91b45cf | ORPH
    m68k     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/7a9b2e0ec8604b74b4ddf1929b2d16e767671c0f | ORPH
    mips     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/fd3f825e8a9e747e6ef6ff6d2d2fd8a28a59e05d | ORPH
 powerpc64   |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/0750dfeb22ddfbcefa6f29e178fc74124ba08a9b | ORPH
    sh4      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/e3103335855c414b48ad071624bb6f9d9879c0d7 | ORPH
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/b049ea50db93684dc4c8b7de937d5d59494a5671 |     
 powerpc64   |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/37485f83fbf1ba77dc0487f8622d903ea08bd9f6 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/b8478797b7ebf3f887f8f61934688d3531c09ac8 |     
   x86_64    |        netatalk-3.1.13         | NOK | http://autobuild.buildroot.net/results/fd2dff0e5edd3848cfa44980ac95571cebb991c5 | ORPH
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/dc4370a95369924b737bb07cc3f497bc87d157e9 |     
    or1k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/ca409cc21fe834c095e5bcbfdf885db604d88017 |     
    i686     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/9d54e719c5cf59d9bf25a8bece87431c9f187112 |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/bb12a8f71b0ea8272fd721c0ec3cd2f3999a4b64 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/3c993d0eb7e0114c109479dc933bcee164a655a9 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/3e85809645f4b497d34b732444fd7af56e19dd2a | ORPH
 microblaze  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/87f6e5cd95ef1c82075086c55df20ae56b781eb0 | ORPH
   mips64    |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/2743f7150db304d63f6a89eed431fa6fbc54d647 | ORPH
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4a1ba83d6e9c8c336bdfbcb0ff26b40134e2c4e3 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c9e514bc19ed1fefd15ad3b618d14ae497b76861 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ba07b822b73e98c0738ef52e848eed1c0389e9e5 |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b05c2e26c34a3611214ccdd6c642b35a68173873 |     
   x86_64    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/a01c0b9e93fcc637329c350fe82814b0729d0067 |     
  riscv32    |            poke-2.1            | NOK | http://autobuild.buildroot.net/results/748a8ebe2b13d8abdeb45846883724ce0b79dd15 | ORPH
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/ebd3763d63a21519e8f6140012684c36b3562757 |     
  mips64el   |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/6b7dd539068a971252940d1f2dde913ef1553134 |     
  riscv32    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/83cbbb52853c5c8cca908a15d2eb5d9d27618a2b |     
   s390x     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/9fd395b86adbb64f8b0f7e46aa26a2b2a78e04fd |     
   mips64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/6a6a2437b08eddec995b37de17e97f5ecd9e48bb |     
   xtensa    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/84deb6406a9279b899aa759544ff339bcd2f7e87 |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/a0974af5f099d63b5f5cefd02a630b54088250d6 |     
   s390x     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/a7b2923e14fc38bfe70fa491f3d32cb3e0ec683e |     
  powerpc    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/2fc07098e390e3c6d13356a50760b332ac07d79c |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/e1e6f1243ef16a7810db06ae0c557a3eff63b599 |     
    arc      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/547558523701008585142b00fe66e0dcec249fa2 |     
microblazeel |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/6446fbd07d4b679db1f58e7fcd51927bd022b5f4 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9e2f4b5cb6d531c859c19de9b5f30d3cf72a572b |     
 powerpc64   | rtl8188eu-903b6fcb821465fe9... | NOK | http://autobuild.buildroot.net/results/658c06f8125613b56511d3351cdfd3d8e19d48da |     
 microblaze  | rtl8189fs-73f826f0fa74b2fc1... | NOK | http://autobuild.buildroot.net/results/7f0bdd03c41bcc9e567fe722ed271e5dcf210f44 |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/35c5b435f39f9d7be3e3bdc284de96493b13bd8e |     
 microblaze  |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/2de4d4aa1b91ad86998bfac7e8598c66a5b0fdea |     
   mips64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/14ceb51554268a0c9b498ad2a43c1a779b9d86ed |     
    arm      |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/8f7d04393986fa9f89fae11d6580a9e2988c7b29 |     
    i686     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/41f72e8ecd828de19534766d973f57c64703cf0c |     
   sh4aeb    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/bff6527f9e6232c7e9a5200fe5f22e2091fe3a4e |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/aec28990ca333004d113ade4c03f4704067a3a22 |     
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/942c195b843cb5a9dffd6be51846b37b9efe67a8 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/32c70a7747efad99cc953e5809cefae2e78ee25c | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f55aecb120416bd3369033e018d89bf58fe589b6 | ORPH
   nios2     |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/c33c16a7721d7209c22c25b1132a8ffa9fdddb81 |     
    arm      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/84ac58439c377938c1b893b46e0a7892fc41b281 |     
  powerpc    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/684638c1ae44e28a3170e33d4bcbdcbf1f29529c |     
  riscv64    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/e0a30686c6cba1ff6eaab3bb9ac02fe923c0d289 |     
   nios2     |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/5c4c47023815c59a734f6f08a19ba10ff96d9d50 |     
   xtensa    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/9224139d62c113db7742e8c60ebbd6401628b021 |     
    arm      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/fc5f66204eb8870d060cf4f6a0595f1953366afa |     
    arm      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/0068ba8f9e53926a2559a758268d71157bee2f54 |     
microblazeel |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/ac07ce2050b7ae17bf85f0e5d5b75397f7357c3b |     
 powerpc64   |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/9605fc965c287e5bd8d8a072bb043311fb3bcb53 |     
   arceb     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/4774f58ac457e321870103062e3d8c9a50a6e40e |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/180a865e03f7f69a264bd0b0dd38f579c0a70ca0 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/08ea8427b6c9dc1d161361c4f1aa8ffe6e2400f9 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ee1c9d9cca93251372e1364610cb57bc245977d7 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a7fdce0af13504961a821dd5bbf6e8851795ad47 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/77014fea8863d023df4f78337ee2c384e65edc21 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0c79e511a735a213a74f271de7da1f3febe56669 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/985bcb6b04905738c1e174ac4cccc354bc536aaa |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/32f520da20e8b019fa524d8e6be5b7d462d2d5fa |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6b534e6a17bd358112618c619eff570d72211e4b |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/771caa7da3e46540fdead654ccb2387d5c011fe1 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/cde1b80d31cfba63cff3c64671b01cfa3bfedeac |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b04795fc36d9aed18298d24a546706b8d84678a2 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/bf24e5ad903095146396edc8965d9df538b4abfb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/048f5ded4556f5e7b322b46053c0eec47b387842 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/efbe82a1b01a821202c279a0468bd4c0946e5d92 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/842bcc1f134c583c8b42e7c41b7e8c97df81ab31 |     
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/555c272fe0f966f7f46d493236cb6dabeca24d9b | ORPH
  sparc64    |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/0ebd11226af123de1f4aa6619fae5dd2d0961703 |     
  aarch64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/ca12976952d5e46d00eec3ff5686ba95065e931c |     
  powerpc    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/54afd9249aa672d818f383272c5f1031b24d28e3 |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7d3f07fcf992497ef3caba3a5d081104579ef068 |     
   mips64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/65ce15ec2955d3a978ca601ec3ed91a98f14ff7b |     
   nios2     |            xenomai             | NOK | http://autobuild.buildroot.net/results/c840f8b3e3e084ea328c6da1f5384219badd5306 |     
  mips64el   |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/8ca834ff8045255f768ac227201de7d79aafc322 |     
   mipsel    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/2ba3e5a6f90486d612ce434175ff6f91ea97b40e |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/66757ca07b782d5b26a760d799d0ab7cb1c23afe |     
    i686     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/ba436f03d79598ab5609712db7a9f389e85bd672 |     
    or1k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/054540b80254b4746c4b4102eafbe619505ebb08 |     
  mips64el   |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/895d8b427baf8601d3bf4334534325ef324791dd |     
   arceb     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/39b099d100b154e569283f7ea151e3ed8f1fa216 |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/8e6dd3929892ad03b69c479343985afcd9da20e5 |     
   mipsel    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/f8a0d8571460dff4d9c72bc442eb0027b24eba09 |     
   x86_64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/b6777e67bd4aa55d95ae32034f475a3c1fb092c2 |     
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/1cb9d9a8dad6b9685b3786656e7f2e7c45e2b5ad |     
   mipsel    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/1f07e77deca088cb6b7cfd6559cac5ac95251fae |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/4b20f99bdb3630d76a9e3514ff8c96d04373d4b8 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7fc908d674957b07e28e7d17c865cde7c162b67c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1efb4e6438806b95324770306e47ef4da449eebd | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6d535bf9765793b9f459df357374cb2ab2c48cea | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/843c92151c9e661366328f079c6e8c11c5da48fb |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/d57de95b71dffa5d5d9ed2f3955bdc033576b039 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 2 
                  uhd-3.15.0.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/82925c93a8bddd98238d5d36ff52201b55dc6f88 |     
microblazeel | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/c1961e680557a3097c5a479b86a47ea205e42b72 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f33c3ba56367d33042fb82e7788347b8b05efd2b |     


Gitlab CI results for 2022-04-22
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425727  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425787  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425789  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425807  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425832  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425866  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425892  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425895  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425907  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425909  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425920  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425922  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425925  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425930  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425957  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425958  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425967  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358425987  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358426042  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358426046  | ORPH 
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358426049  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358426050  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2358426125  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
