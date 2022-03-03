Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F25C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 07:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07CC60B7A;
	Thu,  3 Mar 2022 07:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtvFgZ-M4SJA; Thu,  3 Mar 2022 07:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D3560B66;
	Thu,  3 Mar 2022 07:12:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19D381BF3C3
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 07:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 017E860B66
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 07:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXu8a_qOtIGB for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 07:12:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15F4C60B65
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 07:12:39 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 05F8940008
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 07:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646291557; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9LSh0pJO2KUQt2yeQX9Z4jYxDK9Z7j3eiXu0I8NHjUA=;
 b=cz9ZqWPsky9R+YQtar8cn+NjA0EZQxNFf+4/UrXEz5SqRrzpwwBPKJiw8ZcYlxSLBd9Thw
 N9N+Xy3HtCroiOEqicf2kZIqaEEUu2FPJk+Az1uR0p7xheUpa7vQFz5naawvO9HcKXProJ
 4Q147OOXwy5UibWkNYrQ3xCDx/M+5G2vm4HTFBPtePWotc5fsc+wEUlytQ61uWHds2JhCv
 YyVSy9B1lENnb6kTVTzt5sAjT6LXZnf6jB8PPsIyleYOgbdT4eTiekoIeraW08RiN1VJTZ
 okGJZeiRZUEEhLCFwqqIJhNKcD+FMnz0FFFZT3G09KfeweUSbuAcqeGyJ+eO/g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 03 Mar 2022 07:12:36 -0000
Message-Id: <20220303071242.017E860B66@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-03-02
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

Autobuild statistics for 2022-03-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 57  |  9  |  0  | 66  |
  2021.11.x  | 25  |  1  |  0  | 26  |
    master   | 106 | 57  |  1  | 164 |

Classification of failures by reason for master
-----------------------------------------------

                       frr-8.1 | 14
           host-libselinux-3.3 | 14
                bpftool-v6.7.0 | 4 
         python-greenlet-1.1.2 | 3 
                       unknown | 3 
google-breakpad-7515ab13768... | 2 
                    vlc-3.0.16 | 2 
android-tools-4.2.2+git2013... | 1 
             bluez5_utils-5.63 | 1 
                  dnsmasq-2.86 | 1 
                  exempi-2.6.1 | 1 
                     file-5.41 | 1 
            ghostscript-9.55.0 | 1 
                host-go-1.17.7 | 1 
libcamera-apps-2d1009e3badc... | 1 
                       libuwsc | 1 
 Makefile:734: target-finalize | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.33.1 | 1 
               osm2pgsql-1.6.0 | 1 
tovid-87c676f4aadb7303d2cd9... | 1 
                 wavemon-0.9.4 | 1 
           wpa_supplicant-2.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/275851e3d79a7166fe28e0a0f8c04a4db3c4ceb3 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/e1af3f9a80755384617a2eb1c137393048e7ab1b |     
    arm      |         bpftool-v6.7.0         | NOK | http://autobuild.buildroot.net/results/4c34010da5311b93d62477f1d3a989452fe1fe6f |     
    arm      |         bpftool-v6.7.0         | NOK | http://autobuild.buildroot.net/results/31565641bdafe8b303bade66764c428c49355072 |     
    arm      |         bpftool-v6.7.0         | NOK | http://autobuild.buildroot.net/results/f6c5b6f65e49f28ee973046dbc31301d6be7765a |     
    arm      |         bpftool-v6.7.0         | NOK | http://autobuild.buildroot.net/results/198183e4c2d85212ceb12ec588cd93b4f1e01c6c |     
    arm      |          dnsmasq-2.86          | NOK | http://autobuild.buildroot.net/results/eb0c34ff58eaf103f51c7171ecd97a3bdb887601 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/70b050ec463b8fc45cd9e886efa1d2be4bb2d737 |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/4379726288f89fd53f56cafed4b4a151acea896d | ORPH
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/efefcf149af610d9be0d76f1f2bcfadceaa2f738 |     
  powerpc    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/2a0bc37f535035eb24d3129982c83da3a43127cc |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/2068459734556e09d5d12cefabd624d9e47c6c5f |     
   mipsel    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/592dc62c4d2d197d16367a243fd77376a7cfda7a |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/0f7104f07e170f48873cb7e33993f25247191313 |     
  riscv64    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/da98920735e4597d21a7fe9d0a0dd4ab284c55d2 |     
  powerpc    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7140ed2843be622d15d7fbd1278f2c638add08f8 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/8d6f6374e691362ddf70de7f41cee645024fe7c2 |     
   mipsel    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/aa01104d9e99e16d11799ccb039dc05966546327 |     
    arm      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/a0e31d4426db29c8005e144ed3201da271e437cb |     
  riscv64    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/e4b5dffe5e8104e9fcb34ad8de5f980552101830 |     
 powerpc64   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/42fb90cf286a5d081b0ebedaf55d2dc14b325556 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/17a06dc06b28f4de0b48afd5c7e5f1cdca01f7ee |     
   mipsel    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/717a61b8b1b3dfcaa34dcfcc9849e7f8d4961927 |     
    arm      |       ghostscript-9.55.0       | NOK | http://autobuild.buildroot.net/results/b3e5c8c98e77e5f5e3661b31ad3d192260fe3dc9 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/586b77332930f1a59ed14defcc2b2546eb327152 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/ea3bc5ec1e2946e11cf449a943adbd42eed57f15 |     
  mips64el   |         host-go-1.17.7         | NOK | http://autobuild.buildroot.net/results/00d3143f485192019eda60e4246e08bfcfd0eb51 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8c846d6b962610b0ab2f0a1cb82aae3a5f386e72 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/1fe5d8e9a0b2e5b8ace8273694c47b435cfdf18c |     
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0090c4476dbe4c6f45f07a6a41e7f951f40f0838 |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/c7178239648e0b48fd00937cb9d958f2291ab7b1 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/eb57c0ece7ffe66982fa4904f3603f27341de849 |     
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/1b24f64c4eee66056b550544c34a76b7cc412d70 |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/5122b102bbc22c772e232b69eb47c550d9a48552 |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/34ee2422bf4af2112eab2b92852c27e90f3ce0db |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e110384926873327db2d56fc5bf54dd6db29b000 |     
 powerpc64   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/fd39bfab03356f38fc9ecdd49b8322b6084c2ca2 |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/861e304e27bc94a6078f28bab19e392e10acc8b6 |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/93f14e8bedcbb510a35429587b1a5bda80c20e7c |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/5f981cd9a1d5fb0ab858f18b01d9b692131ab950 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/211427becf05ce040c5d6f78d1140727a9110755 |     
   sparc     | libcamera-apps-2d1009e3badc... | NOK | http://autobuild.buildroot.net/results/b20465140f3a5281f9b586f442b67fd400e7184a |     
    arc      |            libuwsc             | TIM | http://autobuild.buildroot.net/results/31d98d07e1fc36381548804c224a771403bb16c0 |     
    arm      | Makefile:734: target-finalize  | NOK | http://autobuild.buildroot.net/results/ecf4de273c4ba888264085e6f2b69656208c6a04 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/d252d52aa9f045e04a51110335bf3a6b1561562a |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/63efa19f8bb5760ed44d18d9942954dfb376ea62 |     
    sh4      |        osm2pgsql-1.6.0         | NOK | http://autobuild.buildroot.net/results/521a28c64d9689777d9e5d4f81fc8de3c8996d92 |     
    m68k     |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/5978d008d48374d74bc2137fb977f6231fce2481 |     
   mipsel    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/db222f0ff8bc9ff7b5f4e829986cf7dc46259a57 |     
    arm      |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/5f5d5cc9d90a1207a9af9608f4254f64e2a89bdc |     
  riscv32    | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/c77ede55ccb6e1db9a7a0d0c01c48cfc6c3bfb2c |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/c78687bb093854a5df3751a531fdca0bd1096423 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6b896c8c38e44eba430eb71fc08ade1eb04c4649 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/977b8f322f897663003f5cee99f5a32c0ab87d5f |     
    arm      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/06188ad302c5e33bcb237f70afa3483bdb3358f6 |     
    m68k     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/d13fe134dfa53fc531b1d72642fd9a0cdcb4bf35 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6bb7891ec0b991ec7e9532e5a568a58c8eaf554c |     
 powerpc64   |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/846ab8364c306e1c8d0643b571bef848b7fd21a6 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

azure-iot-sdk-c-LTS_07_2020... | 1 
            erlang-jiffy-1.0.6 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
              netopeer2-1.1.53 | 1 
               openldap-2.4.59 | 1 
              python-pyqt5-5.7 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/ed8acf7835e2c7894cf3f68fe65fb6b1315691c7 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/de6457a6de4f03c4a029dda7ffe17004f24f3434 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a076eee8988dca3b471daa0a63e20a0e6b1d5b12 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/086424878b46fcbcdb56fb04a7484e69db0104a5 |     
  riscv32    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/80bc83a1aa91be2ab61cf5b519f85131d839c519 |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/c30c6ce39f7f3df0e1c112d202ecd57fbeea5821 |     
    or1k     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/de5db9a34968239662d1432c95b850367547652f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9c0750573af93bacf9c4ae68063fd2f55624e1f5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e6392e051caf3da4eb77d4456a9c3e031c76a307 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 openal-1.21.1 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/7dd952755a90cc66a59e6a78c4af3c04391de74a |     


Gitlab CI results for 2022-03-02
================================

Detail of runtime-test failures for 2021.02.10
----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/2149462298  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/2149462014  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2149462027  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/2149462156  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2149462162  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
