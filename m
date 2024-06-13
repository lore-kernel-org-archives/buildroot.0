Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF773C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 04:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B0FF40590;
	Thu, 13 Jun 2024 04:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTVoSiPLq7HO; Thu, 13 Jun 2024 04:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F41684055D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F41684055D;
	Thu, 13 Jun 2024 04:04:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05BE31BF3C6
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 04:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E813E60B34
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 04:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5vxHvccJBsC for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 04:04:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1B93605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B93605A6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1B93605A6
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 04:04:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1B301BF208
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 04:04:00 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 13 Jun 2024 04:04:00 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718251441; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6e7hj6bIvhEyb+9nPUD2Cd+1WjUCCPRVr5FiD5ZZ03o=;
 b=md2RAOxHSyZW8GRxkkdBiRiWV0MJsX1HDIEjpnlNXvO4f1t4ZYxHMqWQDZfcEjxdAVbgwI
 IaRWBeYmc6DTIhhFSLTjcyduHdvTPzuCDiXcF9CnRgyqU3a1GiS2srQmcqoiExK4yhw8OG
 ZauZbKmG/zppoHEGDrL85ruvcGqZNKvK+Gsr9YRK3AFPH+J0AVu64Vliin8QkOEUuTGHy8
 Au2u5B3AfqaTM29lkh/MFo6Vz0pSfMwujI581hblytfa9D3YLCvo1szLypF/OAP+UG6lax
 OQwUVRvo/0Ss1Qs4iz6ACwkD/MJc/jJ8JGv2FUpkRbzdu1perP2PTzxG78M3iA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=md2RAOxH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-12
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
Message-ID: <20240613040400.RW1fu2Jx7dcJtp_Nr4ESvvV9O-oMFhFWyzLsbYkN2Bk@z>

Hello,

Autobuild statistics for 2024-06-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  6  |  0  | 12  |
    master   | 57  | 131 |  0  | 188 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 9 
            host-cdrkit-1.1.11 | 8 
                libressl-3.8.4 | 8 
                    mpir-3.0.0 | 7 
                fail2ban-1.0.2 | 6 
      host-riscv-isa-sim-1.1.0 | 6 
                       unknown | 6 
ibm-sw-tpm2-5452af422edeff7... | 5 
                host-odb-2.4.0 | 4 
                  linux-6.8.12 | 4 
                 coreutils-9.3 | 3 
                elfutils-0.189 | 3 
          libcamera-apps-1.2.1 | 3 
                  libsepol-3.6 | 3 
                     crun-1.12 | 2 
                  ffmpeg-6.1.1 | 2 
host-heimdal-f4faaeaba371ff... | 2 
        host-sentry-cli-2.20.3 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
                  libffi-3.4.6 | 2 
               libglib2-2.76.1 | 2 
                libglvnd-1.4.0 | 2 
               mariadb-10.11.6 | 2 
           mediastreamer-4.4.8 | 2 
              skalibs-2.12.0.1 | 2 
            altera-stapl-0.3.3 | 1 
android-tools-4.2.2+git2013... | 1 
                 avro-c-1.11.3 | 1 
                    bat-0.24.0 | 1 
                beecrypt-4.2.1 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                  bitcoin-26.0 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
                   bullet-3.25 | 1 
                busybox-1.36.1 | 1 
                  fbdump-0.4.2 | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-86739f2b3ae9... | 1 
                     frr-8.5.4 | 1 
            gdk-pixbuf-2.42.10 | 1 
           ghostscript-10.02.1 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
  gobject-introspection-1.76.1 | 1 
host-android-tools-4.2.2+gi... | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.4 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
                     nut-2.8.2 | 1 
                      opus-1.4 | 1 
                    proj-9.3.0 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
             sofia-sip-1.13.17 | 1 
                   uhd-4.3.0.0 | 1 
                ustreamer-6.11 | 1 
             util-linux-2.39.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       altera-stapl-0.3.3       | NOK | http://autobuild.buildroot.net/results/48bc8bd4a1bb114589dc73985085b2f859a4537d |     
    arm      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/bf301884c9bae6f04e5f3865a53359851662d5fb |     
    sh4      |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/624e323f3663ad4ab1d4bd09d24f044688cbd080 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/8dc1185b33971118e9057594c2ab0ac4857d15b8 |     
  mips64el   |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/7a51d00dc7f0e512fcce2499c0fa5296591975fe | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/82f36c74bb6ef396d32b7807c8a05674e9f625b3 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2c2e6286ddeea38537934ac76029c4f0976473eb |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/32f666050a2adc5f4026207cee8b65bc39cce0b3 |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/30ee3bbca8fb468e344036e8966ed4eabbaf0d80 |     
    mips     |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/95fb7fbe1e3542b454a56900e609c666f824ee3c |     
  mips64el   |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/8c19ec11882af3a7abcc53ded790a5803bba73aa |     
  riscv32    |         busybox-1.36.1         | NOK | http://autobuild.buildroot.net/results/3ff2fc4660a404fbdcb1c7aabd376fc9bc5d233d | ORPH
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b8d95839bda8501216a50ff5b48af541cef20647 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4eef9794c21be76741de3f34b196f8aa617bc22a | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/edd6b432f87e25e102a9e05d122dd3bb892e973b | ORPH
   xtensa    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/0eaa6978c52ead7d4f073d47aa3dff5156fff810 |     
powerpc64le  |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/b4fb02f4fca860c1bbbcbf50c6cee3b6f34f7c04 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e4060c8053b4cff5c851160e887fbad8f74f4bc7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7fdd6c06036e472d9607a39847b6a16d639a0581 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1641f4231dcacb128d8446e9a9a98126ba59fb24 | ORPH
   xtensa    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/cf6b11aa27fdb3514d6ead9cb1e5bd734ef274b6 |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4c46880093189c6c2a02de6fbd819603dab1aa7c |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7f462ef40a1cb302db03d0f49afb32b2c8b13082 |     
 microblaze  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/231aadbcb71efc90e525cacf6c834f4c5fa0c976 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/28030361c447b9b12edf426929393fb2a86aaa6f |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/443494164d14228c3087f41ed3738a9df06cade8 |     
    mips     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/6c15d7d57f3345b4a732f0006b8cbec9e18a0cac | ORPH
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/4cddaf3838437fbaefc9b33665bae6599bddbcb7 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d8ab02f4ad6a3e0c7f4c4f0100dbb66f76c8b4f8 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/dff13c6e9341e05955e7d359b2ab8883ba13fe5a | ORPH
    i686     | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/2df3844a01a65008ce81d5a3ee46fff2913345cd |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/dc45308424a61c9d28a230d389fd8aa49e08f870 |     
   xtensa    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/8c8915a5215b9ab2cf5c853cb4598741b932c61f | ORPH
    sh4      |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/6ec426e03fb55a119cf64890bd70cfb75f726716 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/812041343a6f58692f0258ca7d7e5a465b5f2df8 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1dd3511f9273f6bd052e15e76e3acb9661b2d7ec | ORPH
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/bdfb258a752454acb6b9ef7e9fd3a5d725e8b23d |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7fd05c3087cab5a7c9981da10ff0689b87af72f4 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/01d741c5fdcb4fa0d8454efb9f327202b8078535 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3d052e5d07b4350becf6fafe45c26cecaf3be83b |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9cb6a5921e2773a4e8d0976d53fe56a8037e14b3 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7f4009356567461eb6d30062e0d27e5ad4152f9b |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d12dceae474a58217f5579824b4bba521f13ae0a |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d5de906d7502912f3dca97404c355e19f007954b |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/db6c81bdec39fa98221412edbf8f34d05417fd2e |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/dd4bbc9fcc25ab2dea1fdb6aae8c1ada69228132 | ORPH
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ec0db13c0bfd894d8593dc4185add1c9dd753969 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/417a3718c43070a27defd55e58cdeaf61d2e7393 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/bdd1aca65e286856f695a1d27e78254328d80ccb | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d34a7822a2a8b9f0c57f5c11317d1d04d909c5b1 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/942bb60686789615f97cb270841abe86800ee7c8 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5940661252efe70958aad3f4ba7ec19566b51426 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/63f9aa8660c0bd38fcb4e575f47340ccfa200923 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/064d70aab58020b984615d27419da993a8c2da1c | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/39d6af4d5c97fc4bb82bc254edc1d40f60252561 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f2a043622453eedc5a112b23ad75a55ca550da48 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b000cf19a533946f59dcce1e555c90799f8250a9 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c81b447dab3098782a2ab41e21187eeac90bbab9 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6f5d315094078be2175ef96c9a8869a599106a58 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5090c7e77feb78685a2814729a151345657b9886 | ORPH
   s390x     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7420640ff5305aa20a10c958754c1d77c4a29349 |     
   xtensa    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/54cf101d6ef65640a65cf87a6f8e890a5027e058 |     
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/52b42971312bdba184f4033e8a0c50f3d4cb723b |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/860da0368df79281fa457cc9ab6069e0056b7494 |     
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/0e5021ed924e0d1b8f3ed132559cc178a930c69e |     
 aarch64_be  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7e924c16e2b4feac303983dda7452b01b59ba644 |     
  riscv64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d061a2d3a61aeccff7916c904df57587d287ea7f |     
   sparc     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ff0a9e5396f22c8881e89c2eafd769ad968a6099 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/cd88216aa38e4b9d5a67374d0d2f5835aff793fb |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/93144a76fa3a27dcb3bd98dd618a066d26df8a53 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7512ab35f80bc6a117c07df25a0c6305c4b14d67 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/05ddff9249331ef860a87542792f294f82b45b4f |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9e29c03d7eefcd3c96ec3df0997b8da5e1ee32da |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2f7e9495f65ad3927297cf574c4ced8d58066397 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4b8e5b367d8a2d17b01543f18d6a6acd331b6ea2 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/05710a47f262b244cf9dfd6e955eb5486aeb0dea |     
    arm      |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/6e55db5abf112fad0cfbaf7032d8e6746f079340 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f38fc608f209cccd7962f4e5bb15050382e3e591 |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/10ab9643c6ac797e4c23b98c75d000b4781555e1 |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/6ed0f07600a82c70c6f733ba5c9157ab9020c5d8 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/917ed330dd5cf525402ff7f9884e6548a2443722 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b5864aea084a260fe02bb598cf1c5ca27ed2cfcd |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f9d0216171f7efcfa541e02eecf7951d97cb00b6 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/198fc462971e29a5bb908b969edab00902fcb210 |     
    mips     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/eff540a3ea4d0e2c06b3a5b94a6a9694dc868281 | ORPH
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b4df47116788cbd4b761a9523b0a2fce995887de | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/68b123eae65389722cb92572cb256fd469a694f6 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fe02c8c6e2e339a8bea35ca217330367532620ec | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3ed61b3c945e255f9a6061c2f39766cbb1c45340 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1f5d6e7978475632f1ff112a142b0146a6906c22 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e60767030ee09f869914a2a05a1acacdf6ce6a2b | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9deee9247eba32c9d55d7bc30963db8f564e0e5e | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/68bb816c4fab30be0fc17b9b7510d0b2ccd345d0 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2dac860682aef444543b9d7d356f5c7ecd0690e8 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/c0140b60dc5c5226928de5f15d6994079c9ed2db |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/3075aebf6d3840b36dd344c90feb3552f27a6d74 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/b8f93968baee25ae6db31e5e6eb442509931bf24 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/823a1823215baa1f41816d7f1747f6df96c85fee | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/0ee402900cbc9c795c202efe8430567c5a576d5d | ORPH
   x86_64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/acda0b839343b39de2f1b344e814a374af436152 | ORPH
  powerpc    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/6d2eb945320d36546a2c0f79fe92c24b8a1c923a | ORPH
  powerpc    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/f9d8cb432a90767cba854e3cdb73fb743de8e7d4 | ORPH
   armeb     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/e2f31bbabb4ceaed712e2e7f991813efb4d7b203 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/237ae33ef2009fe71617498cc0dd7f882c0cb8ee | ORPH
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/2478c71fd7fb0bf86411c75083cc828c6d7e599e | ORPH
  powerpc    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/aa27f60f3cabd29fe90a00a2588334bd5f92a9f8 | ORPH
   x86_64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/2383571f5fe7ad94ef42d4bc781577d462f76c6d | ORPH
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/cc7415e1a97e24e6005ddd312b0207dd85da4e07 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2e7df1c10c2c2fb0b7925665f0aef4ea8e6629de |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f46faf3cbba2a71f22f4bd1e143c1330a1aa441e |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c8e919fca85f9ed57d7f5b633865fb587c59426a |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/73c5a6294abd169141574a1ce7b3c502abcfaf10 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a2b7e153defacfa1d7776770fadb8bac7c5891b5 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e6537eaa7daf7d48f4c0598ebce4934275fb9072 |     
    or1k     |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/f56eeffb189369527c946c3c0c7692fab9dd90b5 |     
   arceb     |            opus-1.4            | NOK | http://autobuild.buildroot.net/results/b7330a72acbcd14b3db7df3a8dc197c1513c5a8a |     
  aarch64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/fb57d52482e80e34d077f4b9adb81a276f4b9006 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/75575388e2b9a8a5f13a0013b04dc0d1bec4fd75 |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/f121616b7511483f7bd99a25d5a6e6fa11d7aaa4 |     
    mips     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/d83342d7c7a3d8b380e361faf60763e4e7e47f3e |     
 aarch64_be  |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/58fb375c04229426638919b5f987fa0924aa2786 |     
    arm      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/75c46f281f8cadea18d70bdbcae77b1fa2b91645 |     
    arc      |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/885fc4fde84920da78d6ac878215ac4df1947eca |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b32c69fb41b8b196a1c74fb1a659e8ac2b9c948d |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/d8ba9d15e10753e554e469e337eb52af8fa694ea |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7e2e33a3be3cbb7ecc424b7c8d0a951a2c9c4302 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/343766243b5a542f79ab6710f5c97fc7554d1dcd |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/cf462b74deab6ec12383eac4b236cf7d739dfc12 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e84fc9829a94f42ee72fcdc0f6fbaa36ca6182d5 |     
 aarch64_be  |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/a5e32f1036ba64e13c87cdb2dad63a99e0be39b6 |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/09587ce20d4dc3a9d30ef3885e8cdf6c436a269b | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
                  linux-6.6.32 | 1 
            micropython-1.22.0 | 1 
                 openssh-9.7p1 | 1 
             util-linux-2.39.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a3e33f40aba9a774d42075a01c16e0176fda43a8 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/dc46aeb51866aa94bf62f9245ab51780d6523ff9 | ORPH
    i686     |          linux-6.6.32          | NOK | http://autobuild.buildroot.net/results/49f6e197721b1c1af7863dfe7ca7e0836c3ff097 | ORPH
  aarch64    |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/906a4be4c110104db151099c5f6f92edec4e3154 |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/9ad971c6a352ee0e0676f3a51fcf269df9aed2b1 | ORPH
    arc      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/c00f5963b1015d8b6b6161d4d6d8e3ca21575b63 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
