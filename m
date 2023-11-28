Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68006C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 06:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF99881C81;
	Tue, 28 Nov 2023 06:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF99881C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bojDoWhRR3dd; Tue, 28 Nov 2023 06:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C081981CA0;
	Tue, 28 Nov 2023 06:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C081981CA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 729A61BF338
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 06:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AF8241365
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 06:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF8241365
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HaubqChRPtaM for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 06:40:47 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0CC5410E5
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 06:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CC5410E5
Received: by mail.gandi.net (Postfix) with ESMTPSA id C944CE000A
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 06:40:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 06:40:43 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231128064049.0AF8241365@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1701153643; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1r4Zr0lFJEVmvH30AYud6wTDx5KI/DFbhsigoxoics0=;
 b=n9pSdCAhs1wP7HRPer1BgusyAot3TQ45C0GnNNCIIbJTKbvB7kz2AEXmfS6TZTnd0ZiKQ4
 0Pr2D5kyZpkW+ByNwM127doXeo6+qvMgt5Bn4K8Jm63bt+0oadLFprWtGx3Irekgn9HTg1
 orGBC9b/iUJd2KByRqa+qrJ7Bhl7AWbwqLu84tcXN4o7X/3XlPaMWDJJn3ftJywbgWNJqr
 MZCWsjE6EXec9DoiRTf7m0CcMKpgWurbGHr8mp6NZP9qAP8E/gDb7ct5pEInHjPIQlveCF
 52bn2MmyZiiLeruDID+LUjoLv0HZw0+Kod1BQHohESsnYF6lxwIyCPfvqksa0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n9pSdCAh
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-27
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

Autobuild statistics for 2023-11-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  2  |  0  |  5  |
  2023.08.x  |  5  |  2  |  0  |  7  |
    master   | 50  | 43  |  2  | 95  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 8 
              host-rust-1.71.1 | 3 
                       unknown | 3 
glibc-2.38-27-g750a45a78390... | 2 
  gobject-introspection-1.76.1 | 2 
            host-erlang-26.0.2 | 2 
                   linux-6.6.1 | 2 
                   openrc-0.51 | 2 
                  acpid-2.0.34 | 1 
  binutils-arc-2020.09-release | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
          cryptodev-linux-1.13 | 1 
                   duma-2.5.15 | 1 
                     file-5.45 | 1 
         gobject-introspection | 1 
                     gsl-2.7.1 | 1 
         host-gcc-final-12.3.0 | 1 
                host-go-1.21.4 | 1 
          imagemagick-7.1.0-51 | 1 
           libfreeimage-3.18.0 | 1 
                libselinux-3.5 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
              liquid-dsp-1.5.0 | 1 
                  motion-4.5.1 | 1 
                    mpv-0.35.1 | 1 
                  nginx-1.24.0 | 1 
         openfpgaloader-0.10.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/7f7c36269e0fdb05630a77b3c3b95ec2874aef55 | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/677cdca6886bc48690b13dca1997653c8980c4cf |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d9606604b6dbb73461f71958814cda8ffe17f957 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a247436c4840aa7cdf8668451e7d69330f3df597 | ORPH
    or1k     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/8c67e0cc0f5aa653b31c5dc38b2b228f7010260e | ORPH
    mips     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/c20e8a60ae115219da0d290867d9d76a6a209519 | ORPH
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/5314459347b79cbda8c7c9b2ee7a987be82297da | ORPH
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/e791f9c2c180b3350852754b0f3c811206e7cf23 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/7d54277971d174e7012428017029f8c6fa87c9c0 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2d506ee9141812b47c76b3e80df30731fe99657d |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/90efdf9a3d98af3c8638baf96541ff6f3d263536 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2bf612c2f1ae792e0395343106718db536230476 | ORPH
    m68k     |           gsl-2.7.1            | NOK | http://autobuild.buildroot.net/results/e59636f6ac148807c1c67f09eef0e0a9f5d52303 | ORPH
   x86_64    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/30e0b1101e6bd8686e4e54f6d95361103ef0c88d |     
  sparc64    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/261e6955f9ae9b500ea76e6e6b3a87db5f6d5dd2 |     
  powerpc    |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/7c4d23f89c0e2318ec35392eaf8c17f1cecf65e2 |     
   mips64    |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/4ede22ef7c1631a37a645947d82c315b12aed6f5 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/47c942daf55a05ee8bbb702d18cccd44eeb8d921 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8b1fb108d80c50f8132253a3a829bbfab4b2f4bf |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/594a00e788721c8cfa1cec07b67e6de1bd59861e |     
   sh4aeb    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/659f90e745da4cc6e6cba06af72a3d3bb5f915a3 | ORPH
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9260a71a6e25ff44f124f4d6598f1b6b16cae7fe |     
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e64e20a25c5a39980a704906fd7bfd3c136b8fbc | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/057eeb77f97818dec8ecbf4f226ae9fda7b723e8 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/789f029dab27d56216901546db60aca1c6749b04 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/99a250a503c98f96dde9de7387a0a7596d9bd8e0 | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/707d2118ec7261df57b85b56cdb2cf84a7a82ad7 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/55ce97fa3b84e5106599eebcc1a4d2e57f07d709 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ef9fc5502fd539b3bdb4f26d5c408c5319a405a4 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0b76a3a0ad93402cd2a59e4002ea645167269f21 | ORPH
   sh4aeb    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/840f3c6d8de8a75625bf185f13bfa58ee5661dd7 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/c405ce77d6a7afd0d39d2a1f165070d6838cac32 | ORPH
    i586     |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/b6677010f44685c266e94c06c90341233428887b | ORPH
   armeb     |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/4c26ed482aac38cf9c40484efbd632b9e78198f6 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/7140f045bbabb95edcb2b110061e890d3ab0edbd | ORPH
    i686     |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/edebc9f379c7908c8fdc0518388b40673c8189e7 |     
 aarch64_be  |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/9b859a701debeaddf1f9909e16adc6811a620576 |     
    sh4a     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/e69f4c5423dc88743be9a872d146e5646a5e34a4 |     
   arceb     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/d3b7448cbcddc93d2fc2317278f74e84a2f9433f |     
powerpc64le  |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/ee89dcc7430079195e2e9ff300e1320de848d3e3 |     
  powerpc    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/733afd88b1bd7950257152810960f15dfd05edf3 |     
   xtensa    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/494ef392a971ddb3c5c7b01e0149c6439018dbe7 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/828f12f864cfee622c32afa2041b64cbebeb6532 |     
microblazeel |            unknown             | TIM | http://autobuild.buildroot.net/results/7f2b0cb9cd44aa11aa4c905fdbbe69ba1e659070 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4d7f0d2f458879da82535c62bda4fe08e6a1dff6 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 fdk-aac-2.0.2 | 1 
                  reaver-1.6.6 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/79d511d49d51c1e92d9df90cd87f542b70a01a7f |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/dd7f7b35f9b296412559f866226ee30b5b320aff |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                  linux-6.4.16 | 1 
        ltp-testsuite-20230127 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/f3c80d57739c5d8cebf7b45809ac084d55feb2fc | ORPH
 aarch64_be  |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/28ec42c8d44b99ba57dbf8c9ba14cf0982f3f938 |     


Gitlab CI results for 2023-11-27
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788688  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788690  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788691  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788693  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788694  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788697  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788832  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788861  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788884  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788909  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788888  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620788913  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789011  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789061  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789062  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789170  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789080  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789094  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789096  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789107  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789118  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789135  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789146  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789164  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789165  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789172  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789178  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789181  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789188  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789195  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789200  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789213  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5620789242  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
