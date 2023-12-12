Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92964C4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 06:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0AD3614C8;
	Tue, 12 Dec 2023 06:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0AD3614C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5X1qheMooit9; Tue, 12 Dec 2023 06:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1DBD61011;
	Tue, 12 Dec 2023 06:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1DBD61011
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83D061BF2CF
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 06:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3710D61011
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 06:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3710D61011
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evgWzbEaX4Lz for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 06:44:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BF6160F48
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 06:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BF6160F48
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22A8A1BF208
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 06:44:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 06:44:29 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231212064435.3710D61011@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702363470; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s4nmx/bUtsufgrMZSAw1J7mw2EVC+QqgrzygDrWfvuY=;
 b=RrQ0LapSuCdTxX8YAcFeiA0GVUaVujsASRFOBs2YXOlINo+HBAT1Izd36OPr8GZfefkZ4h
 K28gKBVb4H3vk1OUo2JTKkHMhwSeIud26mn7ZFGJstxs3h3zvY7OVICJbL6OWWkn4SO3I9
 nkj7BwiYYtlit0d9dK00xMtCLWkYJ3HyZGGQY+x8G5K4/U4jj8heqdIWzIwmWFWm8p/3fi
 Lmo2dRZhOMPoLPr/HL9ebJ91jxSPdmJUaOFdTclTwZ5ngIBy3gfI3XIqwB9rxq4WVlrKpY
 uYM5/ESfEsRxRSqoQxrftx5zVLL6oOFqz98AiH9TKCgTBux9k85xgQ1apyUrKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RrQ0LapS
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-11
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

Autobuild statistics for 2023-12-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  0  |  0  |  5  |
  2023.08.x  |  1  |  4  |  0  |  5  |
    master   | 57  | 33  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 3 
                elfutils-0.189 | 2 
host-go-bootstrap-stage2-1.... | 2 
              host-rust-1.71.1 | 2 
               libglib2-2.76.1 | 2 
                memtest86-6.20 | 2 
                       unknown | 2 
                    bat-0.23.0 | 1 
                   bullet-3.21 | 1 
check-11970a7e112dfe243a2e6... | 1 
           crucible-2023.04.12 | 1 
           dmraid-1.0.0.rc16-3 | 1 
        edk2-edk2-stable202308 | 1 
                     file-5.45 | 1 
glibc-2.38-27-g750a45a78390... | 1 
             glibmm2_66-2.66.6 | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.21.5 | 1 
                 libcurl-8.5.0 | 1 
               libunwind-1.6.2 | 1 
                   linux-6.6.3 | 1 
                nushell-0.85.0 | 1 
               pulseaudio-16.1 | 1 
         python-rpds-py-0.12.0 | 1 
               trace-cmd-2.9.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/0ce64ef60d4ea0919f7b1f3437a20f80891da4eb |     
    or1k     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/008bdcf1b4d97eb89def511c23ad35cb55f1fa39 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3cfffa83c7b7fa33cfe8b35249b4730017bb5acc | ORPH
  riscv64    |      crucible-2023.04.12       | NOK | http://autobuild.buildroot.net/results/93bbf7b9e08203fee95ac14d7124d5decfd8a7ff |     
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/6b00a9b771554e7686e50a3dbf98998427bbd62d | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/c24dd4bcffd199c476ee4a23b26fbb6c45894c9f |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0359b791900eadaf3925a42069198eb63e3cd3b1 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/08e984600c988d1cdb1da27ac0119c0495081769 | ORPH
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/e8aba99d6a3a258637fcc6abbe0d8689c89f7718 | ORPH
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/0df936b6bd08ffa7cbb6dae81391fc0b235aa310 |     
   sparc     |       glibmm2_66-2.66.6        | NOK | http://autobuild.buildroot.net/results/acca856b32d95ee15c3349d8fe50fa6b5cf957b3 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b66d9f140ee966e909c816e36cffc0cdbf99525a | ORPH
microblazeel |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/a89101b5967610f501b7e9be379145c2b5cfb2a1 |     
  aarch64    | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/0f087e4e1e3a418f5a0d94859de33cfd6d825cae |     
   arceb     | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/38ad04ead6b30883ff191281917afc976498ccc7 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c61118100dc91fd571d22c2b28ea96ff4950df44 |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/70342fdf9e67f0eee98904e764ecc04aaba464be |     
   mipsel    |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/b0770c73d57c9db8b4fead92537d3aa0fd3897ae |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/8ec4403ba87051d0df1bd822c2169bc336dea4e2 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e60d2c053953bb086f1bb3ec2394095fc9820dfe |     
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8efe1d9094ececcf8134fd9a37ff1cf51d81b5e0 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c85367b19ebf72b45557ebdc18e566484297c0fc | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9451fcb1a2b00f1203dac3f2e4d21df77475c5c2 | ORPH
    or1k     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/50dfc899e5ef96c93a61a25fea12e1cb5a862479 | ORPH
   armeb     |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/ac7e866cc3c92fe198ca41bb383bb6b0de760bc7 | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/7faa045e2e74776633af0597ef80dcb65d4b07c4 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/2215f07369f4f1e0f67303fd6274e27c0cec18ae |     
   mipsel    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/56f80d2771e1040aabcf343b2ee1f1e9a23e6361 |     
    arm      |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/a74458f764d4414b03d360a39935fec2cf23a34a | ORPH
  powerpc    |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/94a10913f6a79b7999f824662641d0be040e62b3 |     
powerpc64le  |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/5e63f8114697253f70fcdca2b4197ffb7f53a258 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d42114c84101f16fbc9107a62576efbb1823d5d0 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/fc16d05d4a5fda8dc85bf1be0390cf9461f6af49 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                     efivar-38 | 1 
               host-go-1.20.11 | 1 
         host-sentry-cli-2.8.0 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/06e3af49989d814cdf6d71cddf91f720626bbda4 |     
  mips64el   |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/e1af0f2542c4d53961f8d958a9a80c8cf5993454 |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d47283e0b7316f6dbe42419ff3a9b15d9833f7e8 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b25b031d0d17ad1794d0d4efa2c78ad22ebc615e |     


Gitlab CI results for 2023-12-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172178  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172341  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172345  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172353  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172360  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172365  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172370  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172181  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174562  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172951  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722173090  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722173159  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722173247  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722173162  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722173473  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722173745  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174125  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722173954  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174001  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174005  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174023  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174035  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174058  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174071  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174077  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174102  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174104  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174129  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174148  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174157  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174175  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174190  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174204  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174226  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722172266  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174378  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/5722174425  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
