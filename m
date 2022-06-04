Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EDFC43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 04:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F3E740BCB;
	Sat,  4 Jun 2022 04:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sk7sWiqw5G6l; Sat,  4 Jun 2022 04:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F99040558;
	Sat,  4 Jun 2022 04:40:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9DD51BF2A1
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 04:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC8B060E2C
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 04:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56R3BRfsQSnR for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 04:40:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0D3560B54
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 04:40:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19AECFF802
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 04:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654317633; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M3/7YUZHI+NXYs+FivlsZnFVAsS46ofVAm1EZ9sI6tw=;
 b=EX5QKGKbfrdfgysFocB5fxSlMABuPzXanDw4j2NeDDTkOeEXLfiQtt3qXOU4X1tHdjzPGV
 MbtshwSksW3dyCKfZmKO3gkx+sXpHWOGr9vpVJnOF5ZnXdB74+5u2qedsT/F+2c3o+uGHA
 nugLGlqSusSH79Q8qGEt1e+6A3iu5k+r/o9C/5emxO60V8wHgnakRMMn8cBbVRDfTttvEJ
 oT1K/Wi9gL0eZjWCruc5fkc5rQQ0ClzwkLJHz20tBPovAM4Me7Q5jYH4R4Rdtxy3xMub+n
 67ijf+UkhwEXuIzv5u49TG4AJSJWlG/HJr+IM5CUA8f7kQVX90/VzdrZDlj+JA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 04 Jun 2022 04:40:32 -0000
Message-Id: <20220604044038.BC8B060E2C@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-03
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

Autobuild statistics for 2022-06-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 18  |  3  |  0  | 21  |
    master   | 170 | 220 |  2  | 392 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 29
               protobuf-3.20.1 | 10
           libfreeimage-3.18.0 | 9 
                  linux-5.17.7 | 8 
         host-gcc-final-11.3.0 | 7 
             libopenssl-1.1.1o | 7 
            qpid-proton-0.35.0 | 7 
                libressl-3.5.2 | 6 
                 uclibc-1.0.41 | 6 
                 zlib-ng-2.0.6 | 6 
                busybox-1.35.0 | 5 
toolchain-external-bootlin-... | 5 
                     frr-8.2.2 | 4 
          host-gcc-final-9.4.0 | 4 
                     refpolicy | 4 
glibc-2.35-96-g2c4fc8e5ca74... | 3 
                host-go-1.18.2 | 3 
                nodejs-16.15.0 | 3 
            quickjs-2021-03-27 | 3 
              swupdate-2022.05 | 3 
                    4th-3.64.0 | 2 
                    bat-0.19.0 | 2 
              containerd-1.6.2 | 2 
                   eigen-3.4.0 | 2 
  gobject-introspection-1.70.0 | 2 
               gocryptfs-2.2.1 | 2 
host-pahole-73383b3a39afe86... | 2 
               libglib2-2.70.4 | 2 
             libgpg-error-1.42 | 2 
                   libnss-3.78 | 2 
       linux-5.10.104-cip3-rt3 | 2 
            ocf-linux-20120127 | 2 
                tinifier-3.4.0 | 2 
    toolchain-external-bootlin | 2 
                       unknown | 2 
                  vlc-3.0.17.4 | 2 
                       xenomai | 2 
                    zstd-1.5.2 | 2 
               zziplib-0.13.72 | 2 
                  acpid-2.0.33 | 1 
              alsa-lib-1.2.6.1 | 1 
            altera-stapl-0.3.3 | 1 
                 apache-2.4.53 | 1 
              asterisk-16.25.2 | 1 
                  cairo-1.16.0 | 1 
           docker-cli-20.10.14 | 1 
                elfutils-0.186 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
              fstrcmp-0.7.D001 | 1 
                gnu-efi-3.0.10 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-10.3.0 | 1 
         host-protobuf-c-1.4.0 | 1 
               host-qemu-7.0.0 | 1 
              host-rust-1.60.0 | 1 
                   i2pd-2.40.0 | 1 
              jpeg-turbo-2.1.3 | 1 
                   json-c-0.15 | 1 
                     libgcrypt | 1 
                libpcap-1.10.1 | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
           libwebsockets-4.3.1 | 1 
                libzlib-1.2.12 | 1 
         linux-headers-5.4.193 | 1 
                      lzo-2.10 | 1 
make: *** wait: No child pr... | 1 
              memcached-1.6.12 | 1 
                  nginx-1.20.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                   perl-5.34.1 | 1 
                    pppd-2.4.9 | 1 
            python-ujson-5.2.0 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
rtl8189fs-94a61cbf46ce87b7c... | 1 
                    ruby-3.1.2 | 1 
                    runc-1.1.2 | 1 
     s6-portable-utils-2.2.3.2 | 1 
       shadowsocks-libev-3.3.5 | 1 
                 socat-1.7.4.3 | 1 
                  sudo-1.9.8p2 | 1 
              syslog-ng-3.35.1 | 1 
toolchain-external-codescap... | 1 
uclibc-ng-test-0844445e7358... | 1 
                 wavemon-0.9.4 | 1 
                xenomai-custom | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/f14961bda816fa0c80db48c076b69dbd54c2fd47 |     
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/9a096324305cbca91c491f8f7a617b1f778890b4 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/c3c4945d01e02f81b45a13c2b0353a4920a90685 | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/a4efd657cc7b327155a5eb85fef3bf42aef2a315 |     
    m68k     |       altera-stapl-0.3.3       | NOK | http://autobuild.buildroot.net/results/e9bab0c517e271d2721a600f5f55f700c683e463 |     
    arc      |         apache-2.4.53          | NOK | http://autobuild.buildroot.net/results/006f94bb216a77f073a5670fa2f393c43f15a977 |     
   mips64    |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/446bdb319d1f9184a640a25fbc0e24c9bc9bb601 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ddfc6930b3bd6dfdac8ced0128d0a3702f6f373d |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8aca60da1db981ab0153ae16b525b0c308658b34 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/04910e25568b7ff77afcbfb0a0f5dd17e9d7e0be | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/e1f92c9ca7c936d17a5d007faf5619d453723af4 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f50f72c9035f58ab36c1ba607bfd806e0387a5fc | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/25afcf2fef16f58b0962af22364d3ab16fdeaa83 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/2f91aa28b8a4dbfb1afec9488e9078ad0c8b0a4e | ORPH
    mips     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/f3fb7de65e02a07429255d719b34b620e70109fa |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/b15a178154f78564502c2b200bae279e4b1585ec |     
    i686     |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/5d4f42eb5309eed31416e8f221e81a9e21fed936 |     
  aarch64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/9ac7e68f73919f210f6cf96092cd1556969f2fa0 |     
    arm      |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/057e99283705b311d7b9e4cd9a2b1ea7e020e77d |     
microblazeel |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/6b9749fd8402bb5a4919dc03a44216302070e0bd |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4452f26e2099f0226ac3f9aa98387c9090b95db6 | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/fe4f9c5ad32c7d21672a8cf1f19731fed9895e13 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f45f42ca32317851a36793f67b879859e4a81877 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a6f8d25cdb7ef77170b985912aabdc3eea0d40fd |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ea70c10ddf345e3e1642a08c6fa8fa758da15b9b |     
    or1k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c7a9b1e59e46fe75c26128b8c09b5d3aa25d1663 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/04a35382d6643d9cb828ce14eb337c4d60808453 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/c3551192097761097de011241f17897a23e89284 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/9f861074317d255c48d13f40be6c1af33719cd83 |     
 microblaze  |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/9ada1c444b6d06c76d135215c27a275308c3ec82 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/dc800b717e170e22558560c92a56d4670856eaf3 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/213365c14bf5398e80af998b0803e5d2668d8e94 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/936217438602f4dacc1791e1bca17693fca48f97 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/1253e420f2965d76927c7f987ca96fa6a076be35 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f6a9f15bda75f17803b4f2e63be68727ffe233f0 |     
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/04199e4854de3fff29438362659aebcccae255cb | ORPH
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/d944a864a56f5fb4f62fbe29b5e465f4038f1051 | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/5363313684f02360d5ca2f9e330ed1fe34278527 |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/d56a9420c767db6839ebb1c415dad2940deefbfc |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/56a495bf48f2908ef387e2ae38464d40b406a494 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/a254e0bb4246fd6ade79e0664504d267a879d010 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e072f22821401f16b4c73d5eb8ff4eddd24cb37c |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3e96a7f332a2c41c431a43276f2b32c97bdd9099 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3e3e9c7d8e16119a0b8ce6e707b4a4a635f3ecba |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/45373544ef9e150e192d3ff01facb82ea0cfd18f |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2073bb88cbdff82ef5b44014b8e02866dbd9657f |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e6602c90d574a82c6c34951b8fdb2495c6dce6d3 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cbd631ce91de44fb422168dd8ca22ab9c00a3a7e |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e076ebb74f283632079baec67c9a3562ded54017 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b65a46feaf5761d7b2c8d4b6cae7b660e2821a22 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5819b61ad21da04c15af95d0c4b180133d3a678e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/effbefc073bff8b62d0abf90ca2ad5b3603a3de6 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ba7f51cf15278c9d9a75f9793031c6315bf9bd67 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d03ba224f937f815ad8ef57cfd62d622206347e3 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/64af08c183cc9c80f3aba2408e2bcd11b9076cd6 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c712d30e4d6bf496b24a841db84a562e1d8fc265 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/07aa18161aa1057da720df7c46b219fde70587dc |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/846767fa23cf1c17c3d66ecbfaf1c941bbe6403d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ef4bfa90934e3a107d5eaed05748fe4471a906f5 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d7be0c69c9b0817b6f92ee18347cb72ee1b63306 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1c5f847a9512c918130a9d5b941e2bf441a27f77 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/657a67f686fde0f533c537d4121d08f38831d971 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/46b07885849d246338a3ad73ea0f0a1f7c6aed09 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e9dd634f0e11b00778240464dea9c5765e8a2f23 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7eec2668fdfb0a5fbf6c717933dc82864837a5c4 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9a7911047f4126347ec1d4bf570b291cf75d0891 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6659e450bad5f982da825051c9b7cb9c176b6fbc |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/439164900d246d42a9f10997ef4c1522bfa0d468 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a717f438ad501c44a354a35434171bcaca2a819d |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7ae47033f495e3770725603d43b10f158ea4207e |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b62278e7171ae8c8d52d42ec49095d54493b00bf |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4f7eebd537e2fd5d99dab14d810131b7c91429a7 |     
 powerpc64   |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6ac2e3a67f65a30860325661fdf967c8eaf0eee0 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/10efddb98720b27f64062ea5a7811801e5a8cffb |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d2f35fc6d397213c3a5e1827a9a72594ae099e0d |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1178fe54ae11ba8de2cb26de3d36779b7ff55a3f |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/018e68526f04de06579efb5cd72fd8e16f6de311 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/bc677619ad990b832e79ae5a171e4610e92af32f |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/bb2f3a388b6cf5bd7ce6bdfa184e1223f2ce498c |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/c1a515b7580a18984e1af4fe25a1937132c03d23 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f77ff29e4d519653ec64c2ff16ada160ef7bf058 |     
   armeb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/9ba5d94dc0ea399f1fad0f217193a29d9c8177b7 |     
   mips64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/a89637807e5da14c3a5f5d53e60e31fd20c3a605 |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/375eb9ec3c179abb374b68d71bbd8443def6d374 |     
   mips64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/f5287a8ab74245b6c053760964f0edd36c86b0e3 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cf41546dec578243b24619e8de76f1ab46b1360f |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c65792d9eedfd4f8ab92b70c5989a36f056430ec |     
 powerpc64   |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/36ffac6e3f7ab4fa9635b6fc4409c3809fcb7719 |     
   armeb     |        host-qemu-7.0.0         | NOK | http://autobuild.buildroot.net/results/3f84fa3fbdf677115c563913b1f62c473e61e100 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/1c41d9fbd2cbd21f29aa05df2c91dc939073a5d4 |     
    or1k     |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/2222a9c5e007fbb9a04bb83d6488e379ba8eccfd |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/c78615c5f11214c25cece5d7008a06635ec97006 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/6a2e32cc011fc674fe3ee40cfbe7ea7c320e6f76 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/f33b7a52dbc9d3c7334c544227e2ee1b2529240c |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d77e6448ea8ebf712c6d5d18d706f22c8c6ce548 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3454e70739218b7df1afa8796441cf59beaa60ff |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/54efaf67d8cdeb7155ab9494588f56ae4f2f431a |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5994a514cd8519c56e483b6b65596e056b968d60 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/29f051c0003ac5c4bae201e59f3d3f2fbf1177f3 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6e934a4037a3c840988c5f628f9eb61d7d711461 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1d7b400d1467eec64ab08bb98b17e8b761453e76 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e66ad762c4ec569e01e15ab0d533c4a52b9c83f7 |     
    arm      |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/8ee619b113f92627bb32c72cc6da83edb4ea1c0a |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/d3789a57b2ed0e3ee4361b10a8e92d5634e04ff2 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/d4af9588eb5d4906017fc5a61b9d027f41f78d18 |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/cffe4e79f1108c73969b18d0f9ef27bbaeba9ebb | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/8ad33b562c49eb565903fa6475327f78b0302376 | ORPH
   sh4eb     |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/4fd1a5eb03cb0869efcdfc82d5cf0bf2f49f12d1 |     
    or1k     |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/366d628318baf9508c7ae99eae533eae87ccf59f |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/a0b73815e58e9c90818ac25fbb98e0e9dce03d79 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/225f9f672f5ca19d3a8223406526cb36fa4c41a2 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4eac6f44e1005bc05ecafbff783cc00cac35c916 |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/725a282356a2cfb30ebf2aa56eafaf718d890fda |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/78a23fc75c9856f2b65532498ca1a09eb9f025c0 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0458a2c6b47274d8611561ebf09673999ff2afe6 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/410fc3607635bdaf9188c649b9bfb29ebe4a7a20 |     
    m68k     |         libpcap-1.10.1         | NOK | http://autobuild.buildroot.net/results/63eeb727e68e61a2648e0013915129097672048c |     
   x86_64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/512d4780665927df121fa0aa1acc6ebfbcc122a5 | ORPH
    arm      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/9f102049aaa6e96230bb1bca67daae5347c7cb72 | ORPH
    mips     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/9357af24f4d2d562f492deee0e094570d8a20efb | ORPH
  powerpc    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/5d0f024662a3b381a792297c2f405e366141ee5a | ORPH
 microblaze  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/445a7b385972d8f2a287952d9ed6549ad1480e84 | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/c4c4e87b9a54451b2131a70e240fb617e8449009 | ORPH
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/5afb905dfe3c6ab063737d06680a3b8f472c312e |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/e31e85e54998403bf9cea4d349e7cca0fa1d50ea |     
   armeb     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/31888d9c4fabd47cc334bf59ebc48711fd77c1a9 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/4704117ac33aa7fcf76aadc4e022bb1ae6e784b6 | ORPH
   mips64    |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/7aa7e9b6a6659b01ce9366e9e5ebcb917b1943e7 | ORPH
    mips     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/c9caad57cfeb740f382ad26fa2250c11b4935489 | ORPH
  mips64el   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/72592a146abd7160092bc7c710c431cc739c81f4 | ORPH
    mips     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/a2356da2b41ea42635c7ac669b2105772b5662b0 | ORPH
 powerpc64   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/10cdd3605a0a2b09b582654c383464cfaf3aa964 | ORPH
   mipsel    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/015ccadf257b0fd0580f206a1a628016fd7b07b8 | ORPH
 powerpc64   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/2e988e3af20e82f2b120febb412cd1012ca8feef | ORPH
    mips     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/e4e36cfd5c353dd5e849aa8f1ab87095d8a62c4a | ORPH
   xtensa    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/8e9d46628bfed0c7188c62841feaa30879ab6a27 | ORPH
   mips64    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/25def045aed499c1c55ac1c8daf5520d224c921b | ORPH
   mips64    |     linux-headers-5.4.193      | NOK | http://autobuild.buildroot.net/results/843f26ba0698819089986801b5dc8f6bcabf550e | ORPH
    m68k     |            lzo-2.10            | NOK | http://autobuild.buildroot.net/results/d57e60f2ff021e73425e48c8b183f2414fbe3a6a | ORPH
  powerpc    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/1232a7ab7cf212a8eaed6a023c3baa831421f6ae |     
 aarch64_be  |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/08591fbf9677ff126492c50c15170c641bcab56a | ORPH
    arc      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/08d8bd9c407e4d1ec8652e94d1c08205e9f1d076 |     
   mipsel    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/38fe92875f72215e33796953cd9c4a6103cc9821 |     
    i586     |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/f722d9ba54ad30aeb02cc998123a4278ec2552f3 |     
    arm      |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/8f60365371db6476b51e68bcee986dda1f55baa8 |     
  aarch64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/ea105e210bfbf509e087eb708b7bcc9e66f93ed6 | ORPH
   arceb     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/91ad285f07c5a9492ae98fe38abd438b6ab198c2 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f7414e2796dbb1acf9a198235d93851cd33f2c56 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c066911563b893f1e593222c5d8fa7d286361054 |     
microblazeel |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/3272ed67c0f48f0bf50a2a5a3264d19d28f8c528 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9a32932cfa868f1ec7ac3a8e4a7ab88613160444 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ed768b27f44b246dff04785bd322e85f6e9b958f |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bf01b6f78d341b7003f147a8c047be96673b9d73 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1b7852d40b219e8e0374d822e3453e3053710875 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/50fc16126086d78132dd7ac90473931ea6dd53ff |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6fcfd2cc11d86cebf902c9cfb9d6a56c4afbbcc1 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bbb922df54ea6ad433fe51ef79a78e1f8d804d58 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bf7b7a72515ae329c94ac015e8be22c86ce3d196 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0ff325553e65a1adc6cf88ebe5c71ad69ffd788a |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/418ce1e8ba79720378890724e607059e64a914e8 |     
   xtensa    |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/0275ffd5a3cea9780de19d52f87d7ab9877da913 |     
    arc      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/bb22b86f8ce6059164414dacb29501886ee9cd98 |     
   arceb     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/361e44ebd5335a75ab17c277f6eb4f1fcaa24e84 |     
    or1k     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/d8dc7230012edd8d60762bb5c78a4001f8011fab |     
   sparc     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/14f41b0a6c50e422f8ff3c6fde462eef9931de2f |     
 microblaze  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/ed0f921d131e15a095dc25dee4924385cfe83bfd |     
   xtensa    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/6821056b3e58256f68d9c9591b2531203a4cd753 |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/a53991310a1c22b2606946de9a4c1e1114ea46ea |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/a0f55192361ad10914f59acf779ccdfab8da967c |     
    mips     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/63d9d97064d9fccff674a6e0b7d72e686811db2b |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/ce7bfa97341ac66631b8a428ce6ff0468964ca83 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/83ed9f218064486970792ccdda1f8244ee0d8e59 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/6fa16964d638aa7193d415b3d37dcd407dd71833 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/7cdbb274f3648333774ee78d43175a115c4beb84 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/57e5568f10cf2ca80b30495b991cd3d407b502b3 |     
   mipsel    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/e4022874bb1312542b4521693411ec31e8661888 |     
   s390x     | rtl8189fs-94a61cbf46ce87b7c... | NOK | http://autobuild.buildroot.net/results/f6a3b2cd0dad470f115969399528e994c4ce04bc |     
   xtensa    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/70c1052603a0dc922cbfb2b0322b57aa09be568a |     
   x86_64    |           runc-1.1.2           | NOK | http://autobuild.buildroot.net/results/9b8853a49349e53399f5b6503d910a4f53b09f7e |     
microblazeel |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/799f6b649911e642494d0d1fbb93bbb5ea6d4232 |     
   nios2     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/cf1c9fe592e48f967f4f91a039424daf2f91af4a |     
   xtensa    |         socat-1.7.4.3          | NOK | http://autobuild.buildroot.net/results/4399fb63147d6c7ae1250d9f56ae6b44ec5fb77c |     
   mips64    |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/913d2bb6ba428f66c842e50794c6153518415ac2 | ORPH
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/0db45abb03c0e6fd978b332520d3a3a2b9953dd9 |     
  mips64el   |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/b372334bca50fd796fbc6c5273b51c59ffe4b65d |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/af017a8ab39936706bb38e9685864539cdc58079 |     
 microblaze  |        syslog-ng-3.35.1        | NOK | http://autobuild.buildroot.net/results/e70a59198c52b0c083b6c10f490cb543a4c762c3 |     
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/9fd5333fa23b6ffc8289daf8776cfc7bc4fd0a58 |     
    i686     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/34d8dec2650623fc1894a14b16ffc9fd36f0ed61 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/880a68a1b74832e6f4679834e86161f492a9c999 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/1135015854430431e7c1bfb910197d872d31eb38 |     
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/dc94e183205a3e6127c6ab8b94b3b29056a62231 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/11d6133b1d103e15194a1a2a289d29974f9e4280 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7195dd1f95f8f07c0187f7cf73a89dbf7d6a6e68 | ORPH
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9b0e612e305607f32bb389507027d24ae30ba4b2 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4e98711a561c66789f6d8ab305dc797dfd74373f | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/2764780df480b8ae4ba3444de752625f4737bc39 | ORPH
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8b6b042ff52108c2365666c46d3b44fee4fc0e53 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3450be4172c4520d294fb196b53003ac1955cfa3 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/63f4c2d1850da4c1375e6e165550747b836a637c |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a953b163a0eac273729d8fa0a78cf5d24f808e7d |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/562a4e1b4d675cddfeb45c1d24a02d0e5bb15d62 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/34eede4432098053ebdca1076d886645c0a662e6 |     
   mips64    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/f5a424b75e0ae0a76ff8c5036ff6f4590f132e66 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/241e72b84488c9d5f23f3fc1e4a8089d9e1a6038 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e2d96157d3ed5dfced80a6bec2e366f6fcaec15 |     
  sparc64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/c492454aa16e2d7eaa0718564005482dc93d78ae |     
  mips64el   |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/cdf6fecf896a898126adbbc4a1b92e1f04a4e8ee |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0daf8ddc8adf277660b54db729cd8cb614cdbe22 |     
    i686     |            xenomai             | NOK | http://autobuild.buildroot.net/results/9ee777f866df550ede95ed1fb70ebe3e970a5190 |     
    i686     |            xenomai             | NOK | http://autobuild.buildroot.net/results/787cbfd6db8d39312914964c001358b3d49e3b05 |     
 powerpc64   |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/4c0850f86a32207a4d6a0e17fe6f8d6b2d5683e3 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ad2c2f8563a3eca0b4ec1c1575ea7e865c71155f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/93b5388d66cb6832294255082761fabb7423782a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a54533027d6ffff14cf5908952dfea024bff6d8c | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ab306d2419f167f7f96772bfebccba1d2e08a230 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/29d2cbb68c4cd0a16a52ae5166f0b74a17dc447e | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5ead6363fee009770da2c9887df602f1526d5971 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/f1e611d50b6b8b0656b9a52b5c44276fb818be75 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/58345861e51d289c4f6c471149db51f66a2770f7 |     
  powerpc    |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/47a3d9087beaf74ce2ff8b02fe4e5a245930cf1a |     
    sh4      |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/d2e802954300d4249b49e51e32f2317fbd104f14 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 
                nodejs-14.18.3 | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/f97b93599a6f97b071ad8a4f5c855a912b3616a1 |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/6d7084cab08cc797d3561a0c07cb5990e8511767 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/902da62efd7cd5961b3802f9e7a2ba82a98622ee |     


Gitlab CI results for 2022-06-03
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754383  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754413  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754433  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754434  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754435  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754439  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754451  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754468  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754475  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754493  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754496  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754504  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754507  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754509  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754511  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754537  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754539  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754543  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754548  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754565  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754616  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754621  | ORPH 
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754633  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754646  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754655  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754663  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754752  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754765  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

