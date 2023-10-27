Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB509C25B6E
	for <buildroot@archiver.kernel.org>; Fri, 27 Oct 2023 05:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F9BA704F5;
	Fri, 27 Oct 2023 05:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F9BA704F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3fLkuFMrQg3; Fri, 27 Oct 2023 05:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F25E704EE;
	Fri, 27 Oct 2023 05:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F25E704EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE8981BF3CB
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 05:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7299C4ED22
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 05:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7299C4ED22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0md8G1yYQT7A for <buildroot@lists.busybox.net>;
 Fri, 27 Oct 2023 05:36:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5356E4ED20
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 05:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5356E4ED20
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41F5D240012
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 05:36:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 27 Oct 2023 05:36:06 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231027053611.7299C4ED22@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1698384966; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dUfZD1DhqTxQJo0Rvn6Y9AeTL5q89N6nd80YO1pFayQ=;
 b=nm+PKXdW7bk+a2hCedRRWB5zL1RpMQ5Fj4D30xOz6z8XRrKVrC6BmXmYyfFLsJZfooMEeN
 6W/sC3UqIfkARy2rLNfAZkDcoqXhet8gsx0gj4rTsF46p1WwqTruU2clez27VEevLKvD3D
 qlJnIgj6jxdcphvzWIhTLQP/L+gOzpkluY2FfvcQRTP2VqT0BXcMHtjHJRhd/wPnKuEnam
 TMfPbutR08j/dmzAQqwgYyhTC66McLNuqBmqMIY+6P5w4M47LRvUepIIVtu/zsh4U5VIgU
 42t9MMTBs5nCfNiw5bzve9dTNPaO8il9uKTwgCdi4LB1ygHi/9CfJ+xY9kSOHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nm+PKXdW
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-26
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

Autobuild statistics for 2023-10-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  7  |  6  |  1  | 14  |
  2023.08.x  |  8  |  8  |  0  | 16  |
    master   | 32  | 62  |  1  | 95  |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 5 
              gcc-final-12.3.0 | 4 
                  monit-5.33.0 | 4 
                       unknown | 3 
          xdg-dbus-proxy-0.1.5 | 3 
                elfutils-0.189 | 2 
glibc-2.38-27-g750a45a78390... | 2 
              libarchive-3.7.2 | 2 
               libglib2-2.76.1 | 2 
                 samba4-4.19.1 | 2 
                apparmor-3.1.2 | 1 
                    bat-0.23.0 | 1 
  binutils-arc-2020.09-release | 1 
                   bird-2.0.12 | 1 
                    brltty-6.5 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  conmon-2.1.8 | 1 
                 dhcpcd-10.0.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
         docker-compose-2.23.0 | 1 
                   ethtool-6.5 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
                host-go-1.21.3 | 1 
host-go-bootstrap-stage2-1.... | 1 
              host-rust-1.71.1 | 1 
        host-sentry-cli-2.20.3 | 1 
                   libnss-3.94 | 1 
              libostree-2023.6 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-6.5.8 | 1 
            linux-fusion-9.0.3 | 1 
          lttng-modules-2.13.7 | 1 
               mariadb-10.11.4 | 1 
         openfpgaloader-0.10.0 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
           python-bcrypt-4.0.1 | 1 
              skalibs-2.12.0.1 | 1 
         spirv-tools-1.3.261.1 | 1 
                   uhd-4.3.0.0 | 1 
             util-linux-2.39.2 | 1 
               valgrind-3.21.0 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/f816dd47cb08a3915156154018c4d732d255e935 |     
    mips     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/ff8e5b01bae0b2c9728703fcc9be46f772e59251 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/eb3746cf1b59223b7a3b6d8733e3f01bbe39a148 |     
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/5eea2049c11fc8f9d537f4c90a5320daf329665b |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/0c4c26252f5147c6039f2dbb8d674fcf0296867b |     
 aarch64_be  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/7f150683fbdc574016a9601a9ea4f66ba7e80039 | ORPH
 microblaze  |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/71b4f35b3150183c7b44bc3897f01b0019e10ebe |     
  mips64el   |         dhcpcd-10.0.4          | NOK | http://autobuild.buildroot.net/results/09edf57018b3a796be528dc7dc5faac8033af868 |     
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/0857123d2b93504d86abe6f14e3334ea5e99f8a4 | ORPH
   s390x     |     docker-compose-2.23.0      | NOK | http://autobuild.buildroot.net/results/459d85d9e53307a7fc90a0b41b8e3f64ee8bbb51 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/aa0dfb271b7c8f793ae350c702bcb123a3a53d75 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/13322d5e33a17409100cb8399f9dc884f2961146 | ORPH
 aarch64_be  |          ethtool-6.5           | NOK | http://autobuild.buildroot.net/results/4a6b20e2c1951a86db7c7e6863c19614dcc1e601 |     
    i686     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/781832995cbab08fe4e9e95ebc112c8d4e6965cd |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/5d3c29ce48bcf52bc45381d7f7b1f861d7aafc66 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/4f394288e773daae87c0c2d3b286e1a1b687283b |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/4d5549c157b0035edff5469630fba6862da31a3b |     
    arc      |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/e47772dfcc7dbf62c6cdcd2b65bdacdedb753570 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/051f1c8dc570a23a2ebe21b0113969bf77ead45e |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/e5ca4054ad0c108c32440f3a594263f0bfecd233 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0451584552704e5dd02d1efd148d0e65dc66ad0f |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/b060b44cfc91fa6e2964abcbef8d22750d598ccd |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/aca92948829d63916b8f5dc5bcd41368aa0fb333 |     
   x86_64    | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/5ae7c39f103c7ccc2d72230c7519e303fbfaffb1 |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/444ee9715215a48c31da3249f0ab59726ceb8604 |     
   sh4aeb    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/81615355dbef4658c0e5dfa26c672dabf6611b8b |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/fba16ded504eabebeb314e9ccf20caa745a964d8 |     
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/7067a824d21d8bedbe88647ba998c11470918df8 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7076f9d9db3cda6835c5020ebacdd795e5066dd6 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/44cfcb71c525f524777dacd8df029f6ce5b68afa |     
microblazeel |          libnss-3.94           | NOK | http://autobuild.buildroot.net/results/c5c7c9e00dbd2619f0926d5eb21e62b950f5d3d1 |     
 powerpc64   |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/523c9d0102b34418d871f66917c48ec68dc612d2 |     
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/1a4233c55457b9992fb7248cc87eb9bb5eef1972 | ORPH
  sparc64    |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/b7765b4f00f57e656d2ec41e65015873f9260535 | ORPH
 microblaze  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/88ca7c619fd1360590ff5e90578f8052697cc769 | ORPH
powerpc64le  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/6a4358d398ca163ee8041473b71e1f1fd957a43f |     
microblazeel |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/99694a88dc38d4a781623360f74d745233c17dae | ORPH
microblazeel |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/c12d9306205d4d050879d7a50dd707da1f1ac9fd |     
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/9a9e97a67150247df6bd197299d80cebaa51fe9f |     
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/4c647f10d102fd3fb6d5fe7556d6fa8ad3dc7cad |     
   sparc     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/0eda7ad7a3779498024d8311caa2385a5cfbc295 |     
    or1k     |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/59cffce5b47706e06e7cbef7ddb12c6b5d736034 |     
  mips64el   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c6b35496b6b970c7eaa2925e229835ee30153276 |     
    arm      |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0a3f3855cd70c4825ee0035b8202e2fb77750aa9 |     
    sh4      |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e4e36af7376f35bdf743a2a8fac2c1fc2f76a0e3 |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/3f70ebe870662ac5e8995bc3b442d3157533ff86 |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/4e0b7c40272be4a40033e595dcd5b2d2ecb42733 |     
microblazeel | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/c6c21db607f7214f7b074cfe428fd76239e2d758 | ORPH
   mipsel    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/1cda8c6f8ad703d16f67fb8087f8522b09c4ee7c |     
 microblaze  |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/3e52eaf10dc48e5a4ffe365c6afc0bc28273e35e |     
microblazeel |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/fa9a8d19b347d434dd540523d02bf723318cbb76 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/66efab14f8e4e0016f738ceecbc90367e64df9cd |     
   arceb     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/e4a37c87e6128fa53188e27e7ec1dba6e1c2f5d1 | ORPH
  mips64el   |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/7938608225a7e1199f83c0e2d02f17b6cd3617d5 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/1f9fffd2b81a58167b3e3ff182c3004d3d5d55c5 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cb1227d089ee84eec12c1ccf9c7e3c7cb7d7db14 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/63a8bab26373ea301d950c1400234ed8a31a24b3 |     
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/25120423ed73f7c1997a749ee03fa31086905999 | ORPH
   mips64    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/e19d5236d871c3a1ec5e3d8bf86a680c58129470 | ORPH
  mips64el   |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/9695af2335bf8ed232e4923ed8175577178c4356 |     
  mips64el   |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/02dec3d0f4d403e5cb2982882eec0338039456e8 |     
 aarch64_be  |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/559fe1c10de78ef450cd78ea83e64ae0c3b98779 |     
 microblaze  |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/6551c555b33b0e39c8482a82eccdacd2f4dda200 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 3 
                       unknown | 2 
                        ffmpeg | 1 
               libglib2-2.72.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/26613e1eca6cc48d4391a3fe635af5ced17c3f51 |     
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/95c9c544ac28b36ef7524336a2dc3c852cc4aaab | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/50b2d6f5cd00be5b12a414de264cd1cfd2aa5697 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6510c18825a9c60f223946e768a0333548c2d9bb | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/eda82ddbb05551978cd4006b6cfb59a6fb3e7b98 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d3117411aea042ac0ad663d1394252d4797fdbfd |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b251da0419affb364ca365f34f1468866784b006 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 2 
            freeswitch-1.10.10 | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.71.1 | 1 
         host-sentry-cli-2.8.0 | 1 
                  linux-6.4.16 | 1 
                   pcre2-10.42 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b8b8bc4b6904c7ed7110bcd36cef833aa3b4c9dd |     
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/74210b1dd6c75ec141fc6dc431885056423e8b97 |     
 aarch64_be  |       freeswitch-1.10.10       | NOK | http://autobuild.buildroot.net/results/54fa068e4d1090249c8fbb9ab7aefcf8c00a4876 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/510e3d647737d7bb7b7108430dd7bfde81df5159 | ORPH
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/99a3ebe82147839d1eec4228d852d54a999273a4 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/fd91633969696f9cbf8321f93bb51f79ab036f10 |     
  sparc64    |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/56ca532ce53450ae3cb4fae4a4ec4bc281db6bee | ORPH
   mipsel    |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/bf9a8ecb29a3ed3be66675bf7589ecb80ca05845 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
