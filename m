Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8229AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 06:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B5B160B72;
	Thu, 31 Mar 2022 06:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gfy9JpthW1EF; Thu, 31 Mar 2022 06:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A796B607CE;
	Thu, 31 Mar 2022 06:08:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 103D91BF321
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A2883E9B
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5XeO_ZEIoIk for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 06:08:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C9FE83E93
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:08:27 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A4B8BC0006
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648706905; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ThRj/cZTv3nrYUOVkVH1Ldea3ngivJWscKykGz9CUxQ=;
 b=c+WK8u7EZs3rPem1xDSzK/4yWOBbD7fy5Pan7K4Cpvf/GEA4w3dBgzFaY/sDNrpxGb7aJP
 M71UCTtFN4oVRIBXghfjDuAiWuZneNbplL3IxS7CHPk10Dp3Cv6JXI2KCbwtqHmeMd9Tjx
 j96TShUj69lM0kYZFPMQF/MSWe5do3N52EXJpUCsb/m5hD1VmIJm3vjgnez0altvqnk+qq
 jG9aJy9UDseGuYiuUVNOd76TYzfNnXG0kddwz3mqYus/PYXXYRnOgVr+BgNvaCovrQE24x
 R0Eh23JWwu8jEd21DgJP3SmB4YKEsqemsdQQhgH6EaAfwAxEHngmehn0jN3Bkw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 06:08:25 -0000
Message-Id: <20220331060828.F2A2883E9B@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-03-30
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

Autobuild statistics for 2022-03-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 63  |  6  |  0  | 69  |
  2022.02.x  | 16  | 12  |  1  | 29  |
    master   | 60  | 42  |  0  | 102 |

Classification of failures by reason for master
-----------------------------------------------

                 dhcp-4.4.2-P1 | 8 
                  pango-1.50.5 | 7 
              tpm2-abrmd-2.3.3 | 6 
                tpm2-tss-3.2.0 | 5 
                tpm2-tools-5.2 | 3 
                     frr-8.2.2 | 1 
 glslsandbox-player-2021.08.24 | 1 
                  jack2-1.9.20 | 1 
              libsecret-0.20.5 | 1 
                mongodb-4.2.18 | 1 
                    mpd-0.23.6 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
                sg3_utils-1.47 | 1 
             tpm2-pkcs11-1.7.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                    vlc-3.0.16 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/75beeb024a022513c17b25b9070083402045c1d3 | ORPH
    sh4      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/9144569593c077af0b840b8308f44aa56537545e | ORPH
  powerpc    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/66920b50afea6b510b1aea2ab26178f79e7d25e4 | ORPH
    arm      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/69da641c4bd6de1718f49bc04dafa081968dda96 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/d18b006dce7b46631ce8f4c72fb97eb861993939 | ORPH
  riscv64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/32ea3d9366102da76e64c48e13f641fda6dced71 | ORPH
  riscv64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/1ae01f53b213923113d4def79c2ef86d8f265dc2 | ORPH
powerpc64le  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/2e6b6cb0a40c9ac972a562e6dc17353e5e4003c1 | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a8bd63dfc2012fbec48872b7a6cf4ba59829375c |     
  aarch64    | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/bd4e3fc903cbe0e328c5c46c77770682228ac1ed |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/b59f60b60d51eb495780635ab31b1bb431282ed1 |     
  aarch64    |        libsecret-0.20.5        | NOK | http://autobuild.buildroot.net/results/8c025659eaa2bedbc2f349891ca2e4722fb7830e | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/b9d211d388701d4588db760df26f8114a9d4677c |     
    arm      |           mpd-0.23.6           | NOK | http://autobuild.buildroot.net/results/f0a9e719114f19dc9d20622ed85dd4f8e968c20f |     
 powerpc64   |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/f7d227a39e4ec475c0967da031e90eca7399dbca | ORPH
    mips     |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/7c3c2ea2b4ca326ebc11b40120993c9e20a22463 | ORPH
 powerpc64   |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/cef923b7e4847e8bd0d6d7f9bf469ce6fa740363 | ORPH
    arm      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/9589433c7340b2a6137c8134218e78726e38798c | ORPH
    m68k     |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/21669e18d0d8659fa23697eb4656db082ba7e5d5 | ORPH
  mips64el   |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/7147895b373436a3a9edb42aac1562a2c171d3cd | ORPH
   nios2     |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/b9dea403ee400d5448c1491bc265ad72847035e8 | ORPH
    arc      | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/8029b01ce5816cbafd412b14985becce7a22e09d |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/dcc93ec2d1f861c4f3796d6b8ea5f609e8339161 |     
    or1k     |        tpm2-abrmd-2.3.3        | NOK | http://autobuild.buildroot.net/results/f43d80dc23916f78168494da0d3b9b1574d92f87 | ORPH
 powerpc64   |        tpm2-abrmd-2.3.3        | NOK | http://autobuild.buildroot.net/results/e031c62fe0180d403ab56da473b19da9f6161562 | ORPH
  riscv64    |        tpm2-abrmd-2.3.3        | NOK | http://autobuild.buildroot.net/results/65e2bef20fe1bb1d820a1bfee289f58423dc14f7 | ORPH
   mipsel    |        tpm2-abrmd-2.3.3        | NOK | http://autobuild.buildroot.net/results/9ba07ae640ba9bea01c555a5d5ba6d230781ca49 | ORPH
   mipsel    |        tpm2-abrmd-2.3.3        | NOK | http://autobuild.buildroot.net/results/5a3ec27e213fe1d7092bd7f51511a3fb703fca78 | ORPH
   xtensa    |        tpm2-abrmd-2.3.3        | NOK | http://autobuild.buildroot.net/results/239e4a5b8923fee53542845d1cffa67277a4480a | ORPH
   x86_64    |       tpm2-pkcs11-1.7.0        | NOK | http://autobuild.buildroot.net/results/66323bd7d5f868874771aa743e08b93f0f6e69e0 |     
  aarch64    |         tpm2-tools-5.2         | NOK | http://autobuild.buildroot.net/results/28cfd0284a01473c26c25cc2992b43c4bf9720c6 | ORPH
   x86_64    |         tpm2-tools-5.2         | NOK | http://autobuild.buildroot.net/results/bcc9f0eb135873d665540c3c8a138f0e21bbe089 | ORPH
    arm      |         tpm2-tools-5.2         | NOK | http://autobuild.buildroot.net/results/8900940ad30946c40e42ccc7c116153aa9c04741 | ORPH
  riscv32    |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/0a01e354928a67a119edb4c9553025f3b2808c6a | ORPH
  nds32le    |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/4a1f3212d570128ce8743dda7a9920b5d67cc9a2 | ORPH
   x86_64    |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/89b5764d0a5c0f29d027f2b79c219f8347408955 | ORPH
  sparc64    |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/785bb203e884c31845ef46774360fc47c27649e0 | ORPH
    arm      |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/4ecf58b1d4483386945dca736c3e763b607cabc1 | ORPH
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b861aa6c0bc9ab39ba01c0afb658496e4f02d26e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/56c8cacd93d9aff83a216b13a20be5afbcd3c09e |     
    arm      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/ef891307af29deecc89209bfc3ad25b33d70eca6 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0e02d2df8f05e209e3dcca2fbb9d9ce793509c7c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                 apache-2.4.53 | 1 
           heirloom-mailx-12.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         apache-2.4.53          | NOK | http://autobuild.buildroot.net/results/f2caf6ac63f50dd2fd59dbc0d3135c6f03a293eb |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/07e2147e57478e490741f3a40465b487c13ac06c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c5016c945fd218a26d1de6914d53f4f797851075 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4398bf4ea42569012e541ab2a7badd833ce560d5 |     
   s390x     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/0e3e5d0437f25fb014a381e91fe28b76ca8c76bd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b0af23591a6cd6255a2548259c01dbe6c219d687 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  pango-1.50.5 | 4 
                 dhcp-4.4.2-P1 | 1 
             host-pango-1.50.5 | 1 
                       libuwsc | 1 
                      nbd-3.24 | 1 
                  ndisc6-1.0.5 | 1 
                 opencv4-4.5.5 | 1 
               protozero-1.7.1 | 1 
                       unknown | 1 
           wpa_supplicant-2.10 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/11b0fc25b99d223b9648d822563aeb746de5eb01 | ORPH
    arm      |       host-pango-1.50.5        | NOK | http://autobuild.buildroot.net/results/8bb4bf8414fc20e3ada64b12e579e9c65c6d9643 | ORPH
   x86_64    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/555b87bb5e9e003a9fd16b0c26cb62d10cee69b1 |     
  riscv32    |            nbd-3.24            | NOK | http://autobuild.buildroot.net/results/10a90ace1cdc5d93bd98fb18ca5134a64a56318e |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/56df999d86a5d343447d23580e5bbbfad8d05fba | ORPH
   x86_64    |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/8ca60c6b072299ad08abaab4638ac544e6612b19 |     
  mips64el   |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/37218057bb3850609f1cde22d302fa828123d22d | ORPH
    arm      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/44e0caf61871e25b1aa22b5b30e2fdf70ca6fb44 | ORPH
  mips64el   |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/63e220221242385f9cd1631dcbd858a09a73f8e4 | ORPH
 powerpc64   |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/96f2a226ff1793156f1364a52ae3a2675d1a9f3a | ORPH
   s390x     |        protozero-1.7.1         | NOK | http://autobuild.buildroot.net/results/ed941b92d306564d657ba6810006dc00e2ec20e8 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/b418dd5179b31a2a3921c731ca69128bb0f35b14 |     
   mipsel    |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/2dea7dee521794b306cc610601fda322987e6cd0 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
