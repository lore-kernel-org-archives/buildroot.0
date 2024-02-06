Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85242C48286
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 06:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AED2400CE;
	Tue,  6 Feb 2024 06:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AED2400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JbT2TCqE1eO; Tue,  6 Feb 2024 06:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0174402DC;
	Tue,  6 Feb 2024 06:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0174402DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28F3F1BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 06:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15C0481D7D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 06:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUsc9ToQwjwq for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 06:55:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CCAE81D73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CCAE81D73
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CCAE81D73
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 06:55:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAE78E0005
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 06:55:11 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 06 Feb 2024 06:55:11 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1707202511; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hYuSL/FuPYXz1yMV7y/SuoyTTpP9F/ybsSN6vsm4aLU=;
 b=pMEQRcb3DZA9hXnA4FUUBUrCS+verj2g7PZ8/cIPvphkd/+JPHelq6+HwSEt9tK+puNNvZ
 7K6ibgMkqaxddFKdgjD4zrUQYSxzJ0S9O3w7hQUrbzxGEJ7zn4UR5a8ID+buNymb5dSHkE
 6cIZcPNI+ha4ycZOxI2VXtNOL/R112DJB3L6IHftjvaRLJjGY6kn+UPP1da69bmGea6IC+
 3z17pvwKxdUs33zV8shpqp3fkhwzwszGDb7fZ8xPMJlGXc5Ei0i++g9fHT81ebibrKkeBV
 xzfsg/ZEs6uWgdX4UvyQaku08bGaPty2ttRF7ElVmgorDn+cZPbkARpl4pxPUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pMEQRcb3
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-02-05
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
Message-Id: <20240206065522.2AED2400CE@smtp2.osuosl.org>

Hello,

Autobuild statistics for 2024-02-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  3  |  0  |  8  |
  2023.11.x  |  0  |  5  |  0  |  5  |
    master   | 45  | 44  |  0  | 89  |

Classification of failures by reason for master
-----------------------------------------------

               libpthsem-2.0.8 | 5 
                       unknown | 5 
        host-sentry-cli-2.20.3 | 3 
                    attr-2.5.2 | 2 
glibc-2.38-44-gd37c2b20a478... | 2 
  gobject-introspection-1.76.1 | 2 
                   libnss-3.97 | 2 
                libressl-3.8.2 | 2 
                  linux-6.6.15 | 2 
 Makefile:727: target-finalize | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
                elfutils-0.189 | 1 
                    eza-0.16.0 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
              host-rust-1.74.1 | 1 
      libabseil-cpp-20230802.1 | 1 
              libarchive-3.7.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.0 | 1 
                   linux-tools | 1 
                memtest86-6.20 | 1 
                 openssh-9.6p1 | 1 
                   rsync-3.2.7 | 1 
                  stunnel-5.71 | 1 
             util-linux-2.39.2 | 1 
           v4l2loopback-0.12.7 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/dff81bf3ca25bd0fab6085ad6f1bd19d3f8db2ce |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/a381bb39e8422bb8ddf118a576ea2c705844637f |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/44890d6ee506c7428f7a1898a0f73222efc5b426 |     
    m68k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7c863e736ad4896f26dcc895c8ffba3e95e360ae | ORPH
   armeb     |           eza-0.16.0           | NOK | http://autobuild.buildroot.net/results/b61bda2df58ef0a866f747d8a05e49986d043aa4 |     
 powerpc64   | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/386e725437b9d4bf4000cd8aafae9080dfe8bc8d |     
  powerpc    | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/54f1a4303530f18a140577e575c7084a20468aef |     
  riscv64    | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/d9c6a4db7fd02c45cebb5a9687b636cd0fc99a0c |     
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/51289ee681e3971e65dd24eaa8c025fbc2888529 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c253a6bce2ee6afad5c36bf84d0d00a4714d024c | ORPH
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/4613ff68965114990566a923c306682bd8c80a82 |     
  riscv64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/fc1f5f93d2425d923e2fce51eda6bd11886485b5 |     
  riscv32    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/5db3fcc34cb47d0d948aadbf37f6449ed34e918c |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/9709362a679a1a8b302eb51bebec363a62fabe25 |     
  mips64el   |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/e2a44832f3965e4586de399672827e35524ebc0f |     
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/bb88b8c73112af3383625b3cc06134e3eaeaf41e |     
  mips64el   |          libnss-3.97           | NOK | http://autobuild.buildroot.net/results/2dd0dfb535c8fe9079be4c9e743e342344c89e9a |     
powerpc64le  |          libnss-3.97           | NOK | http://autobuild.buildroot.net/results/765a13e3d9377a8042415b0e83b5fe22eda84e8a |     
    arc      |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/34e7ce3144b9aa253440e5621fce14990e266afc |     
    arm      |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/9c7d636d3532805ef14d6cfb7fa62900c065ab60 |     
  aarch64    |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/ed9e1a47a668cdeec71a40f13cbb37dbf608d0ce |     
    or1k     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/17794a49cdb4748f6282a1b8602e323a7b18d296 |     
 microblaze  |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/ef75e960a3cbccb38c14631762937e183f4827b3 |     
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c18ec22b16d7ce0857d228ae8dc51c876ce0e928 | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/aeb55fceceeb5938db68411be446e9c462c78bcd | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/9d9471934f55f45cbd5d6658a73e7cb33e247b14 | ORPH
   mips64    |          linux-6.6.15          | NOK | http://autobuild.buildroot.net/results/49f8d5e73465cec539c067382c515be73656816b | ORPH
    sh4a     |          linux-6.6.15          | NOK | http://autobuild.buildroot.net/results/797a0bde20d4a257ffdc66c38577fc139a6e5bea | ORPH
  mips64el   |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/f07360f33010a2cf19aace266faae14a834bd9a4 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/80abb2e78ad63e28b5717ec4a54aa3fbc2b2251a | ORPH
   armeb     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/668800cc90bcd69aca63a20ca19ddbe53c8571ec |     
   mips64    | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/de0be520e60019becd07523f08448a66070a9f7e |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/5a37403206d1af3317c05ee63d92d4fa0488c53c |     
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/75e39ca694f09e5ef8bc7f31bf63dff7f0876816 | ORPH
microblazeel |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/b8589e42e14dbf54809284d577593896cf99fa69 |     
 aarch64_be  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/5d6fcf716f41ab0b7ad465ed7ed2a7e5465bbefd |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/addebf4d3d3f837f03ee80ea8161a75da9a703e4 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/a385e8d7f3441b3867105a75dccd49c8ccc47386 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/7f398fbfe488d8701ca3a04c02d704a72771d5cd |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/1cc45b9e1516a1ab08120765f6b2a304e9c18208 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/098c036f661b1793df31c0bdc7420252eb1bfdf6 |     
    sh4      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/1b214c4c2bd524ac2a47b80da2e0252c628be6d0 | ORPH
   mips64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/af5adb61ea068c3be571c34f49ef8d493a3f99ed |     
  powerpc    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/1a2562d8d8a31312b3e2d84ba3e7ec21b05315a7 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  linux-6.1.72 | 1 
              mosquitto-2.0.18 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          linux-6.1.72          | NOK | http://autobuild.buildroot.net/results/bbea1197de634560cdce29ef3277724bf3253443 | ORPH
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.net/results/ac2575c5aba9531acb6bcd08753237d0f7d1bbe3 |     
   arceb     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/b7b62e544182f31a8de1ccb3850a23497b69d17d | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

              e2fsprogs-1.47.0 | 1 
  gobject-introspection-1.76.1 | 1 
                libressl-3.8.2 | 1 
                  spice-0.15.0 | 1 
                       unknown | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/45f21ce9dbeec86eae8df45022b4fb408c1ada88 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d5c69580e4948da4145de172c4357b9859e605e8 | ORPH
    arm      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/44faea13cdcfe54f6ec2b49aa49cd778a2b8f059 | ORPH
   x86_64    |          spice-0.15.0          | NOK | http://autobuild.buildroot.net/results/c1ab7fbc5c62671238a07ef91feccea573008329 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/0bbbb0e8264369cd552b58a6941c63bfaf72ecc0 |     


Gitlab CI results for 2024-02-05
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093853966  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093853979  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854009  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854017  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854027  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854034  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854423  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854455  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093853712  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854785  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854810  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854842  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854855  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854998  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6093855074  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
