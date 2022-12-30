Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482BEC4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 06:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D77F40238;
	Fri, 30 Dec 2022 06:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D77F40238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hzp7CAEejSYs; Fri, 30 Dec 2022 06:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15A6640257;
	Fri, 30 Dec 2022 06:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A6640257
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03F311BF2F6
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 06:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9A5840103
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 06:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9A5840103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHcn48nMaAFK for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 06:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71BA4400FC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71BA4400FC
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 06:46:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BBFD8E0004
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 06:46:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 06:46:32 -0000
Message-Id: <20221230064638.D9A5840103@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1672382792; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=av29Xrh1xMKtuVIplAbN8IH/oguCMYkHMtkcAeZgzOU=;
 b=WZ7oFljH4lY+V5++5VlJKEWHf5vMP3T6IWyrWgFUvP2JQtnhtoZ1Xi9cqB2nctAqaZwbNg
 BPsYGKaC9S0VXFD6XDTvJdHUC4EsF29094r4/QEz98N6Cka/XblyrS+q8MwQeQ/wUI4VOO
 ei4OzN6bdZ0b68yQKVpjCk3uFX82GSgo2cTQXsL6KyIjF6rsxrvhDt7H4g+/L9KwSFLXvi
 FOn6zgLK1uz92gmODBqku4b4q/U2Ol8ayxmGBJvkcwMsk2dPxkjoNfld1xs0wGsu/9nxdw
 2vNPvckZo/FAdNUTkAeZEn3ivtuJjC2tzIvzFY0rkix+YZilJP3B9MbygWYG0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WZ7oFljH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-29
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

Autobuild statistics for 2022-12-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  1  |  0  |  3  |
  2022.11.x  |  8  |  9  |  0  | 17  |
    master   | 167 | 300 |  0  | 467 |

Classification of failures by reason for master
-----------------------------------------------

host-go-bootstrap-1.4-boots... | 31
               host-fwup-1.9.1 | 29
                    fwup-1.9.1 | 17
                     xz-5.2.10 | 10
                elfutils-0.186 | 8 
            host-binutils-2.38 | 7 
                host-go-1.19.4 | 7 
           host-libzlib-1.2.13 | 7 
                    pixz-1.0.7 | 7 
               libglib2-2.72.3 | 6 
                   linux-6.1.1 | 6 
                    norm-1.5.8 | 6 
                       unknown | 6 
                    crun-1.7.2 | 5 
glibc-2.36-66-ga1dc0be03c9d... | 5 
                   perl-5.34.1 | 5 
             fontconfig-2.13.1 | 4 
       host-gdk-pixbuf-2.42.10 | 4 
    host-python-greenlet-2.0.1 | 4 
                  jack2-1.9.21 | 4 
             libgpg-error-1.45 | 4 
    python-cryptography-38.0.4 | 4 
           python-numpy-1.23.5 | 4 
                  zabbix-5.4.9 | 4 
  gobject-introspection-1.72.0 | 3 
               host-attr-2.5.1 | 3 
            host-binutils-2.37 | 3 
              host-pahole-1.24 | 3 
              host-rust-1.66.0 | 3 
      linux-5.10.145-cip17-rt7 | 3 
                    opkg-0.4.5 | 3 
                    bat-0.19.0 | 2 
           crucible-2022.05.25 | 2 
             dahdi-linux-3.2.0 | 2 
                    dust-0.8.1 | 2 
                gerbera-1.10.0 | 2 
                   gvfs-1.48.1 | 2 
            host-binutils-2.39 | 2 
host-gobject-introspection-... | 2 
                  host-kmod-30 | 2 
                host-m4-1.4.19 | 2 
              libostree-2022.7 | 2 
                lmbench-3.0-a9 | 2 
                     lxc-5.0.1 | 2 
                    musl-1.2.3 | 2 
                 nerdctl-1.0.0 | 2 
            python-bunch-1.0.1 | 2 
                xenomai-3.0.10 | 2 
/home/buildroot/autobuild/i... | 1 
                alsa-lib-1.2.8 | 1 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.5 | 1 
                    attr-2.5.1 | 1 
  binutils-arc-2020.09-release | 1 
                   bird-2.0.11 | 1 
               collectd-5.12.0 | 1 
             containerd-1.6.12 | 1 
                 dhcp-4.4.3-P1 | 1 
           docker-cli-20.10.21 | 1 
              dropbear-2022.83 | 1 
        edk2-edk2-stable202208 | 1 
             f2fs-tools-1.15.0 | 1 
                   flann-1.9.2 | 1 
       freeradius-client-1.1.7 | 1 
                     frr-8.3.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
          gitlab-runner-15.5.0 | 1 
                 gocryptfs-2.3 | 1 
gummiboot-2bcd919c681c952eb... | 1 
               host-gawk-5.2.0 | 1 
         host-sentry-cli-2.8.0 | 1 
host-spirv-llvm-translator-... | 1 
              hyperfine-1.14.0 | 1 
           janus-gateway-1.0.3 | 1 
                 lapack-3.10.1 | 1 
              libgcrypt-1.10.1 | 1 
        liblog4c-localtime-1.0 | 1 
             lirc-tools-0.10.2 | 1 
               lpc32xxcdl-2.11 | 1 
          modem-manager-1.20.2 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.33.1 | 1 
                     nmap-7.92 | 1 
                 openssh-9.1p1 | 1 
                 proftpd-1.3.8 | 1 
           proxychains-ng-4.16 | 1 
           python-bcrypt-4.0.1 | 1 
           python-pyicu-2.10.2 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
        s6-linux-utils-2.6.0.0 | 1 
                  scrypt-1.3.1 | 1 
                    sdl-1.2.15 | 1 
              sigrok-cli-0.7.2 | 1 
                  sscep-0.10.0 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/9a7bd94217dede7e8da9c528472e6be454a878ee |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/f175364391ae68b07f8f12e244d02a9719712d77 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e0a38eddcfcd02e91286448dbf43f9b0e6f9a29b |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/1b4a721a78c9fa4c11e9ec06102da059d9257fc3 | ORPH
  mips64el   |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/8502632c244d81990963f76f218c299b2faef68d |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/14d3d6b9b99355403b7431bd150252df2def68bd |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/cda7116c586723b056643325b6fd7668d03ef021 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/dda33dc99c12c39c14cfd28299946a0d8e6af37a |     
  mips64el   |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/2fa7885f4731ad19f8db9ba10c599eeb057598ba |     
    i686     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/77467bc14ad2507f6179136e371eaeba744fe4c9 |     
  aarch64    |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/1c779b1b37c2e296eff6184968f899348eaec1ac |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/c2082d16d9e112649857343c6a8c8a595c1d4a6f |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/92f59cdc57f4db906812e0794e24a79feb9eb48a |     
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/fb4245f8eac2865477ba6921f97adac683d48353 |     
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/4b71cc302251bccca9c67626cd7116426515cb67 |     
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/924806ffd6d83cd6d8226577c3877b0b8ca2722d |     
   arceb     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/4ede9479d974571a5c5c128b1957ca4fe807c2e4 |     
    arc      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/160e7d2312e178a43f8df0c0e5855b8e1cd639c9 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/a77384943195b99b060e77ca4c8adb53127ebe6e |     
 powerpc64   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/d7ce103a886329c68c04ebe05571be8f95a873ce |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/35ec3e9dff361fa77491cf409e4d2d67ad37ffca | ORPH
   s390x     |      docker-cli-20.10.21       | NOK | http://autobuild.buildroot.net/results/908a5db28c3c94c9a1bf044f59cd9608b9e5886f |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/d8a6ac00fa1dbd0e88e4dc0b15db54f5d86629b0 |     
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/b9ce55ceca59c6ecf99b1fa8a5dfe1cb9da1f834 | ORPH
  powerpc    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2ca9813804e30460d0a8de525cb86d63e06a0425 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/3c19ef8bb6e5154e2c7415a8f9df016550895dc3 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/46ed83b3a98448a5acf344d5dfb22be23dbe8310 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fdb5b45be8bdf73557543deb627daaff313a3e11 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/270ea7b3d287b94763e00e41bb24de0a1072b21e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/50c89f8226b148bc3e9c30ef208078127c328aa1 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7a11d45864795ebd33d9f3f253b1935c8ece8f8a | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3510ac0b19c09bda65d5be661b3391b7f1817a67 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0b6ee094580c297ff42eaa0317ca5f098d39d691 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/92e13d7b1951ef8782eb0bcc9697759e386a5fa0 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/55a6a2dda9caafeef5e27d48b3003bc9fed0839e |     
    arm      |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/808e4578eedb906522eb59f98b3aabab42e2f2a7 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e9bf575ac46946bdbc5513212d7ffd03922f317f | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/d2e8108bf79f4906f943c843229a138c179cebc2 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b3c06a1349cee6d6460b86444f09f816b9f7a5ba | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/3a8cb9f259bb70259eefbc909d21391168e4147b | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/f3115b12450fb960c5bd6234f6fb5bde586f6d0b |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/f6064a7a4d514e1905bec2fccafcd7358b9a86e3 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c7a9e4f8cdab1a853007e43e36cd0b96b449d9dd |     
    sh4      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6159f01ba84bae7e079589b32e3a89b0e5c82c36 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/23979aae0b701daa4237dbd4f4a1bf76a80fc170 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1d86b601c5787ac26c5689ca1c394afdfd71c1d3 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/576dd917fa59c91a1c507af6e5b3f41020f6a092 |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1864a607a65614f4a9fd0e0f5703eab4ac1d3a79 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d7e1fb502b45e4b61e2e5fef0d4e18e6b6c9eb24 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a9f883b91fae0587f6664353c1755c841e862af3 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f4459b56e85dd3be2ca41adfb4868cca3f265cfc |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f714d8389cb848b6f78720691db61235c62d8859 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2b72efcff4c47dabd80dd118b56300558190acee |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/99f8417f6cc0dde4274fe92f27871c8d75a7afb0 |     
   xtensa    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f5d549fb4f08156ba5952ce75926f7fd2242bfdf |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/376e5f590201651afe47ea2c5ef6b00ec8b5797d |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f603df4cf75ec6c300ecc2d35b7da2e7566bded4 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7b155c36531e458769d62c39532db945a59c2126 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6913189b5a6edd0665517e2d4575d7b48f14c738 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/43be7ed78abca1b0275d85e4c50658eb345def05 |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/11d9dabb36b213abb74393766a5540a4e74e4bcc |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2fbcef7d1f3c9c0b7b00c69553a189440b90f064 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/78d24092cfc801ce00b9e342d14784fe793c3e7a |     
   sh4aeb    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a3ddcfc4448e418c435b6bafb3a4688bd42344fa |     
powerpc64le  |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/874484d1bd3d09b7b4c72334d96d8445166349c3 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f993a52f4da83d7ace61fbaba057d0a94abb2a52 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/87799345ef9be481d6a652d6844355ef577659b3 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/39e52a975389bc14dd8bd08c2705a0b0a8a02811 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/56bd9c0111b9f74375c012dbdda663b31cd83af4 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b978d1284de189ace9286a8b02a5d6ae0d6a6a95 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3e7afb2880c87b0aaefe171a25699e17eae1bb79 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d1bd3a495f45a9c9e0c130b40ef44b9fcc903288 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/854eb9dccafc4c0917c247b9c239c5b614389ccc | ORPH
powerpc64le  |         gocryptfs-2.3          | NOK | http://autobuild.buildroot.net/results/084c07cc6ee5eedf858dcee5b8c0b101cd7b4bd1 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/a6b5dde10380837c28200a918ea7f8293695590d |     
    or1k     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/febbd8bcc61fc8d78377cedee346f9d4b9bd1b53 | ORPH
microblazeel |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/d049001059eb2ccaf2b0605c4e8bf5209c187070 | ORPH
powerpc64le  |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/4c266a7611a0408697cdbafd899af5fb489e802c |     
   xtensa    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/2e634d40fe399c4668a4532b79fd85f94ff31b96 |     
   x86_64    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/cb2d9fd686b5c7a0deb73b23807d3f0954144387 |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0f3555c919bd487178dba55312240f2362207db1 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/025f3e6e313f814ec51019854cca1db1ff7bb711 |     
    arc      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/932ca3e9b29a94180e0ecfdc5575a4a3528a8e2b |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1a394a05eba9c2163d677041c5e02d7621106c45 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f7a51e9e7773ba4fb2e334cef2a430ff273659d5 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4983e65a1c65778012f221cf0d4b959c30713d38 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/172a6ccce50ff02be32f93cbf311eddb73a01e8d |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cd4086b63bc30e687fa3305c69a2821217e02fea |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6ad762af0f3acd6e37e94811952ef911fa20d6db |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d3f675dbc18b0247e21cacd1400982014383fa5b |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f61b2862adaa0e8c4f877955c4edcee1d4e598eb |     
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c9bca68866ca0080761adc252569522792447f92 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/20d321d88b606edb586233a21094dd45d8a0663b |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/809163fcfb370546cdedc2a9268b6c7b476f2d05 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e33dc1633fd7377ad343bf6d66097e28da2d30ab |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e09b6f15a432bbaf45ebfcf4cd3d9b653abcb63e |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b6cffb9f68e1ce10933ae45031c2b2b5730057eb |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/072f46a3215458eb512d698653c2b7c758277b79 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bb84f887bbf921a4062daa40f9ce4bde43d0abc9 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a249a4694154f1ac64881b18260890fccdfff337 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1b284b79d52faad99270e9c5799cf7eccb64ecf9 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b9c708704bc2b29292f3bdc2464bc396bfdb536b |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fcae134c43380e77c1fd7ec424e7fe1f343c5740 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/84ee0ff5b33df01b92d3d2406308c25e5647971e |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0226e8de5cfaf5c14c27590175759076b3cc71a4 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9d8db62490c4bdcfc4123e7ec94ccfb67838ff5d |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c18179777a99c0b75780c2a8d01a341a4b5568dd |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ec9b9a9c2fc5af24d3e61257a43b335777554ea5 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/972e2ab15cfa8ad232f78b26f319debb851ae4f8 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/308bc0a760d8bdc14c9221dbcdc6b6b24db90998 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6cbc6c8ff92b9792bb9264869043bd058bc7addf |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d674d0af79e2de62c80716b7dc15d23f95a95507 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5e4c20d77625a08889e8a884525e4138bfcf4980 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fdf9f4b672c432087a1596d87384b788271027a0 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/41ec74d84502089a84bd44e10ab8e9a812cc9088 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4dcb7388bf3fb529a6f1995fd202bba85f1ea5cf |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1feaa88427240ba6a039f3fa205d71e1309b69a1 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e43f7f02cb5a72ecf658d7599ffda073e699c500 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ecba92541873c84bd37a0fa98ca9e0b26f75d6b6 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a5251e722249726102eaf41b1acc84ee424452bb |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5c1b7eef3bda0be7ad557d5b297b72a023d62fd5 |     
powerpc64le  |        host-gawk-5.2.0         | NOK | http://autobuild.buildroot.net/results/9bf024b720266a6471998f57cd5f82431aa81268 | ORPH
   x86_64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/e3646f25c63daa4ba522b4c6088e9f570faf9eaf | ORPH
   s390x     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/a6d2bf1ceb26e32ac87e4104924b38ef61867a86 | ORPH
  sparc64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/29e1f947536e43a242117b71ea87d3f41489fca9 | ORPH
  riscv32    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/b0b9035189a94c58a6befa33794cffa2c5993c3d | ORPH
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/2a0385941b1ebb77b18e9d5230d74ed6f413118a |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/0e5f36140fcc027fcb482bb54b53d8fca4126efb |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/a10598ac3726c963119f92d40b54a37975f48090 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/611f31b2aebf78ebc549717388b923159e694722 |     
powerpc64le  |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/6be6fd009fde0567ed805967bf2fdfe7e64915b2 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/340fc6b7970521973330b351997ff7237d487e33 |     
  aarch64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/17dee1155400978ab44e269fda9615aaec981095 |     
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/aa6fb3c16113c9ac9a27352ff7444c1370641fd4 | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d36b457d21eb0d446b97ef08bfaecece83525424 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/620e1d1c1691542960d870bd50a228c984c1d624 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/385122c029fd19201852de566fadfe8d94c3b168 | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/58686e92181d05fc0551f6512a5df412e8699d2f | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/878f88fa27b47c744188a241988c37a3b1cff491 | ORPH
    i586     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f8e05aa1d7b0e70a01b5eee3251a9ae6cfbf6038 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/4913523e76e6c135ebd3efb6773eacdb9dec5137 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3bae8d83ef7bb52028e8da9109742a86115e6318 | ORPH
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/53199ce9602c58e603fdcbbbd34ee9ca1235ae68 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/56a8d534404c1ce3a555e1cc24758bf993d21a91 | ORPH
   arceb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7d41db16280b2ac68a6f2237e07d78d77aa1947e | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7e7ef425bacf059a62d90df41739154b66585117 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/224f968fcbfb01e176550cdc67b9d9e3d5fe85bc | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b5b173bb1d6a7dc09717311a10986f344d1756f9 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a9826943fa2253a3351b1f6ff16cd0dfc1618d13 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0109c30233aa02344e33428bc40a3fac5aec4424 | ORPH
    m68k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7d7bdb2d1b5924f124e42353992ab5738572e7c7 | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/afdd6e07a40c15d4f9e286433e1ef527fa84e43f | ORPH
    sh4      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/dfa247a0ae19d8e205d07f8345454f951b3d698b | ORPH
    sh4a     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/86c32e9f95888c9dbb0508628e3af8593e57033b | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5befdd30d755dd65185e6195d57110e9a945b007 | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e1af6aa75eb72b47899cfcb74958b9b29a83cdf9 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b60bb7b577159fd704807ec11c7015049be24cdc | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a623047c5794e0739463c469df6ab384c9759eb7 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/be0ff6d7ddf5ea02acd6552bce07840bf394a5c0 | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8821c516185d327c2b27d448d4d635fbbe2a3ffd | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9b9b955dac2be0b617835f9d8e9085158b7a9a79 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/895ce45b5b4ea9b5e61d31f3ebc80fba72d5e88d | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c00fa407aea35c8c2df66db351a2545edf516bea | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f3a146fe36bedb4de1c8ef2480da5f65dbfdc2e3 | ORPH
   nios2     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/83a339bc029ffafc205b86716723b9f3b6e93c1b | ORPH
 microblaze  | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/392bb6f2c7d55b0bbae91bd80b4bb16e1d2c229c | ORPH
   s390x     |          host-kmod-30          | NOK | http://autobuild.buildroot.net/results/2eaddc08c531eea68f553a489907fec92587e4f9 |     
  riscv64    |          host-kmod-30          | NOK | http://autobuild.buildroot.net/results/0ba23aad9f9809cf4b8366ed9242dcd88fc88a91 |     
    arc      |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/f9dce701d9e58983cd3a2159626e922eaa8bbd88 | ORPH
  riscv64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/48bdf18fcb578395551107a025ac9e6cc4323372 | ORPH
 microblaze  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/3e2d111162827f1090788412a79d22e14bf8493c | ORPH
powerpc64le  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/4c81835893d2e7af26ba0e93833f13264427a0c7 | ORPH
   s390x     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/cd361e9f44bbfa093cd678ba581eb32518c7050f | ORPH
    i686     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/546fdf90c447a5558fe086bcfb70a30c6f665134 | ORPH
  riscv64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/aa721cba246813c6e8f5333bed1f885f4a855f59 | ORPH
   nios2     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/228adfb7ffad8ad6fd1597a0a568831a37f92e3b | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/761df4c5d53d3f9870052430b777a7b2fd854d88 | ORPH
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7736a9336adf52976ae35c8a89e0502a9dc694e0 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b1623fcb7628666ea49ed9d44addde59660d6b14 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/615bc2c067c6a95e2e75f6535e6f4cc639371c49 |     
   s390x     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/1868f59c382aa2d7ccc50f9c9cba545c1f957f81 |     
   armeb     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/ad5a0bfa53dee1bb9ca3d5e64a7e5559bdf5cf45 |     
   nios2     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/d6f958c7fa2b406c655db1154a7c4dc18d31d483 |     
 aarch64_be  |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/dddf83bf88a5f8a796b0702fa499ad3f9144f8fb |     
   x86_64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/7bb1e7406b051a2ca69f2cbb81150172e5115764 |     
   armeb     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/05252f568fa88ce4105adf0b00384658e393d363 |     
   x86_64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/b3871e53989d99bfa7ddb178cb53c58b11794dd5 |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d2d0bf787da1125365e01c10869c290bef9acf04 |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/2e0b5acb718b58333fe8872c6364c680918c457f | ORPH
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/2c58dfc714a6c12afdfec8b56addf8f19d18484b | ORPH
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5c8555ddfad6e0d2d63621d79355c7fd390c76db |     
   xtensa    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/97ae4c7ca3a424f4d9e4e2399db66522f5cf5fc3 |     
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/25a9d148208cef4c60d840a857ae8ccc36e99ca7 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/f5fad766c20a43b26af103abcd1476ce1635ef91 |     
    sh4a     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/3eb18110b1684a9b4bbb704973eae575b55859cf |     
  riscv64    |         lapack-3.10.1          | NOK | http://autobuild.buildroot.net/results/dabcfa5983152ed10c642e64c2e3361ad2da1cfd |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/eff542bd837bffda261684c17f6cc26aa9d6cfca | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/26298372eb81189923cf69ac9832253111928e5a |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a90b08564ca43c89799be130389b825ff1637a56 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6f269f586b1435c67c4a2e34d51b004400645e0d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/81688d7aa52ec4b88f8cb9e0ba11c8c7ae679a89 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1292bbb82d22cb067c43af64e08bb337df8bfd14 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c64f90209bfe9bd90e70bcf0738f7f81dd8fc5a8 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/43d18eb8e56e14867cf13f028055beeb5047b966 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/d0ce3b7f2d82ae20a22f2aa89387ad263e8075bf | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/698da15dd1ba468224aae3a01ccaaa0e270c50d0 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/654d2062ab74fc66040a9ef9f158bf4ec4a7d9f0 | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/3b8b8d3e3f799c21681bd7a99832adddc887cdc2 |     
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/2266c2accb12e842f7c70be4e2660b008108de0d |     
   mips64    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/c96ec1c62ccb0f86d4f115dd1a04a3088382e6aa |     
   arceb     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/020faa86f6bf811ebd1377e2204342213b06f1d4 | ORPH
   mips64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/9942c0fc75edf1614effb92819ff706afdbbc340 | ORPH
    sh4a     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/cc9e435c40d04f445a495b3cf9471aa3dfd46812 | ORPH
   mips64    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/21f755ce9d06812a75422fc50e700cbc3736fd7d | ORPH
   mips64    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/6ec80c5cc60288f5237a381fc2da7d5d4c6579d4 | ORPH
  riscv64    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/752e9e67b15548ae18e6bdcd298d2b40b2f53ac8 | ORPH
   x86_64    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/5e22f494547a3cd44cf569bb3a61b9d18a6abe00 | ORPH
   armeb     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/c47107db24c8b947b1ca71ad141d92f4176a6048 | ORPH
    i686     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/1d6000677d958534644cc648980eb3be1bdb0750 | ORPH
    mips     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c20f294be1c4dd281f85741914133c45800ca344 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/cf061ae0c2bd153f4bc60f87a71d193370d6cfe1 | ORPH
    mips     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/059ca2f3c673e12f64510c1f490eed3af21e50ac | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/9157dad58db17c56548879b9f6c61813b3caff04 | ORPH
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/729cb795fb0129e277ccb6bf927e1ee5344fd988 |     
    arm      |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/c9f05ad264543adf429badb99310905427092772 |     
    m68k     |      modem-manager-1.20.2      | NOK | http://autobuild.buildroot.net/results/9803d593305df36c4a8d67aac2fb4c9a3120a072 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/e5800021659f3a05622b948e8121edc5c7eb6608 |     
    sh4      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/233d2e5fa88966ddfdc2932b190d664475fd73c2 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/406cdefd44610eeb203a3f2f087ead112ca55c8c |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/95b424ba9a702dce6cbbc846cac3796697b1d3d6 |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/a7a5189ec087b80c5d5de150b1215dc73df14da1 |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/9d9ea9276b60f0642a80ff95a1bec23b1625cfaa |     
    or1k     |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/c539643952b8ef83d6c32f9662a20a6db04c6e2f | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/cb2687b67ea42e7a7f6abde36a5f529efa643020 | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/14fd8010250cc1fe07c3b1df906b241d87145e1c | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1e4b75acedc5af2253801b3939bbbf8eead4a392 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/110528b7da16df8758ec55a52066a9276404f577 | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/73709095badb69b656cd8913d0955ee09d894b11 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/93ed235af17e2ec56b3776b4ee24b815f271fd19 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/554c7ae34f1d7d692e1721019cfde92d84f7c76d | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/347ef17bf2a2a305e2c82beee54e8f3033435dc8 | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/0dbfdaeabe561ac5950a90967cbab018703e54af | ORPH
    m68k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/6396f0560b4052026bb062bcc0ae41fafabed4d0 | ORPH
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/0013bd53620be80b15535d7e45fed957d7350324 |     
    i686     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/773954d4751e408d69fb162371cc9d0888cc7bc1 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/8385f66dea3f95234a8ab254b0b0753995ea95ba |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cc1a62fcac863588aa031b0cc0c8e0b7ea5a6e7a |     
  sparc64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a99b85f7a8337d97c6bc94d259e9b86c8bafbe30 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/1b8c403a2b9e4d7d948588b09410a7f765da1337 |     
   x86_64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/24e1e265e3a696bf6024a23322e81cd4dba9531f |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/07893a7326273a5fdb70d36624469b67cb1a9b98 |     
powerpc64le  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/7212a4af02cb5165534a807ea00561418e767895 |     
   arceb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/e4e1058417470eda12fdae50fdc7d9b7b3e5a479 |     
    sh4      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/f7053655cee54430c5a7ea358a2336d2da97a49a |     
    i586     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/787814e72401f553ab7e7765242c769646645823 |     
 aarch64_be  |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/252356c6a47302cba236db583f39d98bcf87876a |     
    or1k     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/d147424e46f2426da69030f7054acb359504006d | ORPH
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/df95a42005f891f11e7989426ccd2043507cc526 |     
    arc      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/39d768809f9fa6db360d592d4a9a22ad1f7318e2 |     
microblazeel |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/7dab1b8dea46442bad4a1e86e12f204036f1219b |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/ff8aebf156a5e171ce4c1aadef2fbacdf0278426 |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/200797aee87b82b25e1dc3011f9b46ff95ced9de |     
   s390x     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/310440ae31bd2e03e876b4480e0246cab5ad16af |     
  aarch64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/0567114fca0efecb91aea6018b549c3260a65e72 |     
   armeb     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/a6e91329a8126f37abe401493f36455b28d3f702 |     
   armeb     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/5ba44565424326c7409b08739b508a665125543b |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/c8fd7527ea5c8c88ab6564134068d1e320c60e0a |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/99c2700ab9ecf4a967f2637aaa89a6407758e6d6 |     
    arm      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/e1ff568b8d9cdbbe7ffd6dd50c6de30113a363e3 |     
powerpc64le  | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/18c5ada03a38472ed91bad34d68115193d24fed3 |     
  mips64el   |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/ee37ff1952bc4c63279083256256a4483d62630e |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/2487f6cc4ff764c02b7ea208b1c1c43d1ee0eeca |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d043c1008d076ae77d99e598d04fe4d9c0ba8eb1 | ORPH
 aarch64_be  |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/4ba5fd1e120b186a52fc50acca7aedfe0f2ad28e |     
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/1ae7d473e21ab958e8ef1ade60934239ad88d169 |     
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/96bbf6e33ad0aaaa79e324ff4b5266f784f6c6b2 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/c06e90caa9acfd29eaeddf66e408c2b0cb45b4e3 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/ab6da03051f5a575378ba820354483a5d587845e |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/334c58e7c655343a5c949671fcec1d907faff0f6 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/567eaf273ce8680f085d9f5229732ea6af1fdb15 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/48567e821f63efa19346d9313c9a4c0726e87637 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/d8486cd1d5e56fb3719dc88b8aebc76c3e23cdc9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4d5bacf1a5ed3a9ffd63a29e328f7062b6e2609e |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/3ba10f0af6489b1fe39e1b3c1d7f986d9067f53f |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4b73350b647ebbe22dbc30cf0163c6399ffa4d73 |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f90e1b53ea8bcf06ab6d43addb9ee1800a2e3f20 |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/5d8e1ba384b433b9627292bac1cde4a6b0bd9de8 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/608848ae4b1ca5d6eb34e1be9cb4e9a21f4a55d9 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c73e36c0766a5b118e8802b7ad62e8cf3b005ecb | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2cabe110d9cb93d3159cd48a74aeeb60e73bfcbf | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e90d651d5055130dc446e834c97046424ce95456 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b97c8fd2e3452d0e3d4e33cfa173c1bfa94dceaf | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/544e33e9d54c6fc6783557b51e5d017477fd8195 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e17506480da7fb9a014d3433ff8d6930e99a03c3 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6476f5aa72a0090f1464b29f1b20f4f69f1c30eb | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/bdfd47f58b7904587cc7c5ff2f9f7f824eac6bc8 | ORPH
  aarch64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/d00d3913c1abe12f98bc258de286498ef996ef45 |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/3cd1662f99e53cc076e610c20d7d7d0c39919398 |     
 microblaze  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/5c7558f56d0ec70e9e9185ede046eeed1442e250 |     
   x86_64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/16efd0531cbf4d1a9e69f87fa48b62f1e0d636cd |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    mpv-0.33.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4b948373815d60f4d5c5a067810cf80c1c57e0d2 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 2 
                gerbera-1.10.0 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-binutils-2.38 | 1 
              host-rust-1.64.0 | 1 
                  linux-6.0.13 | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c8df5fefecc09cb32446f410b7faeb08df4e1b81 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/51b6f3f9e04c0f2f8a7e4617cfde93aaf371cf2d |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/f80a59be40ae1bbcecca13f03bb92c14c13485f0 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/654a200567cc8c145eb33dc259f390279fe6c439 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1ebb144715360e753fc9455491a2dedd128dcd2e |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/528ec43c122eebbc7c3fbe00d92627c16ecbd83f |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8300a7cf8a25c216e212d250e1e1824f1b1838f3 |     
   xtensa    |          linux-6.0.13          | NOK | http://autobuild.buildroot.net/results/f2386cb1d100a7f6b3e9fb2fd6d8d3a02adac6e6 | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a2840a39c5ae630219343b3bf60ed5ce4780c866 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
