Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C149C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 07:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA1DF607C9;
	Sun, 30 Jan 2022 07:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_taiRDCfqle; Sun, 30 Jan 2022 07:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E7960B42;
	Sun, 30 Jan 2022 07:06:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92A6E1BF5A6
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 07:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A31082BD6
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 07:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wyf91aoAJ3WQ for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 07:06:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E9E982BC0
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 07:06:32 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A831B240002
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643526389; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cdRXH1MGkDkE9WgndCoE/1oyzb2J/YprcZtJ239+Tgw=;
 b=awB6u+xBHYaqPhY6FlLULs44wNEL+Yof6JH7ZPtI8aeK+10YugMT80ZH15GbppSQKmJhx9
 ec864jqa44lnhMOMs8D/sS6hWzhpRWoIHGNoVpC59Vzl8kYik9aBn0HIKb9haDDsmmAqLl
 GPN7uB2Ajbkk8F4wuZ1f1VMMR9fjVLSyveCujsn4iRN4OPtUFwTSElAU7EJ7KuOXe3EvCX
 yQMVsEeG2y4JTB+OcjekteZ6Ay73O5GUw+tmNI4zpoO6do3PyVUTjx3iGjrMYKJwoax9eR
 KbSAb93GO3lONDz1x99pp1g0/+gZbMjjxT8th1fSL70GXPOlhDIVzDsuc+FPbg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 07:06:29 -0000
Message-Id: <20220130070634.7A31082BD6@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-29
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

Autobuild statistics for 2022-01-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 50  |  9  |  0  | 59  |
  2021.11.x  | 24  |  1  |  0  | 25  |
    master   | 88  | 41  |  1  | 130 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 11
                   guile-3.0.7 | 3 
                       unknown | 3 
              cryptsetup-2.4.2 | 2 
                log4cxx-0.12.0 | 2 
               apcupsd-3.14.14 | 1 
                 apitrace-10.0 | 1 
             bluez5_utils-5.63 | 1 
                  dnsmasq-2.86 | 1 
                    efl-1.26.0 | 1 
                     file-5.41 | 1 
                           frr | 1 
                       frr-8.1 | 1 
google-breakpad-7515ab13768... | 1 
              host-delve-1.8.0 | 1 
                 htpdate-1.3.3 | 1 
               ipmitool-1.8.18 | 1 
libcamera-40f5fddca7f774944... | 1 
               libtheora-1.1.1 | 1 
                mongodb-4.2.18 | 1 
                mono-6.12.0.90 | 1 
                nodejs-14.18.3 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                    ruby-3.1.0 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/74a6b83aea8a7b3c35fdfe7509730b72932aaa83 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/88ebcb486ca3fbeec2239537eea9879d89e9467e |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/24b7f114cdcac8daab1b46f05a5e38096cfca05e |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/86b6b13e6be8375875caebcd91de91fef83f72e8 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/e5bcb5b7cdeb569dde447bd22fcb263a2b5a1a3a |     
   xtensa    |          dnsmasq-2.86          | NOK | http://autobuild.buildroot.net/results/3aaa5e1523049df18692b90d61cdff182e1cd1dd |     
    arm      |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/a6809c2d80b325e72bc6e771fe4aed53fe20042f |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/e32ac63caedc4399614a30582f29f8b65aac2c71 | ORPH
    arc      |              frr               | TIM | http://autobuild.buildroot.net/results/118b4ed145a46772899e472b8fc34eeabe7f5532 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1f625c2122765609e8da43511b9b6a62b7cbcc4a |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/f861b3152e343b5b6092f8be2723636a708157b3 |     
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/f20ab6a7c560d929cbc7649b811884c78fa2e4d2 | ORPH
   x86_64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/7da11b2dcbc1cc8134754cca9cca926d5a8f83c0 | ORPH
   x86_64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/44ce26c5cf46b4ae1ecadd2bf8902a5fab278233 | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/0de2c31d9cf279cbc569b054e55b260ba8c94527 |     
    arm      |         htpdate-1.3.3          | NOK | http://autobuild.buildroot.net/results/f53ee40222c42c421836a6cbd9f199c6c70df6d9 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/01b22faf08a798ecc5d5465e1c0c13fa024f1096 |     
  powerpc    | libcamera-40f5fddca7f774944... | NOK | http://autobuild.buildroot.net/results/a1077815895ab847c5ca82ec17c7d13fe97cff53 |     
   xtensa    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/1912bd1213a23c1bb0995a3d322a5c1e0d605270 | ORPH
   x86_64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/d0f99ad2c38432854689b7d3383ba3ae64adf8d7 |     
  riscv32    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/8308ec2a83868c2446670a47998dee679c48367a |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/536839681cec37d7adaf8fc7cc287be3336ccb29 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/0f9ae32c07f2fc5c7ac2099c3a0d0d5238bc8e53 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/f0b34c628f1ce2b98428cc7996377802a088ca2f |     
   x86_64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/194a9b21cb67a2fa296a1faed3df51dc2ccc518a |     
  aarch64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/a03b756e52bc79fc3c27a36f60aebed113405cf2 |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/8bf6573281b02d4ce24a27b67b2ba2424cc38b27 |     
   sparc     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/14d85969132c17ae6fef524aad67a3e69e616181 |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9b86de606fbeccc414c89f2b6c7c2a71513fb4dc |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9ca75a49dc94801de96367b7224a355b358052fc |     
  aarch64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c1b3727dd5ce70fe2eef298f5cdfec999ad65500 |     
  sparc64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/866275dad076a5b129fc004f9df3af3823f9a5d6 |     
   nios2     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f4f43b67534d9f4d4265c0df1f30d2b9608ca045 |     
    i686     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/50febe44f0e9985736a03a7e8ae605e4f87fbce0 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/b47f32a5e5b8373bd53ae4e4a41a280dcc2e7952 |     
    i586     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c279988e715139cbee9f83c9d1a21491bd140df6 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/3f0af43bea780ee1196189b36dc40031ba7d512c |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/bcf1613fffe9723a3aa1ce157fe0b187026bc74b |     
    arm      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/9fd5fedb0e7b1f781875a0327b3d558aa208c3dc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2430ba4afb40569ed54506201494baeebf6c5d42 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0f0f683d3c48dfcdcaf619ab924ee5c54e7d9a9f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/64f163f3c55e9a0ba45db23375384988dc9f2f6d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                 mesa3d-20.3.5 | 2 
               host-go-1.16.13 | 1 
monkey-f54856ce250c4e257354... | 1 
               openldap-2.4.59 | 1 
                    rauc-1.5.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.16.13         | NOK | http://autobuild.buildroot.net/results/8c47d27a1fa8c9dd2beed685938071e2c50bfdb6 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a7fa76bf73b46fac10a690f8cb03c41a02679a51 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7ec8d67a7aba7aa9484f31c2a6943c7d3e92f7da |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/75afadb7c62ba1a0bad6b3000d01b085f5553d21 |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/d8106a7135645b5ccff7f8273df9a7316a19f6eb |     
  mips64el   |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/1e8ed45385721d824f77dc8d0ffb7cc712871706 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/914ff822a8bd92e57a163f448915355dd8663343 |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/838f6d1a4f26b2fbd2eae1086119a285be66a5ed |     
  riscv32    |           rauc-1.5.1           | NOK | http://autobuild.buildroot.net/results/a5a8732047d90df6020d2513e3183bea73ee6afe |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a09911c39e38ae0575aca836e76ae982f688f45f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
