Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DAFC47258
	for <buildroot@archiver.kernel.org>; Thu, 25 Jan 2024 07:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D9BD611D4;
	Thu, 25 Jan 2024 07:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D9BD611D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IuJt6Ol3FXh5; Thu, 25 Jan 2024 07:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0846C6135E;
	Thu, 25 Jan 2024 07:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0846C6135E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0BB81BF83B
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 07:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3BDB40420
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 07:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3BDB40420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7rgELl75_LE for <buildroot@lists.busybox.net>;
 Thu, 25 Jan 2024 07:03:58 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DD8C4038E
 for <buildroot@buildroot.org>; Thu, 25 Jan 2024 07:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DD8C4038E
Received: by mail.gandi.net (Postfix) with ESMTPSA id A63C1C000F
 for <buildroot@buildroot.org>; Thu, 25 Jan 2024 07:03:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 25 Jan 2024 07:03:55 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240125070400.B3BDB40420@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1706166235; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TUqu2ixr3b8Ez+bBmzJYaCFmPB1AwCkCv+A4F2sr1UI=;
 b=HIkQvuNlfWpAEyeebPwstXNzb8GPYXqBiaYPvTl3QYMI+3NbbaTGCahE/cjGPy9Na29MLM
 EnTDxkficLnBc15CA/8w3aGp2bRAGe1l6EyBkzY2vh5NIFMoqVBzu0PYOu4Bgjy/oPR3oK
 7cN4/6Uzi0QwWsUnWnN+vgDtt+BxwTzwfpRHamvkK0zN8/brDaZ7TJULsKjTUOMUy17bNN
 MrXv6Hg6djucOf7n0nGbqwGBTBfP+VbNKC8YaHc7yv2Q2k6Ym06Nrq2BAkQ8aVGhpEcpUR
 Eq5RzLLOnQoC6LIRXe1bH27pn7W+WN4g6XYq3pwJ0wUPJMEZ6QK9+4FWzdfbcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HIkQvuNl
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-24
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

Autobuild statistics for 2024-01-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  3  |  0  |  4  |
  2023.11.x  |  0  |  2  |  0  |  2  |
    master   | 51  | 52  |  1  | 104 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 7 
                  stunnel-5.71 | 7 
                    attr-2.5.2 | 3 
              host-rust-1.74.1 | 3 
                libressl-3.8.2 | 3 
check-11970a7e112dfe243a2e6... | 2 
                elfutils-0.189 | 2 
              libopenssl-3.2.0 | 2 
                 openssh-9.6p1 | 2 
                 sudo-1.9.15p5 | 2 
                   botan-3.2.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                  faad2-2.11.1 | 1 
glibc-2.38-27-g750a45a78390... | 1 
         gobject-introspection | 1 
        host-sentry-cli-2.20.3 | 1 
              host-uuu-1.5.141 | 1 
                  kexec-2.0.27 | 1 
              libarchive-3.7.2 | 1 
           libfreeimage-3.18.0 | 1 
                libselinux-3.5 | 1 
       libzenoh-pico-0.10.1-rc | 1 
                  linux-6.6.11 | 1 
                    ngrep-1.47 | 1 
               openblas-0.3.25 | 1 
   python-pydantic-core-2.14.5 | 1 
                   rhash-1.4.4 | 1 
             strongswan-5.9.13 | 1 
               tcf-agent-1.8.0 | 1 
uclibc-ng-test-0f303c63fab7... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/d7abeb324a37cfe051a11217fecdd8c908c35636 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/64ad44664bb506c8f88e5b1db25f8e57d39e2fbc |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/6703f46ec230acc35d0e4d6c5ae35790974064c2 |     
    mips     |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/5e4bf42fa1090f9025e0e91bb032cbfdc52493b5 | ORPH
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ed899cd4f02f6c4eae016449d326089ff9e4f101 |     
 aarch64_be  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3ad02ce3022d423b5cf883ca98cb77cc015cac77 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/76ff272e1e8345e595660cecfa445475da536eaa | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1b98ea99fd1960257c85fbd928baba02748364f7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/aabf8038002296c296707b20f39240bfd21ca81e | ORPH
   armeb     |          faad2-2.11.1          | NOK | http://autobuild.buildroot.net/results/e933ac7ead917fa1d206953d5c3fcb67568871c7 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/f01d24bc48af4b40cf03e9483d6ee2d9f666a519 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/aa908d4a3f8c532a34f27da7ffae7eb7029620b1 |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/aed7a04f98ec001c85248df9a9a28939e1c431ea | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a7d76687cce295b5d51eb6c74a550e8a2e630ec0 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2ad669d43f23d940afff8dfc18186d81c9113f11 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0e6453bba1de30190919719cc10d586ffcfa91bf | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d804b509d7c676139f9e51b86ce998866b8a72f6 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2583a4b6c0fb23afb32d00261bec377fc5da53dd | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3a243db5167b2601543b77669702175c83943d84 | ORPH
    i686     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/6b20e4275afd3c51ae3eada62ad4ab5cec8e14bc |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/c77491b6703058c19facfac69d9652a4660b60f8 |     
  sparc64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/64ca583a8c74c308b125dc3051b6f126b71d6dc5 |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/763957cca7ea0c4ef1952a99b7992c17e669eec5 |     
    or1k     |        host-uuu-1.5.141        | NOK | http://autobuild.buildroot.net/results/c9b32083bd58c0efffaaf30d87360ef8b318d43b |     
    arm      |          kexec-2.0.27          | NOK | http://autobuild.buildroot.net/results/b6c255404b976d6947a92e3ccf23ddf49d46f782 |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/3a3be027f172e552eafa163f54b593e1a915e982 |     
    or1k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/fdcdc91ebdf6f5e3ce3dcd242fe42aa65a947187 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/cfed276b4fa7b984041bd76e48342e2829fcb57b | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/2cd217d4b09340a2cf39643f825523d65cc62e87 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/a67c89715a9a374d74b72cf74f70a13a0ea2d642 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/7195b583e8f7227c40baf39425698b82faf8e1e0 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/031058b4f2ad0d1a369e6db9dbd9664f6c76cf81 | ORPH
   armeb     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/c74504290abdcb804ac5be78214f9e9d382c721b |     
    or1k     |    libzenoh-pico-0.10.1-rc     | NOK | http://autobuild.buildroot.net/results/aa9c8754fedfb01d7376ec9b783e698bb90c6305 |     
 powerpc64   |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/54b1bf739234dcfa05836a77ca246a7e633007ca | ORPH
    mips     |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/c98af6fea95ee5619b7487684f19d3c26f95c62e |     
  mips64el   |        openblas-0.3.25         | NOK | http://autobuild.buildroot.net/results/96185e2f316c3b7f7ca2a14e7e5a82dadec7e063 |     
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/53b7ca5304125258d44abf7754b2fe430fb8ddc1 | ORPH
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/9755f8fe96b3cc404b9923c60803341e399bddba | ORPH
    arm      |  python-pydantic-core-2.14.5   | NOK | http://autobuild.buildroot.net/results/ed5370ee0c18f19d42143067da2f5213c9700edb |     
 aarch64_be  |          rhash-1.4.4           | NOK | http://autobuild.buildroot.net/results/214805eba9f4a26f6bd0aefe6a432f3490d2a811 | ORPH
    arm      |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/0fc816b2a5406c13435af7ab9da19aa83abe8473 |     
   mipsel    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/8ba8d75ead5235c89d6c9410bc2558b7c0ee89ce |     
    arc      |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/3cab1d9df48d0a4d46c33ce0162f16926197a13e |     
powerpc64le  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/70475d1805ac018b8f8af6a840cd978771ee0741 |     
  powerpc    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/5fc99ba37e0206679b13ba49e2623c7c06e926e2 |     
   mipsel    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/99aaade184cf7b38bc9cac627914f7e0ab09f7e5 |     
 aarch64_be  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/0c4d2895a4808d8ff7a2680b379fc865d0f4cc69 |     
   arceb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/40de896c1d195efcea7508d11f8b64dc8b73beae |     
   sh4eb     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/87d777d88f640f30855557461b788dbb77db15e6 | ORPH
  powerpc    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/6c19602aec9aa1fa1eb95fb389aae310744851f3 | ORPH
powerpc64le  |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/0ffdfbbf0cfa48517d83ca08e24fa6d39b4ea8ca |     
   armeb     | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/2b2e90f3c70b60dcc23d8b14eebfe3e7775a556d |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               gupnp-av-0.14.0 | 1 
            host-binutils-2.39 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/fd0fe8cfc7e706da5cc7e4839d2c4c99ecf39fc0 |     
    sh4      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d9cc20d26b6dd4500e5a499e16a3f96338090979 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e80a9e81c517aa99cab5c231b21ba86c09fb1eb2 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                elfutils-0.189 | 1 
               ipmitool-1_8_19 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/175f1301f3669a8d81c1ef1ccc0c8d6dff2d9d1a | ORPH
 aarch64_be  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/307ffcf3f29ccfaf91ca246ac92c749bd4885cc2 |     


Gitlab CI results for 2024-01-24
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755400  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755411  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755417  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755420  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755423  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755428  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755819  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755043  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756038  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756057  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756071  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756076  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756148  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756192  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755212  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
