Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E03C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 06:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7A3081435;
	Thu, 29 Dec 2022 06:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7A3081435
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hBPYl3uZh7r4; Thu, 29 Dec 2022 06:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7054681776;
	Thu, 29 Dec 2022 06:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7054681776
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CAA51BF29D
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 06:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83EF160B1E
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 06:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83EF160B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tayUCga0F1_O for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 06:47:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD62A60AF6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD62A60AF6
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 06:47:09 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7676EC0009
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 06:47:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 06:47:06 -0000
Message-Id: <20221229064713.83EF160B1E@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1672296426; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vtoxmDQcFYahQmJyyCaSsSegnRrG6zT6As8FqEUtbWE=;
 b=AcscvyfFBCSwPj4OhvbaB5hijjIwFIIcoUtKIkI2VyOBZ+ofTJrNlXPj8F+EG0+72xcrV/
 ba1aD4cz/Tc/eqlZEPZssnLo5yh8Qj7V+3azx298rtdpav6CRJLG6ydwoRCdPfNp1KuOND
 oTimA4ZYpAEyNAjCu7JZLhiwGriwEUittXQG6W4NphBeSne8x5madUPoofgmsbqOnKt638
 KpEa8BeoqDQVb3YA7Px5BVEYPAO9zBxQ0nAkjgl3NDajg5og6bWbeDCGneh39wvl3gcvHn
 0BuYpjHwErZFiUk9DUDBGM0TB2DRZvHjwJ2CmxKkmvC4G4/vyzePKDI4UqtBLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AcscvyfF
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-28
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

Autobuild statistics for 2022-12-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  1  |  0  |  7  |
  2022.11.x  | 18  | 16  |  0  | 34  |
    master   | 169 | 365 |  0  | 534 |

Classification of failures by reason for master
-----------------------------------------------

host-go-bootstrap-1.4-boots... | 36
               host-fwup-1.9.1 | 29
                   aubio-0.4.9 | 23
            host-binutils-2.38 | 12
                     xz-5.2.10 | 12
                    fwup-1.9.1 | 11
                    opkg-0.4.5 | 9 
host-gobject-introspection-... | 8 
glibc-2.36-66-ga1dc0be03c9d... | 7 
                  jack2-1.9.21 | 7 
                    pixz-1.0.7 | 7 
       host-gdk-pixbuf-2.42.10 | 6 
              host-rust-1.66.0 | 6 
               libglib2-2.72.3 | 6 
                   linux-6.1.1 | 6 
           host-libzlib-1.2.13 | 5 
              host-pahole-1.24 | 5 
    host-python-greenlet-2.0.1 | 5 
         host-sentry-cli-2.8.0 | 5 
                lmbench-3.0-a9 | 5 
    python-cryptography-38.0.4 | 5 
                    bat-0.19.0 | 4 
                elfutils-0.186 | 4 
           janus-gateway-1.0.3 | 4 
                libdnet-1.16.1 | 4 
             libgpg-error-1.45 | 4 
                    norm-1.5.8 | 4 
                  boost-1.80.0 | 3 
                    brltty-6.5 | 3 
                 dmalloc-5.6.5 | 3 
                   gvfs-1.48.1 | 3 
            host-binutils-2.37 | 3 
                host-go-1.19.4 | 3 
                  host-kmod-30 | 3 
                  netsurf-3.10 | 3 
                  ntp-4.2.8p15 | 3 
              open62541-v1.3.4 | 3 
           python-bcrypt-4.0.1 | 3 
           python-numpy-1.23.5 | 3 
                   trinity-1.9 | 3 
                    crun-1.7.2 | 2 
                    dust-0.8.1 | 2 
             fontconfig-2.13.1 | 2 
  gobject-introspection-1.72.0 | 2 
            host-pkgconf-1.6.3 | 2 
              hyperfine-1.14.0 | 2 
              libostree-2022.7 | 2 
             lirc-tools-0.10.2 | 2 
            python-bunch-1.0.1 | 2 
rtl8812au-aircrack-ng-e7a4a... | 2 
              skalibs-2.12.0.1 | 2 
                       unknown | 2 
                wtfutil-0.41.0 | 2 
                  acpid-2.0.34 | 1 
               apcupsd-3.14.14 | 1 
                   bird-2.0.11 | 1 
                bpftool-v7.0.0 | 1 
            btrfs-progs-5.16.2 | 1 
                 coreutils-9.1 | 1 
             dahdi-linux-3.2.0 | 1 
           docker-cli-20.10.21 | 1 
        edk2-edk2-stable202208 | 1 
              erlang-22.3.4.22 | 1 
                  faad2-2.10.1 | 1 
                      fastd-22 | 1 
                 fdk-aac-2.0.2 | 1 
               fftw-quad-3.3.8 | 1 
                   flann-1.9.2 | 1 
                     frr-8.3.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
                      gdb-12.1 | 1 
                gerbera-1.10.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
              gr-osmosdr-0.2.3 | 1 
               host-attr-2.5.1 | 1 
                host-m4-1.4.19 | 1 
    host-python-maturin-0.14.5 | 1 
host-spirv-llvm-translator-... | 1 
                  lcms2-2.13.1 | 1 
                    libev-4.33 | 1 
                  libffi-3.4.4 | 1 
                libglvnd-1.4.0 | 1 
               libgtk3-3.24.35 | 1 
                   libnss-3.86 | 1 
      linux-5.10.145-cip17-rt7 | 1 
               mariadb-10.3.36 | 1 
                  matio-1.5.23 | 1 
              mosquitto-2.0.15 | 1 
                    mpv-0.33.1 | 1 
                 opencv4-4.6.0 | 1 
           optee-client-3.19.0 | 1 
                    php-8.1.13 | 1 
                     ply-2.3.0 | 1 
                 proftpd-1.3.8 | 1 
                    proj-8.1.1 | 1 
            python-rtoml-0.8.0 | 1 
                   qpdf-10.5.0 | 1 
            quickjs-2021-03-27 | 1 
                rng-tools-6.15 | 1 
              rsyslog-8.2204.1 | 1 
                 rtl_433-22.11 | 1 
                    sdl-1.2.15 | 1 
                  sscep-0.10.0 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-codescap... | 1 
                 uclibc-1.0.42 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/ea176c09a034ed3664e24db581d4e7c28762ce14 | ORPH
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/41d778485f1748245d00610b6b5200e30f6b8b2f |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b45ac41080e710718416fe698f1a02b1afabddbf |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ed8ba4957ec3c985f4b61387ae0d16582cef5542 |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6eb75604a7ec9e0dfba0fc3f56d3016f60f015ad |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5e07b7b23c8ebb20c480a810d293effd9828d6a5 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0c88b2f4b499c9dc9d1c3855df9c21c2d65c98f4 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/47286c3c4645cd52ca2c0ccee283d3b662d02ba6 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/68f049248bb9546a38d9a8e7466e22587a4626e6 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5c823a448add0c22647f3864755134807b446129 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3ae7c84d858f3684138c314f4358f51845f43312 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c5f399dca9bb22cc14d397773ae53173707b9a94 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3a4693f9ad01dc54534e5d70780698bd2a347456 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c508cb9a40c1f15619d2e044af33e80a9faa3754 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/afa5546e08101e0f43bf18262fa4961690296cad |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2a78f965d415b7e33dc487908d42823f739106b4 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/79b7c52b047a8d16120408106160a79f52a41b87 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/73fb4f11ccb1f0a71fedf3b8217321b2eeb52e59 |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e32f90e10b75d7291d4442d1dcce4422adbf1e65 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7bdfa62365d90c69db7031f7386e8403d0b6c1af |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/57a3f82373e6b7515f86da446d76181e8a9b5dd3 |     
    i586     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/480a38736f73dabc0c96a7e5e65f23187f1b31d2 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1f765647a478115fff1d3b6256a02db75d567dbb |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/360d4682a38520e87720aed5bf1809b8e8bcfe1d |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/188a2b980c8a7034ea2feeeeb0f11795baaaca49 |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/12746724e05a540afa77c6b91293aa696f052db5 |     
   s390x     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7acb918be1658f586d0a3e4eb052aca34578cfa5 |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6559c1b8f2fce4c9e185f64e5d2e0d49ce0a1acd |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/421190eaaa0476aa881601664ed9e61962b0ccf1 |     
   s390x     |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/4e14812ff288d34ddbc732c208e68aca2805f8e0 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/d1585d8bbb4f21bfe3fa59e8b429700c6602d0c8 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/aa334f265a007184013035822c16bec565fc1bee |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/053d47f25a83608c606063b46f4d0d3a9e8bae4e |     
   s390x     |         bpftool-v7.0.0         | NOK | http://autobuild.buildroot.net/results/57f09b84264d815f34e0df40c76f46d75be278e4 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/64e9300c00958b197794dd0fd02b8fc17a07fa28 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/3929b3911716cab526558599edaf9c072b6a363e |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/baabb9972f9e59bc5f10fa7fb34c21e4a6d5a77c |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/4dd315bb4587b65ca3a7ef84ac90834ca8cb519e | ORPH
   sh4eb     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/812e823277a042544a0d3989998f2d0879661af8 | ORPH
   arceb     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/e1f4ef2b392c0e7161390ba0f97d6eef3bd12e9c |     
   sparc     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/0395cd4448774d10a19f87aaa57a65dcf441b341 |     
   sparc     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/8a2edd90ef28e2d9108e3e3940d34e5a12f42a36 |     
    i586     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/3e94ca34e2adca5854b09bd1a3b4c42e6ae12707 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/2f46ecbb6eed4429bffd804a52479e41777a846c | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/f99538c0a01a2717e5c08d840af5726edaa0674d | ORPH
   x86_64    |      docker-cli-20.10.21       | NOK | http://autobuild.buildroot.net/results/1fd880c055c40ccc43eb41d8dfb7fb9674ec27db |     
   x86_64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/aeb98339aabe455549a3e9defdceb3e0d9bfe33b | ORPH
  powerpc    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/5457e3ec2c80b6156d4f9b38f0ff6fa8ce495dd0 | ORPH
    i486     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/5b06ee46e1cf9cf353f6ed2068ed50daa4338d61 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e5aa8f952bf48bf6a346140d3357ac7bff6c15b0 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cd8e8defc58e3442f75e8060c2e772b1cfe47498 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/96235ab1d99d888cd4e11da7e41a9c7b9c54aa49 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8f713833838b770fdcd3879c82f8a4a2b49bc423 | ORPH
   mipsel    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/ea973f8addb80a5b023477b18aa2d10c5a7ad5ee |     
   sh4eb     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/fb84b7cdc0452446816094912712118f5180bfbe |     
    or1k     |            fastd-22            | NOK | http://autobuild.buildroot.net/results/88c6fbcb42a859de56157284d285348b8aef08f6 |     
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/2aec519099f51e860d5060f1f0c089664763f389 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/47255bbfe6f0e59656a3ed154981f34ecd23eead | ORPH
   mips64    |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/5fdca634bd91441670a6a88cfa4a1024e032d59e |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b992736399350e555a29c598862ae51e2786e72c | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/71fc8b1366b3f7986896c7bdf7dbef0b1536bda9 | ORPH
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/b813a1cc33873c731eaacf33a479c6e448a2e145 |     
    or1k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/f49bee4e840eb657bcb20f24e2ba32ae2fe5ef45 |     
 powerpc64   | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/8ae2c14133e1f55023bbd8a0017681d4eacdddb0 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/55515f7e98ccb0a369766a2b73589542fc86b4c7 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/194f0dd51bb013c346b2624f9f057cbb7cea862e |     
  aarch64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/a63f562b1df5e249afbe08f3e3a5c96d0178f783 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/03b5d22b55230929185f1be8a571f81ddc457607 |     
    i586     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dca48ec714ff339eb98967a6c280ab30cf1eedde |     
  riscv32    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/369f02e05700ddd2b9c0d8a5e320a157a84c34fe |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0a6f92f39ca70af6232745fbeafc237b6c07c03a |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3f981a9e2e184b741eb3d222d1706b2314932f37 |     
   sh4eb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e7de62edde8c5e1371ad6ad66239ef1813c71651 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/924c90d64f3abc456f53ce59d931ce5d5710901b |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dfd7db81cc4f4124b2c117889e69f27d23dc7a83 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b6055d838faaf8ff8706601a96f1445a39988541 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ec64c2c4cd77acfd740a550ff9536ec6c376cbd0 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3451fec70a9e4811c5a5304f2bfd76db4dad2af2 |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/c273f276f70c505905820c9cd39be71729986cf2 | ORPH
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c597dbb8ec1b765ee0b3cc70c21dac7c8f5c4f88 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8ad92389b069f17e00a840a94677360daaa87d34 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1ed3673106b123b7cdbd59190bd4a5ddb68a56f4 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b3d496cc3fc5d738135cd69b12ba09484255322f |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/56a3754d5e5665dfd938b662add0324d677aaa89 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b8faa5291e06195c33b51d6f59d6487464354b39 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1c10dbd88bc63a43c90641186e392383c7e97a96 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/34948c20cbb80c8030e7924309515413c86cebb5 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0fcda786babf096f5b5e7b34692ead34ccea7ad9 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2cf502954b64b8d0e51f95a722e232dfec9688e5 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/26878d4b168986171a7758b321300bd39645dcfd |     
  mips64el   |        gr-osmosdr-0.2.3        | NOK | http://autobuild.buildroot.net/results/5af61d6fb8f8c5d5f91c74a6ef66800236d7bf12 |     
 aarch64_be  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/57e0a962ac918cd6a7a87ca6b03c6021a847dd44 | ORPH
   sh4aeb    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/ab0c2a5ed565659232a38228823aecbe2b022487 | ORPH
powerpc64le  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/895c904322fc4e5eeef7362d500147d2610c0285 | ORPH
  sparc64    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/69640d7e9e81eba940b469f93adc36ca194fb569 |     
    mips     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ef9112bdb40093631aaa3683b9adb7429a8fc792 |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7e33b84cf792135b8f827d4516c4f9507824bd46 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/467aaeefcc9830fc73e09f072507b3afafb0045a |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fbcf242423c11b320ca346f42a5b3e0128a3394a |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1ad430829cb10b080ac83c1deea6df00a0c87d98 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2739d7b28d43c0ddf818b042b699322ee80bf280 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4103bbc24d452612e6e828f70b51943c9cbf0c29 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a129d648e5af8d8fca2a75e823ee2c813aca045e |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a174e5ba65cbb7411fd0124cfb67ca38b70e0f18 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3add6e053062b4efce0f7d20dda5513f6790be49 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b6ae225039809476509e4e1a090431d0175ea072 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/19e17d8592c77abd3ca01691b7bc796282e7e61c |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/318b533265ab906a27a64483c0e4ba7806199c26 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/35b08393a97b1b96184f0ccdea4b2ad80e924409 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6aaa6f41fd1460f2f5506d515849d42d12852af6 |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f8a67424e59d2b572a321b48daaceb5fb15ea8de |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/641fc7ca428a13324cc3bbebe72bfa9121d4ce90 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/24dfcab03d5e3966c56b36e6fcda24e789e82aa0 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/05808f8590682f0ca6484205c7baa458ff333d49 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b62d991cff4ec1e3aabb7b19dfff0aa22c47c44c |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/01735d59fbfb4e4cf13a75d336959aa40201f6d0 |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cb6a27c6e00fe56a2ec856601541c3ff60168d03 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8639a7de6ba5659f1e0260f1b679db493e781023 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/65d1ae34d7ccdd2ea7f9404bedcc554677d4349b |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e79770e5f566b8617077b5dc461425bd9186bd86 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/84e06223d02f479aceaff65860b7efd061775b6f |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8cc011aefdeb5ed63e2554deae21645616b1c555 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7bae8ee24a19b5c88ca37b566d48c378131174fa |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2b4eaa0ee3cb8064b6623c2edd813e13df25b3d6 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/25c035a099b2e1920c745221f8f670b24e55918a |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d58e7b73adadb15330e9367168a4097a679eac68 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ab441c5a33d70b3695376e3a361a75101156ae0c |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2f2f17c754a5743bfe70e21d7393197c2b518d2d |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6a80142742c841e9366f5bb17c4ba9b1281b1885 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f5bffa6a6bc109096d021014985a33cfb2642fae |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4c9ab1c47b5d45ccb20b60cda0ce88fa52e93673 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d692dcca8d832bf358bd5ec1156348daad945fd5 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d68e58757c72f34cca7844e1dc6fbaeecfe7cd85 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3ee785acfee25485680e402d037886b996a90c49 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9a95e74c08f096025fd45ff5c6ffdaf650ca8519 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9b292eebef409bafee581a98f7d931d016b4d404 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e614efe7da3810a500eadc0b5c6b32db4aeef550 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4d21d0e321f6bcb601edf5982d6b4e81f2251801 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/667335823ee9aa73c138bf63eb1b3b8ea793803a |     
    i586     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/6c57d58d29901a3ec77160465ac3115f3231f645 | ORPH
   s390x     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/840e022d2b81e3d9f17d7fc66fb399afa24bc8bb | ORPH
  powerpc    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/afd9f5e614358720ba37b7cee141eb6bc9db32a4 | ORPH
   nios2     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/c608c6101033431514610a8a9a5b7fc1b929ccab | ORPH
   x86_64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/fb1447bcfac81cee34a6523549dc6ee2c9b6f77b | ORPH
    m68k     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/d27ea1a8ee6f1184ab81b6a6e4d670a277e85f6a | ORPH
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/2916b2995f7d32140658f4c1848d033242caa2db |     
  aarch64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/19924031d455bb00c990b9d6af2bf873cce0ffd3 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/e41523a229b2151bdac1e41cf9079e68439f1e51 |     
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/bc70a9cf7cb1b00f12107031931caa1cd4291d40 | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/4d3a76d0576c1443132b2861e5d193190014268b | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a6cff3aaf1053ec5cedee97f7ed3765d03bbeaee | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/365160830d7df6bb801072f74bc1fa7a5a938811 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0569cb0a9296ab8cda5e15f2480bfc893d8228c1 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e3fbf2743ec8e9a99c5350a56be3de50e668747c | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/29d6508d8b9ad12fb66a4eecc38e6f45516350c1 | ORPH
    arc      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5c60a05bb84b9f518b411202b984303ec0b4912e | ORPH
    m68k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c994b898db1d1210198f0a813ddec71ea04d27e2 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/baf8b5495c38b0b92c5b1d241342aeed3a8d0e51 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a0e885b0aa235532a47b6d60020c56707f5c0f2c | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ff0aae77457f8fea0907097c2134d2d5a2d1a18e | ORPH
  powerpc    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d42e1f27be993ec41983aaa0a8981847d358556f | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/22f33afe3a6859093c8949f010461c86e165ce6b | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3621257b78da1786200c64e1f2e86787ddc2b72a | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/defbfa2dacc873598c549f9a72086792b505cef4 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a300f92ec8abb2a3da22840250ebb182a23a5d0c | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f263081bf6801c2797be708d31b263f2370339cf | ORPH
   armeb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/71a2745a33cb18433b8c693ed1d47549bc4ecb15 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ac5a46831ec97059d1163204dd651f82fa00c212 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/deca3d1d8e2380c8b56f4236f8fc1b6fc7b7486e | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/490f6ecd523f2aa803043a94d8e3656f1a9d4918 | ORPH
    i586     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c0610a7457778705d67be54d73062455dc7b0dff | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/485eb3fbab31f6cf627bb68ca43dd7b99c89031e | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/83f6f351a21fe768a065ea4c40b3383f6b7cb267 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3a3edb8d7ab90c625e557559f2976207ee1ed06a | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/4438758a24a16dd56a03e842b1dad30d7aa0e10b | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/45ea84d3d73aa5490cbddbae4ace11160b752598 | ORPH
  powerpc    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/15974bca485670ccfe19e9dd693b0c6edad2d132 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c8a581fee4d34b59d7f3e75c21085878f1a6959a | ORPH
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fb2fa539c59eef4db19687c85a5174f5150bb9b9 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0f18ad76649bb3ff11f60bb3ed11b5b4487960be | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/18d51152d103f029f6523b0e3982d86e94421123 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a249e8f9417b5f53e36f949d8da97682c745a2b1 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a4d0ca2484eee8b391f0194136c3fdd2c675890a | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7c9f94b7dc6a83d6f15e86e26e801015974fc091 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/7dae919f9d3b0234baec0fb6a1cb2339a18cf365 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/fd50d8ecbccf5326857cd3abdf99fe12888259f3 | ORPH
    mips     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/d43441f2e45d6cc2b51053dfe58c07356e41cadf | ORPH
    or1k     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/924f9d204086c36bd1216d79caa923f03211a0c9 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/d37f9a839239abef39489ccd5ebe908ec05c870a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/340c876f6aacc416aa1e1de058a487d5ade750ac | ORPH
   nios2     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/97cc63d6862e14073a2cd829185ed7d6ac419160 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/8e380762aff7ea1ef7cd701abccde48418d8e821 | ORPH
   arceb     |          host-kmod-30          | NOK | http://autobuild.buildroot.net/results/b3db2139121feaef12c84f5dc3291b4624ac9305 |     
    m68k     |          host-kmod-30          | NOK | http://autobuild.buildroot.net/results/0c12f292a9c54af0836300b0a59f472891ceb12d |     
 microblaze  |          host-kmod-30          | NOK | http://autobuild.buildroot.net/results/9921b0ca43910f9f6afe89912b1d630d1a71247e |     
   nios2     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/73e56432a7e4e8abf71b08da58fefc1c646927ab | ORPH
  powerpc    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/fd60a17146f7be1fab8cbdf0d108c3750e9adc13 | ORPH
 aarch64_be  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/90e02535f9e754de2a6f4f7d20de6c8f357a3efc | ORPH
  mips64el   |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/19f0097909fb5c49cd0dbbdc8628d2c02bdfe73b | ORPH
   xtensa    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/37c9969557f9a932466136a3f9d6438e33df21cc | ORPH
   arceb     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/a9e71d6f1bd6b7ea3b955e5fb86a0036092ad41a | ORPH
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1a5ba67b3b0bd5d041bbddb5a1941e8b208b1890 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d2159a6e640bebcd964e9870e9233cf44b3d49ea |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8353856d4f1dd866426e5f4eed2791bb82a1b006 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9ed57046b4b20e6a142526487b3ef2ddc7477ebe |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/adedf1e283291d43628f7b63cbf3b1b3388ee45f |     
   mips64    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/7534d3f7cfc142adb5b93c64adb5d770f8e00f9c | ORPH
  sparc64    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/c7e2fbbbb417d4691b6c5b9767035a8322f4883e | ORPH
   s390x     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/844158b45ba43977aecad7c7e7828b4d44736c6f |     
    arm      |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/33af663ff3bdd8eb7d5d53e78d5e146eafd639dc |     
   arceb     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/1c7175c26e0b916ba79593821333654eeafe86e4 |     
 microblaze  |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/22dedfe5be99a27c879a996cdae0ac5575d54002 |     
    or1k     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/6536225292a22321a80e58c20a7048d5c9004162 |     
    mips     |   host-python-maturin-0.14.5   | NOK | http://autobuild.buildroot.net/results/341c3cff995f5c38b7951897a935bcaf7d0e6af9 |     
    i686     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/67673f0be58742b8b751a04c814166f057dc6788 |     
   mipsel    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/5e5a34b1366ce65b9af151bb8807dac45753adba |     
   x86_64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/16c3ac01f761cd8992a5c0ce9a931f379452cc99 |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/4dd07165ddfd65318f0f90c1bac3fa08fc86cc10 |     
   armeb     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/bb33d4ed3f743c0e031ff89f7c978f52fd5c5d09 |     
   mipsel    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/195f8e65b2c5bef143122003bb0564d96cbb4bf6 |     
   armeb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/276810fec55c6d0a3407488c8055b8ef2a691e73 |     
  powerpc    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/7edf00738aa3a3424ac11df20953b10b31701c3e |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4c7df2431bc5e74fbc7eae90d6f54ce8a0bd1df1 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a5993ea3398e4b8fd16bc3c0b697a48a40740fc0 |     
  riscv64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/9ae4e03861f8966754b650991eb58e870011d477 |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/e0d9c2302ba8301b0017641e89ab4b67e7376d6f | ORPH
  aarch64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/dfb4755c8d0d609229c94d38b5babc710a845e9e | ORPH
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/5510f6d283364cbfd80eda10a9ee6f9a9a24c948 | ORPH
   arceb     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/098ea41ea89a0b4aa012554bdf1c91db99c2c563 |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/66a786dfa2c781a3d4f267fd53117fcd78069fdf |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/2755ca58ba2ec0a3028fc83e96a54f8b7fe1b4fc |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/bda48f1f2908f225ba699ba55c83c92e1d1b57a7 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/493de3263512d6b8fa0a5f72680585b94dacdc50 |     
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/79ddbd4e8662f37567028d3a83a27f7e9d11c9ae |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d4bf3e11eb644a0f90eac1cb311a501b0e6f14c0 |     
   x86_64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/e7661461668102caf5f97360681dd7c399c7a630 |     
   x86_64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/d6e95a04ee08962a47a995e033be86ad740bcc6c |     
    or1k     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/b594e5993589bca8d73512b7f11e247b0216b36a |     
 aarch64_be  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/365d23bcccc994a44420bcfba6fb678699107b52 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/9a6d30406082ae81a34f98f6a9302928d7790ab8 |     
  mips64el   |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/a22984a8b6a9d0610f71ea0a388b3505c425827e | ORPH
  mips64el   |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/401c245d265bfd424c21ad7489700bedbce9c20a | ORPH
   mips64    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/9358742909abc0ee258cefae63acf917634591ab | ORPH
 aarch64_be  |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/78dff4b514fb7c510f5a745ee6cbbc049ceb2794 | ORPH
    arm      |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/f5542c02ed3d36dfda94a637e6902bd3ebfe7ce7 | ORPH
  mips64el   |          libffi-3.4.4          | NOK | http://autobuild.buildroot.net/results/4990569672565b0d47b20e9544b3c7b3ccbb30ae |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9ed821f18678197bd6e5c301a626082bc8e0ce35 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6502425e1849bb70a61599b780ae51e144a1a00d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e5e6d28c90e88b324f2b3e1b1cb0729b043d034b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/56026217f055bd2d8ced9965160b7f9950bbb0e7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c92d4577f1c7cab0c55013d1bd6fe44d059487d1 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/766c72d7edf1cfeb5adabcaa6c4e0bf15c5fe98d |     
   mips64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/bf4c67a2e8751d36fb036d01105bc2eb6ea43a23 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e8fca671a931d33d5372c7a46b56f48b82c353a8 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3ba56ef96c0794a354c133037aeab488758e8ef6 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3a96f16ae698a2de6985a1b991e289a07361108e | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e31547f9656e62e9ce25320ec851487951918777 | ORPH
 aarch64_be  |        libgtk3-3.24.35         | NOK | http://autobuild.buildroot.net/results/2d178c4f1efaa219b184cd7864a538184f452a96 |     
 microblaze  |          libnss-3.86           | NOK | http://autobuild.buildroot.net/results/903da2f397e40536bae4724fdd0a73f9d99f40d9 |     
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/c78b8e87be9ad642119ac0c26c5cc89cbe62606d |     
   mipsel    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/331707ce76e7642eac00584a2fa11e0a24dfef3d |     
    mips     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/63e3ffd01f29c7626f2e794c307dfff8973ccb1b | ORPH
    mips     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/9c6a2831bb20766e545554563d55dfd98bfa8dd1 | ORPH
    mips     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/25acbf28e46ac284100bcddb3f073e686aa831c0 | ORPH
    m68k     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/9286689d9b6dda375cdb7ca5308bb2e77959a8f2 | ORPH
    arm      |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/2954e8fc16f6a7e85e07e482c1a380565081c9b1 | ORPH
   mips64    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/49c693e0828a02d7fe02ab5d423a5515a72c8de6 | ORPH
   mips64    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/c7a0c2f8bbdf4a90dbc0a8e10c07e1c7312c77b2 | ORPH
    i686     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/fdfd77947d14ac48c9bc846c8a1df10f57142838 | ORPH
    arm      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/42766dc02b3f920707d219978a0fec8305be738a | ORPH
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/16beb10f15360917aa6bcc311139dd67c066933e | ORPH
   mips64    |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/7ac449b63a60117511c29f41d7dbefd2c2c77214 | ORPH
  sparc64    |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/c1e9e5489851336069d2c4d7a4492cee2a1f5198 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/49494fc57a7590176de4939719817961e05f3751 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/0b9166314e83c6b73b1d242cf26d7ee5a28fee4b | ORPH
powerpc64le  |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/40b4860ce6894fea7c349813aff2842958431f02 | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/26d4436b2f002c1b66aa1d657fd3fc1025260670 |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/1636968be0c58c4049b3afe5bad11e712e1fb809 |     
   armeb     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c0c5b04bde6af56466f3761e3323cade5a49c5fc |     
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/ab35bb46ed4210f40c8d09a1dcd78ccd0c36ea5a |     
   mipsel    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/f18c8ebee286dbde576968e8b028ed048685e14d |     
 aarch64_be  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/db53e5157d1bace7ae64a033b1e8bf61f1299ab8 |     
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/a92759938d1df848e54c9c356b8b9e20c10a660b | ORPH
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f576a7ed4b90e448aaeb9ae1acd857eb112f9f64 | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d124b8b1c9148ce2cb954bfc0bd29afd3baf7e22 | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ad2047464c203974e014e65421dc98ea36700443 | ORPH
   sh4eb     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/183bfc4840c1adbdd5ee39dd44cceee55c35f4f8 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/b085283542475d7ed11a95f46d4a433b40b5f0f4 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/d8dabff279fb9eec66c5c8f29bbe1df3df94cd5f | ORPH
 aarch64_be  |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/bd82368c91dab058d8dc67a8423f9100520afd02 | ORPH
   armeb     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/979242fdfd4e01a0a33e48d293ba6805d018e6df | ORPH
   s390x     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/5fcc48e126e0eb9e15d8afb58f9d33f483ca6de5 | ORPH
    arm      |         opencv4-4.6.0          | NOK | http://autobuild.buildroot.net/results/846f3bb3b14db2ac4ddb9b006deda797a83a9fc2 |     
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e4ec38c5b952cd17e9139ea865d3d104b53c939d | ORPH
   xtensa    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/ce3df1ce6d5453ba1e4be3f1d5fb0641943b4ed5 | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/646a3b48293d20f57ae832c998691f00263f1221 | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/55885c34bd708356aaef9f6b088c2a4594f0215c | ORPH
  powerpc    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/0f4c289dae167f20039ab8c5f807da2ed5ebe958 | ORPH
   x86_64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/b29596bff0a235126bdd34992143fda1e9a69847 | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7746cbd9091cc81b0e7504c4784e3d8d86dfdb26 | ORPH
   sh4eb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d8df0253d5be08b99c797d52ae0c6b8de9672ab6 | ORPH
   sh4aeb    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/26d592f33b7d39ffd585ea3f5519e9d1ce3fc9e4 | ORPH
    arc      |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/76f464620cbf92a96e66481643d61889324ebd2a |     
    sh4a     |           php-8.1.13           | NOK | http://autobuild.buildroot.net/results/07eb8792687c1e6e5aee9fead884d83f7c8dce13 |     
   s390x     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c90283fb208046ca6fd7f5f293bc2e0de0f64dd6 |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/b8b64723ba052202042ffe0410cdbfcb31d21377 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/bc133c37169274be320de0a99d2b96868d765f9a |     
    i686     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/959bec1c04e93b4c47dee30092a7752933c0d20b |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/6cc8993771497da94fcbfa11261788a1ba8022c4 |     
   mipsel    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ad2b7b849303baff122a3f36c5550b8d8cf2659c |     
 microblaze  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/8c1afb81f9942500c893238d8b98448ee725db70 |     
    arm      |           ply-2.3.0            | NOK | http://autobuild.buildroot.net/results/c00714847ae92dd609bc8990df318bee58be38b8 |     
   arceb     |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/aa5dc820e1f3c1c1f74ce6072ab83db06ddd5a6e |     
    mips     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/ebfc70c05d39fda380473047ee74034ac93f00ba |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/ae111b5db864c6854302c2fe26fa8e0826cab6f2 |     
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/82dd40c294f67f89d68df4c98743f6f78bc010ee |     
   mipsel    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/a7226e6afdf87b41093e4482f4e8206abe2336cc |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/15367bfc942e23e92aa73b031df8e0bcb9dd237d |     
   sh4aeb    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/5db7526cdc199c72c4d8737e1ed538acb179f5d3 |     
  powerpc    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/9638d9991ab195eaea5b9f0d73dce8c4d558cccb |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/cc70d3dbfb44e0c9aab163e209f40319cc59a60d |     
   x86_64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/2a467f485500eb4a269f6709784c442478d530db |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/c3f96fbe05d67f5c62cc1441c9a5b0ff3fe5cf2d |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/a59c9b2a9a9aef28e2fbf0a8376a615a4d27b7ca |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/5e90c878073f327fa9fc3c2ae9d94501c14915c5 |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/83078965c007b3982ea541e59a8af3256c76919d |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/eae7a8424db708be6d601e3e00bdfcf703322700 |     
  sparc64    |       python-rtoml-0.8.0       | NOK | http://autobuild.buildroot.net/results/df8c176d4022701c7d53abdd7d8bcf96f9b7f9e3 |     
   xtensa    |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/ec033f564af100c010215d14e68afe7e422a4fd5 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/87b4e9e79e9b432368979673aec6af73a86907ce |     
    arc      |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/a6f1381b3d1aa2a27412286167f5c8be5f6fdaf8 |     
   mips64    |        rsyslog-8.2204.1        | NOK | http://autobuild.buildroot.net/results/9e361eca9c73936bb1bfe9101878332a61639b2a |     
    arm      | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/c38acd06ac3f54b15e7864a4a10cfbcb29a31cd5 |     
    or1k     | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/4f65b521d5c6cffdf5f6294ce0257b9a19e441fc |     
 aarch64_be  |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/6b8032878e136e45ab19503fd3d0cc7104e9b5fa |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/89b7173c0948364528a6aea677dab433145915d8 | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/160a95806ee80b3f563514edd4880e58be0a3f2a |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/729b2669cb1eca15801c7506b75e6102b1a40c79 |     
   armeb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/03db96a8b78492e6ef5f82433e0bc18713dc7c12 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/71c9b7f631f0d1d1e6636979191499e014638245 |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/3006b36eae3201c8ba3afa645c99feead76d7d95 | ORPH
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/679d92b54a5ab2103ad11e89ba8d54e4a1a124b4 | ORPH
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/19385abc39da22df3f309a1f1840cebd39f6361f | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/cb754afb0537705c4ee37e8ba655a9402876bddc | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/127fbfa743c169ffa7cf60bebc89058a67a093c1 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e46c96cf6665f45f81af829803252b9a1b7b2ce3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/440b8acb396351bf240283e9b9623773cdb281d7 |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/e3c1d3883d204326c6c0725cf5e59c9d9708e598 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/7d0148b00e9e8a40b3431a6a75d2502fb9105fd9 |     
   mips64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/2e565be3ead08f8aeb8360f920daa5176b5ad892 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3522c09d311462c20dae653af2d415451b04c7de |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/23cc7567efacfbf33f9142b53df0f0e3c055ad11 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/91bfa7820c9173507bb83db1e36751b1925b1abf | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/db8a3bfad5cedf21096ab5bcedca92bbf5eb975d | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/014de961905c3be163b6ae19fdc8178f93bf7472 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d2bf92493740e39984ef69e923a074f15a01c2d4 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9c370ea61fa9abd42484f9db6a9bbdd06c4d603d | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2a15acdf6ba893efc2752ede8ce9328d5ccbf78e | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c5fa8f17b81d506f5c339bbb704a7f2aa2da6c1e | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/024a9d3d3d2efe6db33b3e946f14751276fe0b8a | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b4763fbf8b23352bb8ba9ffabb13da17c7307528 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/53a4399dd3d73184c856f81f7bf0356d84b310ca | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1bd79d75aa38e482b935398b33c89cc195899cf6 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/cd30c185a6c482ed9cc8a3a402a0af37d56adbde | ORPH
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/04e549385e7391ef65cf61db5943d319ab31a326 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/acd2c5714cc10239fd2cd97fd8fa0550d5fa5b1d |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-rust-1.64.0 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                    gdal-3.5.1 | 1 
              host-pahole-1.24 | 1 
               libglib2-2.72.3 | 1 
                  linux-6.0.13 | 1 
              liquid-dsp-1.4.0 | 1 
             lirc-tools-0.10.2 | 1 
           python-numpy-1.23.4 | 1 
            python-sip-4.19.25 | 1 
                 wavemon-0.9.4 | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/975aad82ddfa38a3fad5b037e176d62004efc782 |     
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/64cdbcc7b1159767a90a5827a12e05ad416787af |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/16538492db25b35f0e476fccae0a2bf4917685d1 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/82e6639853b545f3f9db7bd58cd8b9f0d3967e57 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/1d526ceb9908c37d386a45ff3ab3c12fea839212 |     
    arm      |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ff8d1fda3ba982b8666b7075a3ee306d9e9bb18b |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/98abd085362d9a1b9e6bfe4fd1ef05a813dd1b50 |     
   armeb     |          linux-6.0.13          | NOK | http://autobuild.buildroot.net/results/9a324e644e5187901f36134745a7027cb0362078 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/7a11b23feb8fd8155fdf8bb34b84d552069a99be |     
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/4ac6c34d423a5d9fe6f42c4418a36b37a3dcabd7 | ORPH
    sh4      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/6f35659fe84040ec0b8985f262f093ec6f358838 |     
    i686     |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/d78c3e84fa172e875c9e6e29f8da69a63c3df099 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/542c026fdb8b61caead393a408d871c553232dde |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/47dea4f12082c2c09fb6730120d0ea01c5d05bfc |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/76ed01364a971ddc9fba9b231c6c5e9a67389e50 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b3bf8e3eed32416dccd0559f0687bba48c8009fa | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
