Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52D0C47071
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 06:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FDBE82158;
	Thu, 16 Nov 2023 06:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FDBE82158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tAsz9370EXE; Thu, 16 Nov 2023 06:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4555B8215A;
	Thu, 16 Nov 2023 06:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4555B8215A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC1661BF328
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 06:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D96941909
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 06:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D96941909
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ksd-TOy1hshc for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 06:47:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB59140468
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 06:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB59140468
Received: by mail.gandi.net (Postfix) with ESMTPSA id B814BFF805
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 06:47:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 16 Nov 2023 06:47:22 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231116064728.8D96941909@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700117242; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c7RGb0BD8bG68iF8MpSQN3WtQ8+1d6KNUffHVwdsekY=;
 b=EDh2VtPt2bQsOU4fg+TjoiIZ9tPnbbdRDN3KL+kJwylrY8A+x1Om7sco+JZdrppwJ5S+GT
 fjxOAYzYDV8uzhSd4RhZO7nU6y7iNJFZtTbwmvpKguBiEIl2K1DMH1mKuJEfvcbaOJ+30w
 FaC9LQfkDBbJw2hunmqk9uZZo+c2vQYXk0E8Gh4pXBplNzCZUYxVDse6Dz+5emsWx3oS9A
 91IBVPpFohs710GhjDF8mIzsAulyI6Apy6p4QqzdGJfWAVM2AgInUqIx1MHSER/FRhTxty
 gjDb+KJeKyLlicVpin05n9hP/Cu2ms3cWB4n1M3KEMqgF+P50nEBTlbiMwjb7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EDh2VtPt
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-15
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

Autobuild statistics for 2023-11-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  9  | 10  |  1  | 20  |
  2023.08.x  | 14  | 10  |  1  | 25  |
    master   | 32  | 42  |  1  | 75  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
                libressl-3.8.2 | 5 
                elfutils-0.189 | 3 
              host-rust-1.71.1 | 2 
          python-msgpack-1.0.7 | 2 
               apcupsd-3.14.14 | 1 
                   bird-2.0.12 | 1 
                  cc-tool-0.27 | 1 
           crucible-2023.04.12 | 1 
          cryptodev-linux-1.13 | 1 
               dbus-glib-0.112 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              e2fsprogs-1.47.0 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
        host-sentry-cli-2.20.3 | 1 
          libcamera-apps-1.3.0 | 1 
                libselinux-3.5 | 1 
 Makefile:727: target-finalize | 1 
               mariadb-10.11.4 | 1 
                   openrc-0.51 | 1 
           python-bcrypt-4.0.1 | 1 
    python-cryptography-39.0.2 | 1 
           python-numpy-1.25.0 | 1 
         python-rpds-py-0.12.0 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
               valgrind-3.22.0 | 1 
                 weston-12.0.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/82553464dfad97a33f01c8429f28b35b85b13d55 |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/255d3435aaf60416d7c64a9db34065bdb1613b64 |     
   x86_64    |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/b594d9fa24b4093416c309b197918c6dd2180628 |     
  mips64el   |      crucible-2023.04.12       | NOK | http://autobuild.buildroot.net/results/3d47ddf7e49752bd5aaf8825da33a328538e60e6 |     
    i686     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/25efb3d2a78521b3c73a0af24ece2ca27172b198 | ORPH
   sparc     |        dbus-glib-0.112         | NOK | http://autobuild.buildroot.net/results/a6f35858a138de9db80ea48d67e22d44b72a82f2 | ORPH
   sh4eb     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/c85193f453e6d4fe6e15e2b49fa6a76194b819cc | ORPH
    sh4a     |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/aa81d3b7792726f6d75757d5a3653c7bfd42a120 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5f1c377d44622ab5e1b710cb9c2f4b969886b037 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c3c1931b49767423830fc931151d4e396dd0b537 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1941da41e51b18c0fc262ba4bec9f3a34cf69533 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3df87b092d426c85f916b829cbed4a51aa1a7e33 |     
   sh4eb     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9053b5cf7359539deae57097ce50281b97b8c02a | ORPH
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a1f5112267120f33ccca266a7da6f79d77fefd65 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/d52db76d48192520db02548953fa9d4933a0d88b |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/0ffcdec24b35aea1091d04b65a12eb645ac6cb5c |     
 aarch64_be  |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/fa80921e76418d43d938f2930464b87451db077c |     
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c1a9ddbe250d49b58c0f61016fc65039e4baede4 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/be1104a507a48cc78c73f92412f4c68230f30fc1 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9788de4d7cf70c2e27907e4b1cc3e171119569e3 | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/db865834a551f9b9ae3e0497580520067886be1f | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/88ea760232d5c06bacbc5cd0aa85b3e7ff7f5c7f | ORPH
    sh4      |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/b8204ff7087aac9047f61506044c4d02dec0a2c6 |     
   nios2     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/cb70a2ac89973fe100a6b05f90fa090159aa2de0 |     
   x86_64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/98ca05673d26f93af6c9d0930a5169a97024ea29 | ORPH
   x86_64    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/1ae481b310a0b1b8489e6eddbe3be02a6c7b4c16 |     
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/d244dd6315c7cda0eedb095e2900600aed4db547 |     
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/bddc58ae65b7990492cd2a89a25fe8efa4f0ead4 |     
    i686     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/a3ca7ff0f41dd7b1496d1ba38913c2740f67f9a2 |     
   sh4eb     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/3dcf83f89d20f4df66ce361df0f7e575f5763a68 |     
   mipsel    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/855cf1903928be7b27e7d05bc1c1718823117b95 |     
    mips     |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/40c5b54c1d27d3b59e4187e6e6ef17ea99a661d4 |     
   mipsel    | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/5bc1040b3acd1fe9a9ee2af9d78d53e824c72626 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/7f06827b9066f198fb41050d7598b2b9d163f171 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/681b4ba5bb197be49286660b8e0cd339ad10d35e |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0e207bee0ff1f288ea1bcace6dbaacf2fa721d3d |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/80d94cbebbccbb611a2c3cb28ea78bdff11f7e3f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f8c87eb26796d8bd74ab18170cfc890117faa20c |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/1e9c5572c4de87002755cc31516bd676193ba445 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c41a29c0f1754d7ad3a193e75f956bfa9a4d55e7 |     
    mips     |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/2ca78ec1d74cf348e62b99d40796e3db526ef814 | ORPH
 microblaze  |         weston-12.0.1          | NOK | http://autobuild.buildroot.net/results/08c54c40d7c07c9c465ff96358c1b52fb7a08dd3 |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8d68acc56c03f015831608361e34496dc933a388 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
                elfutils-0.186 | 1 
       freeradius-server-3.2.3 | 1 
glibc-2.36-118-g22955ad8518... | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
               host-go-1.20.11 | 1 
              host-rust-1.67.1 | 1 
                    parted-3.5 | 1 
       python-stack-data-0.6.2 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/db62e0b1d03fc312e33c7d7ed6a10e0664947763 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/112f574452c10fdd5853be6209b521b3bb750308 | ORPH
   nios2     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/4239b0c0752324551468e0ca45e6a0ed5dec8032 |     
    arc      | glibc-2.36-118-g22955ad8518... | NOK | http://autobuild.buildroot.net/results/8bb756b8d04f253e6978737ff4bd3f9d3ff98403 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9902eee25788e68cf4cd8356153a1bfb7638a4c7 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/eb7fc15f429601fe8461ace7f44808dbdcc3b8cb |     
   x86_64    |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/15b84f20d14deba6253be18980d64d2119a952ad |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/fa88516c03c7daee9fcae9d0d3f654b50e0ea2c8 |     
    arm      |           parted-3.5           | NOK | http://autobuild.buildroot.net/results/438b5f40e8b393801f36c691d239e298998cb9d2 |     
   x86_64    |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/92699193533d4e9d31dce7eeee945985e74e5a0f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b5d1423d58e0832b614266eae9331e230f340c60 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 1 
             dahdi-linux-3.2.0 | 1 
                elfutils-0.189 | 1 
         gobject-introspection | 1 
              host-rust-1.71.1 | 1 
              libcamera-v0.0.5 | 1 
               libglib2-2.76.1 | 1 
                  libnfc-1.8.0 | 1 
            luaossl-20220711-0 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/5d91f96b3cfd31e632c29d18fadf66691b52edd4 |     
    mips     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/7254635ab426df31edb3da37af9bba7f620a3c3b |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ab8f24ae28096847d1204b03d206df68367a9600 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c8f77ab2635b5425a34bf3d7d25c0db74b75aa00 |     
 powerpc64   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f3ac5826157fae76ce1ed3f185d08c4ab796baff |     
    or1k     |        libcamera-v0.0.5        | NOK | http://autobuild.buildroot.net/results/d2e782900b48f5076cad39c7ca9194d532e08da8 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a10e410a9c629f44833564cc80c9c2bc4007217f |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/0646a88f84092c2370709e7a64699233f8fb9e6a |     
   x86_64    |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/7e1099773ff96e0bd343c8a081cae13ff3c0e212 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d19fbaf36ec8c693aaebf6e9f71a3178dc361bda |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ffd4c0725fdda134907b1e8b3126d08d7b6f5e2d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
