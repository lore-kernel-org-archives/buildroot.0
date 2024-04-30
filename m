Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88936C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 03:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4C9608D1;
	Tue, 30 Apr 2024 03:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-DrSICo7JXc; Tue, 30 Apr 2024 03:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31FD4608BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31FD4608BA;
	Tue, 30 Apr 2024 03:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F13101BF419
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 03:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD3F54027A
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 03:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbYWgOIFKmOn for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 03:55:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97C69401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97C69401B1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97C69401B1
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 03:55:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EBC21BF205
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 03:55:21 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 03:55:21 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714449321; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hrFepzmc+W5xiLeaO6VYKyUHg5CkmnCvCPbHws0LdII=;
 b=jSm8u9gFKr95SEEk6M+fNqKAlIYi1RgMgYXdmujbzaYB2WxfZkFJBVr6jjaXhApplwBYE3
 77/+5FXW8hgApW+4zQNdEBfndpD7gPR32iduMIIQrdjaR8LIqMPki/PdPdICHvPJQBZcsp
 JiRPO9mrtCu1SIUk3KYwGgLbylTf3n8jozELZTVhmK+TRlWe3qayu9JGhFizXi0HEGwUfl
 trQbcSXpfbO4mdYCDPfDMc5ONp1B412n2yFGwQNB4zcjPL3TqgbDQo1MexIspChfQz/QlJ
 IXb3/Ycgac5pNxUvcel2SWo9yAAzF+rSTAkkcaUdH85gN9y9XaeymkDniS3+TQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jSm8u9gF
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-29
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
Message-ID: <20240430035521.hEAXOtAO7nAxtEphB_BCr5d0gWE-uDsRHMcX6T4zUWo@z>

Hello,

Autobuild statistics for 2024-04-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  7  |  0  | 12  |
    master   | 19  | 39  |  1  | 59  |

Classification of failures by reason for master
-----------------------------------------------

host-heimdal-f4faaeaba371ff... | 4 
               apcupsd-3.14.14 | 3 
                elfutils-0.189 | 3 
           dmraid-1.0.0.rc16-3 | 2 
         host-libxcrypt-4.4.36 | 2 
          libcamera-apps-1.2.1 | 2 
               valgrind-3.22.0 | 2 
               asterisk-20.7.0 | 1 
                    bcc-0.29.1 | 1 
                  bitcoin-26.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                     efivar-39 | 1 
                fail2ban-1.0.2 | 1 
                    fcft-3.1.6 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
              host-rust-1.74.1 | 1 
              libarchive-3.7.2 | 1 
              libopenssl-3.2.1 | 1 
                libressl-3.8.4 | 1 
                   linux-6.8.6 | 1 
                     mdadm-4.3 | 1 
package/python-pillow/pytho... | 1 
                    pppd-2.5.0 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
                   rauc-1.11.3 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ca8fd116d21101df244408f6bb45ee60700acfcb |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/88aea5ffa473250de68f3476b46f721a0856179b |     
powerpc64le  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/db6d6e200dcad15a2d9ca6ea707d2423cf08a700 |     
   mipsel    |        asterisk-20.7.0         | NOK | http://autobuild.buildroot.net/results/7bed9fc68fc9331ad12942c3eab9742ee8a7a4c4 |     
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/6479830921673e6334119fddc85d52a72286dd59 |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/22aeb0f90c37615c0333e3396ed2d8885d702359 |     
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/2af39bd6ad34a2e2c4e7c82c69f3058d4615fc45 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/09036840cfe8794816ef05636e7fbddd76d8a0d3 | ORPH
   xtensa    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/a42f97a17657ec1a42e1d15df19a33a6f525bb5b | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/5bd35912da9cdb8499912f752dca928c136531fa | ORPH
    i586     |           efivar-39            | NOK | http://autobuild.buildroot.net/results/c6b2aa5aa122686639aa8d95ba66db6e3db2dca8 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c669664f7c6bd1d517ad40d8fe6719e6e7a2743b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/454102146398e91916b7c0b2e213d27823fefd6c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/dcb7ef0b387ab8caa6ba58bba81a3b0fc8169423 | ORPH
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/774becde07d8b4e95671b7f0f641f95f925e0414 |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/d9e70ff23b03014315d5fd11f385b6732e524bfa |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/bfed6ee203398bd22833408a31f9809ac7edd6b0 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1662110ea76edb5bb3aacd4eba6304848e89d62e |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/355221a38cc66775fb061d9e11f6feb1b78983d9 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0aaa02ab9fa4a4a7d0bfe6d4be96121ef0867b7c | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/50cdbb9e035201c92dae1b6840e4da15f8d35445 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ce80e13a91dcc1d6b6337d14eb3caf08db6ffdf1 | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/9e8df85ba59b113808b5658fc54d1c085b94214e |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/299519e071c82de9023aa5929031064d34e820a4 |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/cd45e8ad48e42437993b1375bd5cd24d2c83af5e |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/e065b4fde304d3b619d67e4d27a9cce1d04f5163 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/282335f500fc4a26f19d5378f89e92bf3d63252b |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f743887838ffb354c7570df6c4ec3576734ff372 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/b56236713eedb3968b5ba0ef7d574167ddc36430 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/45a19412c1b1790a94955cf493b93f8a38d767d2 | ORPH
  sparc64    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/9473cea81121d83d18542928907959c78c35c5cd | ORPH
    arm      |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/35e342aaa5a214cddff2c038335f3bc9ef6defe9 | ORPH
 aarch64_be  | package/python-pillow/pytho... | NOK | http://autobuild.buildroot.net/results/1b4ad24174ff189114ccf9cf15f49404d7ea28c0 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/cf1dd9271bd2c3db14970df34b1ab0fda729ea3b |     
  riscv32    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/7b0fec4f532ea92eadbcb0fe0d58e4416e82be18 |     
   xtensa    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/59079fe1c3e27645409d11f373249474be5d19b8 |     
    i586     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/80245d1d4d10afa412abb999c22ab202d6ace978 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/bd09b12b54ca13fe3aa70440a087e03189c0ce7a |     
  powerpc    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/3a2f9614e7ff0a88089b5a9c7bc4ca5f4c5536b4 | ORPH
    mips     |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/5f27d9a22d82064942ddb21e32ecbf2bd0f14772 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                     crun-1.12 | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.74.1 | 1 
package/crucible/crucible.m... | 1 
                    pppd-2.5.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e3ccf16bcd269955076e4d21eba9fdc75d99a0f7 |     
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/8dabf8dc7e63e012546cd58381c4a3ff97297611 |     
    sh4      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c1427d6166e4366433290382d43dd2d4b08c022b | ORPH
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/7f812c1ab00ceff5f4ce3fc554224d32af110b9c |     
   s390x     | package/crucible/crucible.m... | NOK | http://autobuild.buildroot.net/results/941ef597e2a190d1ee62561bdaabdcef953347bd |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/674549818e032da392e173720537c96d91380b36 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/779c165111bbb9e255edfe60a45377899e27144f |     


Gitlab CI results for 2024-04-29
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735653712  | ORPH 
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654106  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654116  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735655444  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735655449  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735653955  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654425  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735653982  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654486  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654506  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654672  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654682  | ORPH 
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654737  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654788  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
