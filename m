Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C9C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 07:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB00A40180;
	Tue,  1 Feb 2022 07:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iguEm-EbUL0E; Tue,  1 Feb 2022 07:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D58BB401FC;
	Tue,  1 Feb 2022 07:08:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45F0D1BF29F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 07:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B96240971
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 07:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwYrZPP6x4Ee for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 07:08:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03C3340977
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 07:08:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B40740003
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 07:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643699283; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ThUTADH+c0L04jtZOhV9MtZXGId8egchWSvZX9MufKU=;
 b=FUzooy9v9+KEq+zxMtVS+KtWICWIWgt4sZdUsy/isNQxIgKd4FH/y4gNJ1y7XkioS5B5qH
 oFmAxzoKo1Zerx0+k/yaRUHB5c3QaNlPt5dN+HCnifCsYytfx1i0yufNqqUVAdDj2ArheJ
 Nw98GbvQMomTYe3g80y8zs38heNA5WImzbroPwjsJsZOH8ujxdnyr9j9+sYHZwKiOLF5d3
 aJMvansbrMLpufufSh6fqe/UTXgNFyNTTlJ9RCE53HMUTt0X6fB7Y+EASmduTlPcB+E5RC
 3gRa5eTIKhV8x9Yaxd8ryLIhr5gQRZt8gtTzrotpGr54uc7ExDFAaWQO1o2UZw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 01 Feb 2022 07:08:02 -0000
Message-Id: <20220201070808.2B96240971@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-31
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

Autobuild statistics for 2022-01-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 67  |  6  |  0  | 73  |
  2021.11.x  | 24  |  1  |  0  | 25  |
    master   | 85  | 42  |  0  | 127 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 4 
                       unknown | 4 
                    bat-0.18.3 | 3 
              cryptsetup-2.4.2 | 3 
              libuhttpd-3.14.1 | 3 
                 wavemon-0.9.4 | 3 
             bluez5_utils-5.63 | 2 
                  cairo-1.16.0 | 1 
                cryptopp-8.6.0 | 1 
                       frr-8.1 | 1 
              fstrcmp-0.7.D001 | 1 
               gocryptfs-2.2.1 | 1 
google-breakpad-7515ab13768... | 1 
                   guile-3.0.7 | 1 
              host-delve-1.8.0 | 1 
               iproute2-5.16.0 | 1 
              libblockdev-2.25 | 1 
                 mesa3d-21.3.4 | 1 
               mongrel2-1.13.0 | 1 
                   neon-0.32.2 | 1 
                   perl-5.34.0 | 1 
               pulseview-0.4.2 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                rtorrent-0.9.8 | 1 
                    ruby-3.1.0 | 1 
                  waffle-1.6.1 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/f854a4e5038ca27d8497fb7129b5cc64a9f7ff1d |     
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/2eb975dc561c1a6997e86017dc2455c4555ff742 |     
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/f56b3ab091705dc99bc3b8fa042bc367cbd02a3a |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/e639f16dfd687cdd3bd25d40d28796ab1ca0af9e |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/5c75ad724df3ff726559acee0da31f777ef6bc68 |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8e2b273272626c41df503c96628a9c2e34404f46 |     
  powerpc    |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/252a6f6a0bb7e5c0efe7338ad2e4c211530267e7 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/6ed262b36b4061d0fdc95fa5a6f73fdf5fef91fe |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/48abcc403e7e3e934aba7fbc5f278f28c8c0560c |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/b15a6532b028421c9a92a3c427f4cbe339d95275 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/ef743c15d7711aae025f60bd9405c740739acd76 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/986a5df3957de948de4439e2050a875a5c4e9f93 |     
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/034faafa66329a5055fc1a0ed4d14358b8b40d63 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/ad17e586242942b732ae59aa0a19f7bdf2957088 |     
  sparc64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/c8a62deff1b490c5147d956d64fb9ba1283479fe | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/08bf879f7ab25ac7ff6b535112c8b889bec4fcfb |     
    i586     |        iproute2-5.16.0         | NOK | http://autobuild.buildroot.net/results/455840288bbe13ed585b0e2dc7b20a294dd1eee1 |     
powerpc64le  |        libblockdev-2.25        | NOK | http://autobuild.buildroot.net/results/2fd1b4001b64004be49dd91329945ab108e1a90c | ORPH
    m68k     |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/8bb865ebca04f2ba0b2761d421fa1d98404b0ef2 |     
    arm      |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/8d2a79dacf9ac423f7ece51b8c23f3683238312b |     
    m68k     |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/5d42251597d66b929677199a044115380dac42c7 |     
   x86_64    |         mesa3d-21.3.4          | NOK | http://autobuild.buildroot.net/results/05b2ebd2f1abcf909ffe06f14aebef1dabfef582 |     
    arm      |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/356f99489bc629b9cb864cf9f6299e70ce943fed |     
    arm      |          neon-0.32.2           | NOK | http://autobuild.buildroot.net/results/da995ef26001357e51a5907de9c6111b9ff89bdf | ORPH
    arm      |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/2622d5f0405c387be414132bd71d4f84406d5af3 |     
  riscv32    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/80427fc30d77ac5919b8c01d41afd805293e0fea |     
  aarch64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/d5fa35cfdad09aaaaa88b537d79d8446d10872fe |     
    arm      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/69a68f11887523b1f8516d02e85e76f64f6c363e | ORPH
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/95a0cd885f644ca877d8266610a89e003864b71c |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/1b79cfa0a439fe9ebfab24ff141e6d667853c1ac |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/846c8a79b7d5bb9e4b23fe7521884d2f1b9eff4a |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/70efd9ab53c60e4c44b354ec34f9a27bf73e71e5 |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/4e2e9dde0b18a5958ee2bcb8d72c0f9e76f85492 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2ce862a946d5a9ccbfe0b82957ec522092c1ddf4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b621449701ccef80348cbd045028ba4a91073c80 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e71af53b01e242798127263524dbd935a297f9f6 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/05d43f7bbfdb66fa2eb278108e0b5589781a0047 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/b401476e5e1382ed872cfc77e8b0c34718bdf1f0 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cebe8c50629d9d40f24bbee5bfb13044f68b7c25 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/191f564994c82360a94e96a2a5e172e137a65eaa |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5c42c34e9449496cfd6bc1264cb792c3bfb2d68c |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/eb794bb28d67d43a10030c0d057726dac1926dc3 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

azure-iot-sdk-c-LTS_07_2020... | 1 
        host-sentry-cli-1.57.0 | 1 
               libtheora-1.1.1 | 1 
monkey-f54856ce250c4e257354... | 1 
                  ndisc6-1.0.4 | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/5f8db0b92087f694513fe6597ae10aac92e77e6c |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a8f611e5e3f3d3c5c85a9f910afc02e6041e1b93 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/acb1729465fe728b7c91852afda4edb808f8ea91 | ORPH
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1bd449648c1510f564a7f5f519e670fc222c6e19 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2b6a0d09d14b483754343990222dab8d6a896386 | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/41754f87d67b5747b5e1096ea3222b0a3512faeb |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                  zeromq-4.3.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4cd4f5f4d90c244872d844ea2aeb90f6b3fe28e3 |     


Gitlab CI results for 2022-01-31
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033214851  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215112  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215128  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215000  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215014  | ORPH 
      TestPythonPy2Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215088  | ORPH 
      TestPythonPy2Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215093  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215060  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215068  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215094  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215113  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/2033215115  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
