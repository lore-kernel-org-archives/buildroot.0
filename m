Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB7FC433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 04:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6767760A94;
	Thu,  5 May 2022 04:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXU3UZPbCRNa; Thu,  5 May 2022 04:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3FAB607E3;
	Thu,  5 May 2022 04:41:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9A21BF8A8
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 04:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C8344014B
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 04:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5tKu6LekbI2 for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 04:41:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FBAB4010E
 for <buildroot@buildroot.org>; Thu,  5 May 2022 04:41:44 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7E1C7E0002
 for <buildroot@buildroot.org>; Thu,  5 May 2022 04:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651725701; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VJomMjKCb+cRPOcHLWNotah+pMyTSz9WtvUaWGNTFwY=;
 b=a+9xiMiLX6/tF/ySrqnNWRe8fwLcH0x3ONFHX9VX7ijnWewVsRUY/OyjMAuiibg4LwNqhR
 TBgiXgP2/GGpKWvrFJqrgH11YmKNlJ9spK+J7UAE8XyphIndbwdwNVAryWjRT5U5VxxAG6
 zp2Wr0r3j9o1RH2xYcNojQEBtcvwUndPNKM5fOEfYfoimQSGUm13ZqO88PFqy1c0c+d+io
 PYVZ3Be2OhQd/WwpEO7pOH5N3rw3lgijNIydnGy2bBGYjQck0vl7KIdkMAR5VwnaMm397b
 n6SbJPipRD7D3QTps8uj+gsXgeE55FlguXrsu1q00i/4ULzxGKV6BFTtxxeZhQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 05 May 2022 04:41:41 -0000
Message-Id: <20220505044146.7C8344014B@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-04
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

Autobuild statistics for 2022-05-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 24  |  4  |  1  | 29  |
    master   | 122 | 120 |  0  | 242 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 17
         host-gcc-final-10.3.0 | 9 
                 uclibc-1.0.40 | 7 
                pciutils-3.8.0 | 6 
               protobuf-3.20.1 | 6 
                 zlib-ng-2.0.6 | 5 
                    git-2.31.2 | 4 
                     frr-8.2.2 | 3 
host-google-breakpad-c85eb4... | 3 
                     refpolicy | 3 
                  zchunk-1.2.2 | 3 
                  bcusdk-0.0.5 | 2 
                  exempi-2.6.1 | 2 
         host-gcc-final-11.2.0 | 2 
                host-go-1.18.1 | 2 
host-pahole-73383b3a39afe86... | 2 
             libopenssl-1.1.1n | 2 
                  assimp-5.2.1 | 1 
               belle-sip-4.4.8 | 1 
                    bird-2.0.8 | 1 
                  boost-1.78.0 | 1 
                   bullet-3.21 | 1 
                busybox-1.35.0 | 1 
              containerd-1.6.2 | 1 
                    dhcp-4.4.3 | 1 
           docker-cli-20.10.14 | 1 
              dropbear-2022.82 | 1 
                  faad2-2.10.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
                      grep-3.7 | 1 
           host-harfbuzz-4.2.1 | 1 
             host-libbpf-0.7.0 | 1 
                  jack2-1.9.20 | 1 
     kvm-unit-tests-2022-03-08 | 1 
              libgcrypt-1.10.1 | 1 
                libressl-3.5.2 | 1 
                libselinux-3.3 | 1 
                 linux-5.15.33 | 1 
              liquid-dsp-1.4.0 | 1 
          lttng-modules-2.13.1 | 1 
                  matio-1.5.22 | 1 
          moby-buildkit-0.10.0 | 1 
                    musl-1.2.2 | 1 
                    ola-0.10.8 | 1 
                   perl-5.34.1 | 1 
               pipewire-0.3.50 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
                proftpd-1.3.6e | 1 
    python-cryptography-37.0.1 | 1 
                    qemu-7.0.0 | 1 
                rng-tools-6.15 | 1 
       shadowsocks-libev-3.3.5 | 1 
                   uacme-1.7.1 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                  vlc-3.0.17.4 | 1 
                 wavemon-0.9.4 | 1 
                       xenomai | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/792277d04e5a5a2b73797dd72ef8b08dd9e0470f |     
   xtensa    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8d57f38c5f9e4ebd0c70828a9888a306b9bb5ed4 |     
  powerpc    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/fd9a006c6d43c0b4e3c99aa86709799a9c0c80bc |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/63c5417bc588a2fccab3b0b51fe068c78eaa0967 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/71fb74a63bf42449ca1821a94959bdfa5749059e |     
   arceb     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/718350d81b64c00a4eaf55ac243ad95c458e1fa2 |     
   mipsel    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/9ca11f209350300528184bdc5c43001096dc3561 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/16a432270c3e366428ac4687a38c8be017b6a8e9 | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/fc3f4bbdb6ea7eb6596c7f89faca5aeab6976d0e |     
    or1k     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/02af8e03b230054b5c982164e5e3b35d4ae7794e | ORPH
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/b8b5e4d0374926873aaefe9bf8430f3c9abcabfe |     
    or1k     |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/50b39874f86eaf98f1024f9ac496476623116cd4 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/dae5f19c134367d7ff5e117b6a81951a7fba4d1c |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/6a13cd5d7cef0725288835591e8e3955cb4bd51a |     
   sh4aeb    |          faad2-2.10.0          | NOK | http://autobuild.buildroot.net/results/b043bb0d3c97b2fef08c6065c3362bfbe1ffb2fd |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/b9f1832f4122f767c0913b8650fdb988f537f89d |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/fe43ae287354fe2f260f60071ea99803893d74db |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/4ee5fd9bfc6024d8efe4e32676ba450b9840af8c |     
  aarch64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/9d493910d06a2aebac6836bf75d15b50bdacd9db |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/970d9e5c6dc8ce5f2fc4f57bed79a82754a2cf14 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/729e9777da3596bf3b58fe26b464c2b9e1e2739d |     
   mips64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a3b9bcb0013566dfb2b6570b9f6e407a1fe9f7d4 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/7da5474f015fbfc145a7f32953049c154153d765 |     
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/48224960dce8d30080b246c3209b957766a1a426 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/77daaeddca4f06f247a7eb191c0988f83492dff6 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1a5a32dd185a26aa9b5a7a265151f6eee442b8d1 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3063e7b7a92b6af6311145bfcad4f2df142c8a47 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ea80b8516e77a737df588e82e32f104fa6052b56 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c1b991a4f931ee436aada72c231fb26ee8631f8b |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f7c327cc337bd3cb3959bfb7228ea98125d7b53d |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0e85bd97af136621574e5a004b41da9fd5cbe959 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f06b2696ed62cdf6b33a5311f0271cb0774a719b |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/85261d89b35c1734074fb4e8f4afea8b08749687 |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/955b140cd715069620132468ecccb8b0e60eed33 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/1a771da206da419a50e1de17d1e7410b0631e177 |     
    i586     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/89bc25fb414826ea29915f2ad99dd33f81ee4a41 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/c320f1290dd176acb50ee151904bfcfacc468691 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/682eab8e6ace25b61d3421fe73e79528b2d24994 |     
   mipsel    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/24bb5c2b23930483e53f10428867ce4c3734e278 |     
   x86_64    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/492c31891f5c8f879392dc35ce50c160d56e72bb |     
    sh4      |      host-harfbuzz-4.2.1       | NOK | http://autobuild.buildroot.net/results/21629faa3324b147a13fc13d9c5ccedb827f1df4 |     
   mipsel    |       host-libbpf-0.7.0        | NOK | http://autobuild.buildroot.net/results/022cc398fc0f5f6ecc06311772d5c9ca5215db86 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/77e892fc30b45c0ccabac5f785edd3662cd5f1e6 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d71c564994d5722ee20c93f18c85fb7799768319 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/d9b4fd5b4d6edb4c600b27c9bb60aee14e4e1f3a |     
   armeb     |   kvm-unit-tests-2022-03-08    | NOK | http://autobuild.buildroot.net/results/02384d4ddc5f79acf97f21000c058689757755e5 |     
 powerpc64   |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/eb60bb95411076b92f5c63f9b21c6e576998031c | ORPH
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/d7c123e84d83e3048d7e018a12922ea5b0bbf539 |     
  aarch64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6ec91195f13a0696286891e12974ddbff04bf39f |     
   xtensa    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/137dc4f7f1193fb60d020b6ff14b7641601dc3cb | ORPH
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/b0c15cc9755f49d1083c8909faf39f9b832e0ac4 |     
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/b1e201b45cc22b5334726464963516b1da016592 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/42eeeea3396aa6bcea6c5f5e64c90745d4057e25 |     
 microblaze  |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/98dd58c4c2f151d8a42ec4239bbe66645024accf |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/26a5303cebe483edbd0cb05d74435d788450db98 |     
    i586     |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/6b15e7ec208a11dd7e10b7f388e555ee7c369b03 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/cd95a8e2d6484a1ce9127d613b00202a8a31a7f2 |     
   xtensa    |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/97d07f84cf8e34a697bd332c360ce353b96b2e26 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9c95daf8d5499fa96b62d6549e44e361d64fd2ae |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cbd81c76bae3f1cdf49845d4c2af20e9728428c6 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b28f02b5845d4abd7a131c39d1757062d31839cf |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/1a9e02367f72ee96a47dcab48f69af4c190bc023 |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d54829838699d0945242417587df65551a8e741d |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ba14b6299ac2ef0ba9950146f42a43dc8fcff789 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fda15c6f33b03502c29d2d1021dbc3cadf1464b0 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/19b16890a15ba9250ad5bedf4da5845abcf30a6e |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/aa8b2ee04f92093a5fd5814707988d202c79d4d9 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6e0c8411d38716738b20149a09fd391866b68ac6 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/aa62594b4c7b29c5d3f72d82ab8324cc39cce2b4 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fa820c32127163aa128c2c21f30b77a4f05726ed |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3e97593dd6d0b85419341b049631f65edb688392 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8b5fc7e1942364c56f8714591f4b7d581b600668 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d926f3d7e6548ab473b9733260fed8e81f03991a |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3f9ff86e6aa537fe69d6aa9ca5674d2355a54aad |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6db4ec6cec80dd108d17e3ba6ae348665724501f |     
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/f7149545a521b1d5fd0baeb17e661a42c3568c97 | ORPH
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/fbfd279077c796313889d12385138c3adc7abb4b | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/efa3baf57b3cce01dc740be65004012d2137bb97 | ORPH
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/a5680bbcf32b40e8141b79dc70a8f874e86f50b1 | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/2852422eb3fb4aa5a0eca69a4e245450639d6e5d | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/8b33149cbbb9587f8001efe5b652ec2d4a99f090 | ORPH
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/813a2cd67a2971726faa60fc89455f1a858d081d |     
  powerpc    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/520bc86e25c6478e5a912f6069118afc51e793fe |     
    i686     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/ed031e6084685243a065e342aee279fd420ce7d5 |     
   arceb     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/4245c16521b78c5d4348f818625d4d550ba05d79 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9df80a72efbd957106d3eb4f529288671a1901ca |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f0c6fb31e0d7d40a34b166a4ffd2350a46fed4c7 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6a5f10042abd54ce1e725f70894f24987f510669 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b97fbcb5756372742d5cd8fdd9e0568af2aeb04f |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9b86630d84f4cfa0b3bd94aa82af6a266d7beece |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/552e6a8c2d9be1b178ea5a9a44e81338bb17cd9a |     
   armeb     |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/2662c546bcfc7dd390644eb0d86df4abb6a97576 |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/13a0367a9d9c310c7aa02c335156937977c07659 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c7a42cf255080d427765e41ab87ba2da31998911 |     
   nios2     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/6f42457a9adcfc805dc0e5d10e7508439bcd625c |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/e5c7c6b6299fa077f58dad59135c1af0687cb016 |     
    arc      |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/e46bb131c439caf705cf74d6dba60950d98bf286 |     
   nios2     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/d63c9cf928c4c94c8f19461696d15a0949f4d7c0 |     
    m68k     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/90ca4f3638c22844b47305deb05c579e8d358575 |     
   armeb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/77276165354aa1671a7478289011cbc5ea2b04a2 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/73cf53deac73df1b2600cf0055cfe673cbcea84f |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/dc6e8ad0801b8641679c43f6a9e9f682394e12c7 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/04c26cd43786d765ca8691476077c5746f2ffcd4 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d72f51ccaa2911400e5b607e7fd259093e5f4b8a |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/bf0172dedebec1ff1542a88b81819f675705b5bc |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4da8eab248b1f6819531ed05dd7f17745592c0bd |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a0c3cefdb1b32a917ad37cafa16ed110d22e5628 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/dcabe1cab13be772ecdd4595b126da5711d029ef |     
  mips64el   |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/5158bff46da50ad0629814243df7cb37a2dff333 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3902c09e34e7ba90ae9120ddab35e75e4e847260 |     
   mips64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/6c66a8d42c9e9475363af11c08013e950f1a512d |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/90b463c70dd3d67ba1a11e2e1e3bd9a4439d80ab |     
  mips64el   |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/e2d40bfde1cb7dd35fff933006aa23a432a045a1 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/22590a7038a40da3700d56c1f82f7dc74225702a |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/05c450997a85d51d89b0e53d7cb810b012b42ef9 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3b68ed6eb13ae71679b2be49eaf980d578cec4ca | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ab0507262dff9762729eae7aef8a9a832074390b | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ee9369f5f450feadb867d5c734e1aaf6208c61ad | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/907945f2bae17ce4bae4047f21c22b0c3686f18e | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/cac393f6be78ce6ead6328cd5097515c74fe7cd6 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

              host-delve-1.8.0 | 1 
                       libuwsc | 1 
         rabbitmq-server-3.8.2 | 1 
                       unknown | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/437fb7cf70bda548bbfb27863af1f83bd5171722 |     
   x86_64    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/2ea602aca6077dbb331153f7876b2e6752be575a |     
   x86_64    |     rabbitmq-server-3.8.2      | NOK | http://autobuild.buildroot.net/results/0381a04558d3790f2259172d5ac7afe6371b1d25 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a2a9e6840c5e38479a4e448551328fe4db4a3efe |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/7471eacb1d02fd3adbbb2c11dddc882fd31befcb |     


Gitlab CI results for 2022-05-04
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
