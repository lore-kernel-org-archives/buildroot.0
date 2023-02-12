Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40065C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 06:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D40E60B26;
	Sun, 12 Feb 2023 06:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D40E60B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aoGDWSH7nUYI; Sun, 12 Feb 2023 06:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1FFA61373;
	Sun, 12 Feb 2023 06:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1FFA61373
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E715C1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 06:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0648409B2
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 06:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0648409B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sTfTTW1d0GaZ for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 06:44:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F9D4093D
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0F9D4093D
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 06:44:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5401324000C
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 06:44:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 06:44:48 -0000
Message-Id: <20230212064454.C0648409B2@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1676184288; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rSTu4iTiSfPCEQVA0T8fThmsCqw5UYKwfg+o8/nzgZI=;
 b=DPQZGVfv1pV1RXnZSmqdXT2ZnK8xLh/7c+SjiAjq53l8Cj17e87x0eMoXpSqv3RlZezbuu
 aUhrbRfFUBYtiTQquvv6PEfo2TNSqHCNagpwuVGFZQ9KhWXAuxsyeTszd3hspmFh5Z2wW7
 IvCm6xrbL5iPmrI3V58TY9c0Sdmo20UgHTYc2yd6ELuUTXJ8y7NQoeURrE5huqA7I6Sk9U
 E6SqswRp8vk8yU3Kcqd78v27Y5u52xO9uXvxU0ITrhBhX+WEcH5OFdGs5/kX0GIFZW3yIX
 FO/hb6ahsG5WoUJsW2uP5/isbMsRKIS83bR92y4s+YnGTQ2iKhmvsw/EFWbr/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DPQZGVfv
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-11
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

Autobuild statistics for 2023-02-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  0  |  1  |  0  |  1  |
  2022.11.x  | 16  | 23  |  0  | 39  |
    master   | 160 | 217 |  3  | 380 |

Classification of failures by reason for master
-----------------------------------------------

                  gnupg2-2.4.0 | 18
  gobject-introspection-1.72.0 | 17
                   aubio-0.4.9 | 11
              host-pahole-1.24 | 7 
              host-rust-1.67.0 | 7 
            host-binutils-2.38 | 6 
           python-numpy-1.23.5 | 6 
                       unknown | 6 
glibc-2.36-81-g4f4d7a13edfd... | 5 
                   linux-6.1.9 | 5 
                gerbera-1.10.0 | 4 
                libsolv-0.7.22 | 4 
                elfutils-0.186 | 3 
              fluent-bit-2.0.8 | 3 
             fontconfig-2.13.1 | 3 
         gobject-introspection | 3 
            host-binutils-2.37 | 3 
                host-go-1.19.5 | 3 
               libglib2-2.72.3 | 3 
             libgpg-error-1.46 | 3 
           optee-client-3.19.0 | 3 
package/postgresql/postgres... | 3 
                  boost-1.80.0 | 2 
                    dust-0.8.1 | 2 
                     efivar-38 | 2 
         host-sentry-cli-2.8.0 | 2 
                  janet-1.26.0 | 2 
kvmtool-f77d646ba01d04be5aa... | 2 
              libgcrypt-1.10.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
             lirc-tools-0.10.2 | 2 
            ocf-linux-20171122 | 2 
               openblas-0.3.21 | 2 
                opencv3-3.4.17 | 2 
                     php-8.2.1 | 2 
              php-xdebug-3.0.4 | 2 
    python-cryptography-39.0.0 | 2 
                 systemd-252.4 | 2 
toolchain-external-codescap... | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                    4th-3.64.1 | 1 
               acpica-20220331 | 1 
                   bird-2.0.11 | 1 
                    brltty-6.5 | 1 
                busybox-1.36.0 | 1 
             cni-plugins-1.2.0 | 1 
            cppcms-2.0.0-beta2 | 1 
                 dc3dd-7.2.641 | 1 
             flatbuffers-2.0.8 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/tar/tar.mk:38: /home/bui... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
         host-libarchive-3.6.2 | 1 
igh-ethercat-2e2cef61318953... | 1 
                  jack2-1.9.21 | 1 
                  kexec-2.0.25 | 1 
      libabseil-cpp-20220623.1 | 1 
          libcamera-apps-1.1.1 | 1 
               libcap-ng-0.8.3 | 1 
                libdrm-2.4.114 | 1 
                libmad-0.15.1b | 1 
                   libnss-3.87 | 1 
              libsodium-1.0.18 | 1 
               libvorbis-1.3.7 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20220930 | 1 
                    mutt-2.2.9 | 1 
             netsniff-ng-0.6.8 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
                    olsr-0.9.8 | 1 
              open-iscsi-2.1.8 | 1 
                 openssh-9.1p1 | 1 
                   pcre2-10.42 | 1 
                   perl-5.36.0 | 1 
         postgresql-legal-info | 1 
           python-bcrypt-4.0.1 | 1 
           python-pyicu-2.10.2 | 1 
         python-pymupdf-1.21.1 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
               tcf-agent-1.7.0 | 1 
                tinifier-3.4.0 | 1 
                     tmux-3.3a | 1 
              traceroute-2.1.0 | 1 
               valgrind-3.19.0 | 1 
               xfsprogs-5.14.2 | 1 
             xlib_libX11-1.8.3 | 1 
                  zabbix-5.4.9 | 1 
                     znc-1.8.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/f71660c4d4b476ca0c975774b93d25277bd35368 |     
powerpc64le  |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/1496694423b1e08516a0b38dd3945913c10e912b |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/bdf85a975bd5fec92af13fc86aacd1138622ab38 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c6e3393e21de8d94709dc3bee57ffc4315ee4bc2 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/82ab6b1143f29218189c94b6b9c9bfc0c87d0802 |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f2eb9c0291d6dbe48dbfb1bb7548626cc70c8c1f |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4079951c7c4db612be7c49abb0ed5411a521cce2 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5543b848d3d46d69a293e13fdb7ee5aefcde8c9a |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/230bbd7ed9307751ae2bcb918136eefe57068faf |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b6fd3a866af182edc7831492aecc8323f377b826 |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/26d5083aa5eac332d2db2d03db622f88662e2b2e |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fa2ec92405422306b5b070aa8b68ae4ca6f33f1e |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6dc2532b798b0c987c19f45be2af0bd55528fd58 |     
   mips64    |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/fc2f4cb2d09ffb62c92bee1fc588d89fcb7f40a3 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/a0266bfbb6e93fac8c59d8c446caad3be51f12c8 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/bba03eeff7e2c799543226facb5896d7b87e906c |     
    or1k     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/885b06eaebab89d8c2d488edce5e156875b99e44 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/9b2befe5e5027001b7cbf353dc23b4787720ec33 | ORPH
  aarch64    |       cni-plugins-1.2.0        | NOK | http://autobuild.buildroot.net/results/527a24bdb5eafdf0ae525fb97e46a86076519c11 |     
   nios2     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/4a3e6d5eb23a09dfd05735e8982f0b23158759de | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a29c2c2aa2febd514497b5553157a32537efbade | ORPH
   x86_64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/24289179e5762e0095505444dbc91fc9c97e4512 | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/73ba565cb1e5759b7984c378593e46914a7861dd | ORPH
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2fcdb963a8d33de358144765b59834d2c86db8c1 |     
    i586     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a7671b86e86aefab6b9d6dee4473f923187d9df6 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5d30e4a86d3e7adf02a2e02ccc16bbb740991a69 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/afe61caf6bb31f0cfbb14462e06e70348b976c87 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1da0dd143a4cb5f0032b9195c2908fd713361363 | ORPH
    m68k     |       flatbuffers-2.0.8        | NOK | http://autobuild.buildroot.net/results/ee81e3276a56d784c61e8cdbed21e71264995822 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/156b9657bcbdd8643775152ddd86f438361bcc1d |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/854d6217b942c35e11444adf934abf064b916ab6 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/b82a49955a00854816d6c654d61268f4f2b49535 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/034587fcd69e93b43539e404471ae762b47429c0 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/d088fe4fe557ac5494f3bc0b1d4a7ebfd871da60 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/4354008d7227fd6b40b9453e9716b432b078976c | ORPH
   sh4eb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/ae7dd6fbb27ceea2aeb960a344885a959058b187 |     
   mips64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/9409efeecdc5f4b6da58125b46117603612ad98a |     
   x86_64    | fs/tar/tar.mk:38: /home/bui... | NOK | http://autobuild.buildroot.net/results/d5732622c096304755c0172b19ea91485a37a3e7 |     
   sparc     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/01ba26516d4698209fd33001612f142f266292fd |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/776c9bef9a6847c17e327329bfb6a3d43c48f18d |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/0fb4af5ba536e323536a2922459bfcd4a2bc2bbe |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/755c8bf7b13991e78aeed8a973097cc18beec557 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a4446448e28d7a5cddeb0efcaca8d5d8613b1318 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8256016913018f2ffd555123460a2c6f74972b02 |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/11d7840a1d4ac5d61c8274d41dac7fc761151aba |     
   xtensa    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ed854fad051d44651777ab316f1e2fa1387b54ff |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/a961b6655fc2f35e381024d90f76e6545456d059 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/7b725674e55cf42c3a2b69a9ccf0298865707b90 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/89d849ddbe667dac0755478487bdada850c62e7d |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/86931d5d14a01ce682fcd6cb7fc5125bed128e45 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/bb826a87a14760db31865215b60c7f971c5a7f7d |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/2caac63e5f3b8e3b3e220e55bf856bb9ce0340a4 | ORPH
   nios2     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/4275c68ff5210666c423999a3dd01b7bb9880ff5 |     
  powerpc    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/ffa74afd2f2c91ea0a0f9ac74dcef22fcf70e589 |     
powerpc64le  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/2fe472cb5872b2f4b2bb3a97ae7c75ba8d0afeed |     
  aarch64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/b210b40547cc433f74c1691257854e5b9a387099 |     
powerpc64le  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/636604f8c44bfe83a9640285188e14b256a82742 |     
  mips64el   |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/7cb4b3b2f74aaa0f1a4bd7c120ce6fdb30d873d0 |     
   armeb     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/33496d4995870dd78ce98956349068456898133c |     
   mipsel    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/ff44238599fcaf4f3e4e478e99502072d049f6a6 |     
   mipsel    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/18afdf2d5c3a17017d7b1a07ff89ec5c023bc65f |     
   mipsel    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/00a54d9b68040a037049f3c005269e60b4ccab8a |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/4612c8595a5f272d58e7a5b110e8a954550f1f84 |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/99dd8445fe43d4a8cb8e82e8b0de8bfeb397b64b |     
    arm      |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/47d3ecdde07c7d8c1a38b32e0981332cda15bf56 |     
  riscv32    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/6e06939f297f066e2c74d9039b9ff5b582335436 |     
   sh4eb     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/29cc2e4b3928af437b758025faa074389e839cd2 |     
 aarch64_be  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/05cae498cb3011e7694bd82e083ed70e83183f0c |     
   x86_64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/6d88cc2ab92decec032556169e9acff0bf1c6e96 |     
   s390x     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/bf437bdce6a47e1058808dd02a0b660c3c33d85a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/192b2bfaa738ba565c9e28aa79d5b2c9b02da388 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ab1ad553aaf0ab9781e125b2a62e80ff656d333c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f8a4a22f5647a3b7fd6891f9abec16a16891d16e |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d717262af52fc79e277d2f6dca3973d4ed9ba3bd | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dcd3ad1f6df0c95e6a936af4e761b9161a2e3816 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/877ab3fc6a14f9576075194cf340d514fd39fe83 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/48778423d1c0e3e1624f63be976afa6eb70711bc | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2c1ddff75ea4e88b3da84d43909f32184ea886e2 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/81dd2f05a093c8bb6b24206eb0e4288da6e22651 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/eda9bd5f58ecb009ad9209cf827aad6385fc43a1 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2201c28adb25111bce94ffc33662b49419add7ac | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b6dd766c2be2e4ecc7d76e917ba413dcb5b6548f | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7026ece6f930bc587f6b4f8118bbec63db4992b9 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/aa5e416dc4d30726a3ef058d18dcd54d8e2571b3 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3107ccb171aab23ca9d7f0442644ba23579cbfbc | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1b5adfbcddd10300819ba221bc2d6370b9055331 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5e9347c839a0755fb805515a07acd718a8d8482d | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8f075e3c22114615c052430330752db5549d1d0f | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9880eb9ec39bfdaebbfd0519034d00ead731ba93 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3980db5e84a5b52f942555620c8f5d7d360e062f | ORPH
    arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/13a71aae02df0440c43e7a9e75efd97c9c8d5866 |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9223f78a302a3440985971798d75423b027a2ad5 |     
    i686     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1a93a2c0f085555bb942911b9f3b90bea08b9e8d |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/919b37bf9386b01fb15be2c8cd5bb281ff00c0b7 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1eb4d22cfa973f635199c7249ce2fa5843cdb797 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/90922e7f058b26b13e423bd9a00d04eafb15058d |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2a89ab4e2e87f482527d8367e4d363f61ffa834a |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f21e44ebbeefc7ee0dbec99f58f26810f4ebf210 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bc211ed12ae20117ff601fb98fb1f359a2268e73 |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/12fa4d01a2e6aae462cee6cc93311939c98e1ded |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/45146f5bff2286c217d535a0b33980f469a58b75 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/290f1d7fa9720667a6c343ea57b31676871cd2c3 | ORPH
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/97b2dcb83f94798ffc2285578c753c8e21ac1bf0 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/cacc9a34920d38d04cb74a04d4ce82fbd08a630a |     
powerpc64le  |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f1d83355bb2209fb274525d3d06f5176f0f9bc70 |     
   mips64    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/4728610cb558580614bf5650d3e4fe0d93b60604 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fa82973d30bd569c6fe58ed57c21d51f9cccd3c8 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b51240b397d33266cef85f978fa5819f11d0070c |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/df0f208fe74fc6d773dc3a5ceebedcdaa5171276 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/29fdcc8b0a5eecd151e01077d707c13573c771b7 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/34d922d3b66181e66df1fcea4c4cb15f21f8249e |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c43a15c7a596b454b67716fbe85b4a11652994f0 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2e09d98986abea8728f6dbb54fc2299d2ccbf005 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/72c09448955eef0fdb08f66e7fdd5410855177d5 |     
   armeb     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/0125912d7df0ac6589b298a612f9229332ec1053 |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/92df72cbdbaa957e353204fc93a724b581a720de |     
   armeb     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/614dbdcb98b8da048603b4dc08001c5e698d8c73 |     
  sparc64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/14f876e08b428440be7ce12e8f888a38270a1cb7 |     
   mipsel    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/5668cd1a6256bbc5fc8aa5ea59ed0232a13bd9ab |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/0c69b047e9079741fc8d1d64863bca250d81166f |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c9da62eaca2fd5924a67f49e80f99511db9ccef9 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/470b7e8780183fedba0a8c6033f91e47cd6eea98 |     
   x86_64    | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/a2761f3022c32a6d6a0de3004a29f60bd954cd8a |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/f7e0a450c9b8fb854741132f17a8f12ef7116a29 |     
  aarch64    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/cc175b9d62e0b500b61e7086ac5cff016750e7cb |     
  riscv64    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/543cebf0e7c57746621c6e4161b39a1d479aede1 |     
    arm      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/13c878a41db3ad96233ac3abdbbc917d7600c4db | ORPH
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/5fcc48b7e930d9a9f6567240035bb5e33a7b17ed |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/a40c812a8542023f983d72e7822abba291bffdf6 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/5a8c68191eaedbc7d925c5e66ccaac89412ca0db |     
    arc      |      libcamera-apps-1.1.1      | NOK | http://autobuild.buildroot.net/results/779f61f032e36fb93bd57dfd5278f8d9970efd31 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/46fc2f7ea1a75ecf7a87eae652cb86c668f84f8f |     
    arm      |         libdrm-2.4.114         | NOK | http://autobuild.buildroot.net/results/a7b7b140baa269ffafeeaa806f4a3b9520837bf7 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/cc0120608276ac96183ac0fb74a5e7a07ac6143e | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ecd8427b5e2221d2aa985fc4719f2e79f80cddbc | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/023eb79f98856c1ffda364abfab176dc8c08aa5e |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3177508b94377fd630b9571ff06d89423d73ff9d |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5a577e6f88d765b9265097ae24c8c45597e4562d |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/1a335a4dbcfc1f9b53586e15fbe0ae9f5e65a478 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f5ce6b952fc1e883e66e14c18e3c33607930077d | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7cbaafc37c631ceee5a7641dd0cc71f6cec8367b | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/9cd33e547cf10ed01445be3bf2570b039c234c65 | ORPH
    or1k     |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/ecd18a499b065df32de7f77ae6d59bab59b58545 |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/84a64b76a8ab22c15744bc53c9a192fd5e96f3d9 |     
microblazeel |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/545e2c31b184219f31853ba9a5917cf09d0adf01 |     
    arm      |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/fb0d0b0053a84ae623d19301af1b79c6f1491497 |     
   sh4eb     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/d2fd543e869e106991149a0428341225512f1fa8 |     
   s390x     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/bd897ec8904d99e2ad00169d3a5bc2d60a7a5491 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/f8c17715deafa66a3a1b618b6e84fc1a855c403e |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/954056512e8520796c34da817d83de1223751637 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/4ea8906998142a5699aac16991223402741cca8d | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7bebee92854654e003d7744c5c67d9008854a91e | ORPH
  mips64el   |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/b0d0346959823ea25cffddaff0dd60fc3a1e77d2 | ORPH
powerpc64le  |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/15c2a713c64069a7209d5502455c2ae25ca364d7 | ORPH
   nios2     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/a3019e18bbae0ab29175cf563cdb2625bb448103 | ORPH
   s390x     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/f02ba9479d1f7a5a8750b04546c4de7c247781c1 | ORPH
    arm      |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/1b976f01d2265a7cc7de2f5154a7a33fe5a68337 | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/d1052215f52a86766ffbd5788fc74c3f5a35e5f7 | ORPH
  powerpc    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/85e24e24d4cab0f9c3eec86ea4d49b7daa19f924 | ORPH
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/ea7772d79cead8db50f69b3ed7c2172a0d23c1b1 |     
 powerpc64   |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/e9df082789138491b54c5ddbf0c90d1d1cf81f45 |     
  sparc64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/8ca4747980c947a9e65517724b9812a04eac5b81 |     
    arm      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/0e53794f0b641a98089cde954dbd1c737481fc4d |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/45a327dbfef5e1d29dfdbf86ebcc891ab785a908 | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/4bd97c2615e8986b8fb4b9ae96b17c3abb0ed392 | ORPH
   nios2     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e182a116ff7d1b4a1bcdfc200869f49433e92ef7 | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/96dd3343a69089c4839a630a1bae622293bda0f4 | ORPH
   nios2     |        open-iscsi-2.1.8        | NOK | http://autobuild.buildroot.net/results/f8e398219ca1255cf1c4e332c6655c09d7cb44d4 |     
    i686     |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/4089a78fe14d77775addaa608e001f5d5c836f9f | ORPH
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/04fac9beba7aeed52a29565388b3a841a7e00f07 | ORPH
   mipsel    |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/f057d8947a7d1e2364fc501a416774cb5d058073 |     
    or1k     |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/6df56ed45c247cd825eee2413d118c2c393d3a92 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/b9f5372dfc90f62b6c2819c9d1fadd142c3477c8 | ORPH
 aarch64_be  |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/d90461b7d0cefdc3fc6d887732b4a7ebf49143bd |     
    m68k     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/e1c6b5c9e841a003037045b2ff7afd9836e7c640 |     
   mips64    |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/4f63f841ea5f70ac3dbedb7ded2764be01302082 |     
microblazeel | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/9bb387de5592c007f70c61702d8aaee4927a7494 |     
  mips64el   | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/c2f5101c8b6ee22bddf7523c3dc9f281a9ce5fc9 |     
 microblaze  | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/ff43dbc86b2251b56c9a4b601386fca32aaba836 |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/454ff2f2653d7a422e7d0be779bcd8194718a421 | ORPH
   mipsel    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/630cf4f5d3309bf602eb1b84be4466c24308484b |     
 microblaze  |           php-8.2.1            | NOK | http://autobuild.buildroot.net/results/727fda6192a991f3d13bcefdb52b820a2b577996 |     
microblazeel |           php-8.2.1            | NOK | http://autobuild.buildroot.net/results/b7046244c32a6668e7db1707814606b23f5794be |     
   s390x     |        php-xdebug-3.0.4        | NOK | http://autobuild.buildroot.net/results/3a0027566058c116dbbda73b4e8e22f884a35c43 |     
  aarch64    |        php-xdebug-3.0.4        | NOK | http://autobuild.buildroot.net/results/82aaa741020b6351134707c040dd52fe53c961a0 |     
    arc      |     postgresql-legal-info      | NOK | http://autobuild.buildroot.net/results/4cf0ace588acfaa95f852254a00258dd1a1e6440 |     
    i586     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/46015ea4894088cabefcb8123cb454680d0a20e6 |     
powerpc64le  |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/5fd6613b2431977581f8d72236c57814dd58f776 |     
  aarch64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/43c236c2e9afe397a35f2b2e8f77a2eb57cdb2ff |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/23f716d5da90370e030863a992be53a0c6ee4279 |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/7975455b922d2f74aece0014a560eea28c88d905 |     
    arm      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/0cab762be7c0790600772cde2455895feae9d830 |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/13c5105201cb38fa43401edb21c9ab6592eedc50 |     
   sh4eb     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/968a69a9c9ea5ab20b78e406be91df0debce3614 |     
    sh4      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/ced0f118567a1e4b960d27c3e9af5bf44cd2d0cb |     
 microblaze  |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/88e01ff306c50cc1167c34d4f41e2f977a57ac0e |     
   mips64    |     python-pymupdf-1.21.1      | NOK | http://autobuild.buildroot.net/results/28c63f1deec36cbe0568e7f64a198918d8fcc0eb |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/cacc80d52075fbc7713e2ee2a235d2c40c7ca576 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/a1ce811a772350b06431a0db5cac148bae68e533 |     
   mipsel    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/1f04b0be29a694661c8879e404f4a720c19fe3ab |     
    mips     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/0326973e09acd00e261f7d039f3063f9a038aa0c |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/b6caf0818d47c91a29c3092092da3f9c1fe59cb2 |     
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/d6799f39bf91540436a706ff9c12d5ffd6f83114 |     
 powerpc64   |           tmux-3.3a            | NOK | http://autobuild.buildroot.net/results/cba06f3bb6d9be25e91f56c390a70ddf9904832e |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/15257dba2b191ee50dd7efc96ef345b32d826f95 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/8320dfaa6e0668d46404cf15c25fe985485cbb1b | ORPH
   mipsel    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/5e2c8783b9b187b76511581e41a40647af17045c |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/1efc7254fd8cb3f5108a16d0734419f826a41a2c |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ee9cbfe261eb19e9dc97fb1e41d355b6f14e1483 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/78b2ce901b150c648c6062b0966001c70cc797c9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/21a518dbfd9cca7964bf174596d4831ace422673 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/94d1789cde17860a445d5439de53597cc8814bf6 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2b8e1fdddac0ff8aafb5cf34e76f7ff7833a12b5 |     
   x86_64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/a456f6eb27b910bbd898c2e79c5a21e8d53f72f8 | ORPH
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/69f008db57e7e40a40e61b7a1fd51f89191fcfbb | ORPH
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0faa6029f3489062b131e2e5b880d1497c592e5e | ORPH
 aarch64_be  |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/aaeaf02c0d0ed00c7874c6826f4d52891f2d7e9c | ORPH
    arm      |       xlib_libX11-1.8.3        | NOK | http://autobuild.buildroot.net/results/c67086973444535202e7de22f09223a940bc077d |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/60b26d90a2cc689858d2bcfcc5740003e3d7fe4d |     
powerpc64le  |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/08a253d46cffed50ad5618c3302657670c75de79 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7bc4aa0350c208443e1c3bc90ae0fe632e306a15 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

           python-numpy-1.23.4 | 2 
                      xz-5.2.7 | 2 
             batman-adv-2022.2 | 1 
                     frr-8.3.1 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
                      gdb-12.1 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
           heirloom-mailx-12.5 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
                host-go-1.19.5 | 1 
              host-rust-1.64.0 | 1 
                       kmod-30 | 1 
               libglib2-2.72.3 | 1 
                    musl-1.2.3 | 1 
                    php-8.1.14 | 1 
                 proftpd-1.3.8 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       batman-adv-2022.2        | NOK | http://autobuild.buildroot.net/results/f31e00f9d67caf78169496291bafbb3440d824cd |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/0f53ca6c1c76a875f884eefa1bfceb306bc7e908 |     
  mips64el   | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/59d9d6590460d3f10ed18486bd2a91b6eb4292a1 |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/0c46bace1c20c6d8a0c73d0a4bd3742a3c28e971 |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/4bce8066baf2c788a2b1558fe72b59b8e45bc6fb | ORPH
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/26b84f6cdd4472f57259d89098bfa417dfe1b464 |     
   sh4eb     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/a5263fcd2967c89ba511ab56635f6c6c9e25b63c |     
  riscv32    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/6f23be3eeaa1fe97373d6234eccf8f757504f889 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d1cadb0b5e3bf74ce383852f52bf836bf07e6a3e |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/38d27136d8a7ee06c5a51dc0de5ff3f6e934343e |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7ddbf5f3e4b716daac8547c818ba2e43cb1e8a59 |     
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/f1f87ddc9437f8c859b32f3f074d5ef0fd3d6f54 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7f5f32e70b347bfececb3f11752aec31951af7a3 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/48f1b33b3cd03d827f89d2e0c199c9e82ad32e8f |     
    or1k     |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/ca4efdb5c7cee172debee50c103176c0b4a5e583 |     
   sh4aeb    |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/69029e7f421b99aafb4db90df9893e5280fbdde2 |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/3cd0eb1b4a15f3b11902f323cc3b28da83875906 |     
   sh4aeb    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/9d5072983dc6c71de8430af27d832b75d0552c3f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/48b2b87b02ef2163b07c84977c7922d60330443d |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4f7b9aa4247750e058d461562d8f6e0cbd22f942 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6d172a2890c20f0db44204ca671153f695f10694 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5c1d483bcfc6de10d720b51eaa4dfc2ad8ecb9eb | ORPH
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/a48722a7a3b0435480d34f3a073460284cea94d4 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

