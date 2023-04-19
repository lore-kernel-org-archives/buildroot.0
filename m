Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7884DC77B73
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 05:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB39607D6;
	Wed, 19 Apr 2023 05:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB39607D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0ndAQe6uZAH; Wed, 19 Apr 2023 05:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4934C60F06;
	Wed, 19 Apr 2023 05:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4934C60F06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B58AC1BF318
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 05:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 871D981F0A
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 05:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 871D981F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kaVD1yY5-OL for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 05:44:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2EE381F06
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2EE381F06
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 05:44:27 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8BC21C0003
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 05:44:24 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 05:44:24 -0000
Message-Id: <20230419054430.871D981F0A@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1681883064; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eKxsd9/o5BBpHPSEPVGBbDwUDDpAbHvtVef8CpBdvSk=;
 b=OBs8/6770zxFhphuRDHKEkTZk+O5VNRAyQO5e+QctpLDqZykuoAtKOcsz9xzY07QJxcP0w
 T/cpiQ9rV20+eSRNOU91ru1r9w/B4ISFOTu4DUPn7wLktZgqZcJE+VsWXoxRSIpsYMxJB0
 gWVx4Y4z/jbTimlgE1jRl3HimuWFDH5E/0XyiIJnAPes62VXi0MjOiQV57PPnSu+4K99v2
 eSFfySCocUwWMtvH8vcsWVJssedU2RvPWbFqwdm8+8zwr3HDGNaqaWo9sJEjvMTPXuFiLq
 460QtVaAoOdPbZCPy1mseOZ1tyQDBb+whmvXTXqwwXLiGf1+JLttNfPOxzfzow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OBs8/677
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-18
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

Autobuild statistics for 2023-04-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 14  |  9  |  0  | 23  |
    master   | 201 | 175 |  1  | 377 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 9 
            host-binutils-2.38 | 8 
                 agentpp-4.6.0 | 7 
         host-gcc-final-11.3.0 | 6 
                host-go-1.19.8 | 6 
                       unknown | 6 
                elfutils-0.186 | 4 
glibc-2.37-2-g9f8513dc64119... | 4 
            host-binutils-2.39 | 4 
               host-qemu-7.2.0 | 4 
              host-rust-1.68.2 | 4 
               libglib2-2.72.3 | 4 
                   perl-5.36.0 | 4 
fs/ubifs/ubifs.mk:49: /home... | 3 
fs/ubifs/ubifs.mk:49: /home... | 3 
         host-gcc-final-10.4.0 | 3 
              libgcrypt-1.10.1 | 3 
                  linux-6.1.14 | 3 
                    olsr-0.9.8 | 3 
                 uclibc-1.0.43 | 3 
                     gmp-6.2.1 | 2 
                 haproxy-2.6.9 | 2 
         host-gcc-final-12.2.0 | 2 
                   linux-tools | 2 
                    musl-1.2.3 | 2 
                     php-8.2.3 | 2 
           python-orjson-3.8.4 | 2 
           python-pyicu-2.10.2 | 2 
            quickjs-2021-03-27 | 2 
               util-linux-2.38 | 2 
               acpica-20220331 | 1 
                alsa-lib-1.2.8 | 1 
android-tools-4.2.2+git2013... | 1 
                apparmor-3.1.2 | 1 
                  babeld-1.9.2 | 1 
                  bind-9.16.38 | 1 
                blktrace-1.3.0 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                busybox-1.36.0 | 1 
                  check-0.15.2 | 1 
             cni-plugins-1.2.0 | 1 
            cppcms-2.0.0-beta2 | 1 
                 dc3dd-7.2.641 | 1 
                  dhcpcd-9.4.1 | 1 
                    dust-0.8.1 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
            host-binutils-2.37 | 1 
host-gdb-arc-2020.09-releas... | 1 
host-sunxi-tools-1.4.2-168-... | 1 
      libabseil-cpp-20220623.1 | 1 
               libassuan-2.5.5 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.15 | 1 
                libpcap-1.10.3 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20230127 | 1 
            luaossl-20220711-0 | 1 
                mongodb-4.2.18 | 1 
          ncurses-6.3-20221224 | 1 
                  nginx-1.24.0 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                    ola-0.10.9 | 1 
                 openssh-9.3p1 | 1 
package/rtl8821cu/rtl8821cu... | 1 
               postgresql-15.2 | 1 
             s390-tools-2.26.0 | 1 
sconeserver-8d1935919a20133... | 1 
                    sdl-1.2.15 | 1 
toolchain-external-arm-aarc... | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.3 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                  xvisor-0.3.1 | 1 
                    zeek-4.1.1 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/9deb5a93258dd0d3af1fc3c150c8e792e426e684 |     
microblazeel |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f1c78fe2bf8ac55c539c0001621f8404d8b99065 |     
   mipsel    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/50b312f6d2f461c9f099e53f78df7f4e06645adb |     
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/1b10b1be2531339a69cb0935f5f2d8e9ae830bc3 |     
powerpc64le  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/c2d2d51d70fcd96d07df96c3f0511d10506b19da |     
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/12a3293aded71a27d545f8cf7cbe437db266c2f8 |     
powerpc64le  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/79d02a7ed28e4d888b6ae18277d8c58817e230c1 |     
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/eefe6ac68bd002d6945791561a66ca192a051b66 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/7a64d9c30f2c658cb58bd40ea138a063e552a366 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/883ca4ad04b6b62f3956c6411999385419240b1d |     
   arceb     |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/fbab74aa15c6abae88f395d29a9a13d8bd13170d |     
   x86_64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.net/results/762b0aa3805aca803c1bbbf1ea183da2c4030ec5 | ORPH
    sh4      |          bind-9.16.38          | NOK | http://autobuild.buildroot.net/results/36a71cc830fd290af008208db7c4f21ff10281ee | ORPH
   x86_64    |         blktrace-1.3.0         | NOK | http://autobuild.buildroot.net/results/9c4975629521094e8b9809aeb92f1cc1be989721 | ORPH
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/efd1cf4050f709be9689e192b67f645df56c6753 |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/239e7a67dc4fe2a3876a39b7d3209ab61891db6b |     
 microblaze  |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/235b9741204ed6e53378883d261bdb27b625469d | ORPH
  riscv32    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/5631364f1f664b3d0986f3fd8aa8a2c5e66402bd | ORPH
   x86_64    |       cni-plugins-1.2.0        | NOK | http://autobuild.buildroot.net/results/79a4d622005011d4ae471a324f88071dd0df06c8 |     
    or1k     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/a3ef0d42a2cf83e89f55e3f95b9c96641ffbb83a | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bcaf539a2de5833a5c397db61444ab971402a3a7 | ORPH
  riscv64    |          dhcpcd-9.4.1          | NOK | http://autobuild.buildroot.net/results/938b56a1ed849fd07772f8694b633ca42228b0ef |     
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/f276c85a358b26b79083cc9c7a30465b71025553 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c3e72282670f446dadde0d8e70cecfdf8efb4f08 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6099a72396eb5a0965703e8eedca128afab2cdab | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cc1f4f9d5b5fba2eadf235c0d9f1f1e357785e9b | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bb111db0929c04d571e8ff4fa9dd2c01ed020234 | ORPH
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/c4b10beb1bf83685932e0823cdca5b945dc65a38 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/d44c80c20f8eab22c5a52ff075839056f091bf07 | ORPH
 aarch64_be  | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/64927051b4174dd8e358971462cd92cd61b60b1f |     
   xtensa    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/c84d7fd397b00c6a2f51594870b2ab0c7035c922 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/060e1a4740e305dc2544765f0d1e8f019043caf2 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c9b08f7cd8aca3057275bcf7ba4bdbabb7b70f7f |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b4175073c997ead970cc96867841d4466545d4ff |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/58a57288ada82c927c8ad68b56fe49840bd21141 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5dac072cb1e60d3f72540a80060d470c4aeeac30 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ba9594b4ea28b3468a59312e1bed29c2330dacf1 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/eb73a8d88897c80a8a7bd2fa9addccdbd38a04fb |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ac2fc294f495ad195c837f4abd6f140308cd8d8a |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/76f777a6c302560ba9216b85f0cf57f31bee8b0b |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/43553342d321d2ad1cdb52cc010664f36867ddab |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/04f2daf5fac7bae0d14689ef9fdc8f72dc14243b |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b5aef7781aba3e331e6f630e84e8cd7b51e2eca7 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/99ce63dcc0ee2e0c9ccbf6f6fe5110e40e25a1d2 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/3d0bd8e1c84c7c16b8aa8f516a1b2d4c4d9fc4f4 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/7e8678dfd5932f7df62439f67f5bbe57b9c7b726 |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/7914294c26402f957becc6f9128e1170a63edf8c |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/6714c7d47d92fe95aa002469b088134d06038ecd |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/4b33c84013f7498dc0dad1ac4206fc6ab9c8662a |     
   arceb     | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/7f9e911876da90c25fcd09eedf3ec8008d10fef8 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/a1f6de07a8d5bbd886b2eff9b74e6ed10aab2387 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/4927aef949d9eb6dc40345acd2f6d2d563a7c9e5 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/0e455676d44bf0d46d31f53f4ac9c4ce475b8d8e | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/df0d58fed2b16a46d7f42e159dbd248ed3a41841 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/6c98c6c8b86194ef7e66a11184f1e70ba7f8bcae |     
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/daa98bafb5823a98820b0c32aa7f1e5d3f567147 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8b50db75ed7648852bbe68f6924e712ad48e1580 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d42c322f276e69cdcc9f19b2cd45e7a5ec353184 | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9e86c8440a9fc3519e87b0cb1229c6081c61891c | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bb581a6b4fbd6830feafe7f5dc9c18f29a522b9e | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/98b24e95e053fb9cebb150bdf86d3f5b08c838a5 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/85422abdeb510b13ad9ab5dd45c1b4156a7a56de | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8ea0d10fafbf4b9b91bf5c7c21b42ae97ded23a0 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/03801aa0f30b78c0354bc8b45fe3ac3b2c808903 | ORPH
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/45fda48308f1fe708bcb94c79279e6c04d3d6c92 |     
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/afb5e075203bafe364054a9c98fd68aaa5999723 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/91573f9af38cb9832a4794e6bcf71a5505bb39fc |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/81ed38c27bea857d1ea310b706f8ee89fcecddff |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f1ec5694f61c5f85066383efa8623d08a2da2a25 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/65f1d7b98207f1269e820439f8ec2f666d828202 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5d272cd52ae187e7c79cd1e37e2a1176db5158e5 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9ff36db918b20cdf2a8fa4d485484f1047b06e15 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a88fb610c8196c9fef2bebfa96ff89e1df1d2db7 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/adb1a82875a44cfa9102d5a0b1115445256cb4fa |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a70f342d28802896c86e79b1a0d08bc4521f2b7a |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1580a34311a3dc0c3061ab860fb238237431dffb |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c944a33c5464fcb48b404257f198a833d2afaad2 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8e2fa51e0cc18b1880dfef7a7e1e17673ab0d8e9 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1ac83d1b4ae5c5774b7c3561f3fab2794b2d1bee |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/dc680e03c3c3179be981e71cf6278b2e504e825c |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/2cbf67fca9c16c15df7ead07b8de4086dc73488d |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/c2a9cd9fb0237f4e110bca74e63669df863eece5 |     
   armeb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/18182bb8fb3cd4b90c1c00200641440785be67b2 |     
   xtensa    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/63f235782a518493536a2046a344ed9d99387a1f |     
    or1k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f30974771ddc049494c3a5787d9bc6e42b2ab063 |     
   mipsel    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/aaa1ac62abbda8898dd6d3684c00418e5b7fee84 |     
   xtensa    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/81aa18bc99300ed69ceee6cd46c12454a53984ea |     
    m68k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/5fa0d0f03f86053f949bf1f2218bd4634092ca27 |     
  aarch64    |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/bcbca8935b34498d2b3ed09343d5af791236c97f |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/47546420a37eaae609f36cef14c048f3c93e8823 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/028db6318b2716870f1b836031b167e4618985fb | ORPH
  aarch64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/c95629585b9b5fa54a154a01c72269f9e7644a85 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/0429f0a55a1f4c633bd5a6f6925547957ba2cb49 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/c82c882011cc6ec751eb355d24305fccbdfa2bea |     
    i686     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/d5d0017ae41ab49dc8723c03a0a4e91b0526d1f2 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/fc433a16523608e14a9b37c2fed9f150572ab237 |     
    i686     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/fc589521df9b7eb2660ab24b6e1c88e216cb9146 |     
  riscv64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/74f45ebbff08b91907b6f25bd8ba8f70c8a3079a |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/7ea1209a685805703bc161f6aa12d2b95671ab3e |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/334e139fd5b24b0bcf7a6d0ba6be2bb8d155ec0e |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4cbdbc86df5e6c16648b7125b439ce1090d0fe04 |     
    mips     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/e6ab890b0f100a7e91e1befa4f03af680e4c2408 |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/60f7f7973e28653488d41c9432d634e90efc5656 |     
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/d0ed1c658f8bceb5255b649a7ec30a66c6d85c03 |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/d02970bcc7a3b9f70ecc8cadc3d88d0f8a6827b1 |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/fc89b73eefd4424ea4145a318bacb9b3e459d018 |     
powerpc64le  |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/0a758fd34fd791e19d2db9c69194968db239d799 |     
  sparc64    |        libassuan-2.5.5         | NOK | http://autobuild.buildroot.net/results/873352c1da7e8099113fa6bd996242168800e60b | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/9e0b4930612d116ee5f71c5984b22f22caa547b9 |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/6fdbccf3ce82d706b12971c7ef270c9e5d18689b |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/682d57ddc59c82790094f1225ac21243c596cdc5 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9fa0d6799209213c29f66c48b9052cdf27ce5e29 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f180bfcfd73800951a6f13679a47d1a10800533e | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/dc271acbf65c81634203eee3655049741eff7f00 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/eb5b9684d50f9b55b26d44e97c69582045df1ade |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3bbf5a98fbc36f1956503c19d51958914ee2d0ce |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4bfe8d8fada19eeca340c0ea27bcb126105a205e |     
   xtensa    |         libpcap-1.10.3         | NOK | http://autobuild.buildroot.net/results/fe650da138937b9586859633c8e68f40d8579957 |     
    sh4a     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/7863eb282cf41ddfce5b73b53e2bbf2a0779c7bc | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/42c25b1daf8953cefc0adb8ea948f0832146554e | ORPH
powerpc64le  |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/4a65e85f95e3a87e0735abc9e0b13739c7b99d80 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/ee70610516c167ede55d4e3a30c7608fda39a744 | ORPH
 powerpc64   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/82b83bd90c2f59c89a3abbfa93c6f92034d0cf70 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/2225c06ea920bb14c094d3bd308ca866a650e58c | ORPH
    i686     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/d11b43bc360fc776e474689e474f283c7abfb350 |     
microblazeel |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/fd0dd8071597c6ab5917d900b69e97d094bdc027 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/2ca8052808111995024885b40180e84501d3d9e8 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/fe581ef7ede66094db22fa239cf21e813a67a2dd |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/1e756e8b3673e20b5bdbde70ca247d33ce0d76a3 |     
   mips64    |      ncurses-6.3-20221224      | NOK | http://autobuild.buildroot.net/results/c415a3fd23f312172090a3de09e653e7ce756b7a | ORPH
   armeb     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/d72c1749e9390da825469f3d6c971ff7fae0dbef |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/965fe7e101aff6cfb876d671482c8ae9abf53479 | ORPH
  aarch64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8215835eb08504b38afafcebe3b7a7d63bad5ebb | ORPH
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/916f0fccd7fc9c0c9283c7e826aea28f8b99e11e |     
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b1a69f28bf3ee63e8bb3f609b032647eedf569cb | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c8656a71527520ff6a81a7b6f856d856f969de4b | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/14940b177cdf0c7a456b20a58e738730dde16a4c | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/60b359b3ae554a960f2f0640d992ac607b557c26 | ORPH
 microblaze  | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/72b603b3c49fc34f0f581dbe5f03418a538af5e0 |     
    mips     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/376ecdbbec7b6607dcec8b12d033a71c004fa3d4 |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/b04f4a98a6de840a45e521500b4d1f2b4090f813 |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/c31aa6d483cc118098a9ae06b7743415a7886e4c |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/ce9f1642e76c1995eabb89ce4bff95256c56580f |     
    or1k     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/fb61e7fc6bcf297432a4055558dd6c5b4d31f7f1 |     
   sh4eb     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/54d753e924714f53a0264f8213e8a3ef0976eb2f |     
   arceb     |        postgresql-15.2         | NOK | http://autobuild.buildroot.net/results/3f9f28bc8125ac4e70f7da7ae4cd4bdf1eb40a83 |     
    mips     |      python-orjson-3.8.4       | NOK | http://autobuild.buildroot.net/results/224af84eabbc1965f5e8d19b8fbf31d74076c60d |     
    mips     |      python-orjson-3.8.4       | NOK | http://autobuild.buildroot.net/results/95b47aee0c05097cad7f2f1484846c041bb22217 |     
 microblaze  |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/d19a77e257e5d0647d3dcbac0e08d0ef560585a4 |     
   nios2     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/52ed125d147557c40afc72870828736ab1d43f00 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/313ddc27446b6b269bdf4f786288ae1a611d36d5 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/4f15ffa16019cdfd816337cd3f41643e43f1fd25 |     
   s390x     |       s390-tools-2.26.0        | NOK | http://autobuild.buildroot.net/results/1c89e6d0ba0d1baafa5f1c5bdcc4dfe0cc4382a1 |     
powerpc64le  | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/07709f0f749e82f57d8f9682d20496f4834bc93c |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/997accc6642abe3c29fdba182463904aa02468e6 | ORPH
 aarch64_be  | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/5516daf88d3774f76d6de6ec711e760c4eafd0af | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/5936b9ddf9aba64eeed4c24c6df640f2068ea2f8 | ORPH
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/955576d783db0457ae76b66e4a75a5d5376cd56d |     
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/2ac04580cb94bbfe56ad4d1b19e04145dc27a673 |     
    or1k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/b093bb34b41c3e50b9e048979221efdc611110ce |     
    m68k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/fb218523f2df2023b0f470498c6759fbdd6ef909 |     
   armeb     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/748131a7c68e37859d26bb8ec178ea9a6ac3fb6f |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/fa7bdd7c67c11d5421a295bfc7c55f5819e3a2c7 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/3288b62fb0d2fd9bc2b3a2c1d9ac46785b87544a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5f49a82917cc383029e1169e378fbf18f85de2c2 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/0062c1a82bafc335488199bf59c0352bebac20b2 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/38f5e401321c5cc8b5446cb08d14681aba568727 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/4431aed678dac31a3113f268c82515b8ba4abb38 |     
   xtensa    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/0d0f3c6b7fe6397d70b7a7f8b8e0a59f4e0754ce | ORPH
  mips64el   |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/e11671c0043afbbfbcd093b19326d95695c461d3 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/168068cc456031bb840f7f7161bbb8b7f6b00c54 | ORPH
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/eb1761e111d2113fb1f45681c4ef6ab04695be28 |     
    i586     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/3fa73d627fa75e6c8f0cb56249fe6d13a8a0e44b |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/008840d158ed8971fef9b02d52e41041668105ad |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/41290c68a19a82bebacb1ef7de1ccb1ee8ff366d |     
    i686     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/f53b510b4c2798dd77cfb9ccbb7af0ce8d5fd5f6 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 2 
               host-qemu-7.2.0 | 2 
                 dfu-util-0.11 | 1 
             fontconfig-2.13.1 | 1 
         host-gcc-final-10.4.0 | 1 
        ltp-testsuite-20220930 | 1 
                     php-8.2.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dfu-util-0.11          | NOK | http://autobuild.buildroot.net/results/bc225366bc8369073c9f5694f38ad82ff9d820c3 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/6a518c70c62406ee99cf22b2bab8bf410eeb4412 | ORPH
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fc8bfdc1d773920f918d9829d8b32bc881026215 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9799f61adea26f082c6be2a8e2ea40876e4192a3 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/0d14e6132b8522df626982ff0b4691837e59dde0 |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/c109f4534078f5910510ca49def9ef00085ae272 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/b85dbf377c7d51732ff76b998cd138ce4231c709 |     
 microblaze  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/971b94b4f4a8573fa457890d5794a7b9e82f71a6 |     
 microblaze  |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/dd66a8d332618a4d5fec4818ca170428522edb23 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
