Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61CFC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 06:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1151660675;
	Tue,  2 Jan 2024 06:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1151660675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrNmbbo20wGj; Tue,  2 Jan 2024 06:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E80E460681;
	Tue,  2 Jan 2024 06:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E80E460681
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8CD1BF379
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 06:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03CBF40622
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 06:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03CBF40622
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id koROzhuGd9Pu for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 06:51:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FCE240620
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 06:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCE240620
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DFF71BF20B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 06:51:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 02 Jan 2024 06:51:10 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240102065116.03CBF40622@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704178270; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MDMiZvqkUd1ODicfqriN5r1h7ZQJJkgCfrHsvEif1F0=;
 b=LrIRzhdSwS9j1IdN9ebzoxmJjRVLTMVtEZ7qF3vrMnRgrbLa+2ECRX+zXWddQlw8bg0yvG
 n6l6Z8kyNbC7hbB8U/pCukOmNk2YKym0SOHOfeMVfYccIxtdeNfbBhCL5NplbZ9xYq87JU
 otq4R1d5Nazk7YR9dl470V76Nv3hKK4LspvTrNrGhmsD9NU6oVo2BbxaLeXoOpCkcnWHS/
 Rcs4z/QWjQg6kLsw8+OIRjbHJn9exBObhWgtkZlRUtPQIAVu/k0oFH7O/P63Ak7ZMMLojM
 ad15sSYtYJKfuelyswcxdObgAFQ5zbjl9aqRzGT4qo2hRYZIXWE5U1k4PjJxaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LrIRzhdS
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-01
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

Autobuild statistics for 2024-01-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  5  |  0  |  8  |
  2023.08.x  |  4  |  4  |  0  |  8  |
    master   |  7  | 24  |  0  | 31  |

Classification of failures by reason for master
-----------------------------------------------

                     exim-4.97 | 3 
                   linux-6.6.8 | 3 
              libopenssl-3.2.0 | 2 
                libressl-3.8.2 | 2 
                       unknown | 2 
           dmraid-1.0.0.rc16-3 | 1 
                    fcft-3.1.6 | 1 
                    gdal-3.6.2 | 1 
               gupnp-av-0.14.0 | 1 
              host-rust-1.74.1 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                   libiio-0.25 | 1 
               mariadb-10.11.6 | 1 
                    ncmpc-0.49 | 1 
                  procs-0.14.3 | 1 
        python-contourpy-1.1.0 | 1 
                python3-3.11.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/51bce20ca7381947d7ab455ea485ff4e0188d9b1 | ORPH
powerpc64le  |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/906319542f2b330f9234a5234c16853ca0386dff |     
microblazeel |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/4c0226aadae4079df87514a86d70da75ddd4048f |     
    or1k     |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/73c568e003bb4080d0ee78b221c1f42139ee085b |     
   arceb     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/9d372f7bd82fa2f83377f97acce60c12f09b31d8 |     
powerpc64le  |           gdal-3.6.2           | NOK | http://autobuild.buildroot.net/results/0ad0bfda841a8912ce4d12692ba2cbaa73af0285 |     
powerpc64le  |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/1d4b80dce152a0fb9c8fa55b61fa909dd3171f9d |     
powerpc64le  |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/836beafa1ccdf7bfe5abcfa589c7e9f751d8d24c |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d56bb8bf19e7d1149be53e844dfc1986fa4dacad |     
   nios2     |          libiio-0.25           | NOK | http://autobuild.buildroot.net/results/bee1f8b75c060020da83c70d46da93037dc7ad5c |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/a088ee21c9e5c57b32be7034a5bd9f84e4e01ded | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/9fd8763e159c1243048a28583d7d9aa8ff98c1b8 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0a01eea4f6362654ef4571ed1d4582eaaae6c91f | ORPH
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/87f9ca178987022d91692f00b5b30a9964eefde8 | ORPH
   sh4aeb    |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/f6d6b14f178212f14b37184fc248b8a3aad7f6be | ORPH
   armeb     |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/f05b924db61c5d036017cd372c1bbf6793010a71 | ORPH
    mips     |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/00edde60ab921537d3070393c4ab42f681ff12e6 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/a863c7a7127c437774c9b178c090803ecb2c0996 | ORPH
 microblaze  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/6c8d071f96243f63aea69593946924896c03f071 |     
   armeb     |          procs-0.14.3          | NOK | http://autobuild.buildroot.net/results/b42c49ed99dde06ea980686f280625a3f849623d |     
   nios2     |     python-contourpy-1.1.0     | NOK | http://autobuild.buildroot.net/results/d230b25da02871710968c06279f030c851506098 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/8d9c2b7676b0592f758ee424e17cdf16d080675e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/34e6449bc0af393e7dadb079f61ed3257a962a79 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/4e2cac76976c8cfa8781cb1783ecd437f7f817ec |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
               domoticz-2022.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                    libndp-1.8 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/484b0a101e509827381cde6e500baaad6dbe3a67 | ORPH
   mips64    |        domoticz-2022.2         | NOK | http://autobuild.buildroot.net/results/de50ec6cc5be9cd8a10b194f65533ece53b61c55 |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/39bf626cc0fac33e0bb12fa8ca63e4119568f5ac | ORPH
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/e8bde612099744e3d0a6ae33356b31fddff3682c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/b19b2bc6866d59a89f5f8b122f3045964d143fcf |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
               host-runc-1.1.7 | 1 
              host-rust-1.71.1 | 1 
              shellinabox-2.20 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3d549940d9a33342a5c6e3468d9f4dabf8721a55 | ORPH
  riscv64    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/0bc9b3033229b5679aee921200483424eb20e7ee |     
 powerpc64   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/af7028075ff65b0802ebbc4e550e95eb660c3cfc |     
  powerpc    |        shellinabox-2.20        | NOK | http://autobuild.buildroot.net/results/23ee6452cab47cdafbdf3766cfa01973c36941e2 |     


Gitlab CI results for 2024-01-01
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841852585  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841852728  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841852731  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841852732  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841852734  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841852736  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841852738  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841852592  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841853040  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841853321  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841853423  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841853440  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841853457  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841853468  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841853549  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841853598  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5841852679  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
