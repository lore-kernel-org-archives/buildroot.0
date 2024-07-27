Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C1CC3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 05:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A5AA40EF4;
	Sat, 27 Jul 2024 05:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 035DikOOl1gc; Sat, 27 Jul 2024 05:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBCE740179
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBCE740179;
	Sat, 27 Jul 2024 05:06:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1A841BF5B3
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 05:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4E1B40DAB
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 05:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPSGUb6LRPto for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 05:06:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18D3D40D93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18D3D40D93
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18D3D40D93
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 05:06:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A692E000B
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 05:06:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 05:06:29 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722056790; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SDmYjX1/HBfzxdzttzVujYSi0xw1lCBgwmedrMtFFpo=;
 b=pbT8qDfUVJntKNKEDFEucSX5UXGG0febG9CSwDMOx+/zh921W9L/4HuHtYCLlTTvu+9bOq
 itor3m99XxpOYYYqhAQS2bAWRBcMwmd3gyl2KK+nx/DsH0ZNvvYHgu51VGpWdgODD7QQZ3
 fjI9HFCAzyHPdtvNbPDY5/1VQqrNP7zUTE/MXXomZdfZRIoWwXX1x+wilGsUn7O+v1+h0z
 pnpN85D1B5EtbUZ6LF+DGuNCSa2sV5V05fQWmo7CAjiSiASoO02+Cj4Lat8oPPzC/fkr3e
 72byKfJWEkSCSLzGhA5sMNKc/2CkDO18axFbvNxQlkvlfKJfOlpPykK4gQRviA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pbT8qDfU
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-26
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
Message-ID: <20240727050629.iOrxJVCLuFh_oC1mBv4BMM290yus5LPdenGs57q1EoA@z>

Hello,

Autobuild statistics for 2024-07-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  4  |  1  | 12  |
  2024.05.x  |  4  |  2  |  0  |  6  |
    master   | 120 | 301 |  4  | 425 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 13
                host-odb-2.4.0 | 12
           host-systemd-254.13 | 10
                     avahi-0.8 | 8 
      python-autocommand-2.2.2 | 8 
           python-daemon-3.0.1 | 8 
                  bcusdk-0.0.5 | 7 
                  ffmpeg-6.1.1 | 7 
                  cairo-1.18.0 | 6 
host-vboot-utils-bbdd62f9b0... | 6 
               procps-ng-4.0.4 | 6 
                 dc3dd-7.2.641 | 5 
                espflash-3.1.0 | 5 
                gnu-efi-3.0.18 | 5 
            host-binutils-2.42 | 5 
                  libffi-3.4.6 | 5 
                       unknown | 5 
               zxing-cpp-2.2.1 | 5 
aer-inject-9bd5e2c7886fca72... | 4 
                   foot-1.16.2 | 4 
                gerbera-1.12.1 | 4 
         gobject-introspection | 4 
             gtkiostream-1.8.0 | 4 
             host-delve-1.22.1 | 4 
         host-libxcrypt-4.4.36 | 4 
                  ntp-4.2.8p18 | 4 
                s6-dns-2.3.7.2 | 4 
                 apache-2.4.61 | 3 
             containerd-1.7.20 | 3 
                elfutils-0.189 | 3 
              fluent-bit-3.1.3 | 3 
glibc-2.39-74-g198632a05f6c... | 3 
                 gnuplot-6.0.1 | 3 
             gnuradio-3.10.7.0 | 3 
                libressl-3.8.4 | 3 
                  linux-6.10.1 | 3 
                    norm-1.5.8 | 3 
    python-cryptography-39.0.2 | 3 
                systemd-254.13 | 3 
                 apache-2.4.62 | 2 
                  assimp-5.3.1 | 2 
              cache-calibrator | 2 
                 coreutils-9.3 | 2 
                  fbdump-0.4.2 | 2 
                     file-5.45 | 2 
            gdk-pixbuf-2.42.10 | 2 
host-heimdal-f4faaeaba371ff... | 2 
               ipmitool-1_8_19 | 2 
                  jack2-1.9.22 | 2 
               lighttpd-1.4.76 | 2 
               linux-pam-1.6.1 | 2 
                  lvm2-2.03.23 | 2 
                  mender-3.4.0 | 2 
                 openssh-9.8p1 | 2 
                 pixman-0.42.2 | 2 
                rocksdb-6.20.3 | 2 
                softhsm2-2.6.1 | 2 
                   trinity-1.9 | 2 
                 uclibc-1.0.49 | 2 
aubio-152d6819b360c2e7b379e... | 1 
                 augeas-1.14.1 | 1 
                    bat-0.24.0 | 1 
             berkeleydb-5.3.28 | 1 
                  bind-9.16.48 | 1 
                  bitcoin-26.2 | 1 
          cloudflared-2024.6.1 | 1 
                     crun-1.15 | 1 
                   cvs-1.12.13 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
                   dillo-3.0.5 | 1 
                dovecot-2.3.21 | 1 
                 expect-5.45.4 | 1 
                   eza-0.18.22 | 1 
                     frr-8.5.4 | 1 
          gitlab-runner-15.5.0 | 1 
               graphene-1.10.8 | 1 
                    grub2-2.12 | 1 
     host-moby-buildkit-0.11.6 | 1 
 host-softether-4.30-9700-beta | 1 
                    htop-3.3.0 | 1 
                   httping-2.5 | 1 
igh-ethercat-f5dc109176400f... | 1 
                  iozone-3.506 | 1 
                jemalloc-5.3.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
      libabseil-cpp-20230802.1 | 1 
          libcamera-apps-1.5.0 | 1 
                   libcap-2.70 | 1 
                libcuefile-475 | 1 
                 libcurl-8.8.0 | 1 
                libdrm-2.4.122 | 1 
                libgeos-3.12.2 | 1 
                libnss-3.102.1 | 1 
                  libsepol-3.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
   libtorrent-rasterbar-1.2.19 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.12.6 | 1 
                   linux-tools | 1 
        ltp-testsuite-20240524 | 1 
            makedumpfile-1.7.5 | 1 
               mariadb-10.11.6 | 1 
                  mupdf-1.23.9 | 1 
            netstat-nat-1.4.10 | 1 
            nodejs-src-20.15.1 | 1 
                opencv3-3.4.19 | 1 
   openvmtools-11.3.5-18557794 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.38.2 | 1 
                     php-8.3.9 | 1 
  python-pypika-tortoise-0.1.6 | 1 
            python-scapy-2.5.0 | 1 
python-unittest-xml-reporti... | 1 
                python3-3.12.4 | 1 
                    rtty-8.1.0 | 1 
             stress-ng-0.17.07 | 1 
               tipidee-0.0.5.0 | 1 
                tpm2-tss-3.2.2 | 1 
ulog-0389d243352255f6182326... | 1 
                ustreamer-6.11 | 1 
           v4l2loopback-0.12.7 | 1 
                wlroots-0.16.2 | 1 
                 wolfssl-5.7.2 | 1 
                      xz-5.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9222491a5bfef1616f5554d92d522721b8fbdfa9 | ORPH
    arc      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9087c171be000c34cfb2633b20eb327e2860e477 | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0be7cf336747f91afecf362da47960aa1cfd01fd | ORPH
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/b49f9b3725dcd6dcae67186e4c6db1a920539d84 | ORPH
  sparc64    |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/a72f79372e1eb227547581e15f78f329e41637fa |     
 powerpc64   |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/8d0c0986b57460964800619a4641e098b31c1ad4 |     
    mips     |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/e03b5306b9ecb983e21859c3a18482374242522d |     
  sparc64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/6d7c7a1ce6b84941560fe4edaac56c7df4ed6251 |     
    i686     |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/dd9e6f3057ab1dcd8e30c761e986f3fa5003ee4f |     
    sh4      |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/8e76b7d55b81e13cdd2737bae73b2e2b67d7f92f | ORPH
    mips     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/15642392d4b42586b1038efb6270f684378befc3 | ORPH
    m68k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/9aa846c48e4c0938212324980aaaba24e0e1e033 |     
  riscv64    |         augeas-1.14.1          | NOK | http://autobuild.buildroot.net/results/73268d7af2f1c4bb17e5efa91edf599334732c3e | ORPH
  mips64el   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/14f545ac207e4f3bff01229874b195548fd163fe | ORPH
    sh4      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6af17df4c7119d3593a9f5eb7d9490b08aee2362 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7a0296f4b53b8c2568182e62ffa18d8ebf11293a | ORPH
    sh4      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/190a165551970c9fffb92e01c8a00241ca6d51cc | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1d429feefa3fb0e6583907b91c159ee0eecef1ab | ORPH
  powerpc    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/af633771f9e186f367614459c76f55235fe48fa2 | ORPH
  mips64el   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c59da30464cbddbef67919fb5e14757c16e51b1e | ORPH
  mips64el   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/478ea087ee2264a7ef9871351016ac4fce5c4581 | ORPH
   armeb     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/8e44d064cc42c3e4a7be882c5230b241d4646cdf |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e932efc0498b9fc3880fe6fd9aa7621c4c932403 |     
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/445378d8b33b8feb4bd20a3a1cd7d0f662683abb |     
    sh4      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/6ae6e11dbf89cb62876c06a61c0ae007b0d9afd3 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2ea92a3c0f12b4fe5a04efeb1fe094bc31788ccf |     
    sh4      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c1c0b9db479acfe0305f85a368dca876584710a6 |     
   mips64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0d5ee15e30e7c0e23407b5d14b27bb8a935b7961 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/86217cc79695aa3ed67e6ca6d48d95e172186d82 |     
  riscv32    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/01314c4858b7ee7d9405eff03aee8adb152f6a64 | ORPH
  mips64el   |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/b10a6040c7c742571aef143473c2b93c28e972e7 | ORPH
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.net/results/50739d550c82a1b5a00b28754016d4e4b59b7f15 |     
    mips     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/6793a13665b653e36edbb4d35626a7171bc7c399 |     
    sh4a     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/5a6e9f05394c4741ae2b5cb70aa167dc18983298 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/260a90f0a850009fec04a235fa88d75aa6ead9c0 |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a123355b6d315d2fcda646d3f1c7b588cba78258 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b8851ac93e4d55ad04521f6bc34b6096d0b64b97 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/62a20cd1351ff31d3f6cecdaafe2af7483d2dad8 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0b15dee96d67beff5d3a1b23f829327b6be3e413 |     
  riscv32    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f576679ba7135b32c08400c3acf73fbb30c1cc80 |     
   s390x     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.net/results/119ae0bfa6faa788acb4f322b7d3ac0482e43300 |     
  aarch64    |       containerd-1.7.20        | NOK | http://autobuild.buildroot.net/results/8be18b5768c1e4f1c20df93748fad0fbd72e6cbe |     
  riscv64    |       containerd-1.7.20        | NOK | http://autobuild.buildroot.net/results/c02680fb14451a8d23970b06aa3500d646d8e9cc |     
  aarch64    |       containerd-1.7.20        | NOK | http://autobuild.buildroot.net/results/35bb2d8e6d119afeec97452a3735c586cfead611 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2d06aa923144fcdf7a5517dd7651fda982039ea8 | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/955a2349b1aa2a956cb5305121af15880a0c2c46 | ORPH
    m68k     |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/51d4a3fd59839ca2e81be81fc13180e6438c8be5 |     
  powerpc    |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/ccbac66d7bc034018ae030e56dd54067bdcf9d81 | ORPH
 powerpc64   | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/539975eff6a1910ca6eb052ce3d676b035aa7578 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/93b1e367f4025d53cdeb3374f6bfca4ee7efb670 | ORPH
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6a8c5241c8763ebdeacc229cb56da266ad0b7fa6 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8bfa87e87da1f91e87e40acda9346339ae949d58 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ef11af7773abd5c04912b931b4aacdeef9ca0be1 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6cf5b45f73bd48ccfd82f5b6e657166ceb43232e | ORPH
    arc      |          dillo-3.0.5           | NOK | http://autobuild.buildroot.net/results/2d03cd605107bbfde397812a00ac4b8207b7b580 | ORPH
  mips64el   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/8e654af5db83f8bb33a7cde7c5b44f8123e3724d |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/15e6a9016466373c6e360353c902e0b359f37a2d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6d062398c1d243aa0a3e98415e56f27f9c76d17c | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a85c4ecd07f75fd93ad2cda6bdc0ff03e0f3ab94 | ORPH
  aarch64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/155d426def1c88334f6e5f8c41488c9c12bc6394 |     
  powerpc    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/efdddf5d93531eef897830a233756bac8781185c |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/40a1baa6cfc2ed6e49f88c93fa1b5c5a1c4832e2 |     
   x86_64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/b44d827ad55ccfd75eebd835b39d03b9f5cc03fc |     
    i686     |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/79ee7af15e70c2585586c7ba804ddcf0aa44835c |     
   mipsel    |         expect-5.45.4          | NOK | http://autobuild.buildroot.net/results/44ecc329e26714e378c6130c94c6fd0daba708dc | ORPH
    i686     |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/de5c567b7c4a62dcee812addf3f518e6172bed62 |     
   sparc     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/ef42b111f800d568ea795bb8ba836ed9d4f946fc | ORPH
  mips64el   |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/7adf1d07414372b671435fc103cd2c55c1387f7e | ORPH
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/fac18279fb34d386f841b82eedc6b2ef90ff1f73 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/caf66b12bf037e1fcee87555798972d4ec25a2ee |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/085f60a46b72e52a14daeb968a30f0cc4ee8a7b4 |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bf39bfb1f9eaf1e40cbba658ad421ddc227bd1ac |     
  powerpc    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b65fe7dd808478ee9f3cc8355e08e2e4f7f40364 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/637c4d6a05fabfb760135fd74329fc2a97b30b37 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/6b30ebe7ae76bdf1f2d2ac0b99b3e5801fc07049 |     
   mips64    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/2980fecb7edc5c9d6df47a2797a7d2463c3da97d | ORPH
  mips64el   |           file-5.45            | NOK | http://autobuild.buildroot.net/results/064440e318ed61e610dd160552f5c7fd1febe840 | ORPH
    mips     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/ae632639e828690de3d925fedd2a5d53820b08fd |     
   x86_64    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/6406bbec9753a987156e641893d62f1dffed12e4 |     
 microblaze  |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/38af5dc2fcdd1e1b6061d4dedc21d4bac971884c |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/fdd2daa18a181e61942b571f2d87ac45e9b87b7a |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/fa84f4d89fdefed2a2c37dcb155e5103cd9959e1 |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/136090422141f105371c9e5a106fbcf91cccd86b |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/74541b36ae56e8d687825a776a86f5d95b20f8fe |     
   arceb     |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/f6310553a24146adc58c15569951fafdac3fad1c |     
    arc      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/5f160833467948998998d9d29a79d65b0c178d1b | ORPH
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/bc32de846c87bc7cd3c814230b3a8cb0dd0e4783 | ORPH
    or1k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/87d7ff6db0f60c46e70fcdcdbbb6597c8ed17e3a |     
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/760af3625294ba4d7733f8591c6c9c5e4d2d8fac |     
powerpc64le  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/0479040ddbfe51bb922d078bb58dc2ced625b14c |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/026a43f6ee9e24337babc707be0ad6073372e25f |     
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/69c662a2fe78e31291b69dcb8645758c686d0482 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/ee35f0dae96598f2ed39986d671b95b6bceaae0f |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/dab5967a948aa363df144899b6344f7ef9dad736 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/c79f2eb529432c472cba0bad259274401da49f96 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/8a80d144a75c4bb8bad162ea9b296db2064a851a |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/02276cac8d63b49777bc6ebec8c1b8bc15ca594c |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/33a1863a16bbb22867324cded5959409a2277e28 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4100f4c4a2717e763d2837dff8e6a3a95ef447c5 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ab8150b847ec57b7219a1918196819495b123448 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/12b04e281a3e25360b4a345236ef4c1d638f47d2 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/66525a71e19da1ca0bd73bdffb0d3de544a73148 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/bede13e4946ff1ab80114a404289df287575dc2c |     
    i686     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/6ff23887aad23151551e2b40fc48e263035b48c0 |     
  sparc64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/1bc3f6b7de967627211e1e033a402676a57f2631 |     
    mips     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/40356525a402e93c34588cdc9074abbcff90c2bc |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e16fc5e48812a1c3331c2b1b030b9a167f37e8e1 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a33cf8216f3aad9f63c2862df89f5528ba1fcea7 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1a224672465e6552e0ca6f722a69ca3ccc6fe229 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ba17b86c0c09926700e58a79dd9522504474065d |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/584e414ae9b7ba1feefeeb864f6c77bd0951dcfe | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b1846b81c22ec31bb4a0eb765efba14acd62e6f2 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6eab4f71ae063c7a80b5aaeffad1b9a98513ee76 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d7133d90ef26982cb72db6e98e65e3ce9391ff94 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/afa91589fed571bace66d0550f2158f52194aedc | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4917898973d3d684a9507cc3e6aa6ba105ffc7ee | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9c8b4d908d08da4af482e92e3c3fceccd616ca5c | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/37c5369c85369800390cd2e7ef329104298eac45 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5b6d4720da0cf7025c329befe5eb81fb9b8f5983 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/427b5bb356e850ee0c53bb91f05f030ae50cd616 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2c30a0fe547f7312b1b90f46eedcf4427ada7680 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b8e15f9bf7a2548951a94d305fbf8450b0228392 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/da169b2d9697aef8d291cd3618f3207b53434d6c | ORPH
    sh4a     |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/2e210733293525ef2e97c2b3961473407a33f510 |     
    arm      |           grub2-2.12           | NOK | http://autobuild.buildroot.net/results/ef9680174ae30c468e5765802483b9ea4c51c379 |     
 microblaze  |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/3057f09aef425e69968fcd25e8c0346af10d9fc3 |     
    or1k     |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/426f285f7f991a20bede2ebaabc8e854afd82108 |     
    or1k     |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/8349883b45501be43344b1e6778d7799fa8e7c42 |     
   sparc     |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/aec24d92cc2196596413cf509d686f1f8d1eca95 |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/18d2031ecb36f1cc867a93c02d6587c9a2588801 |     
microblazeel |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/1c9fb51aa658f01f20593043f46df05b45e50f8b |     
   s390x     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/7479a5b843a18ae5844afd754dc980db67bb73fb |     
microblazeel |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/4e6424f8836f2f20145075d882da6361223886fe |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/0aed5b6dd059ca7a3d085ed8c3d5cab4bd73c94b |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/1c0120bd1db1b454e4e47ca5aec44d706a52a4bc |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/d3e1bca62573f5471cbcc73786b6dc4535c31021 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/eca4a550532c4fc8974b45ccb2af553e716efb99 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/f3e3d2301c83eda279dbb3221fd8227ea1a07761 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/49b7271643147b611aac73f1312ca19bb69e626f | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2b1a6a60fd0e0b63c9573bb3e34ef74b298e7c00 | ORPH
  sparc64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f7a99447a24d69af1643dec664ef8fb845c308a7 |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/541af7e0fa81ccbe61433106de1a913cb95568d7 |     
    i586     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/ff1b209ad81071605f25d8bf69ace6e32afbcc90 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/a561b22ff6c4963ca407d845354f3f585b6d4150 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/77f9412552494249bc4ffbd7e0296212fafef7d2 |     
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3357c7e89729656e7a5836196512b34982202b35 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/20419ea82abdca447edec00286a5003a1249f3d8 | ORPH
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3cb870e7469deef18587450f66da63d437c49ebf | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3fadc0c45077d330dadb64460997b5e5c21b878f | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/621db10dd529527231b1853d42a26a8e9eaf5724 | ORPH
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/322cc9a747afbaba6e228841911ff10795720fe8 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3f470230ec91aca49a593b27a455b28c9daa35e2 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/43bfaaf9b44033c79ade7fe9033ec99fa617dd92 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6971b0a234aa003b3215dca5247ac467b297109f | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/25f38afde936fa6fa8e1c13f525c124ad8958d73 | ORPH
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d9c8158c88af696e275b93b03612a32017213365 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9bbfe9012d177880f23882e28b33fe2a3c54da26 | ORPH
    i686     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/8045088f329366fdc20a80ffdbeb2ca0a67a9892 | ORPH
    arm      |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/9f71eb26083f260898166f2471f8cf44194fe036 |     
  sparc64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/099b1a78ea7ec38358c0c13b49f092f9dc4fb3fd |     
  riscv64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/87ffd939d6264f7c6fbb7ca02302b6ca6889e5b5 |     
    m68k     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/782d029835ccd160ea0e52c30234a05dbb5adf08 |     
    mips     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/b270241a956b80627b2c5b46b68f422e0c82c3a1 |     
    or1k     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/2b01942e3ac7efc0d27bd34d816ea9008ed002df |     
   nios2     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/7fdcbc663f7e9535a87992103521da0ac5e9b932 |     
  mips64el   |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/d6625231b44dd532b54784a4d98ecc653b1d040d |     
   mipsel    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/5984cf6d8d6d3547e9413fccd5a442563cc036e2 |     
   sh4eb     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/b023c629a35864cba03f784f0a4370ce4c47f3d6 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/be096a95043d713709e4c2fd14cfefe756096dc1 |     
   xtensa    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ad9267b06d19c3d0e924bb5b79af7492c95ad695 |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/86fa48d7dd0a76ec8da329d31b30834f350e21ea |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1a4643e2113102a3cfe3a9482855b6cf62bcbdc9 |     
  sparc64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1454225410ad2a415e352371e79cb388b99f05a3 |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/be4e8b03173bc76ab93f0cde0fea63dadd9c6477 |     
    or1k     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/52d65d7bb04740cba43d0b8bd3305c1a212c4f51 | ORPH
    sh4      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/2b6bfcce305410e99004816d2d9bd75b60c3d32a |     
  riscv32    | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/148abc24ee14306574d4b5921493d523fb95a9f7 |     
  powerpc    |          iozone-3.506          | NOK | http://autobuild.buildroot.net/results/32dde19460b10081daa807547d703f02e48337b9 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/f949c8f2fb005c45d2392008a570aab342670152 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/8015c32e52ee77d4c98c3d38dbb784bd87a4fa87 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/0966473a2ade557e00680cdd50d7e406a6c4e6e4 |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/89e5651ac6da04e8a37949ee872dbafec4e32fe0 |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/18d91f1490444b4a7f476656ce8b95148450c8b9 |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/cff8256e4d137343c54229cf249661afaf15aff5 | ORPH
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/2757508fee6a34d9cc42a6ddb49fa85aa259b17d |     
  sparc64    |      libcamera-apps-1.5.0      | NOK | http://autobuild.buildroot.net/results/2020841de5a69d70b952a170c8f1e242e848b1a5 |     
microblazeel |          libcap-2.70           | NOK | http://autobuild.buildroot.net/results/eda3240ca39f8521e5bec823b5d265d4be7de7e3 |     
 aarch64_be  |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/ced1b5b8c22b2ae4d9020d607f5ece0072777783 | ORPH
microblazeel |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/f9a9d4cc0dd38d459c867a1abd827a82d2e47603 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.net/results/7834b5671a65c9b7622f99e780e27471402d6b2b |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/a4d10576ed9d47457c633dd754494e5507e4e2bb |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/76bd5e752d309a42deea819b5e3c802a0adcf50b |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/53b741443b00935086c043e4a80e536f28fa7989 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3fe78fa0dad3e55b11f74f43694d2a1500562d82 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/dd8e32b0579f471ab7d719f9ef906c5afaa63441 |     
    or1k     |         libgeos-3.12.2         | NOK | http://autobuild.buildroot.net/results/d73f61b59b43522f2e15cef284cbf25e63d08fa6 |     
   s390x     |         libnss-3.102.1         | NOK | http://autobuild.buildroot.net/results/05c527eb292db3394b8e3a62be231e6665e9a3af |     
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/857e9174f83643100ac0a3f611cb41c85e2b1f4e | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7937da954b56622bb2441b1e9295403c177965a0 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/74c0c984b69978befa184f66c1e084aa9e06bb99 | ORPH
  riscv32    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/fd480eac5c1ce1b3f9eb12fcd91d7a8a054c5e84 |     
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/759d11875324d68221ff828667c92c27dd85ee3c | ORPH
   x86_64    |  libtorrent-rasterbar-1.2.19   | NOK | http://autobuild.buildroot.net/results/6b9daafd4fd48900f0cf3ae4b19724b25a15771f |     
    or1k     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/e170d2720dbd237235438f5344ea2bf305367274 | ORPH
   mipsel    |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/945516e63376a609ac30a2caef4c870f114254c2 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/43d7235aed691a29dd4334162fbc00e6dfd95d85 |     
    arc      |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/0d27d26e6cd7dcb5b1825aa6d780df9bfa2d8081 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/63e1f5eb768df5d546eec13e0989c0ef2073222e | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/9697e94e7d3d81da9b5a6db6dffbae7ca819298e | ORPH
   sparc     |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/95490114ae972e5f7b4329e0b6e6779fcac8b6f6 | ORPH
    mips     |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/25d309a150b140ec30025d5c26fb564e581588e9 | ORPH
   nios2     |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/00b4b30f36cc73d3861da4a569b885889e0a6215 | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/9735e4fc0cd63fa67056b54ad363aa2b7ffdc751 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/7e7769447859043d4e1c4ff37b2136256a48f7f2 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/faaa37bf07cd2a73a6dc479c5e5943ae9419d075 | ORPH
  sparc64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/b2467598b6f03472e1b9b170ce7bc28add3f331a |     
microblazeel |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/bad25e4493d7ba8c565e18526df4feacb48ada84 | ORPH
 microblaze  |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/ffb381e91c1b52ba1484ec5953f554866813053e | ORPH
   x86_64    |       makedumpfile-1.7.5       | NOK | http://autobuild.buildroot.net/results/7a0ef4f3f3d3ecc6b84a573409302eae5ec90e39 |     
   x86_64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/bac492a11fc95d39d506c850681e4b89bb16880d | ORPH
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/72009c18b9c7cf87e9eba1643bdec1aa78d44dc0 |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/a060a349a2e40d8cd7553b3904e4596df6659a5c |     
   mipsel    |          mupdf-1.23.9          | NOK | http://autobuild.buildroot.net/results/36198007329cc077e53aa56ebcef4b5173958136 |     
  powerpc    |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.net/results/604971c67726d7c01309d3c5e93adff33a094d55 | ORPH
   x86_64    |       nodejs-src-20.15.1       | NOK | http://autobuild.buildroot.net/results/b13761e84cc42033320aea545a6ae00dcfa73742 |     
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/6a7162a4d13fe723af29dcad64f03954e34a73d3 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d4b9b5ac7e33d0af4fe5b5f0e0a1739cd7dfe588 | ORPH
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f957a9a0df78ea3e8ba367d5b134f8db70dbd17f | ORPH
   sh4eb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/11ae1ba4c4518ed602c47443f390d6e7c9201235 |     
    sh4      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/70cb8755310d58fb0b7b2491736fe98c4fe3f2b5 |     
microblazeel |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/bda776489f4d46ba91e18c34f815aec3d6892ed7 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/7364f2770840329a28eb79c36ee6f1afcb670a07 |     
 powerpc64   |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/bcbc1f02b5bb1db53dc5334ce40a8cb8924f4f02 |     
  mips64el   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/65c62d3e16ae5237d3c48de5f512ad9f75d8d47c | ORPH
   nios2     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/75622d6834d1196c9fb3ad25d7663961e72edded | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/1775762e2e1ca3b11986beb568d3d6bc80cc57b4 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/cfb1b4172fb4c1f9664afc9a8a901a193773c1d6 |     
   x86_64    |          perl-5.38.2           | NOK | http://autobuild.buildroot.net/results/ff50c5f7a58aa451e3f8c2c2bb64b40b4606bade |     
   armeb     |           php-8.3.9            | NOK | http://autobuild.buildroot.net/results/ccc158f314e7f009a2fc779a6c96a2b1caab003b |     
    mips     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/c315046167e6c5cf7a81e3d597a7c17963495426 | ORPH
   armeb     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/e133729c18f58a19c18a44cc4ea8f0b04719091b | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/e4f02c09b5252a384cb7c38e84259c29a3c69e6d | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/80863b7259feb9063ab93b2560e87d8393935aaa | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/930115a6d3bfa687dd7c463af9d5a56da9835a4e | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8083ceefd36c3f1ba04d5b2d051a8808fb1a4b47 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/5647bb110496c746ee2a20645732344e6c1e1d23 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/4174f198f4ab18eef369e8ad223a770f76e76f48 | ORPH
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/13136d87976be41597f2028aec5500833f0553e4 |     
microblazeel |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/120d4bdfdac830d14e7509103cc6bc6fb49b1b64 |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/0c2c2f870107006bea0f90971b39e067f44c9a9c |     
    mips     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/34b77ddb4e8447162a250555e054afeadd647323 |     
    i686     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/a4ef5beccd37bd7fa4a62394144490d5053c8e27 |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/3a1170b8435bcb036b79c501094cce58bd4897fe |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/0de76cdd8101a332f45fa18ff8c0a67979594e6f |     
   armeb     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/8a446343b91cc8c44e86a8aeac5d1d9673becd52 |     
   s390x     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/90dd654b2e7e507591bdff380615c8b201055fca |     
    sh4a     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/20322f1608d8486908f35d8d67ef9d8aa4367580 |     
   sh4eb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/e392cd5a5957f6b3b5109aac5ede85fe9254ba88 |     
    or1k     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/34123d1414b2a2f995eaf32c38dac6815d386958 |     
   nios2     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/046182a61c445331aae2bc5494a6a6ed8848ed30 |     
microblazeel |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/d51a1d63fdacd85a3056d3e03d13b8675f790127 |     
  sparc64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/fc5b5bc73982da2e470b34b1a03146a3298576b4 |     
    or1k     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/51599f08e7e9d4873db0234bdb0325cc91544629 |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/9053aff8cccca7ed39239e31f7aebd9640f60c84 |     
   mipsel    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/577f982adbea93e32e9daee911a66109eb4b3448 |     
   x86_64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/123d7360b5096d328090fbcc988239a634356fed |     
    i686     |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/e625730260d2873e3afd9309bc9cdf1bbb68b5a2 |     
   mipsel    |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/8b6129ba25bd1231c40631baf853a3290bb4141e |     
   nios2     | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/c00a752850dee6f898b6b7decdac4420c478bfce |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/1633b21e975527557e5c8cb8a9dcf16a76df9a50 |     
 aarch64_be  |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/ad167c7e5074816271f85b94297a6faf23902fe3 |     
   x86_64    |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/5ab81cfbcd138057a9f27f3eebd579d1531556c9 |     
   x86_64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/328c56a67e146bc107c07299af430548948777d8 |     
   x86_64    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/276b5bff409044aec639b6e7c0cca52e34b50718 |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/c3c56fbd42395d43f05d81d532bb6ceca0a53100 |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/39d8a0dcf47709728b36bbdfc526c7b1001b5353 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/f8a58a45dc299339cbce29571b7d384aed75d98f |     
 aarch64_be  |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/b2ba7660fd49c219dd21de9d1f68e26f6823ece3 | ORPH
   mips64    |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/9d0047755d19f1f27a42a758277de8d7a3366832 | ORPH
   sh4aeb    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/26c4ffe19cb479fb82179e39988c69f5cb2a3c48 |     
  aarch64    |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/51cc0bcdbd4b2a53df025a622ebc641e69518ce2 |     
  riscv64    |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/837584d730ac17c9ad3265218535aa38e7ae86c8 |     
    i686     |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/edcdbfed57f4026d15907d77c0fcbe9c93411173 |     
   sparc     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/887bdd22b310d341b0dbc7853d9ff2ea8c07f45c |     
   nios2     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/bf577f5f9ee8ee516615b1cf9ce02b4cd86c042b | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/c8fcb0878961a0c231ebce43a6de3b056f68475d | ORPH
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/1cfe1b8bad398ea48a99ee9516d31d05bd239ba8 | ORPH
    or1k     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/c521b23d8545a5558bf7341ab522374cda9a6504 |     
   arceb     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/1a0e0d4d25820487ab5108f133ebe6ce996bb831 |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a38f7f6662c736c89a6ea190a0ca5f17f381373d |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/b047ad0fa97743aa0fff136677c0b52e261a4c0f |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/27ee07369545626548bca1c4c43145bee4fd53d7 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/15d3a47ebfcc301e044d26d21fd462bf47a46adb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1dc7e455e4e49151288c5c1f115b68284307e59e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/89737708e2b5b31ba1198df85bcbf9c954c6d537 |     
    i686     |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/4b4e4f112761de88701581a64ab379c5e1dc9d41 |     
   arceb     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/7a9f72e03818de0e303d25b00cbfb8997395c9e0 |     
  aarch64    |         wlroots-0.16.2         | NOK | http://autobuild.buildroot.net/results/7954e3eec199fa53774e2c832726585f8bef8954 |     
  mips64el   |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.net/results/f9daccffae683735d6070c1894f251c04e3fddbb |     
    arm      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/fc9204f409668c5bf0c533d00fbabdeb3a21fae1 | ORPH
    mips     |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/5ba47f9fdbb6289dfcdb516dabd44200c1d3351c |     
   x86_64    |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/ef89b1cfad6e8ab006d8e37efab7554768ec2f41 |     
  sparc64    |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/39c08576ded8c3ea055066fd148fe8c1815dfdaf |     
  sparc64    |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/3039b1d699e2a2d2a1590674e4994d7d325246c6 |     
 aarch64_be  |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/67b893e1fda3967ae217e8e9966dca5e67fa6ceb |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
 host-binutils-bare-metal-2.42 | 1 
                 host-tar-1.34 | 1 
                sysrepo-2.2.36 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/df44c127b4f4c0240f51598dec30c157a644c892 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/38e66905434ffeee8afd99fe74c83bcb49394f64 | ORPH
powerpc64le  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/640bfe79f69d525434831b152ee83f73158bf6ca |     
microblazeel |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/8e2386d6ec484dfa3ce714e7e572e7bc4a4b6088 | ORPH
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.net/results/07a5cec5c600599c170ecc7e5f9fe9760b2ca0aa |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

libsvgtiny-ea9d99fc8b231c22... | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/5493621250f9fa74d1ead1b2affe5df479f406e6 | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/bfe8f40c7665fd8cfa3e2b3a8f824992224f1d28 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
