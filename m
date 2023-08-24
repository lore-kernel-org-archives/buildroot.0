Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7B3C71145
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 05:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA0BB6130C;
	Thu, 24 Aug 2023 05:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA0BB6130C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ce_8MC_uz1c7; Thu, 24 Aug 2023 05:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 857DD61316;
	Thu, 24 Aug 2023 05:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 857DD61316
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3DAA1BF4D8
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 05:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A23F82174
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 05:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A23F82174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7Jg3_K8Z8dC for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 05:37:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 243A382163
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 05:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 243A382163
Received: by mail.gandi.net (Postfix) with ESMTPSA id 382371BF205
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 05:37:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 05:37:35 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230824053740.9A23F82174@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1692855455; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nglloxo0R4Rwh6skqwZql8VREj1xlZmhHEM7XVDeWO8=;
 b=cLnhuh1MMqGrpr5Vz8eWLsVYZ/4SBt/6a4t5gYcS3IFItQCgYWo7K3jpYa1++Pi9TgXTJK
 o32bqhwtAMvxSFY6HDS6c60EZKFluE5b5NqbO0tv3SYdHzRVz8tC8KxJvNyFuO9FmJ4J9X
 h0qTImDdIuNWnGjJtPUKCPGunc6k3TBN5Rvlb59fbn6w2JkAEBvBnIVCFYp16imSD1MEcK
 rM5umcasT7k6mRjmzA1w6vwOhRJBR4gqwKStw3TGlOccudmSBEDoW76mJzWD/7sx+0wH9I
 NhW9S/cqOeTl76CPRnmn9OD10sN0xhyyTuDAN2U35gymFCm3q2ic/lzR/9QPiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cLnhuh1M
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-23
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

Autobuild statistics for 2023-08-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  3  |  0  |  6  |
  2023.05.x  |  6  |  2  |  0  |  8  |
    master   | 87  | 101 |  3  | 191 |

Classification of failures by reason for master
-----------------------------------------------

              libxcrypt-4.4.33 | 9 
                elfutils-0.189 | 6 
  gobject-introspection-1.76.1 | 5 
                host-go-1.20.7 | 5 
              host-rust-1.71.0 | 5 
                  linux-6.4.11 | 5 
              open62541-v1.3.6 | 5 
         gobject-introspection | 3 
             util-linux-2.39.1 | 3 
azure-iot-sdk-c-LTS_01_2023... | 2 
                  cairo-1.16.0 | 2 
           dmraid-1.0.0.rc16-3 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
               linux-pam-1.5.3 | 2 
                     lxc-5.0.2 | 2 
                     pv-1.6.20 | 2 
                xenomai-3.0.10 | 2 
  binutils-arc-2020.09-release | 1 
                bpftool-v7.1.0 | 1 
                  check-0.15.2 | 1 
               dbus-glib-0.112 | 1 
                 dc3dd-7.2.641 | 1 
                 ddrescue-1.27 | 1 
        edk2-edk2-stable202305 | 1 
             f2fs-tools-1.16.0 | 1 
                     file-5.43 | 1 
                    gdal-3.6.2 | 1 
             host-delve-1.20.2 | 1 
host-go-bootstrap-stage2-1.... | 1 
              host-guile-3.0.9 | 1 
         host-sentry-cli-2.8.0 | 1 
                   hwloc-2.9.2 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                 libcurl-8.2.1 | 1 
            libfastjson-0.99.9 | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.76.1 | 1 
                   libnss-3.92 | 1 
                 libqmi-1.32.2 | 1 
                  libsepol-3.5 | 1 
          linux-5.10.162-cip24 | 1 
        lttng-babeltrace-1.5.7 | 1 
                mongodb-4.2.18 | 1 
                    musl-1.2.4 | 1 
                   perl-5.36.1 | 1 
               pipewire-0.3.74 | 1 
                python3-3.11.4 | 1 
            qpid-proton-0.35.0 | 1 
rtl8189fs-75a566a830037c7d1... | 1 
              shellinabox-2.20 | 1 
             stress-ng-0.15.07 | 1 
               trace-cmd-2.9.7 | 1 
              traceroute-2.1.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
        util-linux-libs-2.39.1 | 1 
               valgrind-3.21.0 | 1 
               xwayland-23.1.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | azure-iot-sdk-c-LTS_01_2023... | NOK | http://autobuild.buildroot.net/results/8b853cc871da24cc852fd793b0a52b35e1590f6d |     
   x86_64    | azure-iot-sdk-c-LTS_01_2023... | NOK | http://autobuild.buildroot.net/results/dbd9bbb77403d419e025531a20032382350c4dae |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/0c38193ee97f3b4bb75c08499dabd01834a01d7c |     
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/1f1dad491cccece8edc68e89d46c86b7f63469ee |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/048f0f1778a6c7b9f2b2d452cd632353d2032acc |     
  powerpc    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/2d39b32a2ba238ede477ec6a8beeac022d9d0aaa |     
    m68k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/f9c9718a86a7b9925f969d1e8e63bf23eef1ab5e | ORPH
   sparc     |        dbus-glib-0.112         | NOK | http://autobuild.buildroot.net/results/8a418903f4ab237d972beee51271326a287cb5e2 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1c8d942434fd22bb7d8d849743a1bd17c5aa3a95 | ORPH
  riscv64    |         ddrescue-1.27          | NOK | http://autobuild.buildroot.net/results/f50daa16601de4fb6da3d3b4c5ab8bd8e3a2a10c | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/43fb01baffcf35f0325f96dd05845b75ba39bbab | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/71a34bd95e13b1abdfcf896229e768ff1d1952f8 | ORPH
   x86_64    |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/dfa967343fb3dcb7442f687ac9633d4b52e2b6c2 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f477b63d3af2c8f8d2d4ad8840c91fdd423f3c9b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0d61365e42db5c7b952a2c3271e91fc9e10869df | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7210bd2569d79be3b228bea709c05193485e1589 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/81fdfe8be1bfb1be0e1fe24a3ce1cba4c643e0d6 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f4002383f3c64b2df67209560803d0adfe4e3db9 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b8c8887be8fafefbc6823f590c9b183423cb1943 | ORPH
  aarch64    |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/cc87e3b13f464c9f5f9198ef732c6efbbe1c6a4d |     
   armeb     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/47bf8db1b2192262de04d9cb526810412ad73956 | ORPH
    sh4      |           gdal-3.6.2           | NOK | http://autobuild.buildroot.net/results/dfc7269ba059f659fcc8d350718aa9c70a1db64c |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/b65a4cc9c7c325aa37693fa9ea8b427f7f0c48e4 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/82809c8f67c3a76bd208803ba7786cf766ba4be1 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9b0c9a75fa2e1b3d65b5d39424a412b77c0db463 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c2fd079a17ed82bedeb4f17084a13500ea276ee9 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a0a7d9206fab92e3db5a6032ca04710b7290fa5b |     
    arm      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8bbbb84180544d7cd1a0aee84fd827bcd4c89b89 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6f10ed7d89afe450560804e3df4bc84e966858ab | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6c6bd8e763ce609d9277e1b567ab4a29eb48ad73 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6cdc222f8191c387dec28bbecf216ca14c9ff226 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a04d8592d3fe8c320d69047411ade595e754fd25 | ORPH
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/afd331729571a29a67a46cda834d24e0a1c23564 |     
  riscv64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/61bfebe8d48dde7a536bf92f30028dcf0c909d93 |     
  mips64el   |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/45ed4cb75c9e806e4ec1146501718f51f2351c83 |     
  riscv64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/d64afb5688e2f6af2cddf3889072d0c7953521e9 |     
  mips64el   |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/ec2657e722c5aa206aaead4e148afb6e049b5ab6 |     
    i586     |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/de04ddb27d9d12bbf52903de35e44c7015468160 |     
    arm      | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/1d9ce02427034583f8c73fdff3740aba79544ab6 |     
   x86_64    |        host-guile-3.0.9        | NOK | http://autobuild.buildroot.net/results/f37c3ee7e52562cb4a9a2ded2efbc8d0a1e6bea7 |     
powerpc64le  |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/4ca644689e415a7383a2b57e274b4d0f3e7b244a |     
  aarch64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/ea22ede892c927b856f013233bcaa6a31aa8b9ed |     
  powerpc    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/7efc4c99d784c233bba597cc54f8f08eb5382abe |     
   armeb     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/b8c4425d82e5d72ff763ff18b2d419961fe4100e |     
   mipsel    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/21e58f7a7f81f50304d939e043afb9e7f596d7aa |     
   armeb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/73104851f55b647b49eddb38c419fc572faee384 |     
   x86_64    |          hwloc-2.9.2           | NOK | http://autobuild.buildroot.net/results/ddf8fc3529a86931ca3a42020f9308d5e091026a |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/85fe75d01f947d6d0ff1a724a44c11771917906c |     
  riscv64    |         libcurl-8.2.1          | NOK | http://autobuild.buildroot.net/results/2be9f87cfc9578f90cd17f556cfef87bf8b50bdc |     
  riscv64    |       libfastjson-0.99.9       | NOK | http://autobuild.buildroot.net/results/bdfcdee4472cca03e7b9fd1e75fcdf647cd48656 |     
   sparc     |         libgee-0.20.6          | NOK | http://autobuild.buildroot.net/results/53a608f7884e790cc4e206676a3b1dd8400009f7 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5675aef818afefe650564c75972f7a86cc158b13 |     
  mips64el   |          libnss-3.92           | NOK | http://autobuild.buildroot.net/results/2020aa4548e9db7bec513e36f954be886a56c482 |     
   sparc     |         libqmi-1.32.2          | NOK | http://autobuild.buildroot.net/results/287e648181a2acc629d0e4e779be3d498b06c614 |     
  mips64el   |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/6c1d4b1b631bcb6828fe138728f06ef697f2e354 |     
   armeb     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/d398c80c298c024567c476e6ca822079add8241d |     
   x86_64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/6921f66265c7168540eaba0404d809ac9c3fb53e |     
    arm      |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/1102cce636a321d8f390335712c4b5cf455ee2eb |     
   mips64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/458ebd2eaf2b5f5b382690f173dcd71f87798468 |     
   mipsel    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/5497ad78c170a93a6cc3109cbaaadd4c28aa4044 |     
  sparc64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/c5fe7a626318072215d852cea7baeac9525b82f9 |     
  powerpc    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/3bb962cd3e47dc6ccdb93e6e8e81949bb67fe7da |     
 aarch64_be  |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/d8966ae3dbf008ce4bafea77eaca18e7f40a2e4b |     
   sh4aeb    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/255f3669ee084eb97292faf780b3f2c90f482ee1 |     
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/5ab20698c975e468f1cfaa44b1fb90285c12222b | ORPH
   mips64    |          linux-6.4.11          | NOK | http://autobuild.buildroot.net/results/d548910dd9cf8d62ca213c88f147d2faa9236867 | ORPH
   x86_64    |          linux-6.4.11          | NOK | http://autobuild.buildroot.net/results/1157379a09bd5cbaa998667d33bec769cd1fb183 | ORPH
   nios2     |          linux-6.4.11          | NOK | http://autobuild.buildroot.net/results/cd7280553799589acb1d1e7418e9d00d3d757865 | ORPH
   mips64    |          linux-6.4.11          | NOK | http://autobuild.buildroot.net/results/a024a63053c8aa3a1daa695353c24b38c5c84690 | ORPH
  mips64el   |          linux-6.4.11          | NOK | http://autobuild.buildroot.net/results/354fa6397db7d1cc3e6d04928db97801ee5c49af | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/3866632bcf5aa54e66f4089787c5dad578d09d0d | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/118c805d55774ba1dae124ed04ad37c4419f50a2 | ORPH
   sparc     |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/21c6b7557c8cd6ef64389772d8c777695882445c |     
   s390x     |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/71984b355c483eaec577a1d0cb7beda2a778ebcf |     
 powerpc64   |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/7b5d1979d3d351a36593bca24ebbd0195b3fd45f |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/1f1e13af2a42c8ea3b67c1d91cd9d90f5b1537ca |     
  powerpc    |           musl-1.2.4           | NOK | http://autobuild.buildroot.net/results/fd2d4284bd3694ff217ae564e0a13249f1305226 |     
   armeb     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/90a496fde35d9242ce139e060ff48ad403c5d48e | ORPH
 microblaze  |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/b3e81c43765c573b87f400694377e21359f7cce5 | ORPH
 powerpc64   |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/7a9c59d61e8572cee510656ccb2fa5ef073c0f74 | ORPH
   s390x     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/a52cf9b09451b7d0ab3de9fb51de3f1708142a06 | ORPH
   armeb     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/dd9394706fc742617bbe10783714f42a9caf782c | ORPH
    or1k     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/c8c66ac4b19d151fb3c8cee1a5472858744f4d6d |     
  powerpc    |        pipewire-0.3.74         | NOK | http://autobuild.buildroot.net/results/8847177a02fc37d3c98a9f8d58c373dae92e0752 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/348c835024173942ffd96007c1116aa08123c9d3 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/acee29a0b08d98b7a695caeb7d1fd24546f36bfa | ORPH
    sh4      |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/c6f133465283efce078aa18e29d6f77f7fc2eacb |     
   arceb     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/146ed448109228702d65594d660faa1322f11b31 |     
   xtensa    | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/a844ec54c17ce73f82f7039ba7e64c25a6c0b988 |     
   xtensa    |        shellinabox-2.20        | NOK | http://autobuild.buildroot.net/results/3e478d22e820703ddfd11d1491e631ef8ed6b29b |     
microblazeel |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/a6061294b7c5b8c2fe31c661ed78f8008f55e80b |     
   x86_64    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/04b7d1a7b5ca76540fc10d5d052f10bed8762bf8 |     
   mips64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/51a00aa47b5ce71cd563e37cb3f4493ede79b75b |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/44e232060dfb9b55450b341a15d0971cfeaf0bb4 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/75a51f7312be8b738242d5ddf71104151aed00e9 |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/3029b88afd8ae2c4e751758b4fcda094a95c65d8 | ORPH
   armeb     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/5a59b10527bb5718f3168a7add9fe8d90d24ce62 | ORPH
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/de8626dce8ee159f61b9188e19cb2e45ddaa095d | ORPH
    arm      |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/a8b86832acafb1e38aa118c1f288e541531edc4e | ORPH
  powerpc    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/d754d4e767c3f61b86a20e2689d4a0b4423def6e | ORPH
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/47d405e160e40ec20cf74c1fc2827963c70c454a |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/516a7d52dcb15e49f3f2e5d9e51a313440ee2370 |     
  sparc64    |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/30ca233bd651930f99ecdea13092f0b9ddc26a7a |     
   nios2     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3a44cd559d18d7a18ece9548328620d495a831e7 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 1 
              host-rust-1.67.1 | 1 
                  linux-6.1.38 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2132bae9c2ab5d3d33b255f4faa8eb797d8802bc |     
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/8e1bed53009a1b25e2c715b3d74f00aeff3455b9 |     
  aarch64    |          linux-6.1.38          | NOK | http://autobuild.buildroot.net/results/8e0e5b4c2a6d42e70ec16b17c531af39392228c4 | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                elfutils-0.186 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1a7f360e90c97055323b738e4fefa45dc7d9b1ae | ORPH
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/2e5ba20344d7a02ca78c81b4e5577ec7e8859298 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
