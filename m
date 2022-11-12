Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31517C4332F
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 07:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BFBA61007;
	Sat, 12 Nov 2022 07:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BFBA61007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ExWN0pTv8iEJ; Sat, 12 Nov 2022 07:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9DE46100B;
	Sat, 12 Nov 2022 07:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9DE46100B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 022C51BF41A
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 07:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6FA3400C8
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 07:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6FA3400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQWSfxeAV8JL for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 07:45:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D9EB40187
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D9EB40187
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 07:45:24 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 610086000B
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 07:45:21 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 12 Nov 2022 07:45:21 -0000
Message-Id: <20221112074527.D6FA3400C8@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668239121; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LcUws/1LCndw/K+WftKJdPjcSvd78bVxFA/db+nAZXA=;
 b=dtl7KGONKVPV2GPbnQ3EoHZsY5DkpLoIk/4+/GyCMJc0o1Cea/0+Hnu5tGGJSo2qH/KD9T
 z2PAcItS9ZPZUzqbVP0LM5/wGXfsnITlh8VbSb2maXMzlOFtL/uzx8Mx/D6aRjQpneD2Rb
 99tltDoz9Wi1YemaiwoUjjQpzTGjzi4M881RLXe6o51uE+6KLfYZvLppBtN2uqW6GYCrcW
 UIXxkrHngs7rdXHWNsYcALmmqz87vkF7tS5fwGjqsWpLw5k1QVFKsDgJ39VOpA7scoPu3a
 GZe/fJtk4hGcJjl8Qv0LEcIaAxypRNVLKnOio7qCU5PM5bLhh1XvL3KWTXwgxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dtl7KGON
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-11
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

Autobuild statistics for 2022-11-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  2  |  0  |  7  |
  2022.08.x  | 15  |  9  |  0  | 24  |
    master   | 143 | 165 |  0  | 308 |
     next    | 47  | 110 |  0  | 157 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 14
glibc-2.36-66-ga1dc0be03c9d... | 10
              host-pahole-1.24 | 10
          imagemagick-7.1.0-51 | 10
              host-rust-1.64.0 | 8 
                gerbera-1.10.0 | 7 
                   linux-6.0.1 | 6 
                       unknown | 6 
                host-go-1.19.3 | 5 
            host-binutils-2.38 | 4 
                elfutils-0.186 | 3 
                      xz-5.2.7 | 3 
                  acpid-2.0.34 | 2 
              alsa-utils-1.2.8 | 2 
                    brltty-6.5 | 2 
                      crun-1.5 | 2 
                 dash-0.5.11.5 | 2 
         host-gcc-final-11.3.0 | 2 
             libgpg-error-1.45 | 2 
               lpc32xxcdl-2.11 | 2 
                     lxc-5.0.1 | 2 
              open62541-v1.3.3 | 2 
   openvmtools-11.3.5-18557794 | 2 
                 uclibc-1.0.42 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
/home/buildroot/autobuild/i... | 1 
  binutils-arc-2020.09-release | 1 
             bluez5_utils-5.65 | 1 
              containerd-1.6.8 | 1 
             dahdi-linux-3.2.0 | 1 
                dbus-broker-32 | 1 
              dieharder-3.31.1 | 1 
                     efivar-38 | 1 
                     exim-4.96 | 1 
                 fdk-aac-2.0.2 | 1 
                   flann-1.9.2 | 1 
       freeradius-server-3.2.0 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
host-gdb-arc-2020.09-releas... | 1 
host-spirv-llvm-translator-... | 1 
                  jack2-1.9.21 | 1 
               libcap-ng-0.8.3 | 1 
                libdrm-2.4.113 | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.4.0 | 1 
                libkcapi-1.4.0 | 1 
               lightning-2.1.3 | 1 
                linuxptp-3.1.1 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
                   luvi-2.13.0 | 1 
mali-driver-3d697de9bce8bc6... | 1 
                  ndisc6-1.0.6 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20171122 | 1 
               openpgm-5-3-128 | 1 
                 openssh-9.1p1 | 1 
                   perl-5.34.1 | 1 
                    php-8.1.12 | 1 
                 protobuf-21.8 | 1 
                     pv-1.6.20 | 1 
                   qpdf-10.5.0 | 1 
            quickjs-2021-03-27 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
        s6-linux-utils-2.6.0.0 | 1 
                 systemd-250.4 | 1 
               tcf-agent-1.7.0 | 1 
                tealdeer-1.6.1 | 1 
uclibc-ng-test-6790eafe897b... | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/6e64cc60c931ef7726584e9094dca5c27dd0c281 |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/f97f506970c4e29cbc3e6a9edf0f4e5c79401c58 | ORPH
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/fea738e7178a8e65beb576b2a46b15ac78547ca2 | ORPH
   mips64    |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/269aab47524887ffad33c9851323b6589fdc9258 |     
powerpc64le  |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/90cfb1788ff03633fd3e4234a2c73fba99816d43 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/b153ee534f73a2c661f2d34f3e6f05e673f2a1d4 |     
   nios2     |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/6e99d4dd1c17f7047badb73f8732f73bab6bd839 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/edecba17c734cdc45dca6bda5bb615add77c8c25 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/61df76982f784e83943df4d16f27df2bd2de56e1 |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/c3baf402e7017f1813a1e925f3afad9ee20c6f9d |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2883b1b24a6e9f3aed55f8ec9355378210c93872 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e45fd0d582f6c401a08f07850044b83c55982e3a |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/75c7e74fb2936d4d7fc682c8ec6341e8b5b2fd73 |     
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e89921d5a2fe7989b944332bb0f748ac31d419b7 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/297a267f495dc165b6f5ead8b3d89d34f9721328 | ORPH
  aarch64    |         dbus-broker-32         | NOK | http://autobuild.buildroot.net/results/43abdb85cc2f386d427cec1cfa876e20e3509cb8 |     
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/2d20d4d1b9990d0b4762756815d8e4d788014025 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2653b5caa89b86a69043bd492dd6f42e29e6fa37 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/63cfb2b485460cacb3f344ca44150297a05d6124 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5c020f58404c272f71e1f99059894b18e8e35a9d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4a9cd826297d4a62d020fdf731b911c3893d0f24 | ORPH
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/5530457ba4e0eb75541c0fbfdb8b62d81a511389 |     
    arm      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/61a7da66d5ca9d4893198769991f8fcf8949263c |     
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/db751d16a406b4ea0a5570705cd9e45bc9e77ec8 |     
   nios2     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/e2f4f3b0c0de7853dd3b776fb75bbd7fa2425401 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/76e33bb2d7011236a7150e811c11ad6733c6d21c |     
    i586     |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/38ef88905a8095e477ec60b39925f283c96723fa |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3230bc8fbc886a740252d4bfc9a7e362c8e01d64 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1cd7ee916714ac8a87790352b5b0106f3540a7aa |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/713ad89d4ad23763c4d1659459816473fdbcd73b |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7b2b2dcafebc9a1e86d547b712da63a98ea66946 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6d5528918ba79c0771ef78d63da1b795ce6cc695 |     
   mips64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9c73bd55567ebe08bd450d6b11f4b2a740cbc0a9 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a0d0727556e5746ee1b91d3979d2abb94de11101 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/405d568ca8e0c94ef83bd35aa87bf3c350bf90b1 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/978c5ad611a9b6cd4ef0b13e0c8ce4fc12c215b2 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d83daadcc7b99d011af9871555a80619518ffcaa |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4c1614764027ed55fb6741fef88459b1efebbac9 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/07caa7d9c3d6d978f7139d82786dde0550e5e93f |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/bf2d38ff6b9282d00f2253548f5a28db1631ff35 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5a03236cadc14cd70099054cd9697b5e27c43b76 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1e84bc91146cfdc53c4786b77b2a565f38b34e67 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c3c6d20e6fb303b933a2dd5633fa140046f0e7ea |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3db16fd3d11672aea7e61d2ab42c8a9314defbf1 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/37759a6fa94630a284ed947583ce914d386d737b |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/de9dfeebb3ed3809c1a0d1c9cf5859dc21755142 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/451537078ee845ddac7825d67b36e9e0eef7522b |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ff34b87f44d7d6d8154cd18820dac23987652f4a |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/23ad46c42ed43feb73a4ea9c65e8503124591ac3 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/efaa4788142b598899edffb9b697ed5d74e5fd52 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ed82454e5d401f276985223fff341d784e815be5 | ORPH
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/854dfd5ce25b9552f04fc34c064e6573046deb9f |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f12d1a3b2778ae8abeb9ef72d824b7d99d94fb48 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/fa0cf1a8d800fae871e5a4d8fe887986178fe873 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/65cd526289261a8e649a373e83fa3b8be4144788 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/92a8320cd2a11d499ad7c1b3d94ebb01d21810fd |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/dd0b4e0efbd8f27e6e28d8d57b7778232468b0c7 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3e46e5a3e2950b83604514c19638626dbccf2d0c |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/88fa25f6da006be9b080857a8d63de8bb24e6972 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fdd1db5ca8b39958016b666843752fc6e7ee1f06 |     
   sh4eb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9037234c81ddc9b5a5b1f0f242dfab41f3d8b236 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1e251d604b3d2ec222cde4d799f7c267f7d07403 |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/884fdd7107347d8347975a6e85497bc638133c61 |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3f77de6f8c263afc4d8796d8ca6fea5f1a244747 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c9f11ee9d3e1307fc9e25631947f12cc37d15ed5 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b89e3b5177e18e32eb0b0a4c607582d64c014134 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ccb20bd6e28eecab6d03f53e251fe9a619c91180 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/02d582b14754afc5a1701e6b0552ed4cf26ffad9 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8b451ee911ef82fdc69b208dc11da1c7bb68fb23 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b1b2a84aa6d9cd968ff8e9fdfe6cb4c4bc1e33df |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b7cba42526d31d09341a1418294a97075d5c5e71 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/1e906ca98d3223e17ac659c191e08aabe988ffd6 |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/0c127ff05ce900f709d08cbde8ac0d92e1adaf03 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8ce8d8c6843265fd1c22e97c249433f43180f588 |     
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/671d69e761dd9b3d656f23737623b1fe8694c310 | ORPH
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/27b5a97a924bf9dcc8fd2c8ec689baabc18e1fcc | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/189500616b4d2f2ab27d1c24f512c9e03322b858 | ORPH
    arm      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e7640282b8e583d542e3e2120116f9aa9b43e751 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9fdb631e6ecde9278b3252c6f7f4b554816bca82 | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c4c8c7728cf2baebe224f9844fb591a9ca885bb2 | ORPH
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/b8df264210aac5d9a349b7ccd488572674a7e185 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/32f14f7b359c9b1f25978aced749e0ab191c2106 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3c40aba3244d385c438891d82a0a23fdd3a4a32a | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9310dad2eeccb4c5261e712a599ba7ea357bcede | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/79ba9e75f1e166fd920c3bd2dc284763dd03490f | ORPH
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c47691998f2f75339cd0249143b53c8e33190477 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/af0120312d0ad0ab8f37db3c2527f8406dc7e61d |     
    arm      |         libdrm-2.4.113         | NOK | http://autobuild.buildroot.net/results/b29f7df8fc6d891e9f13e071f6ddfa6f15270b27 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5cb5cb13fe7934e61f97367992a6bb6ad0e01f3e |     
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/74e9dd0cc859561bced8afd5169f43185ef37d6a | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c12afab989e44117682b8b7335fc41844aabdde4 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/403868754a8a356dbd2a16573f28ffe58ac7276a | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/122c72a719690fd3166f91ba72cd05c1327e10b5 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/92eea2abb67fc940e2d0cc785145ae940e5df2c6 |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5fd65d3a25e4e12277d5106b2bd7ff2635b40369 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/724c879297e32e743cc9a8918138d91c1a9fe9a5 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/08d6973d3530f6724492c280be350e65bc8ae579 |     
   sh4eb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/df9ced77c0a5705a23de9549e49748b8882668ba |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7952e4bd7174f44ac6cd93c75ef11cc040e02186 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ad984320fe25452268c8ad91cba8d26b59683d0d |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4169fac2c0492d7536c09538d6b12c854661c1bc |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8fdf895c67c242c73cec5ede60b9801c59039b1a |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/82c9accd9c2a9d083a10636544a7fe2fde59b5bc |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/cb296b1066b1167e3c88b4ff1ba41c56b833b875 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1f844a3359b2f95853111ec1895efb9828089f9d |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fe3e4cb20df43f474e669fbc1eefcdec9bd90e58 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4c81c5b49f09e11659aba78656af2cf0884a998c |     
  riscv64    |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/3d4ed77b7532b3618b9a0cc4234e4d565629b6fd |     
    arc      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e7991901e140713c1705a2592ab924a09cd0f0d0 | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/6a4e3cb3c5a72d51350442750406425eb0b7d95a | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/30b46715caacf49e2a4c4a936f4d37c3c2456284 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/91853f616910ddad9239cd9a790429c767cabadb | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/29f8ce10f59bdbb07b5d1dc341c2f61f864bd5b1 | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/0a522598fc96526df82581eebd291743786a9610 | ORPH
   armeb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/f939c34bcd6c92542d22f22f09e04aa2e71903e5 |     
    arc      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c1e91d63c633b6d4783f1a7ccdc2ebb1a2d554d3 | ORPH
    arm      |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/330f638733724ca076763ba2bec312d99f13eae6 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/eae660031c86b2f41bdfc6617efef96caa825fb6 | ORPH
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/4e127b14bd4a6058408ee992a75a5e40e9355a9d |     
   x86_64    |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/5ff3e018dd4dfd3415c890e7a045496ec7bb0c71 | ORPH
powerpc64le  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/e214f57b3ac3df3874f905580f9f798cdcaa28a4 |     
  mips64el   |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/60f5a3a0954685049a6dc471da25a54766a3d616 |     
  aarch64    | mali-driver-3d697de9bce8bc6... | NOK | http://autobuild.buildroot.net/results/73aa2a3d2265a840906e9b53dfdc05722bb393be |     
    arm      |          ndisc6-1.0.6          | NOK | http://autobuild.buildroot.net/results/091c5a8402f7c07f842133bd0ee762d5b96e86d2 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/eac3492bac17c329fb85e309a352113bc99bbb3e | ORPH
    m68k     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/1e80cd12261e09f6a32fbe00227b01c46098b7e8 | ORPH
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e1c815b304d15d0a1acac5655018e87fc4476836 | ORPH
    m68k     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/528b67695c80bd147dde09fa8645c8f24bab2c79 | ORPH
  aarch64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/eafc3a2e3c294e8a7fa29a415df1d248148c9cbc | ORPH
 aarch64_be  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/338291e5bf0671cb7ed7a32cc10e546c7a521acc |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/55267bf797d021ba5cfc84b72af9c365214eda78 | ORPH
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/a5d10ef08932211f770ff5a86baac056531387c1 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/9f6c7db003b849cb01235bd3cae514bd68164a53 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c7a0aec6a41c4ba6655cd68e4f8f2e5ac7f19355 |     
microblazeel |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/73c5122b3073e1cb9e42a53b6b1b59ad83de0d86 |     
    m68k     |         protobuf-21.8          | NOK | http://autobuild.buildroot.net/results/81422798d29a2ab2b0e1985e298f426035372c95 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/7eb48787d93a32fa269371d2f19f674e33a8dfe4 | ORPH
   xtensa    |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/80e3d02ffcaed6c0427bbfc6f85edabc89fed33a |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/67657728cb63c67d85ca3cb143c34dd15840921e |     
    arc      | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/1a7fa3e14a5ad2efb09222d40da742fbeec98371 |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/5ddbd0b6591aa161991cc67c11fbfa4a55ebc844 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/3ffaa9b3ecacc6ac326be78196af1ad613f195ed |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/bba90a41e34f8f4964a7c51aa055fd16798dd7c4 |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/00dfaf68726de1a071f6b318356642b5a96830cd |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/cea85fbf99b90a75bfa71eff64dadb6aee142a0d |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/6553f64982c5dfa001149d0638eb72251e28ca3b |     
    mips     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/3db6c401bec2e8f67de463c52500f779df4899ad |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/2b3a0793ad6666fc1dd08b86b5b1e1583a82163e |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/9dc2a5093c3fd066ab323b09bf162599daac96e6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1109f7f58daca4265028cb39d6938e5e3eee19ec |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7f324c882591da0a910059123c4f85e9cc3de604 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/788daf19e502c5bb03c8581883257da8c2968a24 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/3254f87c71a32912cb2233e9c8c93633b343a897 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1158cf906071708ba2cc691290b6e8404011681d |     
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/42c91922ce28ebeda3b812728a6cb17506b5e376 | ORPH
powerpc64le  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/43277531154dd942b15fb67bb931a3d340fb1c5d | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/dc131e5cf5836d339abba81816abbf99fe2ed397 | ORPH
  mips64el   |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/fe37bebf4231cccac7ddb43cc3a532b90d124a0a |     
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8a59ff4395301d8795a0ab7d7a4bf0f535a02010 | ORPH
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/3baff633284245d9538b2aff9e7a505282bf61f6 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1dcf5f985a89f338d6251b36408aa9cf8f59841c |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6eaf64da170030f0fa741ac8c02e74208c633095 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7ebde71d9900c56722f3661ce57f6a3761c40238 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a7a623e7a7927fd41bb5bebf608fa73fd40b0560 | ORPH
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/1d7d05e5d4ba88b6933489f3ce08991524610fec |     


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 10
          imagemagick-7.1.0-51 | 9 
glibc-2.36-66-ga1dc0be03c9d... | 5 
                   libnss-3.84 | 5 
                elfutils-0.186 | 4 
                  jack2-1.9.21 | 4 
            igh-ethercat-1.5.2 | 3 
                    lxc-4.0.12 | 3 
                    norm-1.5.8 | 3 
                 dash-0.5.11.5 | 2 
                  gensio-2.5.5 | 2 
  gobject-introspection-1.72.0 | 2 
            host-binutils-2.38 | 2 
                host-go-1.19.3 | 2 
                   linux-6.0.1 | 2 
                linuxptp-3.1.1 | 2 
                numactl-2.0.16 | 2 
         s6-linux-init-1.0.6.3 | 2 
                       unknown | 2 
                 wolfssl-5.5.2 | 2 
                    brltty-6.5 | 1 
                      crun-1.5 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
              docopt-cpp-0.6.3 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-server-3.2.0 | 1 
                     frr-8.3.1 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
google-breakpad-c85eb4a59b6... | 1 
                       gsl-2.6 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-12.2.0 | 1 
              host-pahole-1.24 | 1 
              host-rust-1.65.0 | 1 
                       kmod-30 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
                   libqb-2.0.6 | 1 
                libressl-3.6.1 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
             lirc-tools-0.10.2 | 1 
               mariadb-10.3.36 | 1 
                mongodb-4.2.18 | 1 
                  netsurf-3.10 | 1 
                  ntpsec-1_2_1 | 1 
               openpgm-5-3-128 | 1 
                   perl-5.34.1 | 1 
                    php-8.1.12 | 1 
            python-bunch-1.0.1 | 1 
         python-greenlet-2.0.0 | 1 
           python-pyicu-2.10.2 | 1 
rtl8192eu-1e15b6d451731bc4d... | 1 
rtl8723ds-76146e85847beb242... | 1 
              sigrok-cli-0.7.2 | 1 
                tealdeer-1.6.1 | 1 
                      xz-5.2.7 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6d842a50a3ef1b7e27a2929c38db841eca135c53 |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7167e42cd36b0d29321b4018506789f8e6684706 |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7d2eb954095c4925799da68c7155923d9660e6c6 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/34644f455c6dec383c79bb0b4056027331ee2036 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3953ade4f265b7a7d1e45ddc57c4038b889195ea |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6a21a9fee869f34948df210f761e08ceebc28942 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/23d13bf8f1f4b93a12267db5bebb0b2ea5f06757 |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/84d4f6e7db0f02aaa20feec231d7f1ca7606ebe2 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3e29dae8d0d24a6930f92b24953b0e9c12384607 |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/807e85d586b4635432e3a2a8a107d4170f6aabd6 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/7c9f9e17da195d99321272ef212e58ebd832070a |     
  powerpc    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1d3ca339483551a9cc5ebdcb8d95b69bc03665c2 |     
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ce5ce537e308df763248bf158db9f3801f5ba436 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/fdf4f7c6628747fb0c5331986a574a4ec29558ed | ORPH
   s390x     | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/68b6ae29a0c20aa1468d72d8e90ecbbe4ab6fc6f |     
   arceb     |        docopt-cpp-0.6.3        | NOK | http://autobuild.buildroot.net/results/22205f585d6a61db207b9891e7b4caaa029acb81 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f3cd7d472343b48d22791c0e8600719a08772a61 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/72f4b25bb6d2b4a1cb3365b58fbfb02442cb54f4 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8a3950d98c28c12fcd1651bc375ef609678dea86 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a3f311cfd55a92f04e8de1533b3e00e3a9dd38dc | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/a498cc856006277f3e9ed8cc1a5d21c4070f93f8 | ORPH
   mips64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/e20ac49f71c82ec36ebe8a1bb4bca0137d63f2dd |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/662270c278e482d21a8a4d8a61b917b1ad9e09cd |     
   arceb     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/1a1b693b8d9ac9a12861083c0db65af1ba82afad |     
   armeb     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/efc4366f9b3d353b8cba572ad8d607faa44c7a70 |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/23cfe4af21f845c69c407b989018cff978179f75 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/ede604c30c2571f3df903c554a603a3f835f432c |     
   arceb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/df229295d02e1f4cccd6b4c56a42b11fa1aac1db |     
    sh4a     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/2c6ca54b747a6c7802fd75e249760b07fb4b49c3 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/2985c94c9ee6c064070db6734653a0d68ba63547 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7e1fe64cf6f9e4811e155413dc22c3429c03b191 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6d107ff01dc854243727ce2cfebe6eddb30ec17a |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/984a6f53f1bc1bf0a348c20a083a450a52b11e73 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/81508d516705ddf6f6311755f369883e50d03dd4 |     
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/481b36d466b9a5ca7248ab44a5618dedf7ac53cc | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d169494bb21af4514f0715f6a3a3cd75a260e229 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/5e75f814d785eff146d7c2ca365ca63b51dcf368 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/602f3822beca8a4b7a2d4d043e2fb131c75f4f87 | ORPH
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bb8fe584199c4ab8616640c075893f2638a535e1 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5bf688c3e838530553b61f96d962d8f84e222d99 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/149722150e839a012cc542fcd4b27a331f10bc89 |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/72655232794d69582c0d92163c59fe61b36b110b |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/66c038b2fc3467444236f53629d852c5dc08c628 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ba45d8b481843aebd5f481a06208b6d9e2409b4f |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/944cb4d30b105de084d63e0aa8c913bd9a143361 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/77e20a747f82c3c5cf64c8cdf01bb573a20b16e1 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/59a9a47912abab15ea7fd0a877579b3efd1873fd |     
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/c4438848752ea3ff8a525ef6a8ff8bf6f32b75a4 |     
    or1k     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/80bd7654d9f30a35b3e5bad27f360b4f3ede3f7c |     
   armeb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/031fe3301ee7bba09c3dc292f1faaf3a0c25f933 |     
  riscv32    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/f58a0b4089d6bb44275357dc4a8a424fb5bb1a63 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3a5430e01c3fb1823cb26e3f22c2d3ac299f48b8 | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/cf9f565e26db82ab757eb9adf4e7ccfb5fcf64c6 | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ba7073e743b0a84d848fcef30d3f27cf1f25b050 | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/bb507bcdcd1a94be090caf1f14012dd825e63a5d | ORPH
    m68k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/da64977538fe2d082f15b4d40ba508843d76af26 | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/153e60e1b82be801e551cb49c918866c5623a175 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5f352845680a154bdd0b145fe0798e42c559cb61 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/92fa854b3764c8728f35f6c4a8b9b6711f3dd238 | ORPH
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/df05b939c0e8228fa95bae6c3d6ae3a640f95e39 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/6d1148af65ffecd0e4f90303e924f172e8b6d2f0 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/05fc0bb1f4d61abd0708c7c2fcb6bd4c56f667aa |     
    i686     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/bacdfb71d1f78bdd831f15334f0704e6b1178838 |     
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/db0c8eda76ab9bf9a455df6683fd63a80f978541 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/42ecf1850b960efc5d002ad923da65e74d694278 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1058616a07cc10790dfd0ba8f32d3db49dfe1f87 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2490bff8205b4acdcc5cf7d78bec7d7433107f81 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/aeed2a9520e2f59d91a597f1e026d6fa8975f26a |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/cddab26e21275114b29468d9ae1b8c772cdfabe3 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9a04e9719b999d933d97b3767b1dba8e8c7247bb |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/73c2405e45bc43c136c162980f7836cc69efe06d |     
microblazeel |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/a9f1fd65dcc24dd85d981dc41906677a852335c9 |     
   mips64    |         libressl-3.6.1         | NOK | http://autobuild.buildroot.net/results/2b5085994da03e537c7c1ff761849decb31ed540 | ORPH
   sh4aeb    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/14167bb8c44797c8769481c48c4f78629f9caef7 | ORPH
   sparc     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/d08f715eb4ae29e81cc7f23bcab065331668784b | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/c5f5dd60b749d01f76c6a9568c7cb288f4c19bfa | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/2e2b392d5c6a895083e2388e1d6426f5cfcf4b59 | ORPH
   mipsel    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/abc4548e594a83b1b828e8ad7d79c45b0e5061fb |     
powerpc64le  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/711201f6d0ac7dbcb747fdb0609a9f53ec64a204 |     
   mips64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/6f7c55b505401d4a4d014d0e31134bd8aaf7d9fb | ORPH
   mips64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/e6621defb848f0a245c3a5690e5c24f89f5f9f9b |     
 powerpc64   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/43c224ba5e7d5be9ee7e93594326eec3bb4cd403 |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/fe8244efeed02f17fbcf43514e459495ba7ae5b7 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/dbccfd6cd467e8daf87c82ca0a08ecd5ab08649e | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/78bca1201fbfa668e33cb19b998ee818a5eda348 |     
   sparc     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/4f8ef72e4bbe0bc79a6184d1c6e00b253af82bba |     
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ac03d085bcfd10fc6fdf7e0f4f661817ef6ead52 | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/05768edceb6100eeb2d01f35343743bf3a723b44 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b9e3c58d8746b3124bd298929c1ad08bb4b05446 | ORPH
microblazeel |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/cb431901c22e6ffb3249180bd0bc53764ce867e1 | ORPH
 microblaze  |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/7c6de4638e19ebb709d98fde55f149c1205480ad |     
 microblaze  |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/eff532e48906f39ebc0e152e43951ac641bbdb95 |     
    or1k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/3ab6d7f9ee841fa18c1c220d722b1c06ca1fff30 |     
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b01013415056b8884da57b066bfc431d59668b09 |     
    arm      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/c3126d418539dbc0dca8023ea98dd7f5b9d5cdc2 |     
   arceb     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/bb36c3f1c0633644a3107161c15c51bb9f5dd047 |     
  sparc64    |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/b4053a3ba1761701d264d7c2b31adc5bf8a967fb |     
    m68k     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/a95bc1f57407e92ea6f9888e78e43e8999f8e7c4 |     
  sparc64    | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/05a34deab9f641fd7f66427d858dc5a65b7d3e08 |     
    arc      | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/3fb4bb9226ac659c0587c33db9866ca268d1ca52 |     
    arc      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/d6cfdd427fb4a1e3d19ed95bdad0d7553ed9e1f8 |     
    or1k     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/4d81732f78eb695b724dd4c5c22b5f60d659de92 |     
 microblaze  |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/f3b290e4ba98e1fd3f43ee9c23c94bb49dbb686f |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/f4888f9cbd6c413f47d04673a812822e7fe12a36 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/1f52849492277bd0af8c0d0d447720eaea2898ff |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/1708aa42042f3141b10c11705d9e3f0617301ade |     
   armeb     |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/92e7a6be93454cdf4c89b807a9cee4d487789440 |     
  riscv32    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/89a86d6b951cad15e3766ba2ea54a9f1389799ae |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/11aec13986068f69b1b538d8e8c60a9cd01c2b19 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c8bc9833b7c26b86a1bbeb99f6ebbf97f6ce5cd6 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/0d8f8aff18d3c98c46b37ab75a136704f43fd0a0 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/68acac45ef79b1bab1b6456c31bc973a68ccaa20 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                 linux-5.17.15 | 2 
                    zeek-4.1.1 | 2 
                host-go-1.18.8 | 1 
host-pahole-73383b3a39afe86... | 1 
        ltp-testsuite-20220527 | 1 
              open62541-v1.3.2 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/bbe3aa4a317805b973ab714d8bc07ffe595d168c |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ead5437a44e0d9f2c21fa5c6fef427a8fc4c52e6 |     
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/f8f3c6dc7efa1ebf951bab40d69fafcc2bf41f13 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/aeda9cb128d74acd10bf1eec016f358bb34857e8 | ORPH
   mips64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/fa3ac6d97eda009aee933f232b683bebd1c80e6f |     
   s390x     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/65cbdddafd1a1fe60d8351eebb7cb5d944c24f35 | ORPH
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ac6bd7c51aef7915574e67defae17812cc619753 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/ae9dddcf501740fc516109586fb25bbafc1d028b |     
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/2f39bda73f59195752d9ec0433a6a3acef9cfcfe |     


Gitlab CI results for 2022-11-11
================================

Detail of defconfig failures for 2022.11-rc1
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861356  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861474  |      


Detail of runtime-test failures for 2022.11-rc1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861545  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861548  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861550  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273862450  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273862454  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861625  | ORPH 
   TestGdbHostGdbserver9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861632  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861639  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861827  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861871  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861883  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3273861929  | ORPH 


Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821171  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821262  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821264  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821323  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821325  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821326  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821327  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821374  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821388  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821541  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821555  | ORPH 
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821581  | ORPH 
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821583  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821585  | ORPH 
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821587  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821612  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
