Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8987C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 06:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 480EA402A8;
	Tue,  6 Dec 2022 06:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 480EA402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mgEras5wrGDt; Tue,  6 Dec 2022 06:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2FC440382;
	Tue,  6 Dec 2022 06:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2FC440382
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A63A91BF30D
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 06:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8017940382
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 06:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8017940382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id doh-tJYDjnYM for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 06:35:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43AF0402A8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43AF0402A8
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 06:35:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82FFA24000A
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 06:35:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 06 Dec 2022 06:35:16 -0000
Message-Id: <20221206063522.8017940382@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670308516; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Iq9KTiYnX5WaIi23wg5fBPVpNvo44mzAWcZx5dQuiVg=;
 b=Zj2JndpqTl9og8C58iuYDgRHkizlbM8gfDxFyn5GU1kZBBzIiJMKnf9Hzo0sNfvZR+VlWL
 bi6AoF2tv/DHW/kgRqhLlcaJXX1/v4m5bnYad7kZwCAvMtYqd5IUC3nnxk/ESDY9aNtcnA
 wKjQ/s01e+03SHyBMfQCkIZ/sJGOB2TRsbIO7NBNDbaO83h59YmuaA8DlOZJBEkwHCQ1LW
 AFr3xi0UAeBtZmA8r1jYsOgtNfMaLRlIGQJYPI/QP8dPfWvI3/AZ5ZJzLeBWQZ9iY/onBY
 kH/YrCgdUosreyINjFMGBoOMov2h7F5shxq9p8el85R+6AceQy0GqxvkQJhH2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zj2Jndpq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-05
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

Autobuild statistics for 2022-12-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 15  |  3  |  0  | 18  |
  2022.08.x  | 19  | 20  |  0  | 39  |
    master   | 241 | 261 |  0  | 502 |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.19.3 | 13
              host-pahole-1.24 | 10
           host-python3-3.11.0 | 10
                      xz-5.2.7 | 10
                   aubio-0.4.9 | 8 
  gobject-introspection-1.72.0 | 7 
                   linux-6.0.9 | 7 
                elfutils-0.186 | 6 
            host-binutils-2.38 | 6 
                gerbera-1.10.0 | 5 
              host-rust-1.64.0 | 5 
                tealdeer-1.6.1 | 5 
               valgrind-3.19.0 | 5 
glibc-2.36-66-ga1dc0be03c9d... | 4 
                  jack2-1.9.21 | 4 
      linux-5.10.145-cip17-rt7 | 4 
             lirc-tools-0.10.2 | 4 
                   perl-5.34.1 | 4 
           python-numpy-1.23.4 | 4 
                     efivar-38 | 3 
              erlang-22.3.4.22 | 3 
                    norm-1.5.8 | 3 
                    sdl-1.2.15 | 3 
                  sscep-0.10.0 | 3 
                       unknown | 3 
              containerd-1.6.8 | 2 
                      crun-1.5 | 2 
                     frr-8.3.1 | 2 
                     gmp-6.2.1 | 2 
gummiboot-2bcd919c681c952eb... | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.39 | 2 
host-gdb-arc-2020.09-releas... | 2 
              libgcrypt-1.10.1 | 2 
                libkcapi-1.4.0 | 2 
               mariadb-10.3.36 | 2 
                  netsurf-3.10 | 2 
            ocf-linux-20171122 | 2 
              open62541-v1.3.3 | 2 
               pcsc-lite-1.9.9 | 2 
                     pv-1.6.20 | 2 
            python-bunch-1.0.1 | 2 
                 wolfssl-5.5.3 | 2 
                  zabbix-5.4.9 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
                  aespipe-2.4f | 1 
                alsa-lib-1.2.8 | 1 
                  assimp-5.2.5 | 1 
                      atf-0.21 | 1 
                 augeas-1.12.0 | 1 
                    bat-0.19.0 | 1 
                  boost-1.80.0 | 1 
             dahdi-linux-3.2.0 | 1 
                 dash-0.5.11.5 | 1 
                 dhcp-4.4.3-P1 | 1 
              dieharder-3.31.1 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
        edk2-edk2-stable202102 | 1 
                  exempi-2.6.1 | 1 
             f2fs-tools-1.15.0 | 1 
       freeradius-server-3.2.0 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
                    gdal-3.5.1 | 1 
              gr-osmosdr-0.2.3 | 1 
                    grub2-2.06 | 1 
hawktracer-2ec19d7192334414... | 1 
           heirloom-mailx-12.5 | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-10.4.0 | 1 
              host-rust-1.65.0 | 1 
host-spirv-llvm-translator-... | 1 
                jemalloc-5.3.0 | 1 
                   json-c-0.16 | 1 
                       kmod-30 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                  lcms2-2.13.1 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.12 | 1 
libdill-32d0e8b733416208e04... | 1 
                  libftdi1-1.5 | 1 
               libglib2-2.72.3 | 1 
             libgpg-error-1.45 | 1 
                   libnss-3.84 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.1 | 1 
          lttng-modules-2.13.7 | 1 
make: *** wait: No child pr... | 1 
            micropython-1.19.1 | 1 
                mongodb-4.2.18 | 1 
              mosquitto-2.0.15 | 1 
                    musl-1.2.3 | 1 
                     nmap-7.92 | 1 
                  ntp-4.2.8p15 | 1 
                    ofono-1.34 | 1 
                 openal-1.22.0 | 1 
                   opensbi-0.9 | 1 
                 openssh-9.1p1 | 1 
                    php-8.1.12 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                proftpd-1.3.6e | 1 
    python-cryptography-38.0.3 | 1 
         python-greenlet-2.0.0 | 1 
          python-orjson-3.7.11 | 1 
            quickjs-2021-03-27 | 1 
                      rauc-1.8 | 1 
rtl8192eu-1e15b6d451731bc4d... | 1 
                    ruby-3.1.2 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-codescap... | 1 
           uboot-tools-2021.07 | 1 
             uccp420wlan-6.9.1 | 1 
                 uclibc-1.0.42 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wavemon-0.9.4 | 1 
                    xen-4.14.5 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                     z3-4.11.2 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/cf94e74513e38e7018ec19b0f3ffaad6f5d01ffb |     
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/82817d58824796c64c6bdb1ec2fe83400b8bc395 | ORPH
  mips64el   |          aespipe-2.4f          | NOK | http://autobuild.buildroot.net/results/80985c4144701aae33ffcccea8ee942e2196c258 | ORPH
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/402bbcdd7b985ba06c1b1ef592bdcecaa271840f |     
    arm      |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/2a17545242b2c35cb5c293b52387a14c62c59ace | ORPH
  mips64el   |            atf-0.21            | NOK | http://autobuild.buildroot.net/results/8158c25a22abd5f0d97f21ca7c77589f8537073f | ORPH
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c289379a62a8098c50911e2f35a1a199d227002c |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a7ea31815a716032fd7a7a0409b2cd151143ec6d |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7c76212fe683d16ea53b3dfdba51da171bd95d61 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/343bc5bae4643eebaa8de7dbc2db7d58fac747ab |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c7d9422d68d919ab8149f24cda7f1d4a77563b1c |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fa8406e6241a7c746dd694d7585e94a53553c0ce |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7ad5621443b907ec5e6ddc00e8703d61937ef1c3 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d3e38dfecc614eb86f680cfa9003f0950cf28215 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/998da634ad9cf38556048ad509689c091154ada4 | ORPH
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/54a00c590d07f2c003eec396ca932584a910d94a |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/1b50ec6bde4e1d35d12c296ca715b968e8da8fa5 |     
powerpc64le  |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/3329e59fb18de3a67afa4b04b1083aa408186cb3 |     
   s390x     |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/0623b83c62ce918053df2a8f5f6656819de1cd58 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/182cecccba13b4fc4bf56dc0af6fa055e9548cc1 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a877d25f084176ea14688dbaa12d92be439fcb2c |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/8621524515eccabac5641022a04d58b3ba644406 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c59626dcba15fc3342a9f9f8ccbb0cb87ad795b8 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/dee6715ef00e3ffd94fc1d781ba8005334014082 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/19ef227488bbfbc19d6f7d14aa37939819a9ea42 |     
powerpc64le  | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/cf99b9eb2d9f4aceb835d8dac66871294414da71 |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/42849190deceb8bbc141016a5c5155851e100cef |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/66d28340f8e0a48371774a1a3994310f2840bd05 |     
    i586     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/f40f8c01aa4d4da4fad63a6b27f6948c4c1eea00 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/388642c62ebefaa73e580fda7ca5e482ecaba1a4 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/24949c9a7dcc928a3b55dcf4e068b9e000d032f2 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5873d62804da32350c8b9de95445979b9037ab96 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cc31f29c26d2a3181e64bdff6857fe9b523a0e90 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e09713648414d381ab2b6150acc2d48be7dd1de9 | ORPH
    or1k     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f7d80779cb1158f7e33a4e5dfa2c34ebceaa64a8 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a29295479cf85fe449ce521eec9d9c7f8e8103ef | ORPH
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/05c37a6dfc8f7067a6e3463c0c22d500421e4a85 |     
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/f3cf4baebae134812f4f9f702a8f3280a6255ea5 |     
   mipsel    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/bccdba7ec206cf885f3e026fcae485d38054e8fa |     
  mips64el   |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/9898c9f2088dd28e09057e4576e4c4611cfd6d04 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/90dc04b24c138ac6566f7311a0770863d60076ef |     
  sparc64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/b83298673c693f83c727818a803818f67e3d3f1c |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/43cc72223c33c79e81922a09b6fb0aca89f25594 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/4e8441fb2d48a55dab45240694b35f0a3a40cf76 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/6934d772719bbfb48d12b47a9d979abe8ad496b0 |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/44827b05ac8f97c35d25bc250c3f54dd04b0b3c3 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/cca903b7574f1fddfe9b5914fac8bb7ef7f50641 |     
    arm      | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/e90dc82699874723983d259fdf7f473651826cd8 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/156c7e5e56d8b450ad88ff2c067cfaae8f27840b |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5080ea632bf442cf91a34f3454ac7971b578b039 |     
    sh4      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/8d59c694a5b0b06674c1bdfea38631474ff0a112 |     
    arm      |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/e8589180d4117771f3333c6bb857b3c311dd8bd1 |     
 microblaze  |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/80f7c79dbcacd1e2befc6e22defb994837dc54e3 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7a7fae63dbdd86fa1cd88e9ac981648031564af6 |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cea7d1b8e07ec4dc13ca6d6c3157fdc883abfd68 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0976aa64d5cef835da430098ba6df795f70bfba8 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a40bfafd260354ffda2e0fc6332c626ff76d1018 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b24673629d4fe31e46db86242edc7284972ab933 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3995a481242b79c030c7ac6f635709f230fb7c94 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/50b37a8b64def56a5c236e462956dd5c7cc326eb |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5c494c961c4facf22f2001421caaf9547e40183c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/cac0cbdb525c161e616aff3a4220ff3330eaceb4 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/eae396bc20461c48795919c373b694891670b17b | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/5b3450310a6606faf163345a7a9ab4dd7a057180 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/97c9ed15842908cb7704ee4fe87e58c362a69f4f | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c9c7481de7a669e85186ea76ca63c2dfa437c6bc | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b2287419e56c1b73de59a413afdade66668cde09 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/786ae3f7fe3d1e0f28a3ba27822f46ba5e9863f5 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7de6b278f58bd08ffbe80a35d00148ccb192a9db | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f979c77b09ab8ec5f489b633c91487e534dc467b | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/58a893c6edf8943e7372a367eda89b7827473b96 | ORPH
microblazeel |        gr-osmosdr-0.2.3        | NOK | http://autobuild.buildroot.net/results/5c2b50be2d583999471fd5fac6da4e0b63d0a106 |     
    arm      |           grub2-2.06           | NOK | http://autobuild.buildroot.net/results/328e493047ab4ff607718159d27db7cf71fe9bbc |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/94662fb8834bf2d439be166fd6e8a0a9da1ecb70 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/df7187978d0134e30618d3328e5193437bd9f1af |     
   xtensa    | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/a82cfdc94e10b4d27bcc6185c7da6184f6a97175 |     
    sh4a     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/5ff2264340aed74f2de32a01c6407829366d3888 |     
  riscv32    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/20bdf06e2f051ebf33b899a21beef484fe383d46 |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/97a4aa8ebac41e0a6e3e8cc31d2460144ef35861 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/80ac16650fd4347110f26e46f56ced997a2bf489 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b90c4fe95499279964f3a97524a1ab24f1e0f647 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3fdc2a1969645602e970e6dfe000a399cba2ce5a |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c27bcd8795181b8c0f423f12d06d31bd24e64e66 |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/50243b24cf6d56dbf413113f5b4296af798623c9 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0ebb742edcf64cc58ed467e1344ae7e9b9188a53 |     
  riscv32    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/83cf218e8981971523ee72bc93205c36fd5d8dbb |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/49881cd05e1eeb55a377a10f7fc45b52ee8ea78b |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/4d4d06e1bc4453bd51dd957b6a86ba9719aee5b0 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/d37a0511d56c1e766702223490f112afcc2e9933 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/a0764f3fd821a3943c8b3ff2e68a6300aa67b2b9 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/efcec2659d438b5250fb431a177d2c053bb95cb1 | ORPH
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ff3bc2498bef69c8e396c8ade29ca838fd34d5af |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/881e03c97f24c4827845b0acb0781382f1b0ffc9 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/d413ff686d6d20b72581c8d368f06fd497cbfc6e |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/383084d62a2155c70140762d4d24aea2bfd25b61 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/2cfadd730939ddb62008fcf2f5eec063da9627d8 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/92051fede9e03645e69b3b424347433cdb651800 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/18bc510f5d797a103ee7ac9b560e4395abb2f218 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7231fe19d72515d7b39359a48d19f4325ad29f97 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/5c30e1113e0667c23937ce8683f0d96967dd434d |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/6cb3bca43d96c5e2e2d5a0c2c179aba7e6792215 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/d1648dbdb4c357c7dd0d8743896a93322a8c5682 |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/05a81fbd2e4146bbade64b0098b7767c82691a5a |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/a5361788d8a486ea8ee78d1748b3ea90ae87bf97 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/34daa46ffe19ff7de38308ee8fe454ec0b2af9c6 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5211a360d074b33f4eb6bc2c1d98c6eb7118d68e |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f327ac6fe4f12aa6b0bfb17775f0c05f7c7bf188 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c306b8762f8107bad238453650835aa6fbbf07e6 |     
   sh4aeb    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5854e6315b07dfaae9ea523f3cbf34099fbd71b7 |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b99b207a10eb4537580063f5390e0b0ec00d88bb |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e0ef9ed47db1b9a05083dabe5f88dc693493dc6f |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/29191ce81b48e6f5cd3e10e1eeea6a4fff3d1332 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6378680cba408301f8ed7573abe8951fe4beed8b |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7151e3fdc648ea3f345838bed2875e395e2f5873 |     
  riscv64    |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/c86be3bf278c45bd3a11958626208dfdc241d1b5 |     
  mips64el   |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/2707e4e5545e2cf70ad5dfa36a5c25d3a44916d2 |     
   s390x     |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/4bab208853bcc09d48f7efd1171bd42992c75a45 |     
    m68k     |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/a952f1d35f683d5a13c78a6e4041fa4d38b957be |     
   nios2     |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/89d4d216da4df9a88ff590aed727fcafb69ae388 |     
    or1k     |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/3deb575755848a1455377be86c96713ac743fe5e |     
    arc      |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/66429e5bb720253d573677c8a1af386450dd6449 |     
   arceb     |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/fc1c7d04e4e24b0e8883bd7dc84c1c21cd708261 |     
  sparc64    |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/7aef852f11d980c2336f4737ed89f29486d04363 |     
    arc      |      host-python3-3.11.0       | NOK | http://autobuild.buildroot.net/results/a3c84d40fb99380febc7e7e2461642cfe68991d9 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/82f1fe4ecfcbe461c2f5e8e58a5da82d81a76e72 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/86c622c88eca22f2a0141cbf73b2680b3a8499b3 |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6a50e773511f81126285c38de48afca4e18cba8d |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6a4cadb45f62b57b6de660a995185918b4b0e563 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ba1ea2f46d90893c80add64f943cf9fd7e46223b |     
    mips     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/1133dfe989ee7c9960f7c52e543ed5346c9e6b02 |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/398bf5de58c98f9a38ed515df8dfba3061cd1b59 | ORPH
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d2e198fe7f23d0094b962c8389b1da89bab7cf9d |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/bbe6e93afaf24ca9d41ddf71ec49bbca8d9c11f5 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/bf66c4c657098fd597048b2ba08a4d3bc569affa |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/87956deec744f5cdbcb072435f7a11a74991ec95 |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/79cda89e7f71b8c237263107dbac17b986e15e94 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/36809b74dbd0cf7b671bc0d46bfae6dbcff78a3f |     
   mips64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/5c33165a68fa0a02e4c4ea4e897156cb2887dbe7 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/bc1b6e13856560c63eaaaa53f7b1c614a2d4f53d |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/d395ea87e2457898510a54c0b857a97b14e0e227 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/0d5bc3ae4d8dd92393831cbc36789cc93639facb |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/558015a7539bc5d59aedc917c42fb279387db663 |     
   mips64    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/090089ec311795c82d2c2c012c72d9c1b91c2dbd |     
   sparc     |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/f2a99543ae0aec250d2b384a122c8cded67885f0 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/96222928b9930208c0a0d58b2ae36f803a83839e | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5341998efa18a663bd6f20dc2dd4b0595cf22e3b | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/314078c0ef362e940a69bf0ba767325409d2cd2f |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/87daa197c34eb49f035d15c690ffa7a72b83131a | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/800d03c194885bacffb214e6881e1c8f822d6c02 |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/090bff1d0162ba496b2e1f46483acf04e95685fe |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b33d3e9484d80b5c7cfef0b6a6c9873eb4aa89ea |     
  aarch64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/93de143d9978a5b2af5232a3e9bf534b8ce75f75 | ORPH
 powerpc64   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/cd73ae949e24a2819741623b83e35d35b7be89b8 | ORPH
   arceb     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/51f41e7ceb9ca5b40801b84b91d0386c5c01064f | ORPH
  mips64el   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/5a19e5292d461497ff16b7781723abb54b09e3bf | ORPH
    arc      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/94a5d4b7631eb6eb8a232dbe99b4e64e6a023788 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/574e1761b624371067f5a46f9c49581497dc3763 | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/4e0f57ea1e3d3f95a736362677ca342fb828d1e7 | ORPH
    arm      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/fe7e27a63672979a88b571ff2d668ba83cc50a42 | ORPH
  riscv64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/2e4874cdf7c26b89ab9a808267034e65b9e77515 | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/7b83ddd8dba0733f954b972e1ebe6768b087e142 | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/e92b190d5f9b9c7c717950255005f88ebd9fb4c5 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/13064b38dd10ad40a4b9933360c9d7b01a4f763c |     
   s390x     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/b62315694c3dac914cd4305431ebd5b8bf267460 | ORPH
  powerpc    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/e9ccfccbbc9c4b8a55facc833909e30e480edf05 | ORPH
    m68k     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/b017fb226a230a6344b79a4070255adb7cf75acb | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/ec117ff627f0c0a6e1e8f6d66109d46059c27d89 | ORPH
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/4b6e1f9b03dfab5897b329c982ea67c754bbcce6 |     
   sparc     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/a533b1e930599e9d37c20334d4a008904748612f |     
    or1k     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/357afae47cee9c4fa629737ef332054659975e4a |     
  mips64el   | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/bd03410c8f657df1bb501419e9e1fa5f9de7ca78 |     
   mipsel    |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/a55908240d6fb2ee38ec54149e3614097d057fed | ORPH
   mipsel    |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/866f51a3de52707d991c47ce2b0c000bf0a5a555 | ORPH
  aarch64    |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/111186ae9dab7980c98bd8e78b2da6bd039cafc7 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/eaefca331681bbef2a87632a28f70c92400399d3 |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/3162f28d45b70649820a81c438f86a6d47ca6598 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/ba84507df0bae3abfc93c32d6d991e554cb61a31 |     
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/8ec6dc1c260ad8c252e4a5035a31d67b61e3dbd5 |     
powerpc64le  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/77c097281cfca583bfafa854faece0b8d2350c04 |     
  riscv64    |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/af46100035b812196b82219192b6fd6043814a1e | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/381496a4c938c7aebfafd051abc6e1e71dc1769d | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b5fa28036fd299ce1a713f900bd4938be2f7fb2d | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/dad22ba7e2b40ce3583c23ab2467e0df1af78c06 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/539c5c17a2e764f633d7fb9eab25d74a52b87886 | ORPH
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8b1e70d04ff9ee94b08de101442873a89e3274ee | ORPH
powerpc64le  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/be6efc9564feaf4543b785fa92f8c5412a1633b3 | ORPH
    sh4a     |           ofono-1.34           | NOK | http://autobuild.buildroot.net/results/a2b5196d9e0936429d81ee4e8a23ec48a612eea2 |     
microblazeel |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/48e53518700bb0eea6f6784733db66d4a7a35eae | ORPH
    arm      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/b05df8d9c5da27ed47d1f2e25a16dad207297c44 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/4e07be0edc2c23af7d60d802d1f235558df6048e |     
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/146de07d128f177145ef49c002fbc398f406b74b |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/7d280bb59c0cf3ae33dc196891430da37793b3ec | ORPH
    arm      |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/e4ba5077985b9f7818586509eb14a8d0a38c8af5 | ORPH
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/b99f0072a8023cf0b216688a31ac7e4b9f63bcc8 | ORPH
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c6e879e20aa6c11d0a7529c7b334cc06ff67f2ef |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4c34f9a0fd7f378341d5ceac97ba63a08b1d8ec0 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e9a74ea701d795a02dca6f196c93d184a3c72d4e |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/217c02d31dd77eb0b713d2da337603157ac465d0 |     
 aarch64_be  |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/48b3e19ad32da61bdb532bedd3e70e5a141fb9dd |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/a27d0f2ee50b96b4262017a0e6d62976ca850198 | ORPH
 microblaze  |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/d22898d1ed1578a3ebb6daa109727e142b975720 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/8de71b72b954fdf8e9af5c5982a46e77debd574a | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/c99c6ceeb9771633247a9efa9d792378c5fa4f52 | ORPH
  sparc64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/a4de6297295a947bcbdf2c1bbecec0a4f16d85b3 |     
 aarch64_be  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/6d266149598ac5301950cb1bde17df079cabd528 |     
 powerpc64   |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/d3671c55cfcd9b91a25fc30485a1e3f24aac7510 |     
  sparc64    |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/8eb5f5cd81775b8c9fb1f33a9a246b91ec13e885 |     
   sh4aeb    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/71a79b7a8955be3eff33a6c9f16521a262bb5ae2 |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/2933143023d1c4e73896a74c4dc6cda99985fa42 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/7c7d46eed31d20a6774e2b671f00191cb87cea5d |     
  powerpc    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/a6cd5343dc9556e3d0509af1f3755d868608a092 |     
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/aa39519aea9f91ea3d44fa49b564eebeea994413 |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b8447211e00fdd551b3877b6313fca72a792d712 |     
    arm      |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/338c2b428125dd4b1e2da00cb7f78e23aadcd606 |     
powerpc64le  | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/07b8b72b58ef280e53db6c281122e1d771a84dd9 |     
microblazeel |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/9f5d0137bcbb121f6739684c94276eb95d4a8c87 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/7693648636d4e68c4ea91ff627d3e65a6eedd313 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2f156a243be13beb615892d56391deb53b0a34a8 | ORPH
   xtensa    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/06e6c24bfc2b329de959c8de602805d0acd84c27 | ORPH
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/ec8c67686d7aae6c8f8a55a99e0ae1700bb4751e |     
    m68k     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/69a6925280d50f15ec5d811ce66be42e7c51650c |     
    or1k     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/e388eaa203392f687bc42d338c2aa11cf4c6fe60 |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/d05c71beafa6fcb9847b240f7cc905e55d6eab3e |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/12773ec6ffc148f1d86f7a1727672ae8e7bfed06 |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/484f4f9403f68b751f761b57a5bbc386f519f612 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/72fb93ddb36b4e4547de0f03dcad3856549946aa |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/c5c72df1333c66ce9e908caddd0657734751277a |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/caab6a17775386da288c3573904d6490def96db8 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/03cbc202c194de1549c64ede6412b40fb8614706 | ORPH
   sparc     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/181592b411113bb986524bd54f509f5badf11508 |     
   sparc     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/fb876ea67d7c32bfa24ae4cd7a143df517f03723 | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/d779c08de7b4ef928dd93a366b961ab5d6ef3773 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/0b2aba2fa4e9cbc72c84ad47c3ad2d8dd4d661be |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7df1e984dd5d6733158b3502a1d7f57985c9937d |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/1d6857aa2f82b58ed90adcc752a886add4cadb76 |     
 aarch64_be  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/23b75f041a120382db5c02e0e7add5af562f4ae5 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/34b70de13f2033c2f5a1efd7443aab150ade0e7b | ORPH
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4f0e4b561d96fcdc907cf8ff0b73fb3bf815dbfa | ORPH
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/a158f2cfbac12a9437efee7e20bf164b090715fe | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/2011c722323950d081aaba421a08d4547a3046fc | ORPH
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/cda8d33ea0717e8a9329db2c89151beb6b5566d0 | ORPH
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d1920f5ac77778058478262c82fc60276b07ff53 | ORPH
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/1af65cf0a8e54a8d3ce40b4b4e07bffc7a673488 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/93b62d98a043dda9e79dc166681647330c4e9cd8 |     
  aarch64    |           xen-4.14.5           | NOK | http://autobuild.buildroot.net/results/d8d81d4d5a4eacb7fd10409efb694545fef85542 |     
    or1k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8c2e665e1533f0a25ea2df7655552985649324d9 |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/ab6a91ca901c0513145bd0898141a14e9994d6b2 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/001fda5e6c78a1b4b455c2852da19b011803006d | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a49898c010a7a3796edcd1712365a4b66484f0ef | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8b1d4fe7403bf4face8175737ec3adba6517e5f4 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/279c9594e2ab1eaed7f42c0688c25a2f78a3d561 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6874a11010cb37bb968c4045bbfd893571b5904a | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d0c9fe42e2fd7865fc3a520bbafe10400a7072f8 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9e0cc59905cc145707d92918b90180b1bee39d5d | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/cbc1ca2b6cda144e61617aa083d4a8ed3bb4a206 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fbf38f13d9f81be018c298219ef07f28e74e8009 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/59e9182e33c99cfc9250a7c8fc7ee8271d193567 | ORPH
    sh4      |           z3-4.11.2            | NOK | http://autobuild.buildroot.net/results/2809dd1ae2f3ada8ee7b3f3e388341c7cfb633fb |     
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/725336a54fa28761f1d133a8e368577bec0c0aa8 |     
 microblaze  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/9975b0e81f5628d63439f939b800e54c7c37d28c |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f2c664f890d913b79f0929c541dc4e1250c7f25e | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  cppcms-1.2.1 | 2 
            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          cppcms-1.2.1          | NOK | http://autobuild.buildroot.net/results/e28120dc1199b5562dc4c65bf14216185bea807b | ORPH
    arm      |          cppcms-1.2.1          | NOK | http://autobuild.buildroot.net/results/d8b821e3b1a40397fc7ab1cc6996832184ddac5b | ORPH
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9ed1526421c1dcac360f46a5772af2d30a2a871d |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                host-go-1.18.8 | 2 
                  cmocka-1.1.5 | 1 
                 dash-0.5.11.5 | 1 
                  ffmpeg-4.4.3 | 1 
                   flann-1.9.1 | 1 
                     frr-8.2.2 | 1 
                    gdal-3.5.1 | 1 
                gerbera-1.10.0 | 1 
          gitlab-runner-14.5.1 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
host-pahole-73383b3a39afe86... | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
                  netsurf-3.10 | 1 
                  ntpsec-1_2_1 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                tealdeer-1.5.0 | 1 
toolchain-external-codescap... | 1 
                       unknown | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/d90852fa1ce20c11473a818914ad8d4143adbfca |     
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c5dab08d4f88df203ab332c0f759c7513b405bb5 | ORPH
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/6d492a5a6d6c97b2cf7af59eb9db14677a6164c6 |     
   mipsel    |          flann-1.9.1           | NOK | http://autobuild.buildroot.net/results/94466749981108a27fe92503f01e038bcf1cd4d3 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/508c66977c1b5db4e64bfc5e2638590337ec3e38 |     
    sh4      |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/48422e9b73f7e99c4b54ce822fa4bf9b4e85c2db |     
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/66d5917c3fa8bb32cdefed967d850589604e9ea7 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/f411dc9796f1aeae616c3323539635e7643c39b5 |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/acc875931a35cf0b6b8fc873d645986ebeba62cc |     
powerpc64le  |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/f959c98cf0b900362dbb12b6dbae7facdd507b07 |     
   mips64    |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/f99aac9c59088ba7a48dec4ed070f33facc68a64 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/30d7444c9bbbf7a3f1d16c8dd3c3cc475428b3a2 |     
   mipsel    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/3cca454f9df9f81fe3621cb1c3d68e41a5e94a13 | ORPH
   mipsel    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/478b75ec2a6d525c73db8c0a9ae1aef7ebdedaaf | ORPH
    i486     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/1de176607fa34291b170b3380d755ee75638e014 |     
    m68k     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/1125493aa850b882e60cc1187e35ac13cf1215ec | ORPH
   x86_64    | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/bf28b5db3e3818010bc5f721d11ebc80fe846baf |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/b29c0c224bb0ec66548729bfed738c02f4f7b9f9 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/d5f3bfc94da04cff3b0d1605893ee7aced6178e1 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0f65e9ec435537fff22ec3c9d6cca48ee7d30b84 |     


Gitlab CI results for 2022-12-05
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3421466859  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3421466908  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

