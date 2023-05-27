Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0479EC77B7E
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 05:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6F48417F;
	Sat, 27 May 2023 05:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F6F48417F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjpDimLm1vi4; Sat, 27 May 2023 05:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC1008404A;
	Sat, 27 May 2023 05:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC1008404A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 768621BF3BB
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 05:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4942482D49
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 05:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4942482D49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zbm-WbyZUZnh for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 05:33:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9C582998
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F9C582998
 for <buildroot@buildroot.org>; Sat, 27 May 2023 05:33:56 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EDE52000B
 for <buildroot@buildroot.org>; Sat, 27 May 2023 05:33:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 05:33:54 -0000
Message-Id: <20230527053359.4942482D49@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1685165634; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MwizoXUzh+Pbo7sy4ZzUQpnDIYPsuSgtyovPpAVFFgU=;
 b=lU0ieu4n5weDeu5LcFhvtIyIO4HYHOaaTlwMBhR+/VY40gQRCCaV64UsqaAU70QMwy9eVv
 EAZsQryOQR+DfWFxwEgYEuEalTmcP7NgTchjUmYquoF7jhSxFE8Kk7Vd9a4vqLPB2xcJ/k
 uvdXTpGfnf/Cmt3Bs8eZ8z4cqmCATUg+5ZAeyRyaOMUmBfWSzbpbi5nxkT2WOj/oBwa91i
 aY8tTWXXbu14Z6UYtaE6isp5ivKuSPLwtfrlauineFBrlrK9WD7sKZtGpVuK0VKi8dqAgw
 xpKERQFBcFIUpgWEHxZFyW1yibyR2QYPHkaG1lpQYsQipMHOtrZ8J4fohzp51A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lU0ieu4n
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-26
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

Autobuild statistics for 2023-05-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  0  |  0  |  3  |
  2023.02.x  |  7  |  5  |  0  | 12  |
    master   | 52  | 63  |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.74.0 | 5 
                 agentpp-4.6.0 | 4 
                host-go-1.19.9 | 4 
host-heimdal-f4faaeaba371ff... | 4 
               libglib2-2.76.1 | 4 
           at-spi2-core-2.48.2 | 3 
            host-binutils-2.38 | 3 
package/sdl2_net/sdl2_net.m... | 3 
            host-binutils-2.37 | 2 
          linux-5.10.162-cip24 | 2 
               syslog-ng-4.1.1 | 2 
                       unknown | 2 
                     audit-3.1 | 1 
                    brltty-6.5 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
google-breakpad-c85eb4a59b6... | 1 
       host-python-sip-4.19.25 | 1 
              host-rust-1.68.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20230127 | 1 
            micropython-1.19.1 | 1 
                mongodb-4.2.18 | 1 
               nfs-utils-2.6.3 | 1 
                 opensc-0.22.0 | 1 
                   perl-5.36.1 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                     pv-1.6.20 | 1 
            quickjs-2021-03-27 | 1 
           sdl2_net-legal-info | 1 
           v4l2loopback-0.12.7 | 1 
                     znc-1.8.2 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/a43544d44eea401d78bcaf692ebe9919254ca3d6 |     
   mipsel    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/597c528a9462b8bddbd543973a5cf9042736d28e |     
    m68k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/0c9bd8dc89572c17f61045bea72796be9f0c9232 |     
  riscv64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/93aff019650426165284bacca942ec6127e2e137 |     
   s390x     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/7d6a10f877c284d9453f574fd9d08616c21eae8c |     
  mips64el   |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/5e2bd29ddd65d8c99347d787e6d3411cc6839291 |     
    mips     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/1aa9194ceac4838410d88edc53eac66ebc813b79 |     
    i586     |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/abdccbff4106e08421e43444e0507eace5d99e65 |     
    or1k     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/cc025e95b0eb2ba3219b131098aad91e34cf117f |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/896300dbcd90f332a3bfda922ffc07b419ed699f |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d3f5b47c53417dfe364a2143c6dcd7a784399661 | ORPH
  aarch64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/29ae53cbe95bfd10049be936a289423bcd090f66 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2e8037fcd11d8006b0a699bd63c02f0f47e56fb5 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/61b8c3a2ecac864368b694f7eb8daa6d7301fd78 |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/405125055509ab3ea4cea99df9af3d0f495e2752 |     
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/a60ddb8858a3fcde41307f5e547d74feb545cb29 | ORPH
  aarch64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/ff6df9a16f9d074c4d86c7bab5dff66226c3b4e7 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/75d3b1d166bb147c3621eabb7b74ce9786f7ccdc | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/b7a51faa66a72db3588bda272b372692ce03b3e2 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/6ad97ab4883f38ae3af14b348546d18110596732 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/4e66c1d14f835e62abbe1bf86eb284ff7a396eef |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d93bc2a0fa1a9f5f4e0cbeaf6946f2fc151a2408 |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/6e0860f4f87d230a61bb9d4d7a15e8867d9a4bef |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a6926388c35de4481b17c1af71e735b098d456c2 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2ff215f96b4c931e5eb2f87b3466e503e5ba5aef |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/33307141f6a33d0b62ab44ce8a79d6fe07d0fc9a |     
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/38781651fbe69506f68c85a19f54ababc2327021 |     
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/cf2a101f8d173b145d3257c01d42d3f9a56895cf |     
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/7859d8ff6c0645e5a3486d1573bc972abf79d7f1 |     
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/36891f96699004a43bcd4a75701b6e6ccb731bb8 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a65525df44491d0fa463022dc48bfabfb699d44f | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/93162ae6d32d3439b93a7b0cb2385779e7a2e138 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/76b08f75a679e3ad25462955f89a87f665020a7e | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3ed804f8082d30f020ca57bbbbd2feef25fa12fa | ORPH
powerpc64le  |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/b4ce308555eacda88fc39d1e9454aab7cf0a1dab |     
   armeb     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/653a30df04f77f542c1308ede3dbfde3b6fdd1b6 |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ca3f67d26e683dc515801190cfc0496d6c5dee7c |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/bd1e3e9f10573b15af575d5f1ef1091f80b69bb3 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/95f09d668e73ab1cba57023e4e030e80d7bc0b84 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ae24f37b46929cf7746f2bd6d0771d15e5e3ea5a |     
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/45f691ce99f967844a6c8b2bee78338c5d07e0e1 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/3285e32c1901cf666fe67fa5e6e6f361b75f67e0 | ORPH
microblazeel |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/cf4e6a0b97153e275678b7eb024b8336c11bc4c9 | ORPH
 powerpc64   |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/1ec8e7efbc11321d99c5889808efb6d59f7ab65a |     
 aarch64_be  |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/0085b8e93349aa234997c3f93b7eb4e10ac296e1 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/353745154048c0903395c338cd7cb7bb52f7f78c |     
   sparc     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/5272ed5b5526f384dbd8a3f9458a4a9cedfc1e87 |     
microblazeel |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/6851034e32cab8797f7fef6467ba61748f255257 |     
powerpc64le  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/edbc35f2120ac2329f41012fa35b07deabf04286 |     
  sparc64    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/15347cfa53cfba98d90df9fdb477f92f7ab576bc |     
   s390x     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/5afec4e53276fb23d311d41725007c755dc317ec |     
    arm      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/00ba1b6808d310049d0f144b8544633a7ada15dc |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/177422fc9ffa01e5b985c9293206c407514306fb | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/b22ea4fae37883995f6a0bf9e4318f07a7ee49fb | ORPH
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/09aa199d7cb0349e36746e1908b0fa2289495d35 |     
   x86_64    |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/659e111ea3732319478a66130e92048a27b305bf | ORPH
 powerpc64   |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/e9d3aee88c6da2a490c349e218adbaa5ea826d27 |     
   s390x     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/682a34b479ec79f67f3cae7b1736a1c9d49df956 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3257ff53d43741a975dea9f2d6640a6a6c022d45 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/bc27877355a5d210ae34057aaebe0f03973ba8f3 |     
    i686     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/d815a76fed84d1ba5de9ecb0a0b9b56cfe6d22d8 |     
powerpc64le  |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/4394521933e9aa73800f0f3fba04808edb4d2430 |     
    arc      |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/a47ab336ec1bda6aa01ccc92f0155581daf3494d |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                      bmon-4.0 | 1 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         host-gcc-final-10.4.0 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |            bmon-4.0            | NOK | http://autobuild.buildroot.net/results/bb83e85555f6d52f652325a84f1678e6973039e7 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/6a7c081a58f061a683bef6620a120d1bff0b0a06 | ORPH
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c41d0c2c9230b42f2515f886f38ee8a0c5b947e1 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/6336503697600b10bcfbc708d370016ad745a4bc |     
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/59f32169e73cf09bb1dc90c02fc5cdb0ad468a1b | ORPH


Gitlab CI results for 2023-05-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051144  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051167  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051204  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051206  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051235  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051250  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051271  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051273  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051335  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051349  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051352  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051356  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051359  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051362  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051365  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051367  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051430  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051445  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051450  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051483  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051558  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051575  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051613  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051622  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4348051687  |      


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819048  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819049  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819089  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819092  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819095  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819231  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819256  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819252  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819285  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819300  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819388  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819409  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819410  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819411  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
