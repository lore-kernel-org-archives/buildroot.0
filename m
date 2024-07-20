Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB9DC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 04:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE85830CD;
	Sat, 20 Jul 2024 04:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfRIoLPSabZU; Sat, 20 Jul 2024 04:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAF0382D14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAF0382D14;
	Sat, 20 Jul 2024 04:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDD3B1BF288
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 04:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0FD34099B
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 04:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sx2Imu3-z6Hf for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 04:44:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A169840997
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A169840997
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A169840997
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 04:44:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 881F26000E
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 04:44:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 04:44:05 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1721450645; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LISvZQX2o/gxz8P0PnNY/LiwqSLq+uTzHeuZ3K7Crqg=;
 b=kR5zdzPS9Jfr/82wcL8ZFs9sZDkd+oLbzUuuoi6VkDiYHa0lGbLlzrtrdSWzUMOlz5I5sr
 7Jk88OphSuWy6uHabyKLaVVY8wxQBfs7u4g9mta8oNIzJFfk7uRmb3weWaQ7ts8a2rKQZH
 vilBdH7a+WqbTNYCJVmkDb08Vhf+P2BJTkiBHiVT4ON6yHEBl6Ykff3Q3M6XRpSBYnTgE9
 ClaOuTEeplc4j+VRQ+Cw6GlIeBb+IaVnNW0oFayWw++3VrIJmGxifBRxVQW8QRfiSMWFng
 nidf0Hmj43MCGCMFz68axpq/1feByjegXaztLanxRLSUE2f1v8FchBplJdLXhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kR5zdzPS
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-19
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
Message-ID: <20240720044405.BKYKDkqucGPElMhvWh-9Y1o2W2SC0buDKQLSnSk6Jns@z>

Hello,

Autobuild statistics for 2024-07-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  3  |  0  |  9  |
  2024.05.x  |  4  | 10  |  1  | 15  |
    master   | 130 | 377 |  2  | 509 |

Classification of failures by reason for master
-----------------------------------------------

       host-gcc-initial-13.3.0 | 18
                    mpir-3.0.0 | 18
ibm-sw-tpm2-5452af422edeff7... | 16
                     avahi-0.8 | 15
                host-odb-2.4.0 | 15
                   httping-2.5 | 13
  gobject-introspection-1.76.1 | 11
edid-decode-6f117a8f8c0e76e... | 8 
                flashrom-1.3.0 | 8 
glibc-2.39-74-g198632a05f6c... | 8 
            host-binutils-2.42 | 8 
       host-gcc-initial-12.4.0 | 8 
                  bcusdk-0.0.5 | 7 
       host-gcc-initial-14.1.0 | 7 
               tipidee-0.0.5.0 | 7 
                  ffmpeg-6.1.1 | 6 
         host-libxcrypt-4.4.36 | 6 
 host-softether-4.30-9700-beta | 6 
                   linux-6.9.8 | 6 
                elfutils-0.189 | 5 
                espflash-3.1.0 | 5 
                gerbera-1.12.1 | 5 
              cache-calibrator | 4 
                  libffi-3.4.6 | 4 
                  ntp-4.2.8p18 | 4 
                s6-dns-2.3.7.2 | 4 
aer-inject-9bd5e2c7886fca72... | 3 
     bandwidthd-2.0.1-auto-r11 | 3 
                 coreutils-9.3 | 3 
                 dc3dd-7.2.641 | 3 
                   foot-1.16.2 | 3 
           ghostscript-10.03.1 | 3 
                 gnuplot-6.0.1 | 3 
             gnuradio-3.10.7.0 | 3 
 host-binutils-bare-metal-2.42 | 3 
             host-delve-1.22.1 | 3 
host-go-bootstrap-stage1-1.... | 3 
              host-rust-1.79.0 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
                 libp11-0.4.12 | 3 
                libressl-3.8.4 | 3 
                    norm-1.5.8 | 3 
  python-pypika-tortoise-0.1.6 | 3 
             rabbitmq-c-0.13.0 | 3 
                unbound-1.19.1 | 3 
                 apache-2.4.61 | 2 
                     apr-1.7.2 | 2 
                  cairo-1.18.0 | 2 
      docker-cli-buildx-0.11.2 | 2 
         gobject-introspection | 2 
            host-skopeo-1.13.3 | 2 
               ipmitool-1_8_19 | 2 
                libesmtp-1.1.0 | 2 
                libglvnd-1.4.0 | 2 
                  libsepol-3.6 | 2 
        ltp-testsuite-20240524 | 2 
           mediastreamer-4.4.8 | 2 
                  mender-3.4.0 | 2 
                 openssh-9.8p1 | 2 
                tpm2-tss-3.2.2 | 2 
                  zabbix-6.2.7 | 2 
android-tools-4.2.2+git2013... | 1 
                apr-util-1.6.3 | 1 
                 augeas-1.12.0 | 1 
                    bat-0.24.0 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.0.12 | 1 
brcm-patchram-plus-95b7b691... | 1 
             can-utils-2023.03 | 1 
             dahdi-linux-3.3.0 | 1 
                 erlang-26.0.2 | 1 
               freeipmi-1.6.14 | 1 
       freeradius-server-3.2.3 | 1 
                      gdb-14.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
          gitlab-runner-15.5.0 | 1 
                gnu-efi-3.0.18 | 1 
               gocryptfs-2.3.2 | 1 
             gstreamer1-1.22.9 | 1 
                 highway-1.2.0 | 1 
        host-btrfs-progs-6.9.2 | 1 
         host-gcc-final-14.1.0 | 1 
                 host-gdb-15.1 | 1 
           host-gengetopt-2.23 | 1 
                   host-go-src | 1 
host-heimdal-f4faaeaba371ff... | 1 
     host-moby-buildkit-0.11.6 | 1 
igh-ethercat-f5dc109176400f... | 1 
                iproute2-6.9.0 | 1 
                  jack2-1.9.22 | 1 
                jemalloc-5.3.0 | 1 
                       kmod-31 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                 lapack-3.10.1 | 1 
                latencytop-0.5 | 1 
          libcamera-apps-1.2.1 | 1 
                 libcli-1.10.7 | 1 
                 libcurl-8.8.0 | 1 
                libdrm-2.4.122 | 1 
             libfreefare-0.4.0 | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.76.1 | 1 
                  libnss-3.102 | 1 
                librsvg-2.50.9 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
                    mpv-0.35.1 | 1 
                    ncmpc-0.49 | 1 
          ncurses-6.4-20230603 | 1 
                picotool-1.1.2 | 1 
              procps-ng-3.3.17 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
          refpolicy-2.20231002 | 1 
                    rtty-8.1.0 | 1 
                 shadow-4.15.1 | 1 
                softhsm2-2.6.1 | 1 
squeezelite-71c012ad9ba102f... | 1 
             stress-ng-0.17.07 | 1 
                       unknown | 1 
              wireshark-4.0.12 | 1 
                 x11vnc-0.9.16 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                      xz-5.6.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2c5dcb75904aa293cecdd3b61a13e9147977a01c | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7a33e5e9f79976befb628e4ceb1df64ec841af84 | ORPH
microblazeel | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/60f2320728015cf95545ae1e294e912d4c2455e1 | ORPH
    i686     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fd7adfac13a93fcc02c2ea38c43cfa48be9a161d |     
   x86_64    |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/336669f59ab6d3a4db9952f56e188383dc9e087e |     
   armeb     |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/cb9c387651d5163dcf7bff6e3708089da7d9ccd4 |     
   s390x     |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/56c26102e8187659ff55835a0adfcabe80121456 |     
   mipsel    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/9a42a4427ff64d47da61c731abb99d7585781cdd |     
   nios2     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/f98386a15da5546d7413b25a18eb88f681787843 |     
   s390x     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/e8c26f43a0d8db54af7ed2b29685def587b3512c | ORPH
    sh4      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/bed3df3cf848e45bfe20903649e26c659607334d | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7628e280c4f06d1c5431cb72d983630ac54b2269 | ORPH
    or1k     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4b7666fa96c93fa36c3e827689d9250811293ef0 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/669f5e9d8b37abe92c0b4d5c840365fe898ba928 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/24dfbae506ea230a2ce815939108f0d310e88e7d | ORPH
    or1k     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2ad818ca15e8f7b6c79fa99904d128c05243b0e6 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c1e9abfee969c5bd6d0cfb23c7236fdb1f347dd4 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7b12c9c4cf7e7ffad15a05c6aae3e30eaf7617b7 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/71eab3a056f8a36188822bad3d14a097fc225cb0 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/088be029b183a1de7fa1c1aa9d2b72d54d9d6334 | ORPH
  powerpc    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3275ec3c34dc826e195b00325d8325aa30f66f9e | ORPH
    i686     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/aacabefb4198dfb857a299771c2b2d718d5f0900 | ORPH
   sh4eb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/20155de19858b2d32be97b838af7d41e32d5cf12 | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e96f740c6e59ea8f1746e7a9952baf4e097783a0 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ed5976f92220047785a986621c415559670214dc | ORPH
 microblaze  |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/75b9b145a44a390e14ba9b504684d19f76db0966 |     
 aarch64_be  |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/53677d0384ff1b96e68d2f82950be4972b2469f3 |     
    i686     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/be923f422dc510c6224e2c43bc9dc38dc0abbddf |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/f3f0ee98c75d9017c2cc5cba3fc5530fed7f09f8 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e961f821b8215d22052ebaa68b0d092f277b94a1 |     
    sh4      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/bf803ecb06dea724bb64ba84d641ca2beae39b53 |     
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e9386a1f867e4ddf1bb87ec0144d7c2e3281932e |     
    mips     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/091b25089f0742bb2bf1396aa539a01ffa8d1099 |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/02cf021f006554296acafb8dc19c25cf497fd4ef |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/ef426b2720545ac5c324af28140e9a57b024bfc4 |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e375c307f962e3607d6f39fcbe6a30d90d1289f0 |     
    arm      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/ef9af1b202546f8f70020ebe48e62bf5729d2a69 | ORPH
   sparc     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/33ef9a23aef9f2cd3ea7ee08a8feaef261036545 |     
  powerpc    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/67965a5245c3d98d683e2c788352bf7c1cf4f00e |     
   nios2     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/6491aff56c3a5d40c52cbe0a13902fb36760fe31 |     
powerpc64le  |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/65e63580ebf1865764c125ae6b0cdf7bac656c6f |     
  mips64el   |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/a6bbe32937082a7a36e8c6a535f0a9f4fe918cdc |     
   sh4aeb    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/cb5b81e7957ae273104684beeb8a2231d324634d |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/96a2bab6ac7a1513c00485bb0b1b59c84e763b85 |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/98efb44934a801d29b5b80d56c797f57de77f3ed |     
   mips64    |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/b3c4deb9da9e3463d3ad8d499e2c6eb01755d1e0 |     
   nios2     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cb58fdd321467c87d1da1c58a70a386c4b0000e1 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/48a8dbcd0eb1c5393e2dddce24a1958527b81ab2 | ORPH
   nios2     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/94f5984a473f70066761c11f764b316e435e5aab | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/a182eeaa641c3a95beea1c099f16910c8a308b4d |     
    mips     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9aea2804413fcfe132d77264f0732476186ee191 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a0ace51a1706964a6e403fc8c56711e6bcb3bf83 | ORPH
    m68k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c7a709e7bc5351962d133c817aa5b073c3147a33 | ORPH
   s390x     |    docker-cli-buildx-0.11.2    | NOK | http://autobuild.buildroot.net/results/d9395ee4ac9f0abd0faff2c7a6640e438bb730af | ORPH
   x86_64    |    docker-cli-buildx-0.11.2    | NOK | http://autobuild.buildroot.net/results/18c95542e2fd20a392f2e309b0ef230ae95f437a | ORPH
   nios2     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/ae248836ed8c4c975258b7d1e944b8ef992df980 | ORPH
   mipsel    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/1aaffd356c9f2136be0db4a2eba22fd07167ec28 | ORPH
    arc      | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/bf3482c9a013ec77da78571077e86e852f6c975b | ORPH
   s390x     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/c511a3f0f9068a1fb568d139ef7291f0be27a075 | ORPH
  sparc64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/f99186af2e4c70f282bf2ea9996750d5e15bf37d | ORPH
  mips64el   | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/d49ad68e71ce1566aab40f2c46b9593f0dea41b3 | ORPH
microblazeel | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/d0dd4a59eeedb490c02136886aa7ab2a1c4ffe71 | ORPH
  sparc64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/29bcf2a237dcbade2c076e937be1b80d9c4639f3 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1ffa65aaa5eb4362c2cad0f171b61033967fb162 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8df2b1e2efdbdeec30c3d39187d8c3885bbed5a5 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9c7d59033e27c2643fa86af59c72eafecd2045cf | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1e07e7ba0656ad48552259b5de123bd82f9e332e | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2fd73221cfb93a5e883b6fc732a5b0e5b99f0d23 | ORPH
    i686     |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/b00e9da3693ddbfd1a8fd3c2f0a98b047ea9860f |     
powerpc64le  |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/c880dd5911d21d388baeddf5e75ddd325388df41 |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/7ec2b864439babf58ee8f613cf21965812026c66 |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/3e67a7193b2ab4fb192bb9e2a255dad7e15c8e6c |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/1c9746693f7c787c2a18cebeb7294840d4aa26de |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/7300a2e3bc19197ab823c29cfddccd00a40bd9d4 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/cc59da2f1180192921521f533fbd6af018da8876 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ef2d97ac70aa34ed9c34239ed2ab360ed1e12fbb |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/99171b268ae3fd392876c27ad907174ce9571492 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c576905b38eaba10c03c097e9c740215c033fa19 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/67f034bbd4b267ecb98b810b592a5d2eda370506 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3a4009dade0a3bfaeeb9a57fcb7932ede9eaaa06 |     
  sparc64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/90a723c4c0f393d7953ad0d688f4ae2a7090d29c |     
   arceb     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/5226182e47a19f84216e23fab1a60bd10ce56e02 |     
  riscv64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/885087712d595e9a37256d1ddf37b90f9aba5928 |     
    sh4a     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/c2e4cd137ec07396fddbe53796523799f498e2dd |     
    arm      |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/dc975c0a2c871a98f0ef22f035ad0c06f01b0fe5 |     
  riscv64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/43addd588042e95136078cfc080d3b2d527c1e0f |     
   sparc     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/e7381f475bbf3515eb471e7809f25d56dcb26b22 |     
  riscv32    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/ee61dc30056b6c3335d64054c875bfb40526033d |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/99b31f6bae2207775c3019a353d91e8ac83704bd |     
   armeb     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/39a90ebff61ce66efdcc1a1d669854ce924bbef6 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/9b4b8df863ec7d19cd10e1fcb5ade005ae678d0c |     
    sh4a     |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/72b4b528def8c9dc11305ea148192750bae45771 |     
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/e2d77a52f81b0fea1081417c5c80f7991e27810a |     
   sparc     |            gdb-14.2            | NOK | http://autobuild.buildroot.net/results/32f5715285ca46370df2ab35c38d16dbdbde5d21 | ORPH
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/5edb29539f5ada463588e2bfce7347d58b2e3cec | ORPH
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/a640bb62f6cc3326ffadbe53a8efb2a48572b8a2 |     
    mips     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/854420b8809e810560c576534c91d583a9f802ed |     
 aarch64_be  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/5ed10386b9cbb37ccff44cfa42203303c07253f6 |     
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/82c767f44b72387a1906e771ef27f195c083d8f4 |     
    sh4      |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/1361bfc22b4b88260a6be810735e6675d89afb79 |     
   sparc     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/2a62acc61b69b39cbf051e5fdee59e4e99c4973c |     
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/224455d80cf13f354e8950fc131a8b716f1790fc |     
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/095d961887b34b6369575a4d02977f9eb23fe33b |     
   x86_64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/92367cc97ab96839bda12f0d58a545bff271c10c |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/98973214f8e546c4147d31783aa97f11987e3a8a |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/13f24a1bad93bbbe718c8b93a27e19e6a8c7438b |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e06c067874142b13c76e46fd0aec7cba2a7156aa |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/90a31747711c202215c12a845a3950bea1355ea3 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/1c207d4334a1995050c059dc09361c5a4fa0d68b |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/28795af7abd4300eaaba53291734d4bd6a9e92c7 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0d1b6b2d7b6847390a09f889649b07eec2e95084 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/d0b7f969525bd933bbd0ec3089623ce94f0e7ef8 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/16cd22b51b5cf2792ac796c4447610da4e49eb1c |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/b4bbe3e56ce88d816921455de4b432f10c5ad78e |     
    or1k     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/a0e5985f9bc6d5df889a7e60c3caae5f1b6461fb |     
    arm      |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/ea25f35fac1588c0937e4f533975d4c0a49deeb5 |     
 aarch64_be  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/21d21d9fa17922982fb8a5d53a8be18c56fd7f5f |     
   x86_64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/f01ade951ad867b36dc2848fb67eb7c094e4c29c |     
  riscv32    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/4bdb46d614fe86285525668b27bdc1506886b324 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5966529cfca87391588511aeba2adfe3ac7222f8 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/144fbbf1b77f462fb5ecf4de712c449785146432 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1b041ddac6adac6e00713af0603fd6b3f6dd6212 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c5cd696b059db7ec1d66d5d2322a7af6f93b2c44 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e14a0bc71a1744af21c83837d4a5b78ec98c9767 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/32668bee748530269a7d4b33418a56f49fd70635 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bff9bb9cd1101d676b64bc56f9e7966161efbd89 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ff932a58de21e14abb3c24dfe172616bd4e0996e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a6554a599df82add95ed750b7726665dab46d5bc | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c23f4cf6229101bde44e3cfd7c238dbcc50b6707 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9571efeecab4743a0d916c89863b534208104f7b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/03cc5db6c6e29a3908b584226ba3eee177cac7b0 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/77e37a70d5dcae310c1b4ecf8fa9400fd2a0f52c | ORPH
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/fcb9e8dfdd249437c67f95f64fc6583c2e81a9dd |     
   armeb     |       gstreamer1-1.22.9        | NOK | http://autobuild.buildroot.net/results/bcb3a7efda15be1517679dd71af5390cbcfe03b9 | ORPH
  riscv32    |         highway-1.2.0          | NOK | http://autobuild.buildroot.net/results/60c9b335aad0c6eda4e4d0f288cdc643e816e6ad |     
    sh4      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/e93ca032b20ab27ab9cee8decc65a8f45d75b666 |     
   sparc     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/64a57de22e7026ee3e844bac18e9b4822b40f4e5 |     
    i686     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/4dc77ef66ffc789d683fa347e6de7cc5312bd64f |     
powerpc64le  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/f96e84e9bff35da656e2feb36708277e77f50ee2 |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/e2c0e9ba0d1601bc600e96fbf28aa068be337bf4 |     
   s390x     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/6467e9acaa632e7c2ef48080f1202ab51fd930e4 |     
powerpc64le  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/73ae5b6ae1af470021dadd9f4ae106701a03b668 |     
 microblaze  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/5b4083f8b25bd262bbdf6ac67e4a0abe25a3d2e4 |     
 microblaze  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/4aa5b146bf736b0bb7db8a1f0b0905f0070a3072 |     
    mips     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/6c4a5fc38e908bdd8504c359ffaf441d1aa95f35 |     
 microblaze  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/8aff827e1d977aaaa0aec22a72785761561c45ee |     
  sparc64    |     host-btrfs-progs-6.9.2     | NOK | http://autobuild.buildroot.net/results/f80b7f653619fffb28fe36171ad1e68306e8a926 | ORPH
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/c0c3cd8c4bf0ab3de93e32de352b44968a469164 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/68becb785d3769790ee6fbe0405f5ac246d59cf4 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/5333b3694c005cd7104030540ff8879b06cbf891 |     
   x86_64    |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/ce98c41b22212f52bf7b53d84871b8e03409dbca |     
   s390x     |    host-gcc-initial-12.4.0     | NOK | http://autobuild.buildroot.net/results/4c49f12e028592dda924e1f831769304874e7058 |     
  sparc64    |    host-gcc-initial-12.4.0     | NOK | http://autobuild.buildroot.net/results/960abb05a136c11eadaefdad2e0086d664fda3e7 |     
powerpc64le  |    host-gcc-initial-12.4.0     | NOK | http://autobuild.buildroot.net/results/150ac53408005f1c3fc9900dba8f21d53ea7bb36 |     
   arceb     |    host-gcc-initial-12.4.0     | NOK | http://autobuild.buildroot.net/results/94847b5f1126f518eded2a831522d8fd215d08c3 |     
   sparc     |    host-gcc-initial-12.4.0     | NOK | http://autobuild.buildroot.net/results/9ffb566d51fdf1213ae1fb1c08254ebb30151af0 |     
   arceb     |    host-gcc-initial-12.4.0     | NOK | http://autobuild.buildroot.net/results/6475838e4c1f39ae23caf4dfff7afce9d661553c |     
powerpc64le  |    host-gcc-initial-12.4.0     | NOK | http://autobuild.buildroot.net/results/c984f6db4d3ebe838bc416bf9fcb97cc44c6a91d |     
    m68k     |    host-gcc-initial-12.4.0     | NOK | http://autobuild.buildroot.net/results/01ae9289e020ec4690377171f5cebdd3432ca658 |     
    m68k     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/3d5c2502cfbe15b7d2a755787edb44eb22d1e85a |     
    mips     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/163893f7f446fbe665aaa9738c208166a50480f2 |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/c51098c4f79cd5af260796890ca87f250e7540e8 |     
   xtensa    |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/c4f73f1a696d4365d1aff6d5e10ce8044aa8238f |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/6c0ae8b101de37c1f74da44c4e2e99260bc6d49b |     
 aarch64_be  |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/091175622c07d3270ea36c4ea6991b20b17bb8de |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/f45549fbcd4d5779c1acd7b6750f9b724bc18f53 |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/2e9df1273fbfdd0fd6e06fb748ec0fb4774e65f1 |     
   sparc     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/d05cf5abcdee7253d6a07ac617f73420de0e957e |     
   mips64    |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/0aafeba5cd2035a073b2fc80588424f9c25e87e5 |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/8891194f6f6990a671fb72eb340004a5784f333c |     
   mips64    |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/7bacd8a4742914171d00f23fa54a5f5aa91036f7 |     
 powerpc64   |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/64cf6dc21f8d546b66bb09e8d6df70a869f91b1f |     
    arm      |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/623b172c5628f8f17488337d38ab4d97d7ccfe7e |     
powerpc64le  |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/cedaee78768464bd069c1b061117379ae976a96a |     
  sparc64    |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/bde7f21f9852ae6dd774bf21ba4820885b0cf28e |     
   xtensa    |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/3266c0a2633fc987c563a0a23d3da75b8b555c78 |     
   nios2     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/b2dbc431c6cef0f540a9995eb3e0f0b9fa445740 |     
   armeb     |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/263be01d91bdd1e37c7f9924543262b619a9f72a |     
    or1k     |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/e2258cf51832b8f78a3a43c264dca5a3ab9f80d4 |     
 aarch64_be  |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/760d90772eb5bac112c9448dcec5645891cd32e9 |     
powerpc64le  |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/68e7686f035656df5b3d81878ec356a7e523c767 |     
microblazeel |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/915aeb6b91ec33999e01ed161019af8696a2769d |     
    mips     |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/e558532be12307aa40da996fa892b6512d993e98 |     
   s390x     |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/132163a35186eb4398d1f4739db280f8f252ca8d |     
   nios2     |         host-gdb-15.1          | NOK | http://autobuild.buildroot.net/results/7ff1fe63908c9a963901abf0c668e0c436114a29 | ORPH
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/31125590674540126c5f3270ae96794e89c3e750 |     
   mipsel    | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/78dc5835633ac521cc870cdff9bbced369238d59 |     
    arc      | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/4929a543b291928a06a47e2373e90e84a69042c9 |     
  mips64el   | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/2b4fbf6793458123f1e9f64c140f4a24808a6226 |     
   x86_64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/f14af7f7292273bddc1add1a83bf50872947972b |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f53808572e2420391ed29a3c7ce853f3dc0c36de | ORPH
   mips64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/2f71812ee81a0db57dbeb1714d23225815633f69 |     
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/62feaa4017d9f43469ce74c7ef7cbbcf0d44f5a0 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f3210dd761171852e0defa119dda37e7400fcee3 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/db3f72adb871dd9cefa3d1aa13b3fc379e4e51a7 |     
   mips64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/d4b39d5dc897bf50e214c21585ade16f93fa7172 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/698ee1a3645e85f327a941a350417f35d5672136 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/24422b6235b8cd18ddd2068ef54a095292f77935 |     
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/efc75a4c75abe046481b8da143de351fb1e229d3 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b5f41fab8dca43e2f615b6595aab66ca77b78d4b | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/bd8782f3fcc506f6d9152b6d16e62551077bdc40 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b9267bacfc467f91f63ac36ae70e159f10b9763c | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/925fc199b01fddc76505332db38efca3d484b9a3 | ORPH
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/24087c966d7b00122ba2380d8cc8525ea1993d82 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/32cb176dbb3b5eda6184c4e8b70ca050aea88517 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/cac5f6cfadd70f2b0d103ed0482a10c0821780aa | ORPH
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3084701145cab47abfc4341e6546f46d4e70059e | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7aad8c5cf2f5eaa2de948cbe1541a776d52c9dd9 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d8419739dc6464e50f5a5bfcd34915266edab188 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f4649a574b5b57c9af5ef2d77916b00b769943f2 | ORPH
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b53b42b3cf528dba65a0e55bf97e13ead46a7cff | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d77bbe7ed2eb315d5cf2ba37061be04f75661db7 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0955d331a9935a65e01ece79daa8f0ae4e351c60 | ORPH
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/6a653f800e1e82f57ff4349949bb897a6ac1e2b0 |     
powerpc64le  |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/36ff752dc9682807c6083a6f2330e99cd0ce9799 |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/bc521f1716a32f0b6f2deb1e69320dc6b69bc621 |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/95483829756b27a5d8f92f0407bff6c12d929b86 |     
   x86_64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/0656a8d408b5b88fec88e4c411c9ed51c4d46154 |     
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/63c8f50e4159af322e20a3f3f6d99ae7f09f00b6 | ORPH
   mips64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/d3d86c9a93ec16048cdd38d8f5effa02f1bcf23e | ORPH
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/dcadaf12de37f48c55545773cb18ccb571d26e23 | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/000c80d7ed494954d366f4020225315f40a3d96b | ORPH
   mipsel    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/78bb0fb0422eb42ddbf0294c589b82b95a1a940b | ORPH
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/4281b4dfeaa9ff14556a23292434319be58b9d0b | ORPH
  sparc64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c2046c2eeb1d0b241c817bcb8aba8bc6f1902f4d |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/aa85898c01aaea501d58bf304535bfa9f6bb1f99 |     
    sh4      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/627fb0cdc30f908292cf2fb1b3323271b7537ad2 |     
microblazeel |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/b36da2fcaea1f05979d267f00c44bcacd35eab6b |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/1a72c083a7f5e1dc069db75923eb63dbc62a9f8b |     
    i686     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/bf071f51812520632fcf66f6b1e6a8315ac442ac |     
  powerpc    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/2b3f14185bfbead537aa0ca0a160bdf68e220c0e |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/ac58f244ecf1f92bb5e09888513d7713c8a04eb5 |     
   armeb     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/72e950a544f68f237782e774b4f51ea0fec19918 |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/b01ba9141b13bfde2103cff3fb2e2d6f04a80bba |     
   x86_64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e3366030d99150dfb015ccc0079041003fa3df75 |     
    or1k     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/713737c48ddf787bc8a6712bab4a39155e85179d |     
   sparc     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/b16f6763810cf31ecd618b0525deae7d3bef58e2 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/6f926ab5ad98fe69bc9c49456f3296b414414b1b |     
    mips     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/f5a7665430218364ad78d7f6fe85570acc227b67 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/6990b86430c55be6657f508f43111bb76150a9d1 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bf4649c4baed93280175d6a2fb3d57f48c4afeda |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0b3266f4c586f699d105bd08ad283724bc4ac554 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2c077b8d7d7963f150c34f78f17a44c90d13d8bb |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/52e987ae380375863ceb8922f28db1dac9371b6b |     
  riscv32    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1a2afea9bbc177944b985a27d7236b5b9980f6bd |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8bb0737b139ad8e71421907b4b3eb4cc7f44f307 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/317b4a1624b7ce3f54ee044461beb712eaefdc12 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c24dd2b2bd4e2a8ef7e600c5df412029bb96198a |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f9ea3e004a7d1e89bbb29b68955c680dd3ac211a |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7c034323d8e21a5e3729f23f9a81be70c0657623 |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/67e06fde476d15d3bcd03da2456079c573da19a4 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a7120dcd844dfadb7a7b7b4e3c60e93d7fb69e95 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2a0865f5203eb93c9be0278ebbdd5d3995291bfb |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d28a9ce8da2bd9461455afe53d7caacdab206131 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f127cbee2b0bf39f3f46f92b982f6d4a9debc694 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3a868a8915dcf7176c12eee1b105888763ee76f6 |     
   sh4eb     | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/db2462b1c5c6797a0edca66a513c121dbddd8888 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/6780458f8dfa057926fe65fb28c376a433c859b0 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/954ef51cf542c7b2b63ba09106d01f7132f27537 |     
  powerpc    |         iproute2-6.9.0         | NOK | http://autobuild.buildroot.net/results/e3831224ac3c54d22bbc6fe14a7274cab75bae9f |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/80111da45d12107beaa96b52156af615ed6d9769 |     
  riscv32    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/a7c27d64086a312effcbfec714bafd9938a47b79 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/2cbfe19278ed42c64027930f2cd85a864a26d550 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/d28065849218203960ab3ba27c9d4a23ba882fea | ORPH
   sh4aeb    |         lapack-3.10.1          | NOK | http://autobuild.buildroot.net/results/cabdb908d667cd00dcd4d91222543d6d72be01c6 |     
  powerpc    |         latencytop-0.5         | NOK | http://autobuild.buildroot.net/results/88f2df6bc79cbfa84de003e55202d53090cefd30 | ORPH
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e0278211ef017b9dcc208a9e8e02a9ffa82d0683 |     
  riscv32    |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/686efaa523d06103cb46b30b743597a76b69efa7 |     
   nios2     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/72e1843de650c9ed4795f1141e9fd485b71a14c3 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.net/results/e22abc1ad35218349abe4fcaa0a013835c824fe8 |     
  mips64el   |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/81af9777e690fc18e55496ffc709feb60c840c8a | ORPH
   sh4aeb    |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/b204f2ff231b9dd2e66b89228796a16f5221e1ab | ORPH
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/994e0768931bc3e614c0b7ca085f46f1ad66b074 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/64536ac36333cec537515529b0b2b1c25001c726 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ca59b538a9b412d486361ef45a9990f3e9728256 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/a338f1237cd9ad1c10d11fa9a474dbbe1a6e9484 |     
  mips64el   |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/778be216f62b8c2e05aba1b3e297dab0c6c6ccd0 |     
   nios2     |         libgee-0.20.6          | NOK | http://autobuild.buildroot.net/results/c319c1c319c5714643bb129d7c19724082d98c43 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d53a01478555bd66aa7476b0fd8713cde46a58e8 |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/8e3801ee65d721dcb95f79dc7d762489d31e3bbf | ORPH
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/257b11473cc9e3d65a83ec92967aed1154ca48cb | ORPH
    i586     |          libnss-3.102          | NOK | http://autobuild.buildroot.net/results/5449b922d012a1735a41c22a53b9e7bc615ea6cf |     
   nios2     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/6f57efc64acc90bd3bf7d622d695a8c55a988cb7 | ORPH
 powerpc64   |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/8bc42870e6f88433bbe540724cf1e9a1c4e32b32 | ORPH
  aarch64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/ac8be1812c9029914447f92e9357163ad7334656 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f56aad191e134eb7fdd05dd87da6489627f7c93f | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/68a3bf652ce2892bdeac60c451f02554790487a9 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/99e6003523c449bb71fc1824837731f82353e078 | ORPH
  aarch64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/4b7c3a1ce7de4631ebf42d318da7066620c4299e |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/df3821da33a5878523a62b7ec9d34eddea05501d |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/004d892de939655dc991c92dacfa4d00d32317a0 |     
  powerpc    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/42a92c0455c7d65cc408f6013619420cbbde174f | ORPH
    or1k     |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/18c783edcd4ff031ec139f171d827582e3ac3266 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/942fac9ec3f1aacf048e8200eb8602364e03365a | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/20307b8d0c34a6da57817f051fc85271cc2dfedb | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/219469ef9ebd1dc7ba844294b2022d4146914966 | ORPH
   mips64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/9a4dbbea1b1ed754d5ea4c278e4f11cb73dccf24 | ORPH
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/3ff53492178483c89e8329da1d726ed23f853a3f | ORPH
   mipsel    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/5d65eed7878b4e0031269346abae346cd6b10ed2 | ORPH
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/1a00c8764efea943cf80cabe72fa384e2ed20d39 | ORPH
   armeb     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/311ac206f4b2b6cda9c106ca70f6c325098b6199 | ORPH
  aarch64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/c7cdbd0557fa3d0327f0e59fce01391f6881b537 | ORPH
  sparc64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d1d5a17c299508d46340f597b35364c084faae39 | ORPH
   x86_64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/2b6e4248f7e10b4172dd9701b39ea9064095f486 |     
  aarch64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/d7e2fbd0ced0a479079397ccb24e43d556160633 |     
    i686     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/9814ad0be18bc726f4d3b031b5ff504911a598b5 | ORPH
    i686     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/868764b14f6627ea678ca8701883d40a8d4d5e34 | ORPH
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/95e5803e44f11ce4ce0e508fb49bbf52676d32c8 |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/e6bb62b1172db4bb5d4e20cea55d8bda26a50558 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/41b039906437cba210a8570e2f93dc9b0995f587 |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/784b8209945de70251f773c4bfacffadc102f899 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8a67cb4648b44dbb2c56795e84d74b9666ead586 |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/627796c06927e96c0e355a0520bb4cfeea6a6345 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/bcea8531d8ab3d2a9c92f3a2cd6bb513433c4174 |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/770ba415485817de2056d45f4162d690ad8ed961 |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/31e7bba11f3f36b3022a21a0673d444a93677f08 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/cf8cd40fb9062c226acc6c8d98bd5239ce7466da |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d9ffe62a1a3d473f6af20cfa18771bb9eb31577b |     
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/223d79ca3dd1319b2410bcfc55679527334d06cd |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5341c21fbc5a393bb1b7f292e0a6103de472b5db |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/334a96e6e377ef61396929d727e7840ece3b13ee |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1edf964983ea6db920bd3821a4241ac37e76fa45 |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b50408984f08db5fd986e416ddde1845e1aeea3a |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e1ff68a847f0bd277780304cd454270f3ea09b48 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/cce5d9c8686249605063421ef2d3c2f521246b49 |     
    sh4      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/99211f022846f4322e0c3748f550c76d78835309 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/310f4f4b340e6c0f6d72e4925bb1ec08cd39a816 |     
   s390x     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/47b9ff8110770f2eeb10697cd74a4284b2af01e5 |     
   nios2     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/88be62fb2341c8ba80552e3ec80fdca9fd6bdd9f |     
   sparc     |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/f013a600768655bcec1ac0ee563e85306970c925 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/901fc2c8fbadfb54112deca9e6df82fd51484eca | ORPH
   sh4aeb    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/284e703185cbe1c677c8fc447d5a07e6b407f6b4 | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b9962906665debebd12fb12798b73bad1eca3400 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/fa3a5dde6b0cbd6550297d0423203b7d1ad1136b |     
 microblaze  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/80d77bab14d0f412e7f35ba863586fdc70ad66ad |     
    m68k     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/33efcdde1da0dba7fdfbc38a12f367eb142e9e60 |     
    or1k     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/740a49350d6400d7e4c68ad4dbcd2f0dd548e05e |     
  mips64el   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/d70da4707c1785289ad8d152c01a371e9916b2b7 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/32e0ffc25e19ee659ed245a15e88ea7ffa83ff78 | ORPH
   sparc     |         picotool-1.1.2         | NOK | http://autobuild.buildroot.net/results/8c3feb84e853512a1b05256e3e5efcac640ecf39 |     
 aarch64_be  |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/6f670e6794f5824f0f3f4f8c60c4372905a8d522 | ORPH
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/3ac3a61ab1a0834a3f5f070831aa1e31631de61d |     
    i686     |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/4041ec329962a894c74b9de24e90846cc96a1f91 |     
   s390x     |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/267d4b801d12e0fb09f2fee6e817ecd2b4e08063 |     
  aarch64    |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/31df4c7fd5e48ef01827234f1b0f4e535316841f |     
    m68k     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/a26743e6b9fe8072f599a8d55cd23039514e6028 |     
  sparc64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/5955cc3f3dae3823f6a8ec669b51093a44f35ac2 |     
    mips     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/d9ab2ef43a8da0172d5de56fbb311f400ba28946 |     
  mips64el   |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/983e8fd084574b015fa757d69e0d565abab17ac1 |     
  aarch64    |      refpolicy-2.20231002      | NOK | http://autobuild.buildroot.net/results/8409d508097e8122431008948232e59b8f051b47 |     
   s390x     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/e9074759fa7c1f31b20c74f9c89b5cf6a66f0715 |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/05fa2705354da466a030ef8c7056833a5cd3364d |     
   mips64    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/a2542d82ef546b19f001534ec92200726d9e3a2e |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/b1b364581313525671c80f9bdc8f426a84dd6d0f |     
   x86_64    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/739c2af6269f8dc9fe6f6976cdc3ec7ccb1dd279 |     
    m68k     |         shadow-4.15.1          | NOK | http://autobuild.buildroot.net/results/de0c48f0b7aefcc7810aaf3513cf8fd2d2d32a40 |     
   s390x     |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/4c521ede97d03c8752f7441477ba235fea9d288a | ORPH
    mips     | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/f2267a6d541a732aaed8cd581a96c9706efc921d |     
    arm      |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/d737625ab79b878f24c4ed313dc8312517882676 |     
 powerpc64   |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/a4bef3b234ee49c009f65706d81db9b38b488ba7 |     
    mips     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/8ce91fb4b9a520265bee2e39d7d38990b6a26b9d |     
    i686     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/2f2702efdf6cf9529989ad6de50a94e0339b4f39 |     
  aarch64    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/28fc90979a4b45d6e8ccfda9a46733308ec08ed1 |     
  aarch64    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/90ffdc6599de02ca641b7c8a4a2236ebe031532a |     
  mips64el   |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/95e6841d8969f7c617f6e993f5ebdee2aebf1200 |     
   mips64    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/d23b8f59c7bd67d4373559d3b6b5f5e07fae268a |     
powerpc64le  |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/46cb139ad203ebdccb03482e31f7aef14ad0fe36 | ORPH
    i686     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/70015b0f0b507af895598edd0fa9ddf41b4e3610 | ORPH
 aarch64_be  |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/333dc3f3cf94034edddca32edb26df772ed7f08d |     
   sparc     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/57483e88c1226a6b91e0e8f81572145490055faf |     
   mipsel    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/de00e0a80988c9abc22ee993f7b55b13691eaa4c |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/df79fdfa29934dd60686d23b073c41e594be9100 |     
   mipsel    |        wireshark-4.0.12        | NOK | http://autobuild.buildroot.net/results/7d5633e28db42ad311723a587a4b0b8ee8f9eb15 | ORPH
    or1k     |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/c490f89043ad2e7423d951c0b2a44207a38bddb6 |     
    i586     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/8c6d7a4232ebb6f40e5784bc5d7912b8cca20e8d |     
    arc      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/73c5ae578d09862339334a9823b7247cc65f0cf8 | ORPH
 aarch64_be  |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/8296cf7194a35be5762e0a42be7e7f8d3f4f3255 |     
   s390x     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/8f610ba5c3abe616d9fc0ce4d6deb12cd35c980f |     
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/981c84860c299cc27c2ac7d3bff8b44a136fc85f |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            gdk-pixbuf-2.42.10 | 1 
  gobject-introspection-1.76.1 | 1 
                  jack2-1.9.22 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/da27cdb894907f6dea3a7e99a5f9f7985aeb6461 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/99d52eb834820f3dc031082a07d4318ff2b27f06 | ORPH
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/f72b19b50c83c732c4d6feffcd5cb3ce3100a4e3 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 2 
          libcamera-apps-1.2.1 | 2 
                    eza-0.18.8 | 1 
                fail2ban-1.0.2 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
host-go-bootstrap-stage3-1.... | 1 
                libvips-8.10.6 | 1 
           mediastreamer-4.4.8 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/cc59f08bc71a63a4fccbd728f03566f80c551f83 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/49cf4e85e20c298a3e7ce88ee41a5fe499474a5b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/206b355c42e225f4e4cda64ad334706d8fc60980 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3501c5f159fed940a25b6dd7cbca62a6bc1708e0 | ORPH
  mips64el   | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/17f6452f4c358f65b9b52d3cf2ad937884d1cc7c |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ce3bdc8c41ec46b9cf716fe7f4c0e7b692e443f9 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4d78e7a502981fe7f152162df197071aef15396d |     
  riscv32    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4deeabafc1acb2829e2883e858c0798b84728831 |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/6ab267bac6922d770f45f2512f8f99aaa7981d0e |     
    arc      |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/149d6b223c8f5942f1dc28e933a441391b8a98fa |     
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/a947cac10389347738d0283b8e1d8944103da49f | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
