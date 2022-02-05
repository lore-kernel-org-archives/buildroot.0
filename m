Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B36C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 07:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD85E4094D;
	Sat,  5 Feb 2022 07:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQkZ9PFOQgBg; Sat,  5 Feb 2022 07:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34BDF40961;
	Sat,  5 Feb 2022 07:06:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 462271BF479
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 07:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26F7960E8F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 07:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tsuSkEfOthUJ for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 07:06:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B63C760BAE
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 07:06:38 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 380BE240003
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 07:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644044795; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lWI+be1HN78UCJqOAi08sXjxOTdISlBo8S8WecmuBaA=;
 b=V8Or7UViDFWV5IGKz4jzty2lQp135rhNVyLzOS3HWwP4hO36WGGaNQFehr1AF4FyJqvnJ3
 XT6wJZNEDyDVWKbJWdWOp3yvdxmLjFBMqWCmv8H1Zjfjm3Skkjgv5THhBfUTza6STsq2U/
 I1nm1Rsc8R44kt0suVA6a/ALh20wEEoIoMV2bAQ5u+/wkud0A6eeJxhqanMznGf3wypD+L
 fwGEBBDML/KSbtztflZf1Hxd0lUr8M5fE+euRfKniQm1Ary2PysWSvdTD2s2xvrgQLBaTE
 akH+tqyZn4IoUmNLA/at/ABdFO7Vredqb0dF/MKp91qN8y1/pgqENXmR8d8iMg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 05 Feb 2022 07:06:34 -0000
Message-Id: <20220205070641.26F7960E8F@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-04
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

Autobuild statistics for 2022-02-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 60  |  4  |  0  | 64  |
  2021.11.x  | 28  |  0  |  0  | 28  |
    master   | 78  | 61  |  0  | 139 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.3 | 16
   host-python-docutils-0.15.2 | 12
                       unknown | 5 
                       frr-8.1 | 4 
        python-docutils-0.15.2 | 3 
                  rygel-0.40.2 | 3 
             bluez5_utils-5.63 | 2 
              host-delve-1.8.0 | 2 
               pulseview-0.4.2 | 2 
                    bat-0.18.3 | 1 
               belle-sip-4.4.8 | 1 
                    bird-2.0.8 | 1 
                  boinc-7.18.1 | 1 
                   guile-3.0.7 | 1 
                host-go-1.17.6 | 1 
              libuhttpd-3.14.1 | 1 
 Makefile:747: target-finalize | 1 
               mongrel2-1.13.0 | 1 
                nodejs-14.18.3 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
                 systemd-250.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/edee65777efc5f9e0285dfaf1569f092a7731bce |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/846597f3573d3b0d52e80627a9577d14b9348547 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/993d48876c27a75b4e837806b69b1beba3761c3d |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/f64741f288ab4d4374f810b36d97cfc571fde7e5 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/613a8a856b02c1e318eb5db12134977c568d0d33 |     
  riscv32    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/05bdd820059b624b8d2785cd0b5b3971b0880a0b |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/e14997abce0b4213437c75ede798b6923788841c |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/93384959e54badf0903321437027aa06f6f8f98c |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/130094ebd3c27f9f123a21b811e73cb82ac4251e |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/ee65ae857c77fdfa844f74e335360c1f360cdff6 |     
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/bff3bbc344b7754fddd094c1e8add5a2da471c42 | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/4195b05c5e9ea473b4135fdf9c0c17d27f56f9fd |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/bd8833a7620dd5f4a9940775164ed80135020cf9 |     
  mips64el   |         host-go-1.17.6         | NOK | http://autobuild.buildroot.net/results/cdf4a4f52cc5fb1fb94f90c6bb0a1976bca7b08f |     
    i686     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/00e256601de59a5c85c6891d30f8bff3c7fa6c2d |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/ea124618a7119c8b24b843af172510b699a94f8b |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/b10007d12cdabfeb8e92fc7806ca5a0e5568ae39 |     
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/264fe0206435732a85e0a30b08b097b625ff6b2e |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/cb3edaf67991656a9fb35aa308530ea44a8f0795 |     
  aarch64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/5a4a50960709377281fbd5f254d161916c829ca5 |     
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/4742378bed443ecd1bfd8a9196d2717d29f4f906 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/251879431ca5bbab21c45028ac7790e0b48319d8 |     
    mips     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/79939f13c49a8833229676fc0903b32ea372656b |     
    or1k     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/f168ddc689cb33e1619cd960523b2533d7ab3b51 |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/62a4eb5d23f937f2cf71971368e29eab36fae68f |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/1b6d876b89f457d0bb7d728b96da20d9a86c1d39 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0a36fa928be782abd4e543ead05cc6b8fed7c005 |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8ed457867e09d8c6db7aab19a52316018cc14fff |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8a73a7f55674098cce3cf096d1e37688fcd20c89 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/49ea55a0df49a87a347235fba3de7fbc69a043af |     
    i586     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/4d3fc7a18a5f1dd46bacfd01bbd1bb8a22d8fb43 |     
powerpc64le  |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/99e09d316db083a973b9b3d3e3e44115d4bf59cc |     
   sparc     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/e35cf9faae2907d64a6f5db0f551d51bad7c4346 |     
  sparc64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/24c76da1089cf7ac56386f2df96f03f9da31d2b5 |     
    arc      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/de45ed9b51eaaccb2ebc4c79ba2cc3a83718a538 |     
    arm      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/8467a55460877672de41dd06f481df13c58eb5df |     
    arm      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/b90f74e0a8bb6990fc2d5bfb7a05d4c648cf27e3 |     
    arm      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/bbca433bf6f81fb06b6424c00989246506ae45db |     
    arm      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/e3d1f17f64e39b49a20335fae432f84d1bd346ae |     
    arc      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/3a1adaac277c1b2ac095df5e399d1750669f1dd9 |     
  riscv32    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/de0334544c45f48a0e6b11c4c9d2c3c63b4648fd |     
   xtensa    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/86b6c094822cff44fed68bfdda9ceceff38383fd |     
    m68k     |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/c57f1d0f805cb815c53900ddfeb783fd75bde756 |     
  powerpc    | Makefile:747: target-finalize  | NOK | http://autobuild.buildroot.net/results/dfb3aa2e3c9dc23ca5768ac785fec5e3c2d54935 |     
    arm      |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/da9ddfbe279610fe2e1cccc35b0455b3181da175 |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/eaa66466ae693dcf867cacf1f899040d66809bad |     
    or1k     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/a63bf10c5b30c0c92aae1fc6263f5c02585a8752 |     
  powerpc    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/9f8483696edf62408777cbcb97844648e9a47ac4 |     
  aarch64    |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/026671f502c6e9f46f248b0273c4d3588e6125ac |     
   nios2     |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/7eb6c1238a96c875001fa0cc819afd690a4b5b9c |     
    arm      |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/2ec65e34110c57e78fbb3a88f49c75667f9f74ad |     
   x86_64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/5209a3bd1ab3840893eba69607191c6661657541 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f06bfc96d4af6f8360fa226d648723ee1a831045 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/17840fd71062732d6026c04d7572f454c266560b |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/2ac082f5ce2a614643cdbf493837165801b5ca9e |     
   nios2     |         systemd-250.3          | NOK | http://autobuild.buildroot.net/results/5fc884e11e46ab165ea21c8e8f2901516d79ff80 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/48d537a2ed7786c0456f0455c2de05ccfa80ece4 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/4e7ed7bf8ac4d4f37b677b9a805f50de836a44a1 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/d809a0a49a1c7cbd7d534773b905c1733f2f4ca1 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d540ecff2196ed700d31f97bddc681487a0809f3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1587fda56c5a697b9a3c0be6c20579baeba77df9 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                rocksdb-6.13.3 | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/61c5b24e27b8242a5a2136537825a7d8e79e27d4 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3e8786a301adb36375e4a96481ba1468b074d464 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d26aa08fabe9a6e254ff8ef1f6ebdb71432f23a7 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/8e21dfdc2c436c4eb4367025c6e31a04acf3560d |     


Gitlab CI results for 2022-02-04
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012177  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012180  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012181  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012183  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012184  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012189  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012190  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012191  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012192  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012193  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012195  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012196  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012198  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012199  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012201  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012203  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012204  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012205  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012206  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012207  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012208  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012209  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012211  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012212  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012213  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012214  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012215  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012216  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012217  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012218  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012220  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012221  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012222  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012224  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012226  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012227  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012229  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012231  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012233  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012234  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012235  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012236  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012237  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012248  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012249  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012250  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012254  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012256  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012258  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012259  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012260  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012261  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012262  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012263  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012266  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012264  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012265  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012267  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012269  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012270  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012276  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012287  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012288  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012295  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012296  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012300  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012301  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012302  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012303  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012305  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012307  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012308  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012310  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012318  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012335  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012349  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012356  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012361  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012362  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012366  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012368  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012371  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012373  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012377  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012381  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012386  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012390  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012391  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012474  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012484  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012487  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012489  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012491  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012492  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012494  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012498  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012502  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012503  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012504  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012509  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012513  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012517  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012538  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012540  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012543  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012551  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012552  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012553  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012554  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012556  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2048012558  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
