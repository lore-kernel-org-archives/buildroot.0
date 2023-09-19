Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7E6CD343F
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 06:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28FCC60ED7;
	Tue, 19 Sep 2023 06:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28FCC60ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cpf150xU5G72; Tue, 19 Sep 2023 06:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4395610A5;
	Tue, 19 Sep 2023 06:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4395610A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03F221BF33B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 06:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDD9F821E3
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 06:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDD9F821E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFONy9K5dykE for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 06:37:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0352181585
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 06:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0352181585
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFC58FF80E
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 06:37:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 06:37:25 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230919063731.CDD9F821E3@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1695105446; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Usf6w4bypMApnHuxJqhF10ExnpVaclExB1gj67SEHnc=;
 b=fYV2UCky8DDU/ou1sem0YpAgEotzZV2sejOSfnvpSvxKaB7lba+itJRktDpwaEMai5Zsuk
 9MstgD2PQ+pbYg3GOIPZEmzVjWN1Z8HeDTpZFQqBrlxSIMypHtxkiiwQnZPphmy+zkYYa3
 m9MHKzRozuDqEzUpxgA1fsFydZgbQgI46dX4Ccy0KEfX0UoyIgfuxSNmAcDGUsBza/EFHZ
 Wfi76zAll7pj5tmTjwjCr5nFvarUvQ0w3olu94xX1uCYyfnYorQdjrh0HlfenXSQkIsnMo
 i0OkXi2GOYwg5jeYDcCaofOQyzYm363t+xDGL5saw3zCh0kAXqT3rwFAFlqZ3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fYV2UCky
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-18
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

Autobuild statistics for 2023-09-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  9  |  6  |  0  | 15  |
  2023.05.x  |  6  |  7  |  0  | 13  |
  2023.08.x  |  5  |  2  |  0  |  7  |
    master   | 41  | 53  |  0  | 94  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.4.14 | 6 
                       unknown | 6 
                  boost-1.83.0 | 2 
                bpftool-v7.1.0 | 2 
                     file-5.45 | 2 
  gobject-introspection-1.76.1 | 2 
              libarchive-3.7.2 | 2 
             stress-ng-0.15.07 | 2 
             util-linux-2.39.2 | 2 
                 agentpp-4.6.0 | 1 
               apcupsd-3.14.14 | 1 
                   bird-2.0.12 | 1 
             bluez5_utils-5.68 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  clang-15.0.3 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              e2fsprogs-1.47.0 | 1 
                 erlang-26.0.2 | 1 
google-breakpad-c85eb4a59b6... | 1 
                   grpc-1.51.1 | 1 
                 highway-1.0.3 | 1 
               libglib2-2.76.1 | 1 
                   luvi-2.14.0 | 1 
                  motion-4.5.1 | 1 
                oprofile-1.4.0 | 1 
                     pv-1.6.20 | 1 
                     squid-6.2 | 1 
             strongswan-5.9.11 | 1 
             tpm-tools-1.3.9.1 | 1 
                   uhd-4.3.0.0 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 
               xwayland-23.1.1 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f272473e7b588f5390b183072935a0217290ee4e |     
microblazeel |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d9190effc8da81578fc7f97b2781c1989283a076 |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2583993b21a7b076fe487b4ef0fe3dacbd1c3f8a |     
    sh4      |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/be0df099a9062c134004ed26ebe366337d5e1d72 |     
    or1k     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/fc7bf57d4234063a13f10ec229403c15f2b459aa |     
    or1k     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/8a8db3fa29f30eb26b0a036606a8c2211dffcd1d |     
  aarch64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/b906210d0d54da9de81c047c24af9ae7c6f66153 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/7a3b0640448b611254a71406bd426574bf32e238 |     
    i686     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/7327a6c08fe1f160c2580da5b3d80e3fc9c67bc7 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/af527088b1bccad322f154ce1787d0fc6fd6e2c8 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ccc3c48dd0f79e5a4eb920bcfdbf0569e394a4bc | ORPH
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/13b0644e0eab5d516f6c422915e84bff4b564b5e |     
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/eafe295c5bed74afd0957a01d65ff06d1265e232 | ORPH
    arm      |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/6029aa4c868e01c391b6346601016df3932e564f | ORPH
  aarch64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/00e8486b1c07d356a8a29f194e29476e98ab4f83 |     
    i586     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/1285f672ec8e1cbfd5356cd70e8424b682a84568 | ORPH
   armeb     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/ba550e1447a90a339b0bbb7a4e39df20ca798269 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3b66af61bd99fbd73d254bed1c939b8f1d425105 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3d157b1fb75d9c7cd4ba9cac93f884df0135fa98 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/1f2fcde2484137915395831c7620299301cc2929 |     
  mips64el   |          grpc-1.51.1           | NOK | http://autobuild.buildroot.net/results/e81aa247e20ae34332ceef4cf6b4dae476dfbba0 |     
 aarch64_be  |         highway-1.0.3          | NOK | http://autobuild.buildroot.net/results/a8c0e1845402d739ad32af63d65822d31f7df578 |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/017e2ae8583e1fc25c77119264f2fc67c394edba |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/f660ccc2603d37a76d0e93d9ce1b6a63a7801755 |     
    arm      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/cfe15c746a321bec0878a1179c5e50d2745377a6 |     
   mips64    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/e690e10845e7576ad3dd66b237c23f73fddb1038 | ORPH
 powerpc64   |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/edce5ea05d56643ec5cafb72cd60db878ff60fca | ORPH
  riscv32    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/1856b7babc38146ab4478f141e6d7abc978dc615 | ORPH
  powerpc    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/5d7e36e08556239869cd0f959b4e88c6d328ba70 | ORPH
  riscv32    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/66be3dd18ee1fcd5fa90ef3216f132b5253bff4b | ORPH
 powerpc64   |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/7dcc8044916c58c24c1e715dcbca8b12cff72071 | ORPH
  aarch64    |          luvi-2.14.0           | NOK | http://autobuild.buildroot.net/results/ab41159f2a8b493fc9787d47c8a3cac6b2456461 | ORPH
 microblaze  |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/a045266fcab23d735caadb3c7324517ed6a2b033 |     
    arm      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/af9a2d52823a332b48e6df14d2708b6a4b3833a4 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/6cee8cde975330cbb66e22b1601e4d057a01d8ff | ORPH
  aarch64    |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/eae17381a6b7bb629da7981058afbe4ed2bf4c7f | ORPH
   s390x     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/4414e4e81f2ab7545c289da6ff0e3b7a53446302 |     
   mipsel    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/0c1d2ef59b88ebb3ae10bf8cb986280b4c1283eb |     
  riscv32    |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/8b8fbe58685296c0cf4c435530ba8f28ad97dced |     
    sh4a     |       tpm-tools-1.3.9.1        | NOK | http://autobuild.buildroot.net/results/0aed5c470874916c7a4d4414b19628788b49757a |     
    mips     |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/0a209db09cc27d306c85e770085d3eaf8c19a807 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/30ab794e2a8b5f023487e7a95d3b1701ecef7856 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/944b9e345b89e750e89509637543e4fb606c3883 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/02f397b9a6edf8c04b7b097e9e532460cba4bc6c |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/9690069118d875f7cfa3bc57ba0d114b1c3c1f0e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/828e71541f31cf3609b3cf07899f3032caa135ba |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/438b5c221bd7ee494915a6832dde3941e8bb0e76 |     
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/c3d38d92557ee9e59b717b85f6307810d5de1487 | ORPH
    i686     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/4a9415e7a52a07339f7180dbb1cd616c19ae08b8 | ORPH
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5bd60a843f9b62176616ba9fd62f0f456e6c1168 | ORPH
    sh4a     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5cf5e3e8e74edfb747f6d7c40270d2b9cf3713e8 |     
   sh4aeb    |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/303cb0e51ea459025e14ecfc4b1b869ee4e6c396 |     
  sparc64    |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/665b246a4bb14480152ee59050672a7469148a5b |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
                mongodb-4.2.18 | 1 
                   perl-5.36.0 | 1 
                    qemu-7.2.1 | 1 
    xserver_xorg-server-21.1.8 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b3b19bd17c2aad489ba19a1062b0a886930f98ec | ORPH
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d890ccfefde62efd4595f47ee5ddaa00313d0286 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/68d1b00bfbbdf2549d28c410a992331d75c25b94 |     
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/2dcf2f7c468437ec618bfe8d42961fb4f894a0c4 |     
   x86_64    |           qemu-7.2.1           | NOK | http://autobuild.buildroot.net/results/ef5fb65b9d40b3ecea42bf95c46da92689414f76 |     
microblazeel |   xserver_xorg-server-21.1.8   | NOK | http://autobuild.buildroot.net/results/1fa65f7936eb91250298cfd10ac002c0a00d0fd1 | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                elfutils-0.186 | 2 
                 coreutils-9.3 | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.38 | 1 
               host-runc-1.1.7 | 1 
               libcap-ng-0.8.3 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/700d9cd3f354988e886a4deef0df8c6ff5e5bdcb | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/90e1a8991fb7c181088bc1ee2d865034122d2a76 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a60fa64ecf76e1265acb5fc99c314f24c1e120f8 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/737c4b766b16f1f7592c1f17d9c233760de381d9 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cd0f89a4ed46362168a71018ef9f99582409a7f2 |     
    arm      |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/d87f1efc9ac881f887e2980eb5dbb4c6c7adee56 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3b0e87a53c7bffa1a6507e9bf932a833faf5ad51 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

fs/oci/oci.mk:105: /home/bu... | 1 
             util-linux-2.39.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | fs/oci/oci.mk:105: /home/bu... | NOK | http://autobuild.buildroot.net/results/f4badc1df63df6cdef776bff167fd64c11ba0365 |     
    i686     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/9634ad3fab2930eeaab4b5e149fc4a3825dfef57 | ORPH


Gitlab CI results for 2023-09-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172218  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172244  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172287  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172246  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172293  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172407  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172445  | ORPH 
                 TestPigz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172494  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172502  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172503  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172633  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172576  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172592  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172595  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172618  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172629  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172637  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172666  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172681  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172694  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172701  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172747  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172857  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172921  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172924  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5108172928  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
