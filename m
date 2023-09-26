Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7F4E7D240
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 06:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B01460A5D;
	Tue, 26 Sep 2023 06:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B01460A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhyRoTqLBBsl; Tue, 26 Sep 2023 06:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7CFE60B5A;
	Tue, 26 Sep 2023 06:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7CFE60B5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11E651BF47D
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA45941E61
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA45941E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EAGK7tllGVVD for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 06:50:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E58C41E60
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 06:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E58C41E60
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1942B1C0009
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 06:50:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 06:50:40 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230926065047.EA45941E61@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1695711041; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wq55Chx3vyuAXB180Q/9muvgdZfl23NIK6GT43jLVqA=;
 b=O6Lv1Uz97irR5tolb+HZoEU0TKZCMmvflEAda179AYSE9eEQgRhvyAEkVazU/KrSaKwn9C
 36G7UY1utb+T3lmhhVS0bA/ERuxxSp44XDyov2dWa1jQxz7sZpU2VudfDbpoh7sIugru80
 1km9UBPGnXF1/a9f1MJGO1a2nCd++NfMNis3E13J1YN0tA4+u6vqkbxn1Mg9AkJYHFrlzp
 PAsKboI7dikmqJrkx1VudBSTvXren8lrs13EIvGR4AxS2nPCNtJttO+7zMrMuf5WtcTQh/
 JjdKbqV1FTW4s2RiMKXiaHjSjEJGomqRksSybnWaKduyT1xi7oCOct9v8nJ91A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O6Lv1Uz9
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-25
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

Autobuild statistics for 2023-09-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  | 10  |  0  | 16  |
  2023.05.x  | 10  |  6  |  0  | 16  |
  2023.08.x  | 11  |  7  |  0  | 18  |
    master   | 78  | 76  |  0  | 154 |

Classification of failures by reason for master
-----------------------------------------------

               alsa-lib-1.2.10 | 10
                       unknown | 6 
                host-go-1.21.1 | 5 
             alsa-utils-1.2.10 | 4 
                   bird-2.0.12 | 4 
glibc-2.37-2-g9f8513dc64119... | 4 
             stress-ng-0.15.07 | 4 
                elfutils-0.189 | 3 
              host-rust-1.71.1 | 3 
              libarchive-3.7.2 | 3 
               mariadb-10.11.4 | 3 
                    proj-8.1.1 | 3 
                    brltty-6.5 | 2 
  gobject-introspection-1.76.1 | 2 
                  linux-6.4.14 | 2 
                xenomai-3.0.10 | 2 
check-11970a7e112dfe243a2e6... | 1 
                  conmon-2.1.8 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
            host-erlang-26.0.2 | 1 
         host-gcc-final-12.3.0 | 1 
               lightning-2.2.2 | 1 
          lttng-modules-2.13.7 | 1 
mmc-utils-613495ecaca97a19f... | 1 
                    olsr-0.9.8 | 1 
                    php-8.2.10 | 1 
                    qemu-8.1.0 | 1 
                     squid-6.2 | 1 
                   systemd-254 | 1 
               tcf-agent-1.7.0 | 1 
               valgrind-3.21.0 | 1 
                 wolfssl-5.6.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/3ceec32f42947ce6807c83abaea54dadc8679198 |     
  aarch64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b148d1cd0bdb6cecff56d2f1407b53fde49e285e |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/6e3f23d6d774c332b7c797c046d1fd5480221ba1 |     
    or1k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/640fef2accaf666b9ddf6acd7f64937f8d0961b4 |     
microblazeel |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/f94a864a05146f2c5cb4c04bb66460cde48f4309 |     
    m68k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/d56e5afc96152ac9b3d08acaf85219637745f6f8 |     
    arm      |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/7359e18a3dd50b1e18cad260a50567018ec70f16 |     
    sh4a     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/bc09306a5f05b8939bad912fa02da0ed9a769aa6 |     
 microblaze  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/228d8be8b2437003df882eb672ef5bc73d8ff471 |     
 aarch64_be  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b1d7a5d9fd8ed6bd8bbf707c98638153c7b8a7f8 |     
   s390x     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/09faa170c4ab44c39de3450985c88b049f492ed2 |     
   x86_64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/94f72c01f462273d69138d629479055f0ddb443f |     
    arc      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/f85e9c502de1647c19fb00502703e1aa55386c4e |     
   mipsel    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/42ab6e4003cce672c3ed88cd090301f44d0c2e85 |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/eea3097ed8652f6c6597fc4ef9d9536cbb4df23a |     
    sh4      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/db3a45acd435bee5c44109db66e87ebf930f5e2e |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b8edde854848bf5050733d591b5ac653d652b157 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/54a984f41fd5c58fc14c5a722526ebf56c4fedd7 |     
 aarch64_be  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/964d3e46f79f7ae0d204dabed395b3759fab42ba |     
   mips64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/62383191117b33141cd516dce7b87bdb3517b40c |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/36de1229d6f2ad57fffcdc70e4c4883c10f28141 | ORPH
   mips64    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/2a4035bbf3139a3e50aeecb69a6068533cddfac2 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0e5255437a9fe10ff42fdad7284ff8b923c7ed49 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3f3c024c0e7a487d31792dcdb1dc5764a9a384c8 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3579a51bfc73fb12347112fd0d53a4cebdf7717f | ORPH
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/9d328fa4ec604ce80cdb6a80c8a0609ae692f4a4 |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/f9ad33c33a0d35f21dabe062792460b710b9ac5f |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/19207b530fd3106a07f6fb3d1964c07094c5918b |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/681291969190a3cfc08d409d916bec78b1499ddb |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/50fc667015f0a0c0f199cf9de92ac6bd2a8465fb |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7027ffb259239827592d1adbeb7e09fb0ddb2bd3 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ae1bdde15333b5dbc59bd3564b836e4a96483ccb | ORPH
    i686     |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/0e7ff49faf127491819d34a1c825b47d61794cd1 |     
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/99439a74049df0ca417b74a7ad9bc4b9df1cab2f |     
powerpc64le  |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/ec1a401349b1275657aadec3fd39fb62b33b5bfa |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/2162ce22c7f91b587bb04ae2d81f4331333a74da |     
   mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/69e40e223f5ae215da9bb73aa0e805c3aefe1833 |     
  sparc64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/212dcc59e2b91dbc286e551b63277bf2fa09cd97 |     
   mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/a931bc4814682b5bbcc9cc0c9998909f2e28dc5a |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/2de8422fd79ccb3813c4df16cab183253bc3f335 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/e9dbd56ad6a5aa6204219d8ccf897117bd2d7103 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ca5dbdeebdfd63844665b7d9d43b7e8debb2851f |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/167f1ac03cf48f008531e722ae008b10ce70399c |     
   mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a2b3243c0328977140c300d4fd9aea6ac57e05a1 |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/1cc40c078b6667e9e19ac11bf57a1909338f5cb7 |     
  mips64el   |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/105f3900c5aafa255d47177e6cfcf7d2426e8d62 |     
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/33fe90580a8e5a36b6918075775d34cb15cebd0e | ORPH
   arceb     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/d4ad93a6072bc719ebe9c963fdb75848d59e71bf | ORPH
 powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/72f59d2ae40f8de8780b8e81ab45ecb1d314f4f4 |     
microblazeel |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/900bcae312f1df0059a94fefacca8904739fc9b2 | ORPH
    or1k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/c6573324d4fbbb8ac4f7f3d4e8c3cbb6a0e3e180 | ORPH
    mips     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/349a18666b9366adeb8555918a64a70890c434aa | ORPH
   mipsel    | mmc-utils-613495ecaca97a19f... | NOK | http://autobuild.buildroot.net/results/a53922c5db3e605a5e81e53c034f45017ebb7db7 |     
   mips64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d80264776d3aea1b01034447b5a1c124531f1f00 | ORPH
    m68k     |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/ebe7fcc6e3962028d07d0b14e79d422ea847d6e2 |     
   s390x     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/06760e59b408645586664a1d11615818b1e20f41 |     
 microblaze  |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/e91f4bd62149b89ad3047320ea1d05efcc1c1d7d |     
    m68k     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/46b4651157762edd4615ef4508b85ca334bfc816 |     
    mips     |           qemu-8.1.0           | NOK | http://autobuild.buildroot.net/results/339ea98fe7ecbac8141649ae9736f0ae6c55ce49 |     
  aarch64    |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/efcd624169b07b9071ef3f696d2b44e87deea2a7 | ORPH
   mipsel    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/50704286cb67b9819131b82bcebdfeb5cd86cf88 |     
 powerpc64   |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/8223b862f25a3d0259f6780d09deac8ccce34666 |     
  aarch64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/248b83f2c584a6dc0218c1aefee85bb15b1fbed2 |     
microblazeel |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/69e9b186202dcc56262a71351df2660029019ebb |     
   mipsel    |          systemd-254           | NOK | http://autobuild.buildroot.net/results/6db08456e4769511b2482fae9abdf4d04109858f |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/b6878b92132113e27633f30ed687ac62fb9bde24 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/49d8e8aed43786a5814b2574574655ac6a255543 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/d3b48062f88afc327e4d81244fc874406964b6a3 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/04ecf6318e82517566272d89029711056b7aedfb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7966430f401b6d40b87d3bb1d941fff3946d0420 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/d121267e4b375cbe4f461a6f8921deeb76c6bc12 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a237709eff56a2137f0e8b170a7417c999dfdcc4 |     
   mips64    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/50b74189262cea892cc2ff055347b97442c80876 | ORPH
  mips64el   |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/ff2941823edf72532ff87d6319fdcdf4d701e459 |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cc42a69cf49fa53ef7af355d8acdd7664b4d043a |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/fbddd2377f909b1bf66bfa2ba5a03144b42f33fb |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 3 
              erlang-22.3.4.22 | 1 
  gobject-introspection-1.72.0 | 1 
              host-rust-1.67.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    olsr-0.9.8 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8ea3bb6e1f98d8896739223860b9f15277e5941f |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9ef04fa3709f234e59755ff4c8aff2f71218653f |     
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/052108fa2620b67d300938c1760f28111048e7e2 |     
  powerpc    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/145622f978f8719ec5c577495282920745edea81 |     
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/273bca0f419fec75a0b91a038599bf28db9e01a6 | ORPH
   mipsel    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/cfef05f7652dabddd355ec96557d7207981f9a29 |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/0cb4e9cd7cbe368ba19e0f761c769d65cb453ebd | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c98874e513891ec1f24121acf807e6ac1e492706 | ORPH
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/a5e4ff88303b3f7f03e5be89a667dec17b18458e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/13bdb92814bdead58fe76c8828bc04e705707bc4 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                   bird-2.0.12 | 2 
  gobject-introspection-1.74.0 | 1 
            host-binutils-2.37 | 1 
                    ola-0.10.9 | 1 
             stress-ng-0.15.07 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6a94ad7abd1040a189fd8dd1c71896006a83932a |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/a723d543809207dadab172205e9513145c7bd91e |     
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/d9b197679085a2399508c0e5dce9d4d4dde20e36 | ORPH
  riscv32    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/04eb1c37fe5f60d3cb70181fb2308948e9f599ee |     
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/97e2da4b6c89aaaef9dd2bc7152a8b48b3a9d1c2 |     
  aarch64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/375f92dff8efb9cc6da60f39e517d75b114ad206 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

glibc-2.37-2-g9f8513dc64119... | 1 
                  libsepol-3.5 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.4.14 | 1 
        ltp-testsuite-20230127 | 1 
ulog-0389d243352255f6182326... | 1 
           xtables-addons-3.22 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/add81369008b0a4192d9a3f097455cf72afe4027 |     
   armeb     |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/277202f78bc1a126f51997ac55aaa1e02bb0977f |     
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/5e5b0416a1dc288b7e49db417a09f2d83573167b | ORPH
   armeb     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/e2110fe35b83fdd302b93ceea1c2f79d0968ff62 | ORPH
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/57e919ed5e7d3df5cb6a7c2f6d7b0fd09aab6c1c |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/78fed4877833c9ae083ee24ec9187cddf81e9b08 |     
   arceb     |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/d6f605cbdf37c200a078d3bec19db3c2f9f2ffea | ORPH


Gitlab CI results for 2023-09-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841047  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841246  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841320  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841253  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841325  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841618  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/5157777865  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841719  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5157777775  | ORPH 
                 TestPigz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841963  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841975  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841980  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842410  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842194  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842234  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842258  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842316  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842416  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842456  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842477  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842497  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842522  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842575  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842732  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842839  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842957  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842969  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842979  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
