Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE5FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 04:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4583812A4;
	Thu, 12 May 2022 04:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHBJyVzOX0Xn; Thu, 12 May 2022 04:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 655BE81293;
	Thu, 12 May 2022 04:42:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE46E1BF5B3
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 04:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C193C40541
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 04:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pE6vT2iX9vim for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 04:42:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E5DA40425
 for <buildroot@buildroot.org>; Thu, 12 May 2022 04:42:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AD9B240009
 for <buildroot@buildroot.org>; Thu, 12 May 2022 04:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652330536; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r9bt2jDOJyqYyyAQD5rf06UXHPMrrtNMMbDEzJuJ3D4=;
 b=etyFfrSnb2ynxQcVwmxy1W4IQNP6Oy5lkmgNnGliieTu28TRqKvcwVJpDX1VR/eakuBUMy
 SWio1RyGnU99WQQYvoVfxAaYcUR5GdLEmvWhGG1FRubpuVWUBkxpen12h/lts4DmihCFlf
 +itrDATkO5xoIhDgjfTYnqpI/Xr69v+UgrtoUEL37//eO49W7O0YynddJJUdaCL7WVA01F
 66lCMVv6UK3m7mg6Ynia3KoEEdQQpdfiBo+nedzDv+om61+lXFVSGrgpAQlHT6nuVdXArc
 OSWdCUne9HD4s6+917ByDPf57jo7OXIotETYbaj7OQjXzz3d55xq6HmzcWjDiw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 04:42:15 -0000
Message-Id: <20220512044222.C193C40541@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-11
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

Autobuild statistics for 2022-05-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 25  |  5  |  0  | 30  |
    master   | 190 | 287 |  0  | 477 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.35-6-g491f2ef1f0ff8... | 24
           optee-client-3.17.0 | 24
         host-gcc-final-10.3.0 | 21
                 uclibc-1.0.40 | 16
                    git-2.31.2 | 13
                pciutils-3.8.0 | 12
                       unknown | 10
                 zlib-ng-2.0.6 | 10
             libopenssl-1.1.1o | 6 
           libwebsockets-4.3.1 | 6 
                libressl-3.5.2 | 5 
               protobuf-3.20.1 | 5 
    toolchain-external-bootlin | 5 
                busybox-1.35.0 | 4 
          host-gcc-final-9.4.0 | 4 
                    htop-3.2.0 | 4 
            qpid-proton-0.35.0 | 4 
toolchain-external-bootlin-... | 4 
                bitcoin-0.21.2 | 3 
                host-go-1.18.1 | 3 
                 linux-5.15.37 | 3 
                   perl-5.34.1 | 3 
                      rauc-1.6 | 3 
                     refpolicy | 3 
               acpica-20200717 | 2 
               aircrack-ng-1.6 | 2 
                alsa-lib-1.2.6 | 2 
                arp-scan-1.9.7 | 2 
                 dash-0.5.11.5 | 2 
                     frr-8.2.2 | 2 
  gobject-introspection-1.70.0 | 2 
         host-gcc-final-11.3.0 | 2 
              libostree-2022.3 | 2 
                libzlib-1.2.12 | 2 
                   linux-tools | 2 
                  ntp-4.2.8p15 | 2 
rtl8189es-39c17661136da48f8... | 2 
toolchain-external-codescap... | 2 
ulog-0389d243352255f6182326... | 2 
                 wavemon-0.9.4 | 2 
                  acpid-2.0.33 | 1 
aer-inject-9bd5e2c7886fca72... | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
             berkeleydb-5.3.28 | 1 
                  botan-2.19.1 | 1 
                    brltty-6.4 | 1 
                     cpio-2.13 | 1 
           docker-cli-20.10.14 | 1 
docker-proxy-339b972b464ee3... | 1 
        edk2-edk2-stable202102 | 1 
                   eigen-3.4.0 | 1 
              erlang-22.3.4.22 | 1 
               erofs-utils-1.4 | 1 
                   expat-2.4.7 | 1 
                  faad2-2.10.0 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                  gauche-0.9.9 | 1 
 glslsandbox-player-2021.08.24 | 1 
                gnu-efi-3.0.10 | 1 
                       gsl-2.6 | 1 
                   gstd-0.14.0 | 1 
              host-delve-1.8.0 | 1 
host-pahole-73383b3a39afe86... | 1 
                   hwloc-2.7.0 | 1 
ktap-23bc7a4a94bd9e4e1b8b7c... | 1 
         libcpprestsdk-2.10.18 | 1 
libeastl-45469730d641868ce0... | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.70.4 | 1 
                   libnl-3.5.0 | 1 
               libsigrok-0.5.2 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
                 mesa3d-21.3.8 | 1 
         multipath-tools-0.8.9 | 1 
                    ne10-1.2.1 | 1 
                  netsurf-3.10 | 1 
                     nmap-7.92 | 1 
                 openssh-9.0p1 | 1 
                    parted-3.4 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
                proftpd-1.3.6e | 1 
                     pv-1.6.20 | 1 
         python-greenlet-1.1.2 | 1 
            quickjs-2021-03-27 | 1 
              rsyslog-8.2010.0 | 1 
rtl8188eu-903b6fcb821465fe9... | 1 
                sg3_utils-1.47 | 1 
                     shim-15.4 | 1 
             stress-ng-0.13.05 | 1 
                  tbb-2021.5.0 | 1 
                   tor-0.4.7.7 | 1 
                   uacme-1.7.1 | 1 
uclibc-ng-test-0844445e7358... | 1 
               valgrind-3.19.0 | 1 
                       xenomai | 1 
                xenomai-custom | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/24c0aee9e091e1ba74aeb148587279ff3855abed |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/c75858ee9f6a0adbda9676dbe2ffe8bfd485c1c6 |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/fe89ad3974e8d06f4ac4361964f5768da3ec0389 | ORPH
    arc      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ca6d9a645c0ec8d8746b44a3d26aad56f6a92034 | ORPH
  aarch64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/031069f43e1870dcf4d24809a28489e8691002fb |     
    or1k     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/afb90b994b2dc77bf233a35fc8f0eb9538906be1 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/912e850dfcc227e69509b93380b029d6c688a1ef |     
    or1k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/b4006e44410ae1309289f22f3ac6ecc57c509a25 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/13980ef0366e172c96e7438e53630bb91b55141f |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/f078012ef5e9f72450ed9d023ed742e87eb002a9 |     
    i686     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/d35941f17f3efc31a14737ce20e17197a4911d65 |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f4ce990333f2e56ff0f14a430931fc43809b3e37 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/ff220993e040bd52128ce8bc7703eadb14e5c89b | ORPH
    or1k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/59ea6f768a64750b7724df02ef9ee4f4933484f5 |     
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/e9625257ed47af480ecf5c0017f41714f0561f3e |     
  mips64el   |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/a4ea6a8e9057c4425b4e9fbab352114639518773 |     
   sh4eb     |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/1507221412a051fd2ab9bb48396ff85b68cf5785 | ORPH
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/83b3929fba43eca59b9262fa9271fce9bf02c68c |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c28e8649eedce5d817abcec12c61593a7ed9eacb | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/535639321b841f32bef17c3f886d1ce592c3d123 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/2ecc9ff0ab500de7b7af800183993c7a3f05f4f1 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/011e86bc8ca20564b4043d35f9789f03e6a75225 | ORPH
    m68k     |           cpio-2.13            | NOK | http://autobuild.buildroot.net/results/cb7e37732938da0bef81f077b4fc923a6127075a |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f3966b83b886af550bf3b2a4dc630ee9c1a58096 | ORPH
  riscv32    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e66b0e0658c72c8f38edb39bd557c552e781a8dd | ORPH
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/7f22972ace7c3c479db50eeca856b5433a5eefca |     
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/fcaf864baa214c1ba82ef10a4037e64ea2e10732 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/573e4518d7880b8d96942cb022e84b0dabbd66f9 |     
   nios2     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/7ad628146e50d47792bf30996fc2e3109278af1c |     
  powerpc    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/9b966e75a0481e4a0d4dbff99ec2121700df9966 |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/ae004920e169f66cb732bf96c660cf9e3a5643af |     
  mips64el   |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/5299379bd07dc3b0a994230d43108a363fb5961f |     
    sh4      |          faad2-2.10.0          | NOK | http://autobuild.buildroot.net/results/35df982e122d9d0bc0f8e6469b472c3bdc97416c |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/4c3eea7483e99fcf496d012f2cd1eb1b76fecc17 |     
   arceb     |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/1db19b926ae6825c388cfd22b73982851c7b00b2 |     
    m68k     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/2eecb6729c2445cbc754e1a4d6d8bbb6dff2b024 |     
 microblaze  | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/47883f339446f6576607f41c1dafeb296112a6ed |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/88bd0ee412c05c36a4b4feaebd534d7a909023b7 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/ceaa72f6babb1378acaad4945192fa29d6948860 |     
   armeb     |          gauche-0.9.9          | NOK | http://autobuild.buildroot.net/results/b20b268d3e53035fab7e2450925e7211c2cf37b9 |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d1c52ded31cc255a112c5d34020d31aebfcb9cfb |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d547527f891b8a475096a3710a8db367c9b2e124 |     
   mips64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/7e53140cd07eeb7bf756cb9434c0fd41a88808b4 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/7b6639e23387b916bcfe3d4ed708dd3595cf86ad |     
    i586     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/521079865a5f3145055ff4386fdc7966f0f3f67e |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/694d0ed948c84000bd10144ae4ae9ef57d0468c7 |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/834582dfecc0eadf55a6a6809a729ace228b35a5 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/bc77dcdd564e35bfee5a269c4c8686dde1185728 |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e7e3078a1265b5158a51279b1f1cf0d07239852d |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/01ec332f6bbf655158df1f4a5066876d1ddf071b |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e2fb4fcf1c1b8f4d94d953f169757c2b12b46b75 |     
   mips64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/9c209d5274883abd42ad9e65f098e9a8068fe288 |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b5492b182f66aafde6a7eda10967b5b1cd037978 |     
 microblaze  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/08ee6f6c64eeb2b35e0da53ccc28b6bfa6c0d98a |     
  riscv64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/4d963580150a3cefb82bf0c530a95f4eb97e2000 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/96c37df2ae8572517a75570bc7c82a4920fb7034 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/1f6181101d0f6d23b338fc317af80b251218a559 |     
  sparc64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/9e0bb782b36ffab0ba5d74c933898675c0318e46 |     
  riscv32    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/4c099b5a4f35ba3f26f0153741ad2dd9bfdcd42b |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/49ce98000a6e0b1e271639f27b382c5bef43cd9e |     
   x86_64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/4a050ba82827c1e92bf664aa8a1b54016c7dd6ad |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/187bc22e8819e232aa8f9695d5d9852d7affbc41 |     
  sparc64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/bb56efe077a570411c1310430a2ccf6a5fb88177 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/8b99d9890b9e3174bb79fceeafec35fb9dde75f0 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/a42929d6f87b2180a4a5db393b816416c0f0f91a |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/f4f81dd1b9aa77afa7393ba7062899b7e42d1775 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/1bf31ad10a69374030bab51116cc38450ca4d20c |     
   nios2     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/9d19a4a16dd23ebe8ac5acde74d7cd8aa9552818 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/33d08cf33a0ee7af8e357d5b4e57af81600917cd |     
  sparc64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/d6ba081bb72822dae1eec3b27bb0985bc07957aa |     
microblazeel | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/7e3b7197be2aef4e1107d2dd237e0136cf0e70ec |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/a720d79042bfffdcbc2b7842a2aa5309f0ea68c6 |     
  sparc64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/4b5d6f5b55abf8bae729ab3e37e225ea9761e78d |     
   nios2     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/03a8713a1c0276282c821272f1f5679b4f063e62 |     
    arm      | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/4076bfd3b9012ca6d67ade9576c6a522782048ef |     
microblazeel | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/594d204b97e648f0e6aa4b93eea32e38ee953840 |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/dd726e5a4b007129c1a4244a3a9da65ad399bfd3 |     
  aarch64    | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/cdd2a034bcc3bde447ad17212da50227a1d4fd73 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/207fd483792779ba42b7e1f219a459feddf7a48a |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/2ffe9f8843f48f0e07cdd1d79adcd17cbc1237cd | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a4e4f726e46e96f4a1c947e160e34c4d80402791 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/5c4bbedecb21ebbf2f29545e9e392b208fd0e320 | ORPH
    sh4      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/2826d4e7ac5b64b4483b55b6c668846ed4ffab8d | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/c7dfb96897ee9fa175490b8d8031105ae977ac66 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4e9fc1e519a7ea57e92593a2b0822b97419df9de |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e5af50fe673430fb008d2217041f9401b6dd37dc |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/be43d8e5cb54d7c4e9a69cf5656f02cdff5b8957 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/23a1e004baef2f92a0cea239979455661cb12016 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ab7d355a50d8b49fa475132d2af4f27c843ec032 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9f1d530b92a99c9e0cc0383ce177de2a0e84a097 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/371e7811f0e58a1cab779b9d53ff5480b75a452e |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/219e0d1bfabe8b33c6b24fc29582d70933d3bb9a |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2d70b61367835789528841d39c398f2c6e556400 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a5ed30da7d6d210f802645af8310b106d0857384 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d41bb533894c55f6cfad3518f7d8e1357fb3900e |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8e65774b16a03624ce706628983c4d571a79540c |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/73ac39de22e87d16c7a8678ea5dde1af0fa11a03 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9700ba15d537a8f67000209bbce5fade8c23eff5 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3a3e102e99aa7bfa5d27ba536098e826525cf4a4 |     
microblazeel |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7513de06316103f381e7557a85efe8e5c4eca437 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8de19f5ffc43cdb59ea5c48ecb5b824643f4d7f3 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0a4034016b0e5b69b2b839962b12055e6bc6df55 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fa116206a50813df8bfb39ebf092e0a751a422d5 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/77e82f95314a889301caf3d01478b713c525073f |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/db184c4236202ba423dd4869011ca8ca5ea1af5f |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/98bb1b35085b6d28eb70a79b7f5786027a5fa137 |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0febb06fd7faf5d138410c34231d0fad79a74a11 |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e18663a3eb4ef62555340afdcb98c488c8a7075b |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/6537fba5cc85847d63ca08bf1bed12a378f12897 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/701e823316114ee88f9eee30169aeb1a066f29e7 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/2c7075c920c31386a260982e5e241cf276d84dfb |     
    i686     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/ff4f0f91d12c332b2412272f36abb622c58deb3c |     
    i686     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/2ee5fe04b0d945c6abc1c142fbabdbc81789da47 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/407b1605bdd973e3be6ebf6acb1053fdab370024 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/36a7f96b308b9a613729d78e2817a7e3827032c3 |     
  powerpc    |           htop-3.2.0           | NOK | http://autobuild.buildroot.net/results/bea8d3955e907ea7286495d22ced2b2554b938d3 | ORPH
  mips64el   |           htop-3.2.0           | NOK | http://autobuild.buildroot.net/results/53da8cec05b27b4bed9be37fd937cef4f9435dbc | ORPH
   sparc     |           htop-3.2.0           | NOK | http://autobuild.buildroot.net/results/34cca59351745904b83ae4b4c88fc4c6ce5e23e3 | ORPH
 microblaze  |           htop-3.2.0           | NOK | http://autobuild.buildroot.net/results/865e4f7c4fea4a8bf26b57b26e6cd50b0f1c8f1d | ORPH
   x86_64    |          hwloc-2.7.0           | NOK | http://autobuild.buildroot.net/results/d42c9b6186652708638cb56007df52de0d76ca58 |     
   nios2     | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/9a4d11391f2fff70724c141d0890c5cf3201c599 |     
   arceb     |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/3873b1d95add882882c595c2f68bcf58c2794153 | ORPH
  powerpc    | libeastl-45469730d641868ce0... | NOK | http://autobuild.buildroot.net/results/40da9b8a27167ce387d4065f452a5adc2e298a47 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/dc61c6c183556049ef29e96c1ff2f56645e0ca59 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/14d484f6b855e23667a4c037834bcf257bcfcc79 |     
   arceb     |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/3cff96178e9ffbbb81f1d969abaef6955ea02108 | ORPH
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/36872376e7c178abe3ef2ecb016611922766910e |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/10c5945c216f578e8321d79bb9e3af74d3e46cc3 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e514289184b6049ad24e8a21a297c0c539abb58b |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/2efc0731ecbdfc9d5dba4ff0ee24e0b2603104b2 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/85021ae587a51bfc159278e242e892c4383b89e0 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/1ebd6a6d4b7ac369c2e614ffdb3d402e4dd1c6ca |     
  aarch64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/703c58428ae2e97759e0f756347ec2cc8b764dbc |     
  riscv64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/ae63bc2db1ad63604b98bce703ec77d9175f5ab8 |     
   mips64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/b104456560b000f557332b4ec17ed4a86922a966 | ORPH
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/1f1ae817b195cf2124542716686b86d253de68e6 | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/25afd063e69fbc2a10308f11c6c42c9c305929ec | ORPH
    arm      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/73de615ae9c3186456ea6695aad472e2ae0ff919 | ORPH
 aarch64_be  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/3a2dea4abfec4ecc88e7d38a7e877b305a23b240 | ORPH
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/48573ad5067b1acc69155b7543b7340da0d921e9 |     
 aarch64_be  |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/dcedf4a425c2aaeec1deba7a69894be678b535ae |     
   nios2     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/ed0a4066ebc1864f79cfe0e9918e96d7e6f69c22 |     
microblazeel |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/62fd56949b219e7c4a33443f6a7c771d66b01f87 |     
   nios2     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/09242f83dec7f1c29f47012f3d1e161483310c43 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/aaa791c846e3f2ddb7ac4068a1871fe28ea82cba |     
    mips     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/813b2744a408125484c99c969a858072fda5c5e2 |     
   s390x     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/1a685e1a2079e786b16bf9a3885149b93032ad1a |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/6329a52386456225a99ef719c6d5b700bdea2d46 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/510744340f5f031c5028a9012711b7f8d11fa371 | ORPH
  mips64el   |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/26b8199ca4dffb904376c915fa744e8c28a62f5d | ORPH
  mips64el   |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/112258d25d646c00c1f7ab7f596f00b126f9ad4a | ORPH
   s390x     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/ddd7da77a6e682bb9d96617080e8673ac5cbcfae | ORPH
  powerpc    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d15b0cdac7d43ccbcf1552c36ec2e6cb9784ba7a | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/48eda7bf34bc017f18f5cd9d074af3bef4f0fb5d | ORPH
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/3f0d55b9dc2b45c5ef07147765dbfca7c94284c5 |     
  sparc64    |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/7700bb537d33bfb0177367597ca63e9a36f1b564 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/2e79c3a7b06e882e4b159e465496d80506fa5fd7 |     
   arceb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/30dd7e1ba593b51119e915cd33888e1cf4e508ba |     
   x86_64    |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/e3862a51fda9afc10e5942472a1d658689edcc47 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/2b1d31a1303f872e4be8ec8f4f61c4c7f3438aeb | ORPH
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c91f657f1cf6f73279680129d782a717170c262b | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/f5274c3bd3a81f27ca63a082b60f81f3485f4346 | ORPH
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/28bcc8b58eec0336a89de02c09dbd15cab4e7fc2 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cc6fe7fffafa68152bc7603a1d9e28c3b81a391f |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8397911dee96bf2b73b17837265a7e26f23a7294 |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7f06d25b9992dad88883176b249f6e0c51050fa3 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/63432c004b3cc22742b22b4bcc33d05f205b9f3b |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1338695b1f2d5dfd51318a582e9a4cbfc22e9a23 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a57138192ca9bd3cc6588f873b23d5f2ad72e1da |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a12c7720012c63677377affa64a55193b9675a4c |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0dfe01008228eabd5265faf06e096d0548072ecf |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/737110bc1c3df73be86b8653579857d9023257dd |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f710c597b9c9fe1da3a093774ea375f6ee92b746 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0aec70b31c73f81967af77d3e59f47e83e65d0d9 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0fb1252541bf81dc8556558903b1c00f4da0d100 |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e1cb7cf327a64a214d1db02372246e4a546b3b7b |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1cbbfb074c476faf2e269835ddf8946cc6ebc240 |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/63e95d7a880a003acfefb7df4f07d4a8b31924b9 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7508850238f77419fcc820e11cafb4943711ef0f |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e55b8a6cc8d1dc77712f04a6f31a2c8458dc8723 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/297224af9c539c9fd14324a6707b78daddaac23e |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/aaaa55b20130e8731af5d809c4ea63923216e240 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/79f7d1bb295dbc1fbaea97a922af99d1d94d20b0 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3665fd1529367ff7dc8e693438b895dc0c9eb69c |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f8b51d1d1d346ca4f229bdc8159709dcd851cb56 |     
   mips64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8c4bb84da34796c20257226e8c76c443d45f7f74 |     
    arc      |           parted-3.4           | NOK | http://autobuild.buildroot.net/results/edb0f6d3f631c2016994e46fca460a1a9f6fc346 |     
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/2aed7078709d8f0edf7a735cdefe59d7c99c4be6 | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/80dcf2b29e99aca36f970aefb01ffb2fe22d23ab | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/ca7d0d8b927ae307ef91733827cdb4f28611d289 | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/9ac2c8c08e9cdac95641a3a6669dbcc614f3427e | ORPH
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/125b5eaace1ae976884eca9bdaa1a54f18dbe5e8 | ORPH
  nds32le    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/5ef68430f3a404daaa23bae815c7aece5e2cc377 | ORPH
    i586     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/cd7f8e55cdb2988c36dee297afba3081d80fd22e | ORPH
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/e191a7c111143ad27c83acb31bf3b0459a767745 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/e0cb9e1986431346fc58716f3100f91b743aede2 | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/606baf6d2ba550e9c0e9b84ff1d3ce999daa94f8 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/3e24cf99d4188939281b4173ca720a2674717192 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/16baafa816384cdae2fc7cbaae7cbbd2c1a94df2 | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3559190ac97b4d333cd613e2093e6307416683fd |     
    sh4      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/fd0ada19ef39e63a22e8a476826b53a90bb95c64 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cf45b7f685516950fe6ff27a9ad5b21188a09c21 |     
    mips     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/9625065cf7b2e7bbadf4e57ec240b1db4a6d8e8e |     
 microblaze  |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/7b7d7a2e3ddcdf8796bdfe079fdcbd55e938a40a |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8238fd67ad9372ca993617f62c06eb3fd6ab2655 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/67e7977b9f3ce2d18c4469ffe80e953017367f94 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/34a0270aaff784692ae89d58168b10cfcba53545 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/95813f9c3eaf1bda0b2053b0f530e64d084dc28a |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1ec7f00e2f10de8c853092ecc93f486dc31d41db |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/887ee7757d7afb73aecf31a8b41600df238fc564 | ORPH
   mipsel    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/7a8e77ae26cdc52426502197f3fe8605ee32fe40 |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/468efc894347543bed5b41e16ed7b5d582dc26ef |     
    i586     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/ff616d5d2e3977f2311255d95cb790b0993f8aeb |     
   mipsel    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/a1ecfd4841bd847b959537868689d2f1b6fdbd38 |     
   mipsel    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/bc0c088d34df344de3d5884fa86b8299e4b97943 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6b6d19b1188bb4cf25131db0585cdc51efda45a6 |     
    i486     |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/93969881284b86049729e6bfc240161e5d3d73b0 |     
 aarch64_be  |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/93c2e093636c39a53e0e7ee318352984583ddbaa |     
  sparc64    |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/1c84eff5863a34a39b9aafe631f5b328457f859c |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c1edf53df5cc7e149d3e30e374c82462074e656b |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/5f4b6f481c7ab5d1f13acc9285125ee1ab9fd03e |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/fefd738135a8e9f9e673f36e4696979a557d556c |     
   arceb     |        rsyslog-8.2010.0        | NOK | http://autobuild.buildroot.net/results/571553458c5628e57206cb8eac657f25f52acf2f |     
   xtensa    | rtl8188eu-903b6fcb821465fe9... | NOK | http://autobuild.buildroot.net/results/0dc7e728944cb1f0b2592077b7810f6d5077d9bf |     
   s390x     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/9b95ced834f004c8dd3a0291702077768b720926 |     
  riscv32    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/77c274d330bd956f1ad6a3d6d773c2adccca9a47 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/7025a83c17b437792283f7684c81cdd44274f934 |     
 aarch64_be  |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/97b6f6bd60845d32540f4643e8143104ebff443e |     
   sparc     |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/75d7575ed1bfae5c82b04a228fcda93cc0a94f85 |     
    arm      |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/c53786d402ab196ef57856749300dc03f5226e50 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/e7211f5be70a10c3b8a49f5be10f7867ac7a3594 |     
   s390x     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/8759f204287a3eaa93b8ef7629ecaec1400ba322 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/0d7484ea92bde3c49591e4d76544037ab92f10aa |     
  riscv32    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c0e97023888f60ada1ecc829cc5bae6c623ed963 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/7360ac05f91551138cf2a96bd2a130d74fd15a77 |     
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/efab6ca706a544ec6a0267e5e5c41820c45f7c6f | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2b3f6f54161ce631a83ff03dc94d2f817a197968 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4c73323a4934cedcc7f6ea2ef984f56fb52a62e9 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/95ad5d07b000b71e66c4ec49871906a6e50049c1 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/61955eb5c97ac7203df79a55c62aab3020aaae9c | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/e35516887ba88953dc13dda877002137a04c9ea3 | ORPH
   x86_64    |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/5d7ee332fd2d62ff869ffd74ffb203fcf2d44aaa |     
    mips     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/9a6df2f49d523900144f55d758d1f5863ff02315 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/637b9fdc78c51815923ec46a79dd5af86cc35052 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/af45e377ecdd5561501e65edee2bbd624234a9c3 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/06a476f558a19baac39ab872db358bff638812c6 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e9ea291c2eec499b1f6937b7c13ae76dd9f7ffdc |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ed700323ce06c434e6a353152090c6d864a4a40b |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f2385afec90aab0e31d6aabe5478dc066f991056 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8f3be02c3333b5528be15ec13de225cc74fcbfc0 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9d54cc9397a6319acc8a19f4307515d6b0a22e29 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/32fdc73ee53daf8ace63ee2661e2d9a24c0a5ff4 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/cfe166e5d717e964a7f3e0a6fccad89b6be6091e |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d33f93a242ebad297b8f9da40e4434c2ab77a46b |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/5fa359d26d4e43800e686a1f02ca9ff03b50a57e |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e55dd042740a4a7d0f32c1537be07ebd18cfce2a |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b1620df48127195dd5ffa2a063133dd50f136c7e |     
   armeb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/85c74b75f6640868c0a2dad5342f811a44570a63 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/22fcf2557bf08ef5fa3769f406c79acc05c69535 |     
   armeb     | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/299f9a64d1cee16208eb724f3e2401836d2d1555 |     
    arm      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d7b8ae5fb5560e75c335481c2ebd9df798ef4c83 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e105ed9a9b7d56e717b7a8f64419decdf522ff29 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/de414f95eb2dbb30f708a6f4b8fd07145f3c3f09 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/bbc17f026a41b07d96f976d6be0844de951ef050 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a9fe8cff7678c92e8cf281a92e4cae43fb024465 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/df2a948eddbaef3e57ecddb04e73f4a5ff4b8adf |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c102e69b2d4fefe53dc5c229451df094feed19cc |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/3fe72ca9677461c9d47aa60a6e2bdc2a85388481 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/34ec2f41728196d1fd6450c1bb87173e0cb9b032 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5cb70c004ad235f88738c32d4335164384ca9811 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/ff4f9108a97773478904c25b6065c39384818483 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/8d2d4882d41180393800155992ff45c1f311f628 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/c773db8074738bb15cd9f311d9efd0b90d5d4ea0 | ORPH
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ecab62a13cf30494e813da65aa59301c7d439638 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/140474aa34a92a980272447fbf8cdcb2acf9925c |     
  sparc64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/b3e480cfaff07a25434c283668291c46a176d689 |     
    arm      |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/ad237f5a1e87ef9321d3e2f7cbefb51fcb74bc31 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/76e5d9a9ae4662a198740ea9a0d2bc3e0cd6814f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f00a776ce9ad9d30e769ed32a8cb52d7b4e6432f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/491cc211c9026a885e9edeaa31d2641f81c0268b | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1c000791e406d45bc17f97d035e3ff8ae29073be | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/030f129d8d929f06aad97491170f493855428511 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/36e8516800998da50c7d8095506bc90b984d7346 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8480969f293ddbd43842a70da5dafeb739a18e48 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/28a82c263d17d8691880e89836b9e70c6fcaf5fa | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9d5312d1a69db304c434189347bb1e31184d25e2 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d883078bcd4ebd6d3da2ba62f01ac485ec2af25a | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 2 
                   mp4v2-5.0.1 | 1 
                nodejs-14.18.3 | 1 
      qt5webkit-5.212.0-alpha4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/dcb2add9611d9d1422aa79b05fecce01cbb28add | ORPH
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/d5bed4080539545ffbeea1721aa1efd157be3ec3 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/cf01918ec98ba96d5993c8b550174cea43687741 |     
  riscv64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/83c309a5e9781d9f3804a54da48928943f0f4b58 |     
    arc      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/0c36e0fff06b052a1e0ad577a6e1934330fbe649 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

