Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D38C3DA7D
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 06:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E534981985;
	Thu,  5 Jan 2023 06:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E534981985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oawvSVFKxulA; Thu,  5 Jan 2023 06:50:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BB981EF7;
	Thu,  5 Jan 2023 06:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2BB981EF7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 288781BF82F
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 06:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC7DA610EC
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 06:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC7DA610EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y61c5lcQ-ZNi for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 06:50:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E9B960E7E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E9B960E7E
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 06:50:28 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 990D4C000A
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 06:50:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 05 Jan 2023 06:50:25 -0000
Message-Id: <20230105065031.EC7DA610EC@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1672901425; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T5q3xwOvRbVE8HqZHYSotFn2yuzT1ZbLqCifH/LF5/4=;
 b=LPjhbWnqmhc2gKZzm7Ewww2llaAzh2AzcmnAaIMjVnT5J+xsfqwQggpqszENwTl9vbj8Ac
 NuUyD1gvOtYQamZyTR0rJ2C+Tp8WESTjQfkEe/ahzZ8Jn50iEgWQnIOvdQYSjuPjyMC8CB
 uNEICAalzFEhGimJ01P3KxmY/mqqTxSR080clRFJ5WkV73VikCnmV8qvqnC+VxWZs1lhNU
 0Pa0anrfM4UmTffmgZo+NzJ0rzTCuPMwSLrycgCY7XFedndF8rCyBOci8BDq6AXfgi7Wfe
 X353lW4MCjClqa6PI26AyY9nN9lRCSiCr4+vaQZXsmDuQlKvqxWz4W9JrlxktQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LPjhbWnq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-04
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

Autobuild statistics for 2023-01-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  1  |  0  |  4  |
  2022.11.x  | 13  | 17  |  0  | 30  |
    master   | 140 | 345 |  0  | 485 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 44
host-go-bootstrap-1.4-boots... | 32
             libgpg-error-1.46 | 25
                    fwup-1.9.1 | 20
         host-sentry-cli-2.8.0 | 12
            host-binutils-2.38 | 11
       host-gdk-pixbuf-2.42.10 | 10
                    opkg-0.4.5 | 10
                    bat-0.19.0 | 7 
                   linux-6.1.2 | 7 
                    dust-0.8.1 | 6 
           janus-gateway-1.0.3 | 6 
    python-cryptography-38.0.4 | 6 
                    brltty-6.5 | 5 
           host-libzlib-1.2.13 | 5 
    host-python-greenlet-2.0.1 | 5 
                    norm-1.5.8 | 5 
                       unknown | 5 
                     xz-5.2.10 | 5 
glibc-2.36-66-ga1dc0be03c9d... | 4 
              host-rust-1.66.0 | 4 
           python-bcrypt-4.0.1 | 4 
                 wolfssl-5.5.3 | 4 
                    crun-1.7.2 | 3 
                elfutils-0.186 | 3 
                gerbera-1.10.0 | 3 
  gobject-introspection-1.72.0 | 3 
                   gvfs-1.48.1 | 3 
            host-binutils-2.37 | 3 
              libgcrypt-1.10.1 | 3 
              traceroute-2.1.0 | 3 
                  boost-1.80.0 | 2 
             dahdi-linux-3.2.0 | 2 
             fontconfig-2.13.1 | 2 
         host-gcc-final-11.3.0 | 2 
                host-go-1.19.4 | 2 
              host-pahole-1.24 | 2 
              hyperfine-1.14.0 | 2 
               libglib2-2.72.3 | 2 
              libostree-2022.7 | 2 
        ltp-testsuite-20220930 | 2 
           optee-client-3.19.0 | 2 
           python-numpy-1.23.5 | 2 
               valgrind-3.19.0 | 2 
                  zabbix-5.4.9 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                alsa-lib-1.2.8 | 1 
                   bash-5.2.15 | 1 
  binutils-arc-2020.09-release | 1 
                 dhcp-4.4.3-P1 | 1 
                     efivar-38 | 1 
       freeradius-client-1.1.7 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.15 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-12.2.0 | 1 
                  jack2-1.9.21 | 1 
                   json-c-0.16 | 1 
             libgpg-error-1.45 | 1 
               libgtk3-3.24.35 | 1 
                   libnss-3.86 | 1 
              libudfread-1.1.2 | 1 
               linux-pam-1.5.2 | 1 
             lirc-tools-0.10.2 | 1 
                  mender-3.4.0 | 1 
                     nmap-7.92 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                 openal-1.22.0 | 1 
                   opensbi-0.9 | 1 
                 openssh-9.1p1 | 1 
                oprofile-1.4.0 | 1 
                    php-8.1.13 | 1 
                    pixz-1.0.7 | 1 
           proxychains-ng-4.16 | 1 
            python-bunch-1.0.1 | 1 
         python-greenlet-2.0.1 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
                    ruby-3.1.3 | 1 
                  sscep-0.10.0 | 1 
toolchain-external-codescap... | 1 
                 uclibc-1.0.42 | 1 
uclibc-ng-test-6790eafe897b... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
             xlib_libX11-1.8.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8867f2be1e9c5b04f71d9280f6ca88ce8bf77943 |     
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8985167b8b93687ff44493686842bd5590ff59f5 |     
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b9adfdf4308fec7e046441605204cc6d913b3239 |     
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/279afc5fc645a0b3954f457221931c1a9e9f62a1 |     
powerpc64le  |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/9e7cdb6327069a69d85e5a627369ff3f5edad65b |     
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2a4141aaea0b2b6cb9c440230df3e95e1c448d20 | ORPH
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/976d90f41a3e1d46cb0a9b9b5ee71e2c07a5bd07 |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7a5d76792d84a5d6d29d4be93929098696eb1768 |     
   s390x     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/501386ded9015aed8fa9ee5250846d7a11d767f9 |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/53c39a8dd0a5f2c54b6d7bcc6d90510238d296f7 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f5411ab1f34f7d287a70fb6c4e7d71832f319454 |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/d311270787633e0b72419c748913156cd2ecdc0e |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/bf2150cccbe6c25effaa558282257bf7f4eb0077 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/3a0102becb67e2537d418e50914dce232dcd0448 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/7b161c6b72ae931b3e163d578aedf030f11f11b5 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/de3fd5520496162e9b6391267425fc843b1d70b2 |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/88c55e12c60dda37cfe9c2512e85c44c8d0a7d88 |     
   sh4aeb    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/710b6701087438b85a2902105946e9f92afc5506 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/a021aecb70c7df2397ad97ac311c44d17569a4ed |     
    sh4      |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/5a32f2931ddc462d54908cc2c5f335917de382dd |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/146383e2566c426655216726487d95d67447d78c |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/c6d55aa4f73d1060aaabe689fc6e5a13a2c4be61 |     
  mips64el   |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/a6d78f45842a5ed85d73ab4f65da7c6ccabf7f0f |     
   xtensa    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/84024d3d26f472dda5cb1312c7775db604abe211 |     
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/35c1b7dba9a0a5d04743521d793425962a1b9b6d |     
microblazeel |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/e3d430e1b07e804749c426eb08ee01497febf8b6 |     
   sh4eb     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/11175dc09e4adcca14f55b13417bf55f5b70ddad | ORPH
   s390x     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/79b80daf1f9519df4b495d7aa0481563e5a7a0f9 | ORPH
   s390x     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/6cf2113ddbcac3e7cacae250a2aec79ea2ac43e6 | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/4b7beef4652eaecd5ddd57d0d34ed970e75767a0 | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/55d6738f4f3eeb941c415b009710ad1f1ba614e1 | ORPH
   s390x     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/076373fefe3c3dbdd1370a297753016bfa1f6b95 | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/980c2570569aac3e7bf172ead1ee680ef22ff556 | ORPH
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/50c24130c33bb8f7bc9f8a9451c0b5ac9ead2817 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d63efbae0a1c998a0dddfd60d95252b87129ab41 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/855a78db38e58e55dd4ec7a2adf770b0274cf086 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e597fa5c0ec8d9775b25cf47e523ab8aca4c690c | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/c8ace0575dd801d7b40b7275d57277f73c234c0a | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b7d0597b54202b18c98d60b714f6041fd3bd4bc2 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/df5a21bce1bee1c283679b643e7a93415790471a |     
    m68k     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/e25e3de9592feb22d04fc35f9299bbe0c44c1ce4 |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b5d08356848b01408708eb6235d2a5ed1e7932fe |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9e6223a1adbe7ba68d87cc3dcdf910891e71509e |     
 microblaze  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b1f255500d57398c470ada7994a92117d3d492e6 |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/82fae9c806176082f96ca0814473ab328006fb43 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/165091ff8697387e900c1cf37d33c1f662f6f590 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/14cb79f5ae78021360360cd64ed357ab8ac0a851 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8a4e50890a3940d6ee91178507ceefc92b87dcee |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/955d30047485073338381667ca054e156af1b37c |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8b01932ec836c72b35b831fe85efea0f600b7ff6 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/735b21166fd7aac19817a0c61bc81497ea9af80b |     
   sh4eb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/396aec4b8689451e40600c75b1798f216e94c382 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4d3f9777dfef334db94e641bab4d695bf911331b |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e1025d04964e298ff815588dcdffdb5a455351f1 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/01e61a149a81c177ac97c0a0796495f63b477fc5 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/84aeb059dde9703830131abcc5e3db168f486b0e |     
   sh4aeb    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/549cf41050ebbfeab8c82ccad415f920955fa569 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ab86eb90a331279f7c17c76f1e16abf530b4268e |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9926e206a720e762f27a8365d96e1c35ea28d39b |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b3c3be1cc134a555f940833c148aa6c270f55b96 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/85c8aadf956069baaba7e4a65bdef4f01004a497 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/68f061b2e95e73747bf1f0d0e93a3844e9db7bbb |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b56fbb45588fbe1649a81e567d707df34b5386d9 |     
   xtensa    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bfed9940662845f53a4135e591cf0f31f0ff583c |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/aac5bdb9248cb2cb9f30e008fdcf2fef903716b5 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6a1c178bb2083dc737128a8379a549b0b4727a10 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7b4a3184242b8b2d7432d08d5fa2f22a88d0ed77 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3ba0e443b5c7c4a527d6b081d4cbd92c4c82b9ac |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e8e99f1608fa1b10b062703d7155ee4365a8053a |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e44f3b7516c5197d1dfa45f64df8ef683bfd2e18 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/39ff10e8c90564610be21e582715a078c90956ed |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5286ae81bd0cb9c482a04ff044f7385b0553f501 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/e3530fdf5601a8fd43d10f010f36e5e5c70df931 | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/92a1e5ef978d17a7c1e1ce18213706dc575061ae |     
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d56582c103d1119f2ec18dd6a2795ab461f0b687 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fe42344fafe950131e574beac77cbd1705b94e84 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/57302ae83d5638bd590c9cbf51a7dd3759e32201 | ORPH
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/2cf782181749fca63b5462558a05581f32d6f5c3 | ORPH
   mips64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/07934bebf6107c174cfcce328b2ac56507a9711a | ORPH
microblazeel |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/c597bb071de7a47a0d9f50d07ca277d63eef3fe9 | ORPH
    mips     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f3741677b36ecab63509ceb6d74344e16d28b4c7 |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/000ea6058977aad642c9185908c62df07e3567c0 |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bd460757e1430acc652a424f6ea98241da3d8c3b |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c2547a85710bd5e48caf5eb543f89c1bf7d8be6b |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0c8667c71a6ec70d418efe8f8b1aaff1de39c2f3 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/292023a8b08c2f3f5fcc4ecd2d17d7cf4954cf19 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/57d8301ae2a03ebc69d9933b15139d2ca6e8c481 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/73e8f9f05775bad054067a343d2d9629720ee966 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1f3439bf737a7414201538135f22188b09222542 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fa32b14269ca26b1b9e63834c28ac9955588ba7c |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/14775a98a116d845e59690579308e328ad201881 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/add1ca0bead53ed03e8f6360f7f79f247889da81 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/530cd11903688ee7e83fa087e35207f6bd3f2a2c |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/720eaa272f47df4f11e3f5637e9c3d5ddd06707d |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3074a365930cc3de306b12747b51a9dc690221aa |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9ef202c4a9ed336c2c87d3c06f484a7a6dcfe467 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ecfad3ca10e843c9374723ff743f7d9a87375942 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9c3c444c9f755116e88d9f7da6762152d50dad79 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/70c3baded4ec57ace0851329ed183d689f741ef5 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/93283769c367b777c9d042607615d5206ec66db9 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ebbcf96aba75e1243b212b2b715cb849dd8f43ba |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0eff0bae032ce0bdac25cd894bc247fb817de5d2 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/aa531861d8b992d0586e74ae5a0df5ccca560192 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/400ed171474340c552e708130378edbf9e392969 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8613295c9f005f88ce3ada514c2eb7f5ba22051f |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c3e0eaf3a2f1aa54ccf8a8db94d0eeb4204527f6 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d057bcb9101dac0b9176b5e8f5be4afa9dda9137 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a0e6502087eecfa5e84c6551899aa717e958506f |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5af78c3c75e242a0fe87fdc06b0c7c3342e95f71 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/19543e5d1c27b3b2f1507b43ef6ae4b74c529834 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cbcdbd40f7f95374ff874670f114710728797a4d |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ab41dc85aaeafd0bf365cf8f29f7d84752644e4c |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/82879b41987ed9e0f8d0360ab00dfde1e789f2a7 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3dd6578af54fecfe5c1486d2e47cd276da2b1ac7 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/839c57fbe25a9cca644b8cef1fabf32f67336c9a |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5d836afd7458f89a12461a29410f79c941562d33 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/80b0f977c7f0b849c4f37a29be153e3dd7bec705 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/57f474cbe6d13c1e7da08a5676da097290104b47 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7850e3dfdb2fc13908189f946a19c1346930af30 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/416be57890e0b90ab98f083658034aa95eb20b5e |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/63981a200d4fac1c4f0126cbbea8ebafe190538e |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c4d17c348a06014250ff4365aeabb1e1f5b45095 |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0521425293c7830079ebc6ebdf7664a635f7c720 |     
  riscv64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8beb724fe3a1c06c8fb3ca0cb0e6ed677f5c706d |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/eb993dd7b86a8276647f0308e1b178c9bf19499f |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9a74b59861fdab83868b4654480233361b10e269 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c3d694bb801780ea0e14baa96cb743e5ca5931ee |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b8cca2c34e2f75026b2428c004597a71a88ddda5 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ee93983d344a3cd3bdbaefa22cb5029bd0f9d7c5 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9b770b7d60f94e5f94b214dd49f47431190acd52 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/22152ee8524abdc32cdfdfa3e01235f1266a5ac2 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/79781af6318c858efc0bc44d608e0723a87bec47 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/193003fba3e8fc487725ecb5b3735dc87fb97211 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/93556adfe179eca25d09fb203598e81cada30db5 |     
   sh4aeb    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6f5eafe2317cbb253679011163ab948ac7cca274 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/49a0c5abcd66af13b0b202957683011938c3a0f2 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1e4e404f9f1aa8e868bb2a4f5424904ffcbc2550 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c1fcc69f00327fc77d2168bf1e4c7e42cc0826f1 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/60ee097a943c4c5b6c12abc267499f15aacbb766 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c90ecd4b5b294bad0e44ecea2c65decaaf46b1e1 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/63f8424eaff225039596992fddb6b755ccc57ee6 |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/6168e150c0d1fd8c56e6dcc4c435e6a3e603cd45 |     
    arm      |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/fd0c837f84bd190c2920fac155dadd6a519e8372 | ORPH
    or1k     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/c73604774fd0cd87b22d932c8ffb8e1377a4ebd1 | ORPH
  sparc64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/3e94410b2cdaf4e390867c9841aaa5d385742b51 | ORPH
    arm      |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/361322a857639114ae691abb69cc555a99cb818c | ORPH
 aarch64_be  |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/85e6092a845b35fa47acda8d2cafb31a928022b0 | ORPH
   mips64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/b037bc8b2f8f26919488a224668b112125eaea25 | ORPH
  sparc64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/3f2117461fe6144cbaae215429afd45031f48eec | ORPH
   mips64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/30dc9befb2604a0ecf271b1d81b29c5ef142fbc5 | ORPH
    or1k     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/29195e52cb2a3e2d09074858baa36eb30c360651 | ORPH
powerpc64le  |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/3371038ba090914b62173d972cb422794f5e80f0 | ORPH
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/03ca6fe4dd9238d11b45f1e7acf051939715f906 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/08f6d1c0e0d030e78f6df9b81aff294a99557104 |     
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/50801a5759efe5a8feef9091c1959c19788736d2 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5946f5007333ffba77405f1df63bdae773fabf28 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d72486b4908b20b28e4c5ad125f65a8c86a0431e | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7386ae6e64fdf37434f8952ffa343a30b68f8dbb | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e4f5ba135650305c1583aab4f242e40d0256fc0f | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2227de1e3839494375eda6218f39437fc95606ea | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9134832cd04c47812f31209f2d47aeebf04a4ffc | ORPH
   arceb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a184e8d9b02a2a3abc4566edc1506e36d6cc2f34 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9f5e25195d012660896715fa4852c054069bef9a | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b8217679daeb5047d3ed08e240dcfb6d2dfc91d5 | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/970904d4b5689b417cce357e0970bc8fc071e47f | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/edebf3684c53cbe583018520147345f848470571 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/136a54b2c1f5ff194274f1a538df40ca559e915c | ORPH
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/36ec55f77a149643fdaca088b6cfc05517cae1f2 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/28fbfb34553e228129bcf47c01e17c1392c7e8a4 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/aa342129e4dccbf3c6cf2052c143d2c39e2cf6b9 | ORPH
   xtensa    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/54d16972674f221f69d38dde1eca87ff6d56ee29 | ORPH
    m68k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/6719a4cf238298395d492fb5a6a250627dd901e1 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f7fde3793b3b6b529cf5e42afac9280fa040e947 | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1c16e5c7a603d0a4421c2698b177edc4d29ac0be | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/797b453f1c290fc96bcec64bd099fbfbb0b0013a | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e62a511d2dd0617f6f620eeca41edd7cf976af5e | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8451f3357ad0f1ad54d9e2ff08dcfdd1b462a5f0 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7bb6dc5a7b1beaaaa9f915a894db19589c88a9c6 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/babd1b125db656585d10ee2ea319810722c70091 | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fcc2a343e3c8488e88171b6920ae7ff765428af4 | ORPH
microblazeel | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ded0b383248a0675b0ce58e31373393cd7af4bcb | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/085b2aec2785943cd183d676afd2bcb7dd90109d | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b01989dc7d6ed64552d85fac64b8a9faa0144443 | ORPH
   sh4eb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3fa7e0ca580d24f8b86ce92188eaae56df8ea374 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9d6819032f5167148f0e3fa533a254806a7c19ed | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/eea0fcafe0dec99d785426797cd5fdc4f86dcf3e | ORPH
   mipsel    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/cec4b7152e0b239277360b280dcc4f8bd732d9b5 | ORPH
    arm      |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/574abbc515b68fd895fd4371c4b112f088abeddf | ORPH
    arm      |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/0b3a02729f100e09ecdeef8669a15be643fbf06a | ORPH
 aarch64_be  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/4b00a9bf269d47d025b96f134ae3f169c12c60ec | ORPH
 microblaze  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/806743e21652fd6baa41de5daf0cfb31b4473c34 | ORPH
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/37afb4ef00bc3a19db80dcf07e0b381bfc2bd13f |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/47ddb99967c11c04ced8e629239e132288faa6a0 |     
   xtensa    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/07dcee01bb4d700e6701a3a50d23e02620f7a5ac |     
  powerpc    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/2aafcf4c5f27a46b791896335335aea6eb947937 |     
    or1k     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/b1e534e1f4664efb6f370d990351f561e57b7fce |     
   s390x     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/2d512e0038b46acd73dff80610ecb5266e642064 |     
   arceb     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/6757858315bb040cd4e73b5df30bddf5a007a4b5 |     
  sparc64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/f74e522310c1941e0ee1ca594d2743a5dd35bb52 |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/29a75bdc88522a1249c75ef751ff83f5b60ce69d |     
   x86_64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/20d8678e89fffbe60e7138928605ff86cbefc9f0 |     
   mipsel    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/cc99ffcc3f39c8926d81c4fa86ef880e2ae57e2b |     
   xtensa    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/3572db8c7a3b87d8b919808b55123fc2df52a81f |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e6aa0de0b7ab091ee2a28877ee905f5a31975ccd |     
  aarch64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/012679f17e260b229a6c34c278e4515154e42e69 |     
   mipsel    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d29c29cab3f0f7567d7009608ca9efb19e34c8bb |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/9901a0641818f277d97c2a2dec25c17b6e271942 |     
  powerpc    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/910fe083adc931de5a226dc9f2c1432bcbb562af |     
   armeb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4136b3b3110fc3ecabdceb4d90175a9bd367e625 |     
microblazeel |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/199ba476c5c498cdb2918b4d1683f9593a28de74 |     
  riscv32    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b9f1e67d536583cdf55582fed30895d9aa2534e6 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/db64f3529fa6f956bc447d12dddf8e96af91f109 |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/6e5362b785477d83a2af6c9d4b80a7af86bfd4ff |     
   sparc     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/3a0480c91ecb94e68f23fd4f33773288af9ec61f |     
  powerpc    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/201e212927d6bf703d248599eb1ca81425673ac6 | ORPH
  sparc64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/7105fbbe2600d08174d157d2f5bdd94854cf58cb | ORPH
   mips64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/57636c44c983b973d354874d38fd11aaa348d812 |     
   x86_64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/84ca5e8a4fc1cfb74193d95b722a3f9faa9eb03a |     
 microblaze  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/78d79d8f5a3e2c575653450e087d22be5deefdfe |     
  sparc64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/88a96c15403627d8c7a178ab84b0ee68bef742d1 |     
    sh4      |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/1b933d33ce89513a5641a4131954635d01079f83 |     
   mips64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/050d40dac856f788af2104cd6b6a473b0736df0a |     
   arceb     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/6332e271526676e5d3f2621488e3c0011ced5755 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/28a83c9eafe24c7c7e980b977d353ec10080a65f |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f8f291b9113c3530cb7957bc64bfb40d2f5be900 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/78275fb7fdf001fd4afd5bf48932f6e3686deb5f | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e4ae239ca1ab2e130a106245a677158a3fd80ecc | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/589c72dc86162d8441b08f292e24041d8bc027c7 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/42a93f8453ceef681403ffa4d44d42450804debc |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1af30ac21c96ba7fc1d070f2fcb3979741047ba7 | ORPH
  riscv64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a22ac9a6ba8f4197f91bd41e39bedd14670218b7 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/5875fa34ad0900e51b5d5461c34f2626f0e452d9 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/bf713507f83da6bd0af4cd52f1cff69a25b56cee | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0498e12bab1950a608be8c98398487a212219e88 | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/bdebda59f1fd301430c3de970788fc1193eb6c40 | ORPH
    sh4      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ff43b407bb18727d01b83db39dae17a46fa794ff | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/909dc1d2a260014f55d28136f05626571fac2847 | ORPH
  mips64el   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/990481ed128fb5130a92a2b60b45c8feda4c2233 | ORPH
    mips     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f614fd371c1eb260a2fefc9fee431d0fa042bebb | ORPH
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d4eb23c00062ab3979d81c4ba1194115f10bfc51 | ORPH
   armeb     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0955ec70975c3a0694d2ca304e1f6cc7ab5bd0e3 | ORPH
   armeb     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/8a6b8d5665c97d06a73fcba9ca8eca4b52d43f02 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/873a6d15cb4f25339f37ddc8f4d127d03d30ad05 | ORPH
   mipsel    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/db18606094285a03733436a6437b6c9776cab607 | ORPH
    sh4      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ecff3162526de6ad079b00d216f8cf8b5771aac5 | ORPH
  riscv32    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/1fb4c9285c5df2c156ced32eec93e6a16d12c241 | ORPH
    sh4      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/03eb42e3810d45edc7b90d85bfa38ccc474d7bd7 | ORPH
 powerpc64   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c3c5e78ed15ce1a43d1a2ad508374221281c35b0 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f7ff6bd79b50f7b511954ab247d4141c22fda83f | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/214079ff566a5cfeb5f9d2dab0e5c2247c9f65ac | ORPH
   mips64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/514c74c6ae880347e732c74b062647e445a6b0da | ORPH
 powerpc64   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/3a1d989f1bc78882489523c3cb71a506af3d3413 | ORPH
   armeb     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f1b320e4192d73fedf5c514571173a296e1e0d91 | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/2f7349a9e69867a412db1e30d08972869fcf0da9 | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/52833382870d4717b94a1fc167f41a7089e3ebef | ORPH
   sh4aeb    |        libgtk3-3.24.35         | NOK | http://autobuild.buildroot.net/results/a23b6ac884cd1e513c8cb770bbee175475173aea |     
  mips64el   |          libnss-3.86           | NOK | http://autobuild.buildroot.net/results/2041158a730bc913b7e0340427c0093f78166e15 |     
   nios2     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/2cb575129296f068db1011f1ca75c367058efa7a |     
   nios2     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/1fedd686319ec657bac10aee3d6e579015f1ba22 |     
   armeb     |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/260666f525b3e8adb28ca05b8963ee80215f1dd9 |     
    mips     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/302b06867b54d2bb505f7827b894560a17d7131c | ORPH
   mips64    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/224a8c0ab77bd21a01c64343735ac83c1bf7c67c | ORPH
   armeb     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/7bf639916e41e3126bcc9132d83a4a2f0ba988eb | ORPH
   arceb     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/b8622dc9ecef8d13abefe863dce37def46ef45dd | ORPH
 powerpc64   |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/483ac284ead82725dfae5436b58193d6291a76e3 | ORPH
  mips64el   |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/4f96f6fd8d5b046f5f34ecd7924c72927294cc17 | ORPH
   xtensa    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/d18874183775ecb746e30652ecd0f1126cbe6e44 | ORPH
    arc      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/1006f413ca978d4676e67b6886c2c1a5837ea98b | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/1679fe5777a3d20570a8bcf26177f558fbfe8322 | ORPH
  powerpc    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/9d422d3fcbe23489ed1963c03bc7393465f7350e |     
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/796e6730b359bb77c8c16854fb1b2c83ef71bd81 |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/6cc1f1c0be91015477cc36ec5469bf32e0745d27 |     
    m68k     |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/5d3833936fd5555e6c7a14b6811e7ca4834047bd | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c9a9cabe0274d8fd9d28c390572ee5c8534b8bd2 | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/cc704f7aab1fabbe1af13ceb6b26de20caad231a | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/55468a881f01ad3717cfe547a7e9fa2b76e8dfb7 | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2cbfe281312985578ce4c2a29d69374e70465199 | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/50bef89604eb9225f8c3253d30896a7af26e2f67 | ORPH
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/46cdb7cfa0847ff69b792f34f6893669470110fb | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d77842b22446fbe91a257b69f3fd59ca8c95dc96 | ORPH
    arm      |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/0e001a0c9eb23445aa9badea8280382c713172b7 |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/89e2fc3389237a5308cff04926ec81501c11fc44 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/62446f3ee708fd1897b6685e1464c9a7f6c92262 | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/cca905890fe69052b1fbdc98cdd9d081aade9984 | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/45333c30f2de6cbbe731e41b9dbac033b32db84c | ORPH
    m68k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/947615f3c052a799eeeb5ea4b8e4e890cb7f60a0 | ORPH
  powerpc    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/ac76fba4294c6211dbea9f1a2da8619d2d02f5cf | ORPH
  aarch64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/bc7d2caa2c8957fc299b5bd121391ad4a27596cf | ORPH
    arc      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7a8595fedc095391290c5ed872ff6496f8bae4c0 | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/900860bc37ec9764b9c525aa74ebab8c7f901c52 | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/dd7e325534b2ce48cfc9fd685ed6a25f71d50d01 | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7c957c21779bba27e02d8dfdd2b0a46a24384064 | ORPH
 microblaze  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5c9ea22633b49a764ddb32c370c33580bf74a46b | ORPH
powerpc64le  |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/50b5411177dbfd70dff801589dcacf544edef18e |     
   arceb     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/9bda046c3af43765edbc27e2e3c9b6d4a635eef7 |     
   arceb     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/200fd19cfe909a5d05914451ced27423240e5353 |     
microblazeel |           php-8.1.13           | NOK | http://autobuild.buildroot.net/results/f5848d5956188353be31c8dc7155200d29edfeeb |     
   s390x     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/2245dc42be9429ff8e4a8fe9dcb6707c0c11ed01 |     
 aarch64_be  |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/0d6413822c32363ad83e7b0de92faa67724dea5b | ORPH
  aarch64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/c1d0f67db8d77f4a79a377b4d39a7f0e7a0a2088 |     
   mipsel    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/94ff31b5868b0821aeb50804553e2e1a7994aeb6 |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/225177f3c7e3012330aa8fb509b587e88bafb3fa |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/40ba03dc93d6f18b2e07128b608e7a4b3c5d4545 |     
    arm      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/e78e67b54f7d26145f61436b7ba87fd5d0554281 |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/14d48db659db6a4dd3b30839ce3ec74ef68e2a97 |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/d3a79ca22cb6966b947a807307112ffbeb2fdba8 |     
  aarch64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/595215829ef2ce7ee91781b336f676eaebd76238 |     
 powerpc64   |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/8f7f6cacd519ac907c27e6d357f1c22e07d2d98c |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/e89d7cc0f7d959304abf7a1d58896ba65b587adf |     
  powerpc    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/f68264f9a168a9056798d493554570ff46cf0ea2 |     
  mips64el   |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/550b7f0c549fcfa4933d1555583a81087448157e |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/818ea982aaf673a62d10a8ab95c604a87075ed2e |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/37a6511c89968553e801e5536fb66cfe4db4a3b0 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9b370df0cc350d6c21f0487f023732fd90ab018d |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/291835f242c6076a06553d1f9624f21ed32faaa0 |     
  sparc64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/6b4b9020a3cf43b26e516cb1e8246e2edae5f064 |     
   armeb     | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/2af5ecfd25d05ee827efe3e93d04de12780cc4ec |     
   nios2     |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/5c07fd3e2c1a58b358b82e910d167b0ff2c333c3 |     
   nios2     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/d98c53044ee9ee2a86f82836f5053f535e4e2ed7 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/476e40e5774aade48d7e4826b2e953c2777779f1 | ORPH
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/2209afd9231049c8b96d26a51f68219f32263c75 |     
 microblaze  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/6bc9097aa66407e683fba43dc6c4d27808abee18 |     
   mips64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/1c67126408e31d48425cc9c40bb05fd811e1f955 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/9abab5eb3532afd73a1eedad104e8b728c170797 |     
  mips64el   | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/01dc5b470cd75b66775be60d59a452746f814643 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/124dad5e5018f0f5952ace6bb4741f771c1fab5d |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a7532d80a790bad8ebdb0bfaf67b69c00e06221f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/82e73af4dd1c8e081af7c09ffdab8d8fb509a9b6 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/9f2de1167caf39883b1fc834fd9c8e1ce5c2ff20 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/150265570431f75f80a8d440d0980f1ebbf461f7 |     
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/cca4fe2cf738065ec85e5b2afa6df19bab8fef4b | ORPH
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/dbba50e111f53cb05e999d9d6e6dd4aed26b5019 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4c55c188302312cd406ab0f337f2ce7f78dfdc54 | ORPH
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/22ca21bfdd5a655e322ad7dc6cdb6842d0b4e1fb |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/52e8bbd64580a898da8ffa5e60968dd7ce18ab73 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/946638b8f3cf2e1855139098baeed221e268144a |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/5f4eedd043a2be2f61aea62c8abdc0561b7e195c |     
    arm      |       xlib_libX11-1.8.3        | NOK | http://autobuild.buildroot.net/results/2572c0544fba7b48c06f60d97095e87c2734d075 |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e00ca463a68412b0e42b0da8da53080996e0256c | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a43c0ed9431762b7c5393aa79e7382d815f2da55 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/128e7eb50aef08866a63659f2b3d0b1cc5d083f2 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0801b49ec4d6a110f9763d4ab47c721984e0ba0e | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/29a5de06d28da8f2d61e46c22478c552c4e80fee | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/dbc73fb772f8323ffa70bba157f696f349aa517a |     
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/320f8f6ccd829f7185a04d624dc5142925ef7cdf |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e63361012d379251ebb2820d8733b830432812cc |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                  linux-6.0.16 | 2 
/home/buildroot/autobuild/i... | 1 
                      crun-1.5 | 1 
                     exim-4.96 | 1 
                  ffmpeg-4.4.3 | 1 
            host-binutils-2.38 | 1 
           janus-gateway-1.0.3 | 1 
                     pv-1.6.20 | 1 
           python-numpy-1.23.4 | 1 
            quickjs-2021-03-27 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                      xz-5.2.7 | 1 
                    zeek-4.1.1 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/ec9dda5e70713f3703be5b916eea6cc49863cb56 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7e09e1738cfa6deeacc0d86a112477a2d191ff9d |     
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/ea41e3959750fb118617b50d8eaaa8418973aa43 |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/3bf63c4e91b380e8c9ca4ac06bb1580b98c71065 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2d1821f8b9641a90ca818acf2fcb4980a8731db4 |     
  aarch64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/af2e7c71cdfcac2fa2c1c7f226c80d7ea5b9e875 |     
    arc      |          linux-6.0.16          | NOK | http://autobuild.buildroot.net/results/be4259a587cff06fed5916b25c5a84a06845ce55 | ORPH
   mips64    |          linux-6.0.16          | NOK | http://autobuild.buildroot.net/results/c8672f8d69ba5c0f42c113c49735e826982ac52f | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/6701099e8fd00c3badfcc0aa74b3c5fd51587876 | ORPH
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/abba62fccb8e8222484c09ca3206827833039499 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/e39f5475a49fcec5e41550517a8ff3fea4fde5d4 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/5becba42be2bdae1fd47aee2c6fe6a737f019427 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7687ba5d9c8f007e8a0660f84fd9e1b43bba9c12 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0f45874e42a01e7a5e39b262c874e4ece43daffc |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/75382c1e6e47c8a89e151e898958febfed589cfa | ORPH
   xtensa    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/fcead5635e6a54c3be24faa81571b0b7cf25f8e9 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/e44a0f5e56cd3767c4e1e20c518c06abf5aa82e4 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
