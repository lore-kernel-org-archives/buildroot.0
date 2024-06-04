Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8089C25B74
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 04:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 836BA839E6;
	Tue,  4 Jun 2024 04:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcXKZAo7A6sS; Tue,  4 Jun 2024 04:08:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AF1E831CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AF1E831CA;
	Tue,  4 Jun 2024 04:08:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB3281BF344
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 04:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D236605A0
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 04:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdSRYGHgVWkE for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 04:08:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5163A6100D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5163A6100D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5163A6100D
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 04:08:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 750401C000C
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 04:08:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 04 Jun 2024 04:08:30 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717474110; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jg3OkhQjhULtLbyrGJ/uvmgcIuqGMTf8oHhlg1gLuN0=;
 b=QIHXsK7TD4R5e3wLSeQxUDWR9WbOjDh3HgaqcmgAMEKOKHOI54EResQZ/VELxLmXdiXwOS
 P7e/O3NE6mFLQ/JfmEadeCC7iia4UTvjsT96oAlpDsM2yosJP/3nMAyTBLd9k6P/Sw/6gG
 6rRSzBT/FpWhsq7ZGvpZ/g/U/K6jH/nx47LjJ3hI1WjiOMClHROGfpv0UQtjGoOqHq7m1f
 fG8jGqtQw87YgJLnyZs/C5J/6LH4r6e21UuJXZFPBtDzE3AUWqsiizWEe4Zt7FHvR1Xbgk
 G6TjBuQW3h3wiXzV+6Sdi09zrRt/bzcbpr0PNcIjCOo0Wo49RZBB55nH7M3Lyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QIHXsK7T
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-03
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
Message-ID: <20240604040830.IVQv8ZCuNiXlgsssAQWizVizI3_c1ORzxmPHlDkQOYY@z>

Hello,

Autobuild statistics for 2024-06-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  | 12  |  0  | 16  |
    master   | 101 | 304 |  0  | 405 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 42
            host-cdrkit-1.1.11 | 30
                libressl-3.8.4 | 15
             host-vala-0.56.14 | 9 
ibm-sw-tpm2-5452af422edeff7... | 9 
                  bcusdk-0.0.5 | 8 
                elfutils-0.189 | 7 
glibc-2.39-5-ge0910f1d3278f... | 7 
aer-inject-9bd5e2c7886fca72... | 6 
host-android-tools-4.2.2+gi... | 6 
      host-riscv-isa-sim-1.1.0 | 6 
                    mpir-3.0.0 | 6 
                fail2ban-1.0.2 | 5 
                  ffmpeg-6.1.1 | 5 
                host-go-1.22.3 | 5 
                 openssh-9.7p1 | 5 
     bandwidthd-2.0.1-auto-r11 | 4 
        host-python-lxml-5.1.0 | 4 
host-vboot-utils-bbdd62f9b0... | 4 
          libcamera-apps-1.2.1 | 4 
               libglib2-2.76.1 | 4 
     linux-5.10.162-cip24-rt10 | 4 
                  linux-6.8.12 | 4 
                       unknown | 4 
check-11970a7e112dfe243a2e6... | 3 
                 coreutils-9.3 | 3 
                     frr-8.5.4 | 3 
                host-odb-2.4.0 | 3 
                  libnss-3.100 | 3 
              libopenssl-3.3.0 | 3 
           libzenoh-c-0.11.0.2 | 3 
             util-linux-2.39.3 | 3 
                    bat-0.24.0 | 2 
                   exim-4.97.1 | 2 
          gitlab-runner-15.5.0 | 2 
                 gnuplot-6.0.0 | 2 
        host-sentry-cli-2.20.3 | 2 
               ipmitool-1_8_19 | 2 
kvmtool-4d2c017f41533b0e51e... | 2 
              libarchive-3.7.4 | 2 
                  libffi-3.4.6 | 2 
                  libsepol-3.6 | 2 
          linux-5.10.162-cip24 | 2 
               mariadb-10.11.6 | 2 
              skalibs-2.12.0.1 | 2 
                  acpid-2.0.34 | 1 
          alsa-plugins-1.2.7.1 | 1 
                  autossh-1.4g | 1 
                 avro-c-1.11.3 | 1 
                     bc-1.07.1 | 1 
             berkeleydb-5.3.28 | 1 
                   botan-3.3.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                   bullet-3.25 | 1 
             cni-plugins-1.3.0 | 1 
             containerd-1.7.14 | 1 
           crucible-2023.11.02 | 1 
         docker-compose-2.27.0 | 1 
           flatbuffers-23.5.26 | 1 
                   foot-1.16.2 | 1 
                    frotz-2.54 | 1 
                    gdal-3.8.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.18 | 1 
                    gpm-1.20.7 | 1 
       gst1-plugins-bad-1.22.9 | 1 
                 highway-1.1.0 | 1 
             host-delve-1.22.1 | 1 
         host-gcc-final-14.1.0 | 1 
       host-gcc-initial-12.3.0 | 1 
host-go-bootstrap-stage2-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  jack2-1.9.22 | 1 
                  kexec-2.0.28 | 1 
             libiec61850-1.5.3 | 1 
                libpcap-1.10.4 | 1 
               lightning-2.2.3 | 1 
                   linux-tools | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20240129 | 1 
                  mender-3.4.0 | 1 
            micropython-1.22.0 | 1 
                    ncmpc-0.49 | 1 
               openblas-0.3.27 | 1 
   openvmtools-11.3.5-18557794 | 1 
         python-remi-2022.7.27 | 1 
           python-zlmdb-22.6.1 | 1 
                    rtty-8.1.0 | 1 
             sofia-sip-1.13.17 | 1 
             stress-ng-0.17.07 | 1 
             strongswan-5.9.13 | 1 
               syslog-ng-4.7.1 | 1 
             tpm-tools-1.3.9.1 | 1 
                 wavemon-0.9.5 | 1 
                    zeek-4.1.1 | 1 
                       zsh-5.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/71962181ca914d7ba3e2acb7be7cde65f188d02d | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/cfaa37599a6e19ef08de92762869280943ea14a8 | ORPH
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/03476f07ea6e09b7f8e523bed6952250fafd8777 | ORPH
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0e74a5ebc829beb5e8857229bf8f012cea4ddfee | ORPH
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/214156a511a822c42787ae15aa71a7094c6646a2 | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/401e86f6738f3beebdafca0843b5777258ea14e6 | ORPH
    sh4      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a78fd9fb19d2ae5eac9bdc6c74ea5c826cccb889 | ORPH
 aarch64_be  |      alsa-plugins-1.2.7.1      | NOK | http://autobuild.buildroot.net/results/ccdce1729df59279b7b67f0234ba4241aa6b9ed7 |     
  aarch64    |          autossh-1.4g          | NOK | http://autobuild.buildroot.net/results/4210055e1f00d1826aa8620eb98359b58488ad15 | ORPH
   sh4aeb    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/83a9e39e6870f4b7ab085478259b3eb88257562b |     
    i686     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/873f50efc52795d433c671fbb7c415f47844dde9 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/41767d66bb579a4991ce430742f6b5d1809397a2 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/356a1b34f51edb8e0dd40d2274aab68c2e24894c |     
 powerpc64   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/1f8e7f50e720bf3e20489a48668560b8deaa10a6 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/cd4cd2a783c9ac5249abe2986e2c7dd2fa02fcab |     
   armeb     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/58b8dc9d596283098e1fe531168a727cf2396f34 |     
  mips64el   |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/96700fce143a17a09a2de38d5e61453b44be16f5 | ORPH
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/d2bac0353950b1e1ebde72a01c77bcc7f22f48c9 |     
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8e4a39b1ab99684cf192387e4156db3b65e836e9 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/ba3f2399f6892778d5850ba4bfe4a0b56ad0770e |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/334d08f62172495476c7e97688084bf92613e6f4 |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/05a222e115ae90732c0d251aba2cd231f62afe31 |     
    sh4      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4168ab4cf75dbabdb02b8a6240f72c5319e325ff |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/9f000bf7c6a9cc792d4739a8c8040d6e9428bc8d |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/36d56e297f8a21f2d2acc9327665c110aa60c8ca |     
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/82a07e379f8307a1b769bb767a057d4f20652edf | ORPH
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/887b211e61c972bc8579a54d2afdb3f9ff848067 | ORPH
    i686     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/2649e7810d32ff53a902606453957102c4a5f251 |     
    mips     |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/21904f769854d706feb6efc3fc060738988ede40 |     
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1574add0b630c873c506a65821bf3a02bf65c670 | ORPH
   mipsel    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4b055a4969b2419da08718c8aa3b57bacb0129ee | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0b4c06a3df201e6fdd445baf5dba408c5fde3090 | ORPH
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/20185353db002fea5bb1e82860a8cd076bec45ad |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/7e5e3c430327cde8c3496630dab7debc00cd61ad |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/41c72c87976cc5da2ddfa7738d266345c717be92 | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/0d64b3e7a2ae28b089b8f0b3830ef975b783bcce | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/65953cea0e06a1fad6933d0ead0f07ed649fbc83 | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/608b854f994cbff9d740086307b4ad62d318a83f |     
    i686     |     docker-compose-2.27.0      | NOK | http://autobuild.buildroot.net/results/28879f51587fcf83cb1ee2684c54a0771c7f1fdb |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d3ef69e63955cc8ff5640209ed23baad14f43eca | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/019b577cf0529922228acbc6b66f5ff41d22d866 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d4fa03fb5f3e70d16898f47db9fb9dfdd9fa4afa | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a54b513f8281a4d4bab229ea39c987f29c8f55f1 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/409a03eb62b4c2250b8da309c9e1b5141dcd27b6 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bf165fc2345913767b0b47e3db1120d741a28124 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2f7ce5a1fe1c88b337d8c12e18144c84af4c815b | ORPH
   arceb     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/148336b79b1a43ded9afb04b2e15b176eefd1773 |     
    arm      |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/769f76ced6a767ff4f1296642b454afdd783f956 |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7ed4de67efbe404e014c6e8668c7daf41c06da01 |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/a7e9a6438864dfea952134d6b9a9210ca72b12f0 |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/fda05624135613bf8a6b608ce6d5729e6b59fa14 |     
   sparc     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/cf754a857f0c69244bf2f584c069158d5828b996 |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/3826bc646a398d7a8130833e3ca252c7676579fd |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7092d0603d234f4deec06fd0dd2e2cda1c68edc0 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/21a07bf4abc24eadf8c6f24f944ef94e47f97358 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3a632fb19682efe6d6dd1103dec4928facea3f03 |     
   armeb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/6568c2d93af3b9eece6f8c14965a51ca07020705 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5bf8349489496efb65adb24fa593b02d6bb37f55 |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/37bf048b222a9d256cb173209d4e803fa2a8eb17 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/36703b6ea0cdee586f524c0eda907ecb69fa4025 |     
    arm      |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/9a4c607e4254bf1a07a8077ce125d6185c98ea6a |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/db13b608859fed65f7fa9b04e23ab4b25fcb6be4 |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/41acb898b956e50520de136db5ad10730692ffc3 |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/eda1a2c3565b53b0f7ffd9694a7f8af17980e82c |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/cc0fb5b6c1c1fe35b29bad3eab2610c919e00fe4 |     
   xtensa    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/ff153c064524d283c66a52e7ecda6ce7f1caae3d | ORPH
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/b6d343c162f018ff47d42b941e78192a005ed5ed |     
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/8b155dc03f7582c6259e901ab333157283855d3c |     
    arc      | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/6c6ebe1349f2122dc4cff259da0ccc47365844d5 |     
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/15a6374a92ea4685c11dd4edf86b3c00094f1cf2 |     
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/329b29127be3639e10ea525c9fb091316d5a8935 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/2a317804c3ee1a974fe36295b5598887812a79ae |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/7ac19e508f284338acf749f827a2ce682a0e4dc6 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/cd14bc02fa789d4ecff65dcab80f28e24c3dfa06 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/c26723d6fe37379cca2651980b1b05eb1d2a1619 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4138f62dcee663a5b1e57c0030a78bb784428aa3 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/ad82648315640a8d959bcae5d5ed845350ff0197 |     
   armeb     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/0960502d0c2e47797ee93a503ec5b53bc32e4317 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/73513e348f717c784fa721d3efc9e84257df8942 |     
   s390x     |    gst1-plugins-bad-1.22.9     | NOK | http://autobuild.buildroot.net/results/c7a668040fefbc32c9bea94b23b267795af99a82 | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/2f03301d4252e90fb8f9f24375a5572fb023d19f |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6de95ffd39a1d35f7c157a95e47546922bb93c16 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b28a20b3d3adaf2fb1e43542198aa41f55c4d72b |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/701bdd3ed343b5b07b66776020ba248c25b5aa79 |     
   sh4eb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ddf42fad1a7a7b4ace517715334e1b77dcd537de |     
   mips64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d73c1dd8f8ec64873271c4a1e4d6a5a33bfa74a6 |     
  aarch64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9cbcfe105452dd57b96976d9f8ad1503af09288f |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f3215730ad80830f22e331eaa107c31afa4b4502 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b85bc800817b9c639515ef3a9bd2df3d7c6cf4e1 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/36d5001ef0a99cdda7baf617767b4ea72ccd2290 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fb8344f2a8e4cc6e628416be719836b477b744b2 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/411865da891a94a440c69454b35c14cade1b8e78 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ab8ea974099fde7a2722177366ee25ced664e502 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1d5d9008b6a45e75813b75b5a571e1e899e99449 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/deedcb85e24866c9d034125cbc30679a4db26731 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/83561846cca794992c7dd88718a3dc2254fd16aa |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/20a17f36fb75ae4e35255d93269fe8593200511f |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b99eb94701daf8ed45399dfcff9e7327261e8032 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b5348685c06b99f485ae65f99ec5b2380a9e6ad0 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8cfb51eda2540b627c506471ebc6a902a5f9dcb5 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b9664597eb79fabe100dc19f013356a5811d4dad |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/69b13d37f2bc33a26d3b25a7ee66c5dab0291876 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/88a3926e67e00c0a1c64200b2fbe07905e19393c |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ae539ca7a0499a3f98956df29d94a93c6a49e20e |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6a6f13d3affe9e198b3815ced0ca4c7c15f920c8 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ad05498a44ef1beedef1bfdb0f3723d1ee47817b |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/693d7fce8a08a11633aa282aa5b6b13dee781d07 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/53bc195cd44bf07e6e1a0143932e7d0fa84a538a |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7b1da6294f806e098adf618feaab0230cc8f2113 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9fecee53609a71eea54bfb3bb35b2b40daedfeba |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4133bc8057db2a21eaed41a2bd408ef02e11c635 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1a63bc14b5539160aa2f09b420031e061b94fe2e |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bdac9f5d96bda7dd6c937743c5a3081bda8a14cb |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6562d3f2c2497894921d880305ee264460730313 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4e01506131ce68d430fddd2fdd024cb21db15472 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e9380329410925c577888569e53e01f62775c8ba |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/02d3f5cb64ee9fe58e263b1be00f1ecb14385aac |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/b005e53e3cd7f29d5226e7fe7d5fa67cc0dc55a6 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/f5ec6a3179a2ab7eb5ea2927536c175d5c253aa6 |     
    or1k     |    host-gcc-initial-12.3.0     | NOK | http://autobuild.buildroot.net/results/501d1983f9a4bb888707656f7219e6496a94ff5d |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/4c1bd15a58c095fafb57070855f6bd953227138f |     
    i586     |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/eed37396bdb9a66db42aa715b045ef4d06a41644 |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/74e7492ad6f24753956c5e5f81b3fbed4af7943b |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/22dc9b98b5aaa960c5256c4f641ced5e86ca0ee6 |     
   mips64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/f5b9c11d3ae23061dec7a0c59fbdcc8e99f61d0f |     
   x86_64    | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/caf749bc6bd9ca851c3a12aa21e65a4867e41c7b |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/113464c285778323b2172852b21ecdb2a3caf26b | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7baa37383d0837797c4dff404d9ffbb781686473 | ORPH
   sh4aeb    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3e61cde6bb45cd9c439c0e8f0f0560e53b661e4b | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4888f45361f1859119b90165d7dcb4bd54b816c2 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/67714eb190654d9b3eb344bebff113839ef83a9d | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/16dedac989c71c5368d21dc29e33d89af1af1d20 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ae6d67ecc4128869d8590d6f901919a625155551 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/96a6a70be6408a328cabc3e0c506c7f68ad749b8 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1e354579759aa6c7d0bf3e846ce70d22bb9a48ad | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cccde936c97c384ecae03e6d53c1e32ed61a90a5 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a264b7a85f7b5f55f59aea948da565ae17069c38 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/018f2958df3e7e1f3f08f013eaf7ad6ebf5810d9 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8795eb0b118b5819b69d77f844631b31541784df | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a018efa5d3976b6747c576d8824ee6997f8b0e07 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/aaef8268c1601940fd7e745e807b9269b34be50d | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f8e1ac9d02b4fdeaeb4d6f1639142698c3abb8d8 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b6ce82f528efb1e89dfeb49ed54c15efc1bc6b6c | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/963131377137a4e0ed54c538a8c86649f9c39a55 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/52937c5a85f8c7d7d30e37a5622a75913b9f3e7a | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3f9246d619d2ee986835087c5320f23f4370eece | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dca33a333f6e79cc47750d58008f9c340e0a9e9d | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7f08254bb7abba27624790340783b6fe4d9215cf | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2b77270d30bbce5b9296cdece0c9d9be5983b8f7 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0d1eb68073a287269e31f38be42191c5f0e7d8e4 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4aaae5986c01cc584858dc3a54be4a7be3c6f390 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9383a4af7ca592961c17f3bd1b21e41d275b67bd | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1c78b80b91230845c7a06195d383ccfaecb0068c | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/65987d8346c48d50134c917a6365ea11fb5bf33d | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c54fda1f92b69118b9798a7c3c8564a40914460e | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a33ad4393aaef5446f94e72cd7cdf6f92bf0b21a | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/39a0e07000d4e6eb7c17470d8b2346ac44e0c910 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/578f416ef0a591c89184a63b8817e7324fd90b8a | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0c227b2af53302239f66cc73414aabd991d6bf5c | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/07bf5515862fbc15bc34645a5716370a741a4c4e | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a464f5c021a20a111bf143000f5ca9d2f9b5e17c | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/74e3cb3c62886f4714c5858038a5fa73c740177c | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/51efda966a794f59d746e1552953dcd985621aa8 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7015887f8f74d6ee4aa7900ede1fb7c070eb4cdb | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c5c93dbb72730f1806756176466e718ab569b887 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cab282c91815c36c4f924c7bdda6239bb3759214 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5834fed1eed55a34761ac202f017de7db8eab2d3 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d982082101a1316cdf232a7d1bdf75776b5d63bd | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d7eb6cddb88fc55209689fc9978d484f5645c497 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fd5a472ea931c842cdbb1d5e04796adf364cbcec | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0ca3757d5f61d8dc37e277aa44aee37e3dbfc892 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cda7e11f9224ff3821ea0d64c4bcbdc1b0f2e59a | ORPH
   sparc     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/4977ac89bd3716552b91f71d5d36344020aef29a |     
   s390x     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/263da35aeaa1abc0ba5ac8c2e9a58cdbb6be1abc |     
   s390x     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/bed6ef216cacfe552b5aeba363937151bbaee277 |     
 microblaze  |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/b300677f83d4948141e5a70b08b1774c8c09420d |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/71fb3751cf2005a445243b0836210babf677dd15 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/570ba5282c63a8e64b354a849b9b3d7e1db7b1db |     
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/aeb9f8e3374da7065a3dbd4a5ad2529916ffaae6 |     
   sh4eb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/313839092301195433f43021809d4e7a13c898e5 |     
  sparc64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e11240ce48989260ee9268f2a9fbe3359f4fc974 |     
microblazeel |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6fe257fce5590dba10dfa8453638e381476e30d1 |     
  riscv32    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/1e382ded29e6d63c73297a9d7e90ff318ff8119d |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/254e6099f436eeea0ee1d9b2cb03192763aae8d4 |     
   sparc     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/e55c9bf5635f06dea2f6f8518dab398ff54119da | ORPH
   mips64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/e181b0e4d9994091f06f6aeff5c285ce4069ea17 | ORPH
 aarch64_be  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/8e9a7c2e8ecace62e21118e9f4af03e42a2d193f | ORPH
    mips     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/237edc4f70d3f6d0c94ddf64e126ae0c1afc60cf | ORPH
  sparc64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/a3258364e3c123d83178abaeee01108b449dcfcc | ORPH
 aarch64_be  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/1305716a9fa4faa5c39dd3b94a91a13f741ecf28 | ORPH
   mipsel    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/945d658dbe1458838279d448f974e1d1502714bc | ORPH
   s390x     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/edf4ca488f45b73df87c70b618e42c935155e97d | ORPH
    mips     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/f087b879167252690ed198de771292142c6249f8 | ORPH
   sh4eb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c7b0803525e8a4f3cebdb70b734ef2e51f97f206 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/aac1a23fa99d42e2916248e389ce472cc73f1c38 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2e3dc78c5f048a3bdafcf64f672413b45e324cb2 |     
powerpc64le  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/888d569e7b44f11bfe2aa8311507e049753764f9 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ab9d203905609dcbc3ead81361f253bba0b48d91 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/332eec835d0155eafda2da8639f7f08fabbcb2ce |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/31c129132aafbf6afbc3d99a728087b8a3f18931 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/cad6727a4f54a3307768dedffb1855e14bed2c46 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/cbaf51f016e855a94da8377f9372d317507cd3f2 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/abdcc52106111cfbc929c4959892631df9324bb9 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5ce43094cd3f68a7b64dc39a449bf49969f2e6df |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/92f2d1fb413b137b5ef4ed4ac5168a4070c9c683 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1f48e8375b41b0c3d0811c2039d9b1a45d43dfa9 |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b40be286d7521f63b175d8cc9b5ad4a736542105 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/993c55d500e240445bc78beae8c315942cdd02ce |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/b2c89283831dc9674c9bd54f9b7bc781619f1a5b |     
   s390x     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/db6ca0935ba950ccbc9ba24c28a6b4e6826bceac |     
   armeb     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/dd7b7c8020eb607549a8c9cfcec60a60b3c392bd | ORPH
    i686     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/ba6700799f956f69511f21f63f19b45d654773a7 | ORPH
powerpc64le  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/704e38751453bc37fe2301cf2c6cd64dd381f704 |     
  sparc64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/092bd8b2e017529333068125cd15d63bbdf0f7cd |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/953113a792b548fd377368d3fc1e365cde2c0d88 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/831b25f78b62f19086a44b4f2c1a2559a0793b80 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/aca6fcb361fb158a6e900b7c8ab701b5ecc7f750 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f45495e4ee24863e0fd9151f98b927b7ff67116f |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ce261296896d112283940cf41f472c41cb12aad3 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0446e9b3b25ac2922892b84ad0c225fc9e78b162 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/42a451b3280f043ab7562be431fa8a083bb328b0 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5164807d9cd384549fccce719a9b4faf72dfaf97 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b195b51d2b7a24239d7f9c40e3254ff8986125d1 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a247b3864e30da8e0de334cec768e2c846493f96 |     
    or1k     |       libiec61850-1.5.3        | NOK | http://autobuild.buildroot.net/results/aefeda9ac4e79c1b4d73f8fb611b11ab937a49e3 |     
    m68k     |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/c6653c912ed86da53d51f4f2323411777048743e |     
    i686     |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/7bba6f860723e4b778139c656a0fdf9d7198ed41 |     
    i686     |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/5124182462d0453c5fb67aadb5240e8faf2938ff |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/15eb32088bb1b3a89bb731e6063f9b1b5ac89d80 | ORPH
 microblaze  |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/0e4732236f23292cd16058fabb1c0aa27a234d1e | ORPH
 microblaze  |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/91aa44d389eb18292cc49d9d2ebdd13525517854 | ORPH
    m68k     |         libpcap-1.10.4         | NOK | http://autobuild.buildroot.net/results/cde2e40859e6f49be3ebdf193b7688da5d8a6d81 |     
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1247162c0b09502ba7edc5108f3017d7357b1aae | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2a1ea13b0f8a68ba2ed444788763d857fe4b25f8 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bb3a5c3e7d7a221e2a4c81557f7e293b9770b5be | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/734dcbfb44ae217a69bedcbb06aaa4f901be8e77 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8d863c48f7ced2b3e26ba6ba2fe9e640aaa84a61 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a4c3c313fd83f9462b2a99287cc8e6bd3cc5e1ef | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c3e66f8494c2c43af70305c9edc25a45358c1793 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f9170402add178e8d0e048da60b6cbf664eb5866 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/dc677835157a43b86a07bcff65e0246982f8e285 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7affcf4c71d7c59ff7132adbe64cf8e42e7e6e89 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/480c6bf270f73e232475a9ac14a60d042eac3606 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c197e8e415eaff1d87766a950473a3bb2cc88809 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ffa9c5f2a0ade830f4421f075b04a655379313ed | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cb9edfdac08cfafa4c315a2dc7598c21458bdb84 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/83ec3e06a5d3a057b3db969da5c84625dc226840 | ORPH
   armeb     |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/002ed98ef9bca74ed111fb02029ae6cc6fb577ef |     
  riscv32    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/1af4012476c3bcf774b4597a75eece4266d5dd26 |     
  sparc64    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/c85927b1dd25a84981adc5cc537eb07d02da40bc |     
  powerpc    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/5389ac0174791b3d899fda7769b4f0f2dfeb805b |     
    i686     |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/285bd8f5aa338dbaf9ac0e5f78593b10bd54cbb5 |     
  mips64el   |        lightning-2.2.3         | NOK | http://autobuild.buildroot.net/results/661874be34234ff6b8e20f4c18b2b1d1310d53a2 |     
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/8986482ea82c810283830fb6fc3517b70da4a611 | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/8c92e45bf7ff56bb9d366d8fda2b3b979a0ed315 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/90fc5b18cd6df5eea1089ab37265fa753b35e3e7 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/3435e100366ddf0d994dad47cbe61a032549432a | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b3123774027239c505aaceb6f249f7d771800d0f | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/36115190a9f24e452276752240c2cb6376d0f48b | ORPH
  powerpc    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/2b853b02243037751a45e9201d802e26b942b57d | ORPH
   armeb     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/588ae55cb5ef38e88369186e8cb93b32b69f4cfc | ORPH
   sparc     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/dbb7e85a8ec00e0559a8e572c2dc627b85e5dea2 | ORPH
    sh4a     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/03c8c4701d83c570180689d827de9f73f5693802 | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/f297e931ec804e9567aaf91dabc902ac9a95a6c6 | ORPH
   sparc     |         logsurfer-1.8          | NOK | http://autobuild.buildroot.net/results/5b1e4ec5158496a5f6c981cc5415c920dfa7d739 |     
   sh4eb     |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/fba0b96c1d3fe590f2e49d590c7e51b174b67f43 |     
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/fa23e51d922a0184c95759ecb8eb1fa29843d07f | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/4c9191da744aac0eab7faa02838690fc423b9f26 | ORPH
  riscv64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/82c274c4a0a9f2c3c474778f90c337e49cacadae |     
 aarch64_be  |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/ee8bed866c31b05c27d746658183cd6d57ec4850 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/507673e070cc152a9c7cd3297a45115e69767587 |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f261982d43fb1416dd82147ceaead70c985c7ab4 |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/94a4597b25d1116133da35d89712af8eb339f89a |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a421a7ba46f83a8a3397cf825857af9d91348d75 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1809da67b0da5a680df9018b6f7d58b6958dbc7d |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e19243404c0128e55e6d1737076ce1ad50ea5f42 |     
    arm      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/9f96af95310b1a92507e87d3e3c39de133244a7d |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/cb428611450de83228ccbeb965b6ef16b956b422 |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/fcc8ee31a9eb97f72911bc396f12ae5fd0c6fee7 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/98f11c72f70f7bd95d315fb5462e0bb620159151 | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/95c3c38b0b4fb1dff97d155af6c73a956e74d2ba | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/0ffa39184caf98183b248816b698d639d468dffa | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/530c101166829a3c423ce88074c3f51810c69e63 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/7118447fef10591b89958209c9424050d86f5a45 |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/b85463a086c032062795db96d3c84059e3088329 |     
   mipsel    |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/6535c47e94bc85f030e95341e799acafb46e4cc5 |     
 aarch64_be  |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/3739e71e406f25edd56c11bf62e9e7d02fd338d0 |     
   armeb     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/32cc6ed7978ea85b52fbba93ebc2aca89fa3e383 |     
   s390x     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/f8b4e3b12c4b5a4794d4328d0b826db759862d31 |     
  mips64el   |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/1ab3f1a4f5826b12d3a2cab89fc3e1413ff79b53 |     
    mips     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/cd28f1c4b2284c04ab895bdbe6116bc8a3c8b889 |     
 microblaze  |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/3d366913119e6dd95a9faf90e565270ef5501e2a |     
  powerpc    |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/221440353dd6760d1b7df00dd3978ba0a7c98c73 |     
   sh4eb     |       tpm-tools-1.3.9.1        | NOK | http://autobuild.buildroot.net/results/c62ee7f9ed6e800e679875d4783ea44c6bd20d4a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/87d36d8d76c9786f720ff0cf1553008c6405a193 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/73f23d8defb6e29f234663c0650995e80584b677 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/6750b6725b94596a239d301084c7b3228646b01f |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/98ccad100210aeea43a1dca076e08c5fa461400e |     
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/5147886e1cc9c873d80f1ddd8e8b7cc6bece7bc7 | ORPH
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/0162e49738bd781c9b0c6255e7c45d4d69936475 | ORPH
  powerpc    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/1fc767f9c058c867b47a808d86653e3081fe1bd5 | ORPH
 powerpc64   |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/cf0ce1bf1cfbce3583bc35a38413f3b8294bf7c3 | ORPH
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/42fb33b5f92971fc627a035fc32b998096e16f61 |     
powerpc64le  |            zsh-5.9             | NOK | http://autobuild.buildroot.net/results/af3d23e53a469eb2e020debab29c7630f6d6e682 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               belle-sip-4.4.8 | 1 
                 coreutils-9.3 | 1 
                     efivar-39 | 1 
  gobject-introspection-1.76.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               ipmitool-1_8_19 | 1 
          libcamera-apps-1.2.1 | 1 
            libmemcached-1.1.4 | 1 
              libopenssl-3.2.1 | 1 
                 openssh-9.7p1 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/f6287c83d77ea76bbe5c4af1dc7b929fded0c797 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6d791b4331253d2e68a804c8599d2e5724b6da1a | ORPH
    i586     |           efivar-39            | NOK | http://autobuild.buildroot.net/results/93e23e2b9c5e21c1498450036da332cf82e0f4b4 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/41222e977287949a6bb0fc848d9b8369d6d11cd2 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/727241c98d4ab16f29facb98224e80fd8aadf6d9 | ORPH
   nios2     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b7372189639acedcea4c20f99e739ec5249bdf60 |     
   xtensa    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e821399d8360a7e6d4c242e2ad2d0736c58af168 |     
    arm      |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/964f6c7c417d80dfeda8173b43b2bf40baef0444 | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/6a69dd92e93a6940bc3bcdfdf4a8d65d24ce1600 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/8a39618e32bd1ad27523dc37630403210b34a9e0 | ORPH
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/a08112b503d7c326d6df299fc48cc077c9776622 |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c8371cd0bee76cfc515bc38fe72531c6329b8a1b |     


Gitlab CI results for 2024-06-03
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6999549163  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6999550762  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6999550766  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6999550024  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/6999550144  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6999550184  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
