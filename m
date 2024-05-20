Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7963CC04FFE
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 04:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A04460725;
	Mon, 20 May 2024 04:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdfzkFeA4NBV; Mon, 20 May 2024 04:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEEFA606C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEEFA606C0;
	Mon, 20 May 2024 04:07:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5C7B1BF429
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 04:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8100240907
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 04:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-s5P0965M2a for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 04:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39FF240151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39FF240151
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39FF240151
 for <buildroot@buildroot.org>; Mon, 20 May 2024 04:07:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F4CFE0012
 for <buildroot@buildroot.org>; Mon, 20 May 2024 04:06:57 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 04:06:57 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716178017; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4AA1noW4XfVI6HxYD3W4yePae+CdVTGhv6eQHp0FAzo=;
 b=WuCBS/RNqQNYW+dwZd/cPep5346EAiSe/wJatofd95R/cHeWodB09G+zFuFK+J/8LRIHlx
 bTjB40q9cp1Tm8RLVt0pvBxMpB9M5DcynMbyXfliL00mqJVU9UZMAbYFMRqCAg7XSSic71
 hfA7h6Qmu55z+4gxYZ5+0QiIsrWkvRcU9FpkWIXlJZwcXmulC0wsMSyHpG0OOPUWo19s/9
 8+MKG0HWyBVXvbngrHiTbih3fbSL8p6/eWY53nlXB5fMenZXrGirbapnMj7O1zcVkf3OTM
 qDbYuuM5qOa6oCRatckOc0wrCxFJKRa1vc5ep1ctO4EGsd+hKzyFIxFPIL6o8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WuCBS/RN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-19
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
Message-ID: <20240520040657.FTyo6QYP5XplybkJtmQozvSofigl8HKvnz1_vHyvZzk@z>

Hello,

Autobuild statistics for 2024-05-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  | 11  |  0  | 16  |
    master   | 32  | 66  |  0  | 98  |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 4 
              libopenssl-3.3.0 | 4 
                       unknown | 4 
                     bc-1.07.1 | 2 
                   bird-2.0.12 | 2 
                  ffmpeg-6.1.1 | 2 
          libcamera-apps-1.2.1 | 2 
                  libffi-3.4.6 | 2 
                libressl-3.8.4 | 2 
     linux-5.10.162-cip24-rt10 | 2 
           mediastreamer-4.4.8 | 2 
                  assimp-5.3.1 | 1 
                   atftp-0.8.0 | 1 
                   bzip2-1.0.8 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
           crucible-2023.11.02 | 1 
                     crun-1.12 | 1 
         docker-compose-2.27.0 | 1 
                fail2ban-1.0.2 | 1 
                   flann-1.9.2 | 1 
                flannel-0.25.1 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                 gnuplot-6.0.0 | 1 
            host-binutils-2.42 | 1 
             host-delve-1.22.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.74.1 | 1 
ivi-homescreen-5ab78a19e95c... | 1 
                 libgee-0.20.6 | 1 
                libglvnd-1.4.0 | 1 
            libmemcached-1.1.4 | 1 
              libtracefs-1.8.0 | 1 
           libzenoh-c-0.11.0.2 | 1 
               lighttpd-1.4.76 | 1 
               mariadb-10.11.6 | 1 
                    ncmpc-0.49 | 1 
                 openal-1.22.0 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                    proj-9.3.0 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
                    qemu-9.0.0 | 1 
                    ruby-3.3.0 | 1 
             sofia-sip-1.13.17 | 1 
                 uclibc-1.0.48 | 1 
                ustreamer-6.11 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/189c0c8524a8037c9685c483376550d5f3bd620f | ORPH
  mips64el   |          atftp-0.8.0           | NOK | http://autobuild.buildroot.net/results/a87bb3c713eb0c8049aaa7a8b660f3de8cb416c7 | ORPH
  sparc64    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/81576ad3b451fdc38057c09c58027735f9c05b47 | ORPH
powerpc64le  |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/388024866c00dc72b4d52f458861915fbd49a338 | ORPH
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/751739b116f16e095c224d12eddf26dd7f945203 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/ac7de8554067edb9f95e38f8b25288c7b3be7ea2 |     
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/2e37d4e0bcef515fe9e643737419bfd26aa2833e | ORPH
   mipsel    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/773a3b87bbacaff72db5af1da9320335eddf6f53 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/23714457e039d5f7ca2a81d88d444b483264bcca | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/e2f33c431dcff01971b04549317c003a5b048b9f |     
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/ae17aa96fccd3d01d12e6617b9a215ef4942c660 |     
    arm      |     docker-compose-2.27.0      | NOK | http://autobuild.buildroot.net/results/74dfe9baebed202d4286568966e971c2252e884a |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/259d5844ed5df673c30308f3a37ab622c529d8a6 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3aef9641f3b22d86ec7abada52310dad6638a256 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ea3df7c25b68898f7df4f79ed2253c12b360e942 |     
    or1k     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/a1b2ae29515cde5bdb3648473fa60b10f7360352 |     
  riscv64    |         flannel-0.25.1         | NOK | http://autobuild.buildroot.net/results/d2be77d8b9236db45c4f3a558f3198f199c0c568 |     
   xtensa    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/5a8c8b40109e0b76ecc60b92df950fdcc595985c | ORPH
    sh4a     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/2a4100d899e88bc243084ef20530785be40e695c |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/7889a834f711efdf18f9c99edec6121d7f23ba99 |     
   sparc     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/74ba6fa85d764ea4462a3daa7814f011e0e2d7c3 |     
    arm      |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/a6e3ca75788f8c41c240c240825c64f16e96b57a |     
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/693231cbbb3cbe4238fb5e12ec4e55e9774ee4b3 | ORPH
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/5af1635497d22dac2928a0a12558961b90487f82 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3a4e36de7ecddaab43e2c1d7f0d94fedbfc82a37 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a2fb0e63431e5ce316e07524542cc81504687b28 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e81b3e453e70e8b9eaa5a51ae2d74984754f6006 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f475220638b4895bc11153e90ad46e5116158eaf |     
    arm      | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/a5e88d5a4264a6165be31a99f1c123af53fa382e |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/95fa11d015006c75788dff49abe8ea5bcaa0668a |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/fddb305ca9d27229a01848ce04d94f90d8a8ed43 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/8fa435c44236392a1df319aa8075da956f354a69 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/16d4927e8a5c4f500185904490c40af2197f8af8 |     
  sparc64    |         libgee-0.20.6          | NOK | http://autobuild.buildroot.net/results/88ee2ed01d9192e19e785756d33a2cbb1e67c8b3 |     
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/0de074a5c2c4d862b99f2a1d64134e8de8699813 | ORPH
    arc      |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/b78236e42838c0c27bceb41eb776462ad3b05913 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/864c02a08e2a46d714362a26c8f12d718e7495fd | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/c32fe748de1b1a60ae37f1c6405267deefc8ebfb | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/e2416b20b2fa32e5a26262435d694b1de1687a31 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/29449ea811c36749dcd5ac8fddf93d2f62a873d4 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/506dfaed217d4cd3ffb945f4597f37b9d50d6909 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fe7c95794887519e29abc26e439b70108a363e37 | ORPH
   armeb     |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/7dc324cfccd7f00909c0de3af46ce5607a57c140 |     
  powerpc    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/79e6a18344870ea34380f3a298fb21bb3152a3ca |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/c5ae018330cdff098bcaa69880eaaca026fd4c2c | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ba2076edb927dec73e27d1c32b6298e9f5ba7048 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/14074e221208430bbd8c905542889d27e4007d8f | ORPH
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/fb66903e859d98254e7ceda8b2e1f88466261f83 | ORPH
   x86_64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/8c64b8090cb0302e141bfa14d76cb41b2943557e | ORPH
  mips64el   |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/311eb2564941ad31f0a666fb3caeb6b97b59ddb1 | ORPH
   s390x     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/fdfd1c4b46cfef98916eeffa0c081ee5ec7b0f01 |     
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/0f03a689b0687fad4c56a30cb022a7129f8d6340 | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/c3ebd6af693a4b878110eada412abc8c4d54fd20 |     
    sh4      |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/c0560af235ccbc60ce67e0f988e01c795d12e0c1 |     
    arm      |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/36ae88bfb04673b4605e67fb081976246fbbdc28 |     
    arc      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/8b8e00cef638e13808c94f094bec9f670e1a6c6a |     
    i686     |           qemu-9.0.0           | NOK | http://autobuild.buildroot.net/results/b00b5b632117d5396f3c38c75733f513372b038d |     
   arceb     |           ruby-3.3.0           | NOK | http://autobuild.buildroot.net/results/bd8238362ae93bc80b574ad7853dff8aabe23fe1 |     
   xtensa    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/fe0dba8ed64cf2abf5332355d201d212a47b35b1 |     
    sh4      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/6cd3ca549f3aa3c2ef60c4ad2dddf037d9f6b99b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/fe67c4e32e01cc1e622664ef431b8e66f4c13f3e |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e6dc48a16ff50841d2a00903bc922f2d60bbc08e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/de36fc3aa72f98b6b14b8398d5f6caf2f66c8bd8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/1859797c63b081c13fe4cfdea21628cf7adea316 |     
  powerpc    |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/a4c10bf40aae0689f69f8cbb1bf90bac34b2e597 |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/5e5ea288e3af671824329cf124bfbafb68b0ab0c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                       unknown | 3 
           dmraid-1.0.0.rc16-3 | 1 
                     frr-8.5.4 | 1 
                  gnupg2-2.4.5 | 1 
                host-go-1.21.9 | 1 
          libcamera-apps-1.2.1 | 1 
              libopenssl-3.2.1 | 1 
               mariadb-10.11.6 | 1 
                mongodb-4.2.18 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/a80270ff190f1dc9b8bc57ee7dacf1a38dae15ca | ORPH
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/a6b8a40b9557b1a682792f18395f7cb36fb8d924 |     
    arm      |          gnupg2-2.4.5          | NOK | http://autobuild.buildroot.net/results/75592787b54a51e467e5f85595223fefca98e5f8 |     
  mips64el   |         host-go-1.21.9         | NOK | http://autobuild.buildroot.net/results/b1356ea976f108d77269fcbc2a2db1e3d1b4c594 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d735990a5184ef3da2bfcfcc4dca54be40fdab52 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/73b2142233e2da7e6655f37ca58dd3694605f726 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/ea3efde0178ef5c3b8ae29b4f65b889cab1c3f88 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/44b80747b310baf52d62da7823170dbadf776d95 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/eed91c874f0554567a4ce3116b7027e0a593533e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/96d38b46b11cd839840a48d7346e48d95a5ece79 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f558768f943d65857670b7af68fba087bff6a48e |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.0        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20240321     | 20240322     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.10       | 1.1.11       |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 46.0         |     
                       aespipe |  DISTRO  | https://release-monitoring.org/project/21320 | 2.4g         | 2.4h         | ORPH
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2024.1       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 14.0.0_r45   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.1         |     
                           apr |  DISTRO  | https://release-monitoring.org/project/00095 | 1.7.2        | 1.7.4        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 12.8.3       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.3.1        | 5.4.1        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 20.7.0       | 21.3.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.50.0       | 2.52.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/00135 | 2.9.0        | 2.10.0       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.1.2        | 4.0.1        |     
                       avocado |  DISTRO  | https://release-monitoring.org/project/13385 | 98.0         | 105.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 7.2          | 7.3          |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_08_2023  | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.13.1       | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/07137 | 2.0.4        | 2.0.6        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.43     |     
               bash-completion |  DISTRO  | https://release-monitoring.org/project/05667 | 2.11         | 2.14.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2023.1       | 2024.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2023.1       | 2024.1       |     
                           bcc |  DISTRO  | https://release-monitoring.org/project/12803 | 0.29.1       | 0.30.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.3.50       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.2.4        | 8.2.6        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.3.50       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.3.50       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.8       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.41         | 2.42         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.12       | 2.15.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 26.0         | 27.0         |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 4.1.1        | 4.2.0        | ORPH
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.76         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.76         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.83.0       | 1.85.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.3.3        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 3.3.0        | 3.4.0        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.4.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.20.3       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 6.8.1        | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/05840 | 1.27.0       | 1.28.1       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.10       | 0.6.2        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.5        | 0.5.7        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20230311     | 20240203     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.17.4       | 1.18.0       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.16.2       | 1.18.0       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.4       | 1.14.5       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 1.0.0        | 1.1.0        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.10.4       | 1.0.2        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/07680 | 3.5.4        | 3.6.0        |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.5.2        | 1.5.5        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 3.9.1        | 4.4.3        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.6          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.6.0        | 2.7.1        | ORPH
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 4.4          | 4.5          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.18.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 1.0.6        | 1.3.1        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 15.0.3       | 18.1.6       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/20578 | 2.3.2        | 2.4.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 3.0.21.02.21 | 3.0.23.01.25 |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.3     | 3.14.1.3+... |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.28.3       | 3.29.3       |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/96794 | 1.3.0        | 1.4.1        |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.18.3       | 0.18.4       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/17705 | 15.0.3       | 18.1.6       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/09710 | 2.5.8        | 2.7.6        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/96793 | 2.1.8        | 2.1.12       |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/00338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.7.14       | 1.7.17       |     
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 9.3          | 9.5          | ORPH
                       crudini |  DISTRO  | https://release-monitoring.org/project/21669 | 0.9.3        | 0.9.5        |     
                          crun |  DISTRO  | https://release-monitoring.org/project/96792 | 1.12         | 1.15         |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.7.1        | 2.7.2        |     
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.6.2        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.4.7        | 2.4.8        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.17      | 2.0.0        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 4.3.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 2006-10-MR2  |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.2.0-1      |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.14       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/00391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 33           | 36           |     
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.4.0        | 2.5.1        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.17         | ORPH
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/00421 | 0.26         | 0.27         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 10.0.5       | 10.0.6       |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20230209 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/00438 | 3.0.5        | 3.1.0        | ORPH
                     dmidecode |  DISTRO  | https://release-monitoring.org/project/00443 | 3.5          | 3.6          |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 26.0.2       | 26.1.3       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 26.0.2       | 26.1.3       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/07454 | 3.2.1        | 3.3.0        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/10627 | 059          | 101          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.21.4       | 9.28.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      dt-utils |  DISTRO  | https://release-monitoring.org/project/21419 | 2023.08.0    | 2023.11.0    |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.9.0        | 1.0.0        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.1.7        | 3.2.0        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.20         | 1.20.2       | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202402       |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.3       | 1.27.0       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 23.04        | 24.02        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.189        | 0.191        | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.3.3        | 2.7.3        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/00696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.4       | 0.26.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 26.0.2       | 26.2.5       |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.5       | 1.11.10      |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.15       | 1.0.16       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.11       | 0.8.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.49       | 1.0.52       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.2.7        | 1.2.12       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.16       | 1.1.19       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.49       | 1.1.51       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.6.2        | 1.8.1        |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/63188 | 1.5          | 1.7.1        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.9.0.1      | 2.9.5.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.6.3        | 2.6.5        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.6       | 0.28.2       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.18.8       | 0.18.16      |     
                      fail2ban |  DISTRO  | https://release-monitoring.org/project/06602 | 1.0.2        | 1.1.0        |     
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.6        | 3.1.8        |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.10.2       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 6.1.1        | 7.0          |     
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.34         | 3.37         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/09989 | 2.0.2        | 2.1.2        | ORPH
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 23.5.26      | 24.3.25      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.9        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | LSDK-21.08   | 0.2.0        | ORPH
                       fmtools |  DISTRO  | https://release-monitoring.org/project/21435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.5.2        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.14.2       | 2.15.0       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.17.2       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/00834 | 5.1          | 5.2          |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.11.6       | 3.5.1        |     
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 8.5.4        | 10.0         |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.9.1        | 1.10.2       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 4.3.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/00881 | 3.8.2        | 3.9.0        |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.10      | 2.42.12      | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.5.5        | 2.8.4        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.12.1       | 2.1.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.22.4       | 0.22.5       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 10.02.1      | 10.03.1      |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 15.5.0       | 17.0.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.76.0       | 2.80.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.76.0       | 2.80.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.6       | 2.66.7       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 1.0.0        | 1.0.1        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.10.7.0     | 3.10.10.0    |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.8.3        | 3.8.5        | ORPH
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.76.1       | 1.80.1       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/21085 | 2.3.2        | 2.4.0        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.15.9       | 2.17.5       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/21447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.2.0        | 7.5.0        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.2.0        | 5.3.1        |     
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/01248 | 1.3.40       | 1.3.43       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.51.1       | 1.64.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 45.0         | 46.0         |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.22.9       | 1.22.12      | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.22.9       | 1.24.3       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.22.9       | 1.24.3       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.22.9       | 1.24.3       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.22.9       | 1.24.3       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.22.9       | 1.24.3       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.22.9       | 1.24.3       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.22.9       | 1.24.3       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.22.9       | 1.24.3       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.22.9       | 1.24.3       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.22.9       | 1.24.3       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.22.9       | 1.24.3       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.8       | 3.24.9       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.12.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.54.0       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.15       | 2.9.7        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 8.4.0        | 8.5.0        |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 11.2         | 11.5         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.23.12      | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.379        | 0.382        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.9.3        | 2.10.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.50.2       | 2.52.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 73-2         | 75-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.41       | 0.8.43       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.1-31     | 7.1.1-32     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.12.2       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 4.23.9.0     | ORPH
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 24.2.1       | 24.2.2       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20231114     | 20240514     |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.16         | 3.17.1       | ORPH
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 6.8.0        | 6.9.0        |     
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.16         | 7.21         |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.9.3        | 1.9.4        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.4.4        | 1.4.5        |     
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.19         | 6.9          | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.33.0       | 1.34.0       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 1.1.2        | 1.2.2        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 4.2.4        |     
                      jbig2dec |  DISTRO  | https://release-monitoring.org/project/01431 | 0.19         | 0.20         |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.81         | 0.82         |     
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.6          | 1.9          |     
                          jose |  DISTRO  | https://release-monitoring.org/project/11761 | 11           | 13           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.1.5        | 3.0.3        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.13.1       | 1.13.3       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.3       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.19.5       | 1.20.0       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.5.1        | 2.6.4        | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.0.4        |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.0.4        |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.0.4        |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.0.4        |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 31           | 32           |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 21.4.7-Omega | 21.4.8-Omega |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 21.1.2-Omega | 21.2.0       |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 21.6.1-Omega | 21.6.3-Omega |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/21462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.1        | 3.5.2        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 2.2.0        | 2.3.1        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.1       | 3.12.0       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.4        | 0.3.95       |     
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20230802.1   | 20240116.2   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.7.3        | 3.7.4        |     
                        libass |  DISTRO  | https://release-monitoring.org/project/01560 | 0.17.1       | 0.17.2       |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.1.0        | 1.4.2        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.7       | 0.12.2       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.7          | 2.10         | ORPH
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.2.1        | 1.4.4        |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.69         | 2.70         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 2.0.3        | 3.1.0        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.18      | 2.10.19      | ORPH
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.2        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.16.4       | 1.18.0       | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20230828-3.1 | 20240517-3.1 |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/12043 | 0.99.9.1     | 1.2304.0     |     
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.13       | 1.0.14       |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.8.0        | 1.8.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.8        | 3.4          |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.76.1       | 2.80.2       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.4.0        | 1.7.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.48         | 1.49         | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/20640 | 1.6.4        | 2.1.2        | ORPH
                     libgpiod2 |  DISTRO  | https://release-monitoring.org/project/20640 | 2.1          | 2.1.2        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.2.1        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.41      | 3.24.42      |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 237          | 238          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.41         | 2.42         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.18       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.3.0        |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 1.17.0       | 1.17.1       |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.2        | 2.0.5        |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.45         | 2.47         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.31         | 0.32         | ORPH
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.28       | 3.0.17       |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 6.1.2        |     
                       libnvme |  DISTRO  | https://release-monitoring.org/project/242763 | 1.8          | 1.9          |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.4.0        | 2.4.1        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2023.8       | 2024.6       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.32.0       | 2.0.2        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.14         | 2.14.1       |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.4.0        | 2.6.0        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 7.7.5        | 7.9.0        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.6.0        | 1.6.1        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.8.4        | 3.9.2        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.9       | 2.58.91      |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.5        | 2.0.6        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.5       | 0.21.4       | ORPH
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.6          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.6          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.4.0        | 3.6.0        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.0       | 2.12.1       |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/01728 | 1.0.18       | 1.0.19       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/07908 | 0.7.25       | 0.7.29       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.3        | 2.0.0a1      |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.2.0        | 3.3.0        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.5.0        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.19       | 2.0.10       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/21371 | 0.8.2        | 0.9.2        |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.18      | 1.14.19      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.26.4       | ORPH
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.5          | 2.6          |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.24.1       | 1.26.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.15.2a      |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/13830 | 7.10.0       | 10.3.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.10.2       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/11083 | 1.13.1       | 1.14.0       |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.14.2       | 1.16.0       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/01767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.7.0        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/01783 | 2.12.6       | 2.12.7       |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3176        | 1.59.03      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.1.148      | 2.2.8        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 0.11.0.2     | 0.11.0.3     |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 0.11.0.1     | 0.11.0.3     |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.24      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.2.4        | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20240410     | 20240513     |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2024.05.15   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.6       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.17       | 1.0.18       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.6       |     
                          lmdb |  DISTRO  | https://release-monitoring.org/project/06974 | 0.9.31       | 0.9.32       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/10135 | 0.1.19       | 0.1.19+nmu1  | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/01835 | 2.1.0        | 2.1.1        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 1.1.0        | 1.2.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/11649 | 0.9.5-1      | 0.9.6        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2.7        | 1.3.1        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.8       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.10      | 2.13.13      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.8       | 2.13.13      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.6        |     
                     lua-iconv |  DISTRO  | https://release-monitoring.org/project/11668 | 7-1          | 7.1.0        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.17.2       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.43.0-0     | 1.48.0-2     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.23      | 2.03.24      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 5.0.3        | 6.0.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.1        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.23         | 1.24.1       | ORPH
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2405         | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.11.6      | 11.4.1       | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.26       | 1.5.27       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.8       | 3.6.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20220418     | 20240107     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 194          | 199          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.6.0      | 0.1.6.3      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.3.50       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.22       | 1.6.27       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 6.20         | 7.00         |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 1.3.1        | 1.4.0        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.46.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2023.09      | 2024.02.1    |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.22.0       | 1.22.2       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.6.1        | 5.8.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.5        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2023.12      | 2024.04      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.11.6       | 0.13.2       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/68638 | 2.9.7        | 3.0.12       |     
                       mokutil |  DISTRO  | https://release-monitoring.org/project/246006 | 0.7.1        | 0.7.2        |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 7.3.2        |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.182   | 6.12.0.206   |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.5.1        | 4.0.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.1.1        | 4.2.1        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.32.3       | 1.32.6       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.35.1       | 0.38.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 6.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.25       | 1.8.26       |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.6        | 2.2.0        | ORPH
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.6        | 1.1.7        |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.22.0       | 1.24.2       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.2.12       | 2.2.13       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/13545 | 3.3.1        | 4.0.3        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 7.2          | 8.0          | ORPH
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/14540 | 1.2          | 1.2.1        |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/02048 | 2.16.02      | 2.16.03      | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.25         | 3.26.1       |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.20         | 2.4          |     
                         ncftp |  DISTRO  | https://release-monitoring.org/project/02054 | 3.2.6        | 3.2.7        | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.7        | 1.0.8        | ORPH
                      neofetch |  DISTRO  | https://release-monitoring.org/project/16261 | 7.1.0        | 7.3.11       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 1.7.6        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | 1.218        | 1.226        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.45.4       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.7.3        | 0.7.8        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.2.19       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9.3        | 5.9.4        | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/05386 | 3.10         | 3.11         |     
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.23      | 0.52.24      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.8        | 1.0.9        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.8        | 1.0.9        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.58.0       | 1.62.1       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.24.0       | 1.26.0       |     
                        ngircd |  DISTRO  | https://release-monitoring.org/project/02083 | 26.1         | 27           | ORPH
                   nilfs-utils |  DISTRO  | https://release-monitoring.org/project/02091 | 2.2.9        | 2.2.11       |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.11.1.g9... | 1.12.1       |     
                          nmap |  DISTRO  | https://release-monitoring.org/project/02096 | 7.94         | 7.95         | ORPH
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16p          | 16q          | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/08251 | 20.11.1      | 22.2.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/08251 | 20.11.1      | 22.2.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.16       | 2.0.18       |     
                       nushell |  DISTRO  | https://release-monitoring.org/project/31106 | 0.85.0       | 0.93.0       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 550.78       | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 515.48.07    | 550.78       |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.9.1        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 2.2          | 2.7          |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 14.2.5       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.3.1        | 4.3.2        | ORPH
              onevpl-intel-gpu |  DISTRO  | https://release-monitoring.org/project/368736 | 24.2.1       | 24.2.2       |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.3.10      | 1.4.0        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.23.1       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2023.12.14   | 2024.05.08   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.19       | 4.9.0        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.12.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.34       | 2.0.35       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 17.0.9+9     | 23+23        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 9.1.0        | 9.2.2        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.1.5        | 5.0.3        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.52.1       | 0.54         |     
                        opensc |  DISTRO  | https://release-monitoring.org/project/02559 | 0.24.0       | 0.25.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.4.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.6.2        | 0.6.3        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.6.2        | 0.6.3        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/11081 | 1.4          | 1.5.1        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.34       | 0.4.38       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.3.50       | ORPH
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.25         | 1.26         |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.50.1       | 2.52.0       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.3       | 2.46.4       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.18.0       | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.10.0       | 3.12.0       |     
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/02611 | 2.1.0        | 2.2.1        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/02743 | 0.02         | 0.19         |     
     perl-crypt-openssl-random |  DISTRO  | https://release-monitoring.org/project/02747 | 0.15         | 0.16         |     
                perl-data-uuid |  DISTRO  | https://release-monitoring.org/project/11837 | 1.226        | 1.227        |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.94         | 6.95         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 5.005        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/02835 | 0.83         | 0.84         |     
          perl-extutils-config |  DISTRO  | https://release-monitoring.org/project/11847 | 0.008        | 0.009        |     
    perl-extutils-installpaths |  DISTRO  | https://release-monitoring.org/project/11849 | 0.012        | 0.013        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/12660 | 2.77         | 2.81         |     
                  perl-gdgraph |  DISTRO  | https://release-monitoring.org/project/09187 | 1.54         | 1.56         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.81         | 3.82         |     
              perl-html-tagset |  DISTRO  | https://release-monitoring.org/project/02971 | 3.20         | 3.24         |     
             perl-http-cookies |  DISTRO  | https://release-monitoring.org/project/02974 | 6.10         | 6.11         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/06175 | 12.50        | 12.84        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.080        | 2.085        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.67         | 6.77         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/03050 | 6.12         | 6.14         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20230630   | 1.20240124   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/11809 | 5.509        | 5.515        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/11870 | 0.047        | 0.048        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.35         | 9.37         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/03136 | 20231213     | 20240313     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.42         | 1.45         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.72         | 0.73         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.144        | 0.146        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/03485 | 5.21         | 5.28         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0210       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.22       | 5.1.23       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.3.1        | 3.3.2        |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.2.1        | 1.3.0        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.81       | 1.1.81       |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/03648 | 0.42.2       | 0.43.4       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 2.2.0        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.13.2       | 1.13.3       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.0          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 123          | 124          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 22.12.0      | 24.05.0      |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/05601 | 16.2         | 16.3         |     
                         pound |  DISTRO  | https://release-monitoring.org/project/05436 | 4.8          | 4.12         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.11       | 1.3.12       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.4        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 9.3.0        | 9.4.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.14      | 0.12.4       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 26.1         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.4.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                         putty |  DISTRO  | https://release-monitoring.org/project/05749 | 0.80         | 0.81         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/03736 | 1.8.5        | 1.8.9        | ORPH
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.7        | 0.4.9        |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/21244 | 0.7.0        | 0.7.1        |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/21245 | 3.1.1        | 3.2.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.9.3        | 3.9.5        |     
         python-aiohttp-jinja2 |  DISTRO  | https://release-monitoring.org/project/21247 | 1.5.1        | 1.6          |     
            python-aiohttp-sse |  DISTRO  | https://release-monitoring.org/project/21251 | 2.1.0        | 2.2.0        |     
              python-aiorwlock |  DISTRO  | https://release-monitoring.org/project/21254 | 1.3.0        | 1.4.0        |     
              python-aiosqlite |  DISTRO  | https://release-monitoring.org/project/54836 | 0.19.0       | 0.20.0       |     
                  python-anyio |  DISTRO  | https://release-monitoring.org/project/49275 | 4.2.0        | 4.3.0        |     
                python-apispec |  DISTRO  | https://release-monitoring.org/project/37849 | 6.3.1        | 6.6.1        |     
                   python-argh |  DISTRO  | https://release-monitoring.org/project/09299 | 0.31.0       | 0.31.2       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.7.2        | 3.8.1        |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.14.0       | 2.15.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 4.0.1        | 4.1.3        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.12.2       | 4.12.3       |     
                 python-bidict |  DISTRO  | https://release-monitoring.org/project/114352 | 0.22.1       | 0.23.1       |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 4.1.4        | 4.2.2        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.21.1       | 0.22.1       |     
                python-blinker |  DISTRO  | https://release-monitoring.org/project/20042 | 1.7.0        | 1.8.2        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/21929 | 0.8.0        | 0.9.0        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/29737 | 1.34.14      | 1.34.108     |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.34.14      | 1.34.108     |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/07022 | 5.3.2        | 5.3.3        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.5.1        | 5.6.3        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2023.11.17   | 2024.2.2     |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 4.0.0        | 4.1.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 4.1.0        | 4.2.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 10.0.0       | 11.0.0b3     |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 18.8.0       | 18.9.0       |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.8.0        | 6.8.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.30       | 1.5          |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.1.0        | 1.2.1        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 39.0.2       | 42.0.7       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.9.0        | 2.11.0       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.36      | 3.0.10       |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 4.0.0        | 4.1.2        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/05621 | 2.8.2        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.12.0       | 2.21.2       |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 5.0.3        | 5.0.6        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.4.2        | 2.6.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 6.1.3        | 7.0.0b3      |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.20.1       | 0.21.2       |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2023.11      | 2024.4       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.18.0       | 0.19.0       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.8.2        | 4.9.1        |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/62869 | 1.6.1        | 1.7.1        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/47977 | 0.110.0      | 0.111.0      |     
                 python-fastui |  DISTRO  | https://release-monitoring.org/project/372329 | 0.5.2        | 0.6.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.13.1       | 3.14.0       |     
                   python-fire |  DISTRO  | https://release-monitoring.org/project/21700 | 0.5.0        | 0.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 3.0.0        | 3.0.3        |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 4.0.0        | 4.0.1        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 2.2.2        | 3.0.1        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/25028 | 0.42.3       | 0.44.0       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/85010 | 2.0.7        | 24.3.25      |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.47.0       | 4.51.0       |     
                 python-future |  DISTRO  | https://release-monitoring.org/project/26845 | 0.18.3       | 1.0.0        |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.40       | 3.1.43       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 14.2.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.2       | 3.48.2       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/25386 | 2.15.0       | 2.19.0       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/38039 | 2.26.1       | 2.29.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/63943 | 1.62.0       | 1.63.0       |     
               python-gpiozero |  DISTRO  | https://release-monitoring.org/project/19948 | 2.0          | 2.0.1        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.13       | 0.1.18       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/18429 | 1.60.0       | 1.63.0       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/30542 | 1.60.0       | 1.63.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 21.2.0       | 22.0.0       |     
              python-hatchling |  DISTRO  | https://release-monitoring.org/project/185085 | 1.22.4       | 1.24.2       |     
               python-httpcore |  DISTRO  | https://release-monitoring.org/project/79947 | 1.0.2        | 1.0.5        |     
                  python-httpx |  DISTRO  | https://release-monitoring.org/project/27210 | 0.26.0       | 0.27.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/11771 | 2.4.1        | 2.4.1-1      |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 3.6          | 3.7          |     
               python-influxdb |  DISTRO  | https://release-monitoring.org/project/12696 | 5.3.1        | 5.3.2        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 8.20.0       | 8.24.0       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 2.1.2        | 2.2.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 3.3.0        | 3.4.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 4.0.0        | 4.0.1        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 3.1.2        | 3.1.4        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 4.20.0       | 4.22.0       |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 24.2.0       | 25.2.1       |     
                   python-lark |  DISTRO  | https://release-monitoring.org/project/140595 | 1.1.8        | 1.1.9        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 5.1.0        | 5.2.2        |     
               python-m2crypto |  DISTRO  | https://release-monitoring.org/project/06599 | 0.40.1       | 0.41.0       |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/17278 | 0.13.0       | 0.14.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.3.0        | 1.3.5        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.5.1        | 3.6          |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.12       | 2.4.13       |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.1.3        | 2.1.5        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/08079 | 3.20.1       | 3.21.2       |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/50566 | 0.30.0       | 1.0.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.8.2        | 3.9.0        |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.1.6        | 0.1.7        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/42653 | 1.4.0        | 1.5.1        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.15.0       | 0.16.0       |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.3.2        | 0.4.0b1      |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 1.0.7        | 1.0.8        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/11132 | 6.0.4        | 6.0.5        |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/18463 | 0.0.6        | 0.0.9        |     
                python-netaddr |  DISTRO  | https://release-monitoring.org/project/05586 | 0.10.1       | 1.2.1        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 3.2.1        | 3.3          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.25.0       | 2.0.0b1      |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.0.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.9.10       | 3.10.3       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.6.1        | 2.1.0        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.8.3        | 0.8.4        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 23.3.2       | 24.1b1       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 1.4.0        | 1.5.0        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 26.1         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.9.7        | 5.9.8        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.3.0        | 0.4.0        |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.11.1       | 2.12.0       |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.25.1       | 1.26.0       |     
              python-pycparser |  DISTRO  | https://release-monitoring.org/project/08175 | 2.21         | 2.22         |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.19.1       | 3.20.0       |     
                 python-pycups |  DISTRO  | https://release-monitoring.org/project/07975 | 2.0.1        | 2.0.4        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20231114.3   | 20240428.2   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 2.5.3        | 2.7.1        |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.14.6       | 2.18.2       |     
                  python-pydyf |  DISTRO  | https://release-monitoring.org/project/179112 | 0.8.0        | 0.10.0       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.30         | 0.31         |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.17.2       | 2.18.0       |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 2.12         | 2.13.1       |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.21.0       | 0.22.0       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.22.0       | 1.24.4       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 23.3.0       | 24.1.0       |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 1.0.3        | 1.2.1        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 3.1.1        | 3.1.2        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.12.0       | 3.13.0       |     
                 python-pyphen |  DISTRO  | https://release-monitoring.org/project/19681 | 0.14.0       | 0.15.0       |     
        python-pyproject-hooks |  DISTRO  | https://release-monitoring.org/project/320474 | 1.0.0        | 1.1.0        |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.7.1        | 0.8.0        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.10      |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.7.10       | 0.7.12       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.2.9        | 1.2.9.1      |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.31.3       | 0.31.4       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 8.1.1        | 8.2.1        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.23.6       | 0.23.7       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.24.1       | 0.24.3       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 25.1.2       | 26.0.3       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 5.0.1        | 5.0.4        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/81160 | 1.7.0        | 2.0.13       |     
            python-referencing |  DISTRO  | https://release-monitoring.org/project/304263 | 0.32.1       | 0.35.1       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2023.12.25   | 2024.5.15    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.1        | 2.0.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.76       | 2.2          |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/66067 | 0.17.21      | 0.18.6       |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.10.0       | 0.10.1       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/04768 | 1.11.4       | 1.13.0       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/59641 | 1.6.0        | 1.6.1        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/05645 | 4.16.0       | 4.21.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.39.2       | 2.2.0        |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 23.1.0       | 24.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 69.2.0       | 69.5.1       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.8.1        | 1.9.0        |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 8.0.4        | 8.1.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 6.8.3        |     
            python-smbprotocol |  DISTRO  | https://release-monitoring.org/project/47981 | 1.12.0       | 1.13.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 5.0.0        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/07203 | 0.6.1        | 0.7.1        |     
                python-sniffio |  DISTRO  | https://release-monitoring.org/project/18170 | 1.3.0        | 1.3.1        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.11.0       | 5.11.2       |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.4.4        | 0.5.0        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/36570 | 0.36.3       | 0.37.2       |     
               python-tcolorpy |  DISTRO  | https://release-monitoring.org/project/97274 | 0.1.4        | 0.1.6        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 5.5.0        | 5.5.1        |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 1.6.7        | 1.7.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.16.0       | 0.20.0       |     
               python-tinycss2 |  DISTRO  | https://release-monitoring.org/project/16655 | 1.2.1        | 1.3.0        |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/12824 | 1.1.4        | 1.1.7        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.2          | 6.4          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.64.1       | 4.66.4       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.8.0        | 5.14.3       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 22.2.0       | 23.11.0      |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/17451 | 0.22.0       | 0.25.1       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.9.2        | 0.11.1       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/88298 | 2024.3.3     | 2024.5.17    |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.10.0      | 24.3.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 22.0.0       | 23.11.0      |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/38819 | 2.13.3       | 4.2.1        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 1.3.0        | 1.3.2        |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.8.19.14    | 2.9.0.202... |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 4.9.0        | 4.12.0a2     |     
         python-typing-inspect |  DISTRO  | https://release-monitoring.org/project/209826 | 0.8.0        | 0.9.0        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.7.2        | 2.8.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 5.7.0        | 5.10.0       |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 2.0.7        | 2.2.1        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.6.10       | 2.6.12       |     
         python-urwid-readline |  DISTRO  | https://release-monitoring.org/project/84198 | 0.13         | 0.14         |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.22.0       | 0.28.1       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.2.1        | 4.0.0        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.2.5        | 0.2.13       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 59.0         | 62.1         |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.26.1       | 2.27.1       |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/24711 | 8.2.0        | 8.4.0        |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 1.4.2        | 1.8.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.4         | 12.0         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 2.3.8        | 3.0.3        |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/11428 | 0.40.0       | 0.43.0       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.14.1       | 1.16.0       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 3.0.1        | 3.1.2        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.32         | 0.33         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.6        | 3.2.0        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.9.2        | 1.9.4        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20220907.1   | 20230507.3   |     
            python-zc-lockfile |  DISTRO  | https://release-monitoring.org/project/04100 | 2.0          | 3.0.post1    |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.39.4       | 0.132.2      |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/66674 | 22.6.1       | 23.1.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 5.5.2        | 6.4          |     
                 python-zopfli |  DISTRO  | https://release-monitoring.org/project/50016 | 0.2.2        | 0.2.3        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.11.8       | 3.12.3       |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2024.09      | 2024.19      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/21737 | 2.4.7        | 2.5.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 11.9.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.39.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.0        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.0        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.0        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.0        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.11      | 6.7.0        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.0        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.0        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.0        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.0        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.0        |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/13768 | 0.13.0       | 0.14.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
           raspberrypi-usbboot |  DISTRO  | https://release-monitoring.org/project/115700 | 2021.07.01   | 20221215-... | ORPH
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2024-04-01   | 2024-05-01   |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 7.2.4        | 7.2.5        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20231002   | 2.20240226   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.6          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 9.1.1        |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.15         | 4.0          | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2402.0     | 8.2404.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 2.6          | 2.7          |     
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 8.1.0        | 8.1.2        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.3.0        | 3.3.1        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.74.1       | 1.78.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.74.1       | 1.78.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/17910 | 0.65.1       | 0.69.4       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.42.5       | 0.42.6       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.11.1.2     | 2.12.0.4     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.4      | 2.3.7.1      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.8.0      | 1.1.2.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.6.0.0      | 2.6.2.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.5.1.1      | 2.7.0.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.5.0      | 2.3.0.3      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.3.2      | 0.5.4.2      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.19.6       | 4.20.1       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.1.1        | 1.3.0        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.6.3        | 2.8.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.2        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.20.0       | 1.49.1       |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.31.2       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.7.2        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.8        | 4.6.2        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.2       |     
                       setools |  DISTRO  | https://release-monitoring.org/project/08951 | 4.4.4        | 4.5.1        | ORPH
                        shadow |  DISTRO  | https://release-monitoring.org/project/04802 | 4.14.5       | 4.15.1       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.9        | 4.3.2        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.4          | ORPH
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.0.9        | ORPH
                   simple-mail |  DISTRO  | https://release-monitoring.org/project/53352 | 2.3.0        | 3.0.0        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.11         | 4.12         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.12.0.1     | 2.14.1.1     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/96796 | 4.7.0        | 4.8.0        |     
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/96795 | 1.2.3        | 1.3.1        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.3          | 7.4          | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.10       | 1.2.0        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.7.0        | 1.8.1        | ORPH
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.40.0     | 3.1.84.0     |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.42-9798... | ORPH
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.16      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/05388 | 1.6.4        | 1.6.5        | ORPH
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.15.0       | 0.15.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.5        | 4.5.7        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/04877 | 3.45.1       | 3.45.3       |     
                        sratom |  DISTRO  | https://release-monitoring.org/project/14903 | 0.6.14       | 0.6.16       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 2.0.1        | 2.1.2        | ORPH
              starfive-spltool |  DISTRO  | https://release-monitoring.org/project/372234 | JH7110_VF... | JH7110-RT... |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.22.6       | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 23.3         | 24.1         |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 6.8          | 6.9          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.17.07      | 0.17.08      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.13       | 5.9.14       |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.71         | 5.72         |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.19       | 7.0.5        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/11497 | 1.8.1        | 1.9          |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/20562 | 1.2.0        | 1.2.1        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/04919 | 4.1.1        | 4.2.1        |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.3       | 0.37.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 46.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.2.150      | 2.2.170      |     
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 254.9        | 255.6        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 235          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.13.1       | 2.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2021.11.0    | 2021.12.0    |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.13       | 8.6.14       | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.12.1       | 1.13.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.5.6        | 2.5.7        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.20.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.14.2       | 2.15.0       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.1.0        |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/08699 | 1.11.1       | 1.11.2       |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 2.7          | 3.3          |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.13       | 8.6.14       |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.3a         | 3.4          |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 3.0.0        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 5.2          | 5.7          | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.2.2        | 4.1.2        | ORPH
                    traceroute |  DISTRO  | https://release-monitoring.org/project/14877 | 2.1.3        | 2.1.5        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2024.04      | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.16         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 4.3.0.0      | 4.6.0.0      |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/05042 | 1.19.1       | 1.20.0       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.4          | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.8.11       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 1.90.4       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 4.2.1        | 4.2.4        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.13.0       | 0.14.0       |     
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.11         | 6.12         |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.1       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.1       | ORPH
                           uuu |  DISTRO  | https://release-monitoring.org/project/259328 | 1.5.179      | 1.5.181      |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 3.2.0_lib... | 3.4.0_lib... |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.7       | 0.13.1       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.56.14      | 0.56.17      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.22.0       | 3.23.0       | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/05069 | 2.6.5        | 2.6.7        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/05080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.1.0145     | 9.1.0418     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.9        |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.11         | 2.12         |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.0.0        | 3.1.2        |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.76.1       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.4.21       | 3.4.27       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.3.0        | 4.3.2        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.3.262      | 1.3.285      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.3.285      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.3.285      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 2.0.26       | 2.1.0        |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.7.0        | 1.8.0        |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.42.5       | 2.45.1       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.3.2        | 1.4.0        |     
                          wget |  DISTRO  | https://release-monitoring.org/project/05124 | 1.21.4       | 1.24.5       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.14       | 5.5.23       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 8.0.2        | 9.9          |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2023.09.01   | 2024.05.08   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.5.2        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 4.0.12       | 4.2.5        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.16.2       | 0.17.3       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.2.0        |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.42.5       | 2.44.2       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.5          | 3.6          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.24       | 1.4.25       |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/00191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/17160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/21723 | 1.2.2        | 1.2.3        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/15048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/17161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20240102     | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/05253 | 1.1.2        | 1.1.3        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/15034 | 1.0.4        | 1.0.5        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/05255 | 1.1.14       | 1.1.16       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/05180 | 1.2.3        | 1.2.4        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/15025 | 1.2.0        | 1.3.0        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/15018 | 1.4.6        | 1.4.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/21718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/18845 | 1.0.3        | 1.0.4        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/14958 | 1.2.6        | 1.2.7        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/05259 | 1.0.5        | 1.0.6        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/13646 | 1.15.2       | 1.17.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.3.0        | 1.4.0        | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/21711 | 2.1.22       | 2.1.23       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/05235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/05236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.6       | 4.18.2       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.4        | 3.2.5        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/17200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/15055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 6.4.0        | 6.8.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.38         | 2.41         | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.8.7        | 1.8.9        | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/01766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/01770 | 1.2.1        | 1.2.2        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/01772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/01774 | 1.3.5        | 1.3.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/01785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/01788 | 1.5.3        | 1.5.4        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/01796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/01613 | 1.1.7        | 1.1.8        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/01781 | 1.1.2        | 1.1.3        | ORPH
                         xmrig |  DISTRO  | https://release-monitoring.org/project/17499 | 6.21.2       | 6.21.3       |     
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2023.2       | 2024.1       | ORPH
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.4.pl02   | 1.5.6.pl02   |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.08         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.11      | 21.1.13      | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.24         | 3.26         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 389          | 391          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/13528 | 1.0.8        | 1.0.9        | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 23.2.4       | 24.1.0       |     
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.4.6        | 5.6.1        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 13.0         |     
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 2.05         | 2.08         |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 6.2.7        | 6.4.14       |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.4.0        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 6.2.1        |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.2.2        | 2.2.4        |     
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.5.5        | 1.5.6        |     
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.1.0        | 2.2.1        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-22628   | https://security-tracker.debian.org/tracker/CVE-2020-22628  
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2023-31722   | https://security-tracker.debian.org/tracker/CVE-2023-31722  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         putty | CVE-2024-31497   | https://security-tracker.debian.org/tracker/CVE-2024-31497  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                      binutils | CVE-2023-25588   | https://security-tracker.debian.org/tracker/CVE-2023-25588  
                      binutils | CVE-2023-25586   | https://security-tracker.debian.org/tracker/CVE-2023-25586  
                      binutils | CVE-2023-25585   | https://security-tracker.debian.org/tracker/CVE-2023-25585  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2023-47470   | https://security-tracker.debian.org/tracker/CVE-2023-47470  
                        ffmpeg | CVE-2023-46407   | https://security-tracker.debian.org/tracker/CVE-2023-46407  
                        ffmpeg | CVE-2024-22860   | https://security-tracker.debian.org/tracker/CVE-2024-22860  
                        ffmpeg | CVE-2024-22862   | https://security-tracker.debian.org/tracker/CVE-2024-22862  
                        ffmpeg | CVE-2024-22861   | https://security-tracker.debian.org/tracker/CVE-2024-22861  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2023-39975   | https://security-tracker.debian.org/tracker/CVE-2023-39975  
                       libkrb5 | CVE-2023-36054   | https://security-tracker.debian.org/tracker/CVE-2023-36054  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-22628   | https://security-tracker.debian.org/tracker/CVE-2020-22628  
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                         mdadm | CVE-2023-28736   | https://security-tracker.debian.org/tracker/CVE-2023-28736  
                         mdadm | CVE-2023-28938   | https://security-tracker.debian.org/tracker/CVE-2023-28938  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         putty | CVE-2024-31497   | https://security-tracker.debian.org/tracker/CVE-2024-31497  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-6683    | https://security-tracker.debian.org/tracker/CVE-2023-6683   
                          qemu | CVE-2023-6693    | https://security-tracker.debian.org/tracker/CVE-2023-6693   
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-5088    | https://security-tracker.debian.org/tracker/CVE-2023-5088   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2023-3019    | https://security-tracker.debian.org/tracker/CVE-2023-3019   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
