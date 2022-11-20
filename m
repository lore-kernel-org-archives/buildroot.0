Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA57C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 07:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D8381FED;
	Sun, 20 Nov 2022 07:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D8381FED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2SLwoYxvUiy; Sun, 20 Nov 2022 07:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEA0D81FEF;
	Sun, 20 Nov 2022 07:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEA0D81FEF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1234F1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 07:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E473781FEF
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 07:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E473781FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qxzoz2wZwZqQ for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 07:36:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A73281FED
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A73281FED
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 07:36:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC8271BF209
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 07:36:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 07:36:30 -0000
Message-Id: <20221120073635.E473781FEF@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668929790; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Rzn9SdC11AyRzjZmfFzmv/1fSQQ7YIfbN+gke+GlFe8=;
 b=C1Xnv9Mv56H8LeN8/T+Yip2/Aa9ZzF4VNFIa0UkIufcqkeNCgqxHTGmOcSo359pOvQq9gJ
 Pkl1SH1RR87PhA8MfqpLmp8Yby86xWmkIi615rOQ2HCd/wsBm5aR+B1xFwfc6nAgDuTr2B
 Ea9MLor+SNsaqkN/ReQznqW5CXERIoTQZGVQlHrY0I1w3bsnZGVyWtDodiIijGGJZRlchK
 qy4j5FjSy/L02btHAyhbaG+5rGaeElwJJ73pLyBb1AHGEi1OZ3jlhj1RWVYRq9MVhkjpMj
 zaDIEzi4+x4LQ7gaQIqhHjODknAtM4dWvBDSD8TCYmRR37nSF8cQO8BOHAbyFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C1Xnv9Mv
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-19
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

Autobuild statistics for 2022-11-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  1  |  0  |  5  |
  2022.08.x  | 16  | 17  |  0  | 33  |
    master   | 211 | 201 |  0  | 412 |
     next    |  8  | 21  |  0  | 29  |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 19
glibc-2.36-66-ga1dc0be03c9d... | 12
                      xz-5.2.7 | 9 
                   linux-6.0.1 | 7 
                gerbera-1.10.0 | 6 
  gobject-introspection-1.72.0 | 5 
            host-binutils-2.38 | 5 
                host-go-1.19.3 | 5 
              host-pahole-1.24 | 5 
              host-rust-1.64.0 | 5 
               libglib2-2.72.3 | 4 
                linuxptp-3.1.1 | 4 
ulog-0389d243352255f6182326... | 4 
                elfutils-0.186 | 3 
                     gmp-6.2.1 | 3 
      linux-5.10.145-cip17-rt7 | 3 
           python-numpy-1.23.4 | 3 
                       unknown | 3 
                      crun-1.5 | 2 
                 dash-0.5.11.5 | 2 
       freeradius-server-3.2.0 | 2 
                     frr-8.3.1 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
gummiboot-2bcd919c681c952eb... | 2 
               libcap-ng-0.8.3 | 2 
              libgcrypt-1.10.1 | 2 
          linux-5.10.145-cip17 | 2 
             lirc-tools-0.10.2 | 2 
              memcached-1.6.16 | 2 
                nodejs-16.17.1 | 2 
                tealdeer-1.6.1 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
               valgrind-3.19.0 | 2 
                 wolfssl-5.5.3 | 2 
                  zabbix-5.4.9 | 2 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                    bat-0.19.0 | 1 
                    brltty-6.5 | 1 
              containerd-1.6.8 | 1 
                   cpuload-0.3 | 1 
                 dc3dd-7.2.641 | 1 
                    dust-0.8.1 | 1 
                     efivar-38 | 1 
             f2fs-tools-1.15.0 | 1 
                 fdk-aac-2.0.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
               gocryptfs-2.2.1 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-runc-1.1.4 | 1 
            igh-ethercat-1.5.2 | 1 
          imagemagick-7.1.0-51 | 1 
                      iwd-1.30 | 1 
                  kexec-2.0.25 | 1 
             libgpg-error-1.45 | 1 
                libmad-0.15.1b | 1 
                   libnl-3.7.0 | 1 
libuci-4b3db1179747b6a67790... | 1 
              libudfread-1.1.2 | 1 
                libzlib-1.2.13 | 1 
                   linux-tools | 1 
        ltp-testsuite-20220930 | 1 
                     lxc-5.0.1 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
         nvidia-driver-390.151 | 1 
            ocf-linux-20171122 | 1 
               openpgm-5-3-128 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
           proxychains-ng-4.16 | 1 
           python-pyqt5-5.15.6 | 1 
            quickjs-2021-03-27 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8723ds-76146e85847beb242... | 1 
        s6-linux-utils-2.6.0.0 | 1 
                    sdl-1.2.15 | 1 
                   speex-1.2.1 | 1 
                  spice-0.15.0 | 1 
                 systemd-250.4 | 1 
              traceroute-2.1.0 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
xr819-xradio-4f0cfd5e869ca1... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/63380814a4a8aaf554bf7026359178586431d1eb |     
   sh4aeb    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/377a0bc05fe5cf428ae04ac9bb013fd78df3cf57 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4d2b6c1916bfcda798c075e1855bbdcee0caf44d |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/1c58ed81889d54cbc4b2a12412eded1240e6fcbb |     
   s390x     |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/c52b2cbfdddb36c49847dcb017f07f2387593557 |     
   arceb     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/3124dc55bd72b5e8bea9c0190b897aa9c734dcd9 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8ab25c9663af92e94b356db7feb4fdb5d762506d |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9eb3d79b71d1b117245bf881fb5c54b1d29f1dc3 |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8954487b3ea055865dceda36c69225bf43a50bb9 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0af8b66e84f30ada937eb591cce2d116fd8dd2c9 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4cd6c51755fb204a564227516ef62fecf435db58 | ORPH
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/e5946d21ae9dee172f17b5165191f19bdeb13185 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/4a71799f6c18986441c695e006867ef83ca1d79a |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bd3a4996531a48e4b1c3f07f24b9cbb1793767ef | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5e4b08acb863fd6874378e3841e9b288302befe2 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/215ce55620c79c387531a704fb77067b57163be3 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/19dcdb1175335cbf2b21eb56c179232cd973aa8f |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/c7a95b69f2380413e8eaad5b9414f1417d9e1777 |     
powerpc64le  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/73f0f655e71220cf8e713238cf44cccb7270a12b |     
  aarch64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/fe26800cc79e5c4028e0cbc296c296c13f939fee |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/4302e5b39a7a4fc70700416d21957c8d4e0d2036 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/b23ea27803f560441516901e5ed25a1248ea9e85 |     
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/71a49e4bc164d15eb81371831cfc47b80c37628a |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/cbca2c904631409b032f4f91bd3fcab24152feba |     
   armeb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/7dc5de7b010138272615843526d7586f3b7ec1c2 |     
   xtensa    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/42df2795dc77d6c07ee426c2049005be82b2a719 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/171462990aa1b741428348322a4732d8300d909b |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/db3f5820b410b4afa5905dfbd168330a8df52532 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0d8cd52d5c9beb161fe5892b041352fdb1589eff |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f84c33aa78e0b2df833d79c64f36e390a8c14038 |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fea5dd50155df48d5ba587d2c590c66c8ce5f72f |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1849aa8568d0458c1dabfb050bd82459529b3fdc |     
   sparc     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/4ae5c4f0dd53f364fce45f487a19a5e8cb5d76ec |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/c749b3d898f100f590647ebdad5c00f335e2993f |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/52f82de97ea5698ec58f48abe6d2283ae142d543 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c131da6e6b366aa3f187d43fd30f8861e1d1e074 |     
 microblaze  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/16195bf11cf14ddb1d87350a3a837192cc03bd25 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3e932359f849f4bfe7c7c6afcd4072e9fd9cd08c |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7b71e88230c1aa80503208528590ea24f4b1a966 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3c469740fc14d0d0d3a3f3b24dfc07cd68e104c6 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d9465014ab1141f9fd7028894549007c957c8554 |     
   sh4aeb    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ccc377955f841f3253cfc0867a2689bd9d0cabcb |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7cdd3d734e3824fec73d5c1eedbc82862b0eff2f |     
    sh4      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/bec36116dfc111ca76459a8ed6d9a50e31e655ac |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/31c8af0473fed6da665c8ddd6108ef6c0b184b03 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a95988fd1cf78b221eaea816e9a363fc77d23098 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7ca7772767659558c4496dae7f752721b8dd2a8e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9cbcc1f6e6eb1a375eb6e789d662e512b848e6b1 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0efbb3f1135d451bfa73894bb87907c298300b34 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3a336bedeaa23165ee1cca51a399ae8535fb9d7c |     
    sh4      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4c4e53001a4e0d50b2e79c24b0d1282d685af92d |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/2fac9aac5b84749d55131e0761be91948d5d1767 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/cc6238b788184f6c1c0fe8c8e72cbc87f5bcb08e | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/775a219612e43e157c9008768eca7ac510baae2d | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/4ee54472004648ff935554876daca211dff39b47 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dfcb0d4b0417042a2dedaa517de04d2d9c75d42c | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/16420577306043782e031eb94b2ca21b627eb25a | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0a6464c86bf486d2e710569a42fbdb7fc40b990b | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7490e1744ece2fd1fc2a2779b59f7271a6472f6c | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d5c50d7f2e19ec08472ee273d7bb23ff0b232882 | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/6a7c573d5ff902bd61bb7239eb6b159f1def426d |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/fe54b239180555d8d451290041b9bb08b385ac41 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/ce6663b731594d740390d2487858493c7bb1c102 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/cfed1b94c0565d5f613a7770da9510fe2d01e0f0 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3d5bbf8c7056ef409bc490d212cfcf51a3f2ac80 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fdb091bd2995dcd0359322d6087c25c548134e0b |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8a8d1d32b4d634c869fa8e3e1fbcb39f40a021fb |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c874d5331ea407b5e937108b22991b0f92ec327d |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7a76e4c06f2f87be0551cedd070bbc7b020046b5 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3816581e49b8d8670c36e80c563fb36f493de5f1 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/437fececd88d8dc5d8c78297de7fd01f35d9dbe8 | ORPH
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/dea3e6860bac479fda5a3f7f85f5f8ab24789c0f |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/1ca85f6347e672ad0d84c7ad4d01021b2f34ef33 |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/21e7ddad73459dea4ff590c8113a26b619f451dd |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f85247da174855b3f798e55447cf107840ddf6e9 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/28e96d7acc41989a39aa84e3ea9463c3f98149af |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9e55b7f587bc7adbdfb072caba35cc117e67615f |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c683642afd48db99743bf56a47b552a57989c27a |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/95c6ae7ad36f827716a70a3cdf2e790006bbebad |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/54841e50f0c50cab410dd2372f1330363e45674f |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9d416369122f54a3b3ec1f83c519a7391ccc5b22 |     
    arm      |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/e6b2b75af11f496adace5c2b57da893738d3cbcb |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/addcafb1e29763d8f22f0835289d29815fbf8d5f |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/af4e9192643f10cde1c4a976cc4c210f3b4824ec |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/30059141976a4b1a7b1d6c43bb1e170c4a857ece |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ae0f73a4a948b26455ea41a60e25d9315da9d5bb |     
    arm      |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/457f71cd32669c3e75e1898f4d2d48af985a10cf |     
powerpc64le  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/7eb224c03706593e104ed963bb8d89b1de776a1a |     
    sh4      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/23c55e522c5b92c583e4b9aadbf2e12215cae0bc | ORPH
    i586     |            iwd-1.30            | NOK | http://autobuild.buildroot.net/results/4a48676460e6ce588897598f0022ec840b4b4b8d | ORPH
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/73e5382997be1cadd6d99a1f64fbe0ffd318d06a | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/50a5ae8199edbc0d351a388b72fc78bb598a6b7c |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/908465decf7567bc9f3c78b272d5c30d994d04b0 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/35b7a14093d7845bbf2d89120959c23ce0b81f78 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/49a9f2795521379f710dba9ee110fd6fa51c8071 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7721887c7415a0a6b3715987b81d8d298e9eb1a3 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8a98ebb2575ae162ae7b9a2c4fbcf079e08e7198 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8cc99359ef376559d997a6db3dff0ab6e96e6868 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3dc630e13ad700bd3e4931a456b43649dbfbbcc6 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e923af58ddafe3b0873a27191196b32ecddfd2d6 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/84e421e43cb414196d1f8b517a251571d02b59c4 | ORPH
   mips64    |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/01ef73433c3be568278aeee7495d825242c3da8a | ORPH
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/512f5d4ff71f15f2d5e1aac02b5314da6f58edc4 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7babfd1a30817ea4eda926790e386fe7b6520d40 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2127c3e8c9ca987894876b7c0e44b567b0b73fc8 |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/17a8b75012a5413484c9222314eb8cd0b4b26d52 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/774fc066ce102299cb4939df720e49da5d009d95 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a3fa344109d10c47f419179a8affeb9cad936d06 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4468bbeb8b70cb898c1cd5e1464d76dcfeff2e3d |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0e80bae077bac816c7c9a49e7aae9e062e4b0ef5 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b689a9914f42afa9204802711eb6c9229df5ccff |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/92aee03e90749c7c4117f842386d61c904d79f7a |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c691050526ee21ba5c72f10a1f14f30f9035e888 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1c11379ff3d79ea53314bbffaaa9917cdc097b72 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5097c51f3110c757089091ae1adfc81b5b2dc209 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/546c5d565ef32822b580d0d1cbaaba85640e99ab |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3473018c95821e0032107936170303e4c7eddc04 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d51bbf923672cd3dadf723ce3aac130e088b7d17 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/64a03efe0cd1db1abcc33e73b85b3491448552c1 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/aa2e37cc233c934d550b95dc812877fbc079c1c3 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e659a8a0301cd563b83023e8f2c3d3221c6e0d0c |     
    mips     | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/6d3b30414b4ddb674db9d894c48c7a46753e7c71 |     
    arm      |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/78b5333b6d3cd5850cb6d3ea927a024d7bd7ec31 |     
  mips64el   |         libzlib-1.2.13         | NOK | http://autobuild.buildroot.net/results/4925ec11120ba50d9a23bddc709c43395b433c11 | ORPH
    sh4a     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/2fa0c62669664aba1e1361eee71b42bbf1076b44 | ORPH
  mips64el   |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/c5b4c200e5cb6e9dfc3ae9950d9b41f4f3cb7340 | ORPH
 microblaze  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/2db18842d641343b57f245ce05eaa588bdfb731c | ORPH
    m68k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/f74b7e75407c0f6d678b0729a6794c9d7a08bed9 | ORPH
  mips64el   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/6154603b3e0e2984897e0888c41275b304f03842 | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/30a641d15cbe977a96b259b5d302d71d08bb558b | ORPH
    or1k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7397a0cd421ae08c7bb3d96889556db6d4dd04a4 | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/2e971b68d08b110d5fbb620ac9a72e18aac8e4fd | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b164f5f8b47c80eab860db409a0b87716a5edae9 | ORPH
powerpc64le  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/783e3291d6961135b00194607e6c545df5c31c26 | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e02f2fcefc77a63b83c1e97d1ceece7f8b8b63b6 | ORPH
  aarch64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/9ae4353d32b2d27cd916cb90a3adfef93c46f75d | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/f7138902bbac48db05072da41a053e0a2cf93a8a | ORPH
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/a61c1a7e6d6d6a60a0e2ea3ec31aae0f9744340d |     
   s390x     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/56d54cb4dcd4d3b6dc82cc3347dfd2e6d6692d45 |     
  sparc64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/7192dd41158e1ed4af4cfc5d23371b2bc0f1077d |     
microblazeel |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/5f7d09cd15b30533d4e80feba86f1d98c7f29f77 |     
   mips64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/ee7342879876a2f65e59d7128c6bb9690af1b644 | ORPH
    i586     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/64af258cc8a0f62d10ead98417d8196cfc88dafb | ORPH
   sh4aeb    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/1bd239ae2b3874314f87b4d510b529e66dba693f |     
  sparc64    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/b294b73fd55c25ae187826e1780a8d05c2447948 |     
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/1d4ac57759743895ddae27475b234fe2e99ffc66 | ORPH
powerpc64le  |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/8dc245d2f0502a6ea915f538367e9af40b948dd7 | ORPH
   x86_64    |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/3f43447f891069a6bc8b8eb45c487a9ad6e72c6d |     
  aarch64    |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/80bb4d90b6c7b091ee0b2a77cec370dd7012b5c8 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/0a9a328695bbd6b4e19c2be08befd2318cb1c039 | ORPH
    m68k     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/addff18c80227ee2b45f9d52ae385534b46fd64f | ORPH
   x86_64    |     nvidia-driver-390.151      | NOK | http://autobuild.buildroot.net/results/3ce5965140b2bc80653a38d3c99756bbf421e529 |     
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/4039f00191766b915ad25715d1b63829f6ef1f1f | ORPH
    or1k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/18ab0812c5647db7251cd7ca078204f86e4dd682 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/0f82bc1b0e67670440c5bcb04b3f5e7e35acaec1 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/39fde2d7fedff2fdf023f4179b013a9a5e2f4734 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/334ae4375fdd2ff510ca6d22405a36bd74638d16 |     
  aarch64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/8f08668139209fbc1bb2d3a828626b67a95db241 | ORPH
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/7940c733d9846caa4a45b0306e0211e1b432e7a4 |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/8bea0fb51458b496fc340116594fc88db41ef80c |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/d0c65ea527bda07e184ddb46f312b2c4937d7bc1 |     
  aarch64    |      python-pyqt5-5.15.6       | NOK | http://autobuild.buildroot.net/results/b9d69d21e734aa62a6e0b4d4124c2bcfc027ebe4 |     
    arm      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/716f3cdff9993a4cd80ef58d0ddd60c4b2e824b5 |     
    arm      | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/2c364aba4ec2921fcf9df7034e4b3affe9103220 |     
  sparc64    | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/10ac2ed6130250bc394517d1cc5c97394b9ec12c |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/0f016f54b8f5bf5f4ab9875f003e5712c795000a |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/1e76af805ecf7be6bf928e61ffe5eb4f24e6a3b4 | ORPH
    arm      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/f4db486c419847c418e0d6a31a156025629e683d | ORPH
   x86_64    |          spice-0.15.0          | NOK | http://autobuild.buildroot.net/results/98bee87950cc6f8a0e5d380e5a93cc43caba0e96 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/58d6eb375da972dce4f69573b867ca74a667a6bc |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/080e00c66ba900a91f655363b79b251e7aeacaa3 |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/fddef32e7b3b109626e959684047412d3f3c911a |     
    mips     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/df652f747a908a01bb2f51bcea9984c595cf6e06 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b05f397793edfe0f308b757dbc9d6a1b7db4621b |     
    or1k     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/aea64a565517db77452099a8ca8aec21488bfcac |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e90a7c8c48fed8fdf9c500892cc43529a24f50eb |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/f8850b54b831e6e96a18239f6e8f24a4ff3c9f9a |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/77c4c0bed697a5daa93e45ad9717e82f4511fa91 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/f6ac28b71da36ed0060735ab8f5011915023954e |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/489340eed1d17df1debd9c3e985f9898003cff3c |     
    or1k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/79885bf85bef69a8c7f649b76b6f718785584114 | ORPH
   mips64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/f077c4b6df40ad52f84dfed09145b88ce1668f49 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/197a07ded8ea0d509535e0d7abd6ff2d11a616d8 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/bc09351dafb37deeb55d16084417ff25c3be00ee | ORPH
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/16c98f94c9f1884826ef7af92717b39fc99b5f4f | ORPH
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/82f0579c06fb601bfcdd4da96ce809b518269b7c |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/39ce48876ca73b8186846355360881e457e945f5 |     
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0fd71b20982fdf31c09f9666b0a660641092788a |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/a4fe561907b9b904562ffb5fbf94e84ce1d981b2 | ORPH
   armeb     | xr819-xradio-4f0cfd5e869ca1... | NOK | http://autobuild.buildroot.net/results/172a93adfcacfb307354dcc264dd650f4af153da |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/445515c522ed50c6ced322be070e60a4871ff14b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1cf60db3cc15c850c8483ecc8c6cf0c07d99f0b1 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b9778cb8a3e0a83b5ce8dc5e39c55a1f1372b5f5 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a825f72fa31894015a3cd79b829856094bbdae28 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/60248f635526df97c831450cb51f396c35039932 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/39c0c253ee74467b05f93f35316b6710a73976df | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0904633a4e7618d66636de64a7010a6a996095d5 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5575fe31f1de2b1a5f2d080d01c3932ccca6a976 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/91d8c74f1b0bd5ffa6cc833ba4f944c89e3ad18f | ORPH
   armeb     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/118deb8fe6e3bc55b4ed940310867fdd66142fb0 |     
powerpc64le  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/eb77ced84fe14d492b33af9e8ff2695ab11bfdeb |     


Classification of failures by reason for next
---------------------------------------------

          imagemagick-7.1.0-51 | 5 
                  acpid-2.0.34 | 1 
                      crun-1.5 | 1 
                     frr-8.3.1 | 1 
            host-binutils-2.38 | 1 
                host-go-1.19.3 | 1 
              host-rust-1.65.0 | 1 
                  jack2-1.9.21 | 1 
                   libqb-2.0.6 | 1 
                   linux-6.0.1 | 1 
                 mesa3d-22.2.2 | 1 
                 openssh-9.1p1 | 1 
            python-bunch-1.0.1 | 1 
                       unknown | 1 
                  xmrig-6.18.1 | 1 
                      xz-5.2.7 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/59f2e01e83d0a9de243f3dca6540e1f7dbc13518 | ORPH
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2e7ebc45cdf414766aa1e5c34e1fad5fc0c5ddf2 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/d195216c53e69abcdc33fc115be71762a34774db |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ddaf3b1070c7c92e93e3f6a6c87ab4d90cf4311f |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/5debb8295dd28c5f8cd00baced6670f62c4fce5d |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/82cf19661053f97778cc84a504e6597a7d966f0e |     
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/dc33f7463172609d799b6c3c759e232431804063 | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9c0641f7b879e107b485ce3397feba8987ca2a6c | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2f99a4825c96167bef99aca4cda4b800b969daa9 | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9fff63c0e2fadc52584c855ee7151722a57bb314 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/7c665f7e5233d96a878ef5e303e8c16aa067d952 | ORPH
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c3f3a144880c127a3f9448cdbda1733ff3d515e1 |     
    i586     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/f1a9dc3974574af6428d255e83275778f3d2275f |     
 powerpc64   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7fa87aaeb10e548ca2e235d57a87dd3c49a78c6c | ORPH
    or1k     |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/60f578a8472b0b5850f75d02280bd419dfdec888 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/010b157656717362fe5e1e625e9c8fd6c9c5580a | ORPH
    sh4      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/38549b05c717972dc441e38b399d27720744b245 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/f32816fad13f096d4d27b31a840f8d60152e9e8f |     
    arm      |          xmrig-6.18.1          | NOK | http://autobuild.buildroot.net/results/d14dad6c4927f6f88549b5124ae2bef9e00658a9 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/64f919a74b2ce846ce6f2880a795a89faf811f7c | ORPH
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/927c28baaabec6bf88994157c303cd8b4aafbef5 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ffa1b608989b3a1b5743649ae60201a3cf4dabca |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

              open62541-v1.3.2 | 3 
                       unknown | 2 
             f2fs-tools-1.15.0 | 1 
                     frr-8.2.2 | 1 
                gerbera-1.10.0 | 1 
              host-rust-1.62.0 | 1 
host-spirv-llvm-translator-... | 1 
            igd2-for-linux-2.1 | 1 
           linux-5.10.115-cip7 | 1 
              micropython-1.19 | 1 
                    musl-1.2.3 | 1 
                   perl-5.34.1 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                    volk-2.5.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/e4be1892a789d3d315b43a62610a8034fea0f7cb |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ca1c6192314b29dff5d581c68f8fae88f2b44285 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/60263ac69a8f759c45c4be6cb8e03a42158eeb10 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/8ec4e7dca8e842bad32d2e4fa96f6994c060bb12 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/a50b2c76433c6943bad1701f6cea1e7e1b0f9bb0 | ORPH
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2d2b471cc1d53ab3d02ec6d30fe04ca9ba69929e |     
  mips64el   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/7ee20bab408f06732cd93ea5b58c12af60c281b1 | ORPH
  aarch64    |        micropython-1.19        | NOK | http://autobuild.buildroot.net/results/b8ec47c4210ec204be77a319b64023c7d877ef47 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/b566855b3776e890b32e7678e00d3627dd1d5a02 |     
    arm      |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/44ed1c2dd6e2bee706c45b2cff4920d726fbac65 | ORPH
    m68k     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/c49286e7aceacd59e6ce55af7d8e214a5cc5c783 | ORPH
 aarch64_be  |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/68c72b090b54a7f2e495b2201b850570a996fb40 | ORPH
    i586     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a4ba52e25bbe7f385fd25f1d7f438fc930a890df |     
  aarch64    | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/a1fa18299c5016e1196f01449dcab5f97465e278 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c0e0b1e4ff48fd3f97da5a0620e9fc1545af5e47 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d1c3418de3fb02c7d3394b66e8baa6691d8b0249 |     
    mips     |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/ad4fc58357b13dd17427592f0c85582082e69b16 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

