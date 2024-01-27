Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B15C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 06:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D5E181495;
	Sat, 27 Jan 2024 06:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D5E181495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2m2sQn_T5oYU; Sat, 27 Jan 2024 06:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0BED814B5;
	Sat, 27 Jan 2024 06:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0BED814B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7BE01BF4D5
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 06:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ECD460B14
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 06:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ECD460B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Di5ICAte6Ct2 for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 06:45:49 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 544A660B0B
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 06:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 544A660B0B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EBA46000B
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 06:45:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 06:45:46 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240127064551.5ECD460B14@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1706337946; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YK7v2G3n5g7Y8QdyDbJbQeIlyRnzmL/m/XBrmhacYoA=;
 b=hgi3Lk9H8b99f48c6E47zr9KQVpoXvpbRQ1K4vvy2Vf29+r/SWFhgVP6GdDDsZ0zMwzuls
 /lrbi/bOBuoCM1ZAY3d4qFOdH06DBsPvCsL7aGuYAokRvUFRyYvAFxOuAXEU6VmlXWzzvk
 MdMQRykEhhTRh9jv/M8SyuCd2nDdy6veGm7MQ7D0HRIXVXO0L1FXAPgkcvw3jZUrBx/c2P
 Zn6hzq4q414BpKSVvdf0yIc3ZLTHLY2+NqPAGxsJ0TF8WkThHrU6dXiWsJ6WOAb23KZpor
 8fwjFP72/XCg0xyjgBOMTGTAYyd9Zi94gfjWI0I1i+0Me1oGTKkpvkdF/UjZhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hgi3Lk9H
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-26
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

Autobuild statistics for 2024-01-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  3  |  1  |  5  |
  2023.11.x  |  1  |  4  |  0  |  5  |
    master   | 39  | 59  |  1  | 99  |

Classification of failures by reason for master
-----------------------------------------------

                  stunnel-5.71 | 5 
  gobject-introspection-1.76.1 | 4 
              host-uuu-1.5.141 | 4 
                libressl-3.8.2 | 4 
                    attr-2.5.2 | 2 
check-11970a7e112dfe243a2e6... | 2 
              libarchive-3.7.2 | 2 
                    ngrep-1.47 | 2 
                 openssh-9.6p1 | 2 
                 systemd-254.6 | 2 
                  tor-0.4.8.10 | 2 
                       unknown | 2 
               asterisk-20.5.2 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
                  cairo-1.16.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
           dmraid-1.0.0.rc16-3 | 1 
        edk2-edk2-stable202308 | 1 
                elfutils-0.189 | 1 
glibc-2.38-27-g750a45a78390... | 1 
         host-gcc-final-11.4.0 | 1 
         host-gcc-final-12.3.0 | 1 
               ipmitool-1_8_19 | 1 
            libmemcached-1.1.4 | 1 
              libopenssl-3.2.0 | 1 
                        libpng | 1 
                libselinux-3.5 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.6.13 | 1 
                memtest86-6.20 | 1 
               openblas-0.3.25 | 1 
                    pppd-2.5.0 | 1 
           python-bcrypt-4.0.1 | 1 
           python-numpy-1.25.0 | 1 
                python3-3.11.6 | 1 
rtl8189fs-75a566a830037c7d1... | 1 
             sofia-sip-1.13.17 | 1 
                 sudo-1.9.15p5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/231106c038f610e48ecff04e4e05cbfe6283a392 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/dd511ad78c87101dd25bbdfda13fbad09c45dfde |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/eecc5ea8ac0ed187c9e9b270de762eb485bddb92 |     
    arc      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/78f9a9b16d235d1ff5a6f231d308bdc72394eb63 |     
  sparc64    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/f424e6727bbe61ea4b7703e93aae6fcab7506898 |     
  powerpc    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8ecef1ca3c0c4a2c4628f068f58cd4d72ae97b33 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/94de6dfc4afe97e217e43516590875d10872e910 |     
   x86_64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/feb508e12b6a62cc5755b0ad51b570340dbc234d | ORPH
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/24b0bd7f88d4f40d0401440e3ccb3f3f24ba4d2a | ORPH
  aarch64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/a6bf636fe0f23240b75f675e4cd94b8bc568e469 | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/29600ed9df17d29c35f1fb7ffa35f76d2cbc923b |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8d7d80248f98d00136708ef3121908ad0d3b94a3 | ORPH
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/296fa890d1725f1275f997bcdad220f01ff5d1f0 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/08cc140b519de2bb37eb68e0ac75efab2453057f | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f930a127c810811414319e7dd6c104636806b25e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b980dcaa67c8743e4e6f17cb3c819066d90cf098 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8528b838bfa1b340677582f290d84e469931fcdb | ORPH
  powerpc    |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/67fd007bbd3da391391612375f8bd6a93b7327c5 |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/62e5a176b9dd66d95de5b32fa0484e8c15b153f8 |     
   nios2     |        host-uuu-1.5.141        | NOK | http://autobuild.buildroot.net/results/4957d3674703daebf8d37a6cf212bbe671a54ed5 |     
   x86_64    |        host-uuu-1.5.141        | NOK | http://autobuild.buildroot.net/results/8641ec0ad2abf7f699d05146781ee3b67550922f |     
    arc      |        host-uuu-1.5.141        | NOK | http://autobuild.buildroot.net/results/f9cd70f7c3cbc3a855b2254f062173f55c477cd3 |     
  powerpc    |        host-uuu-1.5.141        | NOK | http://autobuild.buildroot.net/results/800c812c8099beea27716925bd3851a3a822a43d |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/553131a27522bde4b3ef367ff8413680fb762a3a |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/1f6c5bd1004f9c5fafcddf209ca54d61bdaff449 |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/7ae27c3cec7fa5e940215d88f66b219f6912edbb |     
    or1k     |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/6811db4f7e2d83d659999985f73e5c8e9ffdcc6a | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/e3f633a51b365f1892542647152b68988fbba074 | ORPH
   armeb     |             libpng             | TIM | http://autobuild.buildroot.net/results/1f618cd183f52c6d0613150832fcd9c735e82e0c |     
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1a0d227881c2806a56eba0c4bb71b72d8dba747d | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1b8d444ff58f085309652b6f923395b39676119f | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4408ee89edcca77db6e2feeb08d33470aa242b52 | ORPH
    arm      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b26948488e99701f29c9eee16f8c066801f0c5f1 | ORPH
    or1k     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/642271370b0aeeeaea31b4f9bbf4d2a56d00c145 |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/3d29a671132a79c7e117ddf535aac996ae29ac05 | ORPH
  powerpc    |          linux-6.6.13          | NOK | http://autobuild.buildroot.net/results/6a51cbb1f2e25df699bddc4937ee7eba88988697 | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/432f86efde29357b1cc008d3a53a09ff74ba6250 |     
    m68k     |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/e6b4e60fe94867c7627cd82ea9f16ae0a83cae0e |     
 powerpc64   |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/97d8eb577d4eda1918244ee1ae39cab317bea23a |     
  mips64el   |        openblas-0.3.25         | NOK | http://autobuild.buildroot.net/results/e3b75e2ccac649c20f4a09b4e0bd98655400b351 |     
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/ec816fbe7466f2c1c55bdda52968d80a5282e9b5 | ORPH
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/eb1476abfa3acd42658adfd51bf015f693799fe5 | ORPH
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/6b1cfb81241c7db7cb87360e27b5b9e14a7600de |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/473c7e67719343dd5e6648309b6ff6d874efafe1 |     
    mips     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/ed344ff64d5f499258141233eb1766b6a7ed683f |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/4530c08915ba5d5859da4be14e24f09bfe1942bd |     
    i586     | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/0b1787aaed3da6a84407e84f0fb532c8b8d12ab0 |     
 aarch64_be  |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/680511f797d9040a96c99456c01d1c9d5518de76 |     
   nios2     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/c50a71bf62c6028e7fc40a96a569362a6e9795a3 |     
   xtensa    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/9c380b9c99dbf0e913509487d5e4dd468096cfd4 |     
   xtensa    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/01cdd77a52b341df9ecb5e1de7b74f558a5d4491 |     
  powerpc    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/54d0dbec1dbc27246305cd7c41054a0dc23d8c7c |     
   armeb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/c3f7eef84df83ab866c580e9cb146ec3fd82ea71 |     
  powerpc    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/91ba62149790b82783a9d25bc0f372e5c5d48eaa | ORPH
   mips64    |         systemd-254.6          | NOK | http://autobuild.buildroot.net/results/623e4204c374b9bb621ee9d1c4cb5a9be5c0ea6a |     
powerpc64le  |         systemd-254.6          | NOK | http://autobuild.buildroot.net/results/a720f8497e3c3b7f8e9d5e23beb9fd4f5cdbdccc |     
    i686     |          tor-0.4.8.10          | NOK | http://autobuild.buildroot.net/results/85cde3bcd12fb5adafb94c85d5fa636e1b5b9068 |     
 aarch64_be  |          tor-0.4.8.10          | NOK | http://autobuild.buildroot.net/results/a553d4719b406fe16c483a0a659c1c7e06c46e53 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/50d04c9f92203982099943f12d1f729e33793031 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/636c2a96145ffb74987f32cb877b177ab3f4025a |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                elfutils-0.186 | 1 
                  linux-6.1.72 | 1 
                     open62541 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e7aa0fbe99dc2e446e537a7f4bae8c2ff602b9ce | ORPH
    sh4      |          linux-6.1.72          | NOK | http://autobuild.buildroot.net/results/77e774321075ecc1c5cd62b4baeaaff54ac6e40e | ORPH
    m68k     |           open62541            | TIM | http://autobuild.buildroot.net/results/e0c84e1c99cb1ff7cd061f98db020bb24cdd654a |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/49a37dcf3f916ee4e009efb721e5027b4783a0f2 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                libselinux-3.5 | 2 
                elfutils-0.189 | 1 
  gobject-introspection-1.76.1 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5b3f431083f7c2d69a4f6071d6ee80795cc4e824 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/71cf257a28487714bbc4390f5cc526c79940ae8f | ORPH
microblazeel |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/7b52736a36ba01dbaeb4361f83f4e7c8be92fd64 |     
microblazeel |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/152260cf21cf8c1b3f87a6d79881401192f20b34 |     


Gitlab CI results for 2024-01-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614330  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614464  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614535  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614536  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614539  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614544  |      
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614546  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614552  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614670  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614673  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614698  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614703  |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614712  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614841  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614852  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/6007614878  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6024103717  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6024103915  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6024104105  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6024104131  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6024106337  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6024106417  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6024106473  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
