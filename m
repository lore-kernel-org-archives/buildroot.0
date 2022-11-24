Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991C1C4332F
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 07:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F76140132;
	Thu, 24 Nov 2022 07:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F76140132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvWta96h8yy1; Thu, 24 Nov 2022 07:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3150940146;
	Thu, 24 Nov 2022 07:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3150940146
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06CEA1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 07:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D30FC41750
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 07:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D30FC41750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Esms5arnz7t for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 07:35:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06FBA4174E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06FBA4174E
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 07:35:57 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D2A66E0008
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 07:35:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 07:35:54 -0000
Message-Id: <20221124073601.D30FC41750@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669275355; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=44NY6/2pAni/4VB+LUpIPmC5XU/IZvNg25DWIllT/9I=;
 b=jtMZyVC3RguirDIoenijJyjm23sAf6cQrc5AqjBAKWjGXDb/SvTqSGCTt65lBkFy8xrGx3
 LsYHujVapySGn3MeySIUKJfdfg/AMjNUpCq8TNFz+x8hovM7Q9iMiZXSCk9OOpSlXLMCtd
 5zUsxjInzo4BjNne1Qd/sSP/Tp2BKioQED2dAEF24WEwbn47poRQQ8t4ArCpr8iwVP7rLz
 pv20lBPpKa6OQU9T5RjKqh4LPijI+0S62urVtnb6RBlbARLnZRDIpGi/Y/kmJ3tZtMRtOE
 no72HvzIRA1km6zFMdT+ulsIWwAyAYHM1Sy/GcJYr70Lf0TPK7Fk7rYfunEEhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jtMZyVC3
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-23
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

Autobuild statistics for 2022-11-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  0  |  0  |  6  |
  2022.08.x  | 13  | 11  |  0  | 24  |
    master   | 207 | 247 |  1  | 455 |
     next    |  3  | 14  |  0  | 17  |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-66-ga1dc0be03c9d... | 16
              host-rust-1.64.0 | 10
                   linux-6.0.1 | 9 
                      xz-5.2.7 | 9 
            host-binutils-2.38 | 8 
  gobject-introspection-1.72.0 | 6 
              host-pahole-1.24 | 5 
                   linux-6.0.9 | 5 
                gerbera-1.10.0 | 4 
             lirc-tools-0.10.2 | 4 
                   perl-5.34.1 | 4 
                       unknown | 4 
                xenomai-3.0.10 | 4 
                 dash-0.5.11.5 | 3 
                     efivar-38 | 3 
                elfutils-0.186 | 3 
                     frr-8.3.1 | 3 
fs/ubifs/ubifs.mk:49: /home... | 3 
            host-binutils-2.37 | 3 
         host-gcc-final-11.3.0 | 3 
                host-go-1.19.3 | 3 
               libglib2-2.72.3 | 3 
                libglvnd-1.4.0 | 3 
             libgpg-error-1.45 | 3 
                   libnss-3.84 | 3 
                     lxc-5.0.1 | 3 
                    sdl-1.2.15 | 3 
/home/buildroot/autobuild/i... | 2 
             f2fs-tools-1.15.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
          gitlab-runner-14.5.1 | 2 
hawktracer-2ec19d7192334414... | 2 
            host-binutils-2.39 | 2 
                ipmiutil-3.1.8 | 2 
               libcap-ng-0.8.3 | 2 
              libgcrypt-1.10.1 | 2 
          linux-5.10.145-cip17 | 2 
                   luvi-2.13.0 | 2 
           python-numpy-1.23.4 | 2 
                python3-3.10.8 | 2 
toolchain-external-codescap... | 2 
                 uclibc-1.0.42 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
               valgrind-3.19.0 | 2 
                 wavemon-0.9.4 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
               apcupsd-3.14.14 | 1 
            bridge-utils-1.7.1 | 1 
                   bullet-3.21 | 1 
                  check-0.15.2 | 1 
               collectd-5.12.0 | 1 
              containerd-1.6.8 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.19 | 1 
                    dust-0.8.1 | 1 
              erlang-22.3.4.22 | 1 
                     exim-4.96 | 1 
falcosecurity-libs-e5c53d64... | 1 
                  ffmpeg-4.4.3 | 1 
                     file-5.43 | 1 
                   flann-1.9.2 | 1 
       freeradius-server-3.2.0 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
 glslsandbox-player-2021.08.24 | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
               gocryptfs-2.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
                    host-bison | 1 
           host-elfutils-0.186 | 1 
       host-gcc-initial-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
            host-libtool-2.4.6 | 1 
     host-moby-buildkit-0.10.0 | 1 
               host-parted-3.4 | 1 
                      icu-70-1 | 1 
                iptables-1.8.8 | 1 
                jailhouse-0.12 | 1 
                   json-c-0.16 | 1 
                  kexec-2.0.25 | 1 
                libgeos-3.11.0 | 1 
        liblog4c-localtime-1.0 | 1 
                    libopenssl | 1 
     libphidget-2.1.9.20190409 | 1 
               libsigsegv-2.14 | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.10.3 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                   linux-tools | 1 
        ltp-testsuite-20220930 | 1 
            lttng-tools-2.13.2 | 1 
              memcached-1.6.16 | 1 
            micropython-1.19.1 | 1 
                    mpv-0.33.1 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20171122 | 1 
package/qt6/qt6base/qt6base... | 1 
               pipewire-0.3.59 | 1 
          python-pysnmp-4.4.12 | 1 
                    qemu-7.1.0 | 1 
            quickjs-2021-03-27 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                 snmppp-3.4.10 | 1 
                 systemd-250.8 | 1 
                tealdeer-1.6.1 | 1 
              traceroute-2.1.0 | 1 
           uboot-tools-2021.07 | 1 
uclibc-ng-test-6790eafe897b... | 1 
ulog-0389d243352255f6182326... | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/42b4e9f021c972fa8f99f2f351fcb098ada728da |     
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8c6fed4a4b08c82b138a2bc785712e51d40c8741 |     
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5d7c175629e81459a7cd1fd80a763b01f5aaf3d5 |     
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/372af787e6e5ea3c1aa5be055e43a305abe9e059 | ORPH
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b7cdb5c2b1d6d94028e5e3eb8d43ff1fe42a8677 |     
  mips64el   |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/08b589710197f1f6c444111c810845d78e976f01 |     
   sh4aeb    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/fa907faab902eff60df3c5b6f31ff32d6a3c19ba |     
powerpc64le  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/f269de34dc264c7bfa8edb4e9a8c108640c16643 | ORPH
 microblaze  |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/b4cf06f427be9d08048759dafdae291b7522d4aa |     
  aarch64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/45004b29a7f238c16272a9c1f7a200d1b911b4bd |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/172ef1393b3dd4c8a06d8f5eb85aa363c21e68ed | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f66dd37d7a0905867a3ac5a095403a6319ac2912 | ORPH
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/6ab600beec71961a8301bf30db3e46aba7c72ebf | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/bcb6c4899552355413d5c90e38aef6b86edb788a | ORPH
    i686     |      docker-cli-20.10.19       | NOK | http://autobuild.buildroot.net/results/1c5111cebc3f808b4f1051f9238d68fe845cea98 |     
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/49fb591f99980a6ee5ae122dc70c33b4c6a7cc41 | ORPH
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/3a7083cda182b7d57e530d71f2954efb3f234646 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/ec539902c8d12351d90a201d64b96bcb726038f2 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/f115944f181f9110a44a989449f2b0839001fc11 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3e9fe489f49cabf88310f718c9824f62443fdd59 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d86c4e11a0c825cca687ef38eb1b7580ca08327d | ORPH
    or1k     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/39df8efd69b217cbb2d21af0433ddfb3baa03c86 | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/86962c607b4532539330926e9f49c0900c7309f8 |     
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/3eaad262d602bf08f2af88f51f84e6e5f3db0027 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/42177412b388c439d7ef91075dec45655efa6c32 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/41999f1d3ff49b6828fe777196b331a0ef7b20b2 |     
  sparc64    | falcosecurity-libs-e5c53d64... | NOK | http://autobuild.buildroot.net/results/c7ef698b81fe15c1c3149a3ccbac85019e5eee20 |     
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/e6a31e882b2b75a9dae93089b207372b2b468718 |     
    arm      |           file-5.43            | NOK | http://autobuild.buildroot.net/results/6ecef261d88c9f813d0f713bc309811f96f55c97 | ORPH
    arm      |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/d20a2b39d7430ff65dba26f96217b5e81f2ff272 |     
   mips64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/dbc4a42a5231f4b5f35d355f953e0274a0160d37 |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/da1e39aa485a3cf4715650c105b8fddac73ad1fd |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/58bc060046400b54a53d36c14aaa04eb7ac716f2 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/ab28f0359f3ab4b12c3d9846fbaf3df487f6718d |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/1a422cbfdfecb986e2795080b0ad12339b9129a8 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/7993e722cd5b2710c9cbf30a12e3e86adf368a0a |     
   s390x     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/7ab314462d5e72c7241c15ff5c3a112db34e97a9 |     
powerpc64le  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/48e8b519879d6d6db9184955c89ed9a439467c6d |     
  powerpc    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/c7a36cb76ba35d2af9a409a563080aad0a549ae3 |     
 microblaze  | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/1bdb751bc6b4fa98889e378c6e04b0d0feb81b90 |     
   arceb     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/1f2a9c5bac0fc4e7c85e5c35173ca7063b3d53d2 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9fa909c7d6e3b0b179f78daed3907bacf4c4f4a4 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8c44b616dd7ead51f4413b575e13f038811e427c |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7c88bf968ccc000449fa0cc8a47c013f1c7f056b |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cd2e21f6f766e2f43d6e4e09e5f8f49172d4a015 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f675ca8fcb5d59f68aa55d64d207535b338fa903 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/edf541aaad7d8e3fe3e03a2afd6ea96b9a956603 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8b587cdd6378980d7dfc0a677bc00768f658d96e |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2ba6523f0d831b3d5a3513d42a21655a7564ae1f |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6cf3817da222d3bbc2f6d29b23436f80e47bafcf |     
   x86_64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/0f4e0d50b5fa1dbe2cb272b00392fb2cfb54a163 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/a102518c3f042cc18d4eaeea428703168eaef358 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/af8f9eb1b4dd8755c41a421a72fc19a3aeb6b43e |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b36324b8ef28a898aabecc9d4c8121fa4d8d87a2 |     
    i686     |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/c27570be07960aafb47891e03705ad34e3cb8900 |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/16fccebda8a8d3ec4e0b1c2bad341cfb1767eb23 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/04e51249f13c62f54bd5fba94d628a73fd0c7edb |     
   xtensa    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2f5e842bad225fe049cdedff0a0e3bbf4b8a274f |     
   sh4aeb    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/4b288dbfcfdc36f455a751a4ed44301a38a8c156 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/aa19740a9266d10b999d88591bc05c666e9b7158 |     
   s390x     |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/d3e60b42ad0a983b747a650ddf0eb4238e44785d |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f648cfaf5e720252f19fb66cc1a7ae8dbe7d269e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/be444470881e5d60401772509d7e1e3721f0e945 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/42cacbaee68bdc71d3789318433a59f9d2b3e1e9 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1dd20c600fa0b8b37d637d25aeb288d0b740e44e |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/bce6ae82a209b1c67067da679c50016577fd1475 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b94417cf4d2c6fe1fc06083b744034d220a70c5d |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/36644075f0b96206c730bf9ae2d0390096f908cd |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c74a4a91661b289579a9777e2770ab1373f10299 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/961691e10b304ed0da6113511972713f7408478d |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5ba737f68af9277759b028ceee87cb445e5e1290 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/85fa4499c4d6cf65d1cfa3e16be502d86e40119c |     
   sh4aeb    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a570c5dfbe414b5ae6165d178cc729731eaf060e |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/2308fe9bc583f9a39c1e7b0c6d2f218fb0ca073e |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/55bc5858e8747c911e3dadb31ab07b5231b65f8a |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/87ce25b7bb77a32feafab374ac5a68ff76216283 |     
    sh4      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b027a0b4e745dbcb1e351d67f6968581bf0ef71c |     
  aarch64    | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/4b35c07ee853e10755b75fc942148cf2836cb382 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/0d32d33216220aabb96c89e41d001a9632babef0 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1bca37a60115a88da0203147378adfe35ee68ad8 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c1c8d6eb0e76d2c009707d579a381ccc6e447186 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/77bb5f7d666b483ec9ff3e6cd29e7533b04877cc | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5e5468a30e510dee3f202722ab39fef2f1e6f85d | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/eac510299d8c0536b0042e10fe1d4cda11883a6f | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a50f17d25761b9547216403d28ad5662963ee0b7 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e2ef602649841f79c4ab06a33b974b01627dc453 | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/186a0922272d6eacffacb5c6114655c435fe849c |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/4ca44ef232417d8a46b3460e4dc87fd7baa4aab7 |     
   x86_64    | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/6bd918c033542a29eb858b8b698837826760090b |     
    arc      | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/df9f6b317ec06dab395132b3a7f63cc2b1444966 |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/109c69123598404114e6cf213925c15123f15727 |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ac5fcf6f030f598dd23c6119148a05c7b00735ff |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d0077a8fe8977eead920beda04b11c12fe5975d9 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3f9e7ebfd18cd89cbeb08614e596e443818369c3 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/de4cb0b571ac4126ef7811dc33ae2cb954b82221 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0aa644d473ee07c0a5cd17ec1b8816512546522e |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f4df69bdf1bc28d0c13f561e1138a73f756dd8e2 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/88ffbd82f5c40024cfc017d19d2a32936cd277eb |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3eb42cf1bcbca44f346bfd96e58910368cbdcbf1 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d2401d39ace2ef81c7d06809bf090925663cb6e0 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/78f505390c5cba4fc31ef7ab5626f31294e97682 |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/fa653e769bd72bf22b5410646e6b254cdcf45001 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/74944e0876575e57ce4bdbb13c6afd65d3c459fe |     
    mips     |           host-bison           | NOK | http://autobuild.buildroot.net/results/4a50c87ed3823d46557f4dcf177392eecc737852 |     
    i686     |      host-elfutils-0.186       | NOK | http://autobuild.buildroot.net/results/bc9041de7d3effdd7949a3d8f7330c1486445ef2 | ORPH
  aarch64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/132980903d9662ed39223bec7e0d25f6873a2988 |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e3a1d24d06a02aea03f4048060a8891fb09730b9 |     
   mipsel    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/725142d281a00f6454289057e8d4d52ec2881349 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/56a41a3fdcda61e30e73ac0ac0f8a57e2095be28 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3087d7a40a78e79b360f53f1270035f08f0fdf65 | ORPH
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/3e30b48432e6fad30682bbe48d6b02d309231a7b |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/726b1881d6c829f099d7d15127174978e6c66472 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/332cfb02046dd82b13814e767070e49708c77e94 |     
    arm      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/207b6dc4f718cdcd75e8be105d03ad55c7b36edd | ORPH
  mips64el   |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/852e2a3fa05500ccafcd976c516fc71d6e5e239f |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c3c74119ee80b49540d0bad8efede5e9dab82627 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/01503847e00e63349c2764c3685dd649b037a570 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/85efd58c22a41eac848a094004a72ced090a4b1f |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/87fd7e179f988c3be7e03d413df53a006f4a96be |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9ba595bedfd1c45bfc5fe2b89ff748586b44dd91 |     
   mipsel    |        host-parted-3.4         | NOK | http://autobuild.buildroot.net/results/40ca9c8cd0d0eebb113667cb0709750c1aa1853d |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/27e8e4e362e8b1566b42beeaa23ec5e6442127f9 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c84d10e4ad94e090780bd4e2f95079d1c396680a |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8bf9bdcd722a1a40016a5bb6d121727ed1499a1f |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9117c22fc79fc324bff2b454660413cbdc3ed6c7 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/0530ef8b3b8ad6c19818ad0ab93ae8ed51b2a139 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/4d91bf9729b3f34273fb4d5d0489e5afe0784958 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9e3649b0b77fbbffe1720f5b2434a1ee40675ffc |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/82a44c7b38fa9bbc32d3f401d49085a000642ccd |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2534e5897d99a596c83cfb8ad363aac872419c68 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/20b6637c0bd780c5d46887293c446db9f682888d |     
    m68k     |            icu-70-1            | NOK | http://autobuild.buildroot.net/results/0845d4f7f0d7644b33268c6e5eaafae47862b9fc | ORPH
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/ea1c4e38973c4259ef858f2fd4babbc8d1d8bffd |     
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/a2e8af8dcdf1d692484094e28a164e0f00cf99a4 |     
 powerpc64   |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/1a57f7e0b7f6ffa25d461d226f4bf17e4fdc1f21 | ORPH
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/938d798a65eeb1c1554e3ac2d9faa44ac1c0d7ae |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/4632604509450b0f8079e5f7528c2082c3d42977 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/9ecca9dee7e98e37ffa4f2ea62ed45bce8078c8a | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/491372216655d81c77c4a2f3aba189462577c1f8 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/8289e5c576725aa7aaff260f8d339c2d93902092 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/75fe47633df8ec8d73acf2549abea3c5cbfe223c | ORPH
  riscv64    |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/291263de5f167e35908b0f62180e95a1481bf0d7 | ORPH
    or1k     |         libgeos-3.11.0         | NOK | http://autobuild.buildroot.net/results/e053b2e8a78350c418b9e598056a50da651387cf |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ee0498a996db5ae95e49bd0274f9d1bdbc572f3a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/fdf66ee730a5ba9bc341a779a947a48144ea6592 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/997022792bece85383e0179b32097d407309393c |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b256fd82059b52e64dff0a9d90ee6738081c260d | ORPH
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/dca8be7d810358e1308776eba8b146e7b7ba316d | ORPH
microblazeel |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/67cd40353abe7f2c50601dacec036daa47768daa | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e6196a92c5e14a54e0fdc0fa1bee8694756f7fda | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/75c14c7e2bc85730e0d3d704294a8ec070011891 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/31e188ae83300c646ec2576e8d0a5a1fc7e0422e | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/0105f70de07da3579f03c5b8cc81515eda0630af |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/95f2672dcc03b93e9412cd301713f2c44b6f298b |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3b97ec9bdb81bb4b1e6809f95e1a48b3d82053fa |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/97f04f9d46304179f3ff872bfbeb757bf7d835b6 |     
  sparc64    |           libopenssl           | NOK | http://autobuild.buildroot.net/results/3d2830299e3dee0d976c9a7dfb2dd91333742a17 |     
    or1k     |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.net/results/abeda2dbcb290bdf8187434c80bccbcf33c2c317 |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/418b2ed75852a9404a4d113f5cab4a851fbce383 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/8a7557769a43b7415a63e844a27fc422fd8fcfa4 |     
   x86_64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/44d29c09b6a804e153a342000cd071293cb1f7b1 |     
    mips     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/afbf8c83f8fa61284f81305f5d6808b6aa03ec9b | ORPH
powerpc64le  |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/608413d75e0056e7ed72055817b0a229994cb7dd | ORPH
    mips     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/88915a535d3014a407a73d75c3625e2c2786a96c | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7dbd9cd9f91a5beb994d9fa06d93c48880c5dbc7 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/f84c14b2ac22623196414f48a5df82cc87685e79 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/60c3c849ea0533b017e3dc8b90ad58608315ba98 | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b91f8b0472476124dbe3a7bf7da95dbe27485e0a | ORPH
 powerpc64   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/6b80925d9b7fd0a672cc238adf6218f184808c66 | ORPH
 aarch64_be  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/3b7ccfe8a1e67850dda677dddda38acc630e3500 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/c5b884ea99874924b43db45c3334b56dcbd608fe | ORPH
  aarch64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/f2a0050d5bd0619f9df816b8245f878338155800 | ORPH
    sh4      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/82522841c89e5167ae144338c4e385757e28ee2b | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/ad741d94f99473f3fa1ef674ee0cd3741bc0b2e7 | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/81d0b0c4202d50e119f240fb411d87dbcd04b48e | ORPH
  aarch64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/bb470c24869f0a4435ab000a1be5e2883360f0d2 | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/57a578195fc8dc771f31fb8aa3f55c34eece3586 | ORPH
  powerpc    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/7ad8b6b74424ab8c7d515d77787e4ab8b2ff4728 | ORPH
    arm      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/9fa3b964a3c9a1303010fb7175e184caa184c0d8 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/fe4c63b24cbe4d0e2399fbf33ddfd092c83740f1 | ORPH
 microblaze  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/1a814e9a1a3d4f9e375e58b6abe21468fc0fbf81 | ORPH
   sh4aeb    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/895986aea00cc5bdc0dac4aeb6ccb3dc06e954a6 | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/43467111d99c5ed3c98f523b771944f8d96f33b6 | ORPH
    mips     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/ba44ed4a2cfee5cb46cb1ef211ddcc4dffed158d |     
    mips     |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/a66c3ea6933dc1b808b164525e47b380381146c0 |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/418acc01b8ceb95507c73ed338fe00887a9bc533 | ORPH
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/a6ee6228a8cb57e4f6a7cf2731a48c6c0308be21 | ORPH
   x86_64    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/e4654c9cce0e5b8523782a60c097b52583f88620 |     
   nios2     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/5cf7528cbca125d2b6e5d28577261204fcf9fb6c |     
powerpc64le  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/33633660ba9c91dbf9a3f84f8c1682137496ac92 |     
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/f04794b0bcd686c7b829371f79d7262676b165f8 | ORPH
 aarch64_be  |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/0d6aed01ae99b9a99b36ca5fa64b9c065ee8357a |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b8c0dcb74d046fcc7843ba5b88456893fc28eec3 |     
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/47504efae80f64aa5285e9738d0980298b697340 | ORPH
    m68k     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/64764d31cecd02bfe5b0038b7a96696e7264650e | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/76d4bd04a71d72ec96fe6c799a5356e8bffbed2f | ORPH
    mips     | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/3241d5cca75f8acdaa3d239cba32c26e5491f72c |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b81c0a478c99e6477231eba73103e5ab8ea3e35f |     
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a720ec7b6a806d9ce8aacda95bab34adf1f2088f |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d91bf72beec6355fb89ba3cb2bfae5b512269c02 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7d981d5c6978b7b53789db343de8141c09c11681 |     
  sparc64    |        pipewire-0.3.59         | NOK | http://autobuild.buildroot.net/results/2acc6dfd2d1668cf8123b9f0c96480c48b6455da |     
    i686     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/97fee08ba9969bc6e8364d3b2302a6e2d35df47f |     
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/0f41518afc85652b83c498bd3a3255e7e17ced7d |     
   x86_64    |      python-pysnmp-4.4.12      | NOK | http://autobuild.buildroot.net/results/8d9011099ac0b29b6768e010923f9cf8aaa7c116 |     
   arceb     |         python3-3.10.8         | NOK | http://autobuild.buildroot.net/results/7553bf73249c342a91650bc92e9bc82df7110a6e |     
   x86_64    |         python3-3.10.8         | NOK | http://autobuild.buildroot.net/results/3cafb963927e3aee56a24f1ad769a755942522bd |     
  riscv32    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/be471754e1af59f662ff2ea73e58335c42589bf7 |     
    mips     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/d67db4c32ca4e01fdc9bf94646c5de1f2207d150 |     
   x86_64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/fffc3950ee052c2b2724a92495d6e0f7ec9565e8 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/ab8669f342bc027b680dfab20f6274cfe69ef73a | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/cfafbf0f7122d9b8e33d09fabd3152afdf7412bf | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/68041ffe679f526b776a1bbb8a2f828507d2639b | ORPH
  mips64el   |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/cfa34c4d05a8cb78434b028d6be6ef138f522f1a |     
    i686     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/76c5dbc49d3ba72487ca54c68eb332de32138b7c |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/9357d1e7d36fcd0fe03962fe2d953a3f6511a5f8 |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/4652eac4fa4bbd472f8892762bb2573fadc3efcb | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/5bc6ba632cf8eb1fcfa1d106cc0ee3c58ce15cd0 | ORPH
    i686     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/acdc46efb18da4b085926b492474a4b0fc83d0cf |     
    m68k     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/6bc0a513b63b5417fed6238c9edf6aac6c63d5b5 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/f0a2591b887daf7eab6f949e4b805cef375b9d78 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/620dea55583028abcc39c6fe11d2453f502096a0 |     
    mips     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/dd1df95af6c485ae9478670e13e1f2f5d7c7e6a3 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3e571ee6796fe77071ccf0c8a6803c603d82cd45 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/ab3bbb7e5df78c12c07d688e3ed535342a695ecd |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/36fd0edced6744cc1ed651e4ec964565ceb0b7aa |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/af1a2b405ad671fa905dd17330a774a344bb13e4 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/5c18144b606e1a7aba68315afbab935f178f3413 |     
    arm      | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/67a34f8dd7b5115bbe913fd14632aef025e95b95 | ORPH
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/893a90b7c0364b6ff8c8c77220af27b06724c267 | ORPH
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/55b53c8ed6b39317a5990a87bbcedbe768187bd1 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0c6e45e985116f4a3aa8d916c3094b5b31ce3f16 | ORPH
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d5745928e7855743c266b0b43f0147d09dee193a | ORPH
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8177359a6d8cdf2bf3ae98d81d2f6926855b0296 | ORPH
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2d84e404a888b2814e4d6b57461ef83387365e0e |     
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2baaae8ba6ad4503ab2127e8c14a9d2d63b0c0d6 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/364e3fd787af1ee700f52948ccfde86a981654f2 |     
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8ee41a89ecc44d92150a1a3ec51a709056ea7666 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1c30e15f5ffaac2f01946c507ee42337c8851963 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/56315bf49d0f28bdecaed23f5bc1059258b42148 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f274e0a04e0d122ab331f87bf66446adb9aaeeb4 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/de7c7f1601d11fc13127f29b4829e52ef8218fa0 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/788ea8de0844428af73a92dd195413eb9c8ad6ea | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f882e20313cfe08e31b9c9cbda102bde31b55bce | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8b82cbc7a87c2aed0d9f540abfa043cebaa43e56 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7447b7a515f8c8237c364c7a1d0a2f22fc8441a3 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fcab66b5e3e2a43062635b0d54778144e58391c4 | ORPH
microblazeel |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/ff35b8c2c6f72683a6e0f8a5110be6511b7c1a2d |     


Classification of failures by reason for next
---------------------------------------------

          imagemagick-7.1.0-51 | 2 
                   aubio-0.4.9 | 1 
                     efivar-38 | 1 
                       gsl-2.6 | 1 
    host-python-greenlet-2.0.0 | 1 
                libdnet-1.16.1 | 1 
               libglib2-2.72.3 | 1 
                libkcapi-1.4.0 | 1 
             lirc-tools-0.10.2 | 1 
                    norm-1.5.8 | 1 
            quickjs-2021-03-27 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9be13d643529a0b96214d6207dc0dcda3082c572 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c7fcbde7305146f70d00df98579251cf8c8e94d0 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/e19cc6b8690d147ee2d932cd759139cecaef08e2 | ORPH
  riscv32    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/fe3883d2fb9339b3eb54d3e55362d4e8f2be52fe |     
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8e30482f51d9c39f6be5226b5cdb43de1d0cfa38 | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9dc07d178a683581dffe0c8f3da6c6678735bc70 | ORPH
    sh4a     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/1ea29d5ee460e12d9a42666210c21869ca169934 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/78e74290f7cd1d18d51236c4b5085c5fa74f7cca |     
    sh4      |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/14bc38c8e657782724b01c634606e58f75505ca5 |     
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/bc14b65eba1cddfbbe90e5a16f056783cdd8451e | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/dd7987051c7f2ef399ec035232a51dbe73755260 | ORPH
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b93188200881f09ace6cbe79c2787ad25a3cafe9 |     
   mipsel    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/864ecdba44d4c46908045da39ec11e94ccf93dde | ORPH
 aarch64_be  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ef322213025089073e37c2cca01b9d5084c9ddb9 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
                 dash-0.5.11.5 | 1 
                elfutils-0.186 | 1 
                     frr-8.2.2 | 1 
             gdk-pixbuf-2.42.8 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
          host-elf2flt-2021.08 | 1 
               libglib2-2.72.3 | 1 
              libsodium-1.0.18 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/590acf8f1ee8e90f7437c8ae5c8dc13b60cc97ad | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9acd4c3240787480d5b299bb0c1d1d26560c3fd7 | ORPH
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/5d48b93662ab5b0562a0a6a8873618ec4780adfb |     
  mips64el   |       gdk-pixbuf-2.42.8        | NOK | http://autobuild.buildroot.net/results/ce4227273377429482e3b6474781c731e49d8b2a | ORPH
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/2dcd500d4aff3b137b90150aa8c94347583c4c6c |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/f15bad05ca8638b030724b10595bf6296f27960c | ORPH
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8e22a86f4f01980febe438429fa07ba769580302 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/571f149256eb7ae6243570cbd59ba0a5bdea9fed |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0235d29abc2d4328197a28f7b3e2859f0639cdf2 |     
    arm      |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/2e403dafafb4a587be649921711447af47edbea9 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/5d83240d53e161b9d1ddb55f3f9fda2a97807c1a |     


Gitlab CI results for 2022-11-23
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

