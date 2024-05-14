Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A31FC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 04:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 356CC810AA;
	Tue, 14 May 2024 04:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btCDcXruNXjz; Tue, 14 May 2024 04:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49DB9811F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49DB9811F3;
	Tue, 14 May 2024 04:04:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CABEF1BF2C1
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 04:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C476A4051B
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 04:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYZIwuOfk87Q for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 04:03:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC2B940515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC2B940515
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC2B940515
 for <buildroot@buildroot.org>; Tue, 14 May 2024 04:03:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A22620009
 for <buildroot@buildroot.org>; Tue, 14 May 2024 04:03:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 04:03:54 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715659434; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uh8/ebJg1VnHeqvPvxOUH35IT8+VdKcr5KbGE3t509U=;
 b=E4zBH01MKlh3Tn4iDZ/e0wk0AdLDYW5ZD+FvrhY05wX8IDamBo1PaiDhhFzuwymVew03PA
 HSmIB2Jqlnn4F0XOPWqnCXtNsPcAufEzWwYyxjyKD4aWfDscnlA1bwVRY6/ZAaxI+gzdAi
 yUblNNTZu/QJSzBVvooq/YmUevA6h3bqrNtD5bN84aB8TZRZpPUhdJmSJ04+v3C2aMpvLz
 PFukN3IzlKjLa2Ai5KSNw/a0VZP1j5jWe7ySpKOBS5qtyMFTusckVf3ORVLhGkuF6HO6zO
 8Nnm4EWl3XAKbeelTi7X29lC//Vai23Uwi7E2nUj5wNffq73OYUq3DkKVYfmNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E4zBH01M
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-13
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
Message-ID: <20240514040354.r65K6GhIkuiFWf8A8Nk63M5X8CJNddIAoZnPcB4yeQA@z>

Hello,

Autobuild statistics for 2024-05-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 11  | 11  |  0  | 22  |
    master   | 73  | 117 |  0  | 190 |

Classification of failures by reason for master
-----------------------------------------------

                    bat-0.24.0 | 6 
        host-sentry-cli-2.20.3 | 6 
                       unknown | 6 
                fail2ban-1.0.2 | 5 
                libressl-3.8.4 | 5 
                 coreutils-9.3 | 4 
                    dust-0.9.0 | 4 
ibm-sw-tpm2-5452af422edeff7... | 4 
check-11970a7e112dfe243a2e6... | 3 
                  ffmpeg-6.1.1 | 3 
  gobject-introspection-1.76.1 | 3 
          libcamera-apps-1.2.1 | 3 
                  libffi-3.4.6 | 3 
                beecrypt-4.2.1 | 2 
                   bird-2.0.12 | 2 
brcm-patchram-plus-95b7b691... | 2 
                elfutils-0.189 | 2 
glibc-2.39-5-ge0910f1d3278f... | 2 
         host-libxcrypt-4.4.36 | 2 
                mongodb-4.2.18 | 2 
                nushell-0.85.0 | 2 
                 openssh-9.7p1 | 2 
                 zlib-ng-2.1.6 | 2 
          alsa-plugins-1.2.7.1 | 1 
                   atftp-0.8.0 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                     bc-1.07.1 | 1 
                   ccrypt-1.11 | 1 
                 cdrkit-1.1.11 | 1 
             cni-plugins-1.3.0 | 1 
                 dhcp-4.4.3-P1 | 1 
         docker-compose-2.27.0 | 1 
                    eza-0.18.8 | 1 
                    fcft-3.1.6 | 1 
              fftw-quad-3.3.10 | 1 
                   flann-1.9.2 | 1 
                    gdal-3.8.2 | 1 
                 glibmm-2.76.0 | 1 
                gnu-efi-3.0.18 | 1 
 host-binutils-bare-metal-2.42 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  ledmon-1.0.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
             libopenh264-2.4.0 | 1 
                 libp11-0.4.12 | 1 
                librsvg-2.50.9 | 1 
                  libsepol-3.6 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   lmdb-0.9.31 | 1 
        ltp-testsuite-20240129 | 1 
                    ola-0.10.9 | 1 
                   p7zip-17.05 | 1 
                protobuf-21.12 | 1 
           python-numpy-1.25.0 | 1 
                    qemu-8.1.1 | 1 
                ripgrep-14.1.0 | 1 
rtl8188eu-306f3e62cf7cddf8c... | 1 
                    rtty-8.1.0 | 1 
                    ruby-3.3.0 | 1 
              skalibs-2.12.0.1 | 1 
               syslog-ng-4.7.1 | 1 
                 uclibc-1.0.48 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |      alsa-plugins-1.2.7.1      | NOK | http://autobuild.buildroot.net/results/909bf62eb8f55956108b1a36949cc79d696b4766 |     
 microblaze  |          atftp-0.8.0           | NOK | http://autobuild.buildroot.net/results/1ad1a99677ffcc79e412a27d1bf73d6db47474e6 | ORPH
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/4a5369090f438281eddc9d72448a321cb93f0d65 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/cf4351c73737318e2cad205aa0dd38d9250f3362 |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/b5e78164c5a974f89449ef6db75f732aad8b0f10 |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/7f27e508756918461eeec3c20eb6245c925c8704 |     
   s390x     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/1c62a02b616e0764814345e791ef651c5e55925f |     
  aarch64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/0662b21d6aee875a7e576df28d0e4bbf63b4f3d2 |     
   s390x     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/03629728ec883fc723bcfe58334270f429ac0341 |     
  sparc64    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/4d3c0e0a08cd734699cb61412c99d705738e8ab4 | ORPH
    i686     |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/27df4be396c8a55c0d831112411687362fad6d80 | ORPH
  mips64el   |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/244c74ad56a9a51e9f7950ffe511e6e00123518a | ORPH
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d43c3f2d4b2e9bd73de878f8e3eb4e783650e210 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/31dfb720f1fbb57ad6cb28a45bc651b3f449d09c |     
  mips64el   | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/cd28410188e7eee624f8773189b722c2b87c8d26 |     
    arm      | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/da6a5b638ecb2863bff0350090176a43e908212f |     
  riscv32    |          ccrypt-1.11           | NOK | http://autobuild.buildroot.net/results/096d22a64a7f297bbb7f7f62a2e8d92463726cfb | ORPH
  mips64el   |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/1ed18a7c92c9399a0ab909e2bb1c813c5f007d9b |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/de473e7b2efb2c3687e74f15c2ceb65dbc534a8a | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/bc952a7ab70ed0536df4289d88d96b81018b4f3f | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/5e22e6a10ff03488e81b027b379c0e3234ab6ac6 | ORPH
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/75577cface981f8b3d81510e2839cb4bd2880893 |     
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/09853805534e34f47ddbfa741a785041c2f09708 | ORPH
  aarch64    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6cca8a6adb4a03d79203d95bf03d3a8dd66768ac | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c0017e0a415b1fad345d0b672fdbfdda121f63c4 | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c1fff43d1f8ff27edf902ce62eb11d23d7938db8 | ORPH
    sh4a     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/1a73db8c9a4ab153283e46ee5e63fcc273ea0134 | ORPH
    arm      |     docker-compose-2.27.0      | NOK | http://autobuild.buildroot.net/results/23babe268017c82a09e092fe39c25c765d543c5f |     
  aarch64    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/482e5fd9c32ea41c1a5b2932f136fe03f183c30a | ORPH
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/0052378117b2bdfa6783589e8a453990acc7bc02 | ORPH
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/f82c425a65b7a4e11e705e23eb766f70f0947525 | ORPH
 powerpc64   |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/014c2ad1bd0073ee8ac81c9f17cab9e7aff99e5a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/42672c7b220dbc2aeba6cba505f70b5c844e6fa4 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/887628c2d977297a3bfdc50fa412051f175d75bf | ORPH
  sparc64    |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/fcb42530ab3363f080046d1997f68a514cb86b5c |     
   sh4aeb    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/26717987b0c3fb78793fdfbb436722ab893d26a1 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/a16e0bcb2e17863807af304ea3aaa5576c76a04a |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6f533826c94abdebcf5d2ef91cae71b6e2fddc74 |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/65dd4a9be5698c71fad43f257f5b0f99bf28cee9 |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ad4cab7bf473a1caccc4c07c5a29744868515466 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/689928d698001ee5ac8bf83c65a09b07b2d027a9 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/16e1f7f22e79fb91afb29e606d302da275e0736b |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/326c9500e4e24902186b20eac91f003cc9ca56ba |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ef351509227b44bb38da7d3a3e2fbde33eaa3054 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/e87eb4030ffc2a898aadc0aaa8d009971da210a6 | ORPH
    or1k     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/459335c193c2ec6c09375ae0c8606c22cb3b042b |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/e79265257316bf8b251b7ac78018417ad79f3720 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/7ee0ae41c259272df1494de8a22ffc08b11b86d0 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/29e159d5e744f48e7c0670bde7126c2eb962b154 |     
    i686     |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/279c80f01f385c8f1db92924e8c6e35150fd122f |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/1d39f48b7364650602545c86591e173b4332f661 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c9d015a3ac1a73e4c5e088f1fba8b0c899755665 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/71f06ea7957a8949dcbda7200df7d85d1456cdb7 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/37038337af82aeeb8c847e6e763a1482ca14f9c2 | ORPH
powerpc64le  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/32fc4b1ebe82b4af5b64910da742f316b6cbf736 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a7d1f062fbca59bef691c9f4d8a62a9da82ece07 | ORPH
microblazeel |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/3f53436efd3132c7825be6259d92aac2858c1217 |     
   x86_64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/ea240733c0ea648527cbc53dabee4b9a6be3c42c |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/6cc9b8ff7b2ac774d3f3e3ee9ce44db50cfa5a06 |     
    i686     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/91df45ed46b018bde2bc2ae4b3de090d8ada8207 |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ca213b840c1143142d32896d5d55300de011bad4 |     
   sparc     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/c5942ab630e5e75b4bc6cd1580c7645b3c3602f1 |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/7ecc8af43f3b84663a15534f3d9ca749409e5631 |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/34dc99d049cd70849dbc4c7af7313bc46d3158e2 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b98714ded476b20c2bf17274f57e9e146a97d521 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7e8892af3cde78722a6173d3b5754bb362ffe2e6 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b8237fcc08f483ae94bb6b51f90b1016f50cf205 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2eeee44f3fccbbd3d5b6d84433d4ae68b7429fd6 |     
 microblaze  |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/553e2bbcbb3228284fc35c400dba67e61a9a4c31 |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/db7085b2465e33050868e8ea969dc926b7692103 |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/485b5ecc3c58962348b68171268e8b974833703a |     
   xtensa    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e988121a775645707ebc9c6d3addcb8b2197a3fa |     
    sh4a     | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/0da33b64748b1047e04731373e1b62fff7a61060 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3a0f0c6a3bc978cf6756ae7246a40c186799f7f5 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c6381284c4bbb90f03a02e2aa7eeab4e8c27b452 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b1924c8e0a48f8faa2838e311dafb910888e18ef |     
   mipsel    |       libopenh264-2.4.0        | NOK | http://autobuild.buildroot.net/results/f943c091d6eb01793ee1a42bff76965dd209e161 |     
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/3a232d5e9220c452542764542623167e001e3fea | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6c4ad59e943e63342d16f33716cbb165e618a830 | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ee369b169d3bf79fb6a717ae9e051cff06a8a34a | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3385f0b0955d3b8e178b6becd0e8e1c35d778c0c | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/be37020a0998276432a743917c20d62484cd885a | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/766c0756f0ed67e42dc77d0878b17186366127fc | ORPH
    arm      |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/d257890b7b5b411daa5b275af1c24463310a4588 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/71f4a2f0e155cb76c6ab662a77302711de6f6afe |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/ab04a76d09d90e14ad782efdd30267d555ccabfc | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b35fad4ad61da38eb1d480ec1b1e002b66a94dd6 | ORPH
    arm      |          lmdb-0.9.31           | NOK | http://autobuild.buildroot.net/results/e2bc8c35a10b6513c5605954e93b5b8a1ec7654b |     
   x86_64    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/0dee595990c7f7eb35f9bb58c111534a8183cc50 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/59fd3af35c97ae9cea13c4d7ebc563f13effbcfb |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/8090dd7f62ae93fb0a423f809f5e4216cd8f8c2b |     
   s390x     |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/ba53fe3306c6b515757f34628d3b5be86420639d | ORPH
    arm      |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/66a0f5d8f3b5fba846dd843899fbacf9f37abf4e | ORPH
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/a7f8cab996f21c7a4d490263663aed4fd099297f |     
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/592adac624b2fff95286bf8bf67d0cdb6f52a4d1 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/e415a8ca4a8a9633c3c5bf665f7c7121d5335fa8 | ORPH
   nios2     |          p7zip-17.05           | NOK | http://autobuild.buildroot.net/results/ab46a302ffd985cfa00730ed93fe848734c49cd0 |     
    arc      |         protobuf-21.12         | NOK | http://autobuild.buildroot.net/results/e7b25b35642f264d52a3b5808a997dc5629da868 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/223c0d0a021b57fba6884577cf6ad8c0801921cb |     
   mipsel    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/db6ba3135791a449217115f1b856470e852dac20 |     
    arm      |         ripgrep-14.1.0         | NOK | http://autobuild.buildroot.net/results/5e9efd3926a97f89c54e8102e4c4542c857ab007 |     
microblazeel | rtl8188eu-306f3e62cf7cddf8c... | NOK | http://autobuild.buildroot.net/results/493a8ed6c351ac2d04bd838d444744040bbdae3c |     
  powerpc    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/2858e9c0a620a07cb8c90728fa35faf582f20fd1 |     
  riscv64    |           ruby-3.3.0           | NOK | http://autobuild.buildroot.net/results/215cb9e53b0307b8aa5e154ad0468f134a01d14f |     
 powerpc64   |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/101d0e5faeb648e362feba97ad0ad97929958095 |     
    m68k     |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/63e0abe4b3495e4611778626fd6c051231cfc551 |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/e4bd08d694c67128ef22cf3afa6ba735c970f7cd |     
    sh4      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3c4d3bd11d7a974312f73f6534d8de9171041df6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/de9592067e2f123acb136bdbcfaefa12d521f6a2 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/1bd838d98f20e868e571bd1487f5235eb30d7b0d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/af239d90382e22d192b442cfaa4add75daef303f |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f456de809a1654cc22cb72b759ab692b73720292 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8f62265a87fe2c5fda640f107f5ead13eb89c9b1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e15557e76d7beba2d8ae309dfb9f302549d106af |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/7d59e4ebc393afce751546d72ee606f61a2bc54a | ORPH
  riscv64    |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/abbded64d18ed1d3f06921a9763eda09c61a9754 | ORPH
  riscv64    |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/9cf0cbb79327c20b43dd2da6abf9e326d2e0ca69 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
                  linux-6.6.27 | 2 
               apcupsd-3.14.14 | 1 
                    bat-0.24.0 | 1 
                    gdal-3.8.2 | 1 
               pulseaudio-17.0 | 1 
qt5base-da6e958319e95fe564d... | 1 
                  reaver-1.6.6 | 1 
                    volk-3.0.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b21dd64b847f69644a798788eeb9c15ddd9fb001 |     
    i586     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/072144f81ff0b221dee6cf728f310848cae1fbbf |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/cc978a948963a5638ec5ab5c1c0953e0fa458195 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/dbcd8b6e1c9e1e696f9340e0eafbe736cba5c88d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/856f59d515ac8be8debef4a198825adccbea2a03 | ORPH
 powerpc64   |          linux-6.6.27          | NOK | http://autobuild.buildroot.net/results/f0706cd92d2ad4d56c9af636dc3d109b2de571fd | ORPH
 powerpc64   |          linux-6.6.27          | NOK | http://autobuild.buildroot.net/results/517df829f0e9c99489171aec3d455fea85153674 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/733098c022906d2a207af2f7afc6f0a1f73b3da8 | ORPH
    arm      | qt5base-da6e958319e95fe564d... | NOK | http://autobuild.buildroot.net/results/10d157c2b3f7142da29d38ed1b3f8d34c6b92588 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/4baf685b6bb962b130274393568a8853d15e986c |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/6aa40628b1d339828b2dbf39462436d3ea9247f4 |     


Gitlab CI results for 2024-05-13
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307823  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833309173  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833309174  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308175  | ORPH 
                   TestNu | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308218  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307649  | ORPH 
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308461  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308479  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308513  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308568  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308569  | ORPH 
        TestRustVendoring | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308571  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
