Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA999E80A99
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 06:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E8F7822D9;
	Wed, 27 Sep 2023 06:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E8F7822D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUt6Svuj-EFg; Wed, 27 Sep 2023 06:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20CAD82301;
	Wed, 27 Sep 2023 06:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20CAD82301
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 552791BF335
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 06:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0420417A5
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 06:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0420417A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plnsRQGTqiBz for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 06:34:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 734C741736
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 06:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734C741736
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA56B1BF20A
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 06:34:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 06:34:10 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230927063415.F0420417A5@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1695796450; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XFMr1p38elfoFn20iu6U3ZoIfLCfOcKKxQ0yjNkGv4c=;
 b=mW8jrwy9pCFYcU6lmhrSU98YZlxQIpEg6077YSyqTTkdpv7asvY6uQYGq85WAHDuNGZuxC
 JbIMDIdC7Ckoy70Ukkf5WXVX2IsN2/rGUrgHQDruL85KS/uXo+/451EbjG97WZnGsLccO/
 T7MyNj4l7Pt43VhB6bx0CQMEfiQ3oKPA1xtsK5RjoQgbRl0zGhO7YWLa9MEY0ZdSf8nDGl
 9jqk11GQWt4Zl2l1BKG6e3fwcjXLZvwhHZyGv2Zv44OSpjqGM4f6j2L8k0QgDg5A0bTtWc
 2C37sha/zapYp3rqZfGZynjUHtaKSX2LYfcri7caNBDouqAplCX+JktdP8rsNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mW8jrwy9
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-26
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

Autobuild statistics for 2023-09-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 11  |  8  |  0  | 19  |
  2023.05.x  |  6  | 10  |  0  | 16  |
  2023.08.x  |  8  | 11  |  0  | 19  |
    master   | 71  | 70  |  3  | 144 |

Classification of failures by reason for master
-----------------------------------------------

               alsa-lib-1.2.10 | 5 
             alsa-utils-1.2.10 | 4 
             stress-ng-0.15.07 | 4 
                       unknown | 4 
                   bird-2.0.12 | 3 
check-11970a7e112dfe243a2e6... | 3 
         gobject-introspection | 3 
              libarchive-3.7.2 | 3 
                libxml2-2.11.4 | 3 
                  linux-6.4.14 | 3 
                    olsr-0.9.8 | 3 
             strongswan-5.9.11 | 3 
           dmraid-1.0.0.rc16-3 | 2 
        host-sentry-cli-2.20.3 | 2 
                  kexec-2.0.27 | 2 
               mariadb-10.11.4 | 2 
                   perl-5.36.1 | 2 
               apcupsd-3.14.14 | 1 
             batman-adv-2022.3 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
        edk2-edk2-stable202308 | 1 
                      ell-0.57 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
         host-gcc-final-11.4.0 | 1 
              host-rust-1.71.1 | 1 
                libressl-3.7.3 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
              liquid-dsp-1.5.0 | 1 
        ltp-testsuite-20230127 | 1 
                 openssh-9.4p1 | 1 
                 pango-1.50.14 | 1 
                  reaver-1.6.6 | 1 
             util-linux-2.39.2 | 1 
               valgrind-3.21.0 | 1 
wilc-driver-linux4microchip... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/2f946ed26694f2bcfe09dc6688c2beeba9e4f2f9 |     
    mips     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/2b47f0ecefe1c6c702c7a3329723b2cf4ba58647 |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/bce46fd8aab9ef4918228e8cfc5f8b5abe71e859 |     
    mips     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b332ed71fdca20d54e7cdba10c040fa0b59f6904 |     
    mips     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/efddbd0764c1db03a1c282d7a78f214e3e3d63be |     
   nios2     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/afaeca586f5fd0987a98862d395cd9aab062f75c |     
   sh4aeb    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/b64f68142843c112374126b0c0502b985d352b87 |     
    mips     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/1c8f62e1849d3b6bfbfaf2c35c95b2a9f0f18dfb |     
 microblaze  |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/3bdfbf565a78480275fafb7c4953ad247f3f06c2 |     
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/bd31ed826978dcabd47653d7b1187024abe35414 |     
  riscv32    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/92f7629721c65552c77d234cb7a885068942b2ce |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9e804ffa3dcdfb9cf8fc308b80094516e8982086 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b71598cc79b5fc0e2ee68dab13e0ddc3259ee6b3 |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/025a18d6452cff9fd1b33b8729e1d35963cdaa56 |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7294c98020693a2bfaa4e9007072796b8931096e |     
  mips64el   | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/9f64d39b518b773f473c4db503a0f0c6e687119e | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4767961faf1867795cf632751992a66a3d9a988b | ORPH
   armeb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/52cc0260bfcae6c13f302db78923ae4e7fa5f17d | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/2d073d4391731d1ea63d7a4b7ea3e0143d6f4884 | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e0728b89be0847c0ba8311c8286f29b3d663ccdc | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/b371f195c1ae042754133d812bdcb39d5c411db3 |     
    sh4      |            ell-0.57            | NOK | http://autobuild.buildroot.net/results/db1b726676ea12a13b97b06f27a0619fcdb2ef58 | ORPH
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e93d8035bbd11875f0bcc67df9d22da01d33d1c2 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b0f073c313a1aa7ec2536c9053b5e15d25c5ffdd |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d0e70fe8e287ddda1269b63487a7ee9bfd4c7d50 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5bd75b6e20e40e7b44356ca8ae53ca20d4b77fe8 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1559342e75355c458e271be99a19b986297e1d08 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/bbee6a830927f22102fc9ce4e0e49f4c30c4f44b |     
 microblaze  |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/dd452d9f841ef49d006617a2d9fa21069e2a0b6b |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c3a3ecfe1bbd9a40ef91250c0326a5c2da314de7 |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/a1fa5c6b2a789f58aac7ff87206986d2b40d612b |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/999802b8a1e113cd3972da7abbf110c2fcec47e9 |     
    sh4      |          kexec-2.0.27          | NOK | http://autobuild.buildroot.net/results/c5d0d590f5608a1ad16d48d8bbdefdb4435bcd3e |     
    arm      |          kexec-2.0.27          | NOK | http://autobuild.buildroot.net/results/e2491c54df893880ce34f15fa862bfa03f4555d3 |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/9e3fdadb4be775fb2db4b61d2ba26337e90859b1 |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/987e75b012c0f8466e63bb91e319f7a36090dffc |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/c961d86fd48da5be82d1199abe27c31a215d10ac |     
    arm      |         libressl-3.7.3         | NOK | http://autobuild.buildroot.net/results/4f88b56e097197309af0878cc590e8afb41e718b | ORPH
    arc      |         libxml2-2.11.4         | NOK | http://autobuild.buildroot.net/results/27a8fe717e47fcfd160987f122ad15fe43078446 |     
    arc      |         libxml2-2.11.4         | NOK | http://autobuild.buildroot.net/results/ca2ce2304c48544ab42442ec72bd0512a3f575a7 |     
   arceb     |         libxml2-2.11.4         | NOK | http://autobuild.buildroot.net/results/ec055708cec2cc2e158e71dd3beceecca60382e1 |     
    m68k     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/aa2bdd33860f71371e8d42418f6a0836babfdad2 | ORPH
    sh4      |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/be3b980b646c0e1397f4b23380ea5663d4bed7f6 | ORPH
powerpc64le  |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/8e6124a9dfd3a81ce64e7f8189f72e741d4c47f2 | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/c7a80098e94a1c66b502b80e93699dedd7848352 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/72b1b532bb433093f4359677c193d4a3eb0246e2 | ORPH
   x86_64    |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/4a11e77600261a34e2d86ca5d6f93b9510d0a845 |     
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/d3bad7040143e4bc268428c9caed50ff77941a75 |     
   sh4aeb    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/4f3c92426f1bf677383d1aabc6bb87c1e42d0c16 | ORPH
   x86_64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/e3046f22693a1b7234234cfb7f62728889ff569c | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/fe51e398230583791c721a450b799ee75bc16a37 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/66d68bafeec6b7604db1c2f6203783b8e5588891 | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/96532fc7879bdad88fb71cf328d444e0e3bdce33 | ORPH
  sparc64    |         openssh-9.4p1          | NOK | http://autobuild.buildroot.net/results/b4ce88b89952ca09ed1a8de65c51b05344a5a972 | ORPH
   sh4aeb    |         pango-1.50.14          | NOK | http://autobuild.buildroot.net/results/f0c4422e93270e65d7d2e8d08eb5a08f69eff6eb | ORPH
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/1a12da3b86947afd5845a1457bc2abc1b9ea08ec |     
    arc      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/fb51306e8868ec2fd7d15498800f01f7885cac77 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/89758b5c9aadb3490d835b26ab07c1c7e85ee702 |     
    mips     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/38379ff80aca1a7e5ea6ab115b5b23de7c5427d2 |     
    i586     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/c00b2a31e721cc041ab20c99a75303bf1de6f096 |     
powerpc64le  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/2d6f749aaeed14c9eb1701d876457c69fde464de |     
powerpc64le  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/3c0d762e06653269c90e57d2e13cf1eff6d0865a |     
   nios2     |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/120141e83d72522948deb91da129f76aa5a83ada |     
   sh4aeb    |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/2f803aeeecb2af6a06dc93c5e304ce7a13b1a71c |     
  mips64el   |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/4bd9e29ccd83499c612f5642c8266f5a0c2db20a |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/9ce83b59102e792896fb483f6dd440ae5ebdd8d8 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/1ab748163ae3d84d4cccff92ffa562ff665ee7a7 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/8474d7bdc1b0a12048ed061587efe13fb6c133eb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/99b4ead4f79e82ded399b52edaa92c55f483949d |     
   nios2     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/f7e59ea8eb40f935cd3e54be9b23a49391cbf827 | ORPH
  powerpc    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/2bb712f801317c091c3ed31fdf132e5e09ec9fc4 | ORPH
  riscv32    | wilc-driver-linux4microchip... | NOK | http://autobuild.buildroot.net/results/3b954399aa3ffab9609da1fc381f38f28bd8eb9f |     
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1806c455f0e62d3930fdc2385f5e7db5a9bc9825 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.39 | 1 
                  linux-6.1.51 | 1 
            ocf-linux-20171122 | 1 
                    olsr-0.9.8 | 1 
                    sdl-1.2.15 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/386636ec4fc6c79a41fbb75f578710f58c8e843d |     
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/035933ef9e4c4cfc885092b15766d83b031da31e | ORPH
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/42dd0fd5d3aef4aa1fc1ccded54fb97bdd1c5ba0 |     
    arm      |          linux-6.1.51          | NOK | http://autobuild.buildroot.net/results/270b850f33a0a26788c9624fef3ecae4dcedae97 | ORPH
    arm      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/22760ae71722b86f5a4cc7cd2d827c915653f5f8 |     
   mips64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c3a68f7eb6971c66b83c1c7ff558d07603289267 | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/39185aa2cb1013705f57e34b4fce0f860ca11d3c | ORPH
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/bcc93c0e077e676d833f66617befce3a6dc36ef7 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

             stress-ng-0.15.07 | 2 
                       unknown | 2 
                   bird-2.0.12 | 1 
                elfutils-0.186 | 1 
                flannel-0.14.0 | 1 
             fontconfig-2.14.2 | 1 
             strongswan-5.9.11 | 1 
                 uclibc-1.0.44 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/390fd6c4468a8a0838c20e40d301d361c31e82f2 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ebec4135159e7a668bc8aebbd7c2519b629605a4 | ORPH
    arm      |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/618f95c6f5df1ee58fde514d937de583a09ce8a5 |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/9b85ba5238be95524965991d632ca47e184d131b | ORPH
  aarch64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/ad49eb664d1ca1a46ce1b8897525fbf73231f4b4 |     
    sh4      |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/4740addfc7cad863e48d62b66ecd3747ebc44cf7 |     
 microblaze  |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/c0fb104c2ea0b0dabaa1454ffb7e91ca2461d798 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/7de3a1b62105b44ff3051f5d5365799a7013b922 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8d813fabb782e694a05cc9dc518b1931cbf7ccab |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/0dd52ec72f42dea1b6341542ce56aad049d73291 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 1 
                 coreutils-9.3 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                host-go-1.20.8 | 1 
              host-rust-1.71.1 | 1 
         host-sentry-cli-2.8.0 | 1 
        ltp-testsuite-20230127 | 1 
                   luvi-2.14.0 | 1 
             stress-ng-0.15.07 | 1 
                       unknown | 1 
             util-linux-2.39.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/df49834384e20d834b8b7668c9654688533aec2d |     
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fa18dc57369ae693fae43361c7269925571d60df | ORPH
   sh4aeb    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/69b71dd9000ca38dbb2985340a623af5fa0c0538 | ORPH
  mips64el   |         host-go-1.20.8         | NOK | http://autobuild.buildroot.net/results/a694fc937e06e6c5eaae3fd47db934d212e2a0c6 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/594460a4e27f5dfeaa542dbf32192006f76e07e9 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/07b2c4eb3df0cd2652723ef7db61336687470cc9 |     
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/d57777ea07867efce9043ba96873d87695abebd2 |     
    mips     |          luvi-2.14.0           | NOK | http://autobuild.buildroot.net/results/d15cc3a47fe3a80995f92a76d69e440a292b26ac | ORPH
    mips     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/5e15bff79973e9d37fa0617d8a65781f4fb231c9 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/b182480645fac61b488135e319c1c4cf60f1e3e4 |     
    or1k     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/996f1bba9d2ffe60f6d41db610c5fdd09f008061 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
