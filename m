Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F525C46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 06:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D485813A6;
	Tue, 26 Dec 2023 06:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D485813A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PC3WtobP4DZZ; Tue, 26 Dec 2023 06:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F04C813AD;
	Tue, 26 Dec 2023 06:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F04C813AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77B851BF2A4
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 06:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A68340518
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 06:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A68340518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3ihdbsn_Gd5 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 06:56:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14903400CE
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 06:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14903400CE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21016E0008
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 06:56:28 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 06:56:28 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231226065633.3A68340518@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703573788; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qn8S9ZaoofI0pt43xPOwfOfPoHBjy8VL4s/o8QrQPRs=;
 b=XOIOI53yS37rsaFtns8hwGeSSRxKU1dXjG5o4tn2arvFjkhe1mG9XYBVqA7f1lLhQs5InD
 hNyw4lwFNwdKVJLnLtPVya7Y7xrJAYSvMxwv/n5Pqze0vYhNSyqAftdDd1BKGzGuSceC7A
 YJz95A2SKuy9UKFsKRO5RzNU68eucAhShnffchXwZdHOD1rCn1DWOv+ycU057KZM2sdVgw
 dH6PZnkJ6ZelWYBFv8wYP+tFL/9fIzWzyO2xS3SFtKK21P3GSMt8QZCB1cMxWK3716+O7B
 z6LXikXLqtB9QrVCT2vbrMxgllgUpwCb8C2gGvPruswJGUOyZ5vs9mBQDZVW1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XOIOI53y
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-25
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

Autobuild statistics for 2023-12-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  6  |  0  |  8  |
  2023.08.x  |  3  |  1  |  0  |  4  |
    master   |  6  | 31  |  1  | 38  |

Classification of failures by reason for master
-----------------------------------------------

                flickcurl-1.26 | 5 
                libsoup-2.74.3 | 5 
                libressl-3.8.2 | 3 
                       unknown | 3 
                host-go-1.21.5 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
              libopenssl-3.2.0 | 2 
                   linux-6.6.8 | 2 
                        ffmpeg | 1 
                     file-5.45 | 1 
                   foot-1.16.2 | 1 
  gobject-introspection-1.76.1 | 1 
              iputils-20231222 | 1 
               libglib2-2.76.1 | 1 
                 openssh-9.6p1 | 1 
               trace-cmd-2.9.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/3fae966ef195c22d3fa5bc09bb6b41c0200f2da4 |     
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/7aa57d0a5d5893660f0bd76966281dfa61f6271a | ORPH
   mips64    |         flickcurl-1.26         | NOK | http://autobuild.buildroot.net/results/f22b84d530fcd9662ef102a90ea4f585cee27b5c |     
   armeb     |         flickcurl-1.26         | NOK | http://autobuild.buildroot.net/results/5306e5b5d98250622747c2361b442e4882ba4fe1 |     
   armeb     |         flickcurl-1.26         | NOK | http://autobuild.buildroot.net/results/a4e50ed64c89300a5f73a2fea6f640543ece545d |     
    arm      |         flickcurl-1.26         | NOK | http://autobuild.buildroot.net/results/34d6f6c02f884ab9a2578a38ee8646e14632d6ff |     
  aarch64    |         flickcurl-1.26         | NOK | http://autobuild.buildroot.net/results/29f8c97059b5a11208d81bfccc10cf24d7edf5a8 |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/2965ec92a77165eababee49efa814172a586b6a4 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/033fdf9842de51b7376c32951de3a885c5577a75 | ORPH
   mips64    |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/fa04a3b837f7e7bcbbb4af15b0e5ff38b5ca23e6 |     
  mips64el   |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/9396c0214793653beed26581ab84078a713ea086 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/260b572aafd77f223c453dbee62a33e72cef37d8 |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/07051facb29d2d04b0a997774737880b80862e39 |     
   arceb     |        iputils-20231222        | NOK | http://autobuild.buildroot.net/results/e9b39e142d5f56bf589253a10ed4722dbbda375c |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9e29de7b1aec814ff9b1dca5fb17353b4784feac |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/c16760d4681c563c97add5fb28c1b593b0708c65 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/c1de85565b3e3cce2f661dbf2e26fb003d963801 | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/bfbe058109c3cafafddcf6a89cfdd898148d20f2 | ORPH
   armeb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8b14b89bace87d38fbddd7d0bef5a26f9786bbbe | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/31f7464dbca2c6ac31e59037f04281b600050e16 | ORPH
   armeb     |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/4c3152720d64b204101e1611442e535b14adc41c |     
   nios2     |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/e17fbd0ce28b0641257bc25679f1f9c6e43e004b |     
powerpc64le  |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/e4fc4f7311c7361fa2f8d4074d3d7ee556ea061b |     
  sparc64    |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/07b3ec36e5a60a5f7ae77dbdb83d4065385be232 |     
    i686     |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/535ffc3244314cb2ec23d79b8dbf8322b370df41 |     
   nios2     |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/1a6464c4388c8886d62b095e9f590c6921903620 | ORPH
    m68k     |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/465be0752c85199a5adaecccb2515d122946bda4 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/f71788b720628c5a7e15a28ebdaeb457f87a1214 | ORPH
  aarch64    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/d7c684593103a3e771276a630c50c87ed65d4274 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/ec559a048a39c1afbb63878d505c481f7e9e4c15 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/fb435962c53798e31863d80e38730ec6393d722a |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/3722595e6bf17956270022be61e62dd6bf48813f |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 raptor-2.0.15 | 2 
            host-binutils-2.38 | 1 
              host-rust-1.67.1 | 1 
                mongodb-4.2.18 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8b7345795cb497825ee79a114d27d1c93be2073d |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/e166d5684bb26615feb8e4d90f40ab76fb232c7d |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/382ce20125203cbc2f765caf60a33e5d4f9da23c |     
   armeb     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/c6633a0c4e5d88c0b1d7fb4735c744c2f7a822e3 | ORPH
   mips64    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/232f07aa1ae6ac487ef2c41f30a2438a68b86e2f | ORPH
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/f88fa92399ad7bcd4d073d1e6dd1867013a40418 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                alsa-lib-1.2.9 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/a643ca9c11c3fe1a1f71a8ea2f647c364958d8fa |     


Gitlab CI results for 2023-12-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416036  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416212  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416218  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416222  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416228  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416232  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416236  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416041  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416384  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416411  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416428  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416445  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416430  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416446  | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416510  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416516  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416648  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416584  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416596  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416599  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416608  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416613  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416618  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416631  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416641  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416644  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416650  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416657  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416661  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416667  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416672  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416678  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416687  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416135  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5818416725  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
