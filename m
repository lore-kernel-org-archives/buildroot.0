Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434C9C4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 06:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E5D60BF7;
	Sat, 17 Dec 2022 06:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32E5D60BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uQOY4hCXm0n; Sat, 17 Dec 2022 06:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B6560C06;
	Sat, 17 Dec 2022 06:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B6560C06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFD321BF36F
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 06:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCC2440143
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 06:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCC2440143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w85QgtzT3JpJ for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 06:44:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6901340131
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6901340131
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 06:44:53 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6611E40008
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 06:44:50 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 06:44:50 -0000
Message-Id: <20221217064456.BCC2440143@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1671259490; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eH88DTMHpDDi3rn6JEFgRI0b55kTYxjejmkPzV0uMeo=;
 b=NUgCeX6Qb91TGPscpsMPbLIfPiPpMgt+/aCaXU8jve0yKZ+hAjQUByOJ9mIjxiKAA3q6L9
 5OkvikuXSpbrMAfJWKl85iPsiV8A+ZwmMSkDXZjNQleb932x43fbVhn/hJXAjaPCF97sZ1
 5EZS/qInrdBQOCvemxnOo0recpz/5XypNVTS3xA0aFA0VwObTxroilYvGDujNOTeeSi5Dy
 HO9oTKDDj+CGLFeVcmocZlx/s46rnzcR5xp/6YAuOkit2ruZ2Q4pESPbTlNfGJUbhpWqzU
 rRhz/c2wg2Vz/W2bzV9Hqtjly7mKYuHx39rD3SynGpLKdrMtWKPbyWeqkIZ6EQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NUgCeX6Q
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-16
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

Autobuild statistics for 2022-12-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  0  |  0  |  5  |
  2022.11.x  |  3  |  5  |  0  |  8  |
    master   | 171 | 331 |  1  | 503 |

Classification of failures by reason for master
-----------------------------------------------

host-go-bootstrap-1.4-boots... | 29
                   aubio-0.4.9 | 23
               host-fwup-1.9.1 | 20
                    fwup-1.9.1 | 14
host-gobject-introspection-... | 12
                  davfs2-1.7.0 | 9 
                     xz-5.2.10 | 9 
glibc-2.36-66-ga1dc0be03c9d... | 8 
            host-binutils-2.38 | 8 
           host-libzlib-1.2.13 | 8 
                  linux-6.0.12 | 7 
              host-rust-1.65.0 | 6 
                       unknown | 6 
                    crun-1.7.2 | 5 
                elfutils-0.186 | 5 
  gobject-introspection-1.72.0 | 5 
                host-m4-1.4.19 | 5 
              host-pahole-1.24 | 5 
    host-python-greenlet-2.0.1 | 5 
                   perl-5.34.1 | 5 
                    pixz-1.0.7 | 5 
    python-cryptography-38.0.4 | 5 
                  sscep-0.10.0 | 5 
                     frr-8.3.1 | 4 
                gerbera-1.10.0 | 4 
               libcap-ng-0.8.3 | 4 
                lmbench-3.0-a9 | 4 
                    norm-1.5.8 | 4 
                    opkg-0.4.5 | 4 
            python-bunch-1.0.1 | 4 
             fontconfig-2.13.1 | 3 
                host-go-1.19.4 | 3 
                  jack2-1.9.21 | 3 
               libdeflate-1.15 | 3 
                 nerdctl-1.0.0 | 3 
                  assimp-5.2.5 | 2 
             dahdi-linux-3.2.0 | 2 
        edk2-edk2-stable202208 | 2 
                  ffmpeg-4.4.3 | 2 
                libdnet-1.16.1 | 2 
              libgcrypt-1.10.1 | 2 
               libglib2-2.72.3 | 2 
             libgpg-error-1.45 | 2 
              libostree-2022.6 | 2 
             lirc-tools-0.10.2 | 2 
            ocf-linux-20171122 | 2 
              open62541-v1.3.3 | 2 
                 uclibc-1.0.42 | 2 
                  xerces-3.2.4 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
               apcupsd-3.14.14 | 1 
                    apg-2.3.0b | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                 coreutils-9.1 | 1 
           crucible-2022.05.25 | 1 
                    cups-2.4.2 | 1 
                 dhcp-4.4.3-P1 | 1 
                    dust-0.8.1 | 1 
                     efivar-38 | 1 
                  fbterm-1.7.0 | 1 
                    flac-1.4.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
              gr-osmosdr-0.2.3 | 1 
                    grub2-2.06 | 1 
                   gvfs-1.48.1 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-12.2.0 | 1 
host-spirv-llvm-translator-... | 1 
              hyperfine-1.14.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                libkcapi-1.4.0 | 1 
                    libndp-1.8 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
               lpc32xxcdl-2.11 | 1 
          lttng-modules-2.13.7 | 1 
                  matio-1.5.23 | 1 
                    mpir-3.0.0 | 1 
                  netsurf-3.10 | 1 
                   opensbi-0.9 | 1 
           optee-client-3.19.0 | 1 
                    proj-8.1.1 | 1 
           proxychains-ng-4.16 | 1 
           python-bcrypt-4.0.1 | 1 
                python3-3.11.1 | 1 
              sigrok-cli-0.7.2 | 1 
toolchain-external-codescap... | 1 
uclibc-ng-test-6790eafe897b... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wolfssl-5.5.3 | 1 
               xfsprogs-5.14.2 | 1 
                     z3-4.11.2 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/6728398259222c9a0666dc86aaa6c135d13a9b8a |     
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/52690d3d98c56a3a091a2c9cd8d06bf2ecb523e8 |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b61ab06987cc9343b78020d216463a9eafaa2690 |     
   mips64    |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/b34f95fe4b49db696c1946465300743e4eda2b09 |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/322249a063512c35d4f6f65784a7bf22ec08a322 | ORPH
   mipsel    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/2d8807be3096066c8429fc3762d64bc6fc87990f | ORPH
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/191c67d440433354d4ab8b62bf61453959680a2f |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5241a197b3bdc02a4bddcb61b889b043edcc9b2e |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2f645cae4a262019b166e3135b33f5e3b9d7b4eb |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c6153f7dede6bf8dad3ce391e073a274a43afb62 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/8c9f3d7c2a98d2d57dc025db8df563bd93bcde88 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e8e3c4f020582aaaed20ba7c3b4d60144e9640a5 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9bf73e91ee71cae1a533225e27942e227fed686a |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7cf4a81b47c112f6608167a877a0afce01884d6a |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/dfe4a0dea21949c3698ad918b607d984f47d8f9f |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c582f977cd19996adfb05a6a0eee0cf623048fa4 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7aa616e520400830269516f04eb7489ebeacb6e4 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/745653a01b051366f6da6f9c0d178bd2512f01b5 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ddcf10786f5b4080ee1b09d3dafbe6554f095044 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/79590866543d3111aa4bc66c378bb7ea5a6e9385 |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/287ede1efddaa0c28ea39fbfa07875ecb4762e61 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f6d7c68fbe737e6ee967e7ff598cca1693b90e95 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/55f3a55b6e4b696cb490acd5d125417fd48c6b0f |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/618e7ed9ac46e9ca5fe98860e6d1eeec983d0e5c |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fa255ce51f38d4906ec483f0a5904240cba02362 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4acd8bda98b78044df0b564bf8bdee29d3a5673c |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fd5ad1c1f45f071a31098812b4ebf4f0c6be2f2d |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/cf6e178f15d70b628f12294a5d81b1545a404d17 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ec222f2b6e9ba181179e94b42156c02c814f59d5 |     
  aarch64    |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/7a3509e2a315387db80573ac6b06e0d9eb6ca36e |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/89aca6397a7612242211ee52b111b57ca16b3ccc |     
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/e4b31d7724e1dc04af3cf0a2bfe77d8bde1ce9dd | ORPH
    arm      |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/35e05aaffcd49f88c0f8234a177e76b3b01227f6 |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/4140171644e3a7d02bd9c3d5b346c65d60eba4b2 |     
  powerpc    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/d1a52e6980d36bea56e94e2d90b993e726add017 |     
   sparc     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/92daf22f86ef94997522794353c1e30811e21f81 |     
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/9500a89cdda44cb7558ccaac664aee392c797e57 |     
   mips64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/f8ed471207c9813f81463bf6ee39719c5e272f2d |     
    or1k     |           cups-2.4.2           | NOK | http://autobuild.buildroot.net/results/bdb78208c41819fe4f922a520ecea92998891dbf |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/1c9f9268d29cf3bd28f4c757b226f135ae250970 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/3f9d957d77a15c00aeec662fee7d71cee32d100d |     
   arceb     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/9f22da80e281b8e613b40ec016105a6dcd709c2e | ORPH
   sparc     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/fc4cfa7b8d3ca45f56f8bd6d4421a0e51513eea2 | ORPH
   arceb     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/69e52546332bad40c02b59dc1ecee1be09220440 | ORPH
   mips64    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/33650158f730ef3e0f6387e3e61acf41db5dfe0b | ORPH
    sh4      |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/5cce96bd505fef2da1d9c8cfdd8a5f0fa6788792 | ORPH
   xtensa    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/a99ce28d0949f0e18776046b19d55f2e43a9a4e2 | ORPH
    or1k     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/63d3427e81549c55381a5b70a324efde0cff6be6 | ORPH
    arc      |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/23d02cdcf52485acd1faddb51f5c1bf155edddf3 | ORPH
   mips64    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/b5132277a0fc272c184bef633abe42772cc5cf54 | ORPH
    sh4a     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/d1e781346d56237c54884fad65f5e920e2b3a759 | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/8194701383142c5f621e7c691bb93ed2e1dae828 | ORPH
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/b768273b5deb6be3b9d15e39ca568f3ca0625490 |     
    i686     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/131a2a756f2b7b6c8611e624c5314a8c65aecbb4 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d5a21561f2d18b348e6b65f2ec99af83bfe1f816 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c9b45a55ec27ecdc001f5b0f0e24330b5cbcb5f8 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0238693f4747422f209e98771ca6af5ee1885664 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7f9e5b8b836ebc59f26f450e8591233844394473 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f420bf1cf78329ecfbcfc12255ea4b2e8406cae4 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/298460a6d1db58880ed4b9297353ddb730320c70 | ORPH
 aarch64_be  |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/eb8abd13eb4c239ef3873a46e4ce581ce59911f3 | ORPH
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/c0f60f1c05d4ae15d3598ff4c6d5fb0951f51cc0 |     
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/1298611eac2927904f3e58e96d3cca60a1e2fadc |     
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/648b663ec25ce9400b3ac85fa949cd1a05962a2a |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0131935f509c47ae4a3461492b21b2e2cc930587 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/09ef28645fb2bbb0fe953ffbf8f98e9d9d77dbb0 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/1fb51b74c584992b6de6dcdedbff40c3a6668b95 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/226b4bf9e27470929c40d8e51017824dbdb0f88b |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/438eed1fee521a8dcad63f045b83b85cd0717ec2 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/21de51b1de8fb6c05e05c86acd75ea6249f7ab54 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/67b4e9db3534c8b7807dc34253382e5dc174b3a4 |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/f15fdb883e807e5068aa7087036b5fc9f57d7d53 |     
 powerpc64   | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/1a556838273a643d779fb19a058fd7e4c2f641ba |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e2ecc2eca1a401fb955e4cb0b8d54f284adafafd |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/05c14c739ce645cf0eda07a6ace1194d3070bf0e |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/292af83ac0c66bc668e6b383dcc6fbcdc37b2864 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/46539cb18486c0df2a204d59d2f56d9deea6c7f3 |     
    sh4      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3dfa95a6103bd57c2fc2b7e45be1032d80f4f779 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/876647676c8bdde170e5c0da0917e889e94c2a4f |     
   sh4aeb    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3b30e4c147bba8fa8bb8c48560ea755bafb433e0 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d70b32c7f52fdf59ac1dcebac161e96085434d3e |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/af596c6186904d302fb7ce0f60b1004031977dc0 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9424f287f40d92d4a6b07a04e30cd4efd92aac4c |     
  riscv64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/62b0fa34e79713c703da8adf5ba195f003f038c7 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ce4f71aa9dc9454d8f77ac5f231fadb8c161b5ea |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f03def77c6f8f6568f1a3cc3d758282a9f615bb7 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b41b0027514d333002501e02f5e4a864c1a4a650 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/281309126048dd068346c05660c6299aae2d6d90 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/794f09fff252a1cd1a354a9c7ea78a2545bde5ff |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7f0627d4933ef240fb35478eab18d183bafeb851 |     
   mips64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f98004d6defad7fdf5275207f7fda4c4a5003201 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/27772e3339d18e79958952311d146d5371332d8f |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cafa99ef46a39cd81565104f6db2cdc9954e0af2 |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9e2c3c247579bf9d11bde316a7a0fd90ded7f80e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b65c2f0d952ae5c8dc3d78e2f6437d65e109793f |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8b56b8ba9bc22b5fbb1f6652585d2e1d6995e922 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3125617f3a67add2af2af06f8e3dae1aeed247c5 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5dcd1602a5c6ae20f148952b39e7a3457a2669b1 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b4280e542f29a9db0e4efcb4206d2e72f4bdc247 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/000933a6fd326ef6935beb64d2d953b3bdb5cf0e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3e4af3b5752b78c464087bb45bc949dc5e05dca6 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/176021597064b51f7f73f02ef60a2b81b3193682 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a875d193420aa9481da2ff849c6803c11bac35b9 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/32cd5fc30f98775f8610e42f06da67a8d35b6763 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/eb7256cef7f7e502dd9ba3ccce0c88d7bf022394 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/673ffe23cbfb4954bd18132547c964d6c2c8d3f1 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/05d8f69b48c93e18619f1483fafce999f3360553 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/41142f12a40dfa246ff224ff05e4aa9d8ee3a8f8 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/fcd8650ec6941b671d8d2cfc73b84e9c30e6991d |     
    or1k     |        gr-osmosdr-0.2.3        | NOK | http://autobuild.buildroot.net/results/ab82e73b630ed07c8238f3d125ce12425df99959 |     
    arm      |           grub2-2.06           | NOK | http://autobuild.buildroot.net/results/45028400ff4aa922099e8ad75d84d1894507c0dc |     
 aarch64_be  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/2ba9f59d587620a8e2b086fb92748af677f5005f | ORPH
   sh4eb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/2cf821f4267d7269bc043fa7121cc5f46192c90b |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2c05a1c898ac9daa803fb16d91828c86fe9d2b2e |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9f4381a4a74cb6fba30866435b71907d2d74d147 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b6145c0e60d95238735e178aa1da860f66672582 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ea9421ccda97bc42e2185efcadd9373b42a21bda |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/53e4c626c56bad178b67d8a4c40e296c527f98ac |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c98e6d8810d95288ac62fbbb6c3d110bf3a94465 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/75482ef28b40b21e952f8c4f4549808c1ddc2fd3 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5e9f68f6d0367f353de527e0aa54289690341f7a |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f4bdf4a41cca8cc3d887571f23b7b26927ab6d90 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/988584e2c15629e0eb357ac7d0d9bda08bb64513 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9194a6b02b7cc2a48def31d4bbe57a1c5e35034a |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4d11cb59d12bb2b00137a19f51275fee789e3ee8 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8c67983f7e95b475196f06ef0a169e24a515bcde |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a89365ff65ff915da1c1a9db27a7d9a9d98a0df4 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5c15f3afa3200a83ae21036272b828859f7dd3d8 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e58d25cf276425322402e8b1c9c5c8c18f6fa689 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/99c67fdffaba8579ffc85e1b8ebfd8ec57784ea7 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6ef7ed697e8b35458e63a91d219b42fbc7cf76c4 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6be373bd93d7388a45449603bcfb36802ac1d25f |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9c4fb791fae0f89d024c119894437fa51587a647 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/15f267ff293c0504b4754bbf32fa999dddf8ff79 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/af08242af7fe599e03a6e23b0a7a8c551e5cf548 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/01df02ff9bed1458fa5a791aecb9db8ad7e3b125 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5ce0423ff0aa030b001fc4782d4825f96a164a9c |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/91775c55a5907e4b530609fda62d694d73e35144 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ff5e789cabeb09aa7b2bbb0c7acd78a253cc142c |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/909d17c8033bebdb1f515709e8f88252dcf49c80 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bf10a95d1de1353fbfe8879e1fdddb865cbf52a3 |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/3762ebc7b2116c0d6300af77bc6c18353fd698d4 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/57c5236ed26ddb48b4ac1d85605ac050a684dec1 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/bdc6c44747a10064b653901232f56071c5821efd |     
  aarch64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/34f32cb4f3758b333c9a42943878021f2c24467c |     
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7ea1eb701e353ccbf06cce26b19d0eca64d640b8 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e65ad3c4c9fc6ae9cd6e97e82330d058a0b924a1 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/35f5cf627cf3e85b5c43f11cf0c8a6ffa046846e | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/35a06896cfc4604ec37cb62fcc40d2e562698d55 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e9ca314cde1148d24e18599986b73b338224385f | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/796b7afbb9154dbff07695325118731cb522e031 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/748f6a19230cfcc5c494d2bc5350c5702a7a4087 | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/25856bbd959ea123b25497a1f4eccdd938b4e7bf | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d2a0e997156854d4db0ecc949492dcf4bace638b | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b73f40634347ee438bd49148bcc63774696026cb | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/022c43224ee077542f54450a26db88aa8157c4a0 | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1612347b3054c216d167b6b9a99cca2d017620e0 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9991bf4d5b8904cefeee81c3a405456b1a2acbb4 | ORPH
  riscv64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/58f15eb9b59abf3b5fd312a81a5e53cce99060d0 | ORPH
   armeb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1bf505d7b8ecafd5605cbae41c55127daea4912c | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/04b492dba708529ad9b74438079ef43fe237b929 | ORPH
    m68k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/af580f49a169e769561105ebea87e925c9926a18 | ORPH
   arceb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2b5d290fe45d197fb6efe121f690b0c3f73f111a | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e72875088c8aac7d860731d0da3d230356731dfd | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c97809c7aead74cb63ac53fdde13a47d4f25231f | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0b84243c1fc9163cb854e40a738d4e19ef5f8551 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a832fc971d1322f27c0128e0ada9b5d69afdf375 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f6a5bf3b27c0e0eb91448d6c8b87c1c208ae6ab9 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3bb524a2ca8fe2936cefb80b4f34d8ab8cd6ad67 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/040f750d4a372fe4e244444c8391c48ae050a002 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/da66cbe800c03a83ba1bc3227622dd6fc4f95c25 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d80a6b577ddfff591a789417c4ba867b2ea11f41 | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c3740028232be4a840df88ee3a049f920b64f2fb | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/78ed20184c0b384c5d6172018b51b338071c70cb | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/9294ad6b0e14101924d41f681790122999965a9f | ORPH
   s390x     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/1197b690d1ebc408496795332784865dbf608120 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/8c6a1c226ca0520c4be39502b7663e747ee5c2fa | ORPH
   s390x     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/c1d74461b3c8e9eb554bfea283fd3bb34214894c | ORPH
    i686     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/a499a7ffa1b3d2351a44ad956b8940ccbfca36e5 | ORPH
   nios2     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/b173c4ab41501324f76babad7fddbbfe861eb2d3 | ORPH
   nios2     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/288820573996096fea325e8a400f6408c2a7fed0 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/4381204d13f17fd4bfb6a4eb2e6b36aae526b443 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/1c2ec402d9ab7cae4d897034a53d0e99a2411758 | ORPH
   nios2     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/f5cee557080832514432ba3c6cddbb2d02d94975 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/ee1da651336eaac4ca1f53515f4b987b9d346074 | ORPH
    mips     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/ef0a58a77f0b0b776a7970ebd27e8a81fa142ce5 | ORPH
  aarch64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/986a8365509d866bf90f6e6012785abec3fc2db4 | ORPH
   xtensa    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/70dc2f1671263c0b5a885af9acd8e0703c2888fe | ORPH
   mips64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/774a679659a3d9c76709a7a15ebe07482a407d15 | ORPH
   mips64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/9117e60db90cc23b83770fc3b863601ba8784534 | ORPH
microblazeel |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/2092134ea01ae5826af3eea6f86918b4c40fd31a | ORPH
   s390x     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/58c80d5f5e2dd785adae64333e83d29ff3c04867 | ORPH
   sparc     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/d6dd579caf134bdfaafefeef0a18b3c34fe6d577 | ORPH
    arc      |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/5f2f03a5003b084adf0c9de66af45a0a4081e51a | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/3861db3e45d511f0ea0403ccc6caa68e8405a47f | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/22ff85281b608b1d5ec0c832aeda21b08c2dad96 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/f4d75dc3957b6c03a35b853fe8b3d3a0b2540452 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/9bf580a7f608cc9fc10fd36a6a421d4206f3f33a | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/aba3410e9827676fdbbb261dd06a42d6efb0be67 | ORPH
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/970b071e5beb5d110fce421efb04bc2c0370cd22 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/409b0cb0da74facdc73878af28a61d24c68b8018 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b6e0e6f85a8ef5f35c49b8a6f3eeee303bacefb0 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/afa5de4c2f0b26c788ea66a0a74cf56d201ceb70 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3a549a0149945acfd71e0f38a499b12817e0a6ce |     
    arc      |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/bad7d113d7b0e832f44d2b6516281e04b534b76b |     
    or1k     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/c695986fdab660b30aa80d4a554f5489bbbcb314 |     
  riscv32    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/798febfa683ee047a24423ec80237abb21713533 |     
   mipsel    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/2b7410500d56eeaf4aef726522341c5f4358fb7b |     
   sparc     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/82d5077148ef0f640f17b542b06a32a1ffedb627 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/eeb6283fa8c2ef2937f7eafe606210a8a75a2798 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/ad930f4e04f8f18d3c735e069fa8896cff756006 |     
   mipsel    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/6ab9528c090e9fc2acbe019b3bfef3a10492fac0 |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/9ecf2c92e8fd1f1020dce2d19ce46809a4d766d9 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/6f49edc277568ec0a5092c95ac31a416beada835 |     
   mipsel    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/f5979ee97106dc5b864bd97e925a73225eb5b783 |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/d3577b344678bf779893c22a6bb0a39c9cd08fb8 | ORPH
powerpc64le  |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/408622ad7b3456b69dcae9ba9fd167efd34f43ee | ORPH
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/695696a7b56d0cb4993b07258e67b1503d70f2b3 |     
    sh4      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a0c51f55341df1ad3cfda624ea68408d72f17a94 |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/842f4e564e86e07db2a5f12e1db9b116f04a48a2 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/70531e23bbdc62ac0be3cc19ab452a98d6875d5e |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/87b6df4ac49fe653aa55604356fdd8a6e2981a2f |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/58573eb8a631baaa486ce0dc006d051bc72374c3 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/2caaa67c770036ae42dcac396f7c0ebc39f0fec4 |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/2fb41a0b8e04d7fcf769eaae0b9f822bd3525994 |     
    arc      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/2e1153220ef0fe6805eb42a6244bd2874b308486 |     
    arc      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/889f604c5a9b90da02b130f832ac0d1afa450876 |     
    m68k     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/6c4863a0ee639937fc79b886ef303d7878ae7ab9 |     
  sparc64    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/e94738a742aa99650ac56683ca19b03ce8b9be65 | ORPH
   s390x     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/d8ca913673849b655dd107a62371cb921505890f | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/06d82461c058b83b03352d755b17b7495df86198 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/37c164117fc6a0b93e38ebe2ac4f0643d867afef | ORPH
    i686     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/98cd3ffd2e79a5cb0a68d1d0f0dc249ffafe5e27 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cd6e7e995223c15e006acebe80bf620aa7c5e4e9 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/42f59e5d093ef801e31413815f52698bb6c4aca4 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/f903133d0ee7f8e20c5b02826aab84f1f5efc418 | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/391ab39c6ab6b6c7f0ed049e942d68f834fb4b88 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/5a66be0747fc9cd20e7ee2467bc32e8d000dd755 |     
  sparc64    |        libostree-2022.6        | NOK | http://autobuild.buildroot.net/results/9cd31c95f4751b9816f623c762a08bea79c1ecc5 |     
   nios2     |        libostree-2022.6        | NOK | http://autobuild.buildroot.net/results/e241b92c35763c5b0b128d36062685f811523a8a |     
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/2f50408e069b94151355173ef35031b885b0c011 | ORPH
   mips64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/54e6f66fc633f1d508f0b33748dba7029fcc66ec | ORPH
   nios2     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/9d95065f0fe5f3aed741b61d025019ba1a3cd46e | ORPH
 aarch64_be  |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/646edbaa15eb3f28a8b60f6556f6db00470ae5a7 | ORPH
    or1k     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/8e4b70884e1fd8c69410d39abf5101f9c0511318 | ORPH
   x86_64    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/37358764342bcb8d6bd30fb7b56114841392d2ba | ORPH
   mips64    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/13c8b075f9368dc128d1eee91f233f6e619dc7b1 | ORPH
   x86_64    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/ea5370b7fccec03d4e652424c09b6a54273fa3a2 | ORPH
    i686     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/cbd8fd1d85c38ef7caa8716b6dbe8d772e090051 | ORPH
    sh4      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/5b339d30cb02403d5edf4967842675dbf991f7e7 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/27e969fb5c7dd1117439fb05503b45b432d7b28a | ORPH
   arceb     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/358a9fec783996a35bbff35786179a23a40931a7 | ORPH
 microblaze  |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/b0e29a366c9d45e3ec558d32e54bf0954f79f19d | ORPH
  aarch64    |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/74857a77279730475a18ce61741085d907b81ae3 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/349c106929ab1113c4164d42dde5ee9e5a0124a0 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/eb15b09adc970c08efafcc175b914aaa9be46dad | ORPH
   xtensa    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/e2425918bbd3717600125cfe9ad43310d626d95d |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/a51430ca2a64ff49d3c80d9f69031e8511e0177d |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f4d6d3877ffc3c615932a432d63e0fba1a948459 |     
   s390x     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/9e31b2db3502bd82d02632d29cf2f6ea0c654b50 |     
   s390x     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/cc9dd069bcd16d08fb751d79b608a4aae81bc602 |     
    arm      |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/b82e44e42d4a10596f318f8353486032ca852392 |     
microblazeel |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/997e2a1a2bdef867254ca1e61680ea2f100a0f4e |     
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/25e5b145c3311445a6ee01983c03c13e833dd974 | ORPH
   arceb     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8dca2582b6ff655044ce9ee5dc18b2116fa15c11 | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1d716896799c64a6747bf88022546be5faf7e4e3 | ORPH
    i586     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2dcffcda2e20dc362de9f47cf2626be82db49996 | ORPH
    mips     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/01aab15e778bbc654e955430922ec51da5f00483 | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f7348e81799dce5883630083ec8481e50180e141 | ORPH
   s390x     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/b7d2c42f6aa651e20641ee8660eb606a20afde1c | ORPH
 microblaze  |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/6b144963ed0e9322fc453ba2d89fe9ffb29bee26 | ORPH
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/f44eab3fee09b00b9263ec487932adf53c484713 |     
    sh4      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/f313db37c5be43b066b89d1a313172f038098ec5 | ORPH
   sparc     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/22c67f9d07c7cf4398c4deaa7f37a2fb3c18f56c | ORPH
   mips64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e47a61890e4df8cad625d4a18ac7993fd5b7c4bb | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/ea74b869ea457507d9a1844fcb0f53347b384772 | ORPH
   arceb     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/4d4d51509bd8f83b3207167590498daf79a6f044 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/bd7e48da1b93bced26dd4593234d4d877b6e1655 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/27ddada4eb19568599804243806a103d0a63851a |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/edf22a6740f76de2d43d348cb0a2354c0319ab0d |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b43a1a282b739969cffed4b96c38d9f803a714a8 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c64d84faa02a84870333bae0e963fa902c555bfb |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/3f9b2dc49830cebc8927ed28bcbf8d205054cdbb |     
   mipsel    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/53f53765bde29e6574da139f2bef48733a6ff4c2 |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/812887a29c8951314432517bde9081ca9af885a3 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/7f7fcb9367c76bcd0e6dc800d66bf58fa907c485 |     
   mipsel    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/2a36a3f3c499a05a5eb10f6bc7f24baa62fef43f |     
    i686     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/0669b9d3121a68d943558de74f9d2343a24e1078 |     
   mips64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/7d865c1d293f28d3e942f23b02dc39da2f9cfaba | ORPH
   s390x     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/0159326bb533d454585afd9687a6b597cde4b03e |     
 powerpc64   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/0325a87d7eb66ec1f00cfd577a6e80cf48f5c03d |     
    or1k     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/1bcc19acbbf3247c9941b20a11541f05c680a20c |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/fd5f63d7e8c4ea0fcc2faa8fdc0150bf91516152 |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/a88aa5bd2375211e514181bd434e0e76fdf87b54 |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/92a63d5f5fee864bd6e1b9057a6537b02ff0eb96 |     
    mips     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/48ece52a2c93f317ba88788ba60eabe971338b03 |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/5be3f5a898e7e72e6ab987e195b8fcce8c1c6ded |     
   s390x     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/16b4d1aa2fd283c5dd7f11afee8dd06dcf8ec3d5 |     
    arm      |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/eeccef90babba4347b74cbf727c1450a348d8602 |     
   arceb     |         python3-3.11.1         | NOK | http://autobuild.buildroot.net/results/43b0f4fd79935a5fdd7c68590505cc9c34ed7251 |     
 aarch64_be  |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/7d7691d4b63189e9622fdf923409d76e896e6b37 |     
microblazeel |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/04a7ee23e7c8eeb5e44bcaa301cf837389974320 |     
    i686     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/981c31b8e4c31304c695ca94a7252f328902a6ad |     
   mipsel    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/c286bce56a1df52580374e6fd050fb03ef778c23 |     
   xtensa    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/0232807a1ea0ca9452e9ec834bd295ec66c0635a |     
   arceb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/efbb83f89e7a63ebb10a5f01119615cd0b942810 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/f2a079fcbf921ec0356d7fa7c833afca61752e81 | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/c30a6049200bd4b0056f94d8d3914e9006b19a5d |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/9e4bcde83c89bb6b285d58c0248e012a8b81756c |     
   mipsel    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/45ed50c9b070538d304e7403bbd77127e885821f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/1abd962882efd9b5913f2d980a31742c0d015b17 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/01f9c9fb730f0fea40b40a6897ea1b894ab3218b |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/bfc6cbf72892b88763a439605472c4bea099205d |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/58e31e8c5bc7abfd6ddf9d437da31d3f8cea0e4b |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/218fa64d968339ad269e25d72f807123648ffa1f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/f778ebee76f7a63166c96f68b241ac417d56c784 |     
   sh4eb     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/a10a33bd2bd1bc8a0829347e1fc1ba853e89952f | ORPH
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ef99911abf5e82ffbf45225bdc990dad9b6173a8 |     
    arm      |          xerces-3.2.4          | NOK | http://autobuild.buildroot.net/results/6a1a20c9946521a2c6935f5a11a8badd1fa7c5cf | ORPH
  riscv32    |          xerces-3.2.4          | NOK | http://autobuild.buildroot.net/results/d08dbb629e7ab9ec0f871d1c996a0a1b8133c27e | ORPH
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/c3b8abec164828b5e4696406907d4dfc132b0817 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0b374aa8bc618a36b2c0dc5ce38ab78fbd9b1d3f | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d590471c750e0d2545f37a58474c280eab70c12d | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/efcc23b6d28af8799c4617343c864f0c195eeb2f | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/bf07ac8bd9adb7948bf59cfa3b7db82e832d4d4a | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a4da3cf36a73bd12f556da7f7d538303f695077b | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e9181ff34d59a8458b1db08dc1032a5bdb0ff651 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3782f6f5c1f6840a2b8ea363e97c8c097e7b1c6c | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/62bd6f177e69fdd4c4197c062aeb89105baeaa3c | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ef138205502a4891c4f030a638e85117a33ba966 | ORPH
  aarch64    |           z3-4.11.2            | NOK | http://autobuild.buildroot.net/results/73f19f406f937434332694f00e3206b1b8f0217d |     
  mips64el   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/b5a7ffbd42d84386d4bcda59debfabb0ab47ea44 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                 augeas-1.12.0 | 1 
            ghostscript-9.56.1 | 1 
              host-rust-1.64.0 | 1 
                   linux-6.0.9 | 1 
              open62541-v1.3.3 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/ed7e56281683baf4b79c17f050c6a5d5b09252fd | ORPH
   armeb     |       ghostscript-9.56.1       | NOK | http://autobuild.buildroot.net/results/071a3298d32615a77e5b883628ab90e22ed8b524 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/49f2db7ae0fcc75a01a7286d74fbb11f5dde561f |     
powerpc64le  |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/39914fafa79ff36ea2d1956f2bf13c748dad6237 | ORPH
  sparc64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/c25c7ce5170fe65b15da0039a0be9e572bd44c2b | ORPH


Gitlab CI results for 2022-12-16
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506281  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506284  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506291  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506311  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506357  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506358  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506359  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506360  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506361  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506362  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506363  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506391  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506480  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506476  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506505  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506541  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
