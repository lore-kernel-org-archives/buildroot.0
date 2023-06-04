Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77653C7EE23
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 04:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C84DF83807;
	Sun,  4 Jun 2023 04:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C84DF83807
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6aPg1uNyw2O; Sun,  4 Jun 2023 04:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9682837A4;
	Sun,  4 Jun 2023 04:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9682837A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E41241BF47A
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 04:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98914837A4
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 04:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98914837A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrOC_PNy-rnk for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 04:39:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A430F8376B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A430F8376B
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 04:39:57 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 988D960007
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 04:39:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 04 Jun 2023 04:39:54 -0000
Message-Id: <20230604043959.98914837A4@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1685853594; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N+2zh+H0fVS7Ts+U/S6dBeYaYW/o7AUuKXXwpNQws3A=;
 b=ogArQ0HBwI6+O9QV+lOiuHQ8D3VJgs/Edl7iz20Jl8kvO4jWmA7bDuM0AaXVYxrJDqRndX
 4Y14l5RZ7KtMrkONKAMC5vzySMO7Q+3h1ZO/guVcRp7G8E3brT7V9TOQGJk4mXreLSrmfn
 5oaUd7/lxYUCJvcy/bDAhb8Uj26QDGPTH/QWzGmEmru9hW0OCEY1T30JYCASM2tGOH/sTT
 tr9VcNCC7IFCP8dASOd21J2QF5kafY2lOFGjlVf1mhdrdcjKEXlFj8NnwbA2p7W9Az9zB1
 2H/QlAJInIADshft0Dyih2wmmcku3LY6wQ7Gl6Bbj+EtALDX04ML8l8NdHBQDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ogArQ0HB
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-03
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

Autobuild statistics for 2023-06-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  7  |  0  | 11  |
    master   | 82  | 58  |  1  | 141 |

Classification of failures by reason for master
-----------------------------------------------

           at-spi2-core-2.48.2 | 4 
             dahdi-linux-3.2.0 | 3 
package/sdl2_net/sdl2_net.m... | 3 
               perl-clone-0.46 | 3 
                     audit-3.1 | 2 
                     efivar-38 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                   linux-6.3.5 | 2 
               syslog-ng-4.1.1 | 2 
                   trinity-1.9 | 2 
                       unknown | 2 
                 agentpp-4.6.0 | 1 
                alsa-lib-1.2.8 | 1 
             batman-adv-2022.3 | 1 
                    brltty-6.5 | 1 
                  faad2-2.10.1 | 1 
                  ffmpeg-4.4.4 | 1 
             fontconfig-2.14.2 | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.74.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.38 | 1 
       host-python-sip-4.19.25 | 1 
               host-runc-1.1.7 | 1 
              host-rust-1.68.2 | 1 
               ipmitool-1_8_19 | 1 
                   json-c-0.16 | 1 
                  kexec-2.0.26 | 1 
              libgcrypt-1.10.1 | 1 
            ocf-linux-20171122 | 1 
                     pv-1.6.20 | 1 
           python-bcrypt-4.0.1 | 1 
           python-pyicu-2.10.2 | 1 
            quickjs-2021-03-27 | 1 
                   sdl2-2.26.5 | 1 
uclibc-ng-test-6790eafe897b... | 1 
               valgrind-3.20.0 | 1 
                    volk-3.0.0 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/9fa63799e083b9a3d1f3c299108a46d208ed9749 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/996b62880d108a93e95b90ff7cafa0e2358fa55f |     
 aarch64_be  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/231c7c93a82bdee699c429e6d870387351ec6471 |     
    or1k     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/e2eccf64de6f466e1fce2e14cffd47d920746978 |     
  mips64el   |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/17db63fd282befa1dd4b785e472a1517fd2687d6 |     
    or1k     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/225032aa95ee98c57a8fced7d52426638cbda036 |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/81b3ba92bd856202289bdb5a2de2580938b7e8ea |     
   armeb     |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/8224a9d3bc5a256ae56cd4d0b1ed3d72f8b4637e |     
    or1k     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/053ef481605650a80844bff0d5226c8edc51ddb3 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/c6e1a47150168ddb1693162c8894461175c526a6 |     
   arceb     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/63b46ad2fafa4664d8e176064ec4a91e2c680c44 |     
microblazeel |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/a962b4994f220bf724223687a05605f9861e8b1a |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/059f6db1bb2a533028e35e764986dd214248dd33 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/4d818690ec36c6e03c2e10dca7247e84ace3eb66 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/1d73b4fe478d2c568c627456a95a77a6f00e451e |     
   sh4eb     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/1cc084bb5066ac72ffbeba51a9951c7d2e5957b2 |     
   armeb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/ec7a40a7460a701f2e8c9af482b4274f65901bc3 |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/f547c65802a0a705e866795a80e1b17ce80bcf0c | ORPH
  aarch64    | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/12b02fb6c68f0f4439f2573f8ef3ca80f77f43de |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fa5989038e393e6d0d12c45438555f56c34be503 |     
   arceb     | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e0cf7c414baf5226c9c9a026481293470e42562c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ef59ab45874f4bc8a4aa59f1848d90eb5faee398 |     
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/48ccff568423c04ee75a20628ae63a8f1e7fb223 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/124645014136d0c6ecbac334470954fbec19aeb1 |     
   sparc     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/c2d22fe0af22c50422f43236435cf47761cb36de |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/97ba45ddfe1440adefe2879ce5b806fc83aea8b7 |     
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8970874719f544815623e3658f6016e1406b762b | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a12d97c71a262c36fcc6f1cd2dbd7ecdc73e00bc | ORPH
  riscv32    |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/e6c62dc5ff4834714291ba30f1492313c7f2664d |     
    mips     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/f4b493bf8c7211b2b201cb516cb3b847ffef8725 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/1b2acd87df9678e422af76807f188c451ce9c349 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/38bbef373f58d47b7383a4bbc9fc5cdf5db9a67a |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/7fe066b48f6af72f01253be69a1f0f319a5c339b |     
    m68k     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/b5a46cc164cb0fe6bf37dacb917b3664d2710a4a |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9c1b1ea2576a33b3cbd8d4a717a9d0b92fae3db4 | ORPH
   mipsel    |          linux-6.3.5           | NOK | http://autobuild.buildroot.net/results/9b340911e51eea15b453fd4a4126b478a7be6fe9 | ORPH
  powerpc    |          linux-6.3.5           | NOK | http://autobuild.buildroot.net/results/fcce6723f25c6def00b1978fdb53a6f35e0fcd28 | ORPH
    i686     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b35d8241fa2a154251c0d843e585a8b5ae17bc1f | ORPH
    mips     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/440105258a1ae2ad115b9d47de5b219c5363afd6 |     
  mips64el   | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/b41b3853f9411b4fe05082685b91a913374b075c |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/c3a48213a34c8feea1e4256c4b69f73e571b2908 |     
 aarch64_be  |        perl-clone-0.46         | NOK | http://autobuild.buildroot.net/results/25bd4398a56b3d4ad0b05f9213c7983d8f5d6087 |     
 microblaze  |        perl-clone-0.46         | NOK | http://autobuild.buildroot.net/results/5d503aaa94b56523c684be7946123921747ebf52 |     
   arceb     |        perl-clone-0.46         | NOK | http://autobuild.buildroot.net/results/acd02bbdbd1bf0c7e52b8a738699ec6b1b758279 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/b5961fdb7d4ddcdfbb1d5c42e2b8be7a45ec6760 | ORPH
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/a99318c6064a23086a894936d9eb1064114d84d2 |     
   nios2     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/658364b015e6bb1d79351216e3a0725db7190f90 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/cfe74ec6f8df2ea8c745dd7e9096bca4e0e86a15 |     
    arm      |          sdl2-2.26.5           | NOK | http://autobuild.buildroot.net/results/afd227d3558aceca6e817d7ec1c1c54f7e97b366 |     
 powerpc64   |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/dd6b3b8f30415f6c0e18eb5b34920327f99900ac |     
   sparc     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/c128ca386ed69d073930ecb3e30d8f6d2e4b1636 |     
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/82736ffe64c6b2547ee01a167f43b894036acb52 | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/037f56a0f7e03d4f25af57e0739fdd3d3cfd5d75 | ORPH
  mips64el   | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/ae03c4a28a629a3340344a0699896628c71bdb03 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/8243a0e836d91845fcf591d8ba847d88c404634d |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/35c23f2d80183752405f2e44f106b0ad65818164 |     
   mipsel    |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/7f8bf033c513716452b1a1cc3fc8ed3075fc0a60 | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/a71688145eb1632ad2bb73cdc057069e5e5d1d88 |     
  riscv64    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/47e2c1630eff716e05c2295b1b0ce9d5b7b53f78 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

             containerd-1.6.20 | 1 
                 highway-1.0.2 | 1 
            host-binutils-2.39 | 1 
               host-runc-1.1.7 | 1 
              host-rust-1.67.1 | 1 
                  linux-6.1.30 | 1 
                   perl-5.36.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       containerd-1.6.20        | NOK | http://autobuild.buildroot.net/results/c1611740a150df364b1a88e47cb2c0a9a8b669a5 |     
  aarch64    |         highway-1.0.2          | NOK | http://autobuild.buildroot.net/results/168adc1a685e5accaafc71d81b1c180f1db4ae5e |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/dda3c0281ce40d7510f59ce3be173877db5b3fce |     
   x86_64    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/9dc65bcee661c318d777690ba2a829f973b8be2f |     
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/6f685f687878845416e300ebd30017e26eddf85f |     
  riscv64    |          linux-6.1.30          | NOK | http://autobuild.buildroot.net/results/7dc4e36a249bd5bfa1156e4b2938585331bd8df5 | ORPH
    m68k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/cfabf9a420cdca7d2347fbf3f50a0f24fbff95b6 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
