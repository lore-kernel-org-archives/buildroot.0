Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CA4C77B73
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 04:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 338CA410A2;
	Tue,  6 Jun 2023 04:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 338CA410A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0X1xAyOiHGX; Tue,  6 Jun 2023 04:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F8F6410A4;
	Tue,  6 Jun 2023 04:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F8F6410A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D57F81BF3F9
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 04:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEB9640273
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 04:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEB9640273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJlGk19ophUz for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 04:39:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD2FC40105
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD2FC40105
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 04:39:35 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C885920004
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 04:39:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 06 Jun 2023 04:39:32 -0000
Message-Id: <20230606043938.AEB9640273@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686026372; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H6Ib5W12Y16ndnxUTqtOS2RhJTmyU8E/+iyWK/GY0WM=;
 b=BWMDkUNVpjv59qrykrWL5RRmGKTQucLy80aoB1445Q6WBL3HdQH0auS7N/BQLKZJ+5HSIM
 ulGsVDCK5pyYrflC67QGoi3s1qgWS2jwx0IwWwjfYrYEgJ1YEu8olu5LkPpwEhCfwof9JV
 IS0SfrlDH8GLhx1+0CiIVE0gKK/RTaJjl8ghJVd35HJekXig5Z2bOwLSGY4fpRmD14UGlp
 6fz/EvkZpiyZKd+mDbFSL96R74jaG6fgIwEqqiH3j1ndcrNrMZ2k3hDM5EdNSYbyXPwgIV
 DkxG9RcshvMIv4yAvYG13VDPzduDLZj2ksN4lEZunVedSdz1UkkhzwanDzlUJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BWMDkUNV
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-05
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

Autobuild statistics for 2023-06-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  3  |  0  |  6  |
    master   | 90  | 57  |  1  | 148 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.38 | 4 
                   linux-6.3.5 | 3 
                python3-3.11.3 | 3 
                 uclibc-1.0.43 | 3 
                 agentpp-4.6.0 | 2 
                elfutils-0.186 | 2 
  gobject-introspection-1.74.0 | 2 
               libglib2-2.76.1 | 2 
               syslog-ng-4.1.1 | 2 
           at-spi2-core-2.48.2 | 1 
                     audit-3.1 | 1 
             batman-adv-2022.3 | 1 
             berkeleydb-5.3.28 | 1 
                cryptopp-8.6.0 | 1 
             dahdi-linux-3.2.0 | 1 
                dovecot-2.3.20 | 1 
        edk2-edk2-stable202208 | 1 
                    flac-1.4.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                      gdb-11.2 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.4.0 | 1 
              host-rust-1.68.2 | 1 
                libglvnd-1.4.0 | 1 
                 libnss-3.89.1 | 1 
               libunwind-1.6.2 | 1 
                    links-2.26 | 1 
make: *** Waiting for unfin... | 1 
                    olsr-0.9.8 | 1 
                 openssh-9.3p1 | 1 
                 pixman-0.42.2 | 1 
           python-pyicu-2.10.2 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
            quickjs-2021-03-27 | 1 
sconeserver-8d1935919a20133... | 1 
                   shadow-4.13 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 
                    volk-3.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f0077bb3d94a5baa7e5c87b6cb9bec7b56c7b9f3 |     
   nios2     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/ccbaf22f42151118d5a680e24cd1f7b54e19bb7c |     
    or1k     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/9d93830f6c82a87c9d10920ae2432f5e74842d1a |     
    i586     |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/e3bb1e0cc9dcc79980d3bed311e6bff6387e2cc3 |     
  riscv32    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/e15464ae7c7ef3d346b4557cf1cb219c57f7bb87 |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3f942a7f78e6c13e8f7fbacabb0dc4a77d8e1639 | ORPH
   armeb     |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/5d17a07fcf7f6e5918f84d0e47575d3f3f25410c |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/477e92594522e3e38fa23dba25a944d782978eae |     
   xtensa    |         dovecot-2.3.20         | NOK | http://autobuild.buildroot.net/results/64638161d0301ca7bba2e11c75f563775f5b19a4 |     
    i686     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/b98bad5dcc86d1e81b09d4bfb78dc048623d15b9 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/455709a42eac33238a2cfc38268521b738fd4cce | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1a6965be398eae59fc5add38b9594b455f76c0c2 | ORPH
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/2dce64118441250b77c70ec3bab73423b0e792b5 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b9df8739054970e85c3651d70303d3dfefd417da |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a2ef9cf2dd84c2350a6d906620e684a1ecfcab78 |     
   armeb     |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/e469ca4f482d58324d4cdaea7ef3fb837b3f5778 | ORPH
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/b7870d09d7c6e9af1f3098011544b01f9b29008d |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c810e5fb7ccb7c735ed46c65e67e6849d21962ad |     
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/f3011b8178d7ac290964b6149868020ffc536f15 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/f6f485ad912585929e9783384d4df22b3c6c873c | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/2a59e41fe21153318cdd5b902c365deb9df8557c |     
   sparc     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/23ad79ab4246b1819a92ca7b3e95e9ebffbd99a9 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a749e9d67ca96c55b3e23de30dda9ea3faeac173 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fd9ff1126e0bbd74968d7e327edfd32bdf54149c |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5a5ff4631fc3bc95fe701552fc7986362c9e3a90 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2f4e2186078d9dffe36cb2a2a10433a6b5892ec9 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/78f0f28eba3c0967fcd76ee930c2f5eeb79ae3ca |     
 microblaze  |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/3a116ee89df6b860ff621c2353d9f50775426b4f |     
    mips     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/dabed38fc2411f544ba2910f65f98fb6277c236c |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b01c5387949943c3e28822ea6ed92b10c4523ca9 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6c068f36f084da8c7b5fa57b130a777d52d641bb |     
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/e768ce3403908c40e485ac34400a74ef1b072f2b | ORPH
    or1k     |         libnss-3.89.1          | NOK | http://autobuild.buildroot.net/results/c99a4c1011fd5b1a7cf8bd52773fdabeb780c9b0 |     
    arm      |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/2908b6ff1f79c2da97a86f3603da15d8c963160d | ORPH
   mipsel    |           links-2.26           | NOK | http://autobuild.buildroot.net/results/c04f644c606ac36c67276ffe55eb57504e089d41 | ORPH
   mips64    |          linux-6.3.5           | NOK | http://autobuild.buildroot.net/results/9f7105489b9f4ebea856a83d3ba3f259aea163b5 | ORPH
   mips64    |          linux-6.3.5           | NOK | http://autobuild.buildroot.net/results/f80b93a64457ffd5b89551ff15fa47b4c0b51b04 | ORPH
   sh4aeb    |          linux-6.3.5           | NOK | http://autobuild.buildroot.net/results/2e355f89d6b3ee9812f1f8664d4d6a695eb4262f | ORPH
   mips64    | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/4342a885085ca6fa8b979a7e62aa55da879d1976 |     
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e7a60fec65cde4f2a357da30d4a958af4f09f579 | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/c536a18afb8edc2df22766e2aa399d1a12e82d26 | ORPH
    arm      |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/6fb647143e047adbcb1d659d7cddbf4137f36d8d |     
   xtensa    |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/a3b5e671a718bf0cbf566fe679fff864f2054717 |     
  powerpc    |         python3-3.11.3         | NOK | http://autobuild.buildroot.net/results/7435dba180b45ed5fa67056a4b64ec7caa3982b3 |     
   x86_64    |         python3-3.11.3         | NOK | http://autobuild.buildroot.net/results/f8508ac96e5f1c91005b858c075d86eddfe3b459 |     
   x86_64    |         python3-3.11.3         | NOK | http://autobuild.buildroot.net/results/6f11c70c57271ae12216ceaad2b45a100d313f61 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/294e17f3dee0f72f4af5caba86ee68f1e359f224 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/2bc4deadaa69010bc476d37b4b3f6936c1d3a269 |     
    i586     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/b8e774095aacf4e2916e41d47173ae66f5656bce |     
   armeb     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/d33bcd98eb0474f5a57b8b8ee5d33ff0af481e7f |     
  mips64el   |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/ac4239b35f5ad95e61c4c05716a85a78eeac39a2 |     
   mipsel    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/6b737a823eb5f95fc0d4f27be6f0c4c78d7b9f20 |     
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/491ed8c44a56d2532e7283e07037bea3c1004fd2 | ORPH
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/519fe26e9e11daf1d0524501e92f0b6fedb7d815 |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/e3552ab53563ada7b5a228af1de1aeadb35ab1ce |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/f780e9067467529006500cac6f646f3b930690f2 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/0621fc2d5d13f1c266eed0a9562a69716c573682 |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/bb6974d35c9970ead0978b3465cfd00ac345e4a5 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 1 
            host-binutils-2.39 | 1 
                  linux-6.1.30 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/ffaf14109a556923eaf35bae8f5a90632bc65f42 |     
   xtensa    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/13a4f056e4fd71f5a387ea4c9c32c7100cbc7ee7 |     
    arc      |          linux-6.1.30          | NOK | http://autobuild.buildroot.net/results/430d7f4ae9099908341e154bdb499a113406392a | ORPH


Gitlab CI results for 2023-06-05
================================

Detail of defconfig failures for 2023.05-rc3
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4409032155  |      


Detail of runtime-test failures for 2023.05-rc3
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4409032279  | ORPH 


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4410860248  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
