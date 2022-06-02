Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2153EC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 04:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7484D404CA;
	Thu,  2 Jun 2022 04:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7l2nnuDCtEm; Thu,  2 Jun 2022 04:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D3914046A;
	Thu,  2 Jun 2022 04:44:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F6D11BF292
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 04:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 479AA60E6D
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 04:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYV7lv9xqhgv for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 04:44:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17ED160B6A
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 04:44:26 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D387A4000A
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 04:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654145063; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9KBNf2ZA8/oOPV5OgqPfljBE7azR+F96yav3aYa2fqw=;
 b=aeEopsIdYmRxXmIRsKItG2f4VfksgYhIMaUgjsJNQJcjpadHL1XpqmGxm+lQHQYNgaZ9bM
 ANkMRlHlA4yU+T/bgU0v5nz+5fS0O+qlEuMMYxmGmUFCtlhPx05zIA9uFtB9lcLqbJwAc+
 lSXDjCcrHail0t2nxeK7wYqJ4R48weXWvaFM079vylqBTv077PxV6ZWzt+6aZyMHMbTfHk
 EhahKXtAwoxk01QKViewqmYpPiXnhl6srnzDZnuTbKYgCmWWblcgRDTMLKMvsbYpzs6rRV
 riJzjZtqE6dtCw739BrF/f48/MRn/QgB+D5Suy80oDeE46wjrtQO6byuLGiM2g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 02 Jun 2022 04:44:23 -0000
Message-Id: <20220602044429.479AA60E6D@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-01
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

Autobuild statistics for 2022-06-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 13  |  6  |  0  | 19  |
    master   | 131 | 123 |  0  | 254 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 11
                 uclibc-1.0.40 | 8 
           libfreeimage-3.18.0 | 6 
                 zlib-ng-2.0.6 | 6 
             libopenssl-1.1.1o | 5 
               protobuf-3.20.1 | 5 
                host-go-1.18.2 | 4 
              swupdate-2022.05 | 4 
                bitcoin-0.21.2 | 3 
                busybox-1.35.0 | 3 
                 dash-0.5.11.5 | 3 
                  exempi-2.6.1 | 3 
                  linux-5.17.7 | 3 
                arp-scan-1.9.7 | 2 
                     frr-8.2.2 | 2 
glibc-2.35-96-g2c4fc8e5ca74... | 2 
         host-gcc-final-11.3.0 | 2 
           linux-5.10.104-cip3 | 2 
                   perl-5.34.1 | 2 
            qpid-proton-0.35.0 | 2 
                     refpolicy | 2 
toolchain-external-bootlin-... | 2 
                  zchunk-1.2.2 | 2 
                  acpid-2.0.33 | 1 
            altera-stapl-0.3.3 | 1 
dahdi-linux-5c840cf43838e06... | 1 
           docker-cli-20.10.14 | 1 
docker-proxy-339b972b464ee3... | 1 
        edk2-edk2-stable202102 | 1 
                    emlog-0.70 | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
              fstrcmp-0.7.D001 | 1 
  gobject-introspection-1.70.0 | 1 
               gocryptfs-2.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
host-gdb-arc-2020.09-releas... | 1 
             iucode-tool-2.3.1 | 1 
                  jack2-1.9.20 | 1 
               libcap-ng-0.8.3 | 1 
                libglvnd-1.3.2 | 1 
                libressl-3.5.2 | 1 
           libwebsockets-4.3.1 | 1 
              liquid-dsp-1.4.0 | 1 
        lttng-babeltrace-1.5.7 | 1 
               luasyslog-2.2.1 | 1 
                netdata-1.33.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    pppd-2.4.9 | 1 
         python-greenlet-1.1.2 | 1 
                python3-3.10.4 | 1 
rtl8189es-39c17661136da48f8... | 1 
                  sudo-1.9.8p2 | 1 
    toolchain-external-bootlin | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
x264-35417dcd65a57321fbadf9... | 1 
                       xenomai | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/9b34d12008c7dbcf0f457508092c9e6d6cd64bc3 | ORPH
    m68k     |       altera-stapl-0.3.3       | NOK | http://autobuild.buildroot.net/results/47dd743e632a13314ebbeda1847b6d04e0cb0ed9 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/237656d0035571f777be8de17147538bd439f43d |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/38757daade5a5d7f65b5b7920a53b56fbd612215 |     
  mips64el   |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/e19138d4fdff865b6eef068d2a26f2d1035bdf92 |     
    i686     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/7a724bcda6165b247f66ee82780b4ababfc0fa2e |     
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/a43f376413af6bc131bd89c5f1ecdbdb26caeefa |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c33e4fcb71e06b8c7b3cd8e98891ee39ed973b17 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f202f8573319981b0dee635341f48ea5f24aaf4a | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/556a1c4815458ea263f683cee2c5603c64ba9e02 | ORPH
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/9437faeb6375abbedcf8b6f282d252e2c8d50770 |     
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9e9bdc72c8d5324832fb09ef8e54c955652bf1ee | ORPH
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a43675a8650d29e8359b2f2283f6b0a68ec93351 | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9cab039c80624d336a48483766960c7d6bd15754 | ORPH
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/2210c325fcbb5c6387b1404787b64002dc4d1296 |     
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/caad167bf8abb26986222d25ab81dbbf6fecb197 |     
    i586     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/e52598c668600fd2bd5c3de6963a64aa48c42cc0 |     
   mipsel    |           emlog-0.70           | NOK | http://autobuild.buildroot.net/results/75ce3250223adfca3442eb977c103da97ec70c2c |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/64cc622343977acef3bf210e9b0c7f33679fc5b1 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8249696e8aa2a22f66e896e58c3ad2becca8b6f3 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8cb7c88fe2044808b8fd67c9fa9d36b0b8466a4f |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/84ff18c94a5ac398e2e0cc12a6523f3acce717cc |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f8156dc64de77f8a03a030419046b2ed008cc635 |     
   sparc     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/9970ba8856a885bc6bed7bf64e8cedb1197e0313 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/6754b3b00a9c54b45a212daccb3e7bd3b270d0de |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/adfc136b6f38bc43c89e1c5a3aef48001ce0b0c3 |     
  powerpc    |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/4925c26a427659083dc688d10d480a47cf44a805 |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/1e9ea87cd029de81b9bd90c2c086cf2a8e6f7f6a |     
    sh4a     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/38016aa0a192388da4018d9c54856ab4f6f2a5cb |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/b436cf8e45539df832cec39f198634d5356628ef | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/1e46f77a95da570c035b482103d5bbcb92a0345e |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/5b029e681077edce4237152f01197211b0101775 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/503a845f8974cf36c2c21f1074e24c5f900d884f |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ee089508aa80d69f1074a911c8d0871c8a2b4352 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d8a03b67ca51c78c6f98198478f5e91259ba630d |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/50e016b580cd2c522b97d77aac0e56509e3b9067 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3de64917e30a7482c2d269e7c910bf902b247a37 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f1d97647bbd611c2c3fbdcf7388188a4dc292129 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0f59623faad4699882bd0dd27ea29f187c2ba84e |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dc1f7448ec7db2832e391993f44fa2e18c80ca46 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6f2782267470d585d8f1d34ce3c3e40a908e7c1e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/01b6864dfdd366a458a9632854e05f241ec41a28 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/80e2b34cc2b50491d664eb44d40d0c81781b547b |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/69e72cc73f08c82f6ebfbf47202ec8f2e320d3c8 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4e199668f79f6549242fa619408dc593b778dbe6 |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/91899960045ace1f87a95ebdb98fc08f63142e52 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/438fb08b246eb42435d3381c01474e23990988ce | ORPH
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/e91c5da451aed1576625b4cd8acdd1191e8489ed |     
   mips64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/efd92a7a81c6a7d609e9c43cd70d647e8a824fb4 |     
    i686     |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/f97f26675ecdc2c955b212bdff66f47cb435da0b |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/7adc34259b83c3d1d959c19e801d968b8e4cf576 |     
    i686     |       iucode-tool-2.3.1        | NOK | http://autobuild.buildroot.net/results/d89c9f390140cf9a25d49af59d68f117ac1e33da | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/7252fd4394bf1c3b5946e9617bd510930bbb8edc |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/f6c697fdc1797e2e1f70431283b122e423df06ba |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0f28ce65f0cdd587702443e73713ce2d8815e1f9 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/47fb81056f5f3dcaf63c71cd467768453ace32c0 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/eb8a01228ca3d3856e3df12313471ddbcff02e19 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/60c4d7f7640c66bec105fa7a82141f3652824dce |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/281f215cd08b23fa2b0b14c184d07e43c4b0b02e |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4e4736aab60052bc792717cee2719a9b7bc39dc6 |     
    m68k     |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/8b96a946ad7b2e556036b05661254331f06793ff | ORPH
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/cd8315ba4d37d2dae520bb1058f6fe10043dcb26 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4a7fea5f76e92d361cd8545e7391f548a62408d3 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/03a9c06d3187405e627e15c5b486357520dc3762 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/aa2687ea72508948eacfc9276b71f06251bf750b |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f05044887b3769de5053a7abd65eca050086d7ff |     
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/c2f5ce44a8971778e9706fb4e9adb2d36f03099b | ORPH
   arceb     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/a12a5c20a759d0fbbb5ff4c2ebc893dec759801e |     
    sh4a     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/08c472e61f38263bb2feae9fc7115dad9f554535 | ORPH
   sh4eb     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/bf348ffb42e619846d53d192ddca208fbb589a65 | ORPH
   arceb     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/d42959f47bd9edd899b8ba9e98fc863dfcde7039 | ORPH
    arm      |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/f3ac6a4cd7ab88cfb4f082ecc28818de75d973db | ORPH
  mips64el   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/69440e796b570cee52dca778a8b0826172b19f09 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/4afb1e05e4a0be6c01317798a139457895f84506 |     
microblazeel |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/028f6682d404a6f8f7c10cf4568247ed1db535fe |     
    arm      |        luasyslog-2.2.1         | NOK | http://autobuild.buildroot.net/results/33ee5fa752f4520626758052f74e0276f47769ec |     
   xtensa    |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/6c87c0d1699fd518a989cb81a191419f427accc5 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4576031fa6eb20d2f32ab4ae54cb4492954b272a |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/381738eec6a5f20967c41b20ff15038c987d3286 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/313b787d17b7610c834be21ba963c12bea7229ba |     
   xtensa    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/ebbc27568e980b860724e1daff4de537a687f7e7 | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/aa40f0a924d44b8041ee030bacebb62287c3b45f |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a76df51fadd0d0ff4222015182e6e22e7cc96ed9 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f6802433c41afcf2530978cc811bf53d1917bcf0 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4fc0f7305b685ffb242569c7dd7e22ed060b0d46 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d74c62fd3956f72af2f772670ad54af9178e6f66 |     
  riscv32    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/1ca3419139d64f78d22a443261aaec364c4842da |     
    arc      |         python3-3.10.4         | NOK | http://autobuild.buildroot.net/results/d8d3cfbb1e5787fa1619f972e1ffa66e8456cf33 |     
   s390x     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/285d2b049977a8d1e5a62d03537d382f0f6a88d8 |     
    m68k     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/c0d29f9f76f3f700bdd63f11762a629cbc1c5954 |     
   nios2     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1a2b37a01e8e5fc7d39bbea22ee35231f8e49193 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/8ac1d1ce1ee237227958dad9d351fd7c7adabfb0 |     
 microblaze  | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/cd72a16f9bbf5e03c74fc90798c4ceb10cbd9a74 |     
   mips64    |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/c4a6c5f79d26ab49354db6d8363b687a9c6051ce | ORPH
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/08720bdae59d113f5356386e2e80b7bc6d9469fe |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/3775a7330da26c738b692e973799c6890150739a |     
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/14184cf7027055c1577402509fbbeb1a5132b288 |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/a1d0fafcc857342b478ea48d6c6bc825a02162de |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/50d4604f65d497d528e34cd653c58d11954a7291 |     
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c853c7073b3d6aca3c0d65ceb2a3038d56201d72 | ORPH
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8ba05f202ebd76146895203a12abf06389ece479 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4fd21eefe2ea835271f9eed385ad984f9f4d82d6 | ORPH
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f22f34ec174192422b0f88cd074619506947820b |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e904c9bf81db1b8550a2e065c41bf856b27123da |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0745bd7ebebb12b552c611404ec0dc12724f5ddd |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/16931016aee9437389df6e4dd8575cdc9b9ae77a |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4bc94342dfbf8185115bf588cd3bc52b4e7dd043 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c22927f9aeaaaf2d363b892c354b3a05eafc631b |     
   armeb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0b149faf84070e34aa19fa451f72120ec036caf9 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2923da48e17f9ad188e20600c99be7423f22f760 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/380bb05509091518da262122dc1811f5c06770b6 |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/faa7ef3c330f33ee8e6753c5fb3cc7f9c267b267 |     
    i586     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/fae1eb40e9bd5fa43e9744f7b820176d4c9c15bd |     
 microblaze  |            xenomai             | NOK | http://autobuild.buildroot.net/results/a8e96583d804152db58a1bda299ee30149d63979 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/7ca47f0ad008759551cdeb28df238ecbdf4cef42 | ORPH
  mips64el   |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/2f4730bb19163f071702e8f7e00623aedba7b275 |     
    m68k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/68997f68b97d622de471d705a410c2c133dd55e4 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/df3b9e79b70a8bfa4307c4bf9f48d8f663f86d33 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8464538b8ac03321d4cc7071c97638cd6f47e47c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/41d89a1f0514f86fd2faea126b8ed96e4a69add9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5c217c23108d12bc38d62735f3d31ded6525018e | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a50eca22bac59724b81e8d86c7ed7ca51fed680e | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f99c5bbc465a0ab61f06de39209581a5d128306f | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 
             host-gtest-1.11.0 | 1 
                nodejs-14.18.3 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    ruby-3.1.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/10669a8398432f915967164e670eebdd90c2c1f7 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/bffdcfee69425897ca0294de5e7a352018dd22dd |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a457e997fa65843d27af2c69fab581bb6b3d43ba |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/7e59f32977e861c26c4fb474e118430a7f3db3c6 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4307b81e4cf8d81de1b572fe282ed4f3fad5559e |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/bc965f23ab4d015ae9e340557022c71d38278bef |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
