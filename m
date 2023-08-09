Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA932EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 05:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63BE2401B2;
	Wed,  9 Aug 2023 05:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63BE2401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UC6_VE5B7ie; Wed,  9 Aug 2023 05:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 504C7403C7;
	Wed,  9 Aug 2023 05:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 504C7403C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F21B1BF5A8
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 05:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2273060A7A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 05:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2273060A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z45dZY-HDN7T for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 05:43:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88F5260881
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 05:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88F5260881
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAF1720014
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 05:43:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 09 Aug 2023 05:43:34 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230809054339.2273060A7A@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1691559814; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oN3sWANYbrMKTU+KXNAx8EPGKJJpL7GUPfbj+e2NstI=;
 b=mWyrsKNNthQLpiWIdRcOF1AxCD4RxdjT6ACICBMavOTc23Qz1O552LQzmMnY6SvfBKmUJf
 iw/2ZBxI0TDoYvLygb3nE9wEAdzmRNJZGABE5+BRCIxt1v3deJtkMC+hpogXeXHqh68iay
 z/YlGMejZ9siVKQwmnhsEWKnfZLzKZn3RDNGh3xt8go0xo+HJ69C57HmxbT0yV5V8gTFlS
 xtP9xDDZGVss8vFQXTORsguSkv8xdjFtYNTfm+B+WxKQBti6x0R7Tp1mUwaJCcwZou+OMK
 jman4hZVAXvOsT4QeLFPqFXL/iNNEWdfwWYgZ5KfCS0D5bS3We/ode9oSPtuWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mWyrsKNN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-08
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

Autobuild statistics for 2023-08-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  3  |  0  |  6  |
  2023.05.x  |  1  |  3  |  0  |  4  |
    master   | 48  | 48  |  2  | 98  |

Classification of failures by reason for master
-----------------------------------------------

                   linux-6.4.8 | 4 
              host-rust-1.71.0 | 3 
            gdk-pixbuf-2.42.10 | 2 
         gobject-introspection | 2 
     linux-5.10.162-cip24-rt10 | 2 
                     lxc-5.0.2 | 2 
rtl8189fs-75a566a830037c7d1... | 2 
                       unknown | 2 
                  assimp-5.2.5 | 1 
             batman-adv-2022.3 | 1 
                bpftool-v7.1.0 | 1 
                  check-0.15.2 | 1 
                cryptopp-8.6.0 | 1 
        edk2-edk2-stable202305 | 1 
esp-hosted-11e90f185a5a9922... | 1 
                     exim-4.96 | 1 
             f2fs-tools-1.16.0 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                glorytun-0.3.4 | 1 
  gobject-introspection-1.76.1 | 1 
                haveged-1.9.18 | 1 
         host-sentry-cli-2.8.0 | 1 
                 libcurl-8.2.1 | 1 
          lttng-modules-2.13.7 | 1 
mmc-utils-d4c2910981ff99b98... | 1 
                 mpg123-1.31.3 | 1 
                   perl-5.36.1 | 1 
                     php-8.2.8 | 1 
                python3-3.11.4 | 1 
            quickjs-2021-03-27 | 1 
         shared-mime-info-1.12 | 1 
              shellinabox-2.20 | 1 
             stress-ng-0.15.07 | 1 
               trace-cmd-2.9.7 | 1 
                 uclibc-1.0.44 | 1 
             util-linux-2.39.1 | 1 
               valgrind-3.21.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/426c0c60da72646adb856a22a0875bde55049590 | ORPH
 microblaze  |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/7595329da3f4ab73d1d72031ac7236114ce18248 |     
  sparc64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/360198be9b3e5312934ff3acc1df9e1ee5e54aac |     
  riscv64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/0c6213c1995aa306aa34710d2cffdd7eaab22cae | ORPH
   armeb     |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/33960f7fb611bfbfddf4f80932d8a5ef7567e6b1 |     
  aarch64    |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/d6c71a8d4f4cde3381eff8d128a1ffd5067358b0 |     
   arceb     | esp-hosted-11e90f185a5a9922... | NOK | http://autobuild.buildroot.net/results/d47317640de39baabeefb8d9e04fa7f3e2dc873a |     
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/bc514ecb1adfb32782b34abbdcd66cc22dcf04cd |     
 aarch64_be  |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/e7b38ea7cf169b5cdbc8603a61780dfa902f3ca7 |     
    i686     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/73f0b60b3c50dec6b4c3fc754b84ac6728752fe9 |     
powerpc64le  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/c6616835a37bc7ef8ed0f6c063f96865d2030f08 | ORPH
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/8f79df5096229e3ec70c5a38d07dc4c9d1083627 | ORPH
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/a79bc6d1d4c71c3d7f2de08a25defe81409bec6e |     
  aarch64    |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/f4f37179a732d1bd4a31c929608a963f291e21a2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/52b387663f0238277986c96334882778dc7e6bc6 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2b40b0208c4ead6fc8742dbddec8228bbf5a0490 |     
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b88493e768b81e467d6e482144ee54ad94e5b099 | ORPH
  powerpc    |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/16a270558ce2b2d49dc3f9169734f9aa2544520a |     
   mipsel    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/541af69a8ae8a7eb77c344d5c40f560389b2a935 |     
powerpc64le  |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/2f74e5f0c2f7b2940a93f9b568b4f5a7e4d5223f |     
  mips64el   |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/cc3ebfabf9297f3647b01b10928dd261bf6494f1 |     
   armeb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/2df940342007e1e3bcdc9defde3a8be1fef1a0b3 |     
  riscv64    |         libcurl-8.2.1          | NOK | http://autobuild.buildroot.net/results/8b07b636ff2f3dceb400a3c6adb11038e1708525 |     
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d544b3d478159c0a7e130c9b00140bbb01905762 | ORPH
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b8463a292d7f3eaabe8791f978cfcb1bd683e71a | ORPH
   mips64    |          linux-6.4.8           | NOK | http://autobuild.buildroot.net/results/ce2a9be696a875655f3b51c5ed9cb4957b130790 | ORPH
    arc      |          linux-6.4.8           | NOK | http://autobuild.buildroot.net/results/110dd2fd64a627f32c9e84f42ce3558540143bbb | ORPH
  mips64el   |          linux-6.4.8           | NOK | http://autobuild.buildroot.net/results/50fdd25b5e6e1cb611b1a57fdf2229cb2bff4a2d | ORPH
    sh4      |          linux-6.4.8           | NOK | http://autobuild.buildroot.net/results/1285c547743743b80125c57818bd9013cbfb5a9e | ORPH
    arc      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/16b39c1a689e013f5fd1a713fdc6f26d8b227865 |     
  sparc64    |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/9b5c633b1f21919112fb3b452defbe9ed2bbfdfe |     
 powerpc64   |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/2625cb8802951edb6f3adc9ae1959306358f7ff9 |     
    mips     | mmc-utils-d4c2910981ff99b98... | NOK | http://autobuild.buildroot.net/results/32d2f9894efc1e743ca6ae7d2fe3108ccf41c188 |     
  mips64el   |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/090573cb9bcdbe0b7bb8e35fe5bb126de64300c7 |     
    arc      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/6dcc6f5b8566269269b1770b27a28febd5428faf |     
   armeb     |           php-8.2.8            | NOK | http://autobuild.buildroot.net/results/9524acb690faaa6255db739586b9b07f82c6dd27 |     
   x86_64    |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/6edee32c6f2eb4e89dfd6aab367b4630a27255b6 |     
   mips64    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/82bf0c2383a30491a74a2d8a1e1c1bbcaf091174 |     
   armeb     | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/e3525cc9a7d54fa26cce3e17d20161ba4f2d5583 |     
  sparc64    | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/f21c2934d966b27c1b69d3d76c02b93f3f952400 |     
   sparc     |     shared-mime-info-1.12      | NOK | http://autobuild.buildroot.net/results/d2563ce649188cec2025e4fc6e58c4bbd98ff939 | ORPH
   xtensa    |        shellinabox-2.20        | NOK | http://autobuild.buildroot.net/results/f3805f6366f3196e855a6c69a280bfbafea212b0 |     
 microblaze  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/5d07d4dbf057c436811195ac63213df1a7858baa |     
   mips64    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/9fb5bad16acd24f06b0e62850de3dc3c640e07f4 |     
  powerpc    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/6545a464d49f9f3c6740a5208cfad7f09ec4cb8b |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/baefb27ff03c6bd8fff39c59eb2a917169b032d4 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/629f4fe916509ecd2e56f47eb6bcd719e0632d61 |     
    or1k     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/fee88ff2c4fc9f979a20846cdd3f5a023633e68d | ORPH
  mips64el   |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/4b488cc62c3c1496109528eb78020c64001d4300 | ORPH
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/070ff9e579c69acc26c17e4b7d5b00c9016ee17f |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 2 
               host-go-1.19.10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/7d46fc33a79010f2616e20cb11ed59f7b20245df |     
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/88e1cf4cbf83334314c1a29c22950caf440358b9 |     
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/702ab68bf9af668ade0b2c2188df333154d7dba4 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

               nfs-utils-2.6.3 | 2 
                  check-0.15.2 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/804b8825b615cdca660e4dd6ee151dfa03ac13aa | ORPH
   mips64    |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/6406bcb88368b976700b81eb88129160f1ee9e33 |     
    m68k     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/6c1e9a4cd5c6ad6024825b7184307bd75d0a34ea |     


Gitlab CI results for 2023-08-08
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/4814732224  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4814732904  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4814732966  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4814732970  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
