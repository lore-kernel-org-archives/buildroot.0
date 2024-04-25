Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EACC4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 04:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1349882344;
	Thu, 25 Apr 2024 04:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWwzn2ZODhVk; Thu, 25 Apr 2024 04:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6ADD82331
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6ADD82331;
	Thu, 25 Apr 2024 04:01:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65CB11BF303
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 04:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5024282331
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 04:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIaTDzIp4ITv for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 04:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77B2F8231E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77B2F8231E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77B2F8231E
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 04:01:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA390FF806
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 04:01:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 04:01:31 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714017691; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rjywJ0uijlTstxHpz9Kt208/BQk8sDH72jNnBRt1GLY=;
 b=HwFUVYIW69Oj1JfHyP2p7k8wv2XadzY9Cx0vChXMmlMCQuux7ajkcL6dGI3OT3PgWb6tBR
 Z1FmHUK/gCHkEFKPHSCphc2N2AUnOSoE+qbKe+/KyxZ3PU3pgIocYmKmSOTFwUT5/d9qpH
 x5WSmYFKccVXU6eX0ziK0xeP6/1dlg4EcnlYucI+leMoi9rohh9a89zF6podvU87/cd6RE
 1u6meGmhgZN6o/5s/Asc8g43Xna++Pp2rrPlR48e0KhEA2QjeOo47V2DtGM3RpiOIE3gws
 c5yyil1N6d7tXJTtJX25TsZbXy3aNIdzove6BP2Y3w5ywixdJ42txwGjqiqCXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HwFUVYIW
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-24
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
Message-ID: <20240425040131.1PwqNHf4U387cw2pISrbDyrTWfD3AEKF0MgLqfeJb6U@z>

Hello,

Autobuild statistics for 2024-04-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  5  |  0  |  8  |
    master   | 18  | 40  |  0  | 58  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
               apcupsd-3.14.14 | 3 
  gobject-introspection-1.76.1 | 3 
   host-flutter-sdk-bin-3.19.5 | 3 
                fail2ban-1.0.2 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  libsepol-3.5 | 2 
             stress-ng-0.17.07 | 2 
           at-spi2-core-2.50.0 | 1 
                     crun-1.12 | 1 
             docker-cli-26.0.0 | 1 
                     frr-8.5.4 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                haveged-1.9.18 | 1 
                libressl-3.8.4 | 1 
                 libv4l-1.24.1 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-6.8.1 | 1 
               mariadb-10.11.6 | 1 
                     mdadm-4.3 | 1 
                 minisign-0.11 | 1 
                mongodb-4.2.18 | 1 
                    ncmpc-0.49 | 1 
                    proj-9.3.0 | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
                    qemu-8.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cb860da9a0f8884c22eee090f790a322ae1c7e7b |     
powerpc64le  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a908e1ce13a7961e6807b808da6d7d53ac96a6b8 |     
 powerpc64   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/21511983ada3ac91d9cd9a7a3ace54433af92294 |     
   sparc     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/b930b5f3785bf2edb9cfaeeab5651368758046d0 |     
  mips64el   |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/463b56511826a505f5cb13027d928fa2d8c13c6a |     
  riscv64    |       docker-cli-26.0.0        | NOK | http://autobuild.buildroot.net/results/591a706d8ab08961dbe8aafa8bc2297a2da5188d |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7578aae102d3baf5b8d3cb07165a4e17e3fe9875 |     
   sparc     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/73572e36f9606a1f42f3ca5bca415774d0236fbb |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/1577e9093a9e83f83a6318d8c0e84750d5d8e23f |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/52aec75b0b6b30b23912d04b84048ae763f9d977 |     
    sh4      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9170ce7e418c04f89416b5874232a3ab3f69e62b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/def9782927e37f57cd9056be973c39e55b6ff327 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d2b40fc8b69930c2a3d79fc7b41fff47e58bedbd | ORPH
    or1k     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/293dc8ff113aa1e6bf54f956947cf17b05b3b2af |     
  aarch64    |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/d45b4baa6fb337b838ec97c38065a62937428bab |     
microblazeel |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/e8df070f36121356a9cbf92647f53a5bde46f026 |     
  powerpc    |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/e1a93b3dcc99cac89d6ba483f5b77f146de3d16b |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d9098c0dc9dba643cc26cf36f6439763401593b4 | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/131536516b43ac34f68b1b8d5e22c80f3f7db4e2 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/81c1d1856be291d9d4a871198f252f2364c32e62 | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/39bd6d20a3b681338919acee5813cbf64bc6b04e |     
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/eee91948fe00c31a97b6616796bfc0f1c070290d |     
   mipsel    |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/e28b51a09df0122887adfc57377212371227b109 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/173b1ec7b42cfb6fd525e5ac5560bff9fb8a5c0f | ORPH
  sparc64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/e96094e0f2db09a265ec653fd955e699b28166ce | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/021eda110ef183bf5f262ffd0e1b779a4494a79f | ORPH
  powerpc    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/158987e96afb895ae244b080ffee0e9b9fcf78bb | ORPH
    arm      |         minisign-0.11          | NOK | http://autobuild.buildroot.net/results/96bc47f74c7fb1b48092fbd96ab4bd7fbb9c3378 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/088d7f5e05b6dfe34d46d5ff3dd4600cc8477df6 |     
  riscv32    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/277aef3c108625895846cc5ec2a3e93ccffa9212 |     
 aarch64_be  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/d2dd3ab8bb30b088e1aaa9138199ed07fd6cedb2 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/76c599d7b7f17a96e6c8c537cd31117642c6f7f3 |     
    arm      |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/a6b3ebe8a68854079745fa04570057f0e6fc4abb |     
   mipsel    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/e2a45f8c87a636b0865bd1115f9e705a848a2bde |     
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/55a5c1abceda0083cb72a65dd35c59b89a5782af |     
    or1k     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/3206104d9faa00d1814e33e272bbc791aea31f0f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e5f6f59a724c563c1d492ba5056537fa79016c57 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/677512cd8582c8d84a5ab7e2b9576abb40aee7f5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7820bf603e3b1bebec4ed5d6ff1b60e57d0fc787 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/52ee53976f162463e24e96705e767b1d6f8dee4d |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
                    fcft-3.1.6 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
                privoxy-3.0.34 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/8bff3d83faefe24313ce98ae65988a17978b4f6f | ORPH
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/357e4079e4528113fb6fc69811fb4c1d59a1d2e6 |     
    arc      | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/c5745b1e3fbc55c82c4f52518d46fe0fa6aa24a1 |     
  aarch64    |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/cf83b44777987dde4a4deb933d221ddc2b8d5933 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2c11126006122608036723a4a95e097c5446b7f3 |     


Gitlab CI results for 2024-04-24
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703221868  | ORPH 
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222513  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222525  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703223499  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703223515  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222383  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222916  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222420  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222947  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222957  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703223025  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703223031  | ORPH 
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703223066  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6703223100  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
