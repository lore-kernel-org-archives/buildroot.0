Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB85FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 07:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E64D4163D;
	Thu, 17 Feb 2022 07:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6Uq-VqbboNy; Thu, 17 Feb 2022 07:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31AC241632;
	Thu, 17 Feb 2022 07:13:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF8BF1BF3ED
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 07:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD9E841632
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 07:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_Y-djZSwI4W for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 07:13:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37E4641625
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 07:13:36 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4F64B20000E
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645082014; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EG/qHlf3z13OpQTFJoj0K+hMxDlb6mhAmepVWu25Wwg=;
 b=LmEf9t1g6nCqcO6w52vs+z4K/C2W2NM8ZgUuwEZT23s1cZr6ZSEIMuXmrXeVDhMTMdCaDL
 UUPVA/A2qQN4xK/sH3NLOCKkJVrMjAjntKeMSGMRDk+oU1bGRvYMbenRgwtmrpBJ04ulaG
 5HLwKsG/+kjFru8Bv/moNEdJEl0I3C1+Y09koJ5kst01CFX4MAZlboIXxeZy1lRo5AhFfc
 nB/StNv2wbAsfbxveo/bKMwJKtfrUTlFNRVMxJxEegx73RyZYJDjH7b+U7H16wAhE5VGJn
 nBXPYxPXlkVgc8tykVCIdiJPX1Oz6uAM8mE2GamlcwUtaIhDytyJ5WmX2hJWGQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 07:13:34 -0000
Message-Id: <20220217071338.DD9E841632@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-16
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

Autobuild statistics for 2022-02-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 40  |  5  |  0  | 45  |
  2021.11.x  | 21  |  2  |  0  | 23  |
    master   | 47  | 35  |  1  | 83  |

Classification of failures by reason for master
-----------------------------------------------

bpftool-a7f0e7f057283ae8af3... | 5 
              cryptsetup-2.4.3 | 5 
           host-libselinux-3.3 | 5 
             bluez5_utils-5.63 | 3 
tovid-87c676f4aadb7303d2cd9... | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
     adwaita-icon-theme-3.37.2 | 1 
                    bird-2.0.8 | 1 
                           frr | 1 
                       frr-8.1 | 1 
               luasyslog-2.2.0 | 1 
                mongodb-4.2.18 | 1 
               protozero-1.7.1 | 1 
         python-greenlet-1.1.2 | 1 
qt5base-53a047c212af7fbded6... | 1 
               sdl2_ttf-2.0.18 | 1 
               target-finalize | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |   adwaita-icon-theme-3.37.2    | NOK | http://autobuild.buildroot.net/results/5aadabaf26a92ab96332bb09f4343bbfd5341786 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/09f42973cfee21754e4f6d6782567cf897bd8dfd |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/ac6792d046c6c1eae9f233621da1e01e4a4fbdd3 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/ea83e269e479f8bfa4e39f7376f111db6843e999 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/af177e9fa52b55149d7fb50759dc0d26b97c3732 |     
   mipsel    | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/8bfc2abe3ab7a0b53aa717c800a4c7a3c964f426 |     
microblazeel | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/90945e38d8cd15e73ab97b5796aa7dda0fb88e8b |     
    i686     | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/8ea69cd0942114218c0e68441d5100be02fd1eb0 |     
  mips64el   | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/7955d2fe892611c4b2cf3af08aa7bf9eb9431017 |     
  mips64el   | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/cb68a0a498f6c7d493e191b0e190ab7d3209d0e1 |     
    arm      |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/5b1ba16fad1ae337f894bcfb3d5070179f4c02d5 |     
  aarch64    |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/4bb616907192f0a836eab716960ad2856dc2342c |     
  powerpc    |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/325c3d7e1085c6bef88fc4467139b181eac009e9 |     
    arm      |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/d520132c758080a455ee5f5a49eabfbd338964b7 |     
    mips     |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/9b741530fae2b42157d80d599cacd8af86c8ecd0 |     
    arc      |              frr               | TIM | http://autobuild.buildroot.net/results/1e7a8c284a09bbc8544ca28b563bb6051815cf76 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9cf63046779e2572fe96c2429c18e8970ef9dd1d |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/1d7857f7d084b70e539e3027019896bcfcd3c8fb |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/c9638aee4c00fb20a6d4949eeff91546e0148596 |     
   mipsel    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/25f0f8eff63ffab9bb79554a1eb994b9b64519d7 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/4f0b29d3e2d8a423112bfc8c9081b44cb3aaee80 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/267af119a7014227d0b74c61bc7ff7feda85a459 |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/24495d12812c81cc603e6c369b77726ba3ddc81a |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/2db2c77ec9c0cd2020c4f83883d5cad3be9a20fe |     
    arc      |        protozero-1.7.1         | NOK | http://autobuild.buildroot.net/results/8cbddfcde6adc201300cbfc7413f6e87aee27bd7 |     
    arm      |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/10ca98b0f48f824b95691705eb14124273ea1c9a |     
  riscv32    | qt5base-53a047c212af7fbded6... | NOK | http://autobuild.buildroot.net/results/4325dd43fa1480925a10602d82b8dfaf35e8624c |     
    arm      |        sdl2_ttf-2.0.18         | NOK | http://autobuild.buildroot.net/results/cba34c431f8d1315e9ca9159274421a8219a701e |     
   s390x     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b287fc499cca5b1b6a46b04a368ae2af77cbacb3 |     
  powerpc    | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/e4a89213aeb6336c86f9b85c43ef266004ac97b1 |     
   xtensa    | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/84b2dc4ad2baac6a3bff86fdccfa8e8fb62bc23a |     
    arc      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3acd0250db862e4c3ff241262d075fae386123ed |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4e4560e8cfc4b3968bdc15d2263c56c1e9f33f11 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/c3944c8bee21c685663e6c1785d37a39bd5ff7d4 |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/621bd326e9eaac3dbb1f53ead7722dd0e0f36a08 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6daa27af2c5b93c5cd4df17fd8cf5db952c57491 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 2 
                  apitrace-9.0 | 1 
               cutelyst-2.11.0 | 1 
        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/55cc3859985548ee6a1b7c66341477a17dcc2aeb |     
  mips64el   |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/7622eea4419d1cae298fc2133c549af59cde33ab |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a316d6dd18291fe6f16e64780aa073cab2f57e8b |     
 aarch64_be  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/38f1f3c23f829c6ee6498690bdcdc37a716f4291 |     
 aarch64_be  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/69a5fe12c0a1a65822b5713227f0a437b01d99b8 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                     mtd-2.1.3 | 1 
                       unknown | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/dcac657a96b8f7f77504eac5067de26fb16cda84 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/c630552d7721ed1b6f5526682fa3ca74c9b8836a |     


Gitlab CI results for 2022-02-16
================================

Detail of runtime-test failures for 2022.02-rc1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852418  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852492  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852495  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852520  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852572  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852603  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852624  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852627  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
