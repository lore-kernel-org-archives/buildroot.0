Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69657C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 05:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B04A960F8C;
	Sun, 23 Apr 2023 05:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B04A960F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QjGsn4qFYRO; Sun, 23 Apr 2023 05:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BEC660BDE;
	Sun, 23 Apr 2023 05:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BEC660BDE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D04E1C29A1
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 05:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 317E160BDE
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 05:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 317E160BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuyZLjvg8Q-F for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 05:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3359860B78
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3359860B78
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 05:39:02 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 37DAA240003
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 05:39:00 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 05:39:00 -0000
Message-Id: <20230423053905.317E160BDE@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1682228340; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=54qo0PhE0nv0K+xgnP/JZlVHhahB8aTSmbOEn1SxQYw=;
 b=Y9bTmn1JKHZQoC8ItM8Z2Jd8+RccJMN661+tYd9sX+wsUvp/hiZ409tjEcl/yNOuB+kIyy
 KAS8D0IxvptTKMmIa8yoTF9fKvnbU0BSOyCH7Qn9wZKN0idg4jtcuFT4vkuzpsTuaoFU1V
 cCsidafaN170k+xL7vyCoyMZwb5+Cd74WU3ysypWRFPgVTK597Thwf5I9rUQbQgZqgaJ10
 K+HBZK/U5r1mmBEB5m0X3CxKLkM78nAlt67LMCVAglBipWbEJFM6PW0xb/q+w3avzRkJKj
 V8q+nXKWEfCLcsX2Llz5IT7fQNENZiU1Y2EQVb/SSaV9UCJ70GAV5rL7w+Q/VA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y9bTmn1J
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-22
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

Autobuild statistics for 2023-04-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  5  |  0  |  9  |
    master   | 78  | 56  |  1  | 135 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 6 
            host-binutils-2.38 | 3 
                  linux-6.1.14 | 3 
host-sunxi-tools-1.4.2-168-... | 2 
                 uclibc-1.0.43 | 2 
                       unknown | 2 
                 agentpp-4.6.0 | 1 
            altera-stapl-0.3.3 | 1 
         argp-standalone-1.4.1 | 1 
                  assimp-5.2.5 | 1 
             containerd-1.6.20 | 1 
                elfutils-0.186 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
glmark2-06e78b67702b5413335... | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
                host-go-1.19.8 | 1 
                  jack2-1.9.21 | 1 
                jailhouse-0.12 | 1 
                   libnss-3.89 | 1 
              liquid-dsp-1.4.0 | 1 
                     lxc-5.0.2 | 1 
          ncurses-6.3-20221224 | 1 
                  ntp-4.2.8p15 | 1 
                    olsr-0.9.8 | 1 
                 openssh-9.3p1 | 1 
                   perl-5.36.0 | 1 
                     pv-1.6.20 | 1 
                python3-3.11.2 | 1 
                    qemu-7.2.0 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
                   shadow-4.13 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/ab257b01d6dcb37c6866721436c983fdfdb844d2 |     
 aarch64_be  |       altera-stapl-0.3.3       | NOK | http://autobuild.buildroot.net/results/530fc23aa4aa0cfe5976389c6f07b650b2280e74 |     
   xtensa    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/71032870ffb0608b6c5422a4df0cffb010a8a5dd | ORPH
  mips64el   |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/91fff3e5022b0cd705b7f62a89eda2a7a36ef687 | ORPH
   s390x     |       containerd-1.6.20        | NOK | http://autobuild.buildroot.net/results/728abdcbe2e19d60a98fe1bc3bb2a0850b72e9d5 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/20e0972211316f83c86dcae118caa66231a7165f | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/11009f150d03627cc74a811200919cff2b5d37d9 | ORPH
   nios2     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/737e8dea8d689b70e6d30aefbe795ada9ba2869a |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/44f189c9ef1f7bdf97352ca8746062f950902a94 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/aa15ad52251acffb59daad2559a75b35925ea36e |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/64843a2f799c73a202cf6a1cfc0206998b690c14 |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/822b57c468a412ada66825d5057b6be9d695f87d |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/59a3339c82a1bb23b837455bff5ac3f50c6352ff |     
  aarch64    | glmark2-06e78b67702b5413335... | NOK | http://autobuild.buildroot.net/results/c7479a4ead15f752f92ec16a246b4a8f99c101b7 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/0ea8d6c96110f22d0eb7c47bf978b858a604c177 | ORPH
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/19c343ff163e14270e9dfbd2cda9e7dded5ae3be |     
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bc06184a690809c9ec06cdef0a6d6253bab47c08 | ORPH
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4e2d8b12ea664046ba66fbc8623b6c4bb712cc0e |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9007a2e09c7abcfd9698b2192a8f7dc544453b07 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a656988c9a14450862d4bce1c6c0666d3210b4c3 |     
    arm      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/6858616e36c129f43859bec27205199e933ea8d6 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/36d50fa88f7914242629a18690982e2f807f4ea2 |     
   s390x     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/0a6164e1cfc6ccb5603b2c16a680fb369d479315 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/babb3e7b75a86eee567f318e2520f2b59661b657 |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/38ee219b202c501778c3492436f5bc38a681b277 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/acd6dc3eec4f4c6e3f9a0fbab8532f560752e36b |     
microblazeel |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/137fc9b8fbcea7cf1f145dc77bb83db048afb1cf |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/fa3b8405dc9233e5bb17d6b3e4fe35ea2c1e598d |     
   sh4aeb    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/b617d535d852c70be812f59990e329c3e44e5d60 |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/9df750507665264c2b22e5d7d8f24e13908df3cf |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/eb22da398fbfede5457627c49c28617c98494ec3 |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/f271f96a16416460cc634fed497563e959017642 |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/b57b024ab4c23f882cb2a78bd8f1800f5e81792e |     
 microblaze  |          libnss-3.89           | NOK | http://autobuild.buildroot.net/results/379856929cd79058c603d43b4fff92b75c11e5d0 |     
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/90b8e0971d9427c7fe24d74ab387ac4954c8f0be | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/1e55cbfaec0c125213ef3d80b1e16e36f4f3b97e | ORPH
    m68k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f02b1f15796d63368eb3b69daf62286d0dc46a2d | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/ca47f50354b52b338abfa49bb8ed2e6b591e4ed6 |     
    arm      |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/786b3d02f727875d283c89ee7ec7d351d64142ce |     
    i486     |      ncurses-6.3-20221224      | NOK | http://autobuild.buildroot.net/results/16cef2ec77d9bb66c694d695dca819047a102608 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/6dad3263547b7dc2b7f72290d300f1a1af69dc87 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/cc3628716dc6e1d4eb1894dc4da2eb03af7ab6d6 | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/9080af4777cf8cfc612a68c9d35822095fcf7a74 | ORPH
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/0c716a52ee29570d9c164f4c99bc1f069acfc5f8 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/889effbb169512c033746b997fcbbd03014b4f6b | ORPH
   arceb     |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/0a45582db301f05f5351d97b28722eebc5599cf7 |     
   mipsel    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/02c5624ee622a61b9c57e5e66bd8ca7ad098606f |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/ce585f82045e8dcdc78d95a958e6720772bf0c34 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/323db549d1e007ed71178c149f2719d1df304d80 |     
    sh4      |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/2d37073529605b30d1d2345b9330b6a4b7f9e906 |     
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/54d277e11a0d15bedb0d7b224810cd1ea0c2e2c5 |     
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/5de1cb39fd61df793acddb3ffd5c155286555831 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/3f0720abb0401fe06905f4eb25ca5b618e132cc4 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/4ec2c50c4fd2d297051a4e87b6fc51983047caa4 |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/5df699529a77a7606b92a00f3df34fad5d80d754 | ORPH
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/d985c7c329133d8e93939f2b4e4f071aff086f02 |     
   x86_64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/7a4d6ecade18538a882d17333bfe8e0007f54e65 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
                host-go-1.19.8 | 1 
                  linux-6.1.14 | 1 
                 uclibc-1.0.43 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/655fa89a6259c4326d8ba10496d3c291e0dc7a9d |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/e1087fef519c0259da2622a065d7634d912e670b |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/f16b0bdac46015cbd65d389ad07647307affe50e |     
    m68k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/275956bc6f9d5d1d57b38e36a7278fc13c27f84e | ORPH
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/8034ba797034cfb4c6643c8605b7b5828d5576ad |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
