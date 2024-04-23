Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713CBC4345F
	for <buildroot@archiver.kernel.org>; Tue, 23 Apr 2024 03:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135E060726;
	Tue, 23 Apr 2024 03:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObI5WEJd4eaA; Tue, 23 Apr 2024 03:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9472E606EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9472E606EC;
	Tue, 23 Apr 2024 03:54:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4112C1BF2F8
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 03:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C825404F4
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 03:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ca1NUTgoBgkM for <buildroot@lists.busybox.net>;
 Tue, 23 Apr 2024 03:54:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8ECBE40311
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ECBE40311
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8ECBE40311
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 03:54:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FDDC40003
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 03:54:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 23 Apr 2024 03:54:39 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1713844480; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=or57/HYOsfsTdvVAFMoT3SHqg+3Q0upAUrZV6wSgV9A=;
 b=MJXkc2kfAM7Z6XXaApQ2CgzYyAQKm0vsXHA1jIJ3ycv7/ULZfx/a+Oqln0G59OzlQYre12
 SQMjnR4xiK2h2JHrEpDpHzwUbEJl9zg0YZ1WrmhGMYXlyMTjDUBXuFJEbWsRRRhpq0iu3L
 Yayio+Bq1ef36z9V9kA0JT5QfuK+oYoFpZhWyTsqAFE/CRJ4PFVGB0YGz+ES4rBKZeiLBW
 xphHJOnMs6W2CIaIR+WhafP8MnfM3UOb9T3K1yhn/I1zTjgcN8rsc/8dqGhGh/wTL4iVSC
 mdb6PauQKop9hi8AUS6jq81GB/sXJjaigQ+wFzr3ZSgjQM0TXRhTt/2uxJ5xpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MJXkc2kf
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-22
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
Message-ID: <20240423035439.ZngMum-r6G9B504XcYY_SHEWJNgb-E8kJSFd4dPx2iM@z>

Hello,

Autobuild statistics for 2024-04-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 13  |  5  |  0  | 18  |
    master   | 66  | 80  |  0  | 146 |

Classification of failures by reason for master
-----------------------------------------------

host-heimdal-f4faaeaba371ff... | 7 
                libressl-3.8.4 | 5 
  gobject-introspection-1.76.1 | 4 
              libopenssl-3.2.1 | 4 
                     mdadm-4.3 | 4 
check-11970a7e112dfe243a2e6... | 3 
                elfutils-0.189 | 3 
                fail2ban-1.0.2 | 3 
         host-libxcrypt-4.4.36 | 3 
                       unknown | 3 
               asterisk-20.5.2 | 2 
glibc-2.39-5-ge0910f1d3278f... | 2 
          libcamera-apps-1.2.1 | 2 
          linux-5.10.162-cip24 | 2 
                    ncmpc-0.49 | 2 
               apcupsd-3.14.14 | 1 
                    bat-0.24.0 | 1 
  binutils-arc-2023.09-release | 1 
           dmraid-1.0.0.rc16-3 | 1 
                     efivar-39 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.18 | 1 
            host-binutils-2.42 | 1 
         host-gcc-final-11.4.0 | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
              libarchive-3.7.2 | 1 
                  libbpf-1.1.0 | 1 
libdill-32d0e8b733416208e04... | 1 
            libnetconf2-2.1.28 | 1 
                   libnss-3.99 | 1 
                libpcap-1.10.4 | 1 
                librsvg-2.50.9 | 1 
                  libsepol-3.5 | 1 
                     lxc-5.0.3 | 1 
               mariadb-10.11.6 | 1 
          modem-manager-1.22.0 | 1 
              mosquitto-2.0.18 | 1 
                 openssh-9.7p1 | 1 
           python-numpy-1.25.0 | 1 
   python-pydantic-core-2.14.6 | 1 
         python-remi-2022.7.27 | 1 
         python-rpds-py-0.17.1 | 1 
python-unittest-xml-reporti... | 1 
             stress-ng-0.17.07 | 1 
                   trinity-1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/49b8f54f01d0f6e28826efb103dbf2be6f814ae1 |     
  riscv64    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/9ce983b4592929e8a89f088316f39d77d188411c |     
  riscv64    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/206977b7685fe4c1ab3f9906079c32c284b392a2 |     
    i586     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/6bfa42fb6cb7a50234c8e93697fe8c0787b65d84 |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/7f0e3b0a802897e101a8bacdc06130993bfc0296 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/002c4a4fa9fd3af91e9f9a9dc1e512881ea8a440 | ORPH
  aarch64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/03524af81d76535a82c9e4cc39d3e6b4ed6d50f6 | ORPH
   x86_64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d3a382d676bb554041219c8ca81cdcae9d19c89c | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/994c7aea80ac7b2ec69b291f87dc487e007e128e | ORPH
    i586     |           efivar-39            | NOK | http://autobuild.buildroot.net/results/0c5e72d3c1960ba3689efb7aca1ec3644144d19f |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7bfe6cf110a7abdb3ea8ea9a102d7e7ad629f6e9 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/62636fa4aa338576926a8460f77e86b706647f6a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5c1f10f2185dca3a21608c390e1f0bf7fa6b27db | ORPH
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0d883eac308cbab8519e004bb8933e185c8178ea |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/76528aa1c1e745ecf17f61df30d93e06cfdf9d39 |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/142342e0a9056172ddb532623b339735e7787d00 |     
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/cd333a818300dd46ac32a69076cb555c8acc1f6c | ORPH
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/50addfc1c8a67e3f9a01baf5a01637ebf33b0299 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/49c01a835c266eafdffe30e9cdced955beea21ec |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d4581e297a14327c4fb2886732a956fc7ba9bfa1 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4908fe1863b16284474a065a65d6f1f165c147d7 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/131be35b467bf3afb0e6bab77ef6faf5d0a9474e | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/96be05f845d9d736007f87896f33b21cdc69217e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/163dbf5fecc7f1d7dda288017e7df93eae3d5c83 | ORPH
   x86_64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/5674a48acd24b9be19963b1ffb72885899dd9c00 |     
microblazeel |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/adec0c65dd92cbd85470a8a22b5032690dc9cb7b |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8c3ed92cfedd32c4a6fb2cd40e2beaa68ed7b4c0 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2356283cc5ccbc0fb2de93fe15b9ffeb9c6dc3b2 | ORPH
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ba97556b3a790ada996696f8d0a77b145a744b43 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2cffefda5a0083faed06df50d496f7a7f7b89b3d | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/fc4f487afd5b73da0bd9f3c5a97e1312447061cc | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d4397821e02b37081b0ba61105478d5dd4ca2b93 | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4da7f8f62e568e6465976448616bba4f90a945f2 | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/2b6bbdd5659b1365fb9d6a113093cc13a5efb80d |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/3bbe2a8598a7a52bde80e81d745f60ebcef225a4 |     
    or1k     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/81792882a94ab5ed74ac253ae5f6f9a555f167e2 |     
  powerpc    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/0a70491c53155c2a8c84b13a35c7adb1e3c93f79 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/d425848d668cdf146377504ae2c802638592a739 |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/e8effa4ab92c8b6f7e0aa2c78c2cb804bb06d8ed |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/e82cd9b2bc16437f643d32d92afc50d957506e18 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/bf0c0bc4d7bdf21de0265c31dc3cec863db64267 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/55e0990d6302710256d622382ca452889e24eb3a |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/77a8abf06447da792d52d6a3f7abee3e43359c96 |     
 aarch64_be  |       libnetconf2-2.1.28       | NOK | http://autobuild.buildroot.net/results/82f6b432069d4d470815d1a124086ca0893058a4 |     
   x86_64    |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/3ca454eb0cdd40ddc3caba87d2df820553f864af |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/79309e51ab0971cc81c945cef1a2e2b1cd58e1ba | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/30dee24a4dfc5785e3def4af5ae31af47498a752 | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/104d9ffb902a04a5076e5c274dd46667ef74e41a | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/4928225e04d69effce870a735d0be6c995abee3a | ORPH
    m68k     |         libpcap-1.10.4         | NOK | http://autobuild.buildroot.net/results/bf7e292d86e73149d804ffa7a1782928c02aa3e4 |     
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9c1c41e7c0f907d50475ad2f36cd173eca73f09e | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4cd7674db4f2ff62945daf71e5ab10803e837dd3 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b9b168b263a31f5961e1e075b70b59505830924b | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/16604dd0c5a8af5ab031be17a4206e7dd80c41d8 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8c33e90579e463c2bdf729e0cb1fb0e40b1ed99c | ORPH
    arm      |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/4870fa2c36d727f40f7c426ff90df63088b7db17 |     
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/4c38fe89bd3d321f56864d795c169d257c1bea9e |     
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/19c171fa5e7efc59f68b3bb87cd65938f8fc3c13 | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b8835482bbbb0419f881cd9a05efccc4730085bc | ORPH
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/ed5ae1ae4e0d6570635090bb263d0d6b32453ad1 |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/038246e4804f2eaabfbbdc2ae72e38631e8a46c6 | ORPH
 aarch64_be  |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/cea7e0a20da8d857b01c5cd596152b5c69cfbb3e | ORPH
  riscv64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/9702a659f119185078a3a9b72f81aa5cce9ed554 | ORPH
   s390x     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/ba7c9ade31d848623ccacd3722ff3975800dbafc | ORPH
   armeb     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/703d8d7995ecd3a2e7dc25a206318b89837864a9 | ORPH
 aarch64_be  |      modem-manager-1.22.0      | NOK | http://autobuild.buildroot.net/results/3b78fd52cc5a6bf9cb1a938c3a39ba14852c437f |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.net/results/f1cf7aef7d67ed7bce907dacd463c39b41fc832f |     
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/a419cc22c209674e5044f2f8591fd06cc3cbacdc |     
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/26df57392037c3e5471b4ebe5dd83f7a0188c558 |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/e361f77e8b7fc682dd0cbfc3dbf63b685651bd76 | ORPH
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/7e49ccc4cb72c773b3bee632b3a2cb8a7f0cd6fd |     
    arm      |  python-pydantic-core-2.14.6   | NOK | http://autobuild.buildroot.net/results/ca4e8762d84a32785ab353a352a6b58828529698 |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/adf51b1a7979e5558ad86fb415508f5fd7a847e9 |     
    arm      |     python-rpds-py-0.17.1      | NOK | http://autobuild.buildroot.net/results/c97bdbb720455c13a9418c9d55c40e5049102570 |     
  sparc64    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/d8403eb62c9683b02cb941c5a16829d9e7676e66 |     
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/474135402baa3ceb165398e834d84fe9ebdad3d6 |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/18a6b0530a5cc068aaf6626ac660a17fe4818381 | ORPH
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/848c5ec82cb5f19a0dd76fa6f56529a25e039094 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/183c1030d857df840bbc6f8e355bc8db04cbaeca |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b059296ca1a7955a4ec8831dab016ca97d98e7a6 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    eza-0.16.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              libarchive-3.7.2 | 1 
                       unknown | 1 
                 wavemon-0.9.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           eza-0.16.0           | NOK | http://autobuild.buildroot.net/results/f2585e211dc59b7efbb05c60ca056a28f2c8cf88 |     
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/cedb8750e74467a8c08f3cf78abd17559be1d97c | ORPH
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/b41ddc4931067dcb8db980307e3778464ca5f058 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/014fd63caf447e0f6f427ff3b31cb63f1287ffcd |     
  riscv64    |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/6af9a37115cd46b900239480ce66c93ee0185ca1 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
