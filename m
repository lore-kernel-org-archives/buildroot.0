Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DFDC6FD1D
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 05:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ACB0615DC;
	Fri,  7 Apr 2023 05:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ACB0615DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wH3lEGedyLBl; Fri,  7 Apr 2023 05:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12236615F0;
	Fri,  7 Apr 2023 05:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12236615F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66B621C2DFB
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 05:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1114B40162
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 05:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1114B40162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wE6SYCYAZNr for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 05:30:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DADCA400C1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DADCA400C1
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 05:30:40 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1CDE320004
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 05:30:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 07 Apr 2023 05:30:38 -0000
Message-Id: <20230407053043.1114B40162@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1680845438; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YfqmxWghvJepK6i1N8MWWRAkwm57YCHBtchSBYHZ1hI=;
 b=JOzhA6il6W0b5a+ALcITsnTedHzOm51o6lcrLRBEIXiTLEEvfrmRvVM7k7IKuv+DyWYVfY
 Tav0OcECQRBOiQA2k6xnABBbvjjES+zmHXwAXrbaS1+WP+Aqu1oWGHZwySZmn8QD1r7Yhy
 6ZEHL1B03Cqq7crQ5NYsuMHxyDAEZKIIPDSG05rl42Z0jP9m1gFvHJ8FmhlpUHnO4gBRlP
 GFh/OatrLPNO0qis1gspeY89PUPZHkbG+LGdzBiYcQbfkCb6Cp7ffDKI0DIktXuL51fTTm
 5+vfF4SM1j2uWNYfRWoaS+LusFaPfGJJ2pLgZSyYOwXZRSAn1x53JLSaohpSFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JOzhA6il
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-06
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

Autobuild statistics for 2023-04-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 20  | 11  |  0  | 31  |
    master   | 120 | 84  |  0  | 204 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.38 | 6 
                  linux-6.1.14 | 6 
                       unknown | 4 
glibc-2.36-81-g4f4d7a13edfd... | 3 
  gobject-introspection-1.72.0 | 3 
               host-qemu-7.2.0 | 3 
             bluez5_utils-5.66 | 2 
                busybox-1.36.0 | 2 
                elfutils-0.186 | 2 
         host-gcc-final-10.4.0 | 2 
              host-rust-1.68.0 | 2 
              libgcrypt-1.10.1 | 2 
               libglib2-2.72.3 | 2 
          linux-5.10.162-cip24 | 2 
                    sdl-1.2.15 | 2 
                   shadow-4.13 | 2 
                 uclibc-1.0.43 | 2 
                 agentpp-4.6.0 | 1 
         argp-standalone-1.4.1 | 1 
             containerd-1.6.20 | 1 
                 coremark-1.01 | 1 
                 coreutils-9.2 | 1 
                     exim-4.96 | 1 
                  ffmpeg-4.4.3 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/erofs/erofs.mk:46: /home... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
gcnano-binaries-0ac1a89d7a5... | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
         host-gcc-final-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.19.8 | 1 
                 host-wine-8.0 | 1 
libdill-32d0e8b733416208e04... | 1 
              liquid-dsp-1.4.0 | 1 
          lttng-modules-2.13.7 | 1 
                   luvi-2.13.0 | 1 
              mosquitto-2.0.15 | 1 
                    olsr-0.9.8 | 1 
                     pv-1.6.20 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
                rocksdb-6.20.3 | 1 
               valgrind-3.19.0 | 1 
                wf111-5-2-2-r3 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/7e3ac4883d6ef033f0d5626e5c8356c26040906f |     
   xtensa    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/d65fb7f85d0c94e5d6fbf95712efc6766ec62688 | ORPH
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/e8c422dab1e9d4bde4b094e205d8dc2cc7dafd92 |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/9135ad5ccc265de6aab5d4aa710eb26484faa7cc |     
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/13f74fc215e6e3b3102781d3b4ab9dd0631aa3e4 | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/252c4bff32fa107e836b926ed876faab7a54f151 | ORPH
   x86_64    |       containerd-1.6.20        | NOK | http://autobuild.buildroot.net/results/b4eb66998b79949a67b7e64ef76397f647c0cf28 |     
microblazeel |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/6e99c515c752a911211dfb5f3932ec1d9dd1f856 |     
    sh4      |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/adedd4e747d4b6f639a9ded19d1733291df5a2b6 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0d512e407c8b4d1482d99ea170994e2f1110a69c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c5bda2330e193fdb36ff8e16701c2735634e7858 | ORPH
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/ddaeb5a98f9f51ffe66bc7241a0d88ec62434a02 |     
   arceb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/55ae69e98c7ae47be367b5fb9e65eac37706da20 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/de908f050152599acdf31772dc8d07c7b1eaa29b |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/35352b87536596b6c395c2b1b218b3b761afd8d1 |     
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/55229395b2229857bf18e77db2faec6c56aebc64 |     
 powerpc64   | fs/erofs/erofs.mk:46: /home... | NOK | http://autobuild.buildroot.net/results/b58a8d1c7349d849622a96b7ce0d2913b452de48 |     
   sparc     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/65111b5d53764bd8b3922baeee8fbed7fa4f7f85 |     
    mips     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/3257ba8e63d572db92c5ff1cddbe15c925d5549f |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/93d95e1d85b06f22254e4c8c28441cd20c2a02cd |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c2173754c77ba9121c1ee5f24aa7bf014ff3e31e |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0b99eb7ad271967d995036d998507363d1f2a0a8 |     
    arm      | gcnano-binaries-0ac1a89d7a5... | NOK | http://autobuild.buildroot.net/results/6c0cecd2d06204b6b197a746b74c90a940738ae1 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/cd6df0ddeabc02220f4c411d2539855e97f9b3ca |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/5ac3d9d1a342964163b7089e191655d28a516b3a |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/f89d80c2da9205a64b091f6aa6ee3ab0cfa71af6 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/91b9e828cd5d79d8bc427a2e579ee0b0d17598da | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cf98720e19ad6549c6a5864b895e629a2b454584 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8e769372711aad3de89b12c322beb150a1fe0bdd | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5c9c902065a88af209e42cd866c6a6473f0247fc | ORPH
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/870942e23acf444fc6041e6cf75660e3a2cadae8 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/64452261955121e33ce6c406959d5a37cfa475cf |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ea66097a1b12915c76f66e55e5530970274527fc |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2e4f0dc062d8c6674de1c61833b4c40616424c84 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/efa3d31974722249d18a258751a09232133f862e |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7559969dc6e1828e0df53571b0f3a924f3daab02 |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e36cb1cf1a41f1f8b27a31167fa994df0cfcc5f1 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/078dbc862204f167de2c5cada2178c72a37bffad |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/ea18e7a13e26d900c15e21520e6c3b72e2bee367 |     
    m68k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e42d6252a9b48b9ba39edd138d22cb511c3b77bd |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/323a45fb6031926e2d2f925c4e7944c6b17daa7b |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/4dc0ab25500033907b24436293d6db241399b53e | ORPH
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/8ac7376a60f8e1d710ea760de7fcd112cac8413c |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/89ac9746a9dd08ba8f6c6998bf23886f1c7566c2 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/39ba51d21dddef448229ee1207192c53634a9b05 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/2f4881b7a51b42a1546323ceb20d3ebc7ed4bf37 |     
powerpc64le  |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/c3c3930959906363fd917ea442782a48c36272b2 |     
  sparc64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/2c3b7239779a2bfa5fff0c78fb76b71ca06f7b59 |     
    i686     |         host-wine-8.0          | NOK | http://autobuild.buildroot.net/results/b4385ce8b1c3dfca373370953dc414347a642aba |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/30369fe3625a0e2aa9a114208cf8c67aecde9578 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e1c2792f4e7e9427374aa9502aac5b4c5634dab2 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4700a40634e4e7a5d85e947c6fe024476af5f3ab | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c148b37ff1e2595b30fd2ce4709fbb038c0aa97f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/dda77fa17f33742a9ba97c286e3b84f69b69acdf |     
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/29425df85a9c5e33d352e085edc9118d43a65fd1 | ORPH
   arceb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/bf26e05aea6a224ba935b502bb0acc5ae7ef29d3 | ORPH
  aarch64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/9ce7caaa9daa2b8e3102c2fa9ab0bd4b3e5b9603 | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/01f9fc7adb005c170756602a2702cc7d45014f50 | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/2b91072c072a1e1b4345cd7dfe948a821fc714c7 | ORPH
   sh4aeb    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/bbba2e7597187107014b86749ecd410c2655d315 | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/2ded9ddbb665ed18823c28130fded7b9172424d6 | ORPH
 aarch64_be  |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/c7a5f80c8f7bb788c5313629d50c5b5d1a7c0132 | ORPH
   sh4aeb    |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/adeb654bf06b7306c448620744b90a207546435f |     
 aarch64_be  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/e3b0ee578c56f217a9697083d603f2f47e7d5341 |     
   x86_64    |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/cc80329ef86f342c04de04aac688288b0d7b83a5 | ORPH
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/d36f4e07d0c3383ae2c5bcb42e169c4c553b02c9 |     
   sh4eb     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9f65c7e753c83cef66a8401d89648101cbb048eb | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/04094d61c289e1e15a5371c36ee0cf92d70770ee | ORPH
   sh4eb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9e1e2880bbe452e4fbdab83b824d43bf466dc476 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/408b1edd0bb4eb976deb139b417ba06b65be073e |     
 powerpc64   |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/daa29055fda3304260336b3ee2c8172e6d9ddb57 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2301d53d59de9e26c299651b6a29a0b9f60438fb | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/24f024669a9b79d7ab7a97919e70901441022b3a | ORPH
    arm      |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/9d5f69d352b6f33855091c8db66c6a0f343427ed |     
   armeb     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/a6a4ec66a88536e8a9aad8a55b141b685f2fc49d |     
    m68k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/bc264fd0a78a0e25c70e9f77e7e45cfd579d9b1c |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/7f55e703f9db28c9b7a311b5807e4394c7dc390f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/75874e41fd72761afd56d278697418f6eac17fec |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/49e632a4c19edac8231f498872a76666f317d7ea |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/78424acec3e0717be28f257d7af373b33db0b568 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a94d50a01e0e4e1cc58bcacaeff65bfcb100c7bc |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/cdde921fb9827af6a1c72c460a15048e0af1dc47 | ORPH
    i686     |         wf111-5-2-2-r3         | NOK | http://autobuild.buildroot.net/results/d2b076fc106d7223ed4bec179e52c6de81b06de3 | ORPH
   mipsel    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/73cd2f1f7d11378acfa10b375e5fc1419b9c9749 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.72.0 | 1 
                 haproxy-2.6.9 | 1 
               host-qemu-7.2.0 | 1 
              libgcrypt-1.10.1 | 1 
                  linux-6.1.14 | 1 
            ocf-linux-20171122 | 1 
                     php-8.2.3 | 1 
               valgrind-3.19.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/5bac5e96593d998906bb958ae77d7d201699b5d3 | ORPH
   x86_64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/46b676e4cc4b54a0ed12f6963980781b621cd478 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bb37cb10d3fa80dab86f7c6ad726767ad5f3aafa |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c4575cfdae6f8867a4cf76b3d300e645ffa657ba | ORPH
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/3dacdbcf33b70503398599ed0e685281481b61e6 |     
  riscv32    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/f7ce7106359f5762cadc496978a4cf73dca922d1 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/bc167e20dea902d3a9d83c866dfffa5c6a59d1a2 | ORPH
    m68k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/269cab77d2eadadb377f521c62df711612fbc629 | ORPH
    mips     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/84ddc56d94f583cdc46a1406d13e4381c78bd08a | ORPH
    sh4a     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/77059fcc5b74ed185fbc4960a0a02eeff777cc38 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/2391484bccb224fec89d68fdd0f9f6f382f5e3d7 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
