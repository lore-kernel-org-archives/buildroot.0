Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B273EC001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 05:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F089260B94;
	Sun, 23 Jul 2023 05:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F089260B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZur6Edv8ndy; Sun, 23 Jul 2023 05:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8886160BA2;
	Sun, 23 Jul 2023 05:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8886160BA2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE9541BF846
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 05:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9037060BA2
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 05:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9037060BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPwEZL3BhU2W for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 05:37:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEA1D60B94
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 05:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEA1D60B94
Received: by mail.gandi.net (Postfix) with ESMTPSA id F001040009
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 05:37:42 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 05:37:42 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230723053748.9037060BA2@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1690090663; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XgQMVmQbLYBmy6d47p7ot8a/bI+lVnafsNuKG2ucAeI=;
 b=jPF8tbSTUO3pFhnk8fU6DV9xpsmK1r3zbGEMBWFT5tNHmt5D3vVe2ND3jd7ihaDI/l5xfw
 KAmxOH08xuHVY2+oe5e1X3P0KqSMYug01A0orwhC3nCLJhacFbs/tsd9TddxvkAj7gN4/o
 oMz+8J2pvt4wRwgepvNjch8xcBx7cbs7TLbs6cBx4z8EvX6p+uplvu3TL9Tf765gYZ1feU
 fvD0a9YJ2uSW0LJvA1q2sHcKM/kP76XFI8gm8Ad3Qt0hDZ/UrJM8ud9bjz2FTTMXcO6iCA
 6AwNeCUs3sDqkd6T8MPsFcbybogfwmnLh9U+tnVqYRIUwWz9of4ZTfovblKtHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jPF8tbST
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-22
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

Autobuild statistics for 2023-07-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  5  |  0  |  9  |
  2023.05.x  |  3  |  3  |  0  |  6  |
    master   | 83  | 101 |  2  | 186 |

Classification of failures by reason for master
-----------------------------------------------

             tpm2-pkcs11-1.8.0 | 8 
glibc-2.37-2-g9f8513dc64119... | 5 
            host-binutils-2.39 | 5 
         host-sentry-cli-2.8.0 | 5 
               libglib2-2.76.1 | 4 
                elfutils-0.189 | 3 
             f2fs-tools-1.16.0 | 3 
  gobject-introspection-1.74.0 | 3 
                 mpg123-1.31.3 | 3 
                   trinity-1.9 | 3 
                       unknown | 3 
               util-linux-2.39 | 3 
           dmraid-1.0.0.rc16-3 | 2 
                gnu-efi-3.0.15 | 2 
         gobject-introspection | 2 
             host-ccache-4.8.2 | 2 
               lightning-2.2.2 | 2 
                   linux-6.4.4 | 2 
                 opensc-0.23.0 | 2 
rtl8822cs-b51ab22fffdbe4a8c... | 2 
ulog-0389d243352255f6182326... | 2 
                    bat-0.23.0 | 1 
                   bzip2-1.0.8 | 1 
                 coreutils-9.3 | 1 
             dahdi-linux-3.2.0 | 1 
               ding-libs-0.6.2 | 1 
                  ffmpeg-4.4.4 | 1 
              fftw-quad-3.3.10 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
                glorytun-0.3.4 | 1 
            host-binutils-2.38 | 1 
               host-go-1.19.11 | 1 
                   host-nodejs | 1 
              jpeg-turbo-2.1.4 | 1 
               libdeflate-1.15 | 1 
                libglvnd-1.4.0 | 1 
                 libhid-0.2.16 | 1 
                   libnss-3.91 | 1 
           libsoundtouch-2.3.1 | 1 
              libudfread-1.1.2 | 1 
               lighttpd-1.4.69 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
              mdio-tools-1.2.0 | 1 
                 mesa3d-23.1.4 | 1 
                     mtd-2.1.5 | 1 
                    musl-1.2.4 | 1 
                  ntp-4.2.8p17 | 1 
                    olsr-0.9.8 | 1 
              open62541-v1.3.4 | 1 
                   perl-5.36.1 | 1 
       python-stack-data-0.6.2 | 1 
                    qemu-8.0.2 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
           xtables-addons-3.22 | 1 
                 zlib-ng-2.1.3 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/ef4f9095fede523300abd34f7481786249cc855b |     
powerpc64le  |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/075ce44680cd159d2467c1ed24cb2a2dfa1ce150 | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/159a93a7b9e658b0709e082b0a71912ef7cd7ae0 | ORPH
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/bd1c568cd93a7cfd137794628f622134b7d1b766 |     
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/7ce9d545dcd88c9a23d5da7732789b782c2038c5 |     
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/2b24a42ac690b07a297b3b620458111313d77549 | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/a0f87cd765d754e80f76881667a15a08545d731b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/59adbfdaf7b75538d1a4705f5af8cf0c038103f7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/eb931fc89477ed0b94a3e05f394d21e4d073512d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b9abf35be44a677c7ff6429d03416632a919e216 | ORPH
 microblaze  |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/3e40697b7a25c0e0ce00e813ab5f87f3d4b12177 |     
    i686     |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/6f5ca0c3874133f0da45ad80205faa4db630f05f |     
  mips64el   |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/c306acb259f5bbd00002c650e4f0ab5bdf618e12 |     
  aarch64    |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/f3c6a3bbfdb9999ae7065b6128a48e5a9a399274 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/4c4f7c99b0c4f7f12519b464e830417f9977881b | ORPH
   xtensa    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/517eecc56e8774cd5a69c4d4edcfe88499ff8bc3 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/4bd5d43f8381f2b48bafabc8ec525460f892eaaf |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/406b51173f975a2e82a7f5309aa9805fc2abf3e1 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/095171d3b3168070104c92a98d9fabcd2940680a |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/36c0acfeb72a12fc6a18fa349c15813be129101b |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/bbf244d4434aaf3b61a648bf28612b572fbc99cb |     
  aarch64    |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/8fd8f6e34f372482cd9bc24525800b7d1855b604 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/2edad2f25636b77de4dbf4dc00578c1bc52d04f1 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/d72ddfd872f56f50bc9216d44c78a5866a361830 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/49c4e6dd6190c4fbebb0cdd89004d55653f18d90 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/84fe456c91469bfb5ab79d0559f33c42b8d69b3c |     
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/543d39047d13f56837c60c3ce76e528a050950d9 | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/3a488fc5d35e6ae4f94232f89c0c68b369c7a72c | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/aec7c345c689c6435c496f4ff40abfcfbe3a6226 | ORPH
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/891e0f73bfecb6cd955f9d6fff85d3e0f6895495 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/25c82e00bfb8f1feb331c16e16fd8aa349956201 |     
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e0b679ee681f5c295d197af5958e1508d78f9c3b |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/78ac7cf33dafd7f9abe5595d5a5123c71ac1ac3c |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/731a0b4ddb4a79333f63cecc13abbee441c43e44 |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/79264a259bd57bf0fa1e71c261919f42e7873d80 |     
   nios2     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/f70a291463557d22cb2cd18dc81a93f85e52ec7a | ORPH
   arceb     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/c2d1bfb72d9b9c5e05caa0c76cdea47b5f5233b4 | ORPH
   mips64    |        host-go-1.19.11         | NOK | http://autobuild.buildroot.net/results/b3bbbc499575190605da925c46d6bc6f72a4475c |     
  sparc64    |          host-nodejs           | NOK | http://autobuild.buildroot.net/results/16b0ac475ddea5fd6cf5271fefca0f6a8eb76f97 |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/018e32c7cef7814f89c8845dfc775be8f861b491 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/970b9713f0f5fcee8b025f549f1019c1ec6b6a46 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f3e89c9ca494c756ed9a8c6a33a14d045c72dc92 |     
  sparc64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/1c9185cdceadd4f3400b9114302f29cd22eb630c |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/9560f0f5704cb3fd27d1a9eef4f1d0b775f12c82 |     
    or1k     |        jpeg-turbo-2.1.4        | NOK | http://autobuild.buildroot.net/results/2dc75b18ec185f1f76d620d6dd0868f1b7b818b4 |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/d2937458452536126560845dfc4fdddf20680a3f |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/bdaae51e3cee713bc021e22292f4ecfa658fae1c |     
   mipsel    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b2e4f6cb66eebe95153a6898d178eda681451708 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d15dc442fe0baabdefc3936fc66bbf77bced98d9 |     
 aarch64_be  |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/35ed936d50cd6c24bc6691b8ab56e402ed8ab8e2 |     
    i586     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/0b1123d2ee72b2e959e61f93d56a4b94e0428784 | ORPH
    arm      |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/d7ae0d4a56bb2057dd26715a852d0c5413653138 | ORPH
    or1k     |          libnss-3.91           | NOK | http://autobuild.buildroot.net/results/06ab08ecd38bfde4b35b0e0c9107eeaf700fdddf |     
  riscv64    |      libsoundtouch-2.3.1       | NOK | http://autobuild.buildroot.net/results/60b917cb5d2f862431e450090e874d790052a2cb |     
   armeb     |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/63eeaa0cab8c2f8eaebfcb21aa1cddd0dadbe316 |     
  mips64el   |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/6673f99ed058990082b50df2e56a8380961d595a |     
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/13a951ff49134543799634bacd13f15867bbbc0d |     
   arceb     |        lighttpd-1.4.69         | NOK | http://autobuild.buildroot.net/results/f340b08ad8731afaa18f2edcaa62f7ac6cf4b089 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d62d8c9cd4d3e7a677b64421fcfd3ab94c08e655 | ORPH
   xtensa    |          linux-6.4.4           | NOK | http://autobuild.buildroot.net/results/d4c419c54d8cec4c50569db9756944e85a9fc0f8 | ORPH
   nios2     |          linux-6.4.4           | NOK | http://autobuild.buildroot.net/results/6bc784cdc2cb060d7ffeffa89b320489ab6366eb | ORPH
    m68k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/9967d4f7b7f5b39a33b0cad34cb7f66f841aef15 | ORPH
   x86_64    |        mdio-tools-1.2.0        | NOK | http://autobuild.buildroot.net/results/acc64989742ae5f0ee7f17d8d8f98485f2ce1206 |     
   mips64    |         mesa3d-23.1.4          | NOK | http://autobuild.buildroot.net/results/9f01c81cf708545c99d03828729d7a186fd72190 |     
   arceb     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/f56e255bc460ba0f431f3559fdc81af6b5ea5099 |     
    arm      |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/8484fc6be618f3edbf39a13928ab9a4b7b442235 |     
  powerpc    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/c78eb788c144fc292fd91f124c3a34ae1fc78a9e |     
  riscv64    |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/988760a7839853897e8ffb0ffc5a1a0bbf31c6a4 | ORPH
  powerpc    |           musl-1.2.4           | NOK | http://autobuild.buildroot.net/results/632877300aa6c6409bec1991f0db4d68d82d9e01 |     
  riscv64    |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/b328e4fc86500be5eb72f78f542e2d996f2606bf |     
   sparc     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e353df876855a79604677133a4492b9020b69b2d | ORPH
  powerpc    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/f4a3fc2ce8cc1a79a6a82583b3f06a4a0b45e6ea | ORPH
   mipsel    |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/0fb24bcecc6c85063cb4e6c471e3aa55ef739254 | ORPH
microblazeel |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/c3ca2106d5798d15c2cd6e1367d5085da6af83ae | ORPH
   sparc     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/499bff5ee3f0427bc6326ba1dee8315e632dfb82 |     
   mips64    |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/813c0a9de5fc03d314426a93934798834ad9bf6f |     
   mipsel    |           qemu-8.0.2           | NOK | http://autobuild.buildroot.net/results/f4433b1fbaac551690ebfb9cc9d21dc3558356ac |     
 powerpc64   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3993f7b306e01de4b6b28d97e55ea09259ffebb6 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/2faad0c065782dc02ad029f59dd99a3a3fd2b349 |     
   sparc     | rtl8822cs-b51ab22fffdbe4a8c... | NOK | http://autobuild.buildroot.net/results/1773c307641fc7a04f1095325c7bfd44d58d3180 |     
  sparc64    | rtl8822cs-b51ab22fffdbe4a8c... | NOK | http://autobuild.buildroot.net/results/5bcb9d334add7d80f23f0585e67010d27aa8ef1f |     
    or1k     |       tpm2-pkcs11-1.8.0        | NOK | http://autobuild.buildroot.net/results/1b8bd5e317ae38eb79f2a3a295ffbbc2327ca87a |     
powerpc64le  |       tpm2-pkcs11-1.8.0        | NOK | http://autobuild.buildroot.net/results/6fddfee6f852ce835c5d1178e6913b6ab1b3fe50 |     
   armeb     |       tpm2-pkcs11-1.8.0        | NOK | http://autobuild.buildroot.net/results/076a6f66c9b3bb7d4c08945875f31e7da455bb99 |     
    or1k     |       tpm2-pkcs11-1.8.0        | NOK | http://autobuild.buildroot.net/results/79cd1da6878d15d65db749efa17393d646a49a73 |     
    i686     |       tpm2-pkcs11-1.8.0        | NOK | http://autobuild.buildroot.net/results/481a58569d631b1f1b87b2093f6719b0bbdf8d5e |     
 microblaze  |       tpm2-pkcs11-1.8.0        | NOK | http://autobuild.buildroot.net/results/713470ac0122177396112a175af76a0fbc005029 |     
  powerpc    |       tpm2-pkcs11-1.8.0        | NOK | http://autobuild.buildroot.net/results/db01fa2d062ad2de0707a99154d290235b6272a3 |     
 powerpc64   |       tpm2-pkcs11-1.8.0        | NOK | http://autobuild.buildroot.net/results/f359fa41d00b386d02fc2ca2ccfaa0db442f3b16 |     
 powerpc64   |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/3ce0e2669dacdcfb5e1cdf060c354d70664abdb9 | ORPH
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/73aa9ee8e1fe23175cfbdc48bc198f055c26ee3e | ORPH
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/30d2317ff73dbcc06159c9f0f6df693a24554b92 | ORPH
  mips64el   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/cc9a6f5240cdb13fff695bd9c5bc8e8790c1d6b9 |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d83763bbf4595cfba913e837ab5c1e309043386a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/524b696e0304c08a64382a5ef6a4058c172ed354 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a163cba114237a3b5b23762635b62a3150b8fc19 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/5b2d41e91dec8742ac4432b65c2ecff835bf632f |     
  aarch64    |        util-linux-2.39         | NOK | http://autobuild.buildroot.net/results/866272df526898e912b04c20390b3921ed832526 | ORPH
   armeb     |        util-linux-2.39         | NOK | http://autobuild.buildroot.net/results/686b9b69931886ad8c8a6fa14bef5d56d343000d | ORPH
 microblaze  |        util-linux-2.39         | NOK | http://autobuild.buildroot.net/results/6b8f9eeeb09a6e31656123cc6f3b5add8fadac0b | ORPH
  aarch64    |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/d88c5caa52a414823fb8d11ca113f5ed5ea254a6 | ORPH
    arm      |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/bfcf460a8163226a22c6e603866e52e8e7feb3cc | ORPH
   nios2     |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/041138611ee44d4d9e50d15a7a18f78467bb50c0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

          chocolate-doom-3.0.1 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.4 | 1 
              host-rust-1.67.1 | 1 
package/rtl8821cu/rtl8821cu... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |      chocolate-doom-3.0.1      | NOK | http://autobuild.buildroot.net/results/6fb7c4e2bf9f6fff7018710d0ab537cfc4af2dcb |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/569f7a0b8057fef73e4cb04ef00b5c915e398894 | ORPH
    arm      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/1bfe01fc75993145bfdc1f6dd9475c07facf74ac |     
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/e2ec52643c185ff13e83897d7b00307dc6f63cdd |     
   nios2     | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/888ee5e58e69f7463ef5a79980fc0fcbba39b94a |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

               host-go-1.19.10 | 1 
                sysrepo-2.2.36 | 1 
                       unknown | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/d83201cd461f03a944fb9b67f5981e5c2ee21a57 |     
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.net/results/67893142dd1ac5454338432ac47ad1ab78f8b0ce |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/60dbe2bd6c8a0c9932feca578675e5538b6f5e40 |     


Gitlab CI results for 2023-07-22
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
