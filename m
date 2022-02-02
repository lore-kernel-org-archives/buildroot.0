Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24648C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 07:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AD0D60773;
	Wed,  2 Feb 2022 07:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7g7K3oi--lsK; Wed,  2 Feb 2022 07:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93A1260A80;
	Wed,  2 Feb 2022 07:02:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C62A51BF3DA
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B33E540424
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gelQB-hvh5C for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 07:02:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE8E3402C3
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 07:02:27 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4F8B1BF203
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 07:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643785344; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tI7Fl7IVpPOgOb1SuPrSi4Ub+n+fuFf6ESaNCewWtvY=;
 b=LwP3OUjgNh6cP6G1g2YlKhagHAPNwKF1O8qaeYrO4fx0+MukdLFG+9BIcIe3qtGymAJJ2D
 cdMvfVVpdd2v23JM6erBz7cVIsrIM+etHDbEZNSezzlZqh2ecO4m9Z+EEcX5/dSnz9gQDm
 Z1Apog+h5/JUBPJ29MAe16iUgnw3mPpTFWpBODUxJNmviYTGoSjVbE5bM/Z5rs7prSUVrS
 qt4jYrFyAYf7hTN//pxb8Fkz8bKbRjQ34SPcurNVsjj0CyLmyf2F1MFLI05FhzvEJgwpGZ
 s7lUnUGTOnfPN1cAJ76iU0vAFeDzWuxt5M0D+32hz/lSGJ/N5atlxDowErxBqg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 02 Feb 2022 07:02:24 -0000
Message-Id: <20220202070229.B33E540424@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-01
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

Autobuild statistics for 2022-02-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 66  |  9  |  0  | 75  |
  2021.11.x  | 17  |  0  |  0  | 17  |
    master   | 114 | 42  |  0  | 156 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 6 
               iproute2-5.16.0 | 4 
                   guile-3.0.7 | 3 
                    bat-0.18.3 | 2 
                       frr-8.1 | 2 
                mongodb-4.2.18 | 2 
               mongrel2-1.13.0 | 2 
               pulseview-0.4.2 | 2 
           tesseract-ocr-5.0.1 | 2 
             bluez5_utils-5.63 | 1 
                  boinc-7.18.1 | 1 
                    efl-1.26.1 | 1 
google-breakpad-7515ab13768... | 1 
        host-util-linux-2.37.3 | 1 
              libblockdev-2.25 | 1 
              libuhttpd-3.14.1 | 1 
                nodejs-14.18.3 | 1 
                 opencv4-4.5.5 | 1 
                qt5base-5.15.2 | 1 
            resiprocate-1.12.0 | 1 
                rtorrent-0.9.8 | 1 
                sg3_utils-1.47 | 1 
                suricata-6.0.4 | 1 
                       unknown | 1 
                    vlc-3.0.16 | 1 
          xml-security-c-2.0.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/4e5d09720e1041b661abbab300d136c10c5a8d7d |     
    i586     |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/b28ea9e9bb361171c74ae2a0139d318a5127d987 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/f28fe58f4a61e472eb9d927e1ac5c3ce91bcedf9 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8e6e3563274622821105046328c66f3e10c76192 |     
    arm      |           efl-1.26.1           | NOK | http://autobuild.buildroot.net/results/bd077e01708f1e389dc95ce3d95e75e3f89ecf1f |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/baeefc4afec26fc6fc1c0ea4e0664fd014519643 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/da6473439f4cbfa89b5b391fd704044e59ff970a |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/22ea26b16268cbc6e213a1a8e384e97bd20ab822 |     
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/6b5721c2ac7b4bef05e2f1c0d09312c2c1a941ef | ORPH
  riscv32    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/a6a68c18fb895fabc86fe80b5f2826785de2c167 | ORPH
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/a8d2d6ae17a05355c92df1081e4326f75efb41e9 | ORPH
    arm      |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/f397fc286a0d4b11b09dee3a850b64b1fe8f437f | ORPH
  riscv64    |        iproute2-5.16.0         | NOK | http://autobuild.buildroot.net/results/57657fda6740cc804f4409f31089dc7c40f74a4e |     
   x86_64    |        iproute2-5.16.0         | NOK | http://autobuild.buildroot.net/results/f99bb3722ea34b5bc6e2b813df87e4de472769f6 |     
    arm      |        iproute2-5.16.0         | NOK | http://autobuild.buildroot.net/results/a7f294c6904cc081be8d015ed392260f77a0c188 |     
  riscv64    |        iproute2-5.16.0         | NOK | http://autobuild.buildroot.net/results/9394abc10a7e836710ddae6562eafd72bfb8263e |     
  aarch64    |        libblockdev-2.25        | NOK | http://autobuild.buildroot.net/results/8f9ca895cb07014804130a7ccbcb758b1d519470 | ORPH
    m68k     |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/491b279f6029aec7fa7b9d82304def42e883177b |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/d4b0a6f91954c307b7660612497ad90db72f4b69 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3461e9c2bfe6dfe2c041d4c551a51a653bd03c06 |     
    arm      |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/04aa95fc8d4edcfbbbfc5bd5d5bf93a7119a9f0b |     
    mips     |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/9627c426d98fdc582f35b13996b1892f098bcad2 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/8996cc747d90b5d7d15c93c09ba3ae3981f34af6 |     
  powerpc    |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/90787c5d8a492df662f8c7b2ee5df95184309cf6 |     
   xtensa    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/18d39de9f2df7114eb992ea57efa58547d7247fe |     
  aarch64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/47fe7f2c5dee593b19461e830b4fd76517a7c0eb |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a4aaf0971377a20f6f4893d482fbe14ad06d8e76 |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/ed249c8a59a12bbfff470370867d517c6bdc2933 | ORPH
    i586     |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/158e32c11f8b06670973abc7b9603f2f4f77beb4 | ORPH
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/b1fa6aec6bad3d087239e29a8b864921718f5b6f |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/2261838c4bebad936329e90fc829f5b029cf1b39 |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/650e064bd0f5661f5bf85ae147930c5f8ca60451 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/2379f2da589b44edfac9816648e2a3d7916491af |     
powerpc64le  |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/12f0cea0a844e8774a05e31c0ce8b3bb2efd9484 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d40e5f87411e208669dedb64d93bd96d4273fc6b |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/5038411b9e8907ee88048d6010ec75c8f53c4ae9 |     
    arm      |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/f707c5e3119379e41913f207708fc61178d437b2 |     
    arm      |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/83218b7d248ca294be80fa6b7c0cfb542c9b326e |     
    arm      |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/bfae8b8897353147370535a46c8d7b43a469da35 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c8478dc96499b276236cbf7de35d8f44239d6bda |     
    sh4      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/4eb47ace0d96063e94d58636e331f0a507fb6136 |     
    arm      |      xml-security-c-2.0.4      | NOK | http://autobuild.buildroot.net/results/549cde069a1492dc87435a4af155e51d3c998b0d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
        glib-networking-2.66.0 | 1 
               host-go-1.16.13 | 1 
monkey-f54856ce250c4e257354... | 1 
                  ndisc6-1.0.4 | 1 
               openldap-2.4.59 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/3e2b499e602b0ad5e7d3ff0f8fb33b857863d562 | ORPH
  mips64el   |        host-go-1.16.13         | NOK | http://autobuild.buildroot.net/results/8a5ab390afef75ee7c7c88f03161174928948adf |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8fb5e47e890ae0a2b83a51662a50af73323ccb7f |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/52b828d3aa3ee5aa747f76a476457c81ce0ab526 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7308662ee2faf740de09342279ef66efec2f0960 |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/0f78f13a13c8b77b6abc0735abb2a83557c8ef86 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ab457340d8cc12cced36300b770ce3c33d34d944 | ORPH
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/980c56bdc7678f10ea1ae1c0acf88fa9ed573e1d |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/1b41a2394519e63f1fc6629a7771611426864247 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
