Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DAFC4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 07:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA91C4199A;
	Fri,  2 Dec 2022 07:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA91C4199A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zr-XR8nEzwY3; Fri,  2 Dec 2022 07:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 497E1419AF;
	Fri,  2 Dec 2022 07:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 497E1419AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07F261BF836
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 07:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E36AB60EAA
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 07:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36AB60EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31mEQcEj9iwE for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 07:46:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9943960E61
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9943960E61
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 07:46:04 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BCB491C0010
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 07:46:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 02 Dec 2022 07:46:01 -0000
Message-Id: <20221202074609.E36AB60EAA@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669967161; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rVJTH8n+oFPrmX1o1u3hiO9MkdsSlf0XdopNKIMNldM=;
 b=pQYWJ9aRNA8RVC0/jV2tLnPKLtB+j4z1jvlmgp/4ZhdZf/jRT1pUBpKqDHuqIh4dXWoE2O
 8o4iWHhR/mDk+doKW6myrjZFBB0Am9nX3s5U4C9d9XOb4uM/FWeCHJm/0s6TdAJAqZaasN
 9nVhd4IK/kFVWeaZPQ0iiq8Hx/eXooo6hAjcnKyaCWrIVjvrArjXzTiY3bwSjqNbjdAz9j
 4gThqQPhmspRjHYFvciU7YwJV8czChNW/ygXpfvPP4EN7I34h9396a0AE5E1rmRRQSAHtq
 IQdJJJ3D+x7DKhjiFAlkbEW8GBCc6MV6NebrRE8CHJPLYffRtRXETodUHslNVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pQYWJ9aR
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-01
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

Autobuild statistics for 2022-12-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  2  |  0  |  6  |
  2022.08.x  | 24  | 23  |  0  | 47  |
    master   | 236 | 231 |  0  | 467 |
     next    |  5  | 27  |  1  | 33  |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.38 | 12
                      xz-5.2.7 | 12
              host-pahole-1.24 | 9 
              host-rust-1.64.0 | 9 
  gobject-introspection-1.72.0 | 8 
                host-go-1.19.3 | 8 
                tealdeer-1.6.1 | 7 
                       unknown | 7 
             libgpg-error-1.45 | 6 
                   linux-6.0.9 | 6 
                linuxptp-3.1.1 | 5 
                  boost-1.80.0 | 4 
                elfutils-0.186 | 4 
             fontconfig-2.13.1 | 4 
glibc-2.36-66-ga1dc0be03c9d... | 4 
      linux-5.10.145-cip17-rt7 | 4 
       freeradius-server-3.2.0 | 3 
            host-binutils-2.39 | 3 
              memcached-1.6.16 | 3 
                   perl-5.34.1 | 3 
           python-numpy-1.23.4 | 3 
                    sdl-1.2.15 | 3 
                 uclibc-1.0.42 | 3 
                     efivar-38 | 2 
                gerbera-1.10.0 | 2 
               gocryptfs-2.2.1 | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-11.3.0 | 2 
             lirc-tools-0.10.2 | 2 
                     lxc-5.0.1 | 2 
                    musl-1.2.3 | 2 
                    php-8.1.12 | 2 
sconeserver-8d1935919a20133... | 2 
             uccp420wlan-6.9.1 | 2 
                 wolfssl-5.5.3 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
afboot-stm32-3566acd582e553... | 1 
                alsa-lib-1.2.8 | 1 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.5 | 1 
                 avro-c-1.11.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
             cni-plugins-1.1.1 | 1 
              containerd-1.6.8 | 1 
                 coreutils-9.1 | 1 
                      crun-1.5 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202102 | 1 
                  exempi-2.6.1 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
               fftw-quad-3.3.8 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                     gmp-6.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
              host-delve-1.8.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                  kexec-2.0.25 | 1 
                       kmod-30 | 1 
         libcpprestsdk-2.10.18 | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.4.0 | 1 
                libkcapi-1.4.0 | 1 
               libmdbx-0.11.12 | 1 
          linux-5.10.145-cip17 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.1 | 1 
          lua-cqueues-20200726 | 1 
                   luvi-2.13.0 | 1 
               mariadb-10.3.36 | 1 
                  mender-3.4.0 | 1 
                 mesa3d-22.2.2 | 1 
                mongodb-4.2.18 | 1 
                     mtd-2.1.5 | 1 
         mxs-bootlets-10.12.01 | 1 
                  ntp-4.2.8p15 | 1 
                     nut-2.8.0 | 1 
            ocf-linux-20171122 | 1 
              open62541-v1.3.3 | 1 
                opencv3-3.4.17 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/qt6/qt6base/qt6base... | 1 
                      poke-2.4 | 1 
               poppler-22.10.0 | 1 
                 protobuf-21.8 | 1 
    python-cryptography-38.0.1 | 1 
   python-greenlet-1.1.3.post0 | 1 
                    qemu-7.1.0 | 1 
                  reaver-1.6.6 | 1 
                    ruby-3.1.2 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                   sdl2-2.24.1 | 1 
                   speex-1.2.1 | 1 
                 systemd-250.8 | 1 
                  vlc-3.0.17.4 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-5.4.9 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/4d7f5379f6cf972886e50667e1c04734a7e58297 |     
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/43aec3d25172afcd7a93bba36e791008904431d6 |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/e44ef4c38f695c17d54b2cc849663e568777be64 | ORPH
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/55f37e7d921b8b89eb1794b01a7a662f791a4383 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/785aa51c125cbfb288fa7dbdeb98a96a6a7a59c8 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0230b0955b32dd2f679d614e3d66ae63543eb8cc |     
   mipsel    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/987eb48303b3fb3003d0c8e6c71d21d1e3b8dd6b | ORPH
   x86_64    |         avro-c-1.11.0          | NOK | http://autobuild.buildroot.net/results/a540c62296f45cc7cbf624bbfb70c43f6c3117ad |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/9959f681233382a84cce94ada9e7a29e442e305a |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/28be641db94829826e85fb665a448cebcbb912de |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/b9e84c6ae8393ea96e2ca1bff20f5e2fd581af5f |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/7603c636239bedaeb40f9fab8e99af36becc2633 |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e3f197a45af8228e9a9e50fe38c849dfb600734f |     
   x86_64    |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/ac98e1896090fbb54ccadc2dd6a4a8f28f3a2937 |     
powerpc64le  |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/0c178fbe108b7763f2d93cee1bbb011effe1e60c |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/c84e957dfafc71a100d6d309fda57fc77dbc9686 | ORPH
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0774680a1bb95c40589bd0ad753596bfde14f3dc |     
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/3a3ad2cb78196b0aa8501c3d0107fb285982bf76 | ORPH
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/f95022d018aad6c447a2ace424ef55366098bebf |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/1e7f97ddf7a7b5a094954e25a3eb100b80136617 |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/84f956fc0b7f5d394016077d76d5b4517d070d47 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9f5b9191a8232afd7a4506ea73089a8bc8e4564d | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ad33b9067ee7140bbd023aa20aa6c8fadad1764c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a271b528307dc7add4cd119a3208b51057d43d41 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/37468bf5ae23f55cc420697c614f9a727c5216ff | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/19f7d7896ddfb05ab096681fb882c03acd569c3b |     
   sh4aeb    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/863d421a07fa287f5af5ccff7ba8db58d70edf7e |     
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/73ffd363ef14f4bee81241a33e40024ddfdb1785 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/4fca47d621b131aee8a0b4e549793c9040e8d7ac | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/6c3addc00eb56a90fe3986840395abc06dba931c | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/dbedb75ce894b493fcaa9b8a391ab6d43f9e7a5f | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/435bccfb03d31d61fa3172b721db824ccf182019 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2c05215dad7b35d056ace4c23bdc21cbb4d2cea0 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/84ec252b742d5eab9ee1ea77a4ab51768aa24e45 |     
   s390x     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/dd182a2ecde924b3ffdafab571899e2f8ef2f9d6 |     
    i686     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/d1df2317724ba6b486f2ff1e024605aeabc1f075 |     
  mips64el   |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/a2aa16419b635623d9f0537ecf04583ec2c20ffa |     
   x86_64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c128c519e4a02e4c6d93715ed2c46182c895c8fb |     
    or1k     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/de567187e414b54f849238c564bd7b9b8c22019f |     
   s390x     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/166524225e726cc8c54dac0530f110e391c175cc |     
   xtensa    | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/ee2a3ed7d7f5ae3e37552c36b26c7ee38d258efa |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/628613feebee285540adca6608bc6d9879295d2f |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c209e1f3053edb478d1d761d465247619f7c3ee6 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1b35e4be5e7f534867bb7d212c0826babd734784 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1e6f7c5431735594dcb5c981f094b9963ab4d00f |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/ea37bf3e49c1d75851ce9ad3fec84c51787f2271 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/dece676a70a0f3d0fc1fcdff01a245732e64eede |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c47174b482974c7c236b45c6b1fb59c197f396c9 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a72f0a16439f766ca8ef2e8464a05d10a7b06715 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3ca5eca069899f6ae1ecb303ae9c872dadb3f4c3 |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3d37d35e8412dc35b09902d55529efc6c5621a27 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5aac4153c37845714b6aa618f04e35b7ef2a62e3 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/41a35207852d8c9857d00831eaac4d4516f0d126 | ORPH
   armeb     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d5a03fdfe00f25a71adfdb6b76269ea47ff0741b | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fae1d1038c9d9148d69464fa2af7bb4da459d595 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0966eb68fecc001a21f1045efc66182dc7978b8e | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/15d922acf0f8455c547e7accef051503e0a3044b | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ef9ef22a98afc9a0e27f7093879a4b7936defcef | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c289339651e14a0c6dd2edf2d260b5ab3553955c | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4d476c16c17e084ca150e2e589692dfcc860d8a4 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2cb75e456225c1f007f3684408c2d61caccdf0a4 | ORPH
  aarch64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/aef26ea8b9a33cd32531a9ab2825f02fd33da9e1 |     
powerpc64le  |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/be10422b5dcf1f8bd72d5999b3a61152948f870d |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c0445063b741f7992843f9258871d6ab5e7c55bd |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/d2a51d9a68947fa6890788f1d15dc0e03d402a12 |     
    sh4      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a778f22cbda913967c70d6fc59d6fb23d6907148 |     
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/fc60bd9a08cc504c22c77b99093cdae5d01c697a |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/21783ed59bc01abcd49420def6eb6113fb3b844d |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d22634fcb833c8e7a98952be05a05d418437d52c |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cd5b88b1e6b889f2d02dc68e846cbda604c1f9f8 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/024158fa0c1220b7e712b48330c4db95185de419 |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7efcdfba88a73f8dbf0ed33c1bebfda5ad6efe17 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c8086627773735ee6dca5356c5ffd1408ddc7467 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6a45d61ef722f49ad4159d4994f7729daa192c66 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/64144ea5d284658fab7f5920d3e8712f4b4c74cf |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/132fc909110dba8f02b55ac617b91cb37f248e62 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f40331cec0f01417218e8b9eaeebfb976d0cbbad |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6c2951a032df13e829e7800b5f5ae166b7aaf908 |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ca5ae13a5d7ad3d9f43150d70568ea1ac233287e |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/7df6b708d8b1a25c67b3c2eacba550debe421840 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/0a7f594cc7e33616ace02d5423675d2b0ac5f761 |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/acb927286c2c80b328a342f71aa7cc873868ea6f |     
  aarch64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/c4abd7216d301de637cd4391e940581381cd874d |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3858ed2ec2f094768e00eba543e11e485ff6d7d5 |     
   arceb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/cf92b2581be4949a7ce82cb676bdb69601632de1 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/712322bf46be998db20540deed60e5b0b5912627 | ORPH
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f0a92f72491ac117dd16b54d058cf1c27ce9a1ff |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ef7048650fdcd9667096d54184e44a944c07dc07 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/16d2ec78236ea1ebf94d360692001ffba1dc01f3 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/1045c519bcdf9c0f25e82eeae2eb240e01a994d4 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/8fbf866d17230e9e40ce40e3cf3654d0b24de227 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7360d480ec410344e8355759a199666a4e3edbd0 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/81c9958d16f4b19dca3b3e1ad6023dad79e3ed03 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/8c1578ee0ace07f67f2ec02988d4a1670b27dd19 |     
  riscv64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5c0aaef065fcf219f5c0784f6e4f6d5b2373a865 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/25a806d3f4054261bee722bb5cfbfbe5b4b71344 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1de923b0ef991c642dd64dabf46d2efbde884f47 |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f4b35d3abd27c6321fdcebf1f9f240ba20252b5b |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5d1198ea32d1cb16ea68cf929131df6598570165 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/bc2db2db26b7bcc8a1c8879bb5423b29f7b4b3db |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c6303af26bbdc9f12ceac40f237ed6f819eb45ff |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ecbd452407b81028a9e0743119e875ba8a42c1f6 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/02047771683bb94209f2c8592d531e829934e261 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/de25cbe7f7397b2447ad1016b4d3253d6bddea75 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c702715469ba1e763c8d32d31dd3829be8c250ef |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6c58203d4e0009081a80993eb6bc80263bf5a1b0 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/4d17db19a1e8b7a5c9bd32cf3431820f8d8baad0 |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/20946b257460895112fcc3ad922d63a24b2184cd |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c8313f895cb0fd139aee62a0adcc1901950fb3c9 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/129921018086c6263afd6376a19bbc7e8b89b789 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6cbd4cba02cc69842908b0b3e20c82ca005349a9 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7ebe9ab304e5a157361014f8f6c721a9db747ecc |     
    sh4      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/c0e0e18e8a7e7d961367144707ff56af65dd1a79 | ORPH
  aarch64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/9740a778ba190c4f6816026b2c7ea4b28d32e030 |     
    sh4      |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/6f98d96acc02bffb404a4d3e97204c03b5e75897 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6098b695686c26db90e0de19b8478547519d150c | ORPH
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/920521cfbc0b18cc556f3dbc145b48a86097d5ac | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/8d9affe009ae51b31a02eedefa6d4a4c46669efa | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4c474e5f18b43fd0cc3cb84151606f009f311b6d | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/ac4e49dcedfb5cdc1874bca9a0862ca11d681202 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e6b25b6ea10975c2c87ee10bcd89c5bb117775e6 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/6a50bc7099ca7ac8a7a0231747b3e4c126341f33 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/390d3d421ba7c6d3fb193ce16ff2f010f65416e2 | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/5f596fe1de0df55860211e1a95d43a87eb9e2fa2 |     
  mips64el   |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/c6367d6e4d72b122f308793931b3898a54b52009 |     
    sh4a     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/1c50d885afaa84933f26f11289248a34d6b49c34 | ORPH
   mipsel    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/66af946eb79c26a30ea144a4cf39a337cb33d471 | ORPH
   mips64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/c6f360abbd6feea805b37a693122218b2b532b1b | ORPH
  mips64el   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/00f9f8e5139b517e072f1acb053d26d24933272e | ORPH
   mips64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/d6dcdfca757144144b88ec469e7a338f22864817 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/646313746e4225850e82bb96c93b32b6f00e20d5 | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/189eb8bd2a01f4ec05a63336313b938397372fa9 | ORPH
  aarch64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/2875add4d0960bd5d204b967d76b170cacf15c2a | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/9d64011886640f34b28c2e37d6f25151c6d56f8b | ORPH
    arc      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/77be2b303acb9ea4e95581e792f24c9b762454a4 | ORPH
  sparc64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/56d256e96d3fb17fd93627a0c28e9efdf7410085 | ORPH
microblazeel |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/a45ddcb09c1ee501ffa2010efc53c8783bc76ec5 |     
   xtensa    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/888736e9cec3202d09fe4b3461ae30c3fc512ae9 |     
 powerpc64   |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/d16f20a8efcf0d7d1dc9bff47e5defb3869073d0 |     
microblazeel |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/14a26d5648d1187b5ae21edf8738439e9107b385 |     
   mipsel    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/6e0490e1f41ef28ff77cfeb3de67b4a39f70ced5 |     
   s390x     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/92b4ae0a7c5dcd2e33d875ebe844726b56753c0a | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c17ba370311e3a43fe3e84f210cc301f2d523f19 | ORPH
    arm      |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/fe2e73dfd520bfe62d52a2a6d8b384d0a7b8ae1d |     
   xtensa    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/c44f961d3e20b109d48a5875590ec1a2011c8697 |     
    or1k     |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/e8e9c43f298a1079f525edfb7344aa4bf7f5a5ff |     
   x86_64    |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/8ef46dfa545817a3ac89751cd4449544d69b1092 | ORPH
   s390x     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/b2b648e1e1c95e7a61aa14c936cc608e5367859e |     
  aarch64    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/0e534a0a20f649b7cd3fe17438adf82556c9fcf6 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/1703f4c9b41a5ca14653ad493a8c92fa27a68257 | ORPH
powerpc64le  |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/7a1342f7835f88a682333a2e07457b0de588ae91 | ORPH
 powerpc64   |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/d09bad0c3b9a7174e39bdaec70f1f37d90058fb4 | ORPH
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/cbc6e5d2b8e146d6d5900a17f219a79d1b237961 | ORPH
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/bef6d511d2120d40df863a0d0143784f767bc4db |     
   x86_64    |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/ce7ff02327a264f8d73be099715bc9550e5dd610 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/4f56b131f57a92e1f474ce7292719be8a904f6a5 |     
    or1k     |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/935525deeaae41ea6b547d7af4954e403880f729 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/799eecb93fc92a2d26f1969d7cb91dba20257702 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/e2ea6693e899dfd0fd3c0c1658a8ec6ea05e1ada |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/98d8ef9c1d661a47bac4adaf1501ca14e5a21f3b | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/4053f9e07044e1c9e6727f4a0b04bd75bf956dd7 | ORPH
    arm      |           nut-2.8.0            | NOK | http://autobuild.buildroot.net/results/604f387cd2d599ee81fb27458e2296bdafbbc9e3 |     
   x86_64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/dced172de6729f684c5f58c07caa6db35901c425 | ORPH
 microblaze  |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/16811792e78b584938afbb7830a5095484988cac | ORPH
 microblaze  |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/9218c854abef7724e7db8531085b90bfb5c0f93f |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/304a25257abb7ab16bb7066f91648331eea2c184 |     
  aarch64    | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/f35d386ddeaf2faa33f24d6a05cfaddf67ab0471 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/357513e211bd86c4812574f755a310439f9d4af6 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f9247f0f474b93389adcc0aa99045d9ba9dca773 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c77e0c29455bf7859f667068c419e2682607156e |     
   sh4eb     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/a19bb994cf44c3f440c352e4f72e51407df6921e |     
   armeb     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/315680a632f5e28750587898f810c3e5a198cdd9 |     
  sparc64    |            poke-2.4            | NOK | http://autobuild.buildroot.net/results/8beb61dcfedbdecbdbe559184da9ae881e6d6768 | ORPH
   xtensa    |        poppler-22.10.0         | NOK | http://autobuild.buildroot.net/results/c5101e82ebfaf7a7139deb085be51932e295dabe |     
    m68k     |         protobuf-21.8          | NOK | http://autobuild.buildroot.net/results/5851f4b33c84705e859f12640adb6825761167f0 |     
    mips     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/bb03624255336e4044b11a0cc8b5205545b011cb |     
powerpc64le  |  python-greenlet-1.1.3.post0   | NOK | http://autobuild.buildroot.net/results/447948c79a7c35b5520b041696ab13ebf96951eb |     
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/e5f344f9b1a36501b7a35e7d0a0122c9a1644546 |     
    sh4      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/f6ecece09de09b1e96b96cb0d1efb23e3e0eb684 |     
    i686     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/67d48aaa761c8906a1897ac6777da01b4c853841 |     
   mipsel    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/7aac464aa4bc8a7e8838df28fcc06de887341fa1 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/96aa9a8902c8948ba6bf36bbfb6defee06a1ccc4 |     
    mips     |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/13aca027fe5d8905862153a6261cb5f736ce68c5 |     
   mips64    |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/7a304d54c4881c4427c89a315ce9246bdcd6ae75 |     
  powerpc    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/468d5bacd08a5080d83634a1d43f72090eccecfc |     
    mips     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/f749ab4ee4fdf6d4ac9bd64e912dfa4846abe2c1 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/a088d84e842945b87b3a33a1532bc7957662e2a2 | ORPH
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f8ca4fbdb61829affe86575902db4e7ae61c1860 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/78272b8d6c209945914f45413c148d3dacc74d7b | ORPH
    arm      |          sdl2-2.24.1           | NOK | http://autobuild.buildroot.net/results/2b1b4283eecd59eb36a0b607ce0ac0eeca50b8fa |     
    arm      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/bbb6e73b9c5bd74651dadf06be13c288440421f8 | ORPH
   s390x     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/b0fcd52c04719a276ae4383025a800a454ffa3e0 |     
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/0245cae1c83ddd4c0cfec7de715d8c5fcebaed6f |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/a9a1a069b07c2d5b8286bb3974d26cdaeda178a4 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/957ec5f0f9b072fc5ee2f9460fb6b9a478fb4291 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/237d6991d227ed3df612233fe7ede0c29a0c30bf |     
  powerpc    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/1fd6e2b084805b0b6c76794627fad3156dc44dc8 |     
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/3d9977d43ad24e46e78385da92844730f5f3cd86 |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/d83b2d24d633cb1b0e29dfb4259ec767d256ac49 |     
 microblaze  |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/a0895050570345a980e8ab739470e893a3924184 | ORPH
 microblaze  |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/9331238a8cc2fc12ce31fa1ff100f10d570e93e1 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/a1ee2d5b66c306e0bfa738658101d541352277f9 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/797e913b14428d6b92860d7665964b4cefac4654 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/2b86cb61f39bd25fb7cae772dd3b2c6f267e1445 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/8b161f4f92dacf2f6031fc2c49352e2f7f2f99e9 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/78c84fdd39286d461a831009c167c7550990839f |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5efe38a25222603523b5c9388161a639f16e551e |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/630cbd9056db35025a992ec06abd083f205678ea |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0b71b39ce7b5828690ec6f0a0116056026c40550 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/229264ddba9fa46e1923db09d496343c3448ca1b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/47aa684e28097c172ff35cf13264868ed02df35e |     
   sh4aeb    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/62acfbbaaa4489519071bbb924b788309c97fc29 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2d81ff382acb8b9a0399786702e000bbd11d3cdb | ORPH
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/4bc441d930015bfc5dbf9aa3f3d5d4e577492819 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/98e047560b918560ea07aed5cf22c61ab7acc250 |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/412b2efd842854375f0a445fa10eccdb7c61457c |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/06eab650784e0308dcd0606e50488c944081e414 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4bc185c16025db6f18c9178f35946a74f0ec9146 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f97ad5af987bce57cf9d0406fdfea5b15bc2cb95 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9f1c2685255cacb0e8db2aabd80c30818f195224 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/58aa62aa3cde830e7523a8883b5a0e8325bbb445 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/cd410b70426b4d562ffa46a3708c47a3608c94d9 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0e925bd04d0536f049f70becca426ea635927595 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bc63f2b9f2e9cb7e3b8181c58404ef1b6c30c95e | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a25c6243525c9ea5b16c92bc87e7d08763889c87 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/97cbf300efacaa2ed574351e666fd09f43743b3b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f50432651e6d57c7da1f1afce6fc4dbd3c94a5e7 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f9bacbe90f206f2f0f5037cae9b16c5e0884d8ff | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/516782718831f40ba30bf929eeafad03fe992311 | ORPH
  aarch64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/1cce39a55ff50552895dc375a9af46e2c6e5629d |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/cd6d66adf7f82b3ddf93b59fe1a964901cdb3d36 |     


Classification of failures by reason for next
---------------------------------------------

glibc-2.36-66-ga1dc0be03c9d... | 4 
         s6-linux-init-1.0.6.3 | 3 
                      crun-1.5 | 2 
                host-go-1.19.3 | 2 
android-tools-4.2.2+git2013... | 1 
                   aubio-0.4.9 | 1 
          cryptodev-linux-1.12 | 1 
               fftw-quad-3.3.8 | 1 
         gobject-introspection | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
              host-delve-1.8.0 | 1 
              host-pahole-1.24 | 1 
                  jack2-1.9.21 | 1 
                libkcapi-1.4.0 | 1 
                    lxc-4.0.12 | 1 
    python-cryptography-38.0.3 | 1 
                tealdeer-1.6.1 | 1 
                       unknown | 1 
                      xz-5.2.7 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/91de1443816f84d651e69517ca68c6a3511bd622 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/123fe036542bdd56ba68a6c74e853fd95218a649 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8ed9cf2ad557c5779f22ac15f362da08ed20c158 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c85ef3ea549b037229c88ce88f8a79969a1271e6 |     
  mips64el   |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/5d48ddb4310c19ef76331fbfae1ee4d9a38a350f | ORPH
 powerpc64   |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/d4dd4fb9013a7c61c30784ed857d8899c025b66c | ORPH
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/849b97ecd7392c49f33c45676d0a87baa71db7b1 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6c7d53d5b7aef58a4aab7447e058bc650f7bba03 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c3b7e73de665b2aac76b61bfd1a4265c08490eee |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d3b5c3cc7068317d82ee090ad2ab4a2e326ba467 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e31a0d3ed7bd062456e299fea738e251c541ab76 |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/b040fbeee5ba7bf7441bf695ba953fddcd8c555b |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a79fd377a23d943624a0afa4e93b047ae423d25e |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/3f55b6656d61054e94f5f940f193a01c936b94d8 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/dab33f956c9583143999deb38bf2f92b361d027a |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/09c280b2c7b6dd37d269008507f9144a6387602c |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2cf904e5bf183cef153d07c621521d6c6705a607 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/253e0e5e106b212e31657e4e0ed253045948b2e7 |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/fafc89c9ba20507cdec91ba7e98e6fabd5bcfed5 |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/e69b1e1afaefa39cc6905b4d6088c3b4a741ef0b |     
   s390x     |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/4f65d47e10c0a2018ac4cb708b453d85c1e3215c |     
    arc      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/13d398404dbf6d6f3ac02c2f2b95c6710f675c4f |     
 aarch64_be  |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/fcf4c7c734f53512c40a31cb5798b452c185e44f |     
   s390x     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/bd6c4f965bfa7a60a6cd947bd6b64f91fd810f3b |     
  aarch64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/fc54c41faba706312d0ce4e5b612eac190782085 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/b711e07ebcc291f79567360bc7321bbfc8c3cc36 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8a55e4ee3d4c0f7c74dcc9dcd0f0fa4315a2a0fa | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c25dbfc8f9fcff18798090e28c80cdeb828bf9e3 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 
           wpa_supplicant-2.10 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/df66fe8c4490269a7634b63a43f9e0e67364f523 |     
  mips64el   |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/d28fc9125a1315f6ae92d7ecffc0eba88cd19e65 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.7.2 | 1 
          cryptodev-linux-1.12 | 1 
dahdi-linux-5c840cf43838e06... | 1 
              dieharder-3.31.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
          host-elf2flt-2021.08 | 1 
host-pahole-73383b3a39afe86... | 1 
               host-runc-1.1.4 | 1 
                  kexec-2.0.24 | 1 
                    libev-4.33 | 1 
               libglib2-2.72.3 | 1 
               libvorbis-1.3.7 | 1 
                 linux-5.17.15 | 1 
                mongodb-4.2.18 | 1 
sconeserver-8d1935919a20133... | 1 
                    sdl-1.2.15 | 1 
                 sudo-1.9.11p2 | 1 
                tealdeer-1.5.0 | 1 
                       unknown | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/56edbe6f9b883e05cc67413d12cb9380a6bfb16a |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/d55262808b72ac3d835310ac931b41ef17585c59 |     
   mipsel    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/1082992152cb58e16ab79bb15e6494957595b99f | ORPH
    sh4      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/c3ea505b7b092005dd636980e911e3eec231cc6c |     
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/16ecf79cf2d0a59dc38ac3bba126ff82e3dc42fc |     
   xtensa    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/1864a73560393643dc9a08a5f5f429374c57fe04 |     
  aarch64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/49e17701db365b41a3ee46043967a179a9ba3303 |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/00d1414dfc59e89356705b79b2a98a02feb239e0 |     
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/84ba4ff646ab29207414d6c4a7fcc20f271c5a1f | ORPH
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/db5487b396fe72893580e662f14e24e656730036 |     
   x86_64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/8fbc216015de14e9338e59ded6d303e9c2bf563f |     
    sh4      |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/3b87d8449b19bda0ddb80178ac38957ed49a27f3 | ORPH
    arm      |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/f32cf2fde2dab128fa2c2cd98317ed35ea6b83b1 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/64bc44e21940ee79b8a8933afe8ba3ffc1405fa1 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/5bb0382950e947f6a51142487a2b391bc0f57a2f |     
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/511d61c382a16cc0be18273782cc67000084f876 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ab573cb4d9170d8d976f3a882f8ee831ee86af33 |     
   x86_64    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/70438bd4151a2c42e4f00ab765c22610bd0c7bb0 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/bac44e12d7dbc805d4c96fc523c8105cb1550676 | ORPH
    arc      |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/40b951b4c9bac9c2c6a8e68ccf79e6e3dd93c234 | ORPH
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/e139092a911a07a768bb2029a61d4a3317a1c708 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/083f5006447c761bcf84345462a449808fe0a5f3 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/14e02c9ef63a3d5460087d3b8aa1e0eb044299dc |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

