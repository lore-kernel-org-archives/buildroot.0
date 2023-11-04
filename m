Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10661C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 06:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56BCB41727;
	Sat,  4 Nov 2023 06:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56BCB41727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhVi0auWaTMJ; Sat,  4 Nov 2023 06:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF95B4168E;
	Sat,  4 Nov 2023 06:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF95B4168E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 434371BF5EA
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 06:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B3B741684
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 06:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B3B741684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbBBgqHXdwCM for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 06:40:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 144AE414D1
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 06:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 144AE414D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37CABFF803
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 06:40:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 04 Nov 2023 06:40:02 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231104064007.1B3B741684@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1699080002; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kdZ0oJNgY98m6MtCBiZ1OhhDIPxArDqVMdqxzUNR+J4=;
 b=Mmb9D8PFLtyANFAxvRNHsTgI6fQh0n0Z4B/DtF9rcCFQvsCW/x6clNmJeuqXfik8GqIbDE
 dXviyXDK1mYBgIqPqVX2oaXw4vDQh0Mds4f/1gJDktnSm3a38QO2IzrzdT77l09TwZPadv
 ge3oPLB2xlNA0ubEdA/iCDXMGjwfWfquRPXrd77lYGhqAtRfZaMOqd4iUKiCnD+/lqfOOZ
 F/zS1XNOmJyvTkUv9wl4AGm/eIhRcisWNweNKY6yAMWgBPeCeM5hn5x9q4Xy7+Tiq6f0Ot
 6eXeYJPcRQQH9YGnVg5F0rpeVXjIkZ02XBkb5ms2irYcyAZTwoLgSC6pXEtUDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mmb9D8PF
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-03
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

Autobuild statistics for 2023-11-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 10  |  8  |  0  | 18  |
  2023.08.x  |  8  |  6  |  1  | 15  |
    master   | 38  | 59  |  1  | 98  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.189 | 5 
              gcc-final-12.3.0 | 4 
                       unknown | 4 
             dahdi-linux-3.2.0 | 2 
               host-runc-1.1.9 | 2 
              host-rust-1.71.1 | 2 
              libarchive-3.7.2 | 2 
               mariadb-10.11.4 | 2 
                   openrc-0.51 | 2 
                   redis-7.2.2 | 2 
                 samba4-4.19.2 | 2 
                acpitool-0.5.1 | 1 
                 apache-2.4.58 | 1 
azure-iot-sdk-c-LTS_01_2023... | 1 
               belle-sip-4.4.8 | 1 
                   bird-2.0.12 | 1 
                    brltty-6.5 | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                  ffmpeg-4.4.4 | 1 
                flashrom-1.3.0 | 1 
           flatbuffers-23.5.26 | 1 
              gcc-final-11.4.0 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
                host-go-1.21.3 | 1 
               libunwind-1.6.2 | 1 
                     linux-6.6 | 1 
               linux-pam-1.5.3 | 1 
              memcached-1.6.21 | 1 
                     nut-2.8.1 | 1 
              open-iscsi-2.1.9 | 1 
package/python-tftpy/python... | 1 
                    sdl-1.2.15 | 1 
                 systemd-254.5 | 1 
             tpm-tools-1.3.9.1 | 1 
             util-linux-2.39.2 | 1 
                 weston-12.0.1 | 1 
                xenomai-3.0.10 | 1 
    xserver_xorg-server-21.1.8 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/f1cf4e61e9429fbd9492024a6a856767819c9f83 |     
   armeb     |         apache-2.4.58          | NOK | http://autobuild.buildroot.net/results/d85c86ee1070582014c7b29b39f9a9f356988220 |     
    i686     | azure-iot-sdk-c-LTS_01_2023... | NOK | http://autobuild.buildroot.net/results/894188649f66d9917e1ed94989ebe307102ab28c |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/8285b4f02b189388439af8cb9b49f5d680e5d73d |     
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/edfdb83cab1ff447df8c48e826155593cbe96351 |     
   x86_64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/29f5ef8a52db4dd717fbaf1ade9d250dfcebe6ff |     
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/01927183bff76e225a632f5913241290c90dd98d |     
  mips64el   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/601ddfeaaa51d8108c1e6c0c1064eb38880d1617 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/631008a48814731941cde8ed3924f0551c0225c2 | ORPH
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/30ad4f8255a9073465cba5e8a19591371d517874 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6bd10fa3c769bc597e8764fd397c64722a54e08c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b98ffde5faf30c165eeb042da5d3e3f62ae970cd | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0405c3db6435048a3ccef479d5f88be150a6577b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f463cf5319bfc14b91deb01c5507e54a9b97a370 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3de1fcc32c3d3694ab143be88cb1bbe5b7948f3a | ORPH
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/790ce2dcd33159a789c0722a7bcc23ba86d9d9f6 |     
    arm      |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/c1dac0e5697587aae8ad35d4c31dc05d993123d1 |     
    arm      |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/98eb85c4fb6a41a695d96d7c3a1fada522c6d083 |     
  riscv64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/7ae1cd27f680726eafdbee1b074c565719f04cfe |     
   mips64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/51635c8bce85340a24894522acfe5a13310e2003 |     
   x86_64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/e9b70e89319270d87590ca3472544332eca645a9 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/c4acc00c2c45662500140e51cb4b7f62fb7bd697 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/11721079c66b645f1accc576bbf3b4faa9d61575 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ef525c638221dad1cbd70042b6e5a6edeaa5b124 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ce19477c74693e59a47bf75ab344c3db8bcb7fc1 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/8976e15fb7792a2fe40964c83c8f93fea56d4eac |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/a9a3ef60b49ee4104ef2e5998680cd1c05444377 |     
    i686     |        host-runc-1.1.9         | NOK | http://autobuild.buildroot.net/results/b88a6481f587c4b2d5bc05804bc4805c125b110f |     
   xtensa    |        host-runc-1.1.9         | NOK | http://autobuild.buildroot.net/results/ef4a91b9c1b6c78fd3b333de4f5af6b4d9c0c859 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/faf4c29c9f821362bc847608563b75174f56b34c |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/5aea7a0d44e3226b53dd0f9791ae6973d3d6a737 |     
   x86_64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/518b0b416a78faeb8b99ffbf1c098db4447705df |     
    or1k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/14701e1b4ec31818d6b6f391ce7375cb23e5580f |     
  mips64el   |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/bc4af391bd1b6064980a4726b52fd9031aac1439 | ORPH
   mipsel    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/97a21019472136511e63ce5dbb411f140937d0c0 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/a5a84585ebf1973d910d01e5b28755d9f4e3743e | ORPH
  aarch64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/f71d4b86b717c74dd4ebc051d8cc23cd97e5f767 | ORPH
    or1k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/a02f36fd80a8e2896eb5b0a33dc2440a13d5e1e4 | ORPH
   xtensa    |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/10c10f0a0a9dcd0bb9f86efa7dbeec18db2b7c36 | ORPH
powerpc64le  |           nut-2.8.1            | NOK | http://autobuild.buildroot.net/results/0b2d0e292a9872f7ab7c2eeccbb7bb12e4afe36c |     
   mipsel    |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/da868dd4e66808429774bbf22c26d8147171a63d |     
   sparc     |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/313cec865157aeec96b60f3b78c32b94cfc72873 |     
   armeb     |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/e89477c26812f0f814071626381880164121fd75 |     
   nios2     | package/python-tftpy/python... | NOK | http://autobuild.buildroot.net/results/0022fd64e5fa987c67009fe196156f92089d1b7b |     
   x86_64    |          redis-7.2.2           | NOK | http://autobuild.buildroot.net/results/d52d567d99c11580157ade3b51fb394e50911bae |     
   s390x     |          redis-7.2.2           | NOK | http://autobuild.buildroot.net/results/6ab3943c271bc26e528b9064e0430f724dbee0ee |     
    or1k     |         samba4-4.19.2          | NOK | http://autobuild.buildroot.net/results/94fc033c07c09b552c442daaf9b0578119b2c724 |     
    mips     |         samba4-4.19.2          | NOK | http://autobuild.buildroot.net/results/e5159292f58e3146b07a003756bd940e52c16839 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/5a13fa4c5f90b22c4b66f95a03e8d72ecede7d24 | ORPH
   nios2     |         systemd-254.5          | NOK | http://autobuild.buildroot.net/results/015e2217983b952c5ed7bc785ff0114a6df2f384 |     
    sh4      |       tpm-tools-1.3.9.1        | NOK | http://autobuild.buildroot.net/results/d9e97dbbed0c69cb70939348d5f458f550f187b5 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/f1b264f8539accf89a95dae3538c32db10c286ee |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/06cb4aadd3ccff449e3bd32d171b6a24b6c956b2 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0d58faced2a132c008f837a6a6fc541dcb9afd6c |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/74228e6c539ef0371ad20b0f8f88f96a14dde716 |     
   arceb     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/63a1729440b3bf1657d51fc913f93f94d595ce95 | ORPH
 microblaze  |         weston-12.0.1          | NOK | http://autobuild.buildroot.net/results/22131612746515ee4827bab4045a97be5c6f4256 |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/765d06b8984976546699655e2e23a63aeb7f7e01 |     
  powerpc    |   xserver_xorg-server-21.1.8   | NOK | http://autobuild.buildroot.net/results/1461ee60dff1cfcb466b939d91eaf27fe6adc038 | ORPH
  sparc64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/7adc980becdd44f9ae22275a6b7e9a57d43074e0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

             cni-plugins-1.2.0 | 1 
                elfutils-0.186 | 1 
            host-binutils-2.38 | 1 
              host-rust-1.67.1 | 1 
                     pv-1.6.20 | 1 
                      tar-1.35 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       cni-plugins-1.2.0        | NOK | http://autobuild.buildroot.net/results/ccd2993eaaa1353e3fb120c98794da8bda3d4158 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/10344ada3b797f9a5c2d825b729efc851d412293 | ORPH
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0a57530979a04d238838bf0c1acf1b1aaedaa1a7 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/352c7685716c3897d965152878efa5499b9a2e33 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/c607cc2fbaa378636bd7ac055e7f5008306a4dd8 | ORPH
   arceb     |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/c1ed16c4ebd972d4d67dbb33f66086e2c170bab7 | ORPH
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/818047ff7029be8507a52178ca6a74d6a484570d |     
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/c46dec17d8e19fd75fe8520eaa6b74b4aa02cb37 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

  binutils-arc-2020.09-release | 1 
                  conmon-2.1.8 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 uclibc-1.0.44 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/14e59553327486a56862df4ed586b79d73bc482c |     
   mipsel    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/1f792aa5ae3f57b4cf9a71981b2ea06b8a7028e6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c6edf5e32a36b8ea79bbf9a15a0575670e5de3bb |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2b10e46964605e37d38dfe17e0e3a316fc2bcd70 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2e6876194737fb159ac98db6dbd98ac72dbcd74f | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/1006707c231bf9dd551eb73c9c98bacda01fa9c9 | ORPH
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/e73dbf97d37316fdabadf4c31599731f448d8f9d |     


Gitlab CI results for 2023-11-03
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933853  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933858  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933888  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933891  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933892  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933920  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933959  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933963  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933964  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442933973  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442934022  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442934023  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442934055  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442934061  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442934103  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442934162  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442934171  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5442934180  | ORPH 
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452810589  | ORPH 
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452810631  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452810678  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452810741  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452810829  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452810902  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452811027  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452811204  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452811292  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452811371  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452811410  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452811650  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452811989  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452812031  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5452812230  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
