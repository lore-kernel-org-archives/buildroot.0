Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC128C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 05:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3460960F08;
	Tue, 14 Jun 2022 05:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCkSzox_PC34; Tue, 14 Jun 2022 05:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09BE560F02;
	Tue, 14 Jun 2022 05:32:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4771BF317
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 05:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55BAC41521
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 05:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHQQhE17ppYD for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 05:32:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1277D4151E
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 05:32:45 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A7C7200009
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 05:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1655184763; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pCOmkEHxJ3VbrfTDhKd/PlHv22Ztq62QCWIgDqthQaU=;
 b=GhQaZtR/9IKy2HM+vVyblnMXcCBW2AIA+Qu66KTwfIbKzYbZIcBkIoXYCwtgW9/LzxiuKJ
 cyfy7dL3+dJ44lJkWZPZ5u35hQIsoT31ewK/x86L0ii/cdDuN647RJxbpe+cqYPmvfTlu/
 ORrBxUSO37+loX3zCErgQHXIEzidRkP3RcGI2/dQYLdF0Po2yGknKX6g1g2nrDF6cLCRWb
 QRNoq1zAAGYUMOQPRjcWb2GTKI91yaEXT38mBGwaA5AZY6BF0DwQI765zJwwVtLEv1R8FZ
 RiVfLq695GRJLB0IDM+sE3MTfDoh55Mb+UcnsALO9700Vd8UyP/m5cm6fdSejQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 05:32:43 -0000
Message-Id: <20220614053249.55BAC41521@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-13
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

Autobuild statistics for 2022-06-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 10  |  8  |  0  | 18  |
  2022.05.x  | 25  | 25  |  0  | 50  |
    master   | 172 | 206 |  0  | 378 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.41 | 15
             libopenssl-1.1.1o | 11
host-pahole-73383b3a39afe86... | 10
           libfreeimage-3.18.0 | 8 
                       unknown | 8 
                libressl-3.5.3 | 7 
                 linux-5.17.13 | 7 
                 pixman-0.40.0 | 6 
              swupdate-2022.05 | 5 
                   uacme-1.7.1 | 5 
                  acpid-2.0.33 | 4 
                busybox-1.35.0 | 4 
                  exempi-2.6.1 | 4 
glibc-2.35-96-g2c4fc8e5ca74... | 4 
                host-go-1.18.3 | 4 
               libglib2-2.70.4 | 4 
               protobuf-3.20.1 | 4 
dahdi-linux-5c840cf43838e06... | 3 
           linux-5.10.115-cip7 | 3 
                  mxs-bootlets | 3 
       shadowsocks-libev-3.3.5 | 3 
                 wavemon-0.9.4 | 3 
              jpeg-turbo-2.1.3 | 2 
               libcap-ng-0.8.3 | 2 
                   libnss-3.79 | 2 
             libstrophe-0.12.0 | 2 
           libwebsockets-4.3.1 | 2 
          lttng-modules-2.13.1 | 2 
                  ntp-4.2.8p15 | 2 
    toolchain-external-bootlin | 2 
                 zlib-ng-2.0.6 | 2 
                    zstd-1.5.2 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.6.1 | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
                  bind-9.16.27 | 1 
                  boost-1.79.0 | 1 
                    brltty-6.4 | 1 
               collectd-5.12.0 | 1 
              containerd-1.6.2 | 1 
                 dash-0.5.11.5 | 1 
           docker-cli-20.10.14 | 1 
docker-proxy-339b972b464ee3... | 1 
              erlang-22.3.4.22 | 1 
                flannel-0.14.0 | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.2.2 | 1 
                gnu-efi-3.0.10 | 1 
  gobject-introspection-1.70.0 | 1 
               gocryptfs-2.2.1 | 1 
                       gsl-2.6 | 1 
              host-delve-1.8.0 | 1 
          host-gcc-final-9.4.0 | 1 
              host-rust-1.60.0 | 1 
                 host-wine-6.0 | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
                  janet-1.22.0 | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.3.2 | 1 
             libgpg-error-1.42 | 1 
                libmdbx-0.11.7 | 1 
          libmodsecurity-3.0.6 | 1 
                 libp11-0.4.11 | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
                 libvpx-1.11.0 | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.109-cip5-rt4 | 1 
                   linux-tools | 1 
                     lz4-1.9.3 | 1 
              memcached-1.6.12 | 1 
                mongodb-4.2.18 | 1 
                     mtd-2.1.3 | 1 
            ocf-linux-20120127 | 1 
                paxtest-0.9.15 | 1 
               pcsc-lite-1.9.6 | 1 
                   perl-5.34.1 | 1 
           powerpc-utils-1.3.8 | 1 
                proftpd-1.3.6e | 1 
rtl8189fs-94a61cbf46ce87b7c... | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                    sdl-1.2.15 | 1 
                   speex-1.2.0 | 1 
                 systemd-250.4 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-bootlin-... | 1 
                   tor-0.4.7.7 | 1 
                wtfutil-0.41.0 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/58653796c52b96be42bf077200368fe823613463 |     
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/34920c8d2ab20b962bcde7163a64194479e33f4d |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/486b2efd55da64998b562adcd16cac4eeede96bc | ORPH
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/ba32a084937e1b1a2a73f5d9766320587c496cf3 | ORPH
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/999366114128553ea9ac8b82dabca18a43e4ae33 | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/0cac574cba2dd69db78b6359b00a754d16896a28 | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/e4b06c8490463f3cb4a2591adb9cb66c2d0ef816 |     
    or1k     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/76786617139a2fc73bf8600b441821d65a318f87 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/479013627a6b90efbf51be22a32886fe3004a0f8 |     
   sh4eb     |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/3379600a8e4ded781fbdb943e56bf2c7dc3984ef | ORPH
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/94613c3edc91981ceda9bdb1db996f75167bf56f |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/d3cab96add816222433c0c2c326d7401e1b905be |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a9dc5ec0c2b862991cda79b45a2bae505548d374 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/6c2b8e5c9c34d3c70f898437daa06e94bf9607a7 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a8209041922f7abeb7d4ab55376eb5f81676ab1f | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/b8ebe82c44fb0dacd8e663a55b8ff35ea1de8ede | ORPH
   sparc     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/6a0484412f020e763ce3ad5bda48f09c78645bff |     
    i586     |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/7979522654cc4941641b68d9ead8a311f021658f |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/6fbb30529bbff507478018da89a80ec576d5ec67 |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/07762db50e721161482dfcc2471998fc1e3cc565 |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/1ea1ca6c1f0b781f10900945ff64ab58d6d4ea24 |     
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e6113de514a59233738d22b7cfc5240bb20edc85 | ORPH
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/e684f9b8b9cbe942118c0735e42cb684dd9ef50c |     
   s390x     | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/355748233485f5ba1236ab439fbd3bddda364f5b |     
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/2e3fa0257f05e8b2d03af23e6ac3390857c261ef |     
   x86_64    |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/384370c104cd04d95254e1f10d8c3a6e747ab331 |     
 microblaze  |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f8ecabf2f8e3108e510ab101d258f87affaa9752 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/2be9b385da012be4f4003132fa1ae133d1274617 |     
   mips64    |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/a7bdbff1c448fa8467974dc016a4322a21d9af16 |     
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/da3127efcfca10978a1d47e6389c562139de1f17 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/bc7f27cf0abd0a4d6c6299f9202c470192bf99fb | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/464a8b8376319c7292f7267d9d0a66d2b2878bdf |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/be109c631d4e3010b55da6e692624e66783a7ecd |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/9ccce34d6fb198140d9ccb3a4302c91315410401 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b00ec083e909fe3691495661cee8af164de3b094 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d9e44f0a0681a1598bf1b28d9034723ebebdb07c |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/d8992f0b956c67655e066d9eed64128918141923 |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/d91e960f0a0a44f6f69f6a89bdbc2d50dac9c3c0 | ORPH
   s390x     |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/1a2f4b9802d82ca36e8d6a5ad65f5dfcefc2bded |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/ccaa2d21f1b88b7dad0f52fe186ac159d2229cb8 | ORPH
  mips64el   |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/5d7f9d31c9a2c21d062133caf2a4c845c2b652a6 |     
   armeb     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e85b8b0cc7d0efc98db00c622b7d74cdc1b396b8 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/07ca728c78cb52ebe6ce4524af5614a006607828 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/026914bc22a236a9044e18b9919b75d5d5fa78c8 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/e9ede8e1c7c5c9411c6eb1f9b24da9e1823211fa |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/bb1b6705e62f54c3ea00f2c8c63380637cdecdb7 |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b498e731a047db561410360ded34cc410f91aea8 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/85909a0a88ab6a27edcbfefe8ed4281f8749aaea |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0aaba68fe589c2387cd7cbcf0006deb138e96dd4 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c5eef38d2a5fb35694e7739d87298d6b3139b6b4 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7e124d1cbff1cc08a9fc9c19f6fa3f3de20345b9 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8170c225d85625627866f1f31cce3b05c58033e3 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9c3aa19a1e66f2b5b50ef1b0802708ffa3ebb24c |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ab1fb92ec43eabe67e7dd28588069d88c6b8976c |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/17817f00e6cb9b742bcc7180a9e8b893d208aa5c |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fb6ad0fcbf12ba817859d9b53458cfae8625befc |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/bfe050d132338e7954cc876267ed6ce4119073eb |     
    i686     |         host-wine-6.0          | NOK | http://autobuild.buildroot.net/results/af7533fa50a774fbf98c1f0fa26c77862cfe9925 |     
    sh4      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/5e5d104c61c0820156084dccc167918356bb4d45 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/55f23548d69f2aad7b4390271d52e490ec2b66b5 |     
 microblaze  |          janet-1.22.0          | NOK | http://autobuild.buildroot.net/results/b91427bb7b1b1c450d0c8c5fdc15d30905c68cf3 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/c1e03aea6d8eecf3b3b9979901b5d2c5c0ce7e34 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/0f525acc282027ea948e75b3e2955e95eb63a37a |     
  mips64el   |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/ba303c07bb06fd45f2a8f0b4f06d83f1024cbaa8 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/afc19ed9c2fc8d165df49019978d7c1665835e85 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/18cf81e73b50d6c33cf513316a3b293c6dd91465 |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/50e3fa725ce9e7719e8dc138a0d2277db2b9fd43 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/902ebf5545282b51c59af9b5b9e9ff9f1febaead |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5ee9716f23ac3c88de5fae14ec7b537c4e89c7a4 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5d4323548231998d8ef9be1561f8f56ff3b5663a |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/04157421904d612a582b288d8e581492a04c107b |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5dfebbe1ce5e3e156bdd4985e9cff248400571b0 |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/20ba868bfd1b5d06106226b72ef7de84d490e4cc |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5061be559e62ee8ee1945a68b6c6e938c7c1eff5 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/092060c40ec1f61efa99dcfd99031ba85c4a0d77 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/940181177c721ef1015bce681ee83ff1b4e1d743 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/c3dc6acbbcf14b2b829e516dcbf3cc199b90667c |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/eff2416dc2f405b941fbf5fefc84b1b62db0932b |     
    arc      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/843b8c4711d1ad811c94bfa48c7ca260143dff86 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/cc9c19ab517aba4c1e2055a6c4f01fa628531adb | ORPH
 microblaze  |         libmdbx-0.11.7         | NOK | http://autobuild.buildroot.net/results/a11c1ab17d33281029dabf262dfff5b0a8dbf117 |     
    m68k     |      libmodsecurity-3.0.6      | NOK | http://autobuild.buildroot.net/results/98472a3a41cdbcb3d02289a437074a267f4b2e8e |     
  aarch64    |          libnss-3.79           | NOK | http://autobuild.buildroot.net/results/3f47e8425dfc70d085c10f3f0ff1a890f5ba81d4 |     
   mips64    |          libnss-3.79           | NOK | http://autobuild.buildroot.net/results/9c19b1476f8790836c9fc3c547dcbdafa32b1eae |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/bc3589c9277e12dca5713320733483d06f7be098 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/3f1a7ae71a958fb63b58c2ae8579388617a7869b |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0febe1021e8942cc9f7a3fea3e360ef8f2a3ff86 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d2b18f5fca59088c61d50a691c2ac09ba5cd4018 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/210175680202ac14811b912d8c1427f0978c72d8 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/c7b653600be5943bad831a55bf1f71d075fe7313 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ae091242100077e650e7fa284145392317769d22 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/161a1ea9771d50366fb8d02e4508214b7c313bd3 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/c1e68eaeef2a053d363fb5e779f7e53f2a8a4bb9 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/1b8a7ec9ee4cec5aaab9e6fc73be764226c29b41 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/2ed69936d8f60c5782701f2e85b9a21fbe0fbe42 |     
   mips64    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/37a559f4321bb16905a3bb8e671d86ed1c060237 | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/bcbb11dc80bc1d20e233164667944bd74cefffe6 | ORPH
    or1k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/00dea1f4f01e9590780fbc3af389f6e2da1826f7 | ORPH
    m68k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/4d9fd916ce0bbbf30f958e3be7d864566c635c42 | ORPH
   mipsel    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/c47096766c3f64a321d1de8e0ee7afd31a17b477 | ORPH
   x86_64    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/76bfffc9abb8e9df3797776fe8af443e1193e14e | ORPH
    m68k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/dccf059f86d46cada89d6890c568496683e8d025 | ORPH
    mips     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/a9fd13e1c336896836df040ce93c3b72ee929975 | ORPH
   sparc     |       libstrophe-0.12.0        | NOK | http://autobuild.buildroot.net/results/9ff1b0192fb1c7b05ad05a811e04d9b6d4bf2a46 |     
   sparc     |       libstrophe-0.12.0        | NOK | http://autobuild.buildroot.net/results/02ccab3f34ed7b7c042fc2472461f6bed6b652c8 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/6b5b4f4c6350c50a868275ab7285f43b6370ccf6 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/03d0cc68b1511693a7ffcfd64a58f332c187c0a8 |     
    arm      |         libvpx-1.11.0          | NOK | http://autobuild.buildroot.net/results/c54271e33abd563b503a81739b7ba48ad947b689 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/474765d2026938e36ea1c8c4dca312756635da4e |     
    arc      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/95bc8db8acb012938f98db8d4000050cd443f480 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/b04760e132233b22def30fca4980ef553a71d968 | ORPH
   s390x     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/2d81f82096829c9594f799e198d024c6b1828495 | ORPH
   arceb     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/deb25b7754813c703f007d90b1609286d4b4513e | ORPH
    arc      |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/54a84be51f0a3e8c4629deaef636de59a12f082c | ORPH
    i486     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/74c6a45e1752856431c12bcd108bd13117b0759e | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/2f5610687bec33c080f890f1c74cefd6f72f217a | ORPH
   mips64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/646883a3ca7d150db045d9f79f8c42af3b50b029 | ORPH
  riscv32    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/4bc3f3165b16c0641a6753ad733c4e5cc704b712 | ORPH
   xtensa    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/42621efd8b61e72a141b75899bd39aa6be9c210d | ORPH
   mips64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/726f033e1cddd88f58f42e0e250a5dc077f86d39 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/65fc6aaa5e37a460eb43b5384431224ceb1572b0 | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/18490a3cc17aed3f485f266aec4335bca7759032 | ORPH
   mipsel    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d50cb9d86e478b2dab57ab3769f1e7eeb1cc524f | ORPH
  sparc64    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/5a530bc9eaabe427243ceddfc7b8a9409c48a533 |     
 microblaze  |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/071d5f78af2eb34911beed1c1b044e4c7c4435a4 |     
microblazeel |           lz4-1.9.3            | NOK | http://autobuild.buildroot.net/results/04d7fe5a1749dcd0a92a267dc099411858799248 | ORPH
   armeb     |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/3124bae73c207f1a118e57e41e222ef464ccb297 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/aaffcdfca6a81c0e225ff43008e5f8d09a15bbcf |     
  mips64el   |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/03e34b775b2b29a0ab1e83bd5ad41c60fd038f42 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/564209c2ed714708450e4559c421b87d8ffc8b05 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/8271300585a027b581170d79cef389b64bc18b00 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/f738152b84560cd4a278b70a01400bc12b645a4d |     
   sh4eb     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/903e7db1d0e1cade34a841fb84ae16efc03af4b0 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/cfb4e6a30bc802ee242b1628fa09278ecadaad92 | ORPH
microblazeel |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/de8c7760f67fcbbaa9848a11fa3a6aef9d3aef0a | ORPH
microblazeel |         paxtest-0.9.15         | NOK | http://autobuild.buildroot.net/results/ecc2587a7e0aaef113f7539ed9e97093031c85b0 |     
    or1k     |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/fc4af9ab9b8e972d08092d39addfdf48f46c1da6 | ORPH
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2f82405d4b469f4269c0d0c05eeab55ac30b84c0 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/43ba4d9edb428c7efff62ff2e61e9d018f7c6ba5 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/36fb905f85db73e63e76398d2a2c9978164e4bfc |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5f9b5722bcfe89c24b519d87123b36a26d6db11e |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d83ee22f65d197c24107f521535de7b834693a49 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/777213a1731d7c40e5805fedfa9a5f78332151c2 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fd9f9827ea4bb7d60ca48576e6c8e3bc002b7037 |     
powerpc64le  |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/d808a23f87aa04ffd55da3af8e1c4e811ce8c2c6 | ORPH
   sh4aeb    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/255aa2104e5198b24547a8ab211adf30a9edc739 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8a4c823ff6d822d8f66999fd244da97e20631dd9 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2c5894d548eba6a595273ff34f0cf6b8a2139c0a |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d8c2afeb14818c11fb567415ba9da5861f16e116 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1214100bb26d0bbc0726e26cf85adf863765a90f |     
    mips     | rtl8189fs-94a61cbf46ce87b7c... | NOK | http://autobuild.buildroot.net/results/3f1f35aa6399534da1cf52463511d80fe769a37e |     
  aarch64    | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/b12c93708127f275740cacc8e59aa032dcc132e3 | ORPH
   sparc     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/150bb3d4f14d9fb6cb9b8538eb80d83c591fb3d5 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/7eee551bdf34bffadd79c9389b66d6721193374d | ORPH
   x86_64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/bcc6bad7ebea8b4166685302f4a19c4f7186393a |     
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/6ec3d99173194d753cbfdb532610ba88dff8f53f |     
 aarch64_be  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/bcd34980135819a1dcb43dfa51cdd05c23ba893c |     
    arm      |          speex-1.2.0           | NOK | http://autobuild.buildroot.net/results/413c48320acdeeae9fed8f4287b20ff4ef7fcbb8 | ORPH
    or1k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/12eed9b7f67067d5641eb8880bcf7c1854e99779 |     
  mips64el   |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/cad059e8ef44519fad8008aa1f2a5c9ab7e9f3d5 |     
 aarch64_be  |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/b9c4f6f6aab2f29dd3b5460ac8911cc68672a050 |     
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/2749fd11f4f4485c6ab842aa21c200197b08b5cf |     
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/74eb43cd8743c683e653def2f7e4ff19e3598f0e |     
    mips     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/bd7f8872599ea1c90b70aaac64ed582adbc33d97 |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/4010470d26a94a825fca66bbdeac5e53559d688b |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/9208d3710a6e212843c7f362c910671939e76585 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/12d1e98a7697bc0a56f01b78d0c5f33bbbd77960 |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/230f2aa170d62bd6c5b2be36a0ba9db48bcb6d6d | ORPH
   nios2     |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/35785cb78d0af7c353d9eba73130c8726763f3fb |     
    mips     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/8757c3c81d6a8e1da877acb777876582fa7726cd |     
   xtensa    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/01ef7814352898d661ed2966280b82b6d281c8b7 |     
    mips     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/8498d7eed254f33072dc080728d93a90d02b18bc |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/d81a933bab713e21c4ecc22f9f6cb6469827adaf |     
    i686     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/198fad41de432a838f43efc225d290e2c79b33fb |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e488c255f81d657817f9d24a9a0f79f797c7b7d0 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/afe568435ebaebca3dd18363978c7d848eb66183 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0c33937ee2f1083a89c04405b24356abd910133c |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ff2f255362d7ed89239651721a7243f2e4019b83 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/00438fb25ded146b155bbb75415afca1509620c4 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/32be2c10479a9eb9065d8ba86e204593e271503b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c06cd067225fcb86012fa0af29114065daf5fe8f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/644acb4509ecd01cbcb457acb0ed9413c2da8df6 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c388921318bcb59d06fc3cc97c0ab547acaad0f3 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/345cc0314c57d64b0b2b2b568001c639505a3c97 |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0febaaae143faa2577a309f52330551b02fa8260 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d78906ddf250cd62ba4cd88b6e1a6e8650eb2ace |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/394ec619e4def60d7e3e623a4fe59611c662994d |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/634e3b2844d54436856b8d4d8b8363cde6edfd58 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/dfc868f3a4ae2c18b3256f23be94b6a0213bc94a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e321d8cde607bf66a1e69573abca7ad482b3f144 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/5672e8b62318f8dc861adfb5344d3cc9d4631ca3 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a46c70f9ec745104d50d29dd66a644fac4a7fc75 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/f854669e61cf98cbbfedee235c72346b61ab59a1 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/2a7a21a2f7afa4ad49d2d005b65c803cd2da3efc |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/5b398d0e197cc871d538c2ea1547a5ac19fcf5de |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/29f0f204abbf22578a324b6809b8c7a9b0113def |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/1e94e4a5019dcb9d18d894841175a922daa41712 |     
    or1k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fd762c1c1d819d34dc3a3184455b06ae401f0c17 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/219019f8660516f943ed301f1bff160509408c04 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ec0720312fc087e4255dd4d1042840f694e6d67e |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/42f11529318aedaa456ae3b1dc5f7a1f3e90209c |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d4226e2d01b5b71602bfb4b8230f34903427a38c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/016b95d397bc332027a5cd59a26f68c86411c4f5 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/0f5ebdd407fa8f561fa50fbf6dfb09e3ca754e0c |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/4f45d3105c8d1994f8509120f39b18b931738e8c |     
   xtensa    |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/950011c0f3b724e14b1cbca2c3ccd63bc3690987 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 3 
               belle-sip-4.4.8 | 1 
                       frr-8.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   perl-5.34.0 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/5679112387795cfaeb92638d4c6446bb8b6dabba |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/ddf77c188cde1733b29a5acb9cc08b2b25c05112 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/bf985661d4a85aaff8f56a451fc6f5980a497890 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/54118f53f38f057639915c6ba81430c2c3ad844d |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/84b5ed3e23c6ddaed67f7dbfb408416f6c676fc8 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/264b6300b0dda9defbf37c447734741f48fe3998 |     
  powerpc    |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/856945c369753179fd914afd9e73c2793654d059 |     
    arm      | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/4480a8fd95d92480e229f44b1b7a10effe27595e |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                host-go-1.18.3 | 2 
           libfreeimage-3.18.0 | 2 
             libopenssl-1.1.1o | 2 
               protobuf-3.20.1 | 2 
              swupdate-2022.05 | 2 
/home/buildroot/autobuild/i... | 1 
            altera-stapl-0.3.3 | 1 
                    bird-2.0.8 | 1 
                 dash-0.5.11.5 | 1 
                  exempi-2.6.1 | 1 
         host-gcc-final-10.3.0 | 1 
                 mesa3d-21.3.8 | 1 
procrank_linux-21c30ab4514a... | 1 
                tinifier-3.4.0 | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
                    xen-4.14.4 | 1 
                       xenomai | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f1684f80e8ccb9b7024aeb6a15c3f2c10734a66f |     
    m68k     |       altera-stapl-0.3.3       | NOK | http://autobuild.buildroot.net/results/e0229d5c4462b2d25ef2a88b582343da1f930479 |     
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/5840370460c280f817c8eb4189a67b33c00ab88e |     
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a07089897be18ec5990b05605c607b57e17cad99 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/00c31fae31db94e2d95bbbaada4fa753d4a37d14 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1e014efb9faf8948bcdca99063ded96b80744c6d |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/86e43a8676de08cb1a0c4722b2e956b63ee4324a |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c92caafc985c6c01e72dc691a972d5d3c3dc15b7 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6d4b04fb2d06faa6f5978a61b9c199e9477ff755 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8f4b74bb8771e335b6703fb4329ca6350d288d3f |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6da53ca290e788ecdb7cb3175c93891fab27a2b9 |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7753397691aa2ac29a377816a73d5fb2b7f61dde |     
    arm      |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/eb59c60d0fae9e6b689d7e75a56ca735e22d1e76 |     
    sh4a     | procrank_linux-21c30ab4514a... | NOK | http://autobuild.buildroot.net/results/8eccc34c99a75501179fe93a80646cc684261ff4 | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b7abc9948547bf58710d818286770bda88c34499 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ea2228b57e76498ac6fee090e252c69a0fadd37a |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/47cb3923077f967c4282cdbad4491bc0c4a5af09 |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/5fa831f03ac7093517545b926c7273d6200890d4 |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/1aad3634318261d3310ff8ea2addbd3aff0c7252 |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d133f7898675a96dc3bebf4c5166383de54bbd01 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f4982c34c1822fdfa1600706e47546dec0ceeb4b |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e499b3b5da375a63db46e353e87e44ceb4ae3bb1 |     
    arm      |           xen-4.14.4           | NOK | http://autobuild.buildroot.net/results/3f87dd46bfb618f4ba2dd2e70899747dbe2fa00d |     
   xtensa    |            xenomai             | NOK | http://autobuild.buildroot.net/results/fa908d1a20a33cf055a052a2d31e9ec71a382c70 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/10b58d33d1aaca642ea24bc79623d262c11d7a27 |     


Gitlab CI results for 2022-06-13
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/2580341318  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2580341645  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2580341691  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

