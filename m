Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820C0C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 05:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B091A40459;
	Sat,  3 Aug 2024 05:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6jjuECwbYHA; Sat,  3 Aug 2024 05:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72B2140464
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72B2140464;
	Sat,  3 Aug 2024 05:31:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A54BB1BF384
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 05:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8752E40275
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 05:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7wrCGU03KsQ for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 05:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F42640258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F42640258
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F42640258
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 05:31:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3510E000B
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 05:31:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 03 Aug 2024 05:31:48 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722663108; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lTV8kazLrsty4QXC8QZQ3YuCLP9WGff9vcN485WG6LY=;
 b=b5fi5FN/yTH7H7ka6QG0hpYJNfyaEvrfn4QbXUCGBN+MUYtj8GoGF785CTumXDFLKDrCcu
 eGX1PbChqsXcW5eT32Ynm6GAASpUImbZky8pVS7Wq6E6Y5awAFROQjaAX9wrC2hy3ETdx+
 wU2pC5R1fSXL7IO5FLA221UpK9ONWLFhXeO+i3pRIgxW8FQhEArZrsCEGEMbsLBp1J3KCp
 HpqagdhF55vyLiPRZXArEDE0M6uGMBsNIFgPUlpW667Lk4osjcQc1aEIyHXjzDP8IXuK+h
 XAaR/O2nl8QV3QI8skgE2KwV8D++Jx0U9aUJMF3e89+r5a0BAI8Az2KAa4QgMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b5fi5FN/
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-02
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
Message-ID: <20240803053148.tuaIoFJ1BSf97bNHLq9mCAoi96Z9viN1yGFGQSRC8TQ@z>

Hello,

Autobuild statistics for 2024-08-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  5  |  0  | 12  |
  2024.05.x  |  5  |  5  |  1  | 11  |
    master   | 119 | 265 |  7  | 391 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-14.1.0 | 18
                  ffmpeg-6.1.1 | 11
               procps-ng-4.0.4 | 11
                     avahi-0.8 | 9 
                  libffi-3.4.6 | 9 
  gobject-introspection-1.76.1 | 8 
      python-autocommand-2.2.2 | 8 
         gobject-introspection | 7 
host-heimdal-f4faaeaba371ff... | 7 
host-vboot-utils-bbdd62f9b0... | 7 
aer-inject-9bd5e2c7886fca72... | 6 
                host-odb-2.4.0 | 6 
                  linux-6.10.2 | 6 
             host-delve-1.22.1 | 5 
 host-softether-4.30-9700-beta | 5 
                 openssh-9.8p1 | 5 
                  cairo-1.18.0 | 4 
                 dc3dd-7.2.641 | 4 
                   foot-1.16.2 | 4 
                gerbera-1.12.1 | 4 
                gnu-efi-3.0.18 | 4 
                s6-dns-2.3.7.2 | 4 
                elfutils-0.189 | 3 
             gnuradio-3.10.7.0 | 3 
                  libsepol-3.6 | 3 
           python-daemon-3.0.1 | 3 
                       unknown | 3 
                  bcusdk-0.0.5 | 2 
  binutils-arc-2023.09-release | 2 
                 chicken-5.3.0 | 2 
cwiid-fadf11e89b579bcc0336a... | 2 
                  fbterm-1.7.0 | 2 
            gdk-pixbuf-2.42.10 | 2 
glibc-2.39-74-g198632a05f6c... | 2 
                 hddtemp-0.4.3 | 2 
 host-binutils-bare-metal-2.42 | 2 
       host-gcc-initial-14.2.0 | 2 
         host-libxcrypt-4.4.36 | 2 
     host-moby-buildkit-0.11.6 | 2 
              host-rust-1.79.0 | 2 
                libressl-3.8.4 | 2 
                  libva-2.22.0 | 2 
                libxml2-2.12.6 | 2 
ltrace-82c66409c7a93ca6ad2e... | 2 
                    ncmpc-0.49 | 2 
              openconnect-9.12 | 2 
                xenomai-3.0.10 | 2 
android-tools-4.2.2+git2013... | 1 
             armadillo-9.900.2 | 1 
                  bind-9.16.48 | 1 
              bluez-alsa-4.1.1 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
              bubblewrap-0.9.0 | 1 
              cache-calibrator | 1 
             containerd-1.7.20 | 1 
           crucible-2023.11.02 | 1 
                   cvs-1.12.13 | 1 
              e2fsprogs-1.47.0 | 1 
            ecryptfs-utils-111 | 1 
                      ell-0.65 | 1 
                  eudev-3.2.14 | 1 
                     file-5.45 | 1 
               freeipmi-1.6.14 | 1 
                     frr-8.5.4 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
              gcc-final-12.4.0 | 1 
        gmrender-resurrect-0.1 | 1 
                 gnuplot-6.0.1 | 1 
                haproxy-2.6.15 | 1 
                 hiawatha-11.2 | 1 
            host-binutils-2.42 | 1 
              host-runc-1.1.12 | 1 
                    htop-3.3.0 | 1 
               ipmitool-1_8_19 | 1 
                libcuefile-475 | 1 
               libglib2-2.76.1 | 1 
                 libjcat-0.2.1 | 1 
               libunwind-1.8.1 | 1 
               lighttpd-1.4.76 | 1 
               linux-pam-1.6.1 | 1 
                  linuxptp-4.2 | 1 
                  lvm2-2.03.23 | 1 
                     lxc-5.0.3 | 1 
                  mender-3.4.0 | 1 
                 mesa3d-24.0.9 | 1 
                 mokutil-0.7.2 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.35.1 | 1 
                  ntp-4.2.8p18 | 1 
                     nut-2.8.2 | 1 
             parsec-tool-0.7.0 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
  python-pypika-tortoise-0.1.6 | 1 
         python-remi-2022.7.27 | 1 
           python-rtoml-0.10.0 | 1 
python-unittest-xml-reporti... | 1 
                     shim-15.8 | 1 
             sofia-sip-1.13.17 | 1 
             stress-ng-0.17.07 | 1 
                 systemd-256.4 | 1 
               tcf-agent-1.8.0 | 1 
                tpm2-tss-3.2.2 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.49 | 1 
        util-linux-libs-2.39.3 | 1 
               valgrind-3.22.0 | 1 
                 x11vnc-0.9.16 | 1 
                  xerces-3.2.4 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/f337c098967051c2e1ea292bf6fa91f1d11212c7 | ORPH
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/350bf95629756316e98e596a9430debe3d068a54 | ORPH
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0adf08b935c643c00e830bb64fdffee6fbd36ddc | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9c9ef5b00ca7e76acaa85dc93e9bd3b5f06209ba | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4dd5e0f0b9ac053e39224a031f4d158864165e86 | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/bacc2924de7a2b9363776ee812a0ef132c2278af | ORPH
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/032bfeaf3e2b46764b6c8842a5b93d1d09018561 |     
microblazeel |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.net/results/5a8b1f5738a4fc3245ac86bd513348df79a2f80b |     
   sparc     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b7ce24a3d8db0a70044c932928f5541118e20e4e | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e10049aee3c6589275ce298326b975f1270ba7e2 | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/95b129e3b607a54c66891f60de1043f3d47ae2fd | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a928c69b3eea32c815610129ff61a8b7b246c1a8 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d5874da69d7a5c09594abfa7ffb42b83d4037032 | ORPH
    m68k     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ed97c8cd1f3f5dd3d886333bd0d06fa36504992c | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e955fef78b1b06a99644c1bbf6edf1c5f9eb276c | ORPH
    sh4      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/056cec2afc6ac77c19ef0de4eae2ccfee192d571 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3c997c5864ac92253ef259ddc2ea183391c1c232 | ORPH
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/045a3b276044342fc9565f13fff6489f160f1cca |     
  riscv32    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/458880bd6c207e5bb7afce1a1186f204c30c0941 |     
  sparc64    |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/5c483837ed7007e8dddf9294261e1d72429963d0 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/c6bc26c5617ba935aced08ed997562dcc67aeb2b |     
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/e26d5e7688a935ee1da2096d2ae9e9b30248d323 |     
   mipsel    |        bluez-alsa-4.1.1        | NOK | http://autobuild.buildroot.net/results/ad124f3cbd61d535db82967c84f343cc4969cffa | ORPH
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/addf3a231fd87aa75a4532225dec21715ea66bae |     
 microblaze  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/068fcf248cdd5319dbd3bfa6a638fa7abbfba90b |     
 microblaze  |        bubblewrap-0.9.0        | NOK | http://autobuild.buildroot.net/results/4434d8b3a458063c9beff0f5b9e96f49df6704bb |     
   x86_64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/f79e738705a9bf110f339c1860d7b11fb801f3d8 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/19e39ce1de9c795092914533e2f2c688991a7433 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f2643cd7287f2e4e0be8ef525c9108a4ce1d9706 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e378ec53ffc0680cf649ae306224a302bdbe81aa |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d12b565dcec1ce8d61f0bd390be2b3ee879b297f |     
   xtensa    |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/3950528f97b286619fe40af7c4f3f797cc9c7c05 |     
   xtensa    |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/ce36170d67c4702f34bee025d8a46e5269c4573e |     
   x86_64    |       containerd-1.7.20        | NOK | http://autobuild.buildroot.net/results/44ed5e00fa0245c99a1da51209af9a122a1f9403 |     
powerpc64le  |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/2a6434adbefd53dcc512e091d402d1467e720ac0 |     
 microblaze  |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/9d102d43885a21bb43699dc3d23a8e6477958cd0 | ORPH
   armeb     | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/eb3989b0001aac55a3592b84b2a80563f0f6ba22 |     
   mipsel    | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/fd2e7325a5926a675f52606f735627e00e51a614 |     
   armeb     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/728a07b17c62b232134b8a5717ddbece70d52141 | ORPH
    i686     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/89e08689adbac7f8cf82552d40530d4505804875 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/13eeda533f10dd12c249ffae1b6c754d0408d207 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3087469913c086ccd57d6e85085db4a73d78063a | ORPH
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/57c3fe625d3b0b60eb8866e6551dac9d5eac9031 | ORPH
 powerpc64   |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/9752010b7ef0e5760d309287880266503121a853 |     
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0d0eea1d358d645481c7199f6c27b4e991778933 | ORPH
   s390x     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7f90e64d69e7460ed87130d5d599a9e6867a6107 | ORPH
   s390x     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/90be56dbc9abda068eaaaeef7bc37463a5003f6b | ORPH
   sh4aeb    |            ell-0.65            | NOK | http://autobuild.buildroot.net/results/aa4a1e090c85ea897654bf377b048e4134477d2d | ORPH
 microblaze  |          eudev-3.2.14          | NOK | http://autobuild.buildroot.net/results/88fc28fd550b585eb312c28de876c10196352fed |     
powerpc64le  |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/1513f92e3a3fb8b46eb75605a97eb0e7d9342cde | ORPH
   xtensa    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/a94b8420b391f7da03b53ac80969bfc776d2eef5 | ORPH
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3f752bd8d5add6df6f4cffa7a9fda4857d7f9697 |     
   mips64    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b23f78e90f3eb0c8e1c9ba8e189ad52e21fd4a7b |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a825afe118eec74b7d2e66ef25d7134647a7796a |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/dc259d273c0c742b3b9f9376734c04ddc7a9af4b |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bae5f18ded117b8e6e8db5f4d0901a434c762d96 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/009d72792a88c59e17a9d5816179ba2b4c06062e |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2d5f359da09d6ce525b8271753035ae7ef0fdbc9 |     
  sparc64    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/edfb25da1f9c3c668d346ac2f403396a23f046d6 |     
    i686     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/fb388c65a17f0951754d218320e8218dcf716c54 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f5dac58bfa259454dd896b8139b26d14f257ff6c |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/6795f94d42799c737e6ffaa0cb799fac1a4c18df |     
   mips64    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/1d59ad70b0463566a5c48475f1b0475e1a3c1431 | ORPH
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/4e46ddcca12c38933aba2793107317c4a2cba7e9 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/f6a88d5e676ff1e7f35c3bbc243ea7680425ed3c |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/f4b9e0aa4c11414a1e5a8485ea0648a5b8937226 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/cbfca636bb4707b7301375998260e9056184aa95 |     
powerpc64le  |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/93748ce3497939863af1f66f88f598891896b23a |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/e0e98ad90e766c3ce01a132f37770f46ef8c0b98 |     
  powerpc    | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/031672803c4157402234e2196e80cfab031f0016 |     
  powerpc    |        gcc-final-12.4.0        | NOK | http://autobuild.buildroot.net/results/0d07e07018d66bdeacd6e62db6cca3ef0369a177 |     
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/db887657685e45eafb736677df654207ff76bc60 | ORPH
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/72ebdc408f29940149ea1af7412d4c1e40ed71dc | ORPH
  aarch64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/5294a0b47e934eb8f0ff7e9c2205fce4c4a6bc39 |     
    i686     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/a463a35681c2e2bed8504525e53aea9c1eb3c0aa |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/aee6b8710557cd9faf64b35594ee28a56ebc3dbe |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/1bcbd688f323fdc0459c10838a3d36b38093c664 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/930a520da6e859467c2b879c21f7f48a8953ba47 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b2e706b663bda788d528d86eb96ca8fc635e6685 |     
powerpc64le  |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/eeeff27606d7abf526060f567ba145489c540d02 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d4300767972983d09dafdfde266ae07b7ababd2b |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ddafcdab78e2a553b1f2f161860eeab973fe4717 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4cdac6a2fbaa281e00f6ea1221eb38f6bff169b9 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/10852d330dddc87edbc1bb74594fdef309c5adaf |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/8597f6068d56b5f3dbb1a1766f9710a7eaa78c8c |     
    mips     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/987edd23c17390504fc719c2b0960c4a699e391e |     
  mips64el   |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/01c1f891c6d58696bd10e1a172573b750c0be689 |     
microblazeel |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/fb88041d7fdda63c7f9f4a6fb398e7a81861bb52 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/858034fa3dec5fe2737384f98ce0d905061f9962 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/67e9a3582a7d9a9a8f5251d8cf4cd908083bf44c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/84cb11921dc17a6b4edfbe6c2b1415134c924b08 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/6a82875756aaa6be50a126ace359415efb90075e |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/dd75acce875c09341a939646524db01f38bb3bd4 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0aee09184723da7ae3ff7e2ae3c749cae9c8c7ba |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/11fd1abd3e83673ee44743e12c8dfd3328c44a2e |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e550d3a8190f76de857b6fecad691d0e28ab4fca | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/46dd9e410ec76c3c7350d70c7b246f22ce0536e4 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9e5be104b76183119c9038f9312fc85877a8c9b8 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6e590d860f7a0a027fc762669d6ae9408fd4fd04 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b980bc9e1e7d1be1811333bfc25292519eab4e91 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2e50568763d9898eeccebb6d58b5bdac03e54067 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8f93579c278296ea6f26cabaab257688dfc6147b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6091ff1918ea4afae2652a97a793961be90b460a | ORPH
  riscv64    |         haproxy-2.6.15         | NOK | http://autobuild.buildroot.net/results/f8ab2cbbbb8256d278e26c5d43754bc2001fbfce |     
    mips     |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/152c399153d23f12707fb7d66822380e1a59fa1d |     
    m68k     |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/b593bdea8e90476df7858ea58fa13665c6219d85 |     
    or1k     |         hiawatha-11.2          | NOK | http://autobuild.buildroot.net/results/2b252cda1cca8c4eec973dc0bb83c663d85cf0c0 |     
    arm      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/1393d077b019c70f2689115b3af62e5366bd273c |     
 powerpc64   | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/4a90d6ae77795c3b86c419a5db97d6b5feafd38b |     
    or1k     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/1222c20b52f5ae77b3904ccc085d4f243f074d43 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/bb5ca66b7956b599cc976da46001e15b8cf68bfc |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/c8255ec43aa190d99e9cca090ce7e95974083839 |     
    arm      |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/7d75cb47403036b76e36d2ebcba1cc01e90e6d9f |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/a4a6f543d1910708625026e3972820381b590056 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/a54e6686a4fe50f24f8ab67269c57af6e88c8927 |     
microblazeel |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/6b9a0445ee0415063171ec3832d2ad2107078bc1 |     
   x86_64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/9bc302bc1bae57f0d61cdb42dcc85d223e51433e |     
   mips64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/245807cdbcf85ded1e4be6668eca4d215a261fbf |     
microblazeel |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/a4b1821495c683fc31417976618d414ed28f71e7 |     
    arc      |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/ac878870e2e6f19c3c3e9c144717100004c0d085 |     
    arc      |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/7b8cf70c6c00576ae33cf20d5b9e768524515f25 |     
 aarch64_be  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/e7899233129a6e4132913c70f054e14f0037eef1 |     
    or1k     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/1b02dbf0b5a6ec62acfe36aad9f86e42ce99b1f5 |     
   nios2     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/eace5949ce60403261685073ccc9f2e82e419d12 |     
  aarch64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/2c499f47bb63e61cefeb5b4cbe88c8add7dba53a |     
  aarch64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/d3be7ff9056476ede8d2e677ee9730c9ea870dc9 |     
    i686     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/7bddda06e07cd53a92011a8f312c3b369cab040a |     
    mips     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/3e6db679e0715f0d800324b269a12985cdc63744 |     
 aarch64_be  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/9089239d34bbcb82b83eec86afc2dd93b1e37118 |     
   armeb     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/f355e6a69ad6c1f5d6edcf001a7779cc4348dd47 |     
   mipsel    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/f2a0b517a623acb2b8eb27e173724599aba193a8 |     
   x86_64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/28bd24438098312920528e1f3935c4fa7148f475 |     
  sparc64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/9f66c27e460d41812ab78c0fe38ff1906092c2af |     
    arm      |    host-gcc-initial-14.2.0     | NOK | http://autobuild.buildroot.net/results/4dd0b141d69c6fab81e030731066f0933cc93364 |     
powerpc64le  |    host-gcc-initial-14.2.0     | NOK | http://autobuild.buildroot.net/results/704ba0ba6e5aca55b8365431347801de5794b97c |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7ad98589b4e49a2f0cda8241f4c69d77b56e12f7 | ORPH
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ea57d99a7a14155d84e6318aefbc5003f3a53322 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e9fca69ba1142dad2a867aebf6925c31cc09d08a | ORPH
    i586     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3ca029f286b6d3fa5f127c3b25b4322be148048b | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/644bb488dd70c97ae169b1ef9e1a861edc3092aa | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/036080b786567361dfa604fbc3f7392d5ec9bbe7 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/94aa3e63545d9dc6ed4c5805a497095a0d7cf0f2 | ORPH
   arceb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/715243168de44654eea7597ad72fb9b485db9f61 |     
microblazeel |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/9853ea92d918309451ddf87c3170b13eb14fa8df |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/a219f7cdb4151f1e89d50c398a466bab2a301477 |     
   x86_64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/9725d6f1479183dfc2d79926970f3c5fb72305aa |     
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d63c0740d459eb445f3e2f018f48dfe7701f9de2 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/123ee0be9379e6953082fddb70555fffbf4ab638 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c26193ee2b85cedcae3b5a3012a392e7d58f73f3 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7455f950a9bd3d473363ae2678953eeb82e0db92 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5a8bfa838127672ca0d874dedd489f59db754394 | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/933b058413e36630a73ecbb80a13d1095c88e682 | ORPH
  riscv32    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/a7f5376d80346ced958522719b7035fde8797a78 |     
powerpc64le  |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/5a7ba99786076ac852b7a4a7e8d7027a13a90234 |     
powerpc64le  |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/1cce86ef8d9263a8dd630bd084b6fa64419498c3 |     
    sh4      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/74bbb3dac6d9ac1058de7099be901e4faa0f3e4e | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/129e370949f8512b2a6f9ae3b5c7941e842b4ac1 | ORPH
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/c4102bffeca840f0b365c0c971e437107deeef7f | ORPH
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/5a68ceba1525639c472b2e601f56869f549e4d1b | ORPH
   mipsel    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/5ac321fae8d60230317e09817a4abeccae3de0f4 | ORPH
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2e90a988cc26357e3103825461df01d601a60770 |     
    m68k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/148d02a4a152e1357f8d58c3f5a5b31aadc5b857 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/36df57bfe6476c2bdc6eb25eba8007f83204112f |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/071b7e5cc08c9ef8b8c84a039289c8e941f6240e |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8afb29efd6702bdeea55ba03489193392dc81c16 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7d66f34f9f64387961953cfb69f5063fbd16df7e |     
  riscv32    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2dcd772a74a064539e7e73d3c6ecf079dc0c3259 |     
   s390x     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/90fb375a2bfb3014d94c12b9638dc3f5ef74f4e1 | ORPH
  aarch64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/2c8e4ee0edffba1a38c9f26bd99a4d4467a723c7 |     
    or1k     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/8396d17ea06d07bb324377ab9055c4ed1f94189c | ORPH
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f0f93ef58fdd590bf0cc7843af0a4cdd8757e11c |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/a0d05772d856949b3e37b0bb2f5d910f34568e90 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/25b3ab72d9e2b2752b78c1a4540eeb6a8325cf2a |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ed2661700cc21f0ad8859e2f6e04c638d7ef32f6 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/90e9a07ca1a3d7f139fafbbe75a29e70fecb85b7 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6e860e0fc94804f3ae5b2d022af1431ffd6875ed |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/82ec6733212ccb9797500d85f02b361fbe1cf179 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f65688bd19d2b0fc6c022710e67ef17402a0a32a |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/4f11533a2377997bb565fda94f79b95299ac3065 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/47ce1a8ad885d359d3f63b6c559245bd1658c1b6 |     
   sh4eb     |         libjcat-0.2.1          | NOK | http://autobuild.buildroot.net/results/5d7c5dea0213f5a24489c397c5703c0601b2f12d |     
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/480e2cbd09f8863070b1df005a749ba93456cff7 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5be1c0aa33ff8dfd9c31be8082d0a62cf8edd39f | ORPH
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/01a9f2838e316974967bba0649eae02848f8091a |     
  riscv32    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/d56ebac2f6232be4cb804c9509fcd6fc04c2f0d9 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/c17a86104fc8b2bafff616d18541e39e94c02c26 |     
    or1k     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/7d5ac4e70829ad176ced884a3ff5cba10698712d | ORPH
    mips     |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/941156e483feee9103c360703eb4e6434430817a |     
    or1k     |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/d065ad6aa13bfd7e23346368eff9f429ee192dfc |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/50934633d2d72eaa3d9748663fbce114cc2f2975 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/8c347c40eb788cb50adc8c348a4617df63bf0d11 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/3ac52d5738e88f210ff8b093c2bf360dd96cf6f9 | ORPH
   mipsel    |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/1b4f333fdb0df999f80c4694bde09800f5d09996 | ORPH
   mips64    |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/4ca0d1af7a59edfb19140e673aab6a82503459a6 | ORPH
   mipsel    |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/55b7d3fbaea264c126631c15b328c56ae05465b3 | ORPH
    or1k     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/1fb7961c67ca6be380251b64371d36c806357a15 | ORPH
   mips64    |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/5edebbb44f5c7b4e3eb9a78e0ce370257147baa9 | ORPH
  riscv32    |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/46ff13d60d89d00b5c5d8fe805a1a16cbcfdba53 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/7550c9119fe25a911ec2a79ad71501336568a587 | ORPH
  riscv32    |          linuxptp-4.2          | NOK | http://autobuild.buildroot.net/results/61583589d1def22f4e27a99987bf10de1cf195b5 |     
   mipsel    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/a1ae53c4c2c6d58ecb722417255eb53ce5c80d4f | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/7f4c67141a94309779293938a56947a3b3091671 | ORPH
microblazeel |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/f262d61a71fc1f87c1e49e014ae127abe2e2c35a | ORPH
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/5367c9d8a6b80c5c7ccbf33bc28ee19418f31d43 |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/42e4205f47b8acdf689c89163a71d5279631abf9 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.net/results/af4d6d349b098a49ec6bf684140df47a7c5a073c |     
    i686     |         mokutil-0.7.2          | NOK | http://autobuild.buildroot.net/results/dc5fc0cff7fb7ceadfde6653cb3aeddf3022e3ea |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/bd0316f7959db140a507b9fa388bca698a613cfb |     
    or1k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/578c3ec8f7410e754ef612b90729bc13f40fda81 |     
microblazeel |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/e1a8e065631edf3b4ed31d1d7f8ddf05fab158a8 |     
   s390x     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/1fb8c5de346a3eeba2506d4b15372c32b0064fbe |     
  powerpc    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/86966c12bd48e6b2c77e49f056282b26ee46bfc1 |     
microblazeel |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/a9bf7e6ad2798628c96844dacf42c8f3f4db1f44 |     
 powerpc64   |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/e4c27b9ac6864198b8586e9feec5a930a86f074b |     
    or1k     |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/3ed27031f5bce7e297514624818ab82443b57a2f |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/07ee2999717593b7a2fa0a6af7e981015d2c3408 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/1460f303d3e3de08bb0c38e8d8003753fd489052 | ORPH
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/b5584959beaafb72a7863cd27ddfed373aa0c672 | ORPH
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/acc534b46eb880042b41100796425b9cc949fe39 | ORPH
  mips64el   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/edd202577ce102aebd06866de9a13a444e2157ce | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/269f7204eb51161a59a91682c2bd0d2cceaab6dc |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/caa6e7ced3e91b92285c11184af3ed18235d6c01 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/318333952565572bce7f3ca181fd0a6e6baaddae | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/1d09c6d335e348e9caa3e81a0655aee0e2af5e46 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/eecaf7405d32f407f04371cd1d85eec6eaa59777 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/adee1c42c9b4a3e25a47460d93d6b85683ddf7a9 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/0a744465e54ec9c9d2308f0e44fb2c05c445ab82 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/6179de23f17cc6d7e2119d762d1313ccd95130d0 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/897f276c3c1bdaf2cffc650b6fd4c045af91fb92 | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/f1f272b8f00aabf51dd5ca34b6715a73f8d25624 | ORPH
   sh4aeb    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/070a3e8a9c3dea002c7b0102a6b4d6e2417dc211 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/3a80d55a47001e9141ec54f754aa83bc6ee086ca | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/398fc88e3fa0d4a4888e9b42a04215f4cedc6a4c | ORPH
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/35479a87d75d2ba046db00589ad142c1e46821a7 |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/9b5bf9700646ca0ce3bacc8d9379749f2bf34a4d |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/c17a4cb53903ef85afaafca3b8ff12a75708c3cc |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/c0e48271ea07b53a80e76d3d786471b9ba120b71 |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/85cca7ab9c76820400014b2764c2e60c3de22544 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/055be4070b7516494e20d900b244336504a725b6 |     
microblazeel |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/1b2c29d1dfcc3e1a6490c936413fcd2e1c37810d |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/118f31ee56b72772dbcaae33de71ababa61168e2 |     
    or1k     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/0aad151cfb5d54dd3687513272752737a70aedd4 |     
    m68k     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/a7165ed2308b004d8ee30d86c432f70a0ad69e17 |     
   nios2     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/0bcee7f58919875051ed58c9ddfe1ec3710d77e4 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/ff53148c8a1a6e4907ac7550ea8b2175003290c5 |     
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/3e52af76db06c29f8b8f6a993d66995597431874 |     
 powerpc64   |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/49a4518cd8e6c2ceb6e6a256bc7c83422c06e710 |     
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/6df2cc04796ff1a806f9627f62a43e11e13ca967 |     
  powerpc    |      python-rtoml-0.10.0       | NOK | http://autobuild.buildroot.net/results/c908f341e2c5e620d54b9476668bc1e1526f26ab |     
  sparc64    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/1eaab55cac8a890c30edcbc402e469cf7f1257f7 |     
  mips64el   |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/ef865e363a4d798278a64aa4bce3d292c22600ea |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/31849d783411d772a1b05e11afcf716836bb1800 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/5230bcb7c18b0b2b9be3e314398d62cb4efc5baf |     
   mipsel    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/fd21b49a85367eb347d8fb376b566fc0c02ef8d7 |     
    i586     |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/aac61d9d40053d269a59c15523e887823ce047ea |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/a60fcc01940b7d48a21705128c33348c8227c6da |     
microblazeel |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/df5f6071cd751419899ff05c21e589c3221fb76a |     
   nios2     |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/69496bfc6216a8aa6fcaeb551a1f5b5149adf273 |     
 microblaze  |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/0853d5f252cbefb0155c610dc6132742cc61e422 |     
   mipsel    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/08b99a13346337e9d3138a0f29f5775c0a95d976 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/ab96f9d4706399c468d324b0939fd2f3eab15095 | ORPH
    or1k     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/80fcbae5f2ecec2a4b2f141a9330c49224007d35 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/140a2ad22e3c2d6cf3a12213b749636e81f949c1 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/7e6acfca663182f7cc6a1ec266f93823b39b04f1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/52999b74066b581397c4e32bb373921cef194bb0 |     
   arceb     |     util-linux-libs-2.39.3     | NOK | http://autobuild.buildroot.net/results/ada42fbe3e05d29553eebd3c02faabcd5186239f | ORPH
   mips64    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/0eb492549230b79d1374e55981801d2498cc2bc1 | ORPH
  powerpc    |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/f5e7710c51dd97e6945b27e9056be361d7c18981 |     
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8be86ba8a2d711b47b1e4c2f6ea158a67ac87843 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c44195918b80045764b79ec1330dd9d1b797e9a4 |     
   arceb     |          xerces-3.2.4          | NOK | http://autobuild.buildroot.net/results/8cdc77f92161af4a7c20d29940a47ab8eddd8529 | ORPH
    arm      |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/03b3de667cf4780af2b565e7a489bab1ab6e162f |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

          libcamera-apps-1.2.1 | 2 
                  fbterm-1.7.0 | 1 
                   foot-1.16.2 | 1 
                  scrypt-1.3.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/d71fc63e9c2637c9cee03b994a1b66632e7a7810 | ORPH
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a20a3f433e14086d2909f5e84ca62eb20700ac43 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/6d6e82f54e34a127cf65ac6251e535ad024cb7f4 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/98e3ebb904be95188b48f169ce9cba056a16c7b6 |     
   arceb     |          scrypt-1.3.2          | NOK | http://autobuild.buildroot.net/results/88d68af3818ab2b6596a89712b0215cb81625c52 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                    eza-0.18.8 | 1 
                  fbterm-1.7.0 | 1 
                  ffmpeg-6.1.1 | 1 
                memtest86-6.20 | 1 
                    nodejs-src | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/2d1c00d05fefb101b431b8182336fef8b61e978b |     
 powerpc64   |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/153c3921276d90fcaab9e6b39f54f422e45d4823 | ORPH
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e0171dbc15ab958734d964827ce53eda5ee40b7f |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/4bd7d3ee22747d1809db71e5733dc6621732b57b |     
  aarch64    |           nodejs-src           | TIM | http://autobuild.buildroot.net/results/872e0ce06fac86984de5c530c9a4d87e1ea62747 |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/85b95aa6cb925e350746c4cfeaab165fca7c39cb |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
