Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FA4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 05:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A340781D9F;
	Tue,  5 Jul 2022 05:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A340781D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqlKJAqYtzX9; Tue,  5 Jul 2022 05:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3036F81D35;
	Tue,  5 Jul 2022 05:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3036F81D35
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6858D1BF312
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 05:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E391160DC6
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 05:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E391160DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pv1nMSbKDXtd for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 05:43:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B8D560B43
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B8D560B43
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 05:43:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8C61360002
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 05:43:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 05 Jul 2022 05:43:15 -0000
Message-Id: <20220705054321.E391160DC6@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1656999795; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SzgPIqAvy0N/IEAOyw3lMdc48GVOS0y1Utrd59KzVk0=;
 b=ZDj+lAtlpaXY6pbYj5o6Gg0no6TUf19XvGuE0pMJiBRf8pt0TvK9JVfAX1Yz7hinGWCcSo
 oI2ewOtCb4duFVPugyxbF+yobDN0VaYlQs88yhFtZo55P5RMgI6eV2F7KPmZFTIMAh3oXP
 PyN9JGeWJVpcSXDFWeui8NmW6Kopb78TPZGbJhfVMV3Kr9i7HpjFkzNUt7IjbIpYowae9z
 HRlacX9voBUCVftV0NbvA04eX1WEYodyPjXN0E3wofkFOjz63oQcMkvsDZD3FnF2mXZR6+
 lzGseYM39B8qcu2nIOmTkGoz71eL4VQZntSc1l/saoHdg6TqM4+AcAJTIkWa4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZDj+lAtl
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-04
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

Autobuild statistics for 2022-07-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 22  |  6  |  0  | 28  |
  2022.05.x  | 31  | 30  |  0  | 61  |
    master   | 108 | 419 |  1  | 528 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-7.84.0 | 153
              alsa-utils-1.2.7 | 42
                 uclibc-1.0.41 | 19
                iptables-1.8.8 | 14
                       unknown | 12
                host-go-1.18.3 | 9 
                busybox-1.35.0 | 7 
             libopenssl-1.1.1o | 7 
                 linux-5.17.13 | 7 
                 zlib-ng-2.0.6 | 7 
                libressl-3.5.3 | 6 
                speexdsp-1.2.1 | 5 
         host-gcc-final-11.3.0 | 4 
              jpeg-turbo-2.1.3 | 4 
       linux-5.10.109-cip5-rt4 | 4 
                   speex-1.2.1 | 4 
dahdi-linux-5c840cf43838e06... | 3 
glibc-2.35-96-g2c4fc8e5ca74... | 3 
host-pahole-73383b3a39afe86... | 3 
                 pixman-0.40.0 | 3 
         python-automat-20.2.0 | 3 
         python-dateutil-2.8.2 | 3 
                     refpolicy | 3 
                       cfm-0.3 | 2 
                 dash-0.5.11.5 | 2 
                  ffmpeg-4.4.2 | 2 
  gobject-introspection-1.70.0 | 2 
         host-gcc-final-10.3.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
              host-rust-1.60.0 | 2 
host-spirv-llvm-translator-... | 2 
              host-uuu-1.4.193 | 2 
                    lame-3.100 | 2 
           libfreeimage-3.18.0 | 2 
           libsamplerate-0.1.9 | 2 
               libvorbis-1.3.7 | 2 
           libwebsockets-4.3.1 | 2 
                libzlib-1.2.12 | 2 
                mongodb-4.2.18 | 2 
            ocf-linux-20120127 | 2 
                   perl-5.34.1 | 2 
               protobuf-3.20.1 | 2 
               tcpreplay-4.4.1 | 2 
                   tor-0.4.7.8 | 2 
                 wavemon-0.9.4 | 2 
                 a10disp-0.6.1 | 1 
                     ace-7.0.6 | 1 
                  acpid-2.0.33 | 1 
                alsa-lib-1.2.7 | 1 
                  assimp-5.2.1 | 1 
                     aufs-util | 1 
                 batctl-2021.0 | 1 
             berkeleydb-5.3.28 | 1 
                    bird-2.0.8 | 1 
                bitcoin-0.21.2 | 1 
                  bitwise-0.43 | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
        edk2-edk2-stable202102 | 1 
               erofs-utils-1.4 | 1 
                     file-5.41 | 1 
       freeradius-client-1.1.7 | 1 
                     frr-8.2.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gmp-6.2.1 | 1 
               gocryptfs-2.2.1 | 1 
                       gsl-2.6 | 1 
          host-gcc-final-9.4.0 | 1 
       host-gcc-initial-10.3.0 | 1 
                     host-mono | 1 
host-python-setuptools-scm-... | 1 
                  hostapd-2.10 | 1 
                   httping-2.5 | 1 
            igh-ethercat-1.5.2 | 1 
                  kexec-2.0.24 | 1 
                 libbsd-0.11.3 | 1 
              libgcrypt-1.10.1 | 1 
             libopenssl-1.1.1p | 1 
                 libpng-1.6.37 | 1 
               libsigsegv-2.14 | 1 
           linux-5.10.115-cip7 | 1 
                   linux-tools | 1 
            lttng-tools-2.13.2 | 1 
make: *** Waiting for unfin... | 1 
                  ntp-4.2.8p15 | 1 
   perl-crypt-openssl-rsa-0.31 | 1 
                      poke-2.1 | 1 
   python-jaraco-functools-2.0 | 1 
rpi-userland-14b90ff9d9f031... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                       sbc-1.5 | 1 
       shadowsocks-libev-3.3.5 | 1 
ulog-0389d243352255f6182326... | 1 
                xenomai-custom | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/fb8d9b3981b1d9a22d4b19ef82bd8811967c44cf |     
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/4cb08741d824c6c1772a5469e256531ca89f779c |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/a31ef98912b338c37d03918ca380d8e25bf5c07c | ORPH
    m68k     |         alsa-lib-1.2.7         | NOK | http://autobuild.buildroot.net/results/594907b19a8e425fa24520a6a50a14b52ea8d17b |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/fef388a59363f76034e5b90d06efcbc1b0fc714e |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ee10531c22ec42132666d75fd7d3b6bafce410ef |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/13b2a39fefb34835411933fdfc88a270a30b8fee |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2df86f83cf7e8832f8c93f39f2a4aea37a0bcf70 |     
    sh4      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0d7843e4f44c8ae120ac0530596cb1f322511e4a |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/dd3205c1abc3b7300f1339b0997be7721ec6ab93 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2ae22939ffb2681b0a02aabed5afec18a2e2d0a2 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7f22cc75636b7fc13f88392af709531a94323b76 |     
    i586     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1fce63a750cc014975a966efa265c94d65615f60 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2ea98b97e7c5cb458043249b5383314d108abd0e |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/02536053debbf07f02d9b81e3c9065b10f075766 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2ab69b373307aada86e04580ba3c330f3e185b69 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7b1b5bef4fde10de6320e67135acacaf08907ff4 |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4d7d053d278379a7f6d5ef8d4064fb612311150c |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/627dda01d792dcc8a44943d7286a6581d199a54f |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9c0186ea272518078b6f93b55259a20ddc871855 |     
  riscv32    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8b49240e49d4181b23902442705bac90b62291f6 |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c74ba7b26205c746a74c3a3ffa722d952751f69a |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/495b3dde2780e6e82301b3233a12d354b9861ee6 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6bce093910608532bc30fa669685316e36bd1c5f |     
  riscv32    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b4a3f5add75f501716bbff3b8b3cd7cf801378c7 |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3f8a4658ff38171c4904b5407a054508b470d3c7 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8045ff97324ddfb717c13370d7d6a2ecdf58c882 |     
    i586     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7f749ad1f9fc951a937b2b86b5196e441dfca164 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d9b288f05c28fbe2634895f51177867829fb44b9 |     
    m68k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/cde3010d9334fb3245228af2a62ec693c2960728 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/efea7dbe78d418f5e9fe1e6608b3bd5e32cc683e |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f317ef699ba483ccf3af28a7fc214c08f7f4c54f |     
   sh4eb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/26d43a1c3478ab16bb8d594ee83c1f9624feffcf |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/dc0893a647fa375b8a02b00f80e2e6e68d593de6 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d8cf926ac5dde9766bfdf4aff3beb22f1632624c |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/38ec883f2fb526f9e6a271e10faf4cb182436f79 |     
  riscv32    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b296709b2606000f20913808feec3940ce21277e |     
   armeb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/abc24455fcc670b253ce450c44033215f9bb8f56 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/aade9c7fe28ee12f887b8b4b1e5d6719894c5b7a |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/27abfb51a46417512c328a21de9c59b70de94156 |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/03e23302d58717eb105ef5f44879fb7ebdcc6ebd |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/dae94d82fbddd7b38619606b04ad7de49cc989fa |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/da41363d89c9a3c8faca7d9ec1202bee42a55c12 |     
powerpc64le  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/223dccd1178adac72f33a919d431c30e93a884ea |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/dc41b12743037f0063087d4da08d91dff9d000b1 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/86d2c977b450c1e5c0c8213cd19e9a9bd7894ac4 |     
   mipsel    |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/f3a160e98ce1cd7bf4c010ac2ba32ef641bbe424 |     
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/6e75230945ecabcacb5dc1e1e150736cf9913abc |     
    m68k     |         batctl-2021.0          | NOK | http://autobuild.buildroot.net/results/37ac547c03c075aeb333336be3c0c6b4324036a3 |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/40ac57d77e6b1a5781f6fbc93ade868bffb6ca34 | ORPH
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/954535b7d2986b301d3a99741d9f5fed33773596 |     
microblazeel |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/864fbc26b13499d36c26bc744d9ed93bf57743c4 |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/c604f18aa6c2d3b943752a7e4fc60147cf3c1e97 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/578bbd885d0d4f0f5b04236285fec8e24787efd4 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/e3427fd5b5dce52abff918c85894af57e11959b3 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f8a49fd3c4f47bfd34c560fe4d61aad7006c4037 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/9867744aff85ad660d3cda637c265401f0d7da2e | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c2c5bc6a1e6fd003ec6e0bea822e54f6f8ec9f84 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/81ba3a41992db570f903d86a77e8901b729900f1 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/9207a29fa98570a9477264f081ee5d386d945006 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/e229471c840508cdc577b09c7fd3df96167d6e24 | ORPH
    i686     |            cfm-0.3             | NOK | http://autobuild.buildroot.net/results/914d6bdd6978e97251bf59d3146766c6bc28bdb2 |     
    i686     |            cfm-0.3             | NOK | http://autobuild.buildroot.net/results/79637c8710fbe4cc261566e01069952d8ccc4f86 |     
  aarch64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/4ee37ab87856d4365f6fe0015ad4752f285125f6 |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5060da3b8e403012be9d962e336845fc108fe4c7 |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/eed5ecf5527270c9a4e1d90d008bb5ee0bd05958 |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/d5c325c6f880f7f00aae155742a2cef852b0a481 |     
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b6395781194ea0aedb1eac583c44ee7b6ea4bb5a | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d7dc8d8d117c91023138bb5931d0474348771eef | ORPH
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/3b59b598ed7067228b2932c7cce0fcd6d90330c4 |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/95d1e0d325490f6906b9c418d7f57672071cd398 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/c536cc6f3b0cad928e68de8c1f74a59bd5a8d937 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/eded14af3253527e5c5ff2ecca3356715e82be67 |     
    i686     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/f17025c5cb55480834b7ab29cf85e27813af2a97 | ORPH
    or1k     |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/a484cc49cb02a089607430218db7ff9a383f9ce9 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/1b743a577d8485e02eb968f9ec73421007e25ec8 |     
   sparc     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/5ddfe15adabc1654479d482a3379153088e92a2d |     
  powerpc    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/36ae42f762b8c5b9f9a6898a382f936063044087 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/648dff4eb66b9145c1778f3549a88295a6dafa3e |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/668864605a02ca50db3868704842769c822d8f1f |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/cd945c3691eac80789dcc854d46751bd24af9ca9 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/e457ce6f0757c0da4dfd4ad9a93bd1c26d35e766 | ORPH
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/cfdf319bfc027efc58db2e1d4000591b1764a88d | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3e19d8c7182372ea9ff54d5067a65c811f6d92d1 | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/713126b0a00f897c096ff17d1b69fc9468954c38 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/b344958d99d069bd1b38c138433b66266f6be2e2 | ORPH
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/76186797671dcac4181caf546b8f24fbe7c31338 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5737e6f1c56c2288985c4431d48303f0bbc894ca |     
  powerpc    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d47fd568c84218fe5696a65ea5580796775d9b9c |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/97ee7e76284252c54d8c1c1d40ed0f6789808947 |     
  powerpc    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/bd50b2e83ba7afb19ed821baf9038bbb003c6adc |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4b68cf0f0dc1dc56e374868baa274acebcd6d6ae |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/8db615cf6a14a66f15c3c0f6fb2e364ec71dfdcd |     
   armeb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/f482182a89f088ec98093b946724b2895fad92c7 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/508339e560c1e73732406b72ceb9bf0cf5bbfcdd | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/689f4d3913cd70414ea22bf076f46e9d219d35f5 | ORPH
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/d7796b0e044797217b81a925d4926a4d3326128a |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/996a741baa85edf969d214529b579b2998c492b3 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/a1f50bc1b1c0d24ba4d9c08e26aacc48fba6dea2 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/b934b7ff4c78e4cbeaec03d3fa4926eadc8d4daf |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/1e36865ad547ddd6d51bc060dda74a38959e802c |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/fa92837e7220d96af7f42c1a39e9df19f4a72830 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/0bde225de95737eeb3667be92def85fee57b4d87 |     
  riscv64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c2a2f49e62a92c10000b784fe7360a5531250953 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/174fa4c5b9a762ec9748bf39c6c4234e838bf386 |     
    i586     |           host-mono            | TIM | http://autobuild.buildroot.net/results/b1e82c73d74ee36b12e7d8fd324226e8f6024234 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ecc658dc5be415fad03bb1654f6f6fc557a4dcd0 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0f89d5d140a1cdf4b3d3629deca11e7608ed2bf8 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/364c17acfce0900c63f5719c150abedf2b5d7dda |     
 aarch64_be  | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/50f80cfabccbe5c75cd889ce6af2b418e376d4e5 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/0eb238a41cd9638bbde10cb1133490e6ac312d9b |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/ca53e5f44bab233693dacd9643c0c7c1a6b91b45 |     
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/d661e2cdff769cfc5f67acd2c8f49e721df52eb4 | ORPH
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/d3f52d0d37e6786491c4bb26b35da7b3192115a0 | ORPH
  riscv64    |        host-uuu-1.4.193        | NOK | http://autobuild.buildroot.net/results/e920376ff5a6e1547904963bf6a487fe68c8bbea |     
   sparc     |        host-uuu-1.4.193        | NOK | http://autobuild.buildroot.net/results/abc4f7a290af4b979da0cc89925023cde9c6c968 |     
    i686     |          hostapd-2.10          | NOK | http://autobuild.buildroot.net/results/db29dc524bbbc5a383c5ed5d4790e6031878eaf3 |     
    arc      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/daf287ad90f2bb60ab885d1d61779f753577aaff |     
    arc      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/6c68421b954004fa86a0298c644549824619a887 |     
    i586     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/2f58303fa1a23cfbb03af8f0c7b3db3db4110ffb | ORPH
    i586     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/409cd8b1046b1cc92f88b8e40267dd0a5ed23c6f | ORPH
   sh4aeb    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/a80861b77886a5f2c3c1ce9120eb7fbe875cb57f | ORPH
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/ae457c8fcb38e1c35f1a0e8e42d8b6b73c5e222f | ORPH
    i586     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/b8e3809d469c949a755808b7132717b0325ebafa | ORPH
   sh4aeb    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/23e97f88259850ecb12f2444365b34fa6fac8211 | ORPH
  aarch64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/2a449752ee51eed8b8d569a52eb69f635e0369cd | ORPH
  riscv64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/9f4493765d66e9d0fe9c9e7ecbcae0d66ba1a791 | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/356c9567fd177df35227147bd21a22852485e027 | ORPH
  riscv64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/b12cb8ca18259de4aefa3fac676f04d73862c312 | ORPH
   x86_64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/cd52389bd936523176b0cfa8b6c75089b35c380f | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/2cbcd956d776c6b68bc7b58fb10c9aff22a1bfee | ORPH
  aarch64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/a079c423857f3f9050c88f06f88f9982f77ba188 | ORPH
  riscv64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/bd737e2432d06f24c43034535427a53fec33c3eb | ORPH
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/3d83104aa6694c07e1374a0c8a82ac182ac536f0 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/8fac1be10d4716cd38a4dec97e32f071c7f394e0 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/cc6ab89387abde8d458b6ec58fa3fb5544a880ae |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/21ba866d28f6c9b974ac85c076dca61c853e7760 |     
 powerpc64   |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/a4bfec8f9436d55c04c863a2bc6aa7b33c4e30f6 | ORPH
   mips64    |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/8a181fdd054407b4b04fad04eeef783bda43bde8 |     
   x86_64    |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/8a75543aaafc77ab4db12caac4c7b5dfc3096626 |     
   sh4eb     |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/e3b78457a157df9e8ab3faee190ac69b2f9319ec |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7e54ed873669df12900fb7346a64a7d6a4257c09 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/eee89c6ae21dff5c0d66afa76e1e8ce1f2d2f8a2 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/75ceeb4636c34711b7ddc8da21e31842c5949718 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/47cb56afbf3b66674d5e8c93fa757c8ca07f7eee |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b2852dd7f41d19828c7f7fa8cedca4157ff55c9b |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2982501e09e241f725f238d209e6a5fa22cdad98 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9d91f738b39dd67e6c7c91f6e0424464bfacec58 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d0c93b3b059e2fa4bd5f2553892eb2fc517443c8 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2821eb0e4edf5f1a2f523fb0301728a70ffa874a |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6dd58330a7bac5c1ad40f9515853dd1532d3692b |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c75cede3277a363d48fe5377b106c96b8724a619 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7850898035a26ff2ffb310e83851184a41c4eab7 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a3e42ff2e459b7ded152f5393d11ecdb41b12790 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3549294f02fdebfa537e5fc698505c59903c3fba |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/97eadaf105bbe4510645caa35f3720813de1ed16 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b3344b5370bd43a66bdc6db035575a94210ae1ba |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/42e612a88c025c805d02804887ada917f51a1785 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e91f0627cf3ef1b0010e25bc3b09fbecc42f746f |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c64038558b85823851d99b7d96dc8023992dae6a |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/752fa295bebfd8e4c49e6187098367101022aec0 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a8f680eb8960b94ae0c1180470f7e4b494e6881a |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0f3e11e7790be7b81d1b212f541c13706c639d5d |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1c9eaa9ecc7fc86422dc481e047864a4023bad50 |     
   sh4eb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d58a5dc61d6dd77afb67bf4cb288c1fa0e1754d1 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2d20c94c8efa8078984ab614559b9258773e33ce |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/34c4389d1e39a3bdb00b65a6d41077791535de93 |     
   sh4aeb    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/18c28177b03f148bafba60cd52ceb290fe69bfa5 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a416902419bd655c7f6d500073e3a9e99c572845 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/03391aa7215fa60a7dcfc89aab6994f212378f56 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f00371b2bb3c0b80acb60e5b219d53f3a599a527 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b20da144d6a3aa23e9a8fc36cfa88e54d65b1c8d |     
   sh4eb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6587eca61ee33f53decea3300faf285508129c6d |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ec486a7dcf747a9efd716b9145bff8dcf7397d7e |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/878d616d92d5c582b01aa5681b459b8af4c18432 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4630d120ba7e1efa8163c1061a44343b76f5a152 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8bf99845600d27bd5c8f02c85bef5379f3f83ee7 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0603707fe1a99965a9521e56ab27476f532b19c7 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5983a48cfa29aab74189dab9c81b5d1a9e80e32d |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/82059e38a4eee1e5967ba2d48805c0e0efe51375 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3a2374d259793fae4ae1d37273c5363ce8e77706 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6516b289e7f82a987d0b03eafabeaf47512cbe9e |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/640cbd10768cb3cd22c9559f82b4d40e0e05caa7 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/87e94c5c39049a1944a5fd4fbcc29128f452cfe8 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/112ce160a7cbe6998c273c9e04474e53d32c8b24 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f7182646204303e854757a6a2903ab159974cc58 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4448595e3d025d42af16347d8eb9e86d43e58190 |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7565898d231dd6d74f1ee0fb246f5bc43f3101a0 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/48b475a693ab291c8db7b2d603bb85d84fc4a3b4 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5609f130f6ea83030514eb426f890dfcfe242d84 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d8ee49b64c24ee31b08d835342471c7660f1bcb9 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/94f956d0a463d27099e041ff982ca04bce45b9af |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d6fb72d5a99f6b5f2456677b76a281be5b78991a |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5f71fab4650b3111641632b59358046c846da36d |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b5e495b5a1bb9daf9a25b8c27bc9b9c12747e3f1 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/05e46a3d5b539b5738b735df124e48cd5fa8125b |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/60ece0d90901e882328d109e0021e802ee6951c0 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3609db730a253ae24b8e50d3e808ddc40861db54 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c3cf2d851387190ac900b84a26b6bc629b3b5057 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7ac9f6a13ba23c7673661f4b847da6a066eb86ff |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7a89a5dc7d381823296e896c484c34cc638475df |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/62d2a0c234c7c49edbb0d4a74b9af505cc1160f4 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cada4f43d5c7ad823b0f234bfb924036eefa891a |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/af17e7885896512b7875d3bd5c1ecefe7509460a |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/67e892f8504bbc1cc13cc85fa8eea037206cbcc4 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ca1b7c848315d747f495553ed7467efe32006b10 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/76a4a428aff9ae1dde29a118fccc7b747338216a |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c0f6c0af35efa710eedfaf321d3142dda4c21eea |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/81af8c1cb749c493c80df059c3d07372726c2276 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4f4c40df82e9b6b83c9ea8a586e22a9b7625c285 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/892603f850f7ae7663916d29868c6aed2acabba5 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7484230f31c64bdd238cc821f7553a9598976757 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c21f4bf00c061318d93e773fc741c1b0fb7376f5 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bc48b30edfa87fa6a2edd2e122b451a76ad8f51f |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dfc574d7a4cc12112d2e7df093f0adc022f4dd01 |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e3053baada2700ebfb7d4b19be6bece7022588a5 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fd2437c5d56a2ac16b901dd567bdd9213d8f55ee |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b14a347558d62b6a78c94a43a6aeaa88be572150 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c2d8524820f932e3d29e09310b0e500a2adf6afd |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b37df346f068e8d148237060988fd8a5e39e214a |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/890574875153264993b0afbc70da011c327f5820 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/67ebb9f8122b1b25104ae6a81fb755463d87aa39 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/801d6f3c1757c1cf2f1331716a2b79d8f4d1db09 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b419b7f9ddf39d9115d2b6abdf9c97ef55e98807 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/64396d6b7e79186df509dfd38d0dc82845dceec6 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/28e659aebb5173cfb0f8a030434e645932665bda |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/08b2c10e9d120ec2e69164774d7c0232e05b5d0e |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1b38548efaeba54d5118972a9f83a1eacd6685b5 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6c45cfe5d0580be2a9d697d1573b5a63f5cb8c49 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fd23cc14faac75d35845678c2ef7f2cdda29b3b7 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2e492c70d998794c13d8f4794cc5bd76fb483204 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/30538bb5d0c2aab52eb24666705320d4bd28b341 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c800a6af0400b5b31661e3c306c74f2d60296e12 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c67ec2582acf79b4152654b59f3df52845cf078f |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/91ce5e9a8a5507bd54c69c708299e3638ac3bd99 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5619b291fc2491a336062e92418839454e809032 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/602873c0261b0ec74c5e725f6c70becdf8beff10 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/320efd938c19e56f414c55e612058f3fb7e3d51e |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/66d5f9248502dd3cad0bff32109e8bbcd67eba51 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6fcc619de6fa34984497c1c376e7c143b85c46a4 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cd3ff1e3e814ccc57e1bdd3ad9cb850ce636b3fe |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c50d755522a2be9b395eb17ac72f56f48c45455e |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/90c72764f401d8033194351ec5f07dd6e7b7a630 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ed989d85164dfe6e8857e9087edd67ba7e742ef2 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f09bc47a6309550d814862a874b56d4a28481a8c |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/162c296f3d84131195ae12e494f3e0da70a55c86 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/348300734c14a1017e3e2b57c9792044853870da |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f4a0c73466bead6d975fa80deaa73156c696ab03 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7fa17bacc203a73b4bccac70e8ec77002a532706 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f734285ba6b563df5ba40f3a84068ea30784f75b |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2943ae27e515e04d8cbd6e4344d58d5df60bcc03 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f8b2a53a42d39be865acbbf4d158379d8e802d74 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a9b4f55fb5a4167c08feb0d1c78911d85ea5b9aa |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7b7c9f37b9ff6edd97ec1bb2fbb10a2f0e328b10 |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0c4cfb01c8ef614e4ed0d39b3e9b24cfdb02f021 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/24f73492761ee83b7e4a2ec73addf45161f652c6 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7b84c6f711e8c581532c7e256606c733b18d6957 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/da48ad0d8ad665c482c111f61b643a236a9f7360 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c1774988c13755310582295b255116b84cff86f3 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c97f3faaad1d0b3f5b33cf4d3929e499e24762e3 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a2bc4c7fdbd5562a2e3b29a65bfe84e0d7bd009d |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b256aef14642deb3b3656f8ce296d025ec9d0525 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2a504e6ed2941a43aba27c63c92a9eddb4a9c619 |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e86405afddee0fe6e1c5922c7a1baa526fe53d12 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5a44e7341b8cb442fd71a21b9198966ea3151a86 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6ca636384975a34a2c22a15f8a923c106678120c |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ed739c4d83008e80d494932355ba574ef87fa137 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cb896174519dcf7039ba96d331880bc85bab18cc |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a756061aee139930f0b7166f3768ff548a78805c |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a7919183ef54145831c404bcfa618262a65af184 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f07eb982efbc349183fd0c17a7fbaaeb12dfbbd4 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b3f193daceab1960e298461cc4187ce6eeb3424b |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/16b52c6b5a751404c504662383bffda4ed571f82 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fac62702e395ac24a118fab7dd13beccede593a8 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dc5aa6bf99dab6d3c7a5c7dcd09e8681b21eb909 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d30bc10c304d8725e2f574bd9261376979f0a483 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f6710ccc508af8397c508f3776b592953bd181da |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b4fd2d8561260ebbfb9980622cb331dd7e7329de |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dd4a5190569616b1425c4e288355c900c6852e5c |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e469db4090f97fc82a41bb3f4fdb5fa6916317d2 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/acb5e88c4b0d39e9784b5be78694e50e25c61a02 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f4efb89b4ecbd23e296967395bc7c97aac500943 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5595b0ab804d385c011b5bcdea1d476d76fd66e4 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a1edbcbbcdb20666e8602c98b3c209b15a6dafd2 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1d93d08f056145d9a7e2de4a63ea2f66c83eac62 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9bcd57b1b97bb301021d71798e11d2fa6f9f13f6 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f19e8bfba542f95920c90c2eb62210026b9c958c |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2b85419ec0ed2090a5c08c7cc1838cd3d76b95d2 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/eb3d63c72a30a1ea39064f535de347a625eeb297 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/aeffe457cafc854e13e48e8b27f3bf6a6ca3c722 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/454a1eee6f12b5cd1a9d3466c6409f5c172788b0 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/13b1a4c091a752bd69dd06af82a8efbdf337b1ab |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/70a51ad889c0558e7d1eb8928f82a514e35b8392 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c728031d40ca8c3682fd23df2b492ff6fd5ab841 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ca9f48c948a678caade0648ec826621780e06ff7 |     
    i586     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/775f60657235a4a1de2bf6701a8128c25568a7bb |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b7aeb471d433d9f43cdf79da4e6c4cc8b7cdd63a | ORPH
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/714f1205d6500eec7c9605d6cb2d9b72d497be8a |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6c28fd2cd54b6ae01750bab1ec76c7b87e22fd39 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ba94e717509cdf4a2f331c841671cd806ad3c0fe |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/305021daf3f1915f70c52902a29b93aa6006bf94 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/26e2d42f2dcde0bacb095701fb13408a150b5faf |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/60334a6ce7c7bcee36a9a4d156e07861ada7138b |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/13698e78c80a82ddd047ed830cf4cdbf62c92173 |     
 microblaze  |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/a17832a767244c3de08a4d86814bb65a6429ca87 |     
    m68k     |         libpng-1.6.37          | NOK | http://autobuild.buildroot.net/results/6984af4bd94eb7124ba8f7277da27ce5c807acf5 |     
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/bb2227461a8af927fcb407ae49d4c430ae191682 | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/8d14c5d97f42b24980195e4de293a8695ac8f6f2 | ORPH
 microblaze  |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/ec5215455ee39e1da307277c710361c94acc6101 | ORPH
    i686     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/1a4b4cb81715868926228db42d44027edf8bdeb4 | ORPH
   x86_64    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/7707fdff7709ab7b26ae4f7153f58512e016e47d | ORPH
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/eaa8209352ecbdc9cdc398394dce5ac038203487 | ORPH
   x86_64    |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/ab053778c5fd22800185cd2f42b3903da80d5aa0 | ORPH
 aarch64_be  |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/2d686c9e6fdd3c442c99fbfe319a4f42258c042a | ORPH
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/b71e6ba2ee5ab93c5764dbe69a7423b9c72029c8 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/e353d7088102c72539994f4665eaf493edea6a1c |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/8802b4994be4524041e3667813d523b7709c2000 |     
   sparc     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/fbeea14d4e4c6f2abf806ce8083a3d90da852e7f |     
 aarch64_be  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/2b87e7a7f69bcfe849a31460af588bfff69a4388 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/c453540e8662eb3162aaf2aedd223d0f355e29c9 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/ee2cb5bcaef733e240fd2573f0da85a7ce3cf047 | ORPH
  mips64el   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/cf529323350b4136b1c5830886dc552729279849 | ORPH
   mipsel    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/1b04e025197845bd05abd1e7f90975c9d39c8fab | ORPH
   mips64    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/78db788bacc82377061383af3121cbb60216a98d | ORPH
  sparc64    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/01e5509da2c37bb7b5f69ed1b1b6e4426343f587 | ORPH
  aarch64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/ab9fc8f93d19183c7cf57f68516e04f4d62c08d6 | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a26317e16d3ce1b3a22c9e204784c8560d9ff1f8 | ORPH
    arm      |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/10a74d2e5f083b5fd139ea22a827c272b0e35462 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/4862977ae39ca8a1fd309a3270040702f715afac | ORPH
    or1k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/0c370423dbfc0a2fbd54b515f984b438e4907c19 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/13d887b62781efa98bc711e7bc1cf8e3eacd71a7 | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/88b6b8cf6108db38ff407b333a10b1b1ccfff4dc | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/18b79885f3259a87f64800ffd34f248fbd7b9e57 | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/e464a1aabe55ed4a7a8187d5338b0a2ec1883286 | ORPH
   mipsel    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/05c98a1b0b8a0d0164ab9b97815bc7f8830502cd |     
   s390x     | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/ddad39fc19330a1a914852aa9c840552083dc9fc |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/4a05585c49f5a7cc2ea0c43067f2174f67cf6f6f |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/69ac560910afb4aa92f83382529f2344491c0117 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/8a10562468d13189e31d14fb2c041e8fdb62fa1a | ORPH
   x86_64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/224cd6f7355367d6db6f5a976c24dbb7849128dd | ORPH
    i586     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/e211eaead182b44bce9899feb58b28a43f2e455e | ORPH
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/bad56662111a2a3b89969d5052ae73c1ee0130fa |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5482e8c136ddf1994924654d8cf52cafe68b0e41 |     
    arc      |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/6b8131d76b58389205eecab803834b69ecba6848 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/66793a791ae2138e491daece6ac001713fdb26a0 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/95fd40c19e7a6ac983fa3386d24841263ac6d73e |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9b4c25e13db200deb57feea4aa0ed3a45625cf97 |     
  riscv32    |            poke-2.1            | NOK | http://autobuild.buildroot.net/results/1238d8b9af3940873940eaa358e842945b8c3ae7 | ORPH
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/794ff92d909b12ebf721b57db76dd0c359ccc1cd |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0e89ff9f3487f7c9d52042e3f443931862cfa8ac |     
   x86_64    |     python-automat-20.2.0      | NOK | http://autobuild.buildroot.net/results/66ea1b55a6f9a690d06d5f79ff8792af9baf3a42 |     
  aarch64    |     python-automat-20.2.0      | NOK | http://autobuild.buildroot.net/results/ff11f55d69f369ab015bf0dd858018ce2ad85894 |     
    mips     |     python-automat-20.2.0      | NOK | http://autobuild.buildroot.net/results/5944f050ad851d211dfb9fd3e35849f65a0bb55b |     
    arm      |     python-dateutil-2.8.2      | NOK | http://autobuild.buildroot.net/results/1b61fdd63dc947dbe0d31c6f0b8b0ec5cc200ca7 |     
   x86_64    |     python-dateutil-2.8.2      | NOK | http://autobuild.buildroot.net/results/406e4a19573490eab9efa465b3bc2699625a499a |     
  riscv64    |     python-dateutil-2.8.2      | NOK | http://autobuild.buildroot.net/results/52544093c9987cd68e29ea3772e5a795bb28a9cb |     
 aarch64_be  |  python-jaraco-functools-2.0   | NOK | http://autobuild.buildroot.net/results/44240bc1232455b9733baef5e08dd7bc53569308 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c8f3a4fb46caf4892f9fd5dddbe5d9717d0f6eef |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/ab61a8edb63de69f26dc0d1eb73b338b3da1313d |     
    sh4      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3944b758eb54048ff2034eab98a8a9a45f769052 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/eeea63525b084367892df5c502b4c73acba541e6 |     
   nios2     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/eee693d4bceb7c70f76d9cf0decd474794a0ca6f |     
   arceb     |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/ecb65ddbbe9d4a5c3c9ea7b31ca41c934afb0c58 |     
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/b9e50312ea7f20d44aea0b089c073d1d18cb168f |     
  aarch64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/cdb9099364cdaa8e65390a6795618208354cacb8 | ORPH
 aarch64_be  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/f2a90d91bf7de828509838d9b5f7a238b260ca17 | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/56410106851a10ed932ee60331cca243d97b932a | ORPH
    sh4a     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/bfb9f3372a5dce58b9c06179b9925532996cc467 | ORPH
    mips     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b2e4111ce18689ee8af3092c203f599a5391cefb | ORPH
 powerpc64   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/78f6423cf4edd780df84f56ef960bf5307f185f1 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/aadda4f93ef19b486076663c42a5e09696b36bfe | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/21fd017d49dbc9914075624d87becb1580076502 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e61a40ecf11269e6f8f434fd3460a2bd177ebc95 | ORPH
   sparc     |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/2d75516d729b5642653446994bd786effe5b1d30 | ORPH
  aarch64    |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/fda8dc6d3f673f49001bcc25d59969493580642b | ORPH
  aarch64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/691cda76de2b512b5169054026a295127470a87e |     
microblazeel |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/d756e5b925a2881c06f3d9477277beda420682c9 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9ed2262a8458bb35f8c86a4ed0ac611405e8eda2 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f888c5bca13f8ac4fc9dbd08d11b4bee625d0fdf |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1b9a4b931b5ab46645d7cfb8e8884a0e1365d374 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/aff85cfbc081338d442bfe3f95c497ae04aacb4a |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ccb1776f7f5d4c70e0ba4615436ab107b587b82c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e4f36a626feb6efc03250428ad7b11540c37fb39 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c100b6c803cda59b65a3fb86ec9f26e0666deca3 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/161b08a74f55b0b2ed78b039637f797d335d030d |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e7ef2955107acd389687e2c07b726de762a766e5 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/80942522090d7dfa892d81d093d0ae823a4d8c5a |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2166d28c60346bbe489fe1a656fd2556c748e932 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2db5e27d405f9363a65903bcfcd66df9142ab201 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/63105bc4183fc4da8858c765d28c4cca08830b3c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f992c8bc9e9dc8d6ce20e3735bb0952d91a68c17 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/650315245c6a1ab4cc07c0a61da569f5cbb32681 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/75f97811293fe526cbfb91ff6f22db8697270767 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/68c8e80349a28423f65d7528e41fbe343c8bed0a |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e5c4a32f6d5044453f4b904a60611146280d9c27 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/5814c620f5a43dbd466c008fff54f14440f9ea82 |     
   mips64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e56deca3f9cb92fe759b666790a7f86ef4d3b262 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ae86e84b3d6da4e2e4f88f1db9e811e8f2286a22 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f295c66bd53543031d675486c5b36fa0bd317208 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/14ceb97459b79fe4899d4960393b117721d46467 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bc3de84d196d8ed6f862a065ce5ab40c19c65f04 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/adc8ae55f3b860446320403452d189e9fe528c03 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/aa847c1dd05da6c79d4539c08f7ce3fef97f5155 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/40c3812a000121ae292d751a693a5924c47c32ff |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ca93cb318518f2ca5b49004786e8d18ee3bff2bc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0e3a981e6afadc74974e72f0c7baa9fdc776f5e2 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/fc2fa67a6804192e7d4f7de96e94d765b35ff0a1 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c81ed98b9b23d5f2aaf331159d12bc2b5967ca9b |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/aea017767c9c1b571a21d2a3f4cee5a916f0e5e5 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f16d6d4324363b06e65b18931b68da78208c4074 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/077ee837c41aef7cf608769f0cdd3b34522e584e |     
   xtensa    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/507393542648a17fafffbc761ac014d0ece0a6a7 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/42df42d6c69d9e49061ee72f851831dc240d6b81 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bafb128ab850b9c2efe8747f99f0fefe09fd862b | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0f87ff3228e54191ed8894cf2790781bab1dfc26 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/df1af7279f8390037dac2b1709b43941c75360d4 | ORPH
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/18aa919786cbf3ece1c5abb26fe091d2d36e257c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/021040c13324df78ac4847eda2ffdcb95ee8dcf2 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/42d1a3551e6f19c886afc58bf21b124dfe0a54c8 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/f278bbc7570630667cd3d956b748825f7404aad9 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 1 
                     file-5.41 | 1 
                  jack2-1.9.20 | 1 
                 mesa3d-21.3.5 | 1 
                   seatd-0.6.4 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/50bac5f1ff9895a2c2dacc48956ca33a5802c15a |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/793c41cb6c64bf1c9fcac532c90ac8a22a677e72 | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/88ce6ed71fee4c22affb3be502bd2dd1b9b45fae |     
    arm      |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/708fbfe67819425a9290215f629c44e3bb033972 |     
  aarch64    |          seatd-0.6.4           | NOK | http://autobuild.buildroot.net/results/3fffc6f151601ecf05da3d6863919fd7c39e7a0a | ORPH
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c961543d408f4560671fc8fdc0f8d4e26f94cb7d |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                host-go-1.18.3 | 3 
                 uclibc-1.0.41 | 3 
           libfreeimage-3.18.0 | 2 
               protobuf-3.20.1 | 2 
/home/buildroot/autobuild/i... | 1 
                arp-scan-1.9.7 | 1 
                     aufs-util | 1 
                busybox-1.35.0 | 1 
docker-proxy-339b972b464ee3... | 1 
host-google-breakpad-c85eb4... | 1 
           host-harfbuzz-4.2.1 | 1 
host-pahole-73383b3a39afe86... | 1 
                libressl-3.5.2 | 1 
                 linux-5.17.13 | 1 
               linux-pam-1.5.2 | 1 
             netsniff-ng-0.6.8 | 1 
               openpgm-5-3-128 | 1 
                   perl-5.34.1 | 1 
          perl-net-ssleay-1.85 | 1 
rpi-userland-14b90ff9d9f031... | 1 
    toolchain-external-bootlin | 1 
                   uacme-1.7.1 | 1 
uclibc-ng-test-0844445e7358... | 1 
               util-linux-2.38 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3bae2d482c368d1b5095cd468df738d7c4da809c |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/3e90d6c16eb07c154b5d8d6e14201d9258bbda06 |     
    arm      |           aufs-util            | NOK | http://autobuild.buildroot.net/results/289891df35c8a35165ed6b0a5c4c3d1159a0fc47 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/114b4fd231c6cda7ce2927885de5a97252eae3d9 | ORPH
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/449f9c557284b1e189fb8160821784b5d49b3dce |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/eb156c9263e26cc69d3975c34ded6f2b700df2ce |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/4e3fb9b12a0c897679ea6fa1f3f3697333614518 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/24ffca5d9d281749100ade906a9204c9eee33097 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/ebd99b7bf79294ee34170d6bec7cfc94ffc867c1 |     
  mips64el   |      host-harfbuzz-4.2.1       | NOK | http://autobuild.buildroot.net/results/2ca1ea74aa089e1d3f968d8f5ce9364cca2937ec |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3447114194cfafe53b3e5a307b6baa4aef854de3 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/acb2567e4b44e64d08a1a7d71535767438cbab1f |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/36f67f01d2cc5c363d3ccc50cd63ab96cde61d3f |     
    or1k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/30263887a275e8c89e0cf62261c80a55bf796fbc | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5197de29e3a91156a7fd5312d1d14e5838aee788 | ORPH
   xtensa    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/a3ba030319225578cdb6cbdb12f16d9bd2e65da8 | ORPH
   x86_64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/f8b32bf09dcd3c1529d60848d3c3fd4b11570c4d |     
   s390x     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/b77a8fc99a122201c04aea2d0d93679d4a9bb362 |     
    i586     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/0c8e6a55023c7ebc753564efa21d1ce356ac6ed8 |     
 aarch64_be  |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/44dc26b82e2f1e41dcb44dec43d6ecd7db0c78ad |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2f2f9068d91be8a99ee63ad2b3b557203de8a956 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bf74995b76d86d134d436a6f345af2b738a836ac |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/9c422b3843cdd03d821beee95508776ea02f8ad2 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/843049a936ff1ae442f22c74574ad6d9d7142ddf |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/00cd5fdb82b1bbe9ca0f5bd0a849d232ba33cfac |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3fdeed060ecb9f40727f065beac870c402785300 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b07f6217d26f67ddaaad2d581711b2c3868cf862 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a7173c0872b669405cfecd051e728c47c891438d |     
   x86_64    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/3acefe99808637e55c9d5030c7fec0abade75c33 |     
  riscv64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/5eb0d6a165b86ab9df704d1313f1438fc0ba3111 | ORPH


Gitlab CI results for 2022-07-04
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148703  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148708  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148778  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148781  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148862  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148939  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148942  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148943  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148949  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148956  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148991  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673148993  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673149007  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673149011  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/2673149014  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
