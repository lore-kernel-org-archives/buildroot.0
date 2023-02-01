Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DB5C38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 07:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D051141833;
	Wed,  1 Feb 2023 07:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D051141833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8ckOItiFBKi; Wed,  1 Feb 2023 07:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A088E41898;
	Wed,  1 Feb 2023 07:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A088E41898
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 605051BF215
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 07:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 450A160E4B
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 07:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 450A160E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tTwp8aTL6Tr for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 07:00:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98EDD60C04
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98EDD60C04
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 07:00:31 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 860A824000E
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 07:00:28 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 01 Feb 2023 07:00:28 -0000
Message-Id: <20230201070035.450A160E4B@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1675234828; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rpf7vNYY4m9pt1WQeb6mcIvpRUFtgDySFPTO1TEFRBA=;
 b=GU+xIbrqQB18lwYYGZGcf+UShE4x/t4VaVaPg+s6jNYD4rU3QviOvx7wIWl2YX49aGZjVz
 f04cK9KCfsD0Unh13nd5QXAXjn3vlz9vrVV252F9EtzB7e6J90eOtK1HobNznXUOSeXsfR
 NFvaq2X7Huba9NqORBXotIOkxREySOFh1l0AAJTJzQDdUootOFMeKwt0+6wL4kuH3+nvoX
 E/3NF+uLXslauZx8ec/kMtLlQOYYBwFn+QfnYkK+boJHGJnWy1k8/3KfcpEZhVp7zMMVv0
 6z6kFVtIPi29+xY5VTaOYKpgJeiamPXiI/IChz22aUBi71T/FYTaqbKSGYUdPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GU+xIbrq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-31
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

Autobuild statistics for 2023-01-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  2  |  0  |  7  |
  2022.11.x  | 14  | 22  |  0  | 36  |
    master   | 202 | 303 |  0  | 505 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 24
                    fwup-1.9.1 | 21
              fluent-bit-2.0.8 | 20
               libfuse3-3.13.0 | 13
                   bash-5.2.15 | 11
            host-binutils-2.38 | 9 
                    norm-1.5.8 | 8 
                       unknown | 8 
              host-pahole-1.24 | 7 
                elfutils-0.186 | 6 
                  jack2-1.9.21 | 6 
                     xz-5.2.10 | 6 
                gerbera-1.10.0 | 5 
                host-go-1.19.5 | 5 
              host-rust-1.66.1 | 5 
                  janet-1.26.0 | 5 
               libglib2-2.72.3 | 5 
                   linux-6.1.5 | 5 
                    opkg-0.4.5 | 5 
                  xxhash-0.8.1 | 5 
             dahdi-linux-3.2.0 | 4 
                 dmalloc-5.6.5 | 4 
  gobject-introspection-1.72.0 | 4 
                    pixz-1.0.7 | 4 
                 wolfssl-5.5.3 | 4 
fxdiv-63058eff77e11aa15bf53... | 3 
glibc-2.36-81-g4f4d7a13edfd... | 3 
            host-binutils-2.39 | 3 
mobile-broadband-provider-i... | 3 
                 nerdctl-1.0.0 | 3 
                  ntp-4.2.8p15 | 3 
           python-bcrypt-4.0.1 | 3 
    python-cryptography-39.0.0 | 3 
                    qemu-7.2.0 | 3 
                  assimp-5.2.5 | 2 
                  cairo-1.16.0 | 2 
             f2fs-tools-1.15.0 | 2 
                   gvfs-1.48.1 | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-10.4.0 | 2 
         host-sentry-cli-2.8.0 | 2 
          libcamera-apps-1.1.0 | 2 
              libostree-2022.7 | 2 
          linux-5.10.145-cip17 | 2 
        ltp-testsuite-20220930 | 2 
           optee-client-3.19.0 | 2 
                   perl-5.36.0 | 2 
           python-numpy-1.23.5 | 2 
                    zeek-4.1.1 | 2 
                  bind-9.16.33 | 1 
  binutils-arc-2020.09-release | 1 
                   bird-2.0.11 | 1 
                 coreutils-9.1 | 1 
                dbus-cxx-2.3.1 | 1 
                 dhcp-4.4.3-P1 | 1 
        edk2-edk2-stable202208 | 1 
                     efivar-38 | 1 
                     frr-8.4.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
                     gmp-6.2.1 | 1 
             gnuradio-3.10.4.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
             host-delve-1.20.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
    host-python-maturin-0.14.9 | 1 
               host-runc-1.1.4 | 1 
               ipmitool-1_8_19 | 1 
                jemalloc-5.3.0 | 1 
                   json-c-0.16 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.15 | 1 
             libgpg-error-1.46 | 1 
                libmad-0.15.1b | 1 
               libvorbis-1.3.7 | 1 
              liquid-dsp-1.4.0 | 1 
               lpc32xxcdl-2.11 | 1 
                  matio-1.5.23 | 1 
         multipath-tools-0.9.4 | 1 
                    musl-1.2.3 | 1 
                    mutt-2.2.9 | 1 
neon-2-sse-a15b489e1222b208... | 1 
                   pcre2-10.42 | 1 
                   rsync-3.2.7 | 1 
rtl8723ds-bt-14cedf3a9fec1a... | 1 
                sexpect-2.3.14 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                    vlc-3.0.18 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/c03a7ea4fa911768517c671cf8911dd1e583d418 | ORPH
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/8185261a1f11beec862de86e1d5e0576bb7efd8c | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7f300f0b35c79ea2299be9c405c6e2d005bee83e | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/cfbd6319263686801f111223058060d153a3211a | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/94b7350e8d9443f636de2897fa3653fca120e4aa | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/484e88878c809d18363e9c5848ffa86d6793a977 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2eb76c4f23519ac853e3f832726d23f1a96b3a53 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/86d9900c9060fa3df2a126f2f8b9f4722eda72e7 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/14c5411ac5936204fcc26b56bb67c95e9583adfa | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b9f741ed1073385bb5ff10dabbea30d2c6430700 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5fbc831620e72cb901765031491786015a1f5a5a | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2de7c92214648809a267f0e74e7691aea4c4b09d | ORPH
microblazeel |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/402039a5ee4d23cb8634191bde3590723432c9de | ORPH
   sh4aeb    |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/80c1754c1e500970cfb81bf71221409856533913 | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/006a934a15abbac13d80f97f710e484d8fc6367f |     
    arc      |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/16c7d44b86b6cff4707cfc0ec111197f7e728b79 |     
  powerpc    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/9f82169a3a8bc883af21cdb60f2c44450e340721 |     
  powerpc    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/41f9ff89593f7fd5c8727bd355e1cd4e735f549a |     
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/e76e2a32c6c1ced860b8d6b2bad35506642d037b | ORPH
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/06607b1d142b4bfcaf31980f9255407637c73661 |     
 aarch64_be  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/c762b04dee0d0552efdd7c6de22d8159cd9fc41b |     
  mips64el   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/ef817fa147298e51a3be004546426ca4951bfd19 |     
powerpc64le  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/407265f845c1acc9f2bf46bc346fe7aa9f75f024 |     
    or1k     |         dbus-cxx-2.3.1         | NOK | http://autobuild.buildroot.net/results/61ac1cecfc5af2261ff7dca3f4931b13a29f4a0a |     
    sh4      |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/155bc9f83a0c0f2a08c1396f949e87f207b8aefa | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/418b63ce6f2a29247ba04675b748b2dfcd8a6eda | ORPH
    i586     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/eb8f9e26e4a63716ff8ed66e486f93209943b98c | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/161c08abe4cfaaa08b8598b06677d2b2b1cb64a0 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/37cbdd461bcdef2ed507ea56f799219b4af5342e | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/c8b319ccdd2b515be6805b3d2abad30711205d00 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/6f5fa4e67763439f64260685fe6862c99130cb14 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cb4b5d18591d8bfa53460fea45ff69708cb165cd | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c454a24a97c1a0b9ded4143549ec73c974ca0694 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b12c739a37525469de2ed97cccc99c402047b49e | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3f81aa51cf204372e06400c0b65be7d398b4e9b5 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2893e59bb2b5d7260ca486ba8a7fbc685ddba5f9 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/01a9852f28639a03f781a7390c7c0090f76a48b1 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/8fbd9c9d98de1bfa095f782aea6c9f8751c5c9c3 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/86f83e04be0e89e9153d205bfff7d530084e37ea |     
  aarch64    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/755b705c3b4fae5fbe5ac7d0b0ec707518f1b51f |     
   sh4aeb    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/596e1793170d57372b6b109d825d1576ddef24ed |     
    sh4      |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/a03d3fef83f5ddb560201d4824f1a0d18cbbf777 |     
   mips64    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/291161e513081e693dfd11d4c636bbcbc81115ed |     
 microblaze  |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/a5d92b6a1a6960917639ae501073ac5288d9b025 |     
  mips64el   |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/d182ac02ce84109d5a695d3f02e3376dc41958c2 |     
   armeb     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/7c5a2b5a4425e4d6ce7720ba295176a16d142cf4 |     
   armeb     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/d200442c7ad5bbcaad811edee9d2a5c0771f6336 |     
  sparc64    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/46404ea2d3f3491b5e69e21c96519a48c84f0720 |     
   mipsel    |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/5a0ecf2311988034801be0393aaa4656277e9770 |     
    arm      |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/75ff8cb73b98652937535d56924ef49b353339f5 |     
    arm      |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/f5dee7623bc8af19dcdc3fc6c642b0174538e3fc |     
   armeb     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/2fe2a33ef5f973f4ea116a02153b83d6a4f9dae5 |     
 aarch64_be  |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/f8faaf1498dd44c594fb8f3a61890727bc4f2bd1 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/55c18476212c34d2e066ae51fc911af13e433ab6 |     
    mips     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/c413e1b5e8ab44d8a7ede7d70a03767b3ff1b63d |     
powerpc64le  |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/f40dea7e9e82151128142e60572e534683e31c05 |     
microblazeel |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/85312092b0ca251f74690f37088a6bad322de793 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/cde4de57aebfcdf1636332c25a109d0266af2884 |     
   armeb     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/cee20b9ef5ad030948a994553d089b2445149454 |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/c6e167ae05153917b8afc421221bce262d03976e |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4e386d11379e8472369087b9b0fecdd24b4892cb |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/68cd935e4c60b7944ae511e1dbed31eca187c946 |     
  aarch64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/96d6f4c0f9d2201b03cf468a3d593fd05c5d8268 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e0eacc4bb6abff040c1d1f16925bd672949e1d16 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e51895e530c4a931b0fc4bb97c2d11c8edebc18f |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c7fc39552b35155e522c0f867fdba1f9edb6a27d |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9cc600c5f88ff449a0cd2294d15302c0b18bead2 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b206a8d9e778dcc313f4fd834a49c567ab449bab |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8f1111c5d2c1366ff29f7d0132a994a4b822dca0 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3bc94f4d3345e7cc76ab59600c101b57b5abf63a |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bac9a84dafb33a77c5f893e5c3f7f5dc53c7f0ea |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7e99a7c1583a8a63415d0ef5b2bab550c1826e61 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/41d7a7aa16c5c92eb328444e012b36576e85703c |     
    m68k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bb1e8345778e60be18d7c7e1b3361922a05974e7 |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a983490ae8c4c15781712f3b0cd0781410281fbc |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ffa0b7f5f80b97994204c9857b1554b788cbdcbf |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2fc295ded2a5e6b95e8e81a0942f90db5eb3cffd |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b7725765e6348730444ff84fa6a3357037ba11b5 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4718dae608e51e92a6411199a8358ad102968ba5 |     
  riscv32    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b9777fffdea5354db36f8d2ce3e06352b72611ca |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6a75c8561f528da5dd6fda3dd2e34184a4517e22 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2c7b225b1cc5d4924fa635147a09f8c2c2ef2129 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2fa5a0b6401cc8f789ee8a11efe4a79789684df4 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4d1c45e161a49b39d914f33bb65cb8f2609f8b84 |     
   mipsel    | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/a9db782dd3610058dfb5c44db2fa8b719b12000b |     
  mips64el   | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/18eb0f3e1a5a7fb389c9ad1bbed2db78fc36245b |     
   x86_64    | fxdiv-63058eff77e11aa15bf53... | NOK | http://autobuild.buildroot.net/results/627574e02fe878390b12c2a100672247f450261d |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b4e57afe4096280f247a2886ad3de40fcb5c360f |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/12e146565a394255f6b428e6b9b4f6a9312ed338 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b9fa61f9b0ebacbe70ca8359aa62dc3a91964e46 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/20b73fc190c275d39ce52bfe59ea280c74c4bdc8 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b5d47a707efe96923b9e3a606f5caa1c5475d4c0 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e680edc4c8d2686fa4de42594fae90a467b88707 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/86e5ffee1b1ad2b85f4248886dd9f637342b101a |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/559848cbc50f0c3ee555d63eabaa5195cec9fb39 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/7bc8476f8a19b671597fe86c771deeaad269923f | ORPH
    i686     |       gnuradio-3.10.4.0        | NOK | http://autobuild.buildroot.net/results/af0152a233cc0242f862b6093f52eb0b9e315522 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ce3eeca32b8e1d2de431bb782c2e9adc3c0f749c | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2c0ffbd97486abe6fe3cfc6e87a528f8f5f3acfc | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d385f8a7dd00e28c0e1c7b05399f676ca62ada35 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/aa337b0b9441b7d3b898509b4f2e23f6dc6f644b | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/01bf701a48497c803211d7b2ce1eb466c1d35992 |     
   mips64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/9609a528cd923353a6291229b5bdacecc61f0fb5 | ORPH
   mipsel    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/69bdc07b4114844179b3a331fbcae0be856ae4c8 | ORPH
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/e6654f796dae6aa768b32e5468e66c54d9351557 |     
    sh4a     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/78498e0380577ab0d2acf308c241734860089e8a |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9597684ed8fca90f927cf50782fcbb00bee13fc3 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c35f738eb3ce5159582b1afd2b9ca0f0a5af6b1c |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3beed9ecb68aaf30a891830f385834585e58a41c |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aed5958d7ebbabf84de49a265b8c82f53dcd3de2 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/92aaff832805f746480b1733c05120298296b8ed |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7eb518eefdb990f42546ef628d334a4027cd7454 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/69eb00656616f5eb813648f3d7f1fbde778ce9ab |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e50ab2ac80b64a30e28de6e0b8b7734cac17d520 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/443ce7edb7d306ec536a845e29bed45686e905f3 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/345866ada537aaebe3a1e201116af3ec56cb9d81 |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d73dd5a654452358032271f77768023cf55a2b7d |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/90ad28fd811fb40085463d37720f9903b9be64d2 |     
    arm      |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/e95359a068f3a3e7e3d80acc6fbd28f2e3e25a2b |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5b072c4a35624ec393269d5ade3e4537a39a22c0 |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ca727d5c3a2404cc9cac3e252a92390c309519ba |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a6cfa358f35a4b15f81637533c35367f94bdf808 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7f8b9ef35e122adbf0cca6c1b14d69cb47a6e347 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1d9adb870f284eff7178342056d48aff1fc547e2 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d2b832f53025944a286bd027ad96b98269448d52 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6fd287c6b348140ffab2b1ba18a02ebf8f25daad |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3c5c9b083e129d87d6ae5630997157eee1bba582 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6dae5cc73aca865a98862e984a5dd0ae67527387 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e1cd7c42eb4daec6dcfe2cb1a444c3f64e56d7cf |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5b93dce8773ff6ccf0ff6479ca3d57da23eb468e |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7d9ee9d53781c0934fb37d934df36b1cfd836048 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/63445e8a46fff99e317c07660c735f0416d699d4 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1bd75b7b5e0e7ef1c8e930e0c397480109b837f1 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/508ff798da6402bd9f69243c247f49977778504f |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0032fb377ae46ed2622aba323f19a33f89733d51 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/354cdfb6c6ffc9a502552a4265cf8ddaf68d63f5 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dceed1ff73b97b960bf09047578cfe1f617fa2a6 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b39d04e1580b688b03c5dc3274306a7cb5c91757 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/38d94f950bbb633a1183c4a782042f0d3780e9a6 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6e9d85e2436e9df0d130c611dd237f7d20554051 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dfd3641bbbdf1e9daf563025330b878e692f7dc2 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/132cf1a204516d62926bad10ffdb7761ad11fbbe |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8d98ed784fae0791139a5197116db3095e4cb076 |     
   arceb     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/3dd43a444b04d08cde2f83d284d2a0ea61d93c26 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/0d62bac24bc8b2bf2df9213dff93f75ecfc3517a |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/012b815627a12b899dea8b035e20a56d52e12090 | ORPH
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/dc1867046a2a08e7aa728f5fc067a73a2f7def0f |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f88237b44c5eed0a0e0098ab8b7178350519b18f |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/d6c7b97a2486635a86ee95a570c3fb0e017e7120 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/14181a41583d4346f3c4bda969c83df01fa777ec |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/a16228fb62d0a501c63359597cb4f66b8a1b57eb |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/dfa0d2e94f91b33e81cff6e83d49f2a757163155 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1da1e44f0042fe0345d3e4cf830d30fcdf84e9c7 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/334b39ea40fc685f64ca7b4c7c25c2a7abe728ba |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cc4123e8028e7dafe8c779eb6300fb054c24c8cf |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2bd2633902a3bb826079129160fa49dbbd8381d5 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6379adee5bcc4a41aadb4a7de34c24ad73fb2f98 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a5ece21a2742db8c82f0472f630942ad39f6b5a1 |     
  aarch64    |   host-python-maturin-0.14.9   | NOK | http://autobuild.buildroot.net/results/cc6f8e31fb5f04f171f9258fef179a4fdaf27f27 |     
   mips64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/ed11c2ce668c163bd6c544eaca3195bef5a8678a |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/25ea6048fde3bfd99c4ebcf12763c9c8c6ff1c44 |     
   mipsel    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/47799a8edc2884fb348f78b75951682562845575 |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/11c9f67112069c696c7119499f921358e7ccb22f |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/a3b5c4996ca7efdb4b0482173d3323b4d5676eef |     
    mips     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/32b83a5be46d2c51f528975f262980d0cd205bb8 |     
    mips     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c3628adfb15b33e9c2b7a74ccb591a793c98921c |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/511abdc17256a5ecee67a0fc4c6a9565d197324c |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/e440999aa09534b54b219a48d06da4d2f216d39b |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5d60808f99088909e517c4e58f1961c0c83493e0 |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a6495af7dc754dff8c9a262d7910de7ef298244d |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d1884b4d235928da03dfdf67feec09f509dc9185 |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/2696f42d77c3f8826a8f1670464b7cf4b8651a2a |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/581cfe21191507485473c546338c7b6d281715ca |     
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a77633d016cf477d411689c0434ff7ed97da37ed |     
   xtensa    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/8a64759ca41b1bfd0c3579c83889ec33eb785751 |     
 powerpc64   |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/6444e8ef17925fb2eea36c4b16ae63df7eead802 |     
  riscv32    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/fc63ef9e7df62502bb5320392a3c25f5c6b7a96f |     
   sh4eb     |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/cc32d715239b30819b122dc2cd6c82ab95d946e8 |     
  riscv64    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/caa24d0142e8bd3e1b19f2c38f825da13508eef5 |     
    sh4      |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/5fd46593dbfd5d480456a7f9962afd29ed0c2fde |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/041ed53d3237b86856dd488cb68132905dd793fd |     
   armeb     |      libcamera-apps-1.1.0      | NOK | http://autobuild.buildroot.net/results/656121dfc7822788ed70c66952c0f7590c152a4e |     
   mipsel    |      libcamera-apps-1.1.0      | NOK | http://autobuild.buildroot.net/results/1867412523ba300058f52dece43dea66ec15f0f3 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/0edca16eebe44e343b55e3e8f9233fa79001baed |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/f3b857f4d412d6b083badb2dd5abb7b1af2553bc |     
    or1k     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/14c0d75a88bfdcd2ff663dc5932567fc89a8e58a |     
  aarch64    |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/8e1adbb1bab7804900d764a0c6286e544b499781 |     
    or1k     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/6dba0e45632efaa6155e2dd19393801074ada31f |     
  sparc64    |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/e095278f89a00e4e20198110fa3748f04071698a |     
  powerpc    |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/6568aab407338d5ab929d44988ee58f488f2b660 |     
powerpc64le  |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/1687c1f48c672e849ac1ab8c9fa9afed6d3f03ab |     
  mips64el   |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/d582522b25cc0257003f006cb8be1f08e0d6d503 |     
microblazeel |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/28f9b3f89918f71f7d00734c3c62ffed57e64397 |     
   mipsel    |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/80a5f9b02f8c754b8e4bf2ec3d55bdb333a54f36 |     
 microblaze  |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/3926f89af855ad70aa4fc04469916ba26ccd2c88 |     
   mips64    |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/a984d275d949e8dc989870d2d2b6f6c7168d52bb |     
    or1k     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/80613c2cc051f43f238139c4e115b5104db69bd4 |     
  powerpc    |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/17fd5dad2e3c384b99d6abe7ba44a3cac72edff1 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/aec1a4eda207fa890aeba82e6cb0541346413eab |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1d3e8cc2f8a8d3e0b5c6cfc0d75ce7f459932125 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/822b53542ec4c5d5dfef099c3e33e7dcd1c072e6 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/004ee39278690f11415c2bd4496b93d1eed747f8 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4277d67aa70524fbe12896a7349a8c72826ed8ec |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/5fd97c464fde422d4fef525a15be76de55e39f51 | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/a7dce0abea1b54cda8b544d4b13e11839d1e8c78 | ORPH
 aarch64_be  |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/b30090b5d9cff1eaf1aad31ba628e224b15f9139 |     
    arm      |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/af6402b749b51f112508eec019be4f7b63866f97 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/e42892e58d2393e06304fae28ca7943cf9e5d00a |     
   mips64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/c89823649ee4c685c07f0501fa2664d2d11843ce | ORPH
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/e10f54118d18d5a82e9731fc1a9977e2f6db5b94 | ORPH
    sh4a     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/ecb3514459642e751b3a19a49b941c4f242d1c56 | ORPH
    m68k     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/31887e1f8f1acfaa1984d30eb4c28c732b091c7d | ORPH
   sh4aeb    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/b7c2fff8cc8cec3019af8c4392dfcf1c52473233 | ORPH
    sh4a     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/33c3e39a85fa6826d228444893caaffbbbb37402 | ORPH
   arceb     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/ace40dfcb8565e50704115aa74772bc69bc83c79 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/63a6812fe41f72a59d1c78e5e9b5d876686ee121 |     
    arm      |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/acfc7f3e3a160847a7b534753d695037d18c6c87 | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/9038dce0d99f2ec90f7ad3b0b8b9f7bace675f59 |     
  sparc64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/9ac8c48d90d77d1c0bead213d9f888a9c8ea06b6 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/0e0ca9839030c564e7deeca0ee0c8af865c5152b |     
  mips64el   | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/f15cfa9202610a097b820e7221297ef70a903d82 | ORPH
   sh4aeb    | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/8b5783bc03a6d29aa84385ca9d94f33487bd7edf | ORPH
    or1k     | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/24cee463eb6f8c60b60f50137c28a119be382520 | ORPH
  mips64el   |     multipath-tools-0.9.4      | NOK | http://autobuild.buildroot.net/results/0e692f898762c47b019765c5c9143c62e32991c2 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/c50f0459c426b0447eab524f887c07451ed2b597 |     
    mips     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/bdcb0338362acf5a9f3006430318c282b92e74b4 |     
    i686     | neon-2-sse-a15b489e1222b208... | NOK | http://autobuild.buildroot.net/results/42944d8151f5ed8927a6e3a853d5fc272f582c88 |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/ba46ba63883c3beaf12fc3597404d813fd0fbd04 |     
   s390x     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/75e21f2d9525c6a93edbd3d2a331b241e51647f1 |     
    i686     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/51fddb12c234a148b4c65ca12f8f8cc2792583be |     
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f3ef7d3c76b3100221a81f4796c6469254fe7f78 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/bd1e6871410818377b371fa06d7d60328f15f56d | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/06290e81856d6261eed5281a55bf790f747ecafc | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7aefe63fc39522c9cdabf5fd0c01f8e6b676311c | ORPH
  riscv32    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/80f666c32d3d7948991056fa7d47b5bd8b0e7e6c | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/37b7cb6c1edf7f855b5cbc1d43ac9670f3ecaa2f | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d69d19fb6a152dfa334bd31cfa3165117cf83dc1 | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/4e3983ce16e3ba3b3e450655fd592d902ddd5538 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/88b41b56a0ecaf8cdcb57ce6d662f414c9c02ab9 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/a743d25c0dc7bdd8a5d4ae09e463e03ecc1883ec | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/7cbafad6a1c3db5875aef428d0a061384bfad653 | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/f091ac470349e7dd1541531242bfc32b26c16296 | ORPH
  aarch64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/acf8f819a5012b400ea7ae7a7907e63665e3fe89 | ORPH
   xtensa    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/501831f12f61023c1abc513669b6f139a33ab01c | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e9570f2b50401e828dbdd96e94332b198dd74571 | ORPH
   sh4eb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3e7cbaab4a1cba524b97e9b2e61bdf670c5a85e0 | ORPH
    arc      |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/3ba001ab11be72d543819672d9cc267f461730e3 |     
    m68k     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/c5083dc21bdd060c88b6b7ba6ddf105c9c73698e |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/2b332116b0cabc903c9b6920c6cf0eb2dc8bd4da | ORPH
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/13f50641633cd3eec5e27b727d9a85cfa04692e9 |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/cdbb22d0a0b9aef983c858360cf0d4ebdd809cc2 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ae5218c718387fda9f230c2e715d2d8c93146a85 |     
    or1k     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/22a1d6c845d400c59663f1775dea5a2c9684b34c |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/3e7f8e15796c9817e4466ac464f3eafc1964ec05 |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/99acd3d9d9f5b26e755db855de86baec448d758f |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/be2c3d7092c22f460c8814e00a8409b4cf841f16 |     
   s390x     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/09a3967aa00590d959670a9fe9299a4dcad40c0c |     
  mips64el   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/75df240787d4aefeb46854132c1b13d0b14b1e18 |     
    mips     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/851e3204e82a811158d68b6c91e4ce0231c2c190 |     
  aarch64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/fa23843ff36c22b345046a9e7b540387fae41448 |     
   s390x     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/d4dc81c724dff9a390c8808bd9ed808964aed5bd |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/479cd4d4666bc2fe38146c41926bb0b543bf9354 |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/4e1b69071f1b383e0f2709d46b3246d0eb66c288 |     
   x86_64    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/9082ee10057b1535412aa79c9f07350ba4e53c40 |     
    mips     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/fbdd688d520e61b855a7cdc7163ec97b63df1643 |     
    i586     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/161aa74118eee19328eab5c8d0839fbceb2dae60 |     
    arc      |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/3fbf5a40ed48b172f6001c6c0a1286fa4e68fed9 |     
   armeb     | rtl8723ds-bt-14cedf3a9fec1a... | NOK | http://autobuild.buildroot.net/results/69c74d13e374bd1d3645a17e89325061b2676a18 |     
  riscv64    |         sexpect-2.3.14         | NOK | http://autobuild.buildroot.net/results/a2b69fdf67d520aa4d2718bd688d88d102842cdf |     
microblazeel |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/d6173a2968db8e388e0e3aa0bb0711641328d18f |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/93b2a05680744179833f75ce160f033577743e5b |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6311c8a54aed28e77eb215d2fda49f30e1252b22 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/4f06c8f178c3e3cd4dfea25bd97282616e020271 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2fd4999737f00cf2e43d1722c4de83a1aea32a4e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b9c6a302a5dca72e4fd36ecaa27b8a0e5e26baed |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/bc4a0ddc67e3f784a62a112f28705e3c2677d326 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4a3de4f5780c83e08d51d3f462672d3d96c8e850 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4b726acb248fd5e9d89637f8a4b490bf2abe99dd |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/7eb3d8faf48d95d1b041fd415e7b080c87d8e1d8 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/20f545de615f15c2b70a37e5d54737d8b8f7b146 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/6f83c9d29ff7ef62f90d5a6470e23b8938e76f5b | ORPH
microblazeel |           vlc-3.0.18           | NOK | http://autobuild.buildroot.net/results/21b9cb0f406ad6c7bd9562e888d96a31d4db1d0b |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/b13d188223f1871ab0d0c3eacb975ee947343201 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/9129a0b4b2d20a9af47c42c637ff3fff6eb3c5bf |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/6234fba149330e1596547a1b9fbd1ba39e6fd00c |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ead914c2aebbfaa7ed6f77c30a860858a9b0b1d8 |     
    sh4      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/817f92e38edd58d954c0e44e3a842a616aed5fc2 |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/f6c2e790915c9302cb0e283f1555beaf0149c2f7 | ORPH
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/bcd8c34ab7dfd17aaad56d1e1e9d83c1c8946eb2 | ORPH
 microblaze  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/df5ad3070f25af0df76d02d23b1d4e52822dcbe9 | ORPH
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9a0d3dca015d41d92f1231d4b2c03cb15f10c3d4 | ORPH
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/0c84ea1a838fd3f97917eba868e37f8c446ce36f | ORPH
  mips64el   |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9004e0e19df6fc4acaab764c40d01ae2117264a0 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e0423b31666f3f0806566043b893621b8eab8bbc | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3bb60cbf372458b47d2285efa1bdc2bb647bf6b0 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/4aad8e248d480cf8b738987454f5b3b653bd2fbe | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/cdcfcccac9059c41bbf15c80543263045d3ebd3a | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3f8fdf4a938fdfdd260bc03341f5982a96ddd754 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6850a352d9738f8e48373f8d6ea85981a9e55a62 | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/3ae937f5da099e18f255ea9a3d505a74cc7ccd4e |     
  sparc64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/52b761778df3e16efc68623a6b37b2f06c75d1bb |     
  sparc64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/da67bce743c49bd8bffa01dc43e2fbccfd687696 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/11ebc3bf1b59d15afeaeb0cd1bd769b2a0727542 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

          janus-gateway-0.11.6 | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/8d2044a60020d8d0dbbf85896c0116bfa33d222d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b01cc19a6f646eb6a644c3232a7328f07dda13d9 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                  xxhash-0.8.1 | 3 
              host-pahole-1.24 | 2 
                  linux-6.0.19 | 2 
                     efivar-38 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
              fstrcmp-0.7.D001 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
  gobject-introspection-1.72.0 | 1 
               gocryptfs-2.2.1 | 1 
                host-go-1.19.5 | 1 
           janus-gateway-1.0.3 | 1 
                       kmod-30 | 1 
               libdeflate-1.15 | 1 
                  mender-3.4.0 | 1 
rtl8189es-e58bd86c9d9408c64... | 1 
                xenomai-3.0.10 | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/dc0e9b4dc72c90fdc6db7e5158e3f408a00fc601 |     
   x86_64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/cd84fcd65ff841fc62b77eac7e2d83389bf0838a |     
  powerpc    | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/2019a42cbec6dde7d1e4b152a2afafa5e637bd00 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/3d5e7adbace9bae9fd379c2ef8b30f740777ee11 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/367e6435b482030994a06c33dd7039c60c1a3a26 |     
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f64bcbefa901fc5e8f8fa6376aa0f5a179c26ff1 | ORPH
   s390x     |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/b0b59a545ecd9fc2e3d09e898fcccb622171312c |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/7622e8d9a829b998bef621b045fd379b8f6870e2 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5b470415ca78411ae258f07636caad2c9a3065d9 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8de60a3347b819c0cc59a3962c115617132fa01d |     
  mips64el   |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/4232fe51254d0f30455f92520ff2cfea6079aa6d |     
   arceb     |            kmod-30             | NOK | http://autobuild.buildroot.net/results/5fa05646e9d3b2c6d482538cf687abac4c32bc49 |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/6abfe47238e27325734cfe86173cc08fb8e7fb16 |     
   s390x     |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/202fc154c67375aec40be5e2c61895944fac34b1 | ORPH
   nios2     |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/962096b3718f0aa2b069c07606b2a5c5acc578dc | ORPH
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/a47bb16272d033af1297d64cf4a451f5b5b383b3 |     
powerpc64le  | rtl8189es-e58bd86c9d9408c64... | NOK | http://autobuild.buildroot.net/results/40ee78819899aa854cb5384a2f4aa37704384e41 |     
   sh4eb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d5c6f066203ff0570c2aa9b3083d3007fd6001d7 |     
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/e26207da8ab45597af56bc0cf28a03c808df573f | ORPH
 aarch64_be  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/0276bae5e9e36731d2a64a3de16449832ee2e08b | ORPH
  mips64el   |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/2c62ce81ea5dcdde4db97c97d3a2f15a27f18815 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c0ffe026640564d8445753ed2626b5fbe76c15a6 | ORPH


Gitlab CI results for 2023-01-31
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971547  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971548  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971549  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971783  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971359  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971301  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971360  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971361  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971362  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971363  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971364  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971308  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971559  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971561  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971562  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971564  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971566  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971567  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971569  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971570  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971571  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971572  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971573  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971574  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971575  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971576  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971578  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971579  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971581  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971582  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971584  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971585  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971587  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971588  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971590  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971591  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971592  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971595  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971597  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971599  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971602  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971605  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971606  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971607  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971608  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971609  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971610  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971611  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971612  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971613  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971614  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971615  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971616  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971617  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971618  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971619  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971620  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971621  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971622  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971623  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971624  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971625  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971626  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971627  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971628  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971629  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971630  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971631  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971632  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971633  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971634  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971635  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971636  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971638  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971639  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971640  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971641  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971642  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971643  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971644  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971645  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971646  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971648  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971649  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971650  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971651  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971652  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971653  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971655  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971657  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971658  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971659  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971661  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971663  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971664  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971665  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971666  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971667  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971668  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971669  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971670  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971671  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971673  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971675  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971676  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971677  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971678  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971679  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971680  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971681  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971682  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971683  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971684  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971685  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971686  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971687  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971688  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971689  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971690  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971691  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971692  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971693  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971694  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971695  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971696  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971697  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971698  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971699  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971700  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971701  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971702  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971703  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971704  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971705  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971706  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971707  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971708  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971709  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971710  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971711  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971712  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971713  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971714  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971715  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971716  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971717  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971718  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971719  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971720  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971721  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971722  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971723  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971725  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971726  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971727  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971728  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971729  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971730  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971731  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971732  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971733  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971734  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971736  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971737  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971739  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971740  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971741  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971742  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971743  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971744  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971745  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971746  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971747  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971748  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971749  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971750  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971751  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971752  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971753  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971754  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971755  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971756  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971757  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971758  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971759  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971760  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971761  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971762  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971763  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971764  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971765  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971766  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971767  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971768  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971769  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971770  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971771  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971772  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971773  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971774  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971775  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971776  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971777  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971778  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971779  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971780  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971781  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971782  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971550  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971551  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971553  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971554  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971555  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971556  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971557  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971558  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971365  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971366  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971367  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971368  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971369  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971784  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971370  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971371  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971372  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971373  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971347  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971325  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971375  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971380  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971393  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971395  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971376  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971378  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971382  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971384  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971386  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971387  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971407  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971409  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971391  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971411  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971399  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971415  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971401  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971417  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971419  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971389  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971413  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971421  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971405  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971397  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971426  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971528  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971403  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971381  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971394  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971396  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971377  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971379  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971383  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971385  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971388  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971408  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971410  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971392  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971412  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971400  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971416  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971402  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971418  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971420  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971390  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971414  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971422  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971406  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971398  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971529  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971540  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971404  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971424  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971425  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971427  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971428  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971429  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971430  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971289  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971431  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971432  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971433  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971434  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971435  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971436  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971437  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971438  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971439  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971440  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971441  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971442  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971443  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971444  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971446  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971447  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971448  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971449  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971445  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971450  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971451  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971452  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971453  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971454  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971455  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971456  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971457  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971459  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971460  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971509  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971461  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971463  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971464  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971469  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971473  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971503  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971466  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971467  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971468  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971471  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971472  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971474  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971475  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971476  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971477  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971478  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971479  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971480  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971481  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971482  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971483  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971484  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971485  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971486  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971487  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971488  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971489  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971490  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971491  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971492  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971493  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971494  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971495  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971496  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971497  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971498  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971499  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971500  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971374  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971501  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971504  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971505  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971506  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971508  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971510  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971511  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971512  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971513  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971515  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971514  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971517  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971518  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971519  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971520  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971521  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971522  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971523  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971524  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971525  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971526  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971516  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971507  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971527  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971530  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971531  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971532  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971533  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971534  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971536  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971537  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971538  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971539  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971334  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971541  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971542  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971543  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971544  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971545  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3679971546  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

