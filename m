Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75504C25B76
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 04:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BF3C405C0;
	Tue, 11 Jun 2024 04:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3KE6q4A6lo5; Tue, 11 Jun 2024 04:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9138405D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9138405D0;
	Tue, 11 Jun 2024 04:02:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CD611BF3B5
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 04:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F6D960883
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 04:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zb9T5mmK7MqD for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 04:02:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E410B607E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E410B607E7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E410B607E7
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 04:02:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 788F820007
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 04:02:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 04:02:16 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718078536; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aVlPpcj3boKts8aZSOpFu6e/9yJB77IluH21BuHO+4I=;
 b=WtXAxlsuyhRlQrWJFd6Rv67f4eDxzQaR7t2I/mjHYOB/8q7M2fKfJvNhg4QMNhtppxH6G0
 o3+qwMi/LOZkPqIY5Y/5VKuRtbxPeQcU7w8xdbjOP/qkM0oA/7vr77Slnni3818GEudVRq
 RDlTCrC7Gt9E+gFsbVPQ6zEOuL3fyazO9wc3eiAi7kcd364gso9OrH6O5IwStzFJKKExW5
 vQGs9GXj2TdUE8kJ+Adx5jKlfu2wk8OxD0KaiBxYZ4calmoN2CAqKGXzyfVWH+ruXy/3aw
 6bMedHDiSGB8q7vbbsQxknUN13qudC//9HHn0TWg4e7MljrptNw1lAJcoeGcbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WtXAxlsu
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-10
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
Message-ID: <20240611040216.8rEIW6WBCuefP73KXmg3bucRQE261Ybas-xIxl1QyYs@z>

Hello,

Autobuild statistics for 2024-06-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 12  |  6  |  0  | 18  |
    master   | 140 | 343 |  2  | 485 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 53
            host-cdrkit-1.1.11 | 33
                host-odb-2.4.0 | 16
                libressl-3.8.4 | 14
                    mpir-3.0.0 | 14
ibm-sw-tpm2-5452af422edeff7... | 11
                elfutils-0.189 | 10
      host-riscv-isa-sim-1.1.0 | 10
aer-inject-9bd5e2c7886fca72... | 8 
host-android-tools-4.2.2+gi... | 8 
                  libsepol-3.6 | 8 
check-11970a7e112dfe243a2e6... | 7 
host-vboot-utils-bbdd62f9b0... | 7 
                  libffi-3.4.6 | 7 
                fail2ban-1.0.2 | 6 
                gnu-efi-3.0.18 | 5 
                host-go-1.22.4 | 5 
host-heimdal-f4faaeaba371ff... | 5 
                  linux-6.8.12 | 5 
                  ffmpeg-6.1.1 | 4 
            gdk-pixbuf-2.42.10 | 4 
glibc-2.39-5-ge0910f1d3278f... | 4 
               lighttpd-1.4.76 | 4 
                 openssh-9.7p1 | 4 
                  bcusdk-0.0.5 | 3 
          libcamera-apps-1.2.1 | 3 
                    ncmpc-0.49 | 3 
                   bird-2.0.12 | 2 
                 coreutils-9.3 | 2 
                 dc3dd-7.2.641 | 2 
                 dhcpcd-10.0.8 | 2 
                  dhcpdump-1.8 | 2 
                   foot-1.16.2 | 2 
                 gnuplot-6.0.0 | 2 
         gobject-introspection | 2 
         host-gcc-final-12.3.0 | 2 
         host-libxcrypt-4.4.36 | 2 
              libarchive-3.7.4 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               mariadb-10.11.6 | 2 
                memtest86-6.20 | 2 
           python-numpy-1.25.0 | 2 
         python-remi-2022.7.27 | 2 
squeezelite-71c012ad9ba102f... | 2 
                       unknown | 2 
                 apache-2.4.59 | 1 
           at-spi2-core-2.50.0 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                 avro-c-1.11.3 | 1 
                beecrypt-4.2.1 | 1 
                  boost-1.83.0 | 1 
                bpftool-v7.1.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                   bullet-3.25 | 1 
                   bzip2-1.0.8 | 1 
              cache-calibrator | 1 
                  clang-15.0.3 | 1 
                     crun-1.12 | 1 
             docker-cli-26.0.2 | 1 
                    flac-1.4.3 | 1 
          gitlab-runner-15.5.0 | 1 
               gocryptfs-2.3.2 | 1 
        host-sentry-cli-2.20.3 | 1 
 host-softether-4.30-9700-beta | 1 
               ipmitool-1_8_19 | 1 
                jemalloc-5.3.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                 libcddb-1.3.2 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
             libgpg-error-1.48 | 1 
                  libnfc-1.8.0 | 1 
                  libnss-3.100 | 1 
                   linux-tools | 1 
        ltp-testsuite-20240129 | 1 
           mediastreamer-4.4.8 | 1 
                  nginx-1.24.0 | 1 
                  ntpsec-1.2.3 | 1 
                openswan-3.0.0 | 1 
                     php-8.3.7 | 1 
                 pixman-0.42.2 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                    proj-9.3.0 | 1 
         python-pymupdf-1.22.0 | 1 
                python3-3.11.8 | 1 
                rocksdb-6.20.3 | 1 
                    rtty-8.1.0 | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.48 | 1 
                 xinetd-2.3.15 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/71c2bcbcf8a090b8413099424f46b5025803a09f | ORPH
    arc      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/8fbcb9f05d943f06ccdeba7078e4cae3f20d5db1 | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/19e0c6c1c1c079b16551dda66b121def23c0c0c3 | ORPH
    i586     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/240783ab696e9b085c12e181b5fbe33b2033d8cf | ORPH
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/201d39c508cf668498b5586f8e90663adfe1d7eb | ORPH
    i686     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4c7f9e451c988c709d9c7d8cad6b445782434d4f | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2b22e229c48af8bcb60f7b47747567bb907bb56e | ORPH
    arm      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0b283c66f188fde0cfa826440721f43fdea47cd7 | ORPH
  sparc64    |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/3ab742a3aeda28c7d11b8876e8c1d48b72261ba3 |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/a344807e14f187e51d5a21ef077cb90ecdbecd36 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/9d76eb4d2b076315b36d331503203ec7ac213247 |     
    sh4      |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/3a498d6db346a9f7809c2c309268951b88fb3248 |     
  powerpc    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/453ce260f10ebe0559fa9a815cfe78b275533543 |     
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2de429d54701765efb43e23517f6f7dec5d5414a |     
   mips64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1c3b56639d7901eb2264b4ae8ce1468784e6f154 |     
    arc      |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/702f16b1a4dd2bf1a168f8bfe7f1dee0b218e616 | ORPH
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/11e95abfe555f79ea7a32176a28f07c1ac1bbd0e |     
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/30a59491b67ac88fada1040b90173adb9c0b82a1 |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/6583d8a16423b8fb3a3113bbb7200b2443e4b17d |     
    arm      |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/7e61575b91fe01ba3a07d0566697b7ec0013dbe0 |     
   sparc     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/3a0e4aae7a653e89fe26dd4cec14d4705d7c6608 |     
    mips     |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/abe68a9174af948c8a662c7ea54e0b5053eef672 |     
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/5a2eeb05cc8a89d0c4ee17a13f739f6036cf55e6 | ORPH
 aarch64_be  |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/ffc4d608fdcf33a149f9265b6e8253a725c62ee3 |     
   armeb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/90d19a97a3b184c9c314959ba70ef2750585b45a | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/cebfe5a1d66823de33107ee984c73bc5bc370ca5 | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/5bf6b1686bb9ec7a29e09b7974cfcf2f7884dcbb | ORPH
  riscv32    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/fa3fcd3b02e8b24bb009dd8000eef9f1723749dc | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4b7c2ddcf48e29a1b999bc220728718838446a51 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c5fdadf6020e1523020f9a67f6bda2bf8fff5c3d | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d0f2ed17ea6951b056a1dd9f1f5a25f65859c58d | ORPH
    arm      |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/4bb1d9583e9fab92565f145ade71ffa035c5d174 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/8305717f7fd8f73d946983284b4bf34a8e4d1753 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1112c8ac109a78420ba344df725afc36eefdfce1 | ORPH
  powerpc    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/ec2a8aaeb88a85305fa4ffdffbc9e5e0a71cd546 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c636ba86e7c29e85bb4ae64e82993b8c3a28ec2b | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/34604cc38f05262c9a438b8a2392bc6caf04a78d | ORPH
  mips64el   |         dhcpcd-10.0.8          | NOK | http://autobuild.buildroot.net/results/a46227ef1e872bcc9ffcdf4807157140c909a3eb |     
    mips     |         dhcpcd-10.0.8          | NOK | http://autobuild.buildroot.net/results/790dbbd6df90cda5591688fde17a95032123a427 |     
   mipsel    |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/14915a949011eca836b48d7aa7974a96df8fbf8c | ORPH
   sh4eb     |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/52bb63fdb0550c9fcf53ec4791072259a3c04fd2 | ORPH
  riscv64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/a032f5468907e3a6c35aff4874330ea905bd8312 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2301523bd436d073eb91b19f859ca5d76502542e | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/44f55656abafdf963ea75cbb14f8ee78c10a9700 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a524a00cad1253e4eda457301a5e4756982ba7f5 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/928635b6fc9d08e73b6b2204784fac7ed6d1319f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/edeeaa5931191cd59747640d7790eae702f1db38 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8c11ab3c1510eb7d08f9c00dbca69bba10182602 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1c3704475c8715cc7c278e11df4a5e5428a4c31a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ac61e04da89dbcac6cdc92aeeb91ffc5f45c92de | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6c367161346bea2cbdf03ed16b565fb0e4a6f872 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9083ba3f49b4a01249aa91fb5ded54132fd20c3d | ORPH
   sparc     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/33c5c9ffb1e021ceba867a0a5578ee02004de3a2 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d65d88fb385e9c9e3e1828bd8ef8278f25d74b2b |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1a38f13c1122bfc70d147f5d7cb1c989e4942a89 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/00b27d760b02c2dc634b8707e208dcb5e19dcbac |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4f271d95ebe37600e753f5e41535c2294e502347 |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8c31fc5057517153ce21a23678b72a93299b96c2 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/70dd5d0e8ec0fd423c3b73d222a04dade4f390b4 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/626a7459da9c51fbfc5dc689001d077ea6afb9fd |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ff16089f96f0cd7ecd61a1622042bc4f237e0a29 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/98e5782ad1588d878d568aa3241a7d8f691d120c |     
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/86cb21aac57a28d9675db8e05d77937c965fd62c |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/25e58bab85467c4d1ee489ebe41a68ebdd4802e4 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/97538a1c783b607b81c71fb5822e379c611cdea9 |     
   sh4aeb    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/1ec439ad5e695f3311764a47454ec7665c7de94d | ORPH
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/1d7e3809b82d64450dd791a001a1bd5fafc7c5a7 | ORPH
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/01d3def2c3eb93df6633dd4ee3267e0aedb8a585 | ORPH
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/a8af501c538cf7c61cc6043b0dc5684b6078288a | ORPH
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/2c1bd9018603cba4d4d12856906415e189d5c55d |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/d6b3a4723c6053d210ead0faf00f5231546e2940 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/665f8c8b2172e7c2a4f48028d9d666562e109f07 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/9236e2367ac251f46d881bd6a76797033a2fd64d |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/88e437d645c3b536b8c328c6828080dc1d47ee68 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/58ec1620b0c78624459498b86763fded1010742a |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d39b179c9ecb174b6e0bea5e0966fd3bf948c1c8 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6c0fbbb896377e9f98c76efd8462639e2c89ddaa |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/73d5ad37f6fbcdc7906299dcfe3ff6b44ad79f8e |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/551a866401f5713bcbba469d9f3554bb2bb76951 |     
    arc      |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/c9059ec5bfaab0c7e134de2b60d8d8460b95df5f |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/f068420e35e379a6b436ff1550f775c0f99d1af4 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f9ba336bf35e3dc353961e52ea41d16aa4ffb173 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a109aa0078b3f1f7960f8b2dd96129d0e4cfef3b |     
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/a64d59c7034956c95ff0b0ae32a43f498d6bbb13 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f2d80f1c54a5b0c714109a3f9a2250d34f0040e9 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/37f87e54bced89e1a18c1a87d54fa1efe37a4ab3 |     
  aarch64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c8df6a9744237416ae6a31d1a89768016a43cb97 |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/63cb9c7a795dbdbda5786e3614210298d48dae23 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/63ca0615d5f52edc14a702e9b8327aa9ce8666ea |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f93228a9541c05adb7fde72b8c924dd9b91b3cbd |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9391df63ff6505f3efccc3295a6e197c9fbc0e54 |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c21390729889a7bac02e627faca5ee2510d7af6b |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c1e452811da927f24555e35794cd6b1482321104 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f7153dc369a8426a08a283c27c2afdaaa993608f |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eb27cb9c338622effd7f9846bb141de5534c7d2a |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/88d37f45844f0aed872f2fcdac3acbbfdef0be89 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7a24034cfbeb9aa900fbd48d41401bb1759cfd4c |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4ae620add301a1b3bad7a650472c6377c13fbce1 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5602b840dc81e27bad5bad49fadc21b2fc672830 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e9cea1e1e6068a1e2898a903666a4e1cbbc949c0 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5d544703eba0d77642969e6116a81f443b90cafa |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/63c33a2a010fd2d610443e9a98e6c28d2201f511 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/970c3deccb0728aca530352c49c19b0b0cdf9725 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/21987ed2b709aa38d6ca4e4c0a8cab8428cc7e17 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/745a26e7ee770231c0c3275b2a87686cb6e6c56b |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9e0cca0818c9ff684313ce7e8e492c003e18bb30 |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/49ffa1c2434dcd287c0d94e50526fcd6ec7e7ea8 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9edebf5af4e862f720838608552630a3076f59f2 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aacd4a5832b35e9c2527f7c24c320e571f630fe8 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c0926755b014e68b9bc9be16f1abc214dda56cf8 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8ace345cfeadaf07adee8773ce487adad164ce6d |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f6fe68cd8d05f4a39984910e2ae66d7deb0a43f7 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/69ad29d322881367d1c2c54fdd2f4e12b2a1c23e |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c35348a002af366a4059b51793def9606198f46e |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6427f7e812838f73a7e7f30e27c20bdc7f13a6d2 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/df6dfe1fc13b649beb4d89febf504888eadf0d00 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/be7505118bbcd5eafec2fbc1e37890092482b772 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/704cdab8c221439d6ac5fa4b64f77317647c8361 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b8d4ac19bfea2a59b987a2282412a0ab2da8239a |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f7deac973f0020eee3ba57a8bc9b64c726a11259 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/32856ae3e607a7b6e612309c81ab5b809e84d68d |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7aeb000b62e88de7a7e09601f591e1c66696662d |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/621ac773744f0ee0258a0550787017b296288093 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c01c6ed164896e4a11dbdc9b0ea44aaae44a02b7 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/844396df87a0d24c88a44323da587434b29d7c74 |     
   arceb     |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/8f27fa1316b4b82ca130803370defd17264bdfb2 |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/360dda6a6181df089200b39efb242664701540ac |     
  riscv64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/c8bfa168571fb677cac87a9b11e322327a709b8e |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/f83a049293952f72ddd8ca42fda432aecc487bc6 |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/931076db120319775789e682b94fdf7f6ef8ab47 |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/dc72cb3fab7eb6903c03688cf3507c77dc513197 |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/25a9dcadfe0d8d0d9532d64a529bb3618503c89d |     
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/32b36e72dde8c2efdb5b9d154e91f8ab3ac920f8 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/088ce16f12ea6ca47c55a7e33d58b7f6826f4e10 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/30779735a8294962b19bce01f8009e082bab74cd | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/baaaf0b5fa4cb4a74a255a7e8e764a5bd61969c4 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6eb8fd55471b0fdd3e8972ed585010ba0b503e70 | ORPH
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/0d57a8c91be77d7b1a7aec5bd709db959be9c3d5 |     
    sh4      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/de19f60ff09c5e126f71e57b06728948dc5536c2 |     
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/42707125a40873c297f453fedc652144cadb120b | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/28e73ff9db67f64d26f44af915ba1253d9f1acd7 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a091efb7c21a83583eefe1a789ac1480959f815c | ORPH
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d96dbfd71ac9683f84985a60cd6fe592f0b30c19 | ORPH
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/58fb6d54f95341f79a2999337f8b023e755680e3 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f72a0446346507200cdaa110eb239051dae70ce0 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/405beea73cddeb45cce2f1a38835cf71cda7528d | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4ce37901e6a276340dbf1eccf8d612417c483265 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a6af0f9e02fe89d4d59b1c22c4c3073d5e0b39ee | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/242fbfe0678458c4990393e77a62aafc9833cb63 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/99c2e813050814b86c63fd7f7c2c7129a3b97a9d | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2b5eb4811caa0b94bdbce30f77a3aac8b6c0a8ec | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5989f638fc43ba765bbcefa181607fd92f04ae2b | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e7eca0c8c6e9976f13f9915bdc584b5de10e5dcd | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/940ead108970ca99b52b804bbef916e57d4e05d8 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/45d16e9da4065ecc41d1bf4b7d4947d257c3101a | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ca95f7291be8a6bee4d790d2b9409e7da5dcc599 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1614856d0f908762a59e05f8b0f8d8df47954bbe | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/df59dc7635dd3156c19ac40440791b855e830290 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8d01e4197539a3aad97564756a2a11e34acc1847 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2da17044a1eed843cc8122389de4cf37ed5ba094 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8257de4b642c259eb7c215b12d03c3498e20e671 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/881ded3b9364515e1588f2d9be4c20dd3f3ece92 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1d2270fd2b38800e65985a23cf84d0832567a517 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/88a47af462e454fc7fba95935addfcb5c4fb6b2c | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9d3242d584fe3d8ec297a7750c3392e30b3b0da1 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/75091b1b120f2823f2162f25dd68d1dbe18038c8 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/918545a3a9148a7ce40522e840ad9797ed424b0b | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/24ccad8df3112c53d1c60fdf1c190edba9fb79fb | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3cf267198d95f50863b7439eb5e668e64a1f3ee4 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1b3d2d831a835e94e75e669c3fcc3dfaba4dca5b | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d8e483873c23c535eb5c6d39684b522c101d6cf0 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/805cf0e44c1f9d30216dd7f3dd6bcf942428b29a | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/14fbf01a26b27d9c264e72c2222d072504f50479 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/25930d7ea549648fd2a89e72d76658a3583f5bfb | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/796e887c377315d07cc7841c79376ea6f7351584 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5f20768404e5bbf03d277e3e2945a939c086651a | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f958ea37e54ddcf37ba30c7ef458e63c5ae529b5 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4c65fa2399f2ee3bf29fc0a4a48f3a4180c54ef0 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6679cef71c89953f3b9e5c5f3734672816bb58a9 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c1faacc8c57c5fab01ecbacf9f5114ec7a100a1d | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/44f3e5e4dc2535bba8eb9fa3b0c7dc0cb50b4f19 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/850aeeb932f180011f36d38dbb632b6e15cc4adb | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5c9e4a07015dcbc92ecc95b035dc19249bf708bd | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d316d95871b432f227682aa026e3d3d62133cacf | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5b16ea6fc3546359d8711e2c0705539ad4c27268 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/71f8936c17e77bd3e593f34d778a1753f39f71d0 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a1184f7088e1d4988e883782f32bf1918fa14953 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b3151b8eec5bb31e8edbcd6738c1db99c719ac65 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ee64d57b1fcb52e749e03b5333f6e85b36eeb274 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/49e43e0f1c06fe144bdd7806e0d2619711ea185e | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ac88141fd8bafcf91f8e186b1bf16c43badd5c75 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/36c8677f2947411ac4cf2d3dc440aaeb1a220801 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/aae0376538b4e0741a633aa2d5e447a33e954e38 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/57c020fb889e5d63c54d118b2ae2aa2cfd5016e4 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8c99565404a5e7d4cc327ad3d298e10d3e66ec6d | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/04d12b26f1a899fa0a8deeabfa7498deddbba2b7 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e375766c5fda21f01ebbaf18279a3ea642747ef3 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c6c77b020ce104f3d887e56de7772cda0f3a99d0 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6cf97de3f08300e8f88a047b8436f7039bc6e78a | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ab227b7ff03d25ac04951a12f9ea008481f8645e | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f57de120a145cd0949f6f23e76d291c84165b518 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c2735678afd207ee59aadf32de4824450b822d70 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3123b5a139b9f941f0f3b23195077a73f4b746b4 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/772f55204ea6b7d9400def83a1524f0a81ef419f | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9c7735993c14a869af2ad3477852767bfd02b08a | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/38dce25fe66e3030a15599a3e153498d065fe260 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/22037d427b8f87abc62ea99bfbe91332474e19c7 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1f246c36ed25009d680f2ad4a93092992e445bd7 | ORPH
powerpc64le  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a22c779a36adb888e1fdb789f4d3f5c49fe32bab |     
   s390x     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/dabea3634842ee9e97527516e8768c6c6ff1be46 |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1ba494ca0175429179708e9c462a4b4294a74100 |     
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a9b19f85708d57f0b5a07afb8b47c5883dbdfa01 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/230c2e0d52e2ef8737794de3404731b16091dcbb |     
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/38cca8ab66873d5c9adbe7c1d4fcd851e077c90d |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/d179157872952940bff0dfc90dc4b69e5b632de9 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/9fd76c5b87392ddcdd02c2000d3f424037adb367 |     
    sh4      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/68e359e1e5cb7bc2400efc3548667133bd803635 |     
powerpc64le  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/376922bec77697905ae9140ed09c720d768ce6da |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/44210695454f82c486cfc849e875eae1774dac7e |     
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/61a7f99d93de68271f8d8dc63efaad994bd61bb0 | ORPH
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/91339e1ff7722a0893909aaaa55cde58fcd63d13 |     
   arceb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c8fb3a26c210d276724bcd6aa54b1db72797ea85 |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b738e43fe441d67c6deb18385349879124eac825 |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/87249c189fadb625865a55a7526a63473c5e736b |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e1fa5d5ec35948bdd9322240a667329342d64c2f |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/40ddb02fb7967728a5b3728276d098128dc871d2 |     
   sh4eb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7e629b5f03e6e76d5c67144b025b1e31aa33c9f5 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3adedae83ab748f3bd58573412c68104dd8ac3eb |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6a10240a5ffd8ff17873cba5aedb88e937d6770e |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6496d6f9c62ad34bfb4f9fbcfb663a10bbc19bc4 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4ef6af6e0bffd053d4039c04058053cbdd11d27e |     
    sh4      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4608684714d98e0ffc0adf981505778849fd3062 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f269fb38fd1e7b1fd7787397c1ffb85ee1409a43 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/48049595d79f2983e6f38a6894a0d0ebe3bd0616 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e27bb82cf697f4e32a78f520ced1a18e03defca7 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/69badd560948431bebea3a84b58b64aa67ce5077 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c54acd6df143486e4abf2e45f0d77213ddc25fdd |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/08b1a3d677d259f90f671418d7888f3baf111677 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/5f72452eaa20a443b7e88fa75bf203d326ff9f11 |     
  riscv32    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/1a76f09042bda3eeef702fca26a8cf4ec24c437c |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/eaef56aae325fb95d4dd9a69c0279732da9ab0e9 | ORPH
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/df5d4611c742264ec64009e4c796fa459b860904 |     
  powerpc    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/84c06792c1b39fe22d7cc6e1339dc1ace172adb8 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e891fcdcf28c1328ec860ad00a1e3e7205f64240 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/54413060af6ee5d365a6ec468d52938f473e1a87 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f0d9b0816edbfca496fa5ef6dda588624aeb0620 |     
  sparc64    |         libcddb-1.3.2          | NOK | http://autobuild.buildroot.net/results/d2882572f2ca71dc7bb61a0d2312ad81cae6dffa |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/652b252723aecd064d28d612a409558473d41830 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/29276bfe9bd22670a0d0d436f17655893268f1b7 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/2154474c52d9e7b8d4cb58e338db7fc177b48d9d |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7c64aaedac0c81da1035adc5b9d85903eccb168e |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7c8c65253c31e2d93c6182289c8ce670d833826c |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/379ae3ac0b411e15165c2608c230b1eb7b63e65f |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/dc2b82ecacaa150e5437312c61193486cb05590c |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b1ff763703768f2e85a77bbab1769601d8bb4f43 |     
   arceb     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/d4d4d1befc3a2e8179f64d190907d34c60cd524e | ORPH
  riscv64    |       libgpg-error-1.48        | NOK | http://autobuild.buildroot.net/results/dbc82ba08e6a30c2f558c8c36ad7eeb0e3cab090 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/6da38116227121b10208e123f37e989ff809c3fd |     
  powerpc    |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/e6f76399de2565f45dfdb978b22c760cf71b7a35 |     
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bfa658a49919f5ed7807ec382486252b3d6d97f2 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ba20f5338e7abc3226aa7e47d7efec20b2fc8d8b | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3bda0cf84ab43c5b48f5cdb2d0297f61e40a4e6d | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/aed562b868d33ed28fd9d3eaa76473dbe2383b13 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fe7fd6d752fc74e1afc76753e755551bcfd99e59 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/dec8ab3145bf45c76d27456dfaf96a5fe9d73f0c | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7085e4558c2a4a56e6f16b126ba5be69ca618640 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/088688a34013060cf6bed300fa5012cb160eaba2 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/19e005cad1b475f53064b801d7aeb3c2ae458df0 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/48681c0db75ebcd9e396aebb05879d82693e942b | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/293d29687cda9d3314a0eec085def672e7d51514 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/989cdde05f863a54637884381c6db700f1a8c79c | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a1bee0af412dc46a6808201ad7e9516fcded9536 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/217c7aee4423acd9400522afef103c1dce0f03fc | ORPH
    m68k     |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/6e512b409ace6eab85e35b913afc99b4efdaa661 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/da97bd36b182bedf0323e2f7533c0e936fc43203 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/d90c73105c50923344629c85a1f85452443662be |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/b13f141146eefc075f48fafba297dea96022ea51 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/7476a9fe7f2811f92df6a4ff4c97ed2e5ff8740f |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/0649f7cb3c46f8a02e93ec5f853849e9ffc04c86 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/12bb2e17082ee4bf2fd50141d89a069f74aa3f97 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/31c0728194e3a8d6afedc4ddf41b17b0c5c98e70 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/8af4b0cc39425b4a82434482dccc22bb81772997 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/dc63dab115c962f128822a13a0e483b96023526a | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/056c20866ae63f7603ddd3b2ca0b5fe889bfb880 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/d2035c349e4ffb7658d568a7c75a92e0ddd93172 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/020c592a06e1063aa20b7ee753f83ea4497fa962 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/9766bf52e6a83ad87cbc64325fa5e065a06befd5 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/175bce78e7bb822001ac39a59301ffefb9ba4df7 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/f23e4be0bf0b57e219bd1b8ebd8571e61351dc7f | ORPH
  powerpc    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/9bba636ba4f9b6509d92b97c3d1c16fc076f2048 | ORPH
  mips64el   |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/3bf57c475773d506c484b416208c8eccab762553 | ORPH
  mips64el   |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/7bc6f98ea4d7dc1b62c132324ec7441689f40af1 | ORPH
 microblaze  |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/132cbb61bff74e5665c862f4e47104388c70cf16 | ORPH
  powerpc    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/bee4705abc2b4172bda31e3b0b258ca1b2f65ca9 | ORPH
 microblaze  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ca25552f77e2b4d041b0843fab413f9c0218596a | ORPH
   x86_64    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/a98b56290547d2dd25fcf2855c4c6d06a47b1e71 |     
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/bf141e2879844edf3a7b2f8c1a3b0888937b9861 | ORPH
  mips64el   |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/3a5d7ecca67b163daa3e558001701c86d21ed887 | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/00e0638acf7ec14f5136cb54e67a290b784dd6a4 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/fa9e27bc0a909797eca72d3689076e36d0031742 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/e434ec5cdbdd71abca11919c49aad329ef601d8f |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/ef056baa660e2b859555c5f0ad2965f6af3360c2 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9b11d29ead704c7ad0d1e3ec512ca0717319d360 |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5294bf7a2ec9c2bdd393299f2ad58f97df30ca0b |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d37f1a0e1d12890462151bee1630212a6f5f3db2 |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/aba95873f9d470c845e8cdd448468d97bf2cba9d |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3b64231b445a8b6d1b211125770b94d6e22da01d |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/414bb8593f3645fe39702567e1b38a8b3cecdf47 |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/fa495d89be1f46bb49c8fe4b48abb96a900bc57a |     
    sh4      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8c4e5f6d6e70c25f9fa3c73310d6bf9b3732030b |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/42560f747d1fe6968db36bae75d5f6da19679110 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f06dcf52fd0d424be25b26924a15f4c7d5a3f761 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/287370260901e7e8ed2f2cac6580dcc3a5a71fc9 |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d1ea5d762ae63989dadf6ce8c22526fb65e99c87 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/fce4b7fd0afe8450e0df92873911e9d9888e3b0b |     
   nios2     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/ddcb45205d7735c739d604021db9ef971991af5f |     
 microblaze  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/8c05ffe6c190a45990f022cbd62622b32019e440 |     
  sparc64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/e683058186e73821e43151f6a0e85ae6d1e966ca |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/6faedd931c76daade51e9e8b24787345e93e4978 |     
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/cd59f6544a4c6d20698636ece4ea29d84a31a3d2 | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/3c39fa8668fdef8ed45712a9136f98dd36274e4f | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/b585a8b20e150a66e09410a729b907e8e7eac800 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/ada7d51733d9eb424d0182a84204c4e80a951f85 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/362aad9072dcb1af05adbf187139e8692a500f05 | ORPH
   s390x     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/de91508b575e38fe621cc7176371e9c7a747e248 | ORPH
   armeb     |           php-8.3.7            | NOK | http://autobuild.buildroot.net/results/dc45952072f37680d4884e70a8f670845831b07f |     
   xtensa    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/e52f245faf4c4b7b8acb45aabd738b978b8dce98 | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/6111ea2a0e778243ea10fae6f9947f6b5df734a8 |     
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/a4a874747b0ac1eb7bf7b25ad9d855503294262c |     
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/b8783db69802bd46fe213a01a27f9ea4332eec78 |     
   sh4eb     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/1ec3dc3f9cef1384440d0a7f01d2a7053a60c3e4 |     
   xtensa    |     python-pymupdf-1.22.0      | NOK | http://autobuild.buildroot.net/results/1ea8f40215ac615fd13bd3738de67bd116d4174a |     
   sh4aeb    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/8aa67808155c7f990aac9e6d52cb4fcb9f48a548 |     
   x86_64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/dedaef3a71c77d9168f44635013ac9e6d3d8229b |     
   arceb     |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/a9190732d0ef9eb4bb507cce7e8a56fcb9274997 |     
  aarch64    |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/e17b338c188b2815c4e4d88e10f9139509434408 |     
   x86_64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/979ce57f5f747000c8a84cc5fe4687b483ed2ee7 |     
    sh4      | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/a6b554f5b46838d66b2e55aaea394005b90dd98b |     
    mips     | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/57139553c47ad235f27416b9266104f0f71dcb1d |     
    or1k     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/17d5418b4ca6b424bf1491401388996b725557c9 | ORPH
  riscv32    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/da7f5aaee1c1a47e02ca9dfcff8f264cdfaa9148 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9a6a0d21ce120c69fd6b59ddf7e59ec1356a7417 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/8e7acca67d1a8a0aae635d22eca4204e42104368 |     
   sparc     |         xinetd-2.3.15          | NOK | http://autobuild.buildroot.net/results/4965e71c81543b0936f14e2697878016a604aaed |     
  sparc64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/12fc67684fd1614072b42100c65297d92fc81a6e |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    eza-0.16.0 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
               mariadb-10.11.6 | 1 
                    proj-9.3.0 | 1 
                    qemu-8.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           eza-0.16.0           | NOK | http://autobuild.buildroot.net/results/14c130a8ba2fa5cec9711251935792d7bb844055 |     
    sh4      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/57acdac367691dbd918db32037b25c98c84237af |     
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/41d0e7a2e088dd570fa7f0d9a12b15b904251131 | ORPH
  aarch64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/81f592a3658b40c728e4eea99edfb6a01b0f0fac | ORPH
 microblaze  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/5dfde75333037e77af7c3b3a7bfacb3c0f30fa40 |     
  riscv32    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/174a8b9098380205d2aebd8514067c89a1a9bfbc |     


Gitlab CI results for 2024-06-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7055245475  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7055245476  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7055244594  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7055244945  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
