Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416C5C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 06:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E2F61381;
	Wed,  7 Feb 2024 06:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TmTD1ZUo6m9B; Wed,  7 Feb 2024 06:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C327F6136F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C327F6136F;
	Wed,  7 Feb 2024 06:47:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6280B1BF32D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 06:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 419A442162
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 06:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7YRhxr64obd for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 06:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 174394214C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 174394214C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 174394214C
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 06:47:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 378781C0006
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 06:47:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 07 Feb 2024 06:47:19 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1707288439; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L4NQtZRluqEJGiw2tNR4orFL/pw3SxtVdF1KbEiCl2Y=;
 b=ITLmaR+DQD3xKhX6QFKYOs2FI4LUsFS6Cwo44AgDbr6Sj/pbGcwX7flAlyVG9nBNhHjY0G
 U7ZcjG6TsKE5b3YTUtNwlxStwx8HvXZn2t7/z4sGPzSB7G4BUyZ7YPjUMpzRlR4lReC1fQ
 5XITc1qPW61S1jPdmFGUrb3rD9aaWVyvmz2k2asr7qx72Ox07ELsCWzQnd5QItAUpqZOm9
 6E+WlppXme86bF/PMSm1Xqn0gOukN7KaBlK/gc7UB6ZZNPJqW0PjESZMZctS+lbi1M8adu
 /sIKzJk1h5ImZqANUpeEp867J9T6L6UVaKRc2H4rtm7Nxi7+4fKqQUuUeRz76Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ITLmaR+D
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-02-06
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
Message-ID: <20240207064719.laT-W1ciQ1yxQwz2NX9Vd5_aaj1ol-KXDJAuVeWHvqQ@z>

Hello,

Autobuild statistics for 2024-02-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  6  |  0  |  7  |
  2023.11.x  |  7  |  4  |  0  | 11  |
    master   | 38  | 57  |  0  | 95  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 6 
                  prboom-2.5.0 | 6 
               libpthsem-2.0.8 | 5 
            host-erlang-26.0.2 | 3 
host-heimdal-f4faaeaba371ff... | 3 
              libopenssl-3.2.0 | 3 
                  linux-6.6.15 | 3 
                  stunnel-5.71 | 3 
                       unknown | 3 
                    attr-2.5.2 | 2 
  gobject-introspection-1.76.1 | 2 
                 openssh-9.6p1 | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
                 coreutils-9.3 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
                    eza-0.16.0 | 1 
                     frr-8.5.4 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
              host-rust-1.74.1 | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.2 | 1 
                 libp11-0.4.12 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                memtest86-6.20 | 1 
   openvmtools-11.3.5-18557794 | 1 
             strongswan-5.9.13 | 1 
                 sudo-1.9.15p5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/4238e6e079fe419d6d3c3a380077168f93ccc565 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/abfb6cbe4ad1fe7884427737324b8f803bacbbfc |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/05e5d98ee545db0126a74e61ad4bab8905766fa3 |     
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9f4c318f695c5c49f02a419e43cdce799c87e76f | ORPH
  mips64el   |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/82749d726687bd86c86f8e8381068a4ef5a67059 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8966b479902f42a449a3a4154e751d6f07e96152 | ORPH
   armeb     |           eza-0.16.0           | NOK | http://autobuild.buildroot.net/results/9f09e9351ba9b18a3cbbadebb42eb6982c8ebb32 |     
   arceb     |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/8980db502421b3e3830bdbb54bb93883d467f2c2 |     
microblazeel | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/cf4e5b2aaccc54c3538c491765f0b015bc5159d9 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d9d1e477d1c01a42ba0041e2fd5f9316a044271a | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d8f01f0ddd2d5c1f5f263d7fd4b7502953570886 | ORPH
    i686     |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/fccf20aae3f7d0d29defe0073fdd7c36a594d087 |     
    arm      |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/0a901a05401cf5ca525c8a093390ecf16cff2d4e |     
    arm      |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/e431a680aad0eacc77d8dfd53c2d47e4d76d4f0a |     
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/63265677734dd9d9318da01864ac14c8f10fa1bb | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/175fb65f0151866cd2d83c91c23b453d8c4489f7 | ORPH
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c644c218aa1173ad00bd0fa85ef90db5cbeef543 | ORPH
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/d4022ba7480aca5173f3cc4f74cbfdc619e13bb6 |     
   armeb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b27bd257fba655a767322cf53943644d636b587a |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/cdc08582a7eed6e2c8595aff12ae165e9c835dc1 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/dfdb7c1892f7ee7889496d28957a7a61b19571aa | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/2b931bb75dc27f7ecc70e49f9200b1358aa8faba | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/e52d6f890180ca189b07577de883584bcdbe0f8f | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/389ed112f082a4917f777f3e236211059c4c6d6e | ORPH
   mips64    |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/61f8fa01cea96a5741e7742e2642c9c7d3a8205a |     
   arceb     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/b339bce76f457ae410d0bda41df9e43834cc4be4 |     
 aarch64_be  |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/18a46c290f4e1d56e75935d4758b26cf015890ca |     
   arceb     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/c2cb591e3f52d0bc9761939a922c0241e2c06f57 |     
   nios2     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/6d9f85ba9ba3baa2c1fc09672be3272af109b715 |     
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5aa4e4fe7b6edbbb305e8af5f4d78b4eea6991b2 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5d9e9502dc76357aaae2bdb5caf21ac65ee31368 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/687c1b945911259ab09f2720abd425e1526deef6 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/928e96eef2930fd6f60afee0907f971608b61aa6 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/96e8ab7061d70971b0ab4023100532b0b420aee2 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/d11d4190d2c242240dcba870ce243c6108d53ef6 | ORPH
   sh4eb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/840ea58e5a68ccd571cdf70ae56d18aa1e6bae4a | ORPH
    sh4a     |          linux-6.6.15          | NOK | http://autobuild.buildroot.net/results/138accf6123d92d9b90b7c7648f4dd41d601cea0 | ORPH
   nios2     |          linux-6.6.15          | NOK | http://autobuild.buildroot.net/results/de547d66c32293abe87a9ed21c4d5bb4bac9e8da | ORPH
  sparc64    |          linux-6.6.15          | NOK | http://autobuild.buildroot.net/results/403156920015806119096b8c45c833c7512a4c11 | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/aedc886e12eca0a995f3755da1d4197c2aa56a47 |     
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/c8019d1930b3bbdda52b1365e896cb8faf965923 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/6127d174c7e259c08d73f743b9050d3fa0e347e1 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/44cca7d0f5faf0c389be11b15f7baf370ef3acb9 |     
 powerpc64   |          prboom-2.5.0          | NOK | http://autobuild.buildroot.net/results/bf979078b19d05e9a705e98d4d3d081d00795ecb | ORPH
    or1k     |          prboom-2.5.0          | NOK | http://autobuild.buildroot.net/results/c78ec1714fcef43cc17a0295f1d55c9c41563529 | ORPH
 aarch64_be  |          prboom-2.5.0          | NOK | http://autobuild.buildroot.net/results/42818e9d6c672a4b844ce5264cffb2262a9f28a8 | ORPH
   mips64    |          prboom-2.5.0          | NOK | http://autobuild.buildroot.net/results/8a34fe357c4726f658595e445b2678fb27dff0a3 | ORPH
    m68k     |          prboom-2.5.0          | NOK | http://autobuild.buildroot.net/results/5e3d74505002dba176ddcaceab7097b88428aa66 | ORPH
  sparc64    |          prboom-2.5.0          | NOK | http://autobuild.buildroot.net/results/56aa83036ad0de6cd0be2faaf0a16184ec5d66d2 | ORPH
 powerpc64   |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/1cef4d5e1631b0841a5a6218039bff8458c2906a |     
   armeb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/7e3439e298744c1d96855d8777491246938d7011 |     
    mips     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/5b8337a4061ee1ac17ebe3114066f4558bfa5b00 |     
    arc      |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/a3ae9b8cb4f40abe3d7d561bc1eb75b1daf94593 |     
    mips     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/9c0ff3bf8620a36bb4d6dabe14b5a94a376791e8 | ORPH
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b3ec10f6a50a63ed0bd1adce2fe6ad34581a5395 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/055ccc7ab71823fefbfa8430b58c88ad3510ebd9 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7cb470fe00b1eb3a49dab028a2ac85a99cb76765 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               acpica-20220331 | 1 
             fontconfig-2.13.1 | 1 
         host-gcc-final-11.4.0 | 1 
                  libsepol-3.3 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/ae4acb746bad649ef14258d00d36b6a250722ce1 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2ce1ae6df4645d1da9de48469c3f7003cb47429c | ORPH
microblazeel |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/3866fe052e878aba04e19d8920559a059fd8b773 |     
   mips64    |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/f0414712a59cc3ebbd2f20fe49279e0fe96995d8 |     
    arm      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7ddeb9a4b5175dd2bcdeb021bbd82f9dcd99919c | ORPH
   mipsel    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/7fdb119beeb8f2c29300fcb14fbf5c324ddacf80 | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

              host-rust-1.71.1 | 2 
            freeswitch-1.10.11 | 1 
      libabseil-cpp-20220623.1 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/aea32de0be0cb5de38d8871bd575dd0bda096920 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c80e3934bd6ac5b599a7e2c84fd8ea5431e55204 |     
  powerpc    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/457a86557af5db3320e0c4ce1b9ea6af7c4fe63c |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/6211b5584518655fa3ee2b7c80c4a4a128670c22 |     


Gitlab CI results for 2024-02-06
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
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/6104227183  | ORPH 
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
