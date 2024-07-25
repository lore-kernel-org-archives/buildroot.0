Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C66EC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 05:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73DED404C5;
	Thu, 25 Jul 2024 05:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9RrucjxRba4; Thu, 25 Jul 2024 05:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4314073B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B4314073B;
	Thu, 25 Jul 2024 05:17:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C55691BF484
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 05:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8FD54073B
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 05:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcX_2z-urzqg for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 05:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2024E404C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2024E404C5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2024E404C5
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 05:17:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38CD51C0006
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 05:17:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 05:17:25 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1721884645; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8fXZ6duo5G3itGI82URn59TbbNUM7/ffZaCe/2pO5H4=;
 b=R0/PEwuYf1i7b4EJwydkkbwH+eGQYOtWo5Km53h5ldWJMHyAi04WD00BR731lU5nb/moWM
 AtAuJupACWHVnhtTbEyPUFbLq+nryDDaGaBK302WsGBSkEvkuvr98vfLl6wdZDfB9MnRvZ
 0gIkTk6W0QUCKVC89DoTqIamfgoUxtHJHcBCw6EUUaQlj/ZrPGni4uaPBrTP81RMpnsDUy
 uEKqK6x3csl61GELw9iNh1PDDaIBzXzeRi6R7jtQRuaLi+EJRZKicv94tM5BkNv9sI5U5G
 G8bPWTMPuijgzh0K7oFwgM4rPJw8YvBbufIFrDYMN6TayCO1fDMmVZ4FoWSOLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R0/PEwuY
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-24
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
Message-ID: <20240725051725.e1i7yRoakn2p82Jb6us4gwskKqsWyYlaaTgvbrGg4hU@z>

Hello,

Autobuild statistics for 2024-07-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  3  |  0  |  8  |
  2024.05.x  |  4  |  8  |  0  | 12  |
    master   | 99  | 279 |  1  | 379 |

Classification of failures by reason for master
-----------------------------------------------

           host-systemd-254.13 | 18
                     avahi-0.8 | 17
                host-odb-2.4.0 | 16
                elfutils-0.189 | 8 
               procps-ng-4.0.4 | 8 
                gnu-efi-3.0.18 | 7 
  gobject-introspection-1.76.1 | 7 
                   linux-6.9.8 | 7 
                  ffmpeg-6.1.1 | 6 
                    norm-1.5.8 | 6 
glibc-2.39-74-g198632a05f6c... | 5 
host-heimdal-f4faaeaba371ff... | 5 
                  ntp-4.2.8p18 | 5 
     wireless-regdb-2024.07.04 | 5 
                  cairo-1.18.0 | 4 
            gdk-pixbuf-2.42.10 | 4 
         host-libxcrypt-4.4.36 | 4 
host-vboot-utils-bbdd62f9b0... | 4 
                libressl-3.8.4 | 4 
                   linux-tools | 4 
      python-autocommand-2.2.2 | 4 
         python-remi-2022.7.27 | 4 
                       unknown | 4 
aer-inject-9bd5e2c7886fca72... | 3 
                  bcusdk-0.0.5 | 3 
              cache-calibrator | 3 
                 dc3dd-7.2.641 | 3 
                espflash-3.1.0 | 3 
              fluent-bit-3.1.3 | 3 
     host-python-maturin-1.7.0 | 3 
 host-softether-4.30-9700-beta | 3 
                       kmod-31 | 3 
             libargtable2-2.13 | 3 
                  libffi-3.4.6 | 3 
               libglib2-2.76.1 | 3 
           python-daemon-3.0.1 | 3 
                 uclibc-1.0.49 | 3 
                   foot-1.16.2 | 2 
                gerbera-1.12.1 | 2 
host-go-bootstrap-stage3-1.... | 2 
     host-moby-buildkit-0.11.6 | 2 
              host-runc-1.1.12 | 2 
               ipmitool-1_8_19 | 2 
               mariadb-10.11.6 | 2 
    python-cryptography-39.0.2 | 2 
                s6-dns-2.3.7.2 | 2 
                   trinity-1.9 | 2 
                      xz-5.6.2 | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.61 | 1 
                    bat-0.24.0 | 1 
                  bitcoin-26.2 | 1 
              bluez-alsa-4.1.1 | 1 
             can-utils-2023.03 | 1 
               cifs-utils-6.15 | 1 
          cloudflared-2024.6.1 | 1 
            compiler-rt-15.0.3 | 1 
             containerd-1.7.20 | 1 
                     crun-1.15 | 1 
                    dust-0.9.0 | 1 
                  fbdump-0.4.2 | 1 
                    fcft-3.1.6 | 1 
                flannel-0.25.5 | 1 
            gettext-gnu-0.22.4 | 1 
                 gnuplot-6.0.1 | 1 
         gobject-introspection | 1 
google-breakpad-f49c2f1a202... | 1 
               graphene-1.10.8 | 1 
             gstreamer1-1.22.9 | 1 
            host-binutils-2.42 | 1 
        host-btrfs-progs-6.9.2 | 1 
             host-delve-1.22.1 | 1 
         host-gcc-final-14.1.0 | 1 
            host-skopeo-1.13.3 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  ledmon-1.0.0 | 1 
                  libdex-0.6.1 | 1 
                libdrm-2.4.122 | 1 
                  libnfs-5.0.3 | 1 
                  libsepol-3.6 | 1 
                 libv4l-1.24.1 | 1 
                  libva-2.22.0 | 1 
               lighttpd-1.4.76 | 1 
     linux-5.10.162-cip24-rt10 | 1 
         lttng-modules-2.13.10 | 1 
               lynx-2.8.9rel.1 | 1 
                memtest86-6.20 | 1 
                  mender-3.4.0 | 1 
                    mpv-0.35.1 | 1 
                  octave-9.2.0 | 1 
               openblas-0.3.27 | 1 
                   p7zip-17.05 | 1 
             parsec-tool-0.7.0 | 1 
                picotool-1.1.2 | 1 
           python-numpy-1.25.0 | 1 
  python-pypika-tortoise-0.1.6 | 1 
                python3-3.12.4 | 1 
                    rtty-8.1.0 | 1 
               sysrepo-2.2.150 | 1 
               tcf-agent-1.8.0 | 1 
               tipidee-0.0.5.0 | 1 
                tpm2-tss-3.2.2 | 1 
uclibc-ng-test-132c6134d691... | 1 
ulog-0389d243352255f6182326... | 1 
           v4l2loopback-0.12.7 | 1 
                    vlc-3.0.21 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/b18b36968d11200a0d9d98a08a36e596f72c9e1e | ORPH
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a2cb482518296ea667ee7945216775f94edc7853 | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e604dacd6d31024c556181274620b88338d7c952 | ORPH
 aarch64_be  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/cb200ca9e38261d88e99fbbe299f59205640cbed |     
   sh4aeb    |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/20950ed6c16ba7d8c9fd78d1b3abd7aafe04b6d6 |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9d7126c6757fcadb8e4e0c925a2f676c7c2dfc90 | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d5da3bd263adf619d60b82c8d2f334313a39a569 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/81b508666f7549582331ebea79c1978f9227e1cf | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/97bbc34f1bfc9ba9e59d27b315b9c6b1f992f021 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/752dd1405f3331d22d0ab9acd1357268b1dd251b | ORPH
    i686     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/abf6d0a64f9147852edf2a1827bd5168443f9b41 | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7c2005fc53bb5ca09b6380f79c4c3aeb9922ea9d | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c72827fbef98f7536ceea0d09749ead00c6e9234 | ORPH
   mips64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fde65596a6bfbe55262ba24deaca153f1326340a | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c285a19a2eddbe52eb5788bd2fdad3f8c3443885 | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/61a7c57e0787c7617fdc08abe06f88802018900e | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e25b8da2c25b8ef46c03da96310766e03741fca8 | ORPH
    i686     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/19d6cdda7796e8d0513211cc827e610e037084b0 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b6af8b59db6330c2ca84575eb2cd5d8bc4ffdd4e | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4b6b10ee7b19e9722987165f4fca96b1abe626ad | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a36332631c14024e5e96b8dc219f1cca4a26d9fa | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/12fd77cce8ad1227f16658f25d7ae07fc128807e | ORPH
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/b70d377a7309441ca53c8a79dc4460f6015e9458 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/ea4374b7c042fd38810120813c9e9c8ddd62bb7e |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5fdf6356e3f6ccc7b7b1f491978a646d51214666 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/49c769d076bce2d71bfe1a8b2ead51913c69aa51 |     
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.net/results/4c020e86d3261120e4d74715f965e0379e0fe267 |     
   armeb     |        bluez-alsa-4.1.1        | NOK | http://autobuild.buildroot.net/results/a0f6a3d56de39fcd5af4a77d55d664764a333433 | ORPH
   sh4aeb    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/a2b989b054ad0a608299fb253aef38c4a561190a |     
    or1k     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/d1ff79a3234659175a820bd9c30ffe8d07020fb8 |     
    m68k     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/fc7ce6ecec23f841a8fb7722c574a6729439e8ed |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/27a96995493f047bdf262f14e1f43d29bbb86ab7 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0a6db9824db879bfe113c102b9f0c77c8cfdfd0b |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b8821b89de384a809b899e4362d3d00e353eab18 |     
   sh4aeb    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a2a0d15bc15a48f000a74c62b8400de9ef4bdb28 |     
   arceb     |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/1e2a533a936624249cd79d34983c889c3c4c2e3b |     
  aarch64    |        cifs-utils-6.15         | NOK | http://autobuild.buildroot.net/results/5d6045e891d18a3ff69c8f3d2b35856864ba5511 |     
powerpc64le  |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.net/results/28c343a19391fe93190524bf703a7cee9d037285 |     
   armeb     |       compiler-rt-15.0.3       | NOK | http://autobuild.buildroot.net/results/8052629153836743a162b9154f4351444f304f55 |     
   x86_64    |       containerd-1.7.20        | NOK | http://autobuild.buildroot.net/results/de3b257f4593e8acc72190a8f97d911d0656529f |     
    arc      |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/4e50eeac2020910e43228f8b4e1772e2df144c07 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6f73ed96b953f1dfb0016f15e4ddc166c606195c | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f8e865cb0e2286d5cbe5289d9cce3d8d85dc8499 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/aa13a250271f53ae0652e6c7d83dfdf4ba99cdbc | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/a1a959abd356a9bbb6476316eb446f4c09afc81c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d68f7855831599a578fdcd67dc09e249bb8906a3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c72b5da01d07a506ff59771e4035258847eb92c0 | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d74f7535d7c09a6551da259521cb77bca010ebe5 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/555d478cddb4c63190f07392948c34f6889e3226 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fb961c6b860a6e81ea8ecdf73748b43df4d18838 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ffc8315dafaf24037984fe8969a65c9455f2d147 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/80e4166ae70e997178b24a232893330aee6c01d3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/529591cf605da92786d7d862b6aa6ff207e2fe7a | ORPH
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/b2e4bfcd9de9f8a2415e3865eb75bbfed5ae8d49 |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/9440bdf533398ef35616d5618bbcb055f98afc9f |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/fe197f234994cc608da2557a6a7faa7bd7c530ff |     
   mipsel    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/77d9647aed0c756abee74128d5a5ac90c61cb81a | ORPH
   s390x     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/d9754c386cda1d2d8633670ed74a2963360cab12 |     
    i686     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e665577347857b548f34f9b4fc86f2c573f27282 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7d9ad14c911ebbedf16334163f8763626a4c16dd |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e8613c7c14a54530b42903b661975ca89299b1f5 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/48e444bd71ffabf04c4ffdf0a6d01a23dc2ef580 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c2105d371c3d80954a7ccb1565b625da1419783f |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3b24412b7019bd57ad72ed7c8325a42daeebb155 |     
    arm      |         flannel-0.25.5         | NOK | http://autobuild.buildroot.net/results/a49c3cd879f6fca6a561f4378970695862c9750e |     
   xtensa    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/75c6a14fa00b588ade37c5daf60a12678ffcafbd |     
   armeb     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/809894c7fbdc148ba9f1f9bd79c5fc13f7bcf2bc |     
microblazeel |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/2ee0db50ee2b5da109fae77068ec511c454844b6 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/32d7bb86f5394dd80b76bbda1a877c51916804ff |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/0c53db9d60dd998de27834fe6cde3ab7b8bb5e07 |     
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/e25fbcd9bfc63a69706805859dd4d5b5e65d59e4 | ORPH
    m68k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/ac9c0fdb6ebadb14d7e5ea30e57f584b97a0d555 | ORPH
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/0b21cb005d4afc9c7548d31e7101bd533606a8aa | ORPH
    mips     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/f647a4822599555196b4c339d7d48c5ad14a4bbf | ORPH
powerpc64le  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/6630bbe9263a32004861cffe0c3df400d7a1d974 |     
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/3cd38623a3f0cdf87806f123f7caa88cab1d0306 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.net/results/fab44a3e92959a786aa847a05a723367fd3d36a8 | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/79d40d8dd9a79f5478ee807ebcd0fbfae59f280f |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/84ff52871823bd21cf6959292a4b1feaba97d5ad |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/332c75ed1572663fb2ba70953bba7e77611bb562 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/efa5ae76fdda1f107e2d5c1325a9c0ebdd528c46 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/793d0f7ce6f5b56b1a6db6f981d2ba0a44255c6a |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/7e702596d11c4d288605c08bbab24cc7d9625e3b |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/241ca53bff2e5153f9c40cbc10f1abddba130775 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/fc88efccda9f386246e3074936ec5a3c097c4e5a |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/01742f18abb589912b69e948556cf846b6beb1b9 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ccb0ab3f5e3ecf5f1df6effbf23ee062175fd9ec |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/48557edd630d7e5709ce26b718ee14204dc79f46 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/3c0cbca58e541b5003b016909c66d5784a49589a |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/3cae14b722da2299f5b41b92067054d968be9ab0 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0a74b00436e4e2f06103d1be192661be198ca1e6 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ff6e9665dd027ebedc44329f29284e0120799004 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1920bff523c7904287c853e5a8f875dd22578d72 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d6891ce19c4e1df814c18b32f4ed1e5b757348f0 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c8f061967f457b499da1814b1a65d0ddac6e1d38 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/56125143284d9fab11c49145f2194b0c1d7b0b7f | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/39f4d2d7ac9fea77f483b994bb6956a3b468e239 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/afb37a7cfc12980f1e0433d052e7bc2182895028 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/da801d26a1220fa644375d7e95ff887fe3a522d1 |     
 aarch64_be  |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/c2b94975b46dd8cc1e423698a19989e2d9366374 |     
   armeb     |       gstreamer1-1.22.9        | NOK | http://autobuild.buildroot.net/results/6e56c8d054efac260b96636961eac3a9adbd905e | ORPH
  aarch64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/d63f9b25b817cf482e4632cc5305c21a034a5163 |     
  powerpc    |     host-btrfs-progs-6.9.2     | NOK | http://autobuild.buildroot.net/results/83d9cd7a88c8e5dcf4654786e98fbb507aab9bc5 | ORPH
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/dafec7908d907e0e7e9222daf3942344c4bb6604 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/f1c5ae4e67d0ed36cd20d490427fc645b4844cf6 |     
powerpc64le  | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/a9083190b7505561e39e14970f0bddb25e5e6746 |     
 microblaze  | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/b70e34c128e2b154a80887754b32dfe48ca5c26a |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/db1e817464d62dac6f6a47c70822064670165e30 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6ffaed86e9fc268760748a1eb632dd9ff9ab6ee2 | ORPH
   sh4eb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5468c0238ac020e4eaacc1aeea040c0247f91733 | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0626a1c2a8f8b36bf78d5886a514b56485ad7ef6 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/84d550dfeba48683015e9467489e3a046c2298c1 | ORPH
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/2de4c631a58192fde41221036739aa0558de5215 |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b8638506125a398a4667c2aeb7c283abca52987b |     
microblazeel |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/789842bd1655761f6691316eabe5dbde5252a460 |     
    i586     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/27451f93470b4f13943007d195813c56ea8c098e |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/2b5b86eb0e6e897e55afa824d603f0696922449a |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/670782fe21a3cecf6272d508cc93d2f94481f6b8 |     
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f76017abbbd73b7821f6dcbaf95f6c2971217c97 | ORPH
   sh4aeb    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f6ad8d231061d164637ea7703321ba162efcba3f | ORPH
   sh4eb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6b87c21daca88e37143ea3a35167b7e6463009d2 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e00e68fbdf10be9fa7f28cd8baaad6c7c8e61109 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f70d2bb7ae282ad75093c83829213409895fdd4d | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/aa884a7df334d364d315807eed40cb65e9f04556 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8d38b8a3d714be0edfd48d3d08376e2d5ee4e358 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1ddb2451ef05003518f7a13ede19ed2a2eaa8118 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b130314dbcd2b36d2f33b85a510fdf442eafa06d | ORPH
   sh4eb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/11c1f8a7f2179b39f50cb5ef883a14575d0cb2ba | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/732d2b2acff301883d54b97e22f985fd926e18e8 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ff7d13a9df424c87d25fc2d65405b7bb2b8503d5 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1bf7acd9e430957fb8839cafc7dc400bc855cdad | ORPH
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c1736b3692a3be635508affd21a701ea109df7ef | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b46551a13d8c6ac11e28e618c49deff42225c3b3 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b4d5e03318328eb192f30c0134d5ce1f00b64a58 | ORPH
   x86_64    |   host-python-maturin-1.7.0    | NOK | http://autobuild.buildroot.net/results/3c7e87489949ed8ab9744b3963e98da3e990be01 |     
 powerpc64   |   host-python-maturin-1.7.0    | NOK | http://autobuild.buildroot.net/results/c2fd68a7d58cd637b8a2389b47f590b7d07c2a3b |     
  powerpc    |   host-python-maturin-1.7.0    | NOK | http://autobuild.buildroot.net/results/e4a955803c087217005443597550ecb0d3b7015f |     
   x86_64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/d8ab78b359de30d772b1b64215df5b7911682331 |     
   mips64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/30b81b6f84613296b9e1f162e5ddd7f25b89ba23 |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/e3aa083900bfdb159530b7e51ae645b26c47d3a7 |     
   sh4aeb    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/e9a53bbaef9012f6aa0b59c6ef6a31c62ee8eacd | ORPH
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/03b27177ef21339f27a62f4658c856ac18bdb3b0 | ORPH
   sh4aeb    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/4f984c14785b9714719f313688b76cea13c78d9e | ORPH
 microblaze  |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/5e0db17dc3660d7bf65269f6591f72a4ba4f0036 |     
    i686     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/0bf415586468a009b412d72328a8ddc1bfb4d7c1 |     
  sparc64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/5cdb123689bb0064a8b34d0383321b93c42da9d4 |     
  sparc64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/a84d84ea3110244783be2dc19ddc9177b9f3d459 |     
   nios2     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/173ffc04137cc04c2c84aab757a0848519c3fcc3 |     
   x86_64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/05dc53823082c09806d0eddda3e5da63d98a710a |     
  sparc64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/86730f3644f1f4bc2f13fe7822236cdb5e2e5e70 |     
   nios2     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/69f0a43d0de06f7de78863375913197fd39ea820 |     
    or1k     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/e6951fa98e2d61cb5f0a807b111fe1c3185a0a8f |     
 aarch64_be  |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/fd83b7536d8b3f3ce24dac47fc34ee05dae5202d |     
    or1k     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/ede095220265657ae820e02ee6f930316f1c1661 |     
    arm      |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/dcdffbd8962aae9ca6625fedd1ee5b783ecc371c |     
   nios2     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/0c5f82cb3f55c4a96136d7140697e3c0c00a053e |     
 aarch64_be  |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/59ae705a8891204f78d1946da02d52a6cf05c053 |     
   x86_64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/427d10355d3651ac69fa690a7a8a389a6ea5d429 |     
    sh4a     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/bfac49584cfc18dd40f60867f48096b441782345 |     
   armeb     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/139611b5de4a8301d8a7119b8841ccc657ad10e7 |     
    sh4a     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/608255c67d03593e31e7f80d87d9b2a316034324 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/dcfe1068cc4f94a4fa0b70befbea3d060523b01b |     
   arceb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/28c201f0ca8912c4a2ea95b36500201ea20a9d4a |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d69a0b88041ff30729f254efc3ee3da49a998f30 |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bba197341bc5570537d1a825d5600409544cf152 |     
   arceb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/87c9bf9b3f83b867e1e82d5e71a0cbcf19dba0a8 |     
 aarch64_be  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/15b6c25cf7e5b54a63e7dbc1bdea25a026a31e18 |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/76559a30b6dba0122290d0ea81f6dbe253023993 |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/ce3d414e41b91c2a47b2618c5677584cade4ed63 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/aa39b5c9fb22cf698969e68a3dd27b98088c3d75 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/0d2ba775209b5d2404eff2318a538e7d0574c260 | ORPH
   mipsel    |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/629e98d61949b364f1a73421283aa04abaede7c6 |     
  mips64el   |       libargtable2-2.13        | NOK | http://autobuild.buildroot.net/results/2ce843a6ac8035af8924647db0d73b752cea89e5 | ORPH
    arm      |       libargtable2-2.13        | NOK | http://autobuild.buildroot.net/results/e078b0dd0dedf54f7b1076400aaf88ea3d710203 | ORPH
 aarch64_be  |       libargtable2-2.13        | NOK | http://autobuild.buildroot.net/results/f29a7c78342b61274011544f60d0ea046206f936 | ORPH
    mips     |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/f527cab99141ecbbbd13c12177a2cc8903bed3a4 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.net/results/c0f0d6139b84abba52c881c14089db4fe3467079 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7087f5f9871b000475f081cc37c9e352cb4fcc91 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7d9856dde4c0179b0c706bdd86e3d67179c6f095 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7d6c4b0f55c6a3c9e79b7b21caca067a4a97bbf4 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2d51c97a8f35fd75feb21487d644337c0f940db1 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6186177aac35a783f357edc935f286cb4842c45f |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d8a98fd9751c41189e91d2e3b58b0c5553c109a9 |     
microblazeel |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/732e8b613e7404e89dfbcbe78b67280bb11e9b8f | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2533f8f642f435b40ce687b6df482c51a3fa0250 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8730f01abb55991dc89fddb686d8dac9cbdc154f | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/56cc104cb18133c82ef8a067c52df2d8eb1487c6 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/da15f2bba58afb1f0bc7b4794f7aa15882649d11 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/e8ee2e22a210d342f7a2ee8c2b479b4cbeb75c19 |     
    i686     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/cf04971355d4b530904628d757c4975f4bd320cf |     
    arm      |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/e50525333e30f0ec067c149157b8ede8f2a997cb |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/a52efc10e33276b0304f1db5af611099ce0b007a | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/964807f780934245138d939f885b41eb354ec343 | ORPH
    mips     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/d08d2b20c2eac28dcaf75e208911caa7b23c8b2f | ORPH
powerpc64le  |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/68807de25c3a4395b13ea6eb3c3e1869262203e4 | ORPH
   mips64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/15bd6e1e3d0835fd345bcc5b9cf4234a4bc297a6 | ORPH
  powerpc    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/cc0812140e757135108bf1e85154041552206f27 | ORPH
   armeb     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/e3cbab38e415d67b4d58c84827f2c4806b95f452 | ORPH
   mipsel    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/53af2c36616eb7bec976380180b0c6a42d1915bf | ORPH
   armeb     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/61e1102adbf83233e787a76bb8d33be127d7ecf3 | ORPH
powerpc64le  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d4fa54846ac93d085062f4ca13e18f1881740dad | ORPH
   armeb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/8927fd255afdfbd1824d0875b574cc34e912ea3c | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/957edda65bab89328968047e56d306d591a0a5dc | ORPH
  sparc64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ee130c690a616fb9ef917889afe85e34acea3d6a | ORPH
  aarch64    |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/c577034a508083e993865b870797870fabdd16e5 |     
   sparc     |        lynx-2.8.9rel.1         | NOK | http://autobuild.buildroot.net/results/fe6f38b217780a6c0571d6af232021e77294050e |     
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/6c61be106302ea96cee6c1eb345bef567a0a8e38 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/2d8d0ffea76e60e9c903a5b26e0dcb208cc2ea79 | ORPH
    i586     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/e7375e6d1f7eca6e1493a66a8071e58194786d70 |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/6e011d9a6573e7ea99b9a104f067745a7ac84fdd |     
    m68k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/b7dce31ce75443d5b4a9eaa628188ae4bb317771 |     
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/73d62d48f86109c3bf3f99da5a605b5076c1cd8c | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/708a3d39011d699ddee2530035ef0518bcd07f94 | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/4b45498f2086a009d330894e8e2ac4c2ecae2fa6 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f7bddfcb841c163c60778a0817cf30033e5fada1 | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3399d89fda287c42509a37961758b8b172c37374 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3c2ede9b4bdb43ddc9198559c1b0ffb29e3cb68a | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/3ec8f94254fcb48fc561150fc6e4001ed11196f8 |     
   mips64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/50b10f4695615eaeaf231d6652d8a4e5509b9522 |     
  mips64el   |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/a983bcef3a4c0ddc3195f7fcf2301c6094dba43c |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/eeb5434527d0f1c25849a769a7fc30a082127e68 |     
   mipsel    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/fba51638ce0546574738904bb4cb6346a866bb08 |     
powerpc64le  |          octave-9.2.0          | NOK | http://autobuild.buildroot.net/results/95620b71730501b197aa927a1f8ff8bfaa3ab37d |     
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/ba6b02003bb9abbdcb176d51fdca1fb7b496a6c9 |     
 aarch64_be  |          p7zip-17.05           | NOK | http://autobuild.buildroot.net/results/42dee45045d5169fcd4940b1f9375665446638cb |     
   s390x     |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/4e7a6c14b76e1538bf143a57c7ae50a392f590fe |     
   sparc     |         picotool-1.1.2         | NOK | http://autobuild.buildroot.net/results/20d2fc02b7ca4c19b22b5853dccd8e55a052db10 |     
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/c0b19d88beab6fc434a33d98cefa9e53d0670a09 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/cd4c0e0ff1fd7d95b9e1c901ce0be2fc17b1b6ec | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/d9a99bfce320e4fdd8335355fed6f9521796354d | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/1d6c468dd0360f1b117abb6ae6fe619a7f0265d5 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/0b20fc0742e2c6039e0054b00b8d86d0e9671ab2 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/621c429b8115d502ac3ecb46465129c113ba3a94 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/952d31fda0396ec5ad428d1470e523803e0d8323 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/b7573be2e78f3d224f48cb3f52087e3d227d58e3 | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/a100c6c567051044e2b8b3a055254013fe9167ec |     
    sh4a     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/db13dfa2b41cee43d806e72084536ff73ac3215b |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/24ca261ff8457ed6b7e89512baf8306166ae1efd |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/7a12f4afa52ae738dba2626049073f08c8124e3d |     
    mips     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/83ec37f633cf7d349f1304b30c7886ba77b0ccf4 |     
   xtensa    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/7ecb9fe02159160eca2e1fae098f4277646b227d |     
   nios2     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/518637d824554ecbcd42bb94f7a08e97448affd2 |     
   x86_64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/fa3b5ebd2ea6a0cc0a9d7ee70d2c5a15329d5695 |     
 powerpc64   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/ac9a6810a154591f0b99f4c6f9b4342050fef7c2 |     
    arm      |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/d2c07cbe84e8f826269cb24ef1fc1458b9fa3adb |     
powerpc64le  |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/a026b04706100467d05cdd06f2ebf73378462afa |     
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/8c9209d662ad03d149f8b3d6c32ffd97293e5da0 |     
   s390x     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/74305b33a54b634b208ca89b3cc7661f3e8b605f |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/c98f7738610bf19cc5387deca4f6e4871c14ad5e |     
    mips     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4d918e72151f7e0881986b987e1ad8937c08a44f |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/8d7d7819c33fc587a08b869ffcf105a5f98c299b |     
 aarch64_be  |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/bcf85685aaefc6246363bf9267165e6c88cf5bba |     
  powerpc    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/1af9dc63902eb69136d64ab6fddebab227ca643d |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/9b2d7af4e2b39bcac02a66d63e2799b0688ed4cc |     
  riscv32    |        sysrepo-2.2.150         | NOK | http://autobuild.buildroot.net/results/ef73823ec8c1564f388492c9d26ca0d7e7e56aca |     
 microblaze  |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/01594f9c15ddc10e141840b368d7c653a37e6303 |     
    mips     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/3e3e9bb29a7297723e8b9ff7341d44e22282eb44 |     
  sparc64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/feb56461c6fd566f6184e339dfb066458725c048 | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/10ffd85d181d72c01aa3693694362bb72402a8f4 | ORPH
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/38bcec527fe6f92151503b77128bb35e156cfdeb | ORPH
    arc      |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/917561529bd0484898301bf99b8eed58eb0e54d1 |     
   arceb     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/19ba36f2f6f6be2a7b493019c6a8a2c74714f0b2 |     
   arceb     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/7aea4326f5897476308c5b5aad634f39215fa38d |     
  mips64el   | uclibc-ng-test-132c6134d691... | NOK | http://autobuild.buildroot.net/results/af7a1d00930485f87f77762b34cae01873a8cd41 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6c0d9ea4392ebc7236e4cee038902963344fb4f5 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/866d3ee2d9e71962d72ae399d94dbc604b01cc37 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/4b87a325bb501aa81172756111bbb0a91ee0fd1f |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/057e26c33bbfdfe91d7dacbb9c38194ca8731485 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/5dac3973c250761ac500414e7bf9a6477119defe |     
  riscv64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/7c57965512b7be40befc47684436ace40a1c6a68 |     
    arm      |           vlc-3.0.21           | NOK | http://autobuild.buildroot.net/results/dc6ca4a551bf04bf560c41436bd7ff92381284b7 |     
    or1k     |   wireless-regdb-2024.07.04    | NOK | http://autobuild.buildroot.net/results/9ace181735305cf8e29e0bbace1aec3796c32978 |     
 powerpc64   |   wireless-regdb-2024.07.04    | NOK | http://autobuild.buildroot.net/results/bbdc25c616e7990f4d99e5c473a58aba56e9a6a7 |     
   nios2     |   wireless-regdb-2024.07.04    | NOK | http://autobuild.buildroot.net/results/7afa19a83814279be72f8dc7fa84b16d399bfa70 |     
 powerpc64   |   wireless-regdb-2024.07.04    | NOK | http://autobuild.buildroot.net/results/1004a2321f98756076f3e6706c79e3b5401e52a3 |     
  aarch64    |   wireless-regdb-2024.07.04    | NOK | http://autobuild.buildroot.net/results/e87eefbd79b3b6d3276cb715bdbf8ae69c082944 |     
    arm      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/4a6290bfb257e1c488e4847de363fa0badebaf3a | ORPH
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/cb8255453d63cb51e3acff3b7073e3ec3abcccf4 | ORPH
    or1k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/6d876f71b605614947fb9e11997f7267777ddcd1 |     
  powerpc    |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/de6821e0d32d450d9f373c72800c4360879dc9a7 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                       unknown | 2 
                libressl-3.8.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1af2a6d83252f33c250cc04204cee5d9bd9f7d77 | ORPH
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e62c06ba071dcc76fdbeabe3beca4794382fd741 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/42777e347d1cf14aeb7bcea180ab57f466c3f5be |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 coreutils-9.3 | 1 
                     crun-1.12 | 1 
                fail2ban-1.0.2 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
               mariadb-10.11.6 | 1 
                  octave-9.1.0 | 1 
         python-remi-2022.7.27 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f7f526c6f13369947ec0119f96877a104221cc44 | ORPH
   xtensa    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/9a2b65430f2f5f869def63d8733abdaafc7fcb4c |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/77a23d48d16851e74a9ea4dfe2b9dc6f73712785 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9efe527647989ce5a9d866c8314987b1651c5bb0 |     
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fb4139408dc02f03231037ca8cdfcf456a76503f | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/ee1c17013db9e428bacd488ed518446c6ac199e2 | ORPH
powerpc64le  |          octave-9.1.0          | NOK | http://autobuild.buildroot.net/results/c22ff2e427176ea2ecfe40c6a79ca4ce05443fb9 |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/46f07be47ab1b35a6c63979b55cf40c1f12bd7c0 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
