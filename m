Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43710C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Jun 2022 05:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E698297F;
	Thu, 16 Jun 2022 05:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQzX6hFgZTkL; Thu, 16 Jun 2022 05:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7713082F4A;
	Thu, 16 Jun 2022 05:39:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66EF71BF8C7
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 05:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C76082F4A
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 05:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwXZ1nyRSHqH for <buildroot@lists.busybox.net>;
 Thu, 16 Jun 2022 05:39:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D3178297F
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 05:39:24 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A7D9B200009
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 05:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1655357961; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1xct1A7dU0qFVy5ftGmDY7ozFxSHPpTBJdzyCkxzWRA=;
 b=N8d3uQ2KcIOadf++rWbSS6bYYf0cpqP6/0YkNSRPBckPrZxH5p2POur4WvVnR67fOsCjsU
 +Uw6Clpnw4Q69Fbh5mIoR6pLGQIJpD23bLFQJltw4QGlKJg99/7PYcK54y8/AXmNFuddpX
 DNIqYaiSDbcZN2y2++k4oI6z8LUm/k2tZFbe5sB4wxdyv3MkXloLTCIVJG68SeYO1zaamh
 yLXjmmil84Y6cylJMAw/Qu03B4g4REpXmm748kpAFo7FKAkTu/QrlRug927dK26C4yT8KC
 la/Puf37ZMfjvHufgOYhXOgkIirqMPqfS5Aq0+qpGJRXRecHpWoRuSwagv4ULQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 16 Jun 2022 05:39:21 -0000
Message-Id: <20220616053928.4C76082F4A@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-15
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

Autobuild statistics for 2022-06-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 17  |  4  |  0  | 21  |
  2022.05.x  | 20  | 31  |  0  | 51  |
    master   | 207 | 240 |  0  | 447 |

Classification of failures by reason for master
-----------------------------------------------

              alsa-utils-1.2.7 | 23
                 uclibc-1.0.41 | 14
                iptables-1.8.8 | 11
             libopenssl-1.1.1o | 11
               protobuf-3.20.1 | 9 
                busybox-1.35.0 | 8 
                 linux-5.17.13 | 8 
              swupdate-2022.05 | 8 
host-pahole-73383b3a39afe86... | 7 
                     refpolicy | 7 
                   uacme-1.7.1 | 6 
glibc-2.35-96-g2c4fc8e5ca74... | 5 
                libressl-3.5.3 | 5 
                       unknown | 5 
                 zlib-ng-2.0.6 | 5 
              host-rust-1.60.0 | 4 
           libfreeimage-3.18.0 | 4 
                   perl-5.34.1 | 4 
                 dash-0.5.11.5 | 3 
         host-gcc-final-10.3.0 | 3 
                host-go-1.18.3 | 3 
              jpeg-turbo-2.1.3 | 3 
                 pixman-0.40.0 | 3 
dahdi-linux-5c840cf43838e06... | 2 
           docker-cli-20.10.14 | 2 
                  exempi-2.6.1 | 2 
               gocryptfs-2.2.1 | 2 
       jquery-ui-themes-1.10.4 | 2 
               libcap-ng-0.8.3 | 2 
               libglib2-2.70.4 | 2 
       linux-5.10.109-cip5-rt4 | 2 
                    musl-1.2.3 | 2 
                    ne10-1.2.1 | 2 
            ocf-linux-20120127 | 2 
                       xenomai | 2 
                xenomai-custom | 2 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                  acpid-2.0.33 | 1 
                    apg-2.3.0b | 1 
                    bat-0.19.0 | 1 
                  bind-9.16.27 | 1 
  binutils-arc-2020.09-release | 1 
                    bird-2.0.8 | 1 
                bitcoin-0.21.2 | 1 
                    brltty-6.4 | 1 
               erofs-utils-1.4 | 1 
                     frr-8.2.2 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                gnu-efi-3.0.10 | 1 
  gobject-introspection-1.70.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
                gptfdisk-1.0.9 | 1 
                       gsl-2.6 | 1 
gummiboot-2bcd919c681c952eb... | 1 
           heirloom-mailx-12.5 | 1 
         host-gcc-final-11.3.0 | 1 
          host-gcc-final-9.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
           host-libaio-0.3.113 | 1 
         host-protobuf-c-1.4.0 | 1 
                  jack2-1.9.20 | 1 
              libblockdev-2.26 | 1 
                 libbsd-0.11.3 | 1 
              libgcrypt-1.10.1 | 1 
             libsndfile-1.0.31 | 1 
             libstrophe-0.12.0 | 1 
           linux-5.10.115-cip7 | 1 
                   linux-tools | 1 
            lttng-tools-2.13.2 | 1 
make: *** wait: No child pr... | 1 
                 mesa3d-21.3.8 | 1 
                mongodb-4.2.18 | 1 
         multipath-tools-0.8.9 | 1 
             netsniff-ng-0.6.8 | 1 
                  nginx-1.20.1 | 1 
                nodejs-16.15.0 | 1 
               openpgm-5-3-128 | 1 
           powerpc-utils-1.3.8 | 1 
                    pppd-2.4.9 | 1 
           python-orjson-3.6.7 | 1 
            quickjs-2021-03-27 | 1 
                    sdl-1.2.15 | 1 
           uboot-tools-2021.07 | 1 
uclibc-ng-test-0844445e7358... | 1 
                 wavemon-0.9.4 | 1 
                      wine-6.0 | 1 
                 wolfssl-5.2.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/caace3e57caeece9c67954b2e01f0a79b70c212a |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/6b7a88dd11e913293d5442763d184c46079653e5 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/00c1ad96bbf8ee72ce716b67bee8197de502957f | ORPH
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2aa2b86ab151b28e7ff4b27c3ad2068d78c83ac7 |     
    sh4a     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7bcab507feb9c8d4b7332374b285eb699568d146 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/16ae99a67a5f6107186b2be6c13ebe806652a6e3 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6e5257c2389775e72c29ef142c9c8fdadcbe724d |     
powerpc64le  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e077105016ff3dd622479e9377b066106b66ccb0 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5978160325000dcb79da746adac4f2abba76547d |     
   armeb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5450afdc7bced171e82d774d8f76b7c75fced4b4 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/139716865dffefc8533fff2ee4e13be99a0d5f86 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7ba9f550345ef7fe0cdc2a5b93cafd92171ac2ae |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/708aecfafccecd99f8a4178412a9dd0cf9123f72 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a42d442833d6c126130e3706c20c6053266c842d |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d136228c94e239575a0f53a03afc8bd7d2caf6cf |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/327c188c96d7b307ecb452b4f54fcb0bb2ffa110 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/01f05521b11415fc3c137d4fa2aa7821234d8129 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6bb1d6afb294fb73485c4e62c0720fc30a9d0b6a |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/58acecb3223c9c82c69db97b18d9be56c580b7af |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/366aa43e82615e2a5a36fcb98b3bdfbc5e99786f |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/56ead0e109b0199fdafe09a1fa8dca235355178f |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1e00ec16be8bdcb3e91adb8e135080da964f1a26 |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b2c6b9c5dfd0cfdaf88adb362fa7ee17438cfeec |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0217df25570602811fd140abf765e7df9f2eb479 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8ae06b482044d3f033558de83e37097647958dfd |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/77e5a3c9526b5aafe0f13d3906db32ef6fc7a256 |     
    i586     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/3cac02539e341eb686ba0384eed8fc615677a4e1 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c85426b6a28c7c70b1722b7c5250d36cc557cce1 |     
   sh4eb     |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/4127a726d804ac4b8657f18cd3e2e077b0b7559b | ORPH
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/7c27e4c4b6a7a82a10f0c6ed67f333fd5d3b0b78 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/37ef64be881c7da7215151bb7ebff9ae6f879bfe |     
  powerpc    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/75e8d33f8ec608a936cc0941ea515f1ae13cefac |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/0bce735abc90dfdfc7195a0f741ffbdb2821f82a |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f04e632d71b67735274780b38022afe7016014fc | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f0b906017590894fd746bfcbdc28d690abdcafc5 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c40d88de8ffeb08f91790d6b5c08b668b2d6009e | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/64f5ed2b9342c539019eae471c6645eb61a0bb7c | ORPH
    arc      |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/623da27fca39be0de3cd2b858f57af3a1318160c | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c7b08220c1fb2e00334eb59e1e84341bd0d33448 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/dbfbfe235d4b4b71570e67d15be931eb7caf86d5 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/dad7df9a49ba95d589307e0084f628f7967ad205 | ORPH
    i586     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/8e92360eed9edcda596ba7520ca68ddd9f0544be |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/13d7f4ea01d9286af85dd9b0c66a6b7afc0d58d4 |     
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ac237cc1c19c737fcf982517590588db40a25927 | ORPH
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f15ac0b797a3306c7cb7defee189aa9ad8534fdb | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d771e86f75f213ed2c75ef26da1d5d6bfb530461 | ORPH
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/7364fc3e2570857d4e99a3502959b94369c5723f |     
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/43909aa0864c2e44a309d96a0bd1cc76c01bcbaf |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/846f970c6f1691451d107b0ceda4e3d20cf3fc16 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/2c510ec30ab2718e4ec856b9488f1a62d4703165 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/7e87966e94363d84393750c2595872eaf3bd2ed8 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/7c83c299f7c8c7383f17c83e5fca89d979ee1009 |     
  aarch64    | fs/btrfs/btrfs.mk:55: /home... | NOK | http://autobuild.buildroot.net/results/1e8635b50855d782a57232e80ebea8bf79701557 |     
   sparc     | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/b65bc159edaa36a6ef549fe6e181aa2a19a2f628 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/35870900b6b7ca0e5214957fdd1f21564a51deb9 |     
    sh4a     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/508cbc1c3b9b9ff64634058b572f04044112ae84 |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/21a038ce0b42d8ece69a1871b1fb696f879114b0 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/cca5490668968faf76588c1e823c86542c193449 |     
    sh4      | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/31c2bada86df3a0bdf7d9864896ff71681b04744 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/e42c05f4a06726a2c216a6c20c392698d5b88e58 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/7ce22477cdd085da71b00a529a8ecc8db531f9b5 |     
    i486     |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/203b776bae998c0300c3c2f941f1902dc5cb62fb |     
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/f60454c4b9322eb071811efe86bb38db10c70dfc | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/f58642f2e49da3a3af9d65eff082b910cb4eb5a1 |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/b21afaa433990449e7f8187d1100dd1952bcc2f2 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/460d6b95ef4e458c906eae97c0a9f188821d0d4a |     
 aarch64_be  |         gptfdisk-1.0.9         | NOK | http://autobuild.buildroot.net/results/cda9718d42b9583971fbd64bb7684301bd77906f |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/fc0903097fafd31f86edbb084d9bb39b14d0391e | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/ad8fb683f989ae276401ebc58aca502562dea498 |     
   sh4eb     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/5538545355e51d00efd28d7f58a3eb830e000097 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2cf64ab0894651f1033b2d9c3a189635307a39b3 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3e733c29f3c7e1397634962ae50937f6f49f5770 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/25b977f3c2daf3789973738658855a5296fb1090 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e87960ec56a561925a39f8adff22b83447126b39 |     
    i586     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/38277a8c68faacc4fb783516b7a8fe41646d6902 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/eee2e97606615c16d12a22935ab500cdf0646d8f | ORPH
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/e4fb50ce87c309f15eed3bfb74615c145da505fb |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/d22808191933b8c8a9997889afa419ff18667510 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/23191c6ed48b56f5156363c3615e074f7f87802a |     
   mips64    |      host-libaio-0.3.113       | NOK | http://autobuild.buildroot.net/results/c7460a363dea23353b3678a7abb26329a983ecb0 | ORPH
   sh4eb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d0d660621aefbb32e56f8363a55fb35c31143b6d |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d66b614ca44e62622462c0a2f36847d8a5334b8c |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/76b240c671f8a1bcd9dfeaecb6c5f825b61931ec |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/10a07a9156200a78c9677327f120ae92ccba1708 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8aa747dfe2e9f4c50d2b887b4bc1dde4dc54b5ea |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/68942249d280bfb02b252219dfa4b11e004e6c10 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/065e4705a7d557152e679613472e0d5f1b03cce0 |     
    or1k     |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/3e4f59a7eddcf12dd6003a907d19d41fecef89ba |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/86adfe836bf33ed93175adebb0151112d88107ad |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/18faafbed8a4cdb5e36757e7ca2673a6cbb81307 |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/bc9e5431439f0fbc1786d33f35e158292182f847 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/966eecf28ad645cdf951d41c46e8482559dc2fb0 |     
  aarch64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/1dd365e3b5e0841d65128559b54474be9b8dc09d | ORPH
  mips64el   |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/88c3f0cb3eae5feec15e6abdebee774d4da8594a | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/b2ff1fd3e21d2b3fd443d4e6817985fffb4ac2c0 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/4460d1adbd9a2955186e9b819f70f3db249b9133 | ORPH
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/f425ae9a76bf7329f1f0bfb15cafe9d838657ffc | ORPH
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/272a33840a12853ed317c9ad3f088accc547e1e4 | ORPH
powerpc64le  |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/d1f5cf3eb21cf937f9b879a97303d1a397b78d57 | ORPH
powerpc64le  |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/d16ace7638d7c277d2d815c0363694b1c9aca834 | ORPH
    sh4a     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/29299604eb8052523ca37f9ad076701fddd5bfb0 | ORPH
microblazeel |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/1f47ede91daa367fc0739a1a59cc1b993b5e83e7 | ORPH
  mips64el   |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/5d3191147b6e43f3f72bc4c986170a2e7cef8976 | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/344991cdc11d2e596491fbd76289e9559952467f |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/2bdf8df150facc1ef810cf1fc5fc138387690f63 |     
  riscv64    |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/ec7691c668ca910a1a9568581f12e1d1ae23459f |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/8535dee564fc3d642823b2ffc8d5111c9bed3787 |     
  powerpc    |    jquery-ui-themes-1.10.4     | NOK | http://autobuild.buildroot.net/results/79cb0d7456ece0a88b538c138a56fa585cf1549b |     
    mips     |    jquery-ui-themes-1.10.4     | NOK | http://autobuild.buildroot.net/results/b527f85792c6ae4eaa4b9e4545cba603ab9674fc |     
    arc      |        libblockdev-2.26        | NOK | http://autobuild.buildroot.net/results/ae7ef37abbd82956ee3d234dcdce91f45789452e | ORPH
   sh4eb     |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/9135a098de46f25b605735ee6c891040ef819483 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c0cf5d6167c712b562f3abceb42a8b80c98dc723 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/13c3f5ec8ec90f45d97be95d16fd8d70445e0ec7 |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c13dd78c90f8453c330ad60ce0702ae812e83520 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e2f53f82d3ad6c6e4b002cc3f5506c38c79c8a29 |     
    sh4      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e2779cef75f94dec8aea16f72728a5be8a156d9e |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c021de646276b74a5edcf6aeb409fe5498afa3e5 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5d8c5a7c56e2f61bd2b1ae92d12de79b3e9de162 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/9894681c4de5d29292b487c1de42faf8bef685a1 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/398cb090d674af3f5be4077e1ee552ee75a94bb1 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b38719de9ab8f42a679636a1309fb9aef163b3ec |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/fa8bc8773b0fe006e4fbfc28c0142921dbb92e97 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/002bc0d6887b19e3c256d2074a1bb8a9ba742747 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/47d20228f8fe15901384c60cbaec9b61442e5394 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0b3bca779c30350edcdad7170f2ab82afdc58125 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5878b00420ec005010e93f1482453dbf369993ed |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/315f3c1a08a84f6235cc655035e32e5c37bd05e2 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/617239c1d394024732cfc3fb2c7edb360e6155ee |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/abc08dad1f8e86dcafb3a4ff6fa48ead7f1b71af |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/94883eff2688aa05cffac396bbacaf251ca2adce |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7f6ab97d71a49aa23f37b98b3187d607984a62b3 |     
microblazeel |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/43d9b7a1ce69feafdfe8fd6355f526fad59816d4 | ORPH
   mipsel    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/8c8f93c5574db49f8e79973017af0bd36ae8576a | ORPH
    m68k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/b9dfb77e7f784b30d132f90e44d4f33a3af8c031 | ORPH
   mips64    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/04c4cea5adabf77fb1b3b2a5c4da4917772d4d34 | ORPH
    mips     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/b95c2d241e9500a6ddde3b19784fe74d9ff330f5 | ORPH
   arceb     |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/5e420ed0c61d0de546122ddad2204665d8b4262a |     
   sparc     |       libstrophe-0.12.0        | NOK | http://autobuild.buildroot.net/results/0a3737271f3cde8debc47292e5c91b8f2d794efe |     
   s390x     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/7700eec38e29c41410dcce56a8f0a8680d595187 | ORPH
   armeb     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/9e6b528706999f457cc419e70e91e81b4d978abe | ORPH
  aarch64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/486fb0d816c7899bcee6693723629abb68c9a314 | ORPH
    sh4a     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/3498ea1440ba6225993a244dc07b7691660bf7c8 | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/2e93e956aa4bba727cbd44fc16fc9062e23ed196 | ORPH
microblazeel |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/ff8858e24454d4c7b11417d4cf535f9000afb6c5 | ORPH
   sh4aeb    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/3263ef7438d56d27eacd2d1c66f81caf304fac80 | ORPH
    i686     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7a851c2a298441df8df06ddba54cd03d65c1ef2f | ORPH
powerpc64le  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/d2365c822b4873c64dffd93d6dd482cf136d89f4 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/e3ae20bbf2fee63bcb86570d978e838d651b2ca9 | ORPH
   mips64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/6d8b4f6a7408b91c5af34d2fea70d167bdf2b069 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/97abe3f1e7e7aaf193babbea50640ca8f8ad6489 | ORPH
  mips64el   |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/a27ed5b26d848c74378aa533d436d40f3d2f4bd4 |     
   mipsel    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/66b7d022b2e0e2b9472e44537295569482b6db0c |     
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/55d03e68a6df9f3ad80fbef56141aa815ea45cad |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/1f881a87cf8fd918bce6cff118833505ef0e583d |     
   mipsel    |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/f6190dd0c3f19cc9182a562f2c5f2c6443651e9d |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/06386b1b8cfd1259c23e8375c336fc725e06cb59 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/77099f4280286549eab3117e30fb3a64098cd54e |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/63b8000833424a14839a9db4a9c87bcb46ad6f0d |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/b93e8f326b95258700171e8dbe1882c00ded9178 |     
  powerpc    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/760abe70c02d36dc88ef70748ccb28c352511c6d |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/7cbce65ad666431b0de85ed514b1eff9d14def17 |     
    arm      |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/771f9ac9cf34313fe5dcc928280251867edbc34c |     
   s390x     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/9119b3234885cd73bef6817d0b5f53e58b56b050 | ORPH
  sparc64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/0023ddec9ddf557c333e17de6792160c390f366b | ORPH
   mips64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/895550211268514ecb75f9c9fba6cfe37ba9fba8 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/728b30c33afe2842a267a54b52cb0b2ea46b7d97 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/9ebc542230423c1b7da35fbad60cd5b6b8d29bd9 |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ed412007c408093470a8221db18953a087593847 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a3af429f49d5ae7495847963fe959271dbb32c88 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fac176c881b78d65628b73d5a06ff82837c00f53 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5837020dbf6eccd3c31f2ffa2ceebd6c445d2bc2 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3556b3871795104f4efffede6de489b94d3f03ee |     
powerpc64le  |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/1fe69c4f2072eee2abe7142438b9e6899b975af8 | ORPH
   arceb     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/3d55766c4c8484bb7adbbbcbf8de8514fbf632c6 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c1baf436e271bd156e7979019e8afa3c72324b68 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/aa041d95364e341767703be0828fd7171504964f |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/cf5157bf67f43c1d5f8d45acdf7e45b0ef6504a6 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b0fe8a6caace0cc37454af517295f1b05c14bf21 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7f4d75e83e21e286e259d412fa911eebba22c71d |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/abefe16c1e0b589eb02e3a706661e5e699f88f0b |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/624f935a8aa615c46c4c79e03074384da5470104 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9bc02b12f77e5187ab10be59b51fe06b2753f7ae |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bbf2391b82c738d6caa95b9c5831ba4e9221afea |     
   s390x     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/db739cbe1dd11ad281d6c14bcdfc6ead7e3587b1 |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9d742b488a1a80f7d05e260c972036b7333d58f4 |     
  riscv32    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d36f64ef3597714c92714f55d05187e3ecb109c8 |     
    arc      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/a0ca0cb39f8f4d7656d81699eb436664e502f03c |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/46d72189d4dd2be03afc825b9aa7e81b162d27e0 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/723215d2e19b65c438f85f77e3439353db1f737b |     
  sparc64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/450aa3a553e8a923be514908f21af7ae35c4f6d5 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/df5b8a8ab49d83870899dde0951cdcd2b471965c |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/71f181a5e5f489274dbbae4030ce44a6d1c622ba |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/7ddef94be8fea3f2f62c7914e78f280c40557dba | ORPH
    or1k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/ac54b921a45d1ccd1a62b75812f030842ac42d6a |     
    or1k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/8e59d2586acddbe27a0a55776141f1bf4321d323 |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/920be6336914596cd8e11093f46fda84fbb6d25c |     
    m68k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/43276079c0b104d2d96a41e61656d5f8d11d4f75 |     
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/84c02e579097f49506dfadab6ce3de2392464bd1 |     
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/4fbfdae2827de6170a9294b8b033145586af06c2 |     
   mips64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/c9ee4c31bfca0cf2ab5a953017c3dd2764384985 |     
    m68k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/6be4efcd9a99015dda97955fffca9a009498be2e |     
   mips64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/cd19ba6dd832cc8bea5f8c4cff8b81d9ba756a0a |     
   arceb     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/3716e23121c9c87130569e47e83c0889dc715970 |     
  riscv32    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/039bf4ebe6c0617a5e510e220271c610c0ba72a9 |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/41ad82a4e830d852c9439eb87211ee751b21b7c9 |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/4f36e98199d7981f163427cf942ccb7c585a2196 |     
 aarch64_be  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/f0b6512cb3a7d84cb5c1ebf8f8abc77a74f8f870 |     
 microblaze  |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/190d688e64538b0cc0ea7546f0f0945e146b7e6b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9b20b6c5a1ff37308a27cd2a79d26f5c03aed13e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7726031b0ff7bc2f57f9ad26d389b6edef016b57 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/5f6563910eb16035259929f221842359b2c3ebb7 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b2c67ff6067c392a16a5f5aa43ed1dd6fa7af7cc |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ca482e021f088bb2c3f6628a8f6534760c60b778 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e2ff37f237200260060ec6986bcc0017f06617b0 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d4f5dd7297132c6fbd360a8aa839d2aa82b9d3d1 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6034952f612b97858be46cc117c8961037a7cd7c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9923b028b2f6a805fbd04e64493811c3935442fa |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/dbee581405e886503d255c1a47dd908f4ef42d61 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/982b1e6cdd88a6d6ac1140013d3663cb67bb9985 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0f616c0c24e059bceffa2d27240ff9dd3f3afa10 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ff177b3a55716f0185b2387d48f1d5f98462f2d3 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7180f1131b1eb6d3d3f8223f6d9ae6a6f197133f |     
 microblaze  | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/d4d4a3b7be65b5b8d601ea65e6e0a184e201646c |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/8df700451b8ac310259971218d6e30c433638b1a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/afacc7084603eea1d15e4f8c02d7009abe8ea5d4 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/30adfc2fd0c5f36594dc3de46918d788985b5bd2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c6e5079c9546eb5f8e20e1bd9ebc8925df9cef0b |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/4e1af1ad996f687c0e952b72fc40648348705f33 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/256b480ff1d236f2f48a4bc1aee019bd1fc35e9c |     
    i586     |            wine-6.0            | NOK | http://autobuild.buildroot.net/results/a866d65cda97845a8c829acad2c057bab00cde08 |     
   armeb     |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/f569761e19cb0698bf11d90db7a93a29c1e67680 |     
    or1k     |            xenomai             | NOK | http://autobuild.buildroot.net/results/54b5100d6f57aca6cc4161377d69e1555e8319f6 |     
microblazeel |            xenomai             | NOK | http://autobuild.buildroot.net/results/b5d47ff68faaf8e9cb91a45a20d0b6e811c09d55 |     
 powerpc64   |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/cbede77e4596024061661fb61d6d905422223327 |     
   sh4aeb    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/93ba7805b24c90e3707108899e8f975b28e3b87c |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b58e89d96ae56e7a2392ad6646888e1ebbab7e92 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7bd54f42d1b66a02c227211d2e6b3f381ed6cd21 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/70f8c19d78c2e5b1f6a661d038ae02d1def44d2d | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/670ec06c9f291946763114dd0fdb00294f3bcc44 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/49583db0c3693be55e7158186c376738cdee3e89 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

             freeswitch-1.10.7 | 1 
               gocryptfs-2.2.1 | 1 
                   grpc-1.43.0 | 1 
                 uclibc-1.0.41 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       freeswitch-1.10.7        | NOK | http://autobuild.buildroot.net/results/cfe16cb37e49117c252679647ba72f0dff1f3680 |     
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/dc4c7876115eb44cfff5c6e82793df251472418f |     
  mips64el   |          grpc-1.43.0           | NOK | http://autobuild.buildroot.net/results/e05805fe4739fdb9a6bc475040ba228c9b239ca8 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/90f03f516172ac5544eb74281b3d02c37e0b8eb7 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                 uclibc-1.0.41 | 3 
host-pahole-73383b3a39afe86... | 2 
           libfreeimage-3.18.0 | 2 
                 pixman-0.40.0 | 2 
                       unknown | 2 
                    bat-0.19.0 | 1 
            btrfs-progs-5.16.2 | 1 
                     exim-4.95 | 1 
                  ffmpeg-4.4.2 | 1 
                     gmp-6.2.1 | 1 
               gocryptfs-2.2.1 | 1 
              host-rust-1.60.0 | 1 
             libopenssl-1.1.1o | 1 
                 libp11-0.4.11 | 1 
                libressl-3.5.2 | 1 
libuci-4b3db1179747b6a67790... | 1 
                libzlib-1.2.12 | 1 
                 linux-5.17.13 | 1 
          lttng-modules-2.13.1 | 1 
                nodejs-16.15.0 | 1 
                 omniorb-4.3.0 | 1 
   perl-crypt-openssl-rsa-0.31 | 1 
               protobuf-3.20.1 | 1 
              swupdate-2022.05 | 1 
                 wolfssl-5.2.0 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/3158d26756aa2233d08f4541d468bb1f4ae8260d |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/aeb185bce362836f83ddd494db09eaccaa821fd0 | ORPH
   armeb     |           exim-4.95            | NOK | http://autobuild.buildroot.net/results/5c60f0d3d60d92248a275d627f920a4595a52012 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/7493dc2e49d7ec49b2da1d7f7417a06f9aae1f47 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/f9fce56a4eab4f1b208e4945cd1f6e89a0947ecb | ORPH
    i686     |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/085d263f13ac9f53fdd13eb698a4a54d88bdfe69 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/79b08710189e5b8ca33d8d31fdeebc0ea8b643a5 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/bedb80f9d30b0620cf45f7a967b4cc551edcc59e |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/a9ea6007426f2e7f789b95b610833499bb597a02 |     
    i586     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1bf44e5619a14e006edb374f4b95ba188bc90020 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1b71e21c768849702c5895dce1fae42824ae076f |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/312bde64bea17ac36ee2d5cd81733c75d682fdbb |     
   arceb     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/dbd17e629e9f5cb1d8fbb2abfc391c97fb751f56 | ORPH
    or1k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/11c8e06ceae5260f8079089e28bfb3ba37466680 | ORPH
    mips     | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/1972ae64b8c167f26554f4934ccc276a0b1f53fb |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/f44ff57d74ee01fd749c96e34d83d07ff1135af5 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/85b8180abb5fa97979f069b216fe49f23666ef30 | ORPH
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/568abc5995e841d229f00686f2582e589b87c6d7 |     
    arm      |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/2e57c25f83a3d0c8d23fb58441e25ca8ad9c0743 |     
  mips64el   |         omniorb-4.3.0          | NOK | http://autobuild.buildroot.net/results/e19be8be7a74226e395c65a7a57e6374de1609da |     
   sparc     |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/8f69792edba31da6e39e33ab9a86b2b0d484897c |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/987a3ebe59f9ea35f021fd64c67285b4ec7cec95 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/36611231b254684576367e0d1131bdcc4a2d1a60 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9bc2570addc61c8d2ebd1e03a5ed2eefafb75430 |     
  riscv64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/aa0fae3e3fde08dfbf12add0eb9d5765af0bd5c1 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7ce357a206e0aee793ee2fb954bde58150796234 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/31560714afe9307453f342ef66842b2be79e1f40 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/00e95e41212ac894c80102a9474473884318c796 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/9023eeac1a3c814c163f1138bf4122adc534aea0 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/1a7b9b47a3206eb18ad73ece569ac9adff14099a |     
   armeb     |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/850496da36ab774350a754d780fc88c456981493 |     


Gitlab CI results for 2022-06-15
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2580341645  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

