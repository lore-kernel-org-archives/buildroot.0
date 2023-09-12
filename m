Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FB5CA0EC3
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FFDB81FA9;
	Tue, 12 Sep 2023 06:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FFDB81FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3u6GeYBc48u; Tue, 12 Sep 2023 06:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5369981FA1;
	Tue, 12 Sep 2023 06:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5369981FA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAAD41BF36F
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F03D610C3
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F03D610C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4gcqTh69MsD for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:55:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 549D760AEB
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 549D760AEB
Received: by mail.gandi.net (Postfix) with ESMTPSA id B08A21C0022
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:54:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 06:54:17 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230912065503.3F03D610C3@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694501699; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SLJfPcwh69Cup06vh+rmYG8VOYukKae+JlEen8wcJjo=;
 b=m79N4YdOuHG7tNBePvDdbBr1VMSV/suXYwoprw+LQJbZiOgF3ONBSLGsCYl+vRtniCYmt7
 9sRA96S0IkmHwg3Eu5uMZI5hTH//WfGcVj9kcpGMHN4mnO3rdhkaxyk3WF0mOQtoV+uZPI
 qdSoF66PYCVyGzKerhn3HKho/u67IZZs1l8PlNPc09FeLIHzrZjeTCiW14ee9q3oU09D5E
 fotWfsVuBi8aURRnqazEKwHQt/WVox9QGRfqqK7SawZ2SUegQugasw2VwKJUMp57GNGM7P
 h5yBe4cRtGCkk/sbFHRm0d3uvI/VRIf1MFz/cq2XZJuqjK3Ec0SqWU90Fud36w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m79N4YdO
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-11
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

Autobuild statistics for 2023-09-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  2  |  0  |  5  |
  2023.05.x  |  4  |  2  |  0  |  6  |
  2023.08.x  |  3  |  3  |  0  |  6  |
    master   | 39  | 38  |  3  | 80  |

Classification of failures by reason for master
-----------------------------------------------

              libxcrypt-4.4.36 | 5 
              host-rust-1.71.1 | 4 
                  linux-6.4.14 | 4 
         gobject-introspection | 3 
            host-erlang-26.0.2 | 3 
                  conmon-2.1.8 | 2 
        host-sentry-cli-2.20.3 | 2 
                  cairo-1.16.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 dash-0.5.11.5 | 1 
        edk2-edk2-stable202308 | 1 
                elfutils-0.189 | 1 
                 fdk-aac-2.0.2 | 1 
  gobject-introspection-1.76.1 | 1 
       gst1-plugins-bad-1.22.2 | 1 
                host-go-1.21.1 | 1 
              libarchive-3.7.1 | 1 
          linux-5.10.162-cip24 | 1 
                     lxc-5.0.2 | 1 
                    proj-8.1.1 | 1 
           python-orjson-3.9.2 | 1 
               tcf-agent-1.7.0 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
               valgrind-3.21.0 | 1 
                 wolfssl-5.6.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/7e2bb6c34fdd512f97b9207613e3cbe5eafee7f1 |     
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/55c6e12d305f3f1fe0afd743747a9adb189a115f | ORPH
   mips64    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/0e6a7806aead733ab85bae37fbf2dd3fd71351c3 |     
   sparc     |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/08ddc6562ff9277b18a29b52815264b84fcd1f1b |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c26fa320ddb39cacaafff9dc290eb7231fe63376 | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/2fa0b1631eba12fe6e47c066f0d9432cd2440e99 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/75bd9339c21f780384baddf278e6bbff27a9350b | ORPH
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/46c833f501d8c3e711a6b933e01eeba79f47bf69 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d25fd1c68b821e442330d7d381dad1e65bf833ed |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/fc66e58c4ea32cdb42d98e0c2fc4ef129a3d8d3c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/db233fef54f510d7163d71badd234d7275d344f5 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/58c786790558bf5d2117a977cb220920c7cc101b | ORPH
    mips     |    gst1-plugins-bad-1.22.2     | NOK | http://autobuild.buildroot.net/results/117ee2bbeb3272f8a9678c163f7a102d657276fa | ORPH
   mipsel    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/6567123048b6e3dc6a5d4f371fc5aeb85c4d820d |     
   mipsel    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/cb8d4fd35f95b2ac678a7cf5521ad5264613e787 |     
  sparc64    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/6a48246ace94fa84776d7150881a5f8fd7ea6a55 |     
   mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/6aa686298b85bc675ff818eb569dca7b8833158d |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8d6be40b6981c3412e89c642b0b4ac7896715bf2 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/1d2a72475028bce0cc849565ac085d098b4cb7b8 |     
 powerpc64   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b319409b1e188405f54b96a6cf9a91ffa5351984 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/5611169557fb0d980aded305c0f950af56610e48 |     
  riscv64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b8af747834701331ab687a68c3ab21cda821256c |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/8c776d31fc87111746db973191be8f74b7a345d4 |     
   x86_64    |        libarchive-3.7.1        | NOK | http://autobuild.buildroot.net/results/239269e3c798a624bc608c649c1729fa6e6bf0cf |     
  sparc64    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/bc088ae143a88ecfaae9a8137f34cff139973a25 |     
    arc      |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/f2ad7e899d7721913db2980865a29578f60cee82 |     
    or1k     |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/714e4b6860b9b24239a41a6618945da4cf3164be |     
  powerpc    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/39b9d8d30ca9c980a27b14c3cd41f87678f796d3 |     
   xtensa    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/0c2b79376229447d7f88bc7242124341b13a96d9 |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/bb03e73d33f018f94324a1a4d9a1f42f18c278a5 | ORPH
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/1aac2165af144c7d80c5e3358e9df15ceba02135 | ORPH
powerpc64le  |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/133a3db9d350b54060883730b5728f7347c8798b | ORPH
   sh4eb     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/b7bc1b411ba79b9b8f2cbe2c04e8ac4bd4ef1d70 | ORPH
   armeb     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/1af4f3c70c52b8cb7ff5e685099fa5093e1c5e34 | ORPH
   armeb     |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/5a2382af55babf975ded9b47f0b5927b6730a3b8 |     
  mips64el   |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/31bcb7a460bedaae5580858e2cfed0485c0724fe |     
    mips     |      python-orjson-3.9.2       | NOK | http://autobuild.buildroot.net/results/8702139ff3cd360e2aa78b07e0e0e72d534ea201 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/099a02205708985186b5d4f6a428eccfb3ac84ae |     
    arm      | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/eb562a1596d082f0eb87ea87d8a6358d177f0a31 |     
  mips64el   |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/9c762c2167b8379436fe4bb2d9201da9852acfd7 | ORPH
    arm      |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/bbd39c8dfb09feeced81f91d3bf9dfa9478e3e61 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                     efivar-38 | 1 
               host-runc-1.1.7 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/30f004b17b8514a0a1b8a2d86fcf1c316318b9a9 |     
  riscv64    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/125b4ff06e603f08a0144eca410a3f4eee6147b9 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                  check-0.15.2 | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/0c3cc478c1e1f05b30812f72bb0a8d3c3b53aafa | ORPH
   s390x     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/913b15384732a9862ca88b7d8b41e209782e2de0 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                elfutils-0.189 | 1 
                  scrypt-1.3.1 | 1 
             util-linux-2.39.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e4afdb2a29500f490a056f36539de2fe696d64ab | ORPH
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/f2273f7f9185d40e26f5e3dda8713b279aa92253 |     
   arceb     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/7b403ec4c8cf15c922bbefc6c3d45c25d59072d9 | ORPH


Gitlab CI results for 2023-09-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483309  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483325  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483349  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483327  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483351  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483427  | ORPH 
                 TestPigz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483464  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483467  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483468  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483563  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483493  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483502  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483509  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483539  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483566  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483578  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483581  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483583  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483585  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483587  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483592  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483604  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483625  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483633  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483639  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483640  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5055483641  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
