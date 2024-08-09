Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62337C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 07:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02AE5412E0;
	Fri,  9 Aug 2024 07:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIGbH4zWaXtQ; Fri,  9 Aug 2024 07:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 160FC412AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160FC412AC;
	Fri,  9 Aug 2024 07:08:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A36F1BF2F4
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 07:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2433940FF5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 07:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWB9HgxyKMVK for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 07:08:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 902E240395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 902E240395
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 902E240395
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 07:08:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D519240007
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 07:08:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 09 Aug 2024 07:08:35 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1723187315; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BXTTH/BwR/888E+9mKpxZipkanPV+R2iZFnYNO6JZ80=;
 b=Up08+PwLjbbKbCkhBpPAeWyeDPvMabCDNQpaZkvbFXt1ynJGBctIyUxY6MGy2B8pL4A01L
 S25PAha+FLnqYeUdPPK8qxTQWdfE0/oA0Q1oneH3yoRpcy0mjZo/knJpCM/Mbgxn7s7C+Z
 6aYNqlm61X9vphDnF/oBV+TekN8QjYdY6ZglDwI9AKIozbA/k/sluGymj09gwbifhZ7iC6
 JlkWFy4W+78uT5gVpl+TMQtYlbWbO33UO/hg7zBoW+2v2kV6MpmPcGJB8sW4ofAIaspK9M
 NzQYmI4USl2xvbLwqHQsvoJmQI+avz6vkTHmMlezXFdiPZuhn1EUNxhBrFR8/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Up08+PwL
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-08
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
Message-ID: <20240809070835.bfgsNNErVpOuqtKSo1A1UL-igbljweZN5NJ5--f5EYQ@z>

Hello,

Autobuild statistics for 2024-08-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  8  |  1  | 16  |
  2024.05.x  |  6  |  5  |  0  | 11  |
    master   | 120 | 213 |  1  | 334 |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 10
host-vboot-utils-bbdd62f9b0... | 8 
                  libffi-3.4.6 | 8 
                  linux-6.10.3 | 7 
glibc-2.39-74-g198632a05f6c... | 6 
      python-autocommand-2.2.2 | 6 
aer-inject-9bd5e2c7886fca72... | 5 
                     avahi-0.8 | 5 
  gobject-introspection-1.76.1 | 5 
         host-libxcrypt-4.4.36 | 5 
                elfutils-0.189 | 4 
                   foot-1.16.2 | 4 
                gnu-efi-3.0.18 | 4 
            host-binutils-2.42 | 4 
             host-delve-1.22.1 | 4 
                       unknown | 4 
                  ffmpeg-6.1.2 | 3 
            gdk-pixbuf-2.42.10 | 3 
                    norm-1.5.8 | 3 
           python-daemon-3.0.1 | 3 
                 apache-2.4.62 | 2 
                   atop-2.10.0 | 2 
                 c-icap-0.5.10 | 2 
                 dc3dd-7.2.641 | 2 
                gerbera-1.12.1 | 2 
                     gpsd-3.25 | 2 
 host-binutils-bare-metal-2.42 | 2 
         host-gcc-final-14.2.0 | 2 
     host-moby-buildkit-0.11.6 | 2 
              host-runc-1.1.12 | 2 
               ipmitool-1_8_19 | 2 
               libglib2-2.76.1 | 2 
                 libssh-0.10.6 | 2 
                  libva-2.22.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  nginx-1.26.1 | 2 
                 openssh-9.8p1 | 2 
  python-pypika-tortoise-0.1.6 | 2 
         python-remi-2022.7.27 | 2 
                s6-dns-2.3.7.2 | 2 
                     shim-15.8 | 2 
              skalibs-2.14.2.0 | 2 
                   swipl-9.2.6 | 2 
               valgrind-3.23.0 | 2 
                  bind-9.16.48 | 1 
                  boinc-7.20.2 | 1 
                   botan-3.3.0 | 1 
              cache-calibrator | 1 
                  cairo-1.18.0 | 1 
               collectd-5.12.0 | 1 
                 coreutils-9.3 | 1 
                   cvs-1.12.13 | 1 
                 expect-5.45.4 | 1 
                   eza-0.18.22 | 1 
                  fbterm-1.7.0 | 1 
               freeipmi-1.6.14 | 1 
                  fwupd-1.9.20 | 1 
                     gmp-6.3.0 | 1 
                 gnuplot-6.0.1 | 1 
             gnuradio-3.10.7.0 | 1 
         gobject-introspection | 1 
             gstreamer1-1.22.9 | 1 
                 hddtemp-0.4.3 | 1 
            host-autoconf-2.72 | 1 
        host-berkeleydb-5.3.28 | 1 
host-go-bootstrap-stage1-1.... | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-libxml2-2.13.3 | 1 
              host-rust-1.79.0 | 1 
            host-skopeo-1.13.3 | 1 
               host-zstd-1.5.6 | 1 
                  jack2-1.9.22 | 1 
                libcuefile-475 | 1 
                 libcurl-8.9.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                 libgee-0.20.6 | 1 
             libgpg-error-1.50 | 1 
                libmad-0.15.1b | 1 
                  libmnl-1.0.5 | 1 
                  libnss-3.103 | 1 
              libopenssl-3.3.1 | 1 
                libselinux-3.6 | 1 
                libshout-2.4.6 | 1 
                libxml2-2.13.3 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
                  mbpfan-2.4.0 | 1 
                     mdadm-4.3 | 1 
                  mender-3.4.0 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.35.1 | 1 
                netdata-1.33.1 | 1 
                nushell-0.85.0 | 1 
open-plc-utils-1ba7d5a042e4... | 1 
               openldap-2.5.18 | 1 
                   perl-5.38.2 | 1 
                pinentry-1.3.1 | 1 
                   rauc-1.11.3 | 1 
                  screen-4.9.1 | 1 
             stress-ng-0.17.07 | 1 
                 systemd-256.4 | 1 
               tipidee-0.0.5.0 | 1 
                tpm2-tss-3.2.2 | 1 
                 uclibc-1.0.49 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.3 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/3f6a3a558917ab41f1443216997ec3d4fe5dfbcb | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/496595481cf17cdf8defab61addf38ea0ebec5c5 | ORPH
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/009e514f311f1e069cc20e3872ed0f3e90b5510c | ORPH
    arm      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/5e77ebbbc4debe4d2d45a2df57556f5b5155608d | ORPH
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/1fcfc627147aa2002fc7d336cc801b5cfda52ea2 | ORPH
 powerpc64   |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/07245d3e80b9143012f398a5929669e2320f13e1 |     
  sparc64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/c7e1d53287a1b9d170624e5497296a0580870c82 |     
   mipsel    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/02441d2f7433cead6c980dad593a278d8b861f49 |     
   sparc     |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/49708fec1e68328a6d562116c652bb4bb4c0e2d9 |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6f80884535cab726f5b626b9d68337192587f0b5 | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/53a7dcb99881a3aefa101d2533e9634d4712d222 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6464e6e15ebeaa1421aef9a24ef05fea0c5f5265 | ORPH
    i686     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/47d271c8d2e585958d06a7b5dcd2641e91e29f2b | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9b5ee70b785b91ee1fc0d1e451c1c76c69e53089 | ORPH
 powerpc64   |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/5f51f5bbdceae44e18a60103688665917dab6bb3 | ORPH
   mipsel    |          boinc-7.20.2          | NOK | http://autobuild.buildroot.net/results/2290be92193a4cf1518e70a3400f9306b5918aaf |     
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/3d4903df862e12ddac235873ecd0da0f89949523 | ORPH
  powerpc    |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/0baf7f0e0b0062cae448ac3676a5f94d13ec3508 | ORPH
  mips64el   |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/9eb0bcacd34513adb2472edb6cf2d24de7eb84a1 | ORPH
    i686     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/791cb602934256c0d6a6f18a6f31ccc24e63629e |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/53abdf802bdf846dce358470cd1e722e1c9d3644 |     
   mipsel    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/75ca1c1503e90b1c9dfb3aba6464fa7c6a3243f4 |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2a96747cf06dcb86e32d61145e49d3ded9672c8d | ORPH
  mips64el   |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/4b561b7e7137280ff80addc55760ddee11added5 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ffd3856c50cb40687af71b22750f25ea035150f4 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/78a4b29a51ff5fcdc7bf1852f77bcf290cdfbef5 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3e75fff87e32e3acebbd707efee802646cec38ec | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/396c8c9e6ce272df8283330e941bc3a9441ca91f | ORPH
    m68k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cfcef8e034c428cd01fd6b1f936841efdbd782a1 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f5de5ee34242b099e77460c70520e226898787a6 | ORPH
   mipsel    |         expect-5.45.4          | NOK | http://autobuild.buildroot.net/results/b51dd5c2dabf37e6341f4c592986b48f88a07aca | ORPH
   x86_64    |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/b27bf84099c8c0d4949c308c77e98a285b0a9134 |     
    arc      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/3652c6410d76b1e4c8895d1cd373393132a8ce21 | ORPH
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/d37b6b4eebf4f5a8e14e7303f5f3c1595e389e23 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/9729e62e023576b93f0e38b5e62c6ba93ac3b8f2 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/7557d90b29055c3bd338bc55a01607eb1238ad4d |     
    mips     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/c1586c6d25b99b1602a991ed9893d8e29399ee1e |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/b39c85af7b89577818e0c94de5950df874927c6a |     
   armeb     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/b8dd6eeb27b7c4e328d2db23fd75e2c493a4723a |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d546925b17b2f8c4962b3af38a14375c5c619279 |     
   nios2     |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/05019297c0158cb33ede8dcbf061c186054f9e3a |     
 aarch64_be  |          fwupd-1.9.20          | NOK | http://autobuild.buildroot.net/results/9eba9aa7b45a5ed3b5e970285ace4f212e15fda7 |     
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/dd81433328bcdee388f54ffe7e78ed47ee64a7da | ORPH
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/d5047c5aaeae7105da7943b41cfc24d44717390a | ORPH
    i686     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/1523065e1a132324c7a3131247b39aaa13fe1d7f | ORPH
    or1k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/b1d3e91bb45b9205abbf0d5573b31b4f14b670eb |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/bd968b44606d90e92596ddce3b4b6b9f1c7466a2 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/9371eda129a833e5181b91b51f1c5d2207335af8 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/357ae2a64a1d80794ae0139f4f8c4c52307732a3 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/8e7786de3a387f50a7736c075f22d722bb9fef29 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/cb50d0bd0297f3a992892a9becfe8293e09db205 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0693a0786b1c9b80f5cfc8a65eb669d660b2049e |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/563f1b78448fa46f89b8b5db7bfdf7bce2e57028 |     
   s390x     |           gmp-6.3.0            | NOK | http://autobuild.buildroot.net/results/fd5e4c523af804dd65b6280801893631ef043682 | ORPH
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6b3ed75b90cb47d4d2b143d3d8139802c7c270b5 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/62102a3e97adb532fa7689c34d4c99cc341ec41f |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/54c91dd44354c13377b29879c6ba2ecf31bec9b6 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/82baaad3665b5de4a049eac8b450805a7f81f73b |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/bbe7eb19ea4e237bdf42dd61a35b729b25342d9c |     
  aarch64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/4c92949ef74a119d9a70e4fdd55af05a66580b0c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3ba97f8dac38e68ee9c9a94d8254af31a242f9cb |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9a5f9ff31d9dddfe540bd9ba24511d4a0f778d1c | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ee1514ecdafa3223e6094a76c2c5f6483e7fb124 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d444eeede58b0fdb0953da594ecfc6817b522085 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8e32b2603acadb87b56c7257d68beff39336599e | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/dda7818db17fcdbdfc29fb0662811f6da79d5472 | ORPH
 aarch64_be  |           gpsd-3.25            | NOK | http://autobuild.buildroot.net/results/c039989947b960ac6af17c87090366abc26dcb6d |     
   armeb     |           gpsd-3.25            | NOK | http://autobuild.buildroot.net/results/bc35d3e7b0e8c59c776652070650af3c749250ee |     
   sh4aeb    |       gstreamer1-1.22.9        | NOK | http://autobuild.buildroot.net/results/b70bb6b042690c0d3f61f6eb6f68bb2a80496ea2 | ORPH
 powerpc64   |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/5f0b96d7ff9e8effe3cc790622581bbf37d1ac22 |     
  mips64el   |       host-autoconf-2.72       | NOK | http://autobuild.buildroot.net/results/56ae743b0a3380b9a2404229dbafb9b34ed45a5b | ORPH
   nios2     |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/c0ca63477b164fa221b7867632a374994165a824 | ORPH
   s390x     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/1994053d8464a5b39710ab799f9507d0094d724f |     
  powerpc    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/dcfc9e03b3e30807974f3ef79d13f5a3e4308a3f |     
 powerpc64   |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/759eae2fbad8a01149f2c9cff1ea68b2c4bd08b9 |     
 aarch64_be  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/b6432400a7208f71a0fac2890fe86cee939f3cf4 |     
   sh4eb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/767481a9feec029bb03e2907439f7e4590e01a8b |     
  powerpc    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/7da9d9f1a7122e6158b651a5ccd5ba850cebbac8 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/7d1655dd0b09cfdb2f9c80232c662c0ee2a03cb0 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/7254a2376f5caebf6f464f89afbaaf1847e7131a |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/2d698d6b9974a8478cc0095dad776f36f403738d |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/a271cd230d05672f0ea6eae68ac5f905f0a54962 |     
   armeb     |     host-gcc-final-14.2.0      | NOK | http://autobuild.buildroot.net/results/4e7600c648a6ba06f1dbafafdc8b8648fe0bec5f |     
powerpc64le  |     host-gcc-final-14.2.0      | NOK | http://autobuild.buildroot.net/results/5a980db7efbecba279aaccfc76898fdc2db5e8e0 |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/7a979bc8c360d5e485a4486587da451f4e7f7fb1 |     
powerpc64le  | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/83664419f84601085f8ef9e08277273ac1bad422 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ba6869894ef990bcb0930329194507ebfd26ebee | ORPH
  powerpc    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/e644416200db27ff210715cc27a4fe1a2e9a4e08 |     
  powerpc    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/a9870b68ebe7edda6918aecfb10ca824cd5d7d42 |     
  powerpc    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/22ab0bb3b7bbb011fa17fa5e759de9c09082d868 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/c5c4242f4ae9d9ef294f4dc4ed4de12ad9556ea9 |     
   mips64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/3db839f62f4735de3de4becddcf8954040426838 |     
   x86_64    |      host-libxml2-2.13.3       | NOK | http://autobuild.buildroot.net/results/9cc5b372376257bbbeee028264e5bb2b9a85ed4a |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/470626eefbda4f9ac92a3a714f9290ed97959ca7 |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/ebe72382ffba74f757b28bc65a0a91394702058f |     
  riscv64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/804cca283f5f8b7ebc1d9acd05a1e3fdff82ca46 |     
   mips64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/e55f188cc6012045fef083f34630def3a46b3d88 |     
    arm      |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/2450f03e6acbbe5dac7e4b74d12750facf4fa754 |     
powerpc64le  |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/8acf4fd793c2cf03c5002ad66c40b745927c99fe |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fbe97148804eea145431b4d6c3d4ecece93cca66 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3a23cf51fb36362589c7e9d90dd1451f0bd88901 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9d306d2bbc0ee741dcb2233ffa35f788c388c225 |     
    sh4      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8bf4139866463fd44c639fc56f0967788be02971 |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d4bcf83e58b0438d2f212ba013ec0efc6d5c20a5 |     
powerpc64le  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/30afb74ab50019c780446c449e8b6927efdcfe3f |     
    sh4a     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/81facb1255f730a4c0ef0907d0aeb7f42a2f3bdd |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/de1fa69bc81c656b18173ac388fd64eed10aee88 |     
  mips64el   |        host-zstd-1.5.6         | NOK | http://autobuild.buildroot.net/results/a4dd4933f48fd4e09171e7926501bc1d975b4b10 |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/87f197fa21dd51e41d93210b4a86a6650116d44d |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/cd73f585053f27a74a049f832c50f8750a069744 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/2765f7cc2302cf720ce89ad3b27e06e18aef8532 |     
   sparc     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/12cb46cf7a8ddf64e997bf93a17d4db55c3d2977 | ORPH
microblazeel |         libcurl-8.9.0          | NOK | http://autobuild.buildroot.net/results/9dc802bb3495d08cf04f50081e4d7b8561384f08 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/15cb48e681b049dd374a550a387987deb355e693 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/afc6c4db6977ba76c35f91f159fa5a84a4e2ff1c |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3f4c650cc664254d8bb48af7fc9db93e35c8b7df |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ed01b8e0526c4512944c26ea170d527588cfdd74 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/667b3f8ab25c4fef02d2b94203364ff5856c4dcd |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/febd114b695a68203e53d2b176c9d793b4c7fd27 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/70797da91e83d2c8abbf1f285f2c338de77f06e7 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d7c096980acd972c7ef8f8854c95531bb584ef3c |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/1a1e0d6d36fce01ac7b254d03ff9a5da5dbd841d |     
   s390x     |         libgee-0.20.6          | NOK | http://autobuild.buildroot.net/results/987222408587016c72ec885d49bbac304abcbf24 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e86bd162176dc55dea7fd20f9d09799469d22afb |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ab7b546b6094c58b6209b9da4bf47c8af5ab724b |     
  riscv32    |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/69adddb3d9b82cf638761d927e9eafef1d106617 | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/47ef0ec681a94becf81c16b4ddfae697f0ebf21b | ORPH
   nios2     |          libmnl-1.0.5          | NOK | http://autobuild.buildroot.net/results/92e129c1732154dc2c246400ed7316baa2afce25 |     
   mips64    |          libnss-3.103          | NOK | http://autobuild.buildroot.net/results/6461ee79db476db2cdefd2e54de8edf86b9574a9 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/511a9cdf52b8fccc773674ff65838bd544919e65 | ORPH
  riscv64    |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/5c0ee8eedc6f881f4acb2f76006ed4a23de146a4 |     
  riscv64    |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/72c28528d98223f7d07e81ce2ca8005448b08c5f | ORPH
    i686     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/066f1f07997d2421870e71bac53e89178f769dd8 | ORPH
    i686     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/3a06374ee725c556dc3853025da86fd747fd350f | ORPH
 aarch64_be  |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/541b1733ca8468ae6dd0dd7eeff632674867314b |     
 aarch64_be  |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/c6fee151c40758e7eb2d08b40b54b7d93de5a17d |     
  powerpc    |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.net/results/410d93640e41aee87bb4073bc2425b63f91571de |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/b131f0aaa976aff49ffdc2aa0e3f49a77dc672b0 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/7a8f6915b9f4e05619cf7f9f7231fd77ab159996 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/90902e637b9105ff2c1571315b1fa146900b8d33 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/efe97e0a05f35c6cc5b95a1cb2f8e6f8b2852eb0 | ORPH
   sh4aeb    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/e2f9fc129ae55cddfba913cd049626de2cc1bd73 | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/2553bb280246cf0cd2f0fc7e102544e07af47bd2 | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/b0b927ad4518fc22353734af206d1e9dce6d187b | ORPH
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/5470dac4d857a8ab57ad1a3e4cecff91b9963c39 | ORPH
    m68k     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/0ba99bf3a5596888a58cf9fc95098fb5681f3409 | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/4b7c246b597a1c6b8205cc5e672a17172c1a66e5 | ORPH
   sh4aeb    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/864b622885d1d2838380b9d942b129aab44c91e5 | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/dce381e09d4c6c72facf5f1cc9355eb956b7f6d0 | ORPH
   arceb     |          mbpfan-2.4.0          | NOK | http://autobuild.buildroot.net/results/1bce084189c09f16d59d6ebd78ee4ca66142a99c |     
 aarch64_be  |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/d0d35315a8a69383a3daea2fca390a2b5a2a9d28 | ORPH
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/c82df0339e5f762c18de6f792448023f946928f0 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/4f20830003a58d0ae11f3c4520a140c477836ea7 |     
  mips64el   |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/f2fceed3f024d401ecf666c862852b7d78823cac |     
    or1k     |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/68ca7bb29792ffbe5d481f951a71355a76d42b72 |     
   sparc     |          nginx-1.26.1          | NOK | http://autobuild.buildroot.net/results/c063e5e3c6d437be7b9605fc7da29266c73c5928 |     
   sparc     |          nginx-1.26.1          | NOK | http://autobuild.buildroot.net/results/190585c70c1a83cdc92e5c08ed7e6c1d18615b74 |     
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ae1a3517813cfafec59967cd1bd64b90bcafc0cf | ORPH
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/95c0174e6d1bec3c83bd9467e8ff9cdd0cdcfef9 | ORPH
 powerpc64   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/6d8cc9d8ec261bbd8d48d1e793fcf50aa81508a5 | ORPH
  powerpc    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/7b9a9bf833f1b0b54cbe4155d8c781442ff97b91 | ORPH
    or1k     | open-plc-utils-1ba7d5a042e4... | NOK | http://autobuild.buildroot.net/results/61ef2de978cbd93dc31913b0c25359c13ac45fdb | ORPH
    i686     |        openldap-2.5.18         | NOK | http://autobuild.buildroot.net/results/cde33873b22b0a57c59d0af5c2afe9bdc20b76e6 |     
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/55e22404a5f44c3a6e5a71d7bd46cc8e6e7c3222 | ORPH
    sh4      |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/c58723ec7ea68034ca4373c38447608332a3014b | ORPH
   s390x     |          perl-5.38.2           | NOK | http://autobuild.buildroot.net/results/090da29473dc8c7491d87056dd9e42eb004f6bfc |     
    or1k     |         pinentry-1.3.1         | NOK | http://autobuild.buildroot.net/results/38fdf4d5c3f8f923568bf9ebf521cdfbbc6d0766 | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/732b88eb77c99c263b95f3328bdc18ab85909a6a | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/c2dd04f15a9444a12abae7ad3c43ab5af33427e6 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/b5d1b0a5c08b910184891c569106d028edc73fb6 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/aac3a2e8e9246f8e0d3afc0ebba46df2efd1ce1f | ORPH
    sh4a     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/c1ec2e7fe550aba5ac5fe2e028d218830280665b | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/7241b69b53efe64641623b030aad4a2ae1d09256 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/03f53bb75d42b9a2c5c6f2d27c72f0640049308d | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/5cb34b88df045ec48ce3cf139530840c7b6ec35e | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/ec4a2d11ae9a8bf8fdbd0950c2ffdd7a32c4862f | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/a9744648456a5f6aa6f66463385a7648faac38f3 | ORPH
   mipsel    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/02c9f527f880a6b3d6d64c82a95641df04d990f4 |     
 microblaze  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/25bdb5b6955be0e97fb17d2db683d637963dc782 |     
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/804bfa886d0c3aaf1af6b85287b95f78df004bbd |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/74187709ae60ff2561ccfd84af5df0d4dc05b83c |     
   nios2     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/1998d8103865b5302e3886fdd3f0d096fa82b292 |     
  powerpc    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/196b325e50d705b19c7fb40dbd37b0e9a17f1c4e |     
   arceb     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/d271fd3feea6c15df5b2b559a01bf92b1377061f |     
powerpc64le  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/bb4e2260d67c2b2a1e97cac4fa0914890b9964b4 |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/8ee835279c024f74aae37011dffd6706783c3063 |     
   s390x     |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/95c58dee4da730352c7c24afd52976872c36bfd4 |     
    arm      |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/08ac2f6064cbd5dcf34ae090b69bfb760ea648bb |     
  aarch64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/16c93e2f1c6c6a00b317068e98baba34fcd3ede4 |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/dadad6a85c4385ceb70f6ee3dc891abe2369b3e8 |     
 aarch64_be  |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/5ff05ae04198fa8541829bdfd36d84e00bff5da6 |     
  powerpc    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/b53effa4b12e1a088c849c978ec6efb0dd290f3b |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/7e6b9ea85f809f22016211a57909904fd85a8b78 |     
   mips64    |          screen-4.9.1          | NOK | http://autobuild.buildroot.net/results/a3fbd312c6946604e22540c78104e15f7a8d2281 | ORPH
   x86_64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/864647c8beb2c623f08ee378c687dd7bbfd3fe87 |     
  aarch64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/67bf46a7a8f5adcafac2a22d5f39ae73ddee46ab |     
    mips     |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.net/results/04ee203c3bee45d95bc2c50dcfc49bf6b65c9207 |     
   mips64    |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.net/results/26f9d22dbcafc5e7b9b2e72adecd1ec32a8f39dd |     
   x86_64    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/40574da47c64f91ff32defc362c3a41203a5d35a |     
  sparc64    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/9ca1e9d08a8999b148a2269538a193ae035b0742 |     
 powerpc64   |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/264a6197c910333f3ca1138cdc998f3ef1692ec9 |     
    m68k     |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/1b4b0877e48b015ae0525f95cd54f8d00469b425 |     
   xtensa    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/68ffc22b50282e7f447a4dd20c773c82efe5e8a6 |     
    mips     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/7bf3b1c5f6bf5b7fbd7e678de9d97a2117ac30af | ORPH
    arc      |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/66cb94bf84ce384f0605bcdef0cb73318acfe8ba |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1f1b689a2189fa074dda6d0d75e0db277779a2b6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e4e77f52f6792de34545a225a9f35a40c80d7abc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ba15c26b56df25e25ba6e7f28b65879bc8816ab2 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed603af6f65d3fa09f64d60ab33272dac0c4b921 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b21e960249128c3b3ea5651f2bd2ae9f263a4079 |     
   sh4aeb    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/feb9a789d2771993697e9c5acbb04083fdfd29c2 | ORPH
    mips     |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/4cb021207d341b412ef6921c3368da3b644d7eb0 | ORPH
   mipsel    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/d0ef7145960695bbbec23909b1ca24a5336f3c23 | ORPH
 powerpc64   |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/b45ab8411619546da21a5b0d0cb29e479e0e7684 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                elfutils-0.189 | 1 
                    fcft-3.1.6 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
host-android-tools-4.2.2+gi... | 1 
             host-delve-1.20.2 | 1 
      host-riscv-isa-sim-1.1.0 | 1 
                libressl-3.8.4 | 1 
                    mpv-0.35.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9064940a41274c1d598461437410731db44a775a | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/7f450d6b1b86f6d483201300ee4edcd532d33fd7 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/269ed85e40626ccf194ff536a1de325401c9dc73 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1e4c105142d6d13f36fac9c173096ec835eff00a | ORPH
  riscv64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0e660bd5792a8e2bdf56cd4146b67b2f8955b895 |     
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/91493199a933f0b50080c5777252d4f391892119 |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/dd3089147c6e06c218df58a90de9cff3ce610c14 |     
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/36bbcdc371570116c92fefbef3ad9e9970957f5c | ORPH
  aarch64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/6d4c855a54daa97b2ceb02468c687fa2eda0108e |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  clang-15.0.3 | 1 
               collectd-5.12.0 | 1 
         host-libxcrypt-4.4.36 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                libressl-3.8.4 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/557e2a962ea237bb7bf24a2ce6ced156882834cc |     
   xtensa    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/3abfe66de515936e3fed618479723ceee712aced |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/07242f4fe7317c31c73763e83a181e6a361f4ec8 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7d9fce255564b57f4c0daeef76000826d3943d3b |     
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/44f53f902b15520aa23e212151bb246e2a1fb54e | ORPH


Gitlab CI results for 2024-08-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530574898  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575048  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575052  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575056  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575062  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575130  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575166  | ORPH 
                     beaglev_fire | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575179  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575181  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575191  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575194  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575198  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575200  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575203  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575204  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575207  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575208  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575253  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575266  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575272  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575273  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575275  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7531875596  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575283  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575288  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575296  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575309  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575310  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575314  | ORPH 
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575315  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575338  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575343  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575357  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575359  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575361  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575375  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575378  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575392  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575403  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575409  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575418  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575444  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575455  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575500  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575514  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575518  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575519  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575528  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575539  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575540  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575543  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575544  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575567  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575568  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7530575572  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
