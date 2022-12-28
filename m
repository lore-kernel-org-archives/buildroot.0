Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1992EC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 06:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874CB813EF;
	Wed, 28 Dec 2022 06:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 874CB813EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlCJNxPucHXs; Wed, 28 Dec 2022 06:56:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30AC0813F0;
	Wed, 28 Dec 2022 06:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30AC0813F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD401BF410
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 06:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43CE6813F0
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 06:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CE6813F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdFUR8vSwfdX for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 06:56:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2B0E813EF
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2B0E813EF
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 06:56:39 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A920B24000B
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 06:56:36 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 06:56:36 -0000
Message-Id: <20221228065643.43CE6813F0@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1672210596; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DPBnD8PdzRxZfqieo4lgND4ZKeMOxj/TOScxS0VTMfg=;
 b=cr+cekrozUHaQOoG4enEBg00GAZOI5edUrVTUR/bTPLWxiZa5cRFWnK81Uft0peDFExO+8
 TCqiTGqwgJEN4MlqUrqdvc5oqB3RtM5rVZ3RXym7W4WTcakWbrqBZCs1V9fbsfKW1Unbbp
 kv6flwc/thJOeLnRKrfkm/A4b0Y2WplaJ+czIJTgN/oCwzROYNO8gMdqwVVUdqq6gM7i/P
 +PyJa+OxTXro/RLvoQMsfurSMioNZMNoidCv34LIO+a4jqyw4VxG6T3Y02VOWGKLeYcrUy
 frUYXA45qie4t7wlTXJGlbLi0J1r/M/wWPSzfmJCokA6d1Fab2zvRe84R2DuhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cr+cekro
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-27
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

Autobuild statistics for 2022-12-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  0  |  0  |  3  |
  2022.11.x  | 12  | 12  |  0  | 24  |
    master   | 178 | 343 |  0  | 521 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 40
                   aubio-0.4.9 | 35
host-go-bootstrap-1.4-boots... | 29
                    fwup-1.9.1 | 15
                   linux-6.1.1 | 11
           host-libzlib-1.2.13 | 7 
                       unknown | 7 
host-gobject-introspection-... | 6 
                    pixz-1.0.7 | 6 
                gerbera-1.10.0 | 5 
  gobject-introspection-1.72.0 | 5 
                   gvfs-1.48.1 | 5 
                host-m4-1.4.19 | 5 
           janus-gateway-1.0.3 | 5 
                    opkg-0.4.5 | 5 
                     xz-5.2.10 | 5 
                    crun-1.7.2 | 4 
glibc-2.36-66-ga1dc0be03c9d... | 4 
            host-binutils-2.38 | 4 
                host-go-1.19.4 | 4 
              host-rust-1.65.0 | 4 
               libglib2-2.72.3 | 4 
                lmbench-3.0-a9 | 4 
           python-bcrypt-4.0.1 | 4 
                    dust-0.8.1 | 3 
google-breakpad-c85eb4a59b6... | 3 
       host-gdk-pixbuf-2.42.10 | 3 
    host-python-greenlet-2.0.1 | 3 
                  jack2-1.9.21 | 3 
              libgcrypt-1.10.1 | 3 
             libgpg-error-1.45 | 3 
        ltp-testsuite-20220930 | 3 
              open62541-v1.3.4 | 3 
                    sdl-1.2.15 | 3 
                  sscep-0.10.0 | 3 
                alsa-lib-1.2.8 | 2 
android-tools-4.2.2+git2013... | 2 
                     frr-8.3.1 | 2 
fs/ubi/ubi.mk:51: /home/aut... | 2 
               host-attr-2.5.1 | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-11.3.0 | 2 
               libcap-ng-0.8.3 | 2 
              libostree-2022.7 | 2 
                    norm-1.5.8 | 2 
                    proj-8.1.1 | 2 
            python-bunch-1.0.1 | 2 
            quickjs-2021-03-27 | 2 
                wtfutil-0.41.0 | 2 
/home/buildroot/autobuild/i... | 1 
                    bat-0.19.0 | 1 
                  bind-9.16.33 | 1 
                  boost-1.80.0 | 1 
             containerd-1.6.12 | 1 
             dahdi-linux-3.2.0 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
        edk2-edk2-stable202208 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
              erlang-22.3.4.22 | 1 
                  faad2-2.10.1 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
                     file-5.43 | 1 
             fontconfig-2.13.1 | 1 
                 freerdp-2.9.0 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
                    gdal-3.5.1 | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.39 | 1 
              host-pahole-1.24 | 1 
    host-python-maturin-0.14.5 | 1 
      host-uboot-tools-2021.07 | 1 
                       kmod-30 | 1 
              libblockdev-2.26 | 1 
                libmad-0.15.1b | 1 
libuci-4b3db1179747b6a67790... | 1 
               libvorbis-1.3.7 | 1 
          linux-5.10.145-cip17 | 1 
                   linux-tools | 1 
                    mpv-0.33.1 | 1 
                    musl-1.2.3 | 1 
                   ncurses-6.3 | 1 
                 nerdctl-1.0.0 | 1 
            ocf-linux-20171122 | 1 
                 openal-1.22.0 | 1 
package/ncurses/ncurses.mk:... | 1 
           proxychains-ng-4.16 | 1 
    python-cryptography-38.0.4 | 1 
         python-greenlet-2.0.1 | 1 
           python-numpy-1.23.5 | 1 
rtl8192eu-94bce7798bbb18de6... | 1 
sconeserver-8d1935919a20133... | 1 
                 sudo-1.9.12p1 | 1 
                 systemd-250.8 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.42 | 1 
           v4l2loopback-0.12.7 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
             xlib_libX11-1.8.3 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a5ef43468af18a60881852fdeae24f60c2ba5ca8 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/c35a54951d4f19e5ccbe6a1346e634c26d39313e |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/fb44c419df4ceeef5afbef8e20e168fedfd63ef9 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6a33731ed4d8e8196b5d5ab40434f5ba37c84e66 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/81ebe66c20791f2a008399c4d262cad83a3ce6c5 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3021ecc4bf667b2db618bdae4b2544e189824901 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/68368ae0eb095843589643cc56d979ac0bab8445 |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2e16ad8cadaba392fe460347bf26c46a53a58cce |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/84ed12b01ff07a0de86de9eeaba9e627ef1c6ed7 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6bd6205dbbb78d72761fc176eba71468ef756610 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d5e53956bff58ab7f832f6ac20f7947f8a16052c |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c444411b50f535346d00688b05fb0e73ee3540cf |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6c9a4c41de8491adfb549c6cddf87ae91c4c9e2a |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c17b7f1f11bdb5fdabd652e3f6ab1165c9386581 |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/cacfe6773622af387c606599ac8e693cfe18b05d |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b21d0933b43aaaa7a650772133dccfdc414061d5 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d55527a0900ae564938cdc0249f8733780b91972 |     
    i586     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0de5e456978490969c5035b88f18af5e538eb006 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d5a0cf4db707bb47f628aa966c3e457b192d25df |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fb50d859aaaedaa2c497d9bb9104032a97afed02 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/be8c249bd7429aeef7ce46d86bbbef39f8d24fbc |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/dda4f84fce47fc8c423d66500284277a4b6d6243 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5966dd4266be0570826e396b526face2d489ff2d |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/35e6ca4b40b08edd8747dc21f95ae9ed608fea81 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/dd8c11d5d1b578eef32fc2867ca7484b6a79e302 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4e3ce20740f43669ef4c81dfa506857f2c9a2706 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6e2e2c0a6fda404849740eae6e011537e13c0aea |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6fd0f2b9df0f7c6351d755d8a20c092e3504f89b |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/368d608bdc7f74ba2b9edbece36d579969cea06e |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/8c0ee1d0fe734346d2a8c7cc874ff441c79d8e48 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6aa094e30728fb3a2e2a7ec8503d43b0d05ef9be |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1fcc7a5bc19e568029e47614f84f2f19186e66ec |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/46824ccacb4ca5221a99c8c07946540deb4ee7df |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9181e2de53ed9aec4fb849dfaaa2106588cabfa5 |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/df02c586f90917e19573f796b1b83ae9a079fa89 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/8d02fcda8682e49206e56ea6337a8a990bb365fc |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1009ca2278be64cdce8f06aa9e22c8a4ac6415fe |     
   sh4aeb    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e5e4ffaffbc1b706b64351e7d2533ffafc5d1387 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/27dccbf89826d8beb07cd434c4177f0e499bd25c |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fef03326ed8db8eef944aadb619c3511b8ff34a1 |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8b4e92d61e45588578294bf6c1f60ecdf845f6e6 |     
   sh4aeb    |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/34f3d2ef0e4bd5908bd1b0856dc8acc56bce56a2 | ORPH
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/64c6b014660aa3968210bb5ebd86f146c8b8e229 |     
   x86_64    |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/a8e378d10ba52183fc0a0c4bf8950647bba848d7 |     
    arc      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/316db7e360db5d4802947abe02a97ce7266ca371 |     
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/6c34195256ebe0f95b8c0f328b321379114ea4df |     
    arc      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/320eb439a72aae2f9771a1bac1eb975f14833537 |     
   arceb     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/4c74d60d8a7636c9f184a7afff56703fca3ef467 |     
   sparc     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/e2dfa3aa211e210701c924de73adda656eebd822 |     
  aarch64    | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/53ad005941a35f8ab977f460ff81ec4791e31c4e |     
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/abf24719fc0f44b047a0158a2ef5edcb5b6b9b71 | ORPH
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/6c3f87f3844f95911481b871dbdf8a78ab225916 | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/33f8e2a1d70a07bfd30e01f2ddfdd552988298b1 | ORPH
    i586     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/bab5b909c1c471734eff4614e7f6f2fb292442b6 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/de26372a56f49b5f6634a26eca750fb7e76b9f40 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f355e056b01bab15732cf445fbb1f555df344987 | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/37dcfae44f5ab5eb89b0d1ec9aa499183b95b4a1 |     
   sh4eb     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/57af519be0e9a7bd09709a0a486b112868e7afed |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/bf0ff87324ef1a5c7d42c1e376344663078d9a3d |     
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/d179029189067d4c97b6137fa048415d43d5b570 |     
  powerpc    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/0df025a2d9ec1ba93b0ea1b7a5a18243949dfc90 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/a1d666ec938b3bbc4b53135d9a8182317908b43f | ORPH
    arm      |         freerdp-2.9.0          | NOK | http://autobuild.buildroot.net/results/b37742d4531b025945b044f67bd4b47943e41b46 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/7e04b12e279e955d53a4b5e12e2d7200b440796b |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/0cf057d69734c7eef3d585cb729f064183fcf7a8 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/96d7c26e79619d2d1086a2e3cfa747a95eb7b38b |     
   arceb     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/95fedee004951748ecad08f463dfaa4103f31327 |     
  mips64el   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/aceb323dcb446be77fbb30f8590f2d99aadb9dba |     
    sh4a     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a5666ee22e9f2fcca4e85989a4d2de134e1fa4e9 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0688c3b592b8356e11b36206ec7be6b827e4ee20 |     
   nios2     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/f02ed99c10faa1aa2ca823b2ef7ed9a22c4ae0f1 |     
  aarch64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/b73eea378ff0f4d8a4fe89f588179021a4e1719f |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3d19eb240df7e15b3b31c833c6b8756b98297b94 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/eab7bdb9931f89549b89aaa6bcf38f42bad62e18 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/afaf66d5f7320140a497a85d07d63617e6cbb9e6 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2261a5eb893a69e99c568ca135e2a95278e29dac |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/303de7a127fb88c4accbc0996bec3db169711fb0 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/65c6d7f5c375c357d0f0c52445cdde115d680a02 |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9fec87d729df8fa49fa55187fec15dd2aeef9d15 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c6a56f8c67bec6b4a293cd753731734c48876566 |     
   arceb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bdd91032bf0816859b8777236cd06d1bed404398 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/197a07903bc1c2d5f1f11529496bf65efc46006c |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2d006ab3fc80b05e1b00b0b972925a16e11687b6 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6cf990fb76566e65217f30cf09a1fa2e4bc7eba8 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f38892093e3e25bf14f9258d479ec03321c309d0 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/18555d5c87e970caa516d8c9300998527e5d0b51 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/388c95ef625b787fe8dd48045524ccaa2b0c09cc |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/667b90aaf356d11de7dd2378face99e39004e047 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b258be1b1f54dfd64774b9fc33ea531f844f7da5 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/098e0d712d5328bf9e0661e435a9b0f0f229a91a |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/91ae7552c97f931b3bb4590fe484f58c732ebfe8 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/55a1e9b9120e847c92d4a1ccaab5be6149084c81 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ff6e470cd4f5786c7bd169c8cda719468134a759 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ef3edc23cee2d089c2d8e735b28d1c21adbf77d8 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0ba71f72f3841d6457865d305163f6da3f4975bf |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ab3c1f5d78346d1ed13715c5bc517cad1e2f0f39 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/67b049c6c22fd6c8341ee185dfd5bccacbfcbd83 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/304588083a1e46623ddbea59b3ccbbc190d30b60 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bff491d5f317a90336fd7c9bfa4ae08cf0bf59fd | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ad8b4f1cd247dde6674da508d5b2f33e566b2c03 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f8abbe8e1515cc9530bbbbd310e90f361e240d4e | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e3bde3d9bfd85b43047aaaab9909236d04445aba | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d0b673c4b22f4c8451c7726b94d1e0f9aff2557c | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/6576ea557bf7e986e69aa94c693c9ed447d6733c |     
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/4c59b3ab5e7fe0389a5b55498e996c27a50fecb3 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/6bcd5c105d3869def152ccf4220b8a52b518bd5b |     
powerpc64le  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/541e0679ea336e6a4bb545e751ff634ef12a055d | ORPH
microblazeel |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/9599f72fa9d5d88f68d2916d82f4b3f48e876a0f | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/744fb2dc31e6869e05f82b25bfc4cb62f87176f6 | ORPH
 aarch64_be  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/fd7cea8dad49508badc9c2e25cfdc264410ab5cc | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/38f6fe499bd09e96915e55a29348d7698fe45107 | ORPH
  sparc64    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/6ac84740637c5928a056a029288e550644c7be87 |     
   sparc     |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/0dc254173d3084c8b2a0f0d7b31a568d57a80fa0 |     
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1ffcaefcc85f8086e799d57cc0eade8202c355e5 |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/49bbea12df721271941c6fbffb53c6e64d6a9cd9 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7cd2e279c310d34e9027d59d75d0c6b3b03ba6ab |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a94cf1fac2c3397ec7f611d907c6bf6e94871f08 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/de9bdf6bf87a4cc47d4f4972467b80684276c766 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1fba5857289d0e41865542d42aa3cbc2387d8c5a |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c4cbbf0a43a60c18595383ddfbda0535abc086ac |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ae134827a0203ef8ea5ff3222a0975605b961f56 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4630e93173a214a29821ef94886e85f801029f2d |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/23b9c1a68064c8b450ab4dc58e9d45ca3119bace |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3c5eb063107a0bdad07b01cbb8cfbc4848289f04 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/feb594dae4d2b8dd0bcd73aa7e38c822275f36f4 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8d13da0898f626a9aa832794ffdd87c16655d27d |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c760db6b7ae22985dc958e7656505e404608f8a2 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b95946416fa5e84781bbf3129cf6eaf56cc36466 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fbbab61c4c0a895634633c1b57a9e3d01fbc3ebb |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/945134b29e1230e84ad5efca99c7ca127e6587bc |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2a8955b749da42adc5f657316402d7137b0a8a8b |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/eb749a73f0aa7100dd512cb0ac58e8e994e14e56 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/54ae0503d770b798b6304be95f7af441dd806f92 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/58c906798d13e8d733d0a988a89f57171bd7e219 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8ff853715575edb9c648b97a2e41c8d9d93ea487 |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c8908ef312c701e0f7c76909b2f469c72a561134 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9832ec6cd09fd50e65980222f6a018e4a294fcbc |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a72f59249ecdf9f2fe87a33bf4d716b2bd281383 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bb5f973d1af6464fdb3937ae7a7eb4b4641d3a64 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b35196c63977d9ee5802775fb1c8be1f8880292c |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8ae0c3055a6863d2a4148af6462a69ec2dc72175 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1dae1f2668542db34e4135d2728f0a168ffe9956 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/59b1f37fed255f2a3739ea2ac5bebb590ff4943f |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7c4494133a41caaa7470c886886981004de0a8a1 |     
  riscv64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8e66199579bba3ccb5f488e0598c23a02931fc79 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/25630dc24b2e9f3c2717e4b01139cfda315d5afc |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d7c8f18bc1383ed343f9ecf28c293ee976969fa6 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6f254c666d388b39ab8966b760315273624fa51a |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f2e546674b0f429cca9909bc4addc26b1d739e75 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f23a2cb3a0ad1aa358455336a78b7e22966a80c7 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/df5a949d0ca7cb375cf952cee80f64364fcff2e9 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/18051ac16102b0eda427f4d419a0aabab315aa8d |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a4ec2ff4e9f320d5e15024ddf17c36b1b0319ffa |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/337a7c3b1d54127afc7651241d470e994b8277f9 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a6d0ddf688e8df0e6d0ef87ee91105096e31998b |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/80103e14525187a73468455a2cf7a135a32e9c7b |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fac43dcb3b216f41a64a3efdbe5c57b2f72e2cfe |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/aa309568ed8816d5cbe6b165326e04d539320565 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d5fca795ba51bbeab06b88cfb3a738c96554cc81 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/90e900cc5ce1526fe5ba4f3d4b0c8e716fa14fc1 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/9cd57c8ec59508e614078cbf408bf0e934a04559 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/68c72737c3169a2c82a4a1df57220da19a8d0b08 |     
 powerpc64   |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/d343162c6e698da51ac13f1a288f6fb813898c6d | ORPH
   armeb     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/08f18c9c932d09afdbbc687b9be46f03ca044d69 | ORPH
   x86_64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/d7fb17afa86c61c299d3c28438f2e55a810b955e | ORPH
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/fdbd2b237bfe3c1af50ff590beea687864d6a636 |     
  aarch64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/9fb6ae5e5b0586aa3c1c6506ecc1376a2dbe8aab |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/5496b572aceeac7a21a05ee03c34f0ebb52c9648 |     
powerpc64le  |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/40a45e62f2935fce27596d4c3b4a7832b9846f05 |     
    arc      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8d4e2009fbd7097089b0d07904d3e522c0b912df | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ca4cfede6cd33e4fd413db3db48b6ecb9e95cf69 | ORPH
    arc      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/03e294de6ee930cd1de04e4910497d6994184249 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/eee108d88bdec574c5f4bd2a74ea1558b6852b5d | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3f076f8da8a27d37714cef6ab20bc2dd784b215a | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c40daa33b506438ed5e2b2464886394db9ce7549 | ORPH
    m68k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b57db3d52752f5700c748093a8a8f5c5342fd50c | ORPH
   xtensa    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d04d5113c8454fdcce25b0ed9eda0cdc743ff342 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/27c6e9af4232d8498cbe1eb2d588cfa1574e7ffb | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/566980502fec5f8fc1fb8e0ec99f1d9831381ed2 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1a51732aa5f5a8ffecd351830e1d56cc0970a6ba | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/cdf250247c2113d13981057fcaf61b6ad29c703b | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ee7f096cde0fc52138bd97c5d9e152041ef79e6b | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fead8f306e76d76ed0ac1f53070468b688343d76 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f54547f4801df39dc820b5937c8fb698b027251f | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c9dca2e06b4fb0adb9b05cde591bd5f999e5c14a | ORPH
    arc      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1ed578fb9437be23947537aa41822b4fbf7169b4 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/81c03e19311681353a24ecdf5252ab9309974adb | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/76dcf34ca527675dfd57f6fd3fd045d7ccede439 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1de6d710e013fe1c0dbaa47eb31a9223b2111f53 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ffdebf651d1c95a780a96d24a8935cc24a3f195b | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/878fba2bdb563d0bb90c14c71e2dfff5b958745b | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8f6bc552f649e8724a168af8d9817c1daf7d5ad4 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5af49480e18b9879ae18cb12f00c297c3c3e4746 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/876da7616c68f0caa19dded2637a6d53fa10dc82 | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e556ad54cbfe603e79abf6be7360c0c3ce920e60 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ad303ae5add87a168c9f68cf4fd2e258aed374eb | ORPH
   sh4eb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fafb0c42e6520257f862d9104338a636e3ac89fb | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8e02461d5014ba882bc75aac250414ef53601c56 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/2ea12d6cf56c826752246935f8d6e599d346c95c | ORPH
  sparc64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/412bd048f94c68ba429f5d314403661cf60be7a3 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/6d6219ae90630a842b88fa39682b5b76e4f1119d | ORPH
   nios2     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/cf081e0e3124e00140abd44b5b7ba4bb86e33c0d | ORPH
  aarch64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/77dfeb4721a337ec5c6f5a44c816483d3cfc69d6 | ORPH
  riscv32    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/0dbbb7b387051008668b3e9cc8ea7ad8744c4357 | ORPH
    arc      |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/7497aec8a540262be6d973c3ee7c5be9a0430ba0 | ORPH
   armeb     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/0ee46fe3118a137b8c4fbaf4a15dd80ac6306fd5 | ORPH
   s390x     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/55983f97a85bb67a350953788712faf8a83034b6 | ORPH
   arceb     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/d917a402946852c6a96a8da99780ee0a3bf66746 | ORPH
  mips64el   |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/178f3cd6e55f2b005e7aee532937e43b822ecf53 | ORPH
   s390x     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/ef7d4f20503a2392db1b029d379d4a88edb93b1e | ORPH
   mips64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/aaa7bbc080182ee46fe06bb48d36bf887c7d1533 | ORPH
   nios2     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/cacc55ba210f8c6a3540806cd6a46bedc0cae119 | ORPH
    i686     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/36e600ea76ac96eaff9419b646d60fd957df2fb8 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/bd755dd4225fb7b6467c69e7a66cd075ba964405 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/b094766a94a0a5b8bcaf84cd274a5fd6a3610b77 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/f47627837ab74cf70c61fe5b1fb7e03d08a9ff68 | ORPH
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/697e58086eba8c19e8cec4ea5d4f1998c44ebdae |     
powerpc64le  |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/2dcb42f729ab6e9eab86cadab2aa5036e5ecb399 |     
 aarch64_be  |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/8668a5414605394ae8ab27a8b017cefee64ac48a |     
    or1k     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/37ae9758ec3f48d3d5b89f3311579ca446679829 |     
  aarch64    |   host-python-maturin-0.14.5   | NOK | http://autobuild.buildroot.net/results/99aad0bf6f1ce58629d10f5501f26f2f14db0667 |     
   armeb     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/29c7c1f236bce43334da7e2eb0680f3a749b9d62 |     
   mipsel    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/269e9327c8800aed1a90c3b9e3f8409be6d05e65 |     
   mipsel    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/f03127b1daaaeda4694926a53f8cfdd903ec45e0 |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/571469107074d5dea91dbecd990dc2639bc5d296 |     
 powerpc64   |    host-uboot-tools-2021.07    | NOK | http://autobuild.buildroot.net/results/abd92e0f89603dd3fafe3a08216f83210f2ca9f9 |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5f750f3e4d0be8e0622621284a4a900a043f4419 |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/9b3965024919c4556d2ef192ec45920b2ec94c3f |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/6d90b63531c4246dd6f5a29f843d4146d2607358 |     
   sh4eb     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/b37bf64dce473c802c2ef96d29fb6403acaa56fa |     
  mips64el   |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/a4a8cc48c5c47bb925754b85f7bf5066c1b2ff31 |     
    arm      |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/3407105b427db7f22bee2dd589b7a9c1214cbf72 |     
    sh4a     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/6a7923973999c66382c43e79ee053bd25bebf061 |     
   sparc     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/df47bc64cbc90821254712ddf43df82a819c586b |     
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/d5318521dfee9e92d94e924b6ccba0f82c9a43a3 |     
    arc      |        libblockdev-2.26        | NOK | http://autobuild.buildroot.net/results/6b6b31bdf06a9ccb518fb8ad0581c3e6b4dc5cce | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/87d44a5d9b640531f5949294011d6fb09613fc0d |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/df7d7d92814c3f45dbdbb5acc019f106dd9d9b76 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6141873ff59ed5ebecd2a5ee4a30fe8aa654bbca | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f62361e9e495aba5f10a42013636161ab69deaa9 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b967939f21a65772e0a4340ddd326b65257afb0d | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b3e2d12a89d231a207c022f6c586b452abc8a699 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5dd087ae27197c4ad03bef2c21e27d1b50ff5481 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cd9712ea01122c1a9535b0565167c12107f073fc |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/805421c59dca64b0ea11d12907ddd3253152e3ec |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/accf3b1caf8a20dafa84f5a898878647c747ffe4 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/fef6c7f416754e025f6ed976942bcc74fdd7c623 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/6a4edca245a2f3e9cec6864c1b4ac041a0052db1 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/ebf3ec34ac3424932e895e8ea0976d78a562799a | ORPH
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/db3b0305b3fec0d99e328e3c2ee1a584352979c6 |     
  sparc64    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/be399639c3b34d4c5b7b6d9e1b7e008cb88c7844 |     
   mipsel    | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/b14b292a427f96c584e4e5273db1f8524e6387f0 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/91b9e11fbd038ad4366a598bc83af1206d39b6d0 |     
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/d1fc303b31bdfbf71f31888bedbd9f90a23ce508 | ORPH
   s390x     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/10253da5d089d13de146aec59ba7b7bb649192c7 | ORPH
    mips     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/98eb8f281e7bcc393cb52ec2de5bfbcc9721fb83 | ORPH
 powerpc64   |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/9b6445411a3cf0b708501bb30954de0e7cd67ba2 | ORPH
    m68k     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/c8c0c3b27632fd6ba50c39f7e9804fce9e49cea0 | ORPH
    m68k     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/a79025d9aaceb77f8ffb749db5f8ac4e54b8d673 | ORPH
   mipsel    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/d3ad7b5a8e79186e42587a6b90792e13e0e8acfc | ORPH
    m68k     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/15244b08c60f23440ecb4c2fbb5bd601651d355c | ORPH
   nios2     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/ddccef028bbe4add89764e3547096dbbeb87ff4d | ORPH
  powerpc    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/0f6e0df70e0edbce04bc7fa7db538f55ff128d76 | ORPH
   mipsel    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/9c0a8081c3e2330882a1d68eba8ad13af5eeb3be | ORPH
   mipsel    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/6ae8249eae5c23bcaab07a431b14bc0c9d85fbca | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/a1893871e5c01145101f06a83ccf97bf12895861 | ORPH
   arceb     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/f4376c43932c6a2f09360d9cf5f5bc3247b66aec | ORPH
    or1k     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/ed20c75bae166683be01f7e6b8c9ab32cbb34291 | ORPH
    mips     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/c8604f60735b0e828ad58621cc5284e8691c0f7d | ORPH
   x86_64    |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/c29180bb32313e8ee3a8acd095f3187196442265 | ORPH
    sh4      |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/2e2518c858e5f730baefd21e699a2f6c3f0a80e3 |     
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/7cffb4ae81c5bb9675f50be722e58461e5173a98 |     
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/cb357a2900f0c37e9d88f2a0b43eb8c1e1cfc57e |     
   mips64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/39118ff873aa4ca42e6a3f4e0c9f5262efe7677c |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/1712b7d8685ffb6de998663324e65524dd95aede |     
  mips64el   |          ncurses-6.3           | NOK | http://autobuild.buildroot.net/results/a91c4f734c1626cb5a4cef8b5f0942d4338e3e01 | ORPH
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/897a8722e399631b07f67f84777ce23778ff7fc5 |     
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/94a138f310fc23d57d265319ed484b19b12bb825 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/34563d4ccf5a98aa2bdfc9602f955ee4d45483d2 | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/dc8d10c10236efdb1b0d51c8f04d970cc982ff28 | ORPH
  powerpc    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/3d2712eae0bbb2b1b4adae27b997ca1e485d58ea | ORPH
   sparc     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/654a3447d5af3a1a00168712f0d9bfcb272b2498 | ORPH
    or1k     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/f15c53a2a589924e149bf93a6c8341c2c5d3c671 | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/57bc965395bbf3d48ade48f920979f6a95ad4a59 |     
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/414e141c305d2da71fbe392be52101459e88fa48 | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3ed16724c60c6d1c3fb695f578119274112deb06 | ORPH
    arc      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/591b4b407cb61b22ef98b5f4a8d14afb25db7a9a | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d68c541e804a65cbebceddfc6984fcc741616ffc | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/1d552fbb3b482ad724a7521796982ee28123cd23 | ORPH
   armeb     | package/ncurses/ncurses.mk:... | NOK | http://autobuild.buildroot.net/results/bab145c81fdad1f088b5bb5558057f4569160336 |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/7b3d98f98400d0cb33806b4ec8f1f1b3b677e3c1 |     
microblazeel |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/0bc5734bc793252c6b1b00cf0a356bfb8ceb7f42 |     
  powerpc    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/fdcb87f73fe98e9430edac3b5476ced314a8b6a9 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/784c5f5f8f1edb4b73a7d8296de025a9d86f1472 |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/3a298984f29058f87ed10b03381f43cae8f0b04c |     
    or1k     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/10ec46b4b5b4c6b4e4d1e3e94b0b7855ae192210 |     
 aarch64_be  |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/ea7d2a4e04fbfce48e0c1ffb82804d92156bcf74 |     
   mipsel    |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/21ae4794f5abed2698b14ad3801767a2462bbc94 |     
 aarch64_be  |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/d75b90462729960474f54421f2646d453d078758 | ORPH
    arm      |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/89420e073d6e8ba8f5dadd98c7ed56b17c923621 |     
    arm      |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/671778962c17d35109321f70fea095520a6de6c9 |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/dbcc776f1b961de21cbc8d0ef1f0979973f6a028 |     
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/7721c969871349b08716705014af4276a422d8e8 |     
   mipsel    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/6365ad0eaae3a2e86b1bac621ab8f8963fb76b59 |     
    mips     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/54ea7dac110c7fab2847047a0be1d8e9e92f78f0 |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/f3587fafb439a72ec198ad721d9944bf1be56992 |     
   mips64    |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/4df6e120b1daa1fd7cf4dd55a21f5cac428458a4 |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/8a9ed41de128f3ca7b0e5e4b7ea09090f2572ce2 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/d3fee85d06ff96a88f0f500e234e8e53195bd875 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3ebdbe23891bd20d5828517b8723f5b7cc7d8d8d |     
  riscv32    | rtl8192eu-94bce7798bbb18de6... | NOK | http://autobuild.buildroot.net/results/7a85a1e6df55bbb4dc6741821c849ad7ee5059af |     
  powerpc    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/4c49ca5c657ca448692f348bacdef623ca2fcbc9 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/b84cfa4427b2a0c0c69e1ed1544cec7d4cab94dc | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/ec44f14f7d453777f77d07bd69e4e38934bcb3fa | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/cf12bfc3d6215bd7bc70b90a18c2479beadd01f4 | ORPH
   mipsel    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/222227660238f5eb84fe010a7a6d9e09d6e0a93e |     
microblazeel |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/e14ff749041f06700a3768d26c246c88e2ff5fd6 |     
  mips64el   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/21b6db3c07bf7fcf2f0c3b2b02a27b533862e638 |     
    m68k     |         sudo-1.9.12p1          | NOK | http://autobuild.buildroot.net/results/837edf61218b2b74a6873cebc014df2a5ef1a22e | ORPH
    i686     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/68ee796e4669827ffa1140f33b43d6a686e188d8 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/60536af3ec96bd2dcfdaf6e654b746aa2109fbad | ORPH
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/6ce3507efaffc20af0ff7de0db1f501624012e8c |     
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/6bfad9f4b970bda3def407f06d8eb35131a7bb80 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/e1efa5f09fcc731c9bd83f2b1714ec99fea298d4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/856e91a13d85e4844a77eb34699656c2e507c160 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/a1fb12dc51e789fb1630f8b4b242b5580b1fdb49 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6c59b222a7f0d36059eae54058a97e7520e429af |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/136ac1da2a9c31714f76d34f0e6973c4bf35d25d |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/bf70b84757fda3443c23618719bd97c503cabcc3 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/daa197e893554e1fba99124a4a53fca75139afed |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/094475bd1ed9c29605d4130704e503d108a224b1 |     
 powerpc64   |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/ef03dab7329cd4d6f07e49585100510308aa3520 |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/43b93a06bb0c61e5e2075cf9524ede15ebf81549 |     
    i586     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/b532e9bb1433a81a88bf83e1b80c50fd78802a05 |     
  mips64el   |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/64ede86c29057270307cb0ca8de0dd296d820b88 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3cd4d88f3e6014049cadfba5f71f643aef2038a5 |     
  aarch64    |       xlib_libX11-1.8.3        | NOK | http://autobuild.buildroot.net/results/4101050e32b6f8099ee589280cc1aff357bc0ff8 |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a55c7f9e238b9bfd06018f078b3e8dfbea994460 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/10693b2fef8859457e7b51a7e9233ee6f4cd1b56 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b29d88191ed87f13444ff0d1b3ec9da68bfe7c05 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/edfed0ec0845a1054158bb437d1c2722833f518d | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/10ab72884064d7f6d164ddf371fdbf05a76044a3 | ORPH
 microblaze  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/7b0ff61c4b42e1a7cfb68b68dc3609fb61b14d5d |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 2 
              host-rust-1.64.0 | 2 
                      crun-1.5 | 1 
                gerbera-1.10.0 | 1 
               libglib2-2.72.3 | 1 
                 libp11-0.4.12 | 1 
               libvorbis-1.3.7 | 1 
              open62541-v1.3.3 | 1 
                    sdl-1.2.15 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f88401fae0daf62ff3aff0f6156ef249d5fd5d9d |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ef82898480ba76300fb43ae8b36a9a8799179f98 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/149b7612ddce5d74048182cc75b533c9743181e1 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/07f75a926e225afd11d9bbd4e7a5f80a07221882 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2b4c8135994de141bac41695a84cda440cbf4843 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d9b0e3ab838d9901004db7386caa2f367aa56c16 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ca55bbec92f1365039299f3f459e4b799853355b |     
   sparc     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/8b0f9570d3ebe1af4fa5f625ecde4d49ecd3a089 | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/45867fff43592840c280569521b1c33d7a581663 |     
   nios2     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/f6fb2df8d6db277d34800ad599a0f49ed0208291 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/70c4a7b31017b3f6106fa2122fae31e095a34898 | ORPH
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/370ad0f1615857d2e3216ce3b2d62c512109644e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
