Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A256BC071FD
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 04:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5062A41D7D;
	Sat, 20 Apr 2024 04:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mj33goskWdfr; Sat, 20 Apr 2024 04:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F22415D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1F22415D7;
	Sat, 20 Apr 2024 04:01:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52D281BF31B
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 04:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F151606B6
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 04:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0XDa6y3-IB0 for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 04:01:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 299A860685
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 299A860685
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 299A860685
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 04:01:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A47C1FF809
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 04:01:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 04:01:17 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1713585677; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WAsWfDBNEh1K8DKlLGijdDTiK6H7sllY3k2NWMDs84I=;
 b=cfKDPr3TQ3tt9WnRf3TO0lr4hlFZuTDGGWLJlxz6c1r0Cl6FQTIh7UY7vMTOKyPD/jU5jR
 yUXIFKjebIw5a/LWfam9K3nclUfv46Rj53QMfo4XJcOwV9NOfeXiEaQzCYHg6x6Vjk7ZG/
 RLnM0FMOo1CwHYOqPmp8QU4hRTEno/JydUeMW4tf6hxGOydbsiSrJmVQ4fiM8cpoQUIaIW
 mClUp7TJU/va0LHTfevrcWL0lOpPVB3ayF5pkrj4WikJldK4WLhCJvCleYfrHXFnyDBlgv
 LeXeDLTKt5SrtOvlIYVsxjHW1q+N4dBm/ILTPrX8HClx5JT8rCgZMlzfdl9ltw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cfKDPr3T
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-19
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
Message-ID: <20240420040117._I5hX6JZUFKsq8x1z7BUpvYDnyV8Na66xFFEwIqpxBw@z>

Hello,

Autobuild statistics for 2024-04-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  6  |  0  | 13  |
    master   | 78  | 89  |  0  | 167 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.189 | 5 
                     mdadm-4.3 | 5 
              libopenssl-3.2.1 | 4 
                       unknown | 4 
                fail2ban-1.0.2 | 3 
  gobject-introspection-1.76.1 | 3 
host-heimdal-f4faaeaba371ff... | 3 
          libcamera-apps-1.2.1 | 3 
                libressl-3.8.4 | 3 
                 openssh-9.7p1 | 3 
               apcupsd-3.14.14 | 2 
               asterisk-20.5.2 | 2 
                    bat-0.24.0 | 2 
check-11970a7e112dfe243a2e6... | 2 
                 coreutils-9.3 | 2 
                    gdal-3.8.2 | 2 
   host-flutter-sdk-bin-3.19.5 | 2 
        host-sentry-cli-2.20.3 | 2 
               ipmitool-1_8_19 | 2 
                  libsepol-3.5 | 2 
                privoxy-3.0.34 | 2 
             util-linux-2.39.3 | 2 
                    zeek-4.1.1 | 2 
                bpftool-v7.1.0 | 1 
                 dhcpcd-10.0.5 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                     dtc-1.7.0 | 1 
                    dust-0.9.0 | 1 
                  ffmpeg-4.4.4 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.18 | 1 
ivi-homescreen-5ab78a19e95c... | 1 
                  kexec-2.0.28 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libarchive-3.7.2 | 1 
                   libnss-3.99 | 1 
                libsoup3-3.4.4 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-6.8.1 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                  ntpsec-1.2.3 | 1 
                     nut-2.8.2 | 1 
                openswan-3.0.0 | 1 
           python-zlmdb-22.6.1 | 1 
                   qpdf-10.5.0 | 1 
           v4l2loopback-0.12.7 | 1 
                 wavemon-0.9.5 | 1 
                xenomai-3.0.10 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/569792f1c8f0aed5dade4da9118725a5eb83b423 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/67a7ceb9e1779510cf59dab6a837344824236f5c |     
microblazeel |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/f8accb306efcfdfda819c65a42c452e14337c8a5 |     
microblazeel |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/4cef1b63afc64fc3ddce8cff533bed876a100ded |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/b8a83d0fb0f04bd962937e45223003081e33d9bd |     
   armeb     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/94d8407f32bb15418498c23a3b1eb977ae94fbaf |     
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/47f36cb5c4149f396ef6ab97a5b3e4077b652a4d |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/8ec377b608afe9f0e2d37b7f319e7ff66877b8d4 | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/5c645e2b90d0564362393da971f6427fc885dee6 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/66b8e95ef94d992b757a9319413ec36d9f603031 | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f4e6b598b886b43e0c19975598a3b80e65d933e0 | ORPH
   nios2     |         dhcpcd-10.0.5          | NOK | http://autobuild.buildroot.net/results/0cccbad8a3bd54d0fe27b6f94d91579ae2875b28 |     
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e48e8705752c3c38fe3222271b6864f162b5c8c8 | ORPH
    arm      |           dtc-1.7.0            | NOK | http://autobuild.buildroot.net/results/53433b43734378aa0c2ae1383867cdd17db8c199 |     
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/ddf8d062ae816dfdbb79ceb3ec6cf1c8fbcd1baf | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9619ffba2e52e22201962be6905fa6ea14b356a7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9a6245ad48d68399395ac2fee6744a82a5e59b9f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5b9d04eba27d283e4109cff3c53a67f8d2d9ceae | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/42a541a0d60c0d4da1dedf99b55ac8c9d04bf1b5 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4094c0bc01498f5f8d71202409f3a6349947ec2d | ORPH
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/457f11e56046f43ec36d0420de983d8ac5763a40 |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0c5350da6e64a1697dfe99663c2c601a9adcac6a |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/103aa7cac8681443fc19bd39c0176779df97c9f7 |     
   arceb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/42a5244ac0c388a0bf7cab836e169062eaaf2699 |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/c4909959aaa6c6042503858453469e3582da6c3d |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/018d941802f4ae3faacfee3e70889dacdea2a653 |     
    i686     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/32f682eb3fd380679b8ec896f0945306e2e1c3a0 | ORPH
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/527cc9e7d1e3f6817145a5eeaab546aaaf6400f3 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f578704a1d65415a80638556cfd18fe6913417d2 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9d17817e29a25efeb37cba79b695f8462ddbeb0f | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5d43643ea5142457b67c8caf86440baaf9f2f9c5 | ORPH
  aarch64    |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/41805850c2afd6dfbffc1038a73795f0662665c2 |     
    arm      |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/8b0687f051c498000398528df9049865d6eda947 |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6f7e9041ad1d6e3fd30bc887a2e74ba7008fa04f | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b989caaca3eaa7c40c70767daac6931bee43931a | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7dfcc9fbf0e66c9b54a85e9040cec5fa883e0e30 | ORPH
   x86_64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/985206a1fb69c7c8bfa04cc905067dc9ec73103a |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d83170295e9a1472580d190c89db6abba63a2bad |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/f7d851c9ee7fbbd5161c79e70556acee03aab867 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/c78e828c29b6ce28c39d128e68f24f8fcea395d9 |     
    arm      | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/690337e77594af5ed726c51ee5f779d84d85cd34 |     
   x86_64    |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/0dc1edfe4eb3aaf21515cae8d3a443fae98837f7 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/0ed811880c061a9207a6aa472a0515477733c585 | ORPH
   armeb     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/9c1d5d4b617499275e5033b1a0e67a50458fa23e |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0f4b401cf5fad1b863acd5b01651ae3382b0c07a |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f2891a227f6266472296397e6d236b3a94855c3e |     
    sh4      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/302ec53e80e227b66ce4c270610058c08db8837b |     
 aarch64_be  |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/4950d1a314ed7714602088450e7d5577f9debf4c |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/0e77cbdf160c1ace7b7fec219ba718dcc4638888 | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/8ec4604667063b9e95b49107ba0624beb9cc6e57 | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/fcdf4fe97ef54bbb0bec2888442d49d8a9c999ea | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/0aa35aac2be4ed3459920c9342d6eba235451d63 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/06e01c11a4623e5980096fa34f09ed76aa1aa528 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c37feb8ae0a1059ef710984a8ccde4b4c8bdeb9d | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4983639f758acb3d1ed043df8a60bffc6ee40cb3 | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/ea101b40e6c22a6c5b55ff2635a8c1e593c2d175 |     
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/2b1f834cd58387d710931e711da80c4d6cc86822 |     
   sparc     |         libsoup3-3.4.4         | NOK | http://autobuild.buildroot.net/results/4fb9f4c49777dde3abc30bb9f324816d3ed87567 |     
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/d372869cc069e297f68bc5f0170dc56e768a793f | ORPH
    arm      |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/ad1aaeab25044549effe55d8dcf46f53d86f45ee | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/f94a5d42a6754ff346e0a7fe18be965259dab056 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/8641da65afaf29f0ea4704479f4a1191871d1f72 | ORPH
    arm      |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/fac33bf31cb7bd8845c27f45737d2bafa045fc43 | ORPH
  mips64el   |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/171ff3608241e7239b5ac67600451c5c80f21760 | ORPH
   sparc     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/e5f8d6cc448da0aefb57b7588dc70a31acaa807e | ORPH
   mips64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/51cc0faf5622a98571335f3710b147271da8d552 | ORPH
   mipsel    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/14ce4d035c5c2461015b81b17f47e61792bc58ab | ORPH
    m68k     |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/e237ee43065abe01474bc8bd18882128a3ed8174 | ORPH
    arm      |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/529fab648ea0a05c0decb5675be9be90ac4761a2 |     
   s390x     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/8b1a60e89f12e583afc05e251266293ceaa89da6 | ORPH
  aarch64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/75aa2be3a913d7136eda3d56da6a06e756f18440 | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/7ac94e5585c9c43cc78d1ba3e32a978b144ca9c2 | ORPH
    arm      |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/22e190a2ca2cf0e029de20e6f40c107416adc706 | ORPH
   nios2     |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/795ccd39d60748f4e2d0e163adc6d68e7860b700 |     
    arm      |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/18924daf55c7395cd71d978c6b1fb50d65a7189b |     
   mipsel    |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/673887ae76a39ae60c7302572feebdff7bd56d8b |     
    arm      |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/b90d518f31bdc76d8774aa5f46a0c91098850bee |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/6f48a972d36a328b04b46c73be2538be9d3868ce |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a3a46ec0d4d429094af2b8cac9b7a0739040b64f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a11a4b27669a26bb010472439168f842f0e4efd7 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/3c94671feef34cd09ffaef21fda4622f72bff314 |     
    arc      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/ae3d2db32e29aacc065c1bc139f9373f90a718a8 | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/7c01dfbce044d0a7a5d83035d2d5bebf703a1df4 | ORPH
  riscv32    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/7ff065bf8cac7ab841d4e2b3db11653d30565527 |     
  mips64el   |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/f42ec3aae65f6313aadfdeb731ca565fe007b719 | ORPH
   arceb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5b1084a046d655cbef734094b4506d24ae2f0bad |     
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/2b8283cbcd69df414603afb33667ed23e6405c90 |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/c9e1f3bfa6d78c94c881a108bbb02617e466debd |     
  powerpc    |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/c107304710a7e82f0356b600357e8b40e46c6114 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

   host-flutter-sdk-bin-3.16.8 | 1 
          libcamera-apps-1.2.1 | 1 
            libmemcached-1.1.4 | 1 
                    proj-9.3.0 | 1 
                       unknown | 1 
                wlroots-0.16.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/fa6a57c5bb5d37f09732b483e7864e3ee68b8ca5 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/fec20b9dc9728500a86b9cbbefe2cd4ad8902547 |     
    m68k     |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/c08753167b65f6f5f5220ed3085f84a1d51e7529 | ORPH
    arm      |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/83d9c1c4c7a59df0b5f9042d7a50a8ae1b7fe30b |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/9deef1d5eb4ebe51d5e1620d3cc1389b2f966953 |     
   x86_64    |         wlroots-0.16.2         | NOK | http://autobuild.buildroot.net/results/fab30ff682fa6ac9cabbd51cdad2bd182c051e16 |     


Gitlab CI results for 2024-04-19
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119348  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119351  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119355  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119361  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119384  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119386  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119389  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119407  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119411  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119414  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119417  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119422  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119426  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119429  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119432  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119465  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119483  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119523  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119526  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119535  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119545  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119547  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119556  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119558  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119561  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119563  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119564  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119567  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119571  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119576  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119665  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119685  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119717  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119726  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119732  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119757  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119761  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119782  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119783  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119787  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119799  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119808  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119819  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119817  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119822  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119825  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119829  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119863  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119871  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119888  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119890  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119946  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6664587290  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119951  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119961  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119988  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119996  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119998  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655120001  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655120002  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655120005  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655120011  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655120015  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655120016  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655120032  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6655120033  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6665749847  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/6665749909  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6665750454  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6665750569  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6665750675  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6665750765  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6665750835  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6665750940  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
