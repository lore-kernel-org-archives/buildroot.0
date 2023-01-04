Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813D2C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 06:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BECC381959;
	Wed,  4 Jan 2023 06:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BECC381959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7RwCcdM5j3b; Wed,  4 Jan 2023 06:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9063781E89;
	Wed,  4 Jan 2023 06:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9063781E89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 712CA1BF836
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 06:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58E7681E89
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 06:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E7681E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o1sGFHDnF8gI for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 06:42:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1999A81959
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1999A81959
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 06:42:27 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3605740005
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 06:42:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 04 Jan 2023 06:42:25 -0000
Message-Id: <20230104064231.58E7681E89@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1672814545; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sTWdzed5BxQ/eUxsCMNH1WJ+I/4QeGR9hl848E8gvXU=;
 b=TQFdSTdAnCuM/iVNdovuMldjzCoaWyVCmIVb76PdBOuXwQkXSsEOVh2Po0IU3hIjGnulbZ
 TSLioWWibzTKE/3uqgXsrmlFIqHVIuXyMP0Xpe8GfMJOzIbfs/grah+v7B+eCi57cUtBl4
 d9b3uF5n3Ls4UkiX7KKH3UlDNjFTm+4GnTp3GRrFmdCmEA2uVFim7jjfatldjxGQ/Kjgns
 SRq+eFnAGSH3mi5qmfpqKA3A/lWSdZjzbfZUCndjQ3Eun/Fp3/JpKv+T2EHi0ndBEWqP10
 8QViWOWNtRPiUlJ2vLBNeDkrCZsp0VxlKtbbjbWTNuWNXdppyJePfRNJrVZikA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TQFdSTdA
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-03
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

Autobuild statistics for 2023-01-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  1  |  0  |  3  |
  2022.11.x  | 12  | 14  |  1  | 27  |
    master   | 180 | 329 |  0  | 509 |

Classification of failures by reason for master
-----------------------------------------------

host-go-bootstrap-1.4-boots... | 37
               host-fwup-1.9.1 | 32
                     xz-5.2.10 | 21
                    fwup-1.9.1 | 16
                    dust-0.8.1 | 10
       host-gdk-pixbuf-2.42.10 | 9 
         host-sentry-cli-2.8.0 | 8 
                       unknown | 8 
            host-binutils-2.38 | 7 
            host-binutils-2.39 | 7 
           host-libzlib-1.2.13 | 7 
               libglib2-2.72.3 | 7 
                  jack2-1.9.21 | 6 
              host-pahole-1.24 | 5 
              host-rust-1.66.0 | 5 
           janus-gateway-1.0.3 | 5 
                    crun-1.7.2 | 4 
                host-go-1.19.4 | 4 
                   linux-6.1.1 | 4 
                    pixz-1.0.7 | 4 
                    bat-0.19.0 | 3 
            host-binutils-2.37 | 3 
host-spirv-llvm-translator-... | 3 
              hyperfine-1.14.0 | 3 
              libgcrypt-1.10.1 | 3 
              libostree-2022.7 | 3 
          linux-5.10.145-cip17 | 3 
                   linux-6.1.2 | 3 
                    norm-1.5.8 | 3 
                  ntp-4.2.8p15 | 3 
                    opkg-0.4.5 | 3 
    python-cryptography-38.0.4 | 3 
            quickjs-2021-03-27 | 3 
                alsa-lib-1.2.8 | 2 
                    brltty-6.5 | 2 
             dahdi-linux-3.2.0 | 2 
                     efivar-38 | 2 
             f2fs-tools-1.15.0 | 2 
                 fdk-aac-2.0.2 | 2 
                     frr-8.3.1 | 2 
                   gvfs-1.48.1 | 2 
    host-python-greenlet-2.0.1 | 2 
               libcap-ng-0.8.3 | 2 
             libgpg-error-1.45 | 2 
      linux-5.10.145-cip17-rt7 | 2 
        ltp-testsuite-20220930 | 2 
                 nerdctl-1.0.0 | 2 
            ocf-linux-20171122 | 2 
                   opensbi-0.9 | 2 
                   perl-5.34.1 | 2 
rtl8812au-aircrack-ng-e7a4a... | 2 
                   trinity-1.9 | 2 
                 wolfssl-5.5.3 | 2 
                  zabbix-5.4.9 | 2 
                  acpid-2.0.34 | 1 
                  assimp-5.2.5 | 1 
                   bird-2.0.11 | 1 
             containerd-1.6.12 | 1 
        edk2-edk2-stable202208 | 1 
                     file-5.43 | 1 
             flare-engine-1.12 | 1 
             fontconfig-2.13.1 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              fstrcmp-0.7.D001 | 1 
                    gdal-3.5.1 | 1 
                gerbera-1.10.0 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
  gobject-introspection-1.72.0 | 1 
gummiboot-2bcd919c681c952eb... | 1 
                host-cpio-2.13 | 1 
             host-delve-1.20.0 | 1 
               ipmitool-1_8_19 | 1 
                    libev-4.33 | 1 
        liblog4c-localtime-1.0 | 1 
               libsigrok-0.5.2 | 1 
               mariadb-10.3.36 | 1 
          modem-manager-1.20.2 | 1 
                    musl-1.2.3 | 1 
         mxs-bootlets-10.12.01 | 1 
            python-bunch-1.0.1 | 1 
         python-greenlet-2.0.1 | 1 
           python-numpy-1.23.5 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                   rsync-3.2.7 | 1 
rtl8723ds-a638cc8639015b8b9... | 1 
                    sdl-1.2.15 | 1 
                  sscep-0.10.0 | 1 
              strongswan-5.9.8 | 1 
              traceroute-2.1.0 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                wtfutil-0.41.0 | 1 
                 zlib-ng-2.0.6 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/61094a74f30157eb8213de32fc5499d4c1ddc7e4 | ORPH
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/505e971cd00025ad6069067b0bab58c0029a50dc |     
  mips64el   |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/c66868a55bb302190d61c09cc5b61d94f6c81729 |     
    sh4a     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/c9f1ee1b7d6f923e1108bbf603c8e6af9073d16b | ORPH
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/e9664c180f3b52c1fcc5b4800099b9c6c462547f |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/fc59de505ee02fcc7fd01a091265804bd52fd8e3 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/0f9571506f607a0c3ae5a562d3b326eedb0ca963 |     
  aarch64    |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/baeab3c87c92505f1f35a25e1b889ef909c2c5dd |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/bfc5e34af9a620d3e1ecfeb166076cf250f55968 |     
   nios2     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/c4308f7378d04f9d5f55005cfd6a68b644f23c37 |     
   x86_64    |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/76fe645031eda1915d3b9ceead512c2d0e18792a |     
   sparc     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/1f02367317d9cd6dbe022bbb9a3967e4d31e4855 |     
  aarch64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/0c94ea87fa57423f6819c35a3d6d27a4b61b67d2 |     
    arc      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/a9795f1b2242c9bc8389b0c8b6897ac9933e0b9f |     
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/dfd6a538ea78ba69b054c92845634ba88c5e6793 |     
 aarch64_be  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/15cd1b8f369a825f3c4dac23a8bc59ee7738d4d6 |     
   sparc     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/9343f326fce18f352afc915b97db743dc9792d75 |     
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/78c5d237154536fe8e217a7579cacda5030e0169 | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/f6e86c504a10a556f057a76287cb498f746ee6c4 | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/966b528a19bf6827483fe6e2891cd7f3ce4efaf6 | ORPH
    i686     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/4a9d709513439e54fac79aa901e57048817d7a82 | ORPH
    i686     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/ca2e2f68e7b0746257b89a6f1b2f6dbd6c05faf3 | ORPH
  aarch64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/afb4e42f17f2e743d4b7f0873bc15c620b52a90b | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/e87010a143d0cca370f4499344accdbdec968ce6 | ORPH
   s390x     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/352f2aed2c8cb4e93d812d4c2f62db0608e5ccfb | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/c89f3a4e57fc8e96d2615c6065b1ea2b28824c3c | ORPH
  mips64el   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/b34ded3cd3ad18073860824f3903ea17e8496816 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/e7bb3c85df56f0e95d337cd4ee29578221bec9c6 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/dde38bf1d513be0292a6a1474ea56e6f801756e8 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/ba1a1a3828332a621dacabef0df22a50310dd526 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/dc3b09c13a09a41079b3ffe4c1aef084a705e858 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/7ad1da49c937b07c881eed0734dfa818269ba987 |     
    sh4      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/57b51759fdc8b6c67728f366143755537b6c9bd6 |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/8b4fb4b9ecdea97548225c41c1b5cc05581b3976 |     
   mipsel    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/e5b028b2b9068e1c230d2208636f5a6c35a4ce85 | ORPH
   mips64    |       flare-engine-1.12        | NOK | http://autobuild.buildroot.net/results/3848562571dca45f75923b6ba2ef66dfae35a8a1 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/fa560f43ac7fcd8c1314de61753dafd37811ca37 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/d18955b4201ed2604acec45fd8a2f2aeabd6b815 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/27f16a68400da78e0021d8b999a97d2e4d984a9e |     
  sparc64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a9d01536c882369b6728297be2b90a6ae5459cd4 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e8307d35e4f31d5193a91f7084a1a3892261d87c |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3837a2a8d55c5c8dd6b6d57cafcb37eef20f7f70 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/5e3184d1db486dc5db8c16341f08f28cff9b4e96 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7a5352621b899e4467de89241ab29309e2b61872 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/cdf1352f7ad0717a2e8f892973db05964c51c78f |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7178ecaac9d51a3a7562b7e67d420a5a1347110f |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7c2da69cb6dca790d764f55539525f796d1f5b8c |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/93703752a3b1e975264490b0ce74618d81b398ee |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b93706da4c36ed9b1a002dac7f928d78abbf7a55 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e75222bf0b6409bdfc7af02f60c01b381effb3c7 |     
    m68k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/149da2f095ec2b1b001b3ff72510c64dfeadce86 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/36d67fce200df21b1011a6147aecaaa174fe3879 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c894c7558cb8b1e7d6a261b310b1c5fdf3a31811 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/31455cd843068227fe3bb13c720b890862907117 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/602e0f0ee3b1fabcf44b86d3af575efc6c10884e |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ba0617d70b64170fccf0907f6df0f30d1959ceb8 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/49c7995a5b6eea9f829b552c4490071a0e6154d4 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3df286823625d7da49259ed56276fa01496eba8a |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/149e0683a63df53f19cb02de612718b6813bf0b2 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/e9e7b56b6402565f4d6042164bdc38e788eae2e3 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9463bf8947d31e6d0497eaee489d06f54bd583d9 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8c38060efd7ed0b51da5263fe5d9b0b77409aec5 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/91291308d89ebe1204f834a17c8b49477ba0ee3b | ORPH
    i586     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/5705175a51e58ac359b5b073cfeb2745bd4becaa |     
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/1b7af8f1f1c81f3db759167ccda652b245482a9a | ORPH
microblazeel |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/8b19b66837bf091a3b14bc3d299cbfc08d97ddf3 | ORPH
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/5b6bb2bce94ed629e2498c88717e9b8f2f57a584 |     
   sh4aeb    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/992461eb7b8ef1ed96533380a25f883203c65352 |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c197b1859ffbfe2250ce7c41fa1607e5d3449122 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/479709e9a1c0915548a5b7953cd8ed19fd9fa29f |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/19581129844b40c0d3a327d7f1e9c71896882c44 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1cb4e7c2a5a9689ed2dbc3efd5920dc60fe1d5a3 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/44880f5fd64d5a5da4bc861995ee7ac7fbd4f808 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4e5b85edbeb6628b129eb3797ac83a40e05c9a90 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5ade9e7ed8ad01373b4e4c2bc92bd9b0a821d6da |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/208b5e25cacc8a9a37d057df245817b60c0ef9eb |     
 aarch64_be  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/9112cb93983b0dc9f852ecccaf5221412a6f86a5 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/2c8d584d0829e84888e92b6fe8dae330692bda21 |     
   xtensa    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a1bbf7d684b61036163cd729e021161b8448e15c |     
  riscv32    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1b3fb55e932e0cff9a38e457ca65fa2199627f26 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/45ce96420116971513618d3666f441f8557cdab1 |     
  riscv64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/bda4466fee9883dfdeb70fa9fa67129ef8b7397c |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/0f8163e1750ecfcbc76222385d4d04ec5ff46885 |     
  sparc64    |         host-cpio-2.13         | NOK | http://autobuild.buildroot.net/results/146951befd7648f09fa3900240054023e464210b |     
   mips64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/8fc22733cf227c9acec9a119cd3630ee28f0f453 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2a2cba8b216b8534e2462a8cb05c420bb46d1e92 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8ac7ac001ec3f31ee2d00f5a38401dcc2fe682d6 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ede28201bba641cf8204cd4538ca74925e5b6bb9 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7dc9a947488d9811a71d5402415273a3157b7476 |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/782ace466858a9172d29f84e8097d0cd724c09f9 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/33eaded7f15fdcf908f77e931dc3b68f13132f90 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0259e277190becb082850b5af72d4cbb54b3d294 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/970e4459ba445bdb2e417e5d97fda8d8d9035a4b |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d38e02b497eca36b6aeeb5a58de97fc2eab50c00 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/209c87edccbecc93dddd0d89c0df429963b02402 |     
  riscv64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/45f2f9984c425a7e79e871d4b06327f046fdff75 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6d12dc87edf5e8a5891c54a62a88eba873610932 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/81245ceda5efabef1c912129b75277d3af2be6ef |     
    sh4      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/93ce56fab288ef6756ed41b7151e161e23f29aee |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ce2e7eaa7d532f986d33707d0201c2447116cfac |     
   sh4aeb    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/498f5e7870e0980a7b592c29bf9ec50cb110d3c3 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/687fa038f88ab241b1015dd015723228e14de0c7 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6ed08b82ced1daf3c237ce05c153f2c58bcca074 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8b8a52042810a7d978318473b13c0ba7777144d3 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/74df6fc9242da1c8ab1fcb8e6a536445b0719665 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/10ee13d5bc06268063394e0f8a44d7f95f71f14b |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/af10ddefcfc67719f39830b0baa0fa10f661705c |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0ab2d254503e04bafbedcf857ac0115906b6b8d6 |     
   sh4eb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f0c5d2b3ec8531230ea771627f756a1576f25b25 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3f34614af40a553b2e0a09b99583500abfc5713f |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8dafc7861d847af0f97ede986e7f1775562ea632 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/26266a333ee01ce9b3bf29f0f9e750695f0103a2 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/95bdb2c323ae2661448c2445961249052912cf8e |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5816006870e10d90341a49e8952f20f44b04c9d5 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9bb2f7f3cb7791069b490bda3ab78b0a520f8870 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/004580329145ba762a5747945a9f1e86187abfdf |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/657ad383e725c87b0b1e2ae6cec3b8ed8737bf65 |     
   sh4aeb    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/f26a195d9a60588b3a5795d93a6adb4ccfb4b702 | ORPH
powerpc64le  |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/f1bff10e105db4d52d430cf52c1a37fd3e68073e | ORPH
powerpc64le  |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/6dc311bae263fa00bc2c1f71d3b09b3527147d60 | ORPH
powerpc64le  |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/9c0b4ff7d0507d7b6c3ac85a97f390a0c90c2510 | ORPH
   armeb     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/51b5f8fd39f5135a08e6bc1e5e4a8168135a6c98 | ORPH
    i686     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/567d0e2f0e3f12a46b748764bb9a43ac491e9059 | ORPH
  powerpc    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/83c3f4a3d378fa7d737470fc7a0c6ff46ae025a6 | ORPH
 microblaze  |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/89ab3016b73e745ddb3435cbeda64db135ea793a | ORPH
   s390x     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/04db0c4c35435ea1225e08f529dbe953c6c9309c | ORPH
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/b4ab8a8291f1e2c1c270a87756ac7a0c1d1312d7 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/cd566562014e070fb0a1abf428385e3a6b80432a |     
powerpc64le  |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/41abfd381fa58949631fe7d6c0db33822606b6bd |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/4304f6bf4a16fe14afc67855bfe2e51718f3a351 |     
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c8c9b1aa5a798b30f0d1446727c8b8868c62e76c | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/4125b6f807e9bf0854ffff8b5df9c4e740bef666 | ORPH
microblazeel | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f6141fce04097d9f6c074a1126ac7b4b658da6b9 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8a7f3cc6099ea895b76362019801fc31ea261d66 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d24865ce8b5aa408bc933bade15dd0cf2092d46c | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f3851f601f93817e89949c5696460e919f912549 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/224b156b4ae099277783ae0a59d138896ac6bc1f | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fc328af5e43896e5635265071bc33fed31088eef | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/005deb31572ed576a7bec137f16414a0df8393de | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/4b3f8d7d6556935a1ff878a4815a5d474f773556 | ORPH
  riscv64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/497c6048e3ad0f2892739b82527ac3983ee8ced5 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7b289e4c3c499503d32c9049206629b91439ee15 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3b77f8f9864792af7693564cdfebefcff690618d | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b258af4442067217bc2aa3290e21eef882e0a5db | ORPH
   armeb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/87ac78e51fb152a62ff65f57f384a8bd0a214ca5 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/4ae8712856ddc172420c96479e781a8b3dae365e | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/4f9317634d9802f57671041254b37523a82e0519 | ORPH
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fd36698448def576e8ebc26fde4eb2c32573be15 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b073b58c57a5c3cc8ecd9c69c614982e40f0695f | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b87e7c3fdf96f4e65c671f8bb0a02ff022ce9479 | ORPH
   arceb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/6a401c6135593e705d0eea860320acd5f7b787ae | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/806b279148fbf6c2a49b510de30cb7475e7a9a99 | ORPH
    i586     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/293aff8a3ee7c96fae0d9e054a6acd8d3726da64 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5617bb23f946e5124c0b3cfcb34acd6120ab0d63 | ORPH
    arc      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ec11c967861039564054c54820331640c78457b6 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2b01aa292099c64ca9ecf4cb908c3359785090f0 | ORPH
  riscv64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7240467f0f9ec3e00d6a1eb9c108b389c354a010 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a57e63302c6ac28b0449a31a088c0dc8cd30cc4d | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/681d09b57aa700e74a379e320484dedb7c55aefc | ORPH
   armeb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/304aa32c1e35c6ee3099e4598d28d2280d52b057 | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/433dc1ef4072553447e0be2bdde36427da23bc04 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/925e96b4edb8d9615f350e6e7a9b51c859879ed2 | ORPH
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/200ec9178b7fd3922f02a74cf3ad7872cb98a277 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3d83c1964facb09ef7402f887bfd5f99c54acc60 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f9067949e10d6bf5d92268b2daa2e9090fae9d3c | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fea6a6c96ab7addb9a9b180aa2d9988f516c8c64 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b6dd34950a4bcb2b6a1ba02a50c94d1053b5cc76 | ORPH
   arceb     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/07d3347accbe42117c1f78073c0482d9407c514a | ORPH
    m68k     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/2d5258353d961d6db6eb290d76aa6926ab62c324 | ORPH
   sh4aeb    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/6e204fa280530116acd515f34d9ad3d57ae415ab | ORPH
    i686     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/fe6bf94309d4d28596f3b7f15e5d861e2391142a | ORPH
    mips     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/73b4dbb0813364c045e01f29ee87bf9d27fd8eef | ORPH
   s390x     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/b78a472b9d5ca056f5e2d23ac448f3ef0fac48fa | ORPH
    arc      |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/d287ee17a8184286d91c10e4657a7f6c57c7867b | ORPH
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ef7214db14b00535774c3fd986876c8cb0f764d9 |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fc5b43a0ecb97dc4b75d7e30b3f328499fb6bdd4 |     
    sh4a     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e3e24a5fb4f557c49608df862cc31136d2d2acfe |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8af400170a928d52a81fc8484b3242026dabc03a |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a036c025a5e50013afecaa2335491ecd128e694b |     
 powerpc64   |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/e95acab2002103c05247344eb179a86729c5bb0c |     
    mips     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/d7fe4e8d3760de2fd1aa4b6ed21e92bf7f0c0d54 |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/4413487e0b37480f69c2c10aa95ccd75e5585479 |     
   s390x     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/fc476f0c27f02940dce6af482d10dd4eef8a7aba |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/8bf237859373564463a0417f48a3318b2177b958 |     
   x86_64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/cbf09d2b990d0baf174496093636f00fa98f67ca |     
   armeb     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/d13150fe9583dd3aae06b8c61e9c0a7b20742b2c |     
  powerpc    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0ebfc9d9db2a85b48eeb79ce592bed3af5e801e3 |     
   sh4aeb    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/073e2f7f0de2b2c055d0cbf340b4ba7472436493 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f04ca9e3e5d5a747d145d15193b9d8cc24a5e2d9 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/8c5b083ccd09f9124bed8a983a1077b4f5ab8582 |     
   xtensa    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/90d5124596b17a32c8235bf8b06063ed4d699f96 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/079a752aba767cc08e22597e47b2edc459d190be |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f2b21389f018648b0e622c0847f2ba49eefb6779 |     
  riscv32    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a47a8ed439f9423853f05a0346f807e1c4a4b50a |     
    i586     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/09636cf8e167835f0e9a00289ba659e10fd356c7 | ORPH
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/9141a4025fc34d4ee551902be38a1a2fe0f691ee | ORPH
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/869adfadc6e557762bc8d1987f15b6e8abcf920d | ORPH
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/d28aa1da563d49573caba5d47c538b78a913622a | ORPH
  aarch64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/f22acf42d03014d85d850c4047e7417ab4d3617e | ORPH
 powerpc64   |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/9d5f71f325d58283dd695fc7c44f333f649c97d7 | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/1d171a12ee0121db557e21253b3ebfa04279e2e5 |     
 powerpc64   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/722474f7b189bb4f14f0f1d1f1aaa83725d6310f |     
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ea4cdd99b442982b9cf9f3bd4b1968e3b254f50f |     
    i586     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/39fabe17744579be4aff85684b6c2672d60df846 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/244b55d383ba572526844cf24fd74e03910e9139 |     
    i686     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/3cf860748c11f944055e0bc241ae79b0201a6abd |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d42ade73fecb829e0cf99f5e34ebd2c05cd5d3c7 |     
    mips     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/a18e5ac04e4a38c73c1f9f2d5024acac065c6485 |     
   sh4aeb    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/c8e75343137b26235169c240b33dd6a50479e279 |     
    arm      |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/39fcbd6a577b3499807ea5a4bfda9b758d73bf36 |     
   nios2     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/01e4282182bd7c42a2a36d930a49705eb0e6881f |     
    sh4      |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/b160cb3384ddb019b6887b31dfc4d2b386543034 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d72edb6853aff01295e1ea55996d386654801c01 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/0b08681d5b422d31695afc43acd9bfc43d465f36 |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/5670fe8e307fd007029cb6097207c83e181fd203 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7e2720c149e990efb59dc8d61cca9e94bb9b3db3 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/381a0c8e409fa43fab0befa6cc60aeedea57f2ab | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b9fd6c0d91820b4c92836fdc383fc1c92e22b051 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/32f2c0f92b345fb79e3cc29287b592dfd49327f5 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3514ab9c4cc05ddd163dbab900da8cdbceb2ab3b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a73724a3dbbb429b1d68a3d92dfa9d5b1c2a9ba9 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9699339fa4bf1bf450fc8c81a9fe09e288fa67ff |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/21718e7161a04f371e5f4b5607510a36d40e36d8 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e67ec3a81a4072d7d322f67c916a5156654efef4 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/baa0f7d3313ec8613b3d670d9f06a0b74a8dd995 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/80e0ee3ed1b1d2f23973c0fe43af8c90db318362 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/afb199ee866b168ee92c4d85d0dc13745aac3b5e | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/167c6e80b41dacbf3a54c798279d8484dfc7d443 |     
powerpc64le  |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/32a73d22d1668adc14334c8f8a6083821c2993bf |     
  powerpc    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/97b428d8aa4953e853b650fcb0c883c9bee06279 |     
 aarch64_be  |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/9f138ce7cb2345eec191d02caf709a229cc4befa |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/242577ada0ec8cd79ff2d7333a1b92a5263de17b |     
   mips64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/9feb478056935c1885752cc6ff94d0d0371e0259 | ORPH
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/3cc6225ce88d571a21af0ab0ee7e39f7f518778b | ORPH
  aarch64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/5b6b5d2667fc8b799b6d13581e42f5fa8f379d88 | ORPH
    m68k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/80181c13546e819f25c0e7aead3cdb19fc839857 | ORPH
   x86_64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/7e7af4a30cee1a4459ea84e8a5a551e3221394d8 | ORPH
   nios2     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/ccf854cf1b024d7724ad3617294b211f57c5cd0f | ORPH
   xtensa    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/c3567218cccc0c880f058b9a34957e647d8cf363 | ORPH
 powerpc64   |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/0de3dc4ab3c7eb2769f3032921d5e60452e34f23 | ORPH
   mipsel    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/be20d644dbdd2e187338da22e74383c7666d489a | ORPH
   nios2     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/31540c15f192bd81ba27d6b082d3399c64e82492 | ORPH
  mips64el   |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/e46484733f11d71e27a3a037973eae5b34416b64 | ORPH
   x86_64    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/d37550d768646253990ad3133d06ef4f99b67592 | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/54298b64b335e91e7dd180f849d290d569725f72 |     
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/6e940943008222798f5564057f23a63aca08b49b |     
    i686     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/be19f398354af82e9a7a8db891e7e529a7c05ea3 | ORPH
    or1k     |      modem-manager-1.20.2      | NOK | http://autobuild.buildroot.net/results/04e955655ef7403acfa2ffdfb7a3379978da38b0 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/d01b99d469a0135760243c336642e2143c8804d7 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/7a566862eb5c28a4159b81eb7bb5b186b77fedd8 | ORPH
   s390x     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/9592ad676db0e4299b7dc2b93642577a8aaf6361 |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/e63f64bb0226849841001f248432ac48edb932b7 |     
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2a32c87b1cb3dda91794d6640e2fffaf087f66dd | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/e4808c6c22b12a73f04f60d81362444330f61d35 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9920b52842542a645a29cc74e7821718babfb110 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/1c17d5b000d207b2f0ebf66cfaa7dce8a2b3bd95 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/3d5742b960390c8d6d810de2a03f481f9f8a63c6 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/958d40dd02e683e3ca5477e54f637d7a2a08a9fc | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/7e18b0143588409548959b235df18ebf62f756a4 | ORPH
   arceb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f818a09766ef288720f3a888f743b048e3134a1e | ORPH
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/6a4e74d4015667c2477b5379747457d789b6b8ec |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/b82d8f7d22fc4d433b66efff40a608c65b67046f |     
 aarch64_be  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/f5188fff45575ec209139985de9e8e494963f3c5 | ORPH
    m68k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/30af438be3f5fa9d3be3332db549d81f3ca937c3 | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/475875e260309ee16604551d8b939705eb2f601d | ORPH
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/797f6e2bfcdd6fd52defda9f6c15a295d520a02a |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/15f1025441e7bfe0f8f7c94ea561e8bddfdf8711 |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/39a81c71ceeeb7249d492771647d9b618d6dcea0 |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/219dae4fc48e6ed94b238a1f1bba491e27fdf9ea |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/6e3e04aac1b33cd26f31f934dc78bbd1ee16c440 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/e30bc923e0af1167c31cc3531b96e7c2fd11f3ca |     
    or1k     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/2973dd96d15b5a0f06a06ab8ef4bc54a4b350d00 |     
   mipsel    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/90d3b38b886c45190c8ea671a532d663253870aa |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/f9dcd8ddd23b29b4cdf5e26f56b4a1aa6d21b0c3 |     
 powerpc64   |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/787775808e694a1bca9a336dcd5bf3c24d042e71 |     
 powerpc64   |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/cca132854148b8d3d117e359776d5a830c1dd938 |     
    sh4      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/3ba0f5f42f4570fe12ebcd3175a177cb1fe03c8d |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/160f6498e991ff73dba06dbdd5da2d52180ef53e |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/ccbf98b9dd9052f90f82f30961b67a75b300bd6f |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5c14799aa1a6d89ea2e24d64b7c2c8584282dbbe |     
  sparc64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/4e9004c64177beaf9a5804ea6ebcfe46c9cef72f |     
    or1k     |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/1cc0a290e86c37e05d7c995c714241e3e88385c7 |     
   mips64    | rtl8723ds-a638cc8639015b8b9... | NOK | http://autobuild.buildroot.net/results/6194a88ac81f45c7daf4095157e45d30f54a33ba |     
    i686     | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/3273af80e3a49f832f1d02e6cfdc5133500462c8 |     
microblazeel | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/102a6778e95eaaa6f1a7b84857124ce2347f4f25 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/fc539079d6e223a9c24db1120f8572c640dd132f | ORPH
  aarch64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/af1e6f91795333dd33183034d59c4c955d9e9de3 |     
   nios2     |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/783d2727ee56ebea15bd41bbfdf43474b5484e6e |     
    arm      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/47a535d8f9726bf78ddce48035cbf5466114c52b |     
   armeb     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/649d493235c4a2971d1518a003bae84e52280ca1 | ORPH
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/10f03249907b5cf3241b2796ead885696c8d723a | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/11902b65a834beb40e67db5e7bde3bd3f4680ebc |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a2e2247e7c0189b1457a63382355c9dd9c712ecd |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/21ec4e1bc36b057e5189ce5fba4755b381380b79 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0c86d7e121d913a92339d2c19479c2c661fe7df4 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/833cb330dcdd262df34860932c5cc287f8dce933 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f1cfc727fd5a616457aaf4eb2d374a9bc8b11696 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/114e5614336bff5833145bed18e9c51ace25c968 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e91272e02c9ffa6364af4d9bea249945cd159f0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/34da06dbd81c36c121608b14d9d51b269d5ad226 |     
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/b93958fb8e17022c03aa1c152939f7ae1f3db785 | ORPH
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ae4f39e6fe73f02882769fe0e432ef2daba2387b |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/8c78fdee611c14399ab22be50c2a36e3cbec89a2 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/f43b91870e479741f9c3895c1a4d264b301a3b63 |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/f806f8765a4c2f85a3fac7548e4942a451536241 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1cd614ba3e699e4503a8b7254aa73ed052bd6887 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/03d4eb993f86591f91430984eb298395b591831f | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9dc6afe4a37d597055b778961ba4bd0ebdc66ebf | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2f50e209de18f14a3090b699b13f3096670e0348 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2a97c4c493400c1edc058f1bd7b6898557332586 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2ff3e282ecc2772f6e5cc29330a731f9a175e65e | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3bb43b0f34898ec85711d1bb3dd8d4c628e31997 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/28f9009a90b1a302defde3540e6a14e01273b8a8 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3897aa18f00d960560bfad82d0f46fbebf84e364 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/326ade23fa3b80d5098557ea10cfb9a89893be35 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9e89a5ebceddb3eb59d67df236e54bc8da8f31f2 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/4ed5a6b23b999d92349422d621b23cd7def6b64d | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9a78a1fd020ca7d1cf6139c35d31513540f9b9ee | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6f3efe1e74d59c9d8bfcc7c7c54e3419aae0becc | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/5e52fbd39d2112bdac5932a52953648365edd1f2 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/fc80b25bc1c795bb6d9731324fa8b72c4b90d3ac | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c14a1c543258dfb3fa7dc6010af3e27b1395b018 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/abeb2137a3a273bb4574239468e0a1e52f7ee6a5 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/979be10da8057196cb547f44d985c0fc01210cce | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0b3026c98472156a7023ca825be0bcba38068a94 | ORPH
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/e241833f206c677a3221821b1ade77326cdbbace |     
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/11cc3121c696fa28209e1a5706051c3bb8b11799 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1b27e9e55f73dd5f39d45379bbe8ff1241bea01f | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/903f31358075568d6fb4454eb6fe5a0c805ad421 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

          janus-gateway-0.11.6 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/03932c04b5c624d37f024e1717394cf69bbce9da |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 2 
/home/buildroot/autobuild/i... | 1 
             containerd-1.6.12 | 1 
                host-go-1.19.4 | 1 
host-spirv-llvm-translator-... | 1 
           janus-gateway-1.0.3 | 1 
                     libgcrypt | 1 
                  linux-6.0.15 | 1 
                 openssh-9.1p1 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                 systemd-250.8 | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.3 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b78561b0f0d202b4b67bb6c65bf1c0fd4e6c7a85 |     
   x86_64    |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/05e60c3e5fe88b73095d238d47dc1e1b73ed10a7 |     
powerpc64le  |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/3165cd072abee1bc7953187cb1bfe9cd7b29607d |     
    sh4a     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7db33f0a7ab0cfcd0c3239a8d0f695588e91a9db |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/beb298661458e5b013bbc6e13c6cf05322567975 |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/48aa2d82b7014272dc64772e471bf209c773b483 | ORPH
   x86_64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/fee8a7cc029d2158d3bc623509fa3687942b7b86 |     
    arm      |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/1dfb1ff2f61b1cb55635c05945a6c2b1cf63328f |     
  sparc64    |          linux-6.0.15          | NOK | http://autobuild.buildroot.net/results/1080101441b5c0b385113607fcb930320ed69cf0 | ORPH
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/af92f3d6ce953a2b3dfbe9fce75d0df4a765028e | ORPH
   mipsel    |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/80ddc2a3f6b07ca4745c66ad329f997de5002e9e |     
   nios2     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/babd0ad15cad16d31ce39a493d86e9bd71c7c3d8 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/a83edee4001b1aa12e6e1e331c32740351c20b07 | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/a2c0e6c9b06b4570e355d78b48c40ac7684e4fe7 |     
   armeb     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/5259977b52ef7d3d2c71107d33aea05decbbc561 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
