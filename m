Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEE5C6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 07:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15885400A6;
	Sun, 26 Feb 2023 07:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15885400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUOgj8-GRDBF; Sun, 26 Feb 2023 07:39:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 777A8400DD;
	Sun, 26 Feb 2023 07:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 777A8400DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA46F1BF31D
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 07:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8315A409F1
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 07:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8315A409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NekHtIlX2zbX for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 07:39:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4E140990
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F4E140990
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 07:39:09 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9C6CBC0005
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 07:39:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 07:39:06 -0000
Message-Id: <20230226073912.8315A409F1@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1677397146; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hfyMgfwqbTCDOAesm0sSJEZWf3u1zW22W2Q14sn/l4Y=;
 b=RCT+1iC1cKpmC6gcb/levZkWrkpkYRF6v4kRzivKLa5TCaU47b93bG38KCZhZIzsXVYRbw
 nrfVaJkVm6eDW7CaxaUdLUTvdH7MMn03LdIakoumnkLtCVNfNxgJlN2XfDHKwMuU9yDbz3
 DSu3U5hcgWKMJE8X0eRcSnSPC0TbTDqAQTc5rdYqZwBi0dkplYYDZKqooxAqPa6MTtEj2o
 RDmuLDah2Sj8JaiInO5zpAgYKvLByDoJojAilwBqQqThNKlYcf5YO10SBX7jaNeEDkzIIw
 3dW7YrDO2KfSxmF84CE93bqzV/VWZdh6xznyeJoTU6NW82yCGBd73JbsWcywMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RCT+1iC1
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-25
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

Autobuild statistics for 2023-02-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  |  7  | 11  |  0  | 18  |
    master   | 128 | 110 |  1  | 239 |
     next    | 19  | 15  |  1  | 35  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 7 
              host-pahole-1.24 | 6 
                host-go-1.19.6 | 5 
               libglib2-2.72.3 | 4 
                  linux-6.1.11 | 4 
           python-numpy-1.23.5 | 4 
                elfutils-0.186 | 3 
            host-binutils-2.38 | 3 
             libgpg-error-1.46 | 3 
                   perl-5.36.0 | 3 
               libcap-ng-0.8.3 | 2 
     linux-5.10.162-cip24-rt10 | 2 
       network-manager-1.40.10 | 2 
              sigrok-cli-0.7.2 | 2 
                 systemd-252.4 | 2 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                   bullet-3.21 | 1 
             containerd-1.6.16 | 1 
                   expat-2.5.0 | 1 
               fftw-quad-3.3.8 | 1 
                    flac-1.4.2 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
         gobject-introspection | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
       host-gcc-initial-12.2.0 | 1 
               host-runc-1.1.4 | 1 
              host-rust-1.67.0 | 1 
               ipmitool-1_8_19 | 1 
                  kexec-2.0.25 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libdeflate-1.15 | 1 
              libgcrypt-1.10.1 | 1 
                 libnss-3.88.1 | 1 
             lirc-tools-0.10.2 | 1 
               lpc32xxcdl-2.11 | 1 
         mxs-bootlets-10.12.01 | 1 
                  netsurf-3.10 | 1 
                    olsr-0.9.8 | 1 
package/multipath-tools/mul... | 1 
                   pcre2-10.42 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
               postgresql-15.2 | 1 
                python3-3.11.2 | 1 
            quickjs-2021-03-27 | 1 
                rdma-core-44.0 | 1 
                 rtl_433-22.11 | 1 
                    rtty-7.4.0 | 1 
                speechd-0.11.4 | 1 
               tcf-agent-1.7.0 | 1 
       ti-k3-r5-loader-2022.10 | 1 
                tpm2-tss-3.1.0 | 1 
             uccp420wlan-6.9.1 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/dadad1a59d57220ce6e407f46cc89c2dc3868237 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/abb287ecab6c2815d33af3de327e758cf5212b8f |     
    sh4a     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/073ff5c5b7d04990243aa0afe5f2e358d66c1b80 |     
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/464e56a0d8ac63dabef4c90d6ea80a34dbb1f711 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bb46f54644dc764d919998158e1a76b910b3abbe | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8d82ef956709bd2396de7fc3e1533a73d9b35f5d | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/798356fa474295972eb898555f55b8a1c0c53123 | ORPH
powerpc64le  |          expat-2.5.0           | NOK | http://autobuild.buildroot.net/results/95f929aec1f0da398b2aab1351c7812170f47655 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/20c3918f7d2d998b4e522debe764a1609415e20b | ORPH
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/6f66ebf6eabb923c5ca6858fddf2bcefe9643bff |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/dfb0611c0eb85962355274d16d2c7d7b7708600f | ORPH
   mips64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/88268819a4ff09bbb0d8ee90d6a72eebfcdc9204 |     
   mips64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/0ef8b525052c5a48be04d7690268f27eb9b9ce7f |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/df3d9aedb16faa3ce05943411c4ea1adc5b7942b |     
   s390x     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/2e60ee03e5c10f572e5e31978ecd495f8b3014ef |     
   arceb     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/344bc0000cbcaddc193e0da51a8cd36313957a85 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7e8f187db0bbff8ad2a244cc9b398f8c52e84510 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8fb9028e70caa9c1286a262a1d406fa2728c623b |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/441c8e0bb0f5c59e1d0d5fa481fe87c9060524f4 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/23067dc98f39f09f5ed6b8e16dceb1b9cb76daa7 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0b08f3e904eab616ce47577ff173e8d63666274b |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9f6fc0db12ec866b55ea966d610149e88a8469b8 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9989710e5afa52faf898e4e58bc8322cb1666de9 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/24b7f713da5cdb2753e27a7e6ee37d4115a4ef36 |     
   arceb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/8d07293748d0f0919b6c838fba4e771645c4c7c9 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b6753eee36b188c32e47464820b3069eca4e992d |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4f7885dc1b98af163c04cef08ab44fac2c9e3eac |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bb5a27b609d8ff37d07a3cd9c5b3914ecaa43444 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6e2993c24521b512eebf71a4b24a916715e03344 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1c48c53d7c10e95f1bd4c6843934b90ad8697150 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/db55f10777f9cf79932c9bf09e40e7cee64501ba | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f30e73661bab691144fbcc0d9029d286260f0729 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8248e1896e53c9c1c5aabb33bd8c5da7503abbb5 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f7b0a6c8e0bbca321c2147602db0b1cef471ccdc | ORPH
    arc      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/69c3421f0d0537c2876820c0bd90616146d79176 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3bccc59e4acf9f1f0aa60ccf6db9a2e718ee9384 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6262d41380e59ffb899a934922991bd9afdd3f10 |     
    arc      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1f7b414286f3716e0c65495e73cef0e6ddfd2360 |     
 aarch64_be  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/beb2769a29ef7f4174c1be76c3c62d036a806556 |     
  riscv64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/1abc834430587d6a5a4381392fdf544c9945ad53 |     
    i586     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/d3c7faedd46d611c5da49505b769e8a4754ba387 |     
  riscv64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/4611642b5f9d755b9759974586371b29334bc49a |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/580d2cff313313eb28158c9741d1ab533a519d08 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/40e5052eff8329d7998e115c962320b2ed6e3e72 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/4babee8a65c27a9fe289ba637ff0db4ccf2628ce |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/73afbf64f0619bf358e89719804db61b831d1441 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ea21ad00d4a7cce927b9af86d71f49412ec2000a |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9b8b04603a6503e083048364601c7b9ca64cbb71 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d099c7b2c04830e499e4a590d6aa65616f3a3493 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2ecb20b8b3ce43b83cc02e9068b39e7c4dea4dc2 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e783dfc38aedf31f81fa2a614d234db79647279b |     
   xtensa    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/41c77cdf19cd097854e79fe02bde8eb8c0f0279f |     
  mips64el   |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/2b696473aed057b70e9b00597506e33d5367bf6f |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/763b866d0383141407e52288ed3729d3094b9b74 |     
    sh4      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/abf7b9578f1a3dbc39e87add33b98c5ea20c70d9 | ORPH
    i586     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/2fa8b9414b2a4739c5114d6aa0d59d1c5d4d485d | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/227da9d6b6ae6c7bee32672750defa87a275b81d |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c11e8353eaccb9a16c83b436b7b653e4bf5afda0 |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/3d1d7d8c2b485238275d8f6ecd5c44c030046350 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/d8c835b0b3b477a3d8fa35b13abcb3846a2af406 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cbeefbf14fa545a6dd556648a6d88f2bd211105e |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a93b1864371f30dbc6440d548546c447da2b1166 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/675648d04552b97dcaf7205f2f04e0e300c2729d |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/373547fc7e0cb6c8e8ef551fd5a97b9a918c2e57 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/5a63509d4febcef0a60324129ee10caaff63de84 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f576bd1db0625c6e4ac63c773bf16ff81fa1bae9 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4003d9cae794a8c4ec010f667eed674cc02990f7 | ORPH
  aarch64    |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/5ec967926229907c9084492d73832e512fa4dd13 |     
 microblaze  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/160da79ce9e005ab91b33824f3e93783bbfcb482 | ORPH
 microblaze  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/27291870cf7539d26e45c45f34322d24a6dbca33 | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/8591c8aa01fcd2e5154720826196d7c43dd3a2dc | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/24f9adb6cdfd1eaf3792228483f6c2687bbb0771 | ORPH
    m68k     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/3d3f77f5b48eac3359399a84f5062b88a8519fc3 | ORPH
    m68k     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/963e52d5b10d3cc80f1d89f698ef48a4ea04991a | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/0aec444765dc0168c31177983ed244a05fea3a12 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/72c9a4080318b1b247ca3517c95c689dff1068d2 | ORPH
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/25ee1a649fa511e7a0ae33b30d27ba44e5a7ee4f | ORPH
 powerpc64   |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/ba7377538a21477eecae6e5594df325bc7de7edf |     
   nios2     |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/a1004c149f830263f9169680d4c3a13475457e0f | ORPH
    mips     |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/daac2fe8a0ac2c22ace2af3a7cf59b5866b1b498 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c4859aa362eda44caad9fee812aee49d2849afcd | ORPH
  sparc64    | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/dadd91a9ab0e845f699ea4345eccd987587f4f98 |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/e070099d2a426d1f10c738082d55872ea6e7c6c9 | ORPH
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/987e6697994c7cf74b7afffb0ab62bbdeda0051e |     
  sparc64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/87fcbc45e9095d8f969a55a53db5fa4ab3e1bc56 |     
   xtensa    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/78c2d522a71ea97e38bb128053071675ff678b2c |     
  sparc64    | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/066fc078980e5216f38411eee455088e15fa1101 | ORPH
   armeb     |        postgresql-15.2         | NOK | http://autobuild.buildroot.net/results/8744277ebe9910635ef8fe290c8ba4eee420b538 |     
   armeb     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/0986c206a2e1504b233a4cef5398abb641949bb4 |     
    arm      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/28eec96baf7d383ae982ccfab4fc8069fda8b433 |     
    sh4a     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/2d048d9b669ad60f37eeb2162b0a4f9fb425be1e |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/85a426be3e4508e7872fc35a6b92b65ea7791f27 |     
   x86_64    |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/1f37b94f7c6946103a48d321b66c668edcb3fce4 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5fae32e9491fe08fb37251e135df34ecb02474b1 |     
   xtensa    |         rdma-core-44.0         | NOK | http://autobuild.buildroot.net/results/ff2f5c53361d19b165773e070777ca84a58ae0a4 |     
   x86_64    |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/a0fa40b74c0395821364c21f6c4297c0db4d0a6a |     
  powerpc    |           rtty-7.4.0           | NOK | http://autobuild.buildroot.net/results/d045d85890ca97accfcea6c13c94757485d867c2 |     
   mips64    |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/435ad19597a1e216a7974bc9ccaf17064d1eccea | ORPH
  mips64el   |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/7a63bd0586bc3c4c983a9b6ea161b84aefec863a | ORPH
powerpc64le  |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/283333290c5adb48d0c6e592b3261992537f92d3 |     
   x86_64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/2164bdf4debe41fd4bf56962da206cdd07facd39 |     
   s390x     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/090b09034feb37ef86e10734f86d16d445556039 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/4afccfe3e08510d1aa6ab6fd342ece699ffb695c |     
  aarch64    |    ti-k3-r5-loader-2022.10     | NOK | http://autobuild.buildroot.net/results/d7449b2b2f2349af672bfeee832b89a223a7d9cc |     
 powerpc64   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/95522de6d5a3988155cdc48bdadb49d7aeaec336 | ORPH
 powerpc64   |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/7ed5969e02f962aa793773e00b9fe198ae7809c2 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/87e75c7f517fa56b6865c10694a1a5dc3f1f6bde |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/643945805ed6201124646eaf45f1ac215d9fc930 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/355abd317d83bae8b04169cccd99d325e9698635 |     
    arm      | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/1568cfc513476991722eb0c68114f036026f27fb | ORPH
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/048fa89fdbcfc8a54d3d4d3c0d98e7beedb1cc8f |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 4 
                elfutils-0.186 | 2 
              host-pahole-1.24 | 2 
                  ffmpeg-4.4.3 | 1 
                gerbera-1.10.0 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.72.0 | 1 
                  linux-6.1.11 | 1 
                     pv-1.6.20 | 1 
                speechd-0.11.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/87f9e78f3b66a19d386487e638672b29efe94046 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7a7132c4fe8ca681da04616cbedb9822a87dc7d7 | ORPH
   arceb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/f423d6965bccc60b33b010f6288be6d1684e5d4e |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1f8c57916c8c37018b1ad19199507a17fecbb31b |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/d58ee93e1cfc6776e6c3addec1b9434c6980b4e2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9700b87bb89be7965fe5af181eaee61a44c16a0c |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2828a72e91b566b70fa0e57b8dea8a7887c67883 | ORPH
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f9cee7c967b8ec9e233da1ea004cadee39056498 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5f94ae0d4532d6bfee9c3723a85f336fcbb87096 |     
    mips     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/06598b8095f73e9bf8fd670bb53c944a3ee4af03 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/81a4646e2bae975138ac7d340a6187a52f423ec9 | ORPH
   arceb     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/c74187cd6430c6f2095fc408573a81ab3f7c503e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/4d6e181bdfdbc25c712230942ab5167bd9687f5d |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/b9dae374f225ed17664121ce350109d5e66b2fc1 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/29eb7f004a6db9a93dfd0c3a2883d1608f4ac290 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/7d02f27f7597158e90a451f87afc2e25ffa7e31b |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

           janus-gateway-1.0.3 | 3 
                     frr-8.3.1 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
  gobject-introspection-1.72.0 | 1 
              host-pahole-1.24 | 1 
            ocf-linux-20171122 | 1 
                 wolfssl-5.5.3 | 1 
                      xz-5.2.7 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/64498486878d0fdaebfede03d7b3a5fa038f47c5 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/881737f47efe675c3f875ff42a03434747ebed9d |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d5f98e5a7854245fd8894db6d7110246aed0e811 | ORPH
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d84b37aaff881ec32b0a0747c480af7c511e0f89 |     
 microblaze  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/10e3941c8d436b2d49ea7282c3f252de0c7e5567 |     
powerpc64le  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/bfe183af06ef76f1d0cbc8258f3a81220b72a95a |     
 aarch64_be  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/a174ebb138de04a63db3a6e67f17dff35cacc081 |     
    arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5214d1aaf1100edc114ddcc5222e21ef296054ec | ORPH
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/40bdf7b5b0ae3b354eff1dcac887e9368c90824e |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5765f24b27d3ba58548ba3374333ab6075f3b396 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/1553700c129076437c62c67737312cd2fd07a64b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
