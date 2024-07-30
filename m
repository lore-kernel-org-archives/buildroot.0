Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E57C3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 04:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A33240661;
	Tue, 30 Jul 2024 04:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTVq7D2kMacW; Tue, 30 Jul 2024 04:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C555E40664
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C555E40664;
	Tue, 30 Jul 2024 04:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2DE71BF3A3
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 04:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8B254042E
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 04:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJZEzKMVKdxU for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 04:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AD71400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AD71400AF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AD71400AF
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 04:45:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 636A024000C
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 04:45:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 04:45:03 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722314703; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Oit4g41eN8QIJNV95tJ/mrd7JM/4zXGEl9K7hQ0S7Dk=;
 b=QkB4h+y02NKBYlud1XFLw3f2F+E81/pDZo9s1yk2coTd+3s0O49lFWwIlV6IHRnOMJECkC
 QYPNe80EKk4g312/QGjRIYVexvlRY4GflVKi+fpd0EqEpFebmNJv0COye4/MaV+XARnDS3
 unmQNQcB5CA1EKK0SjIkPFe1dQcromMNm18T3Mt8Re6VM4pzPA45D+G9KZX59BxjIVfxZx
 bpDfyNAnkw83vyuhuwecIoZgtuk1kThaobfqToOSo1XQBDQk5SuNl3vEoDNbOJ0Q/QW9+p
 Cv/2wPR/f7XZnZuKEKcvHvt5HWweaWlXvRebYngnJ8r85SoIuzGWlgHq9K7how==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QkB4h+y0
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-29
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
Message-ID: <20240730044503.lZNv7alLLPw5UEnF44lgPH4igFCgfBrfR9lhAGq1UYg@z>

Hello,

Autobuild statistics for 2024-07-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  5  |  0  | 11  |
  2024.05.x  |  5  | 13  |  0  | 18  |
    master   | 89  | 187 |  0  | 276 |

Classification of failures by reason for master
-----------------------------------------------

                host-odb-2.4.0 | 11
                    norm-1.5.8 | 8 
                     avahi-0.8 | 6 
  gobject-introspection-1.76.1 | 6 
                  cairo-1.18.0 | 5 
                 dc3dd-7.2.641 | 5 
                  ffmpeg-6.1.1 | 5 
                gerbera-1.12.1 | 5 
host-vboot-utils-bbdd62f9b0... | 5 
                       unknown | 5 
                espflash-3.1.0 | 4 
               procps-ng-4.0.4 | 4 
         python-remi-2022.7.27 | 4 
                  bcusdk-0.0.5 | 3 
              fluent-bit-3.1.3 | 3 
                   foot-1.16.2 | 3 
         host-libxcrypt-4.4.36 | 3 
                  libsepol-3.6 | 3 
                  linux-6.10.1 | 3 
                  ntp-4.2.8p18 | 3 
                 openssh-9.8p1 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
                 apache-2.4.62 | 2 
glibc-2.39-74-g198632a05f6c... | 2 
                gnu-efi-3.0.18 | 2 
               graphene-1.10.8 | 2 
             host-delve-1.22.1 | 2 
 host-softether-4.30-9700-beta | 2 
                       kmod-31 | 2 
               libglib2-2.76.1 | 2 
               mariadb-10.11.6 | 2 
      python-autocommand-2.2.2 | 2 
           python-daemon-3.0.1 | 2 
  python-pypika-tortoise-0.1.6 | 2 
            python-scapy-2.5.0 | 2 
                 uclibc-1.0.49 | 2 
                      xz-5.6.2 | 2 
               zxing-cpp-2.2.1 | 2 
                apparmor-3.1.7 | 1 
                  assimp-5.3.1 | 1 
              bluez-alsa-4.1.1 | 1 
              bubblewrap-0.9.0 | 1 
              cache-calibrator | 1 
                  clang-15.0.3 | 1 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.3 | 1 
            cppcms-2.0.0-beta2 | 1 
              cryptsetup-2.7.3 | 1 
             docker-cli-27.0.3 | 1 
                elfutils-0.189 | 1 
                     exim-4.98 | 1 
                  fbdump-0.4.2 | 1 
                  fbterm-1.7.0 | 1 
              fftw-quad-3.3.10 | 1 
            gdk-pixbuf-2.42.10 | 1 
                 hiawatha-11.2 | 1 
         host-gcc-final-13.3.0 | 1 
host-go-bootstrap-stage3-1.... | 1 
                   host-go-src | 1 
host-heimdal-f4faaeaba371ff... | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.79.0 | 1 
            host-skopeo-1.13.3 | 1 
                 htpdate-1.3.7 | 1 
igh-ethercat-f5dc109176400f... | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                  libffi-3.4.6 | 1 
              libgeotiff-1.7.3 | 1 
                 libjcat-0.2.1 | 1 
                libnss-3.102.1 | 1 
              libopenssl-3.3.1 | 1 
                libressl-3.8.4 | 1 
                librsvg-2.50.9 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               lighttpd-1.4.76 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                  lvm2-2.03.23 | 1 
               lynx-2.8.9rel.1 | 1 
           mediastreamer-4.4.8 | 1 
                  mender-3.4.0 | 1 
                nushell-0.85.0 | 1 
                     php-8.3.9 | 1 
    python-cryptography-39.0.2 | 1 
python-unittest-xml-reporti... | 1 
                python3-3.12.4 | 1 
                s6-dns-2.3.7.2 | 1 
             strongswan-5.9.13 | 1 
                 systemd-256.4 | 1 
               tipidee-0.0.5.0 | 1 
ulog-0389d243352255f6182326... | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/064cbfb44b6e6dbc02d452a9b83d0b91a2190cad | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/92180a6906f66e7214e19e9de455293040007928 | ORPH
   s390x     |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/bbab88f2cebb8ec46f5e1cbd9da4bc8b7ddbb02d |     
   s390x     |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/4699562e99dcdf215a7847309652d3374d38e637 |     
    arc      |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.net/results/ffe50635cb3279caf906d2706c89af285c5ffb57 |     
    i686     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/52bf2610b0d6025de048ef8c6530b382febfd88b | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/240f4ae13073a4cf95f2dd903dfbc0158e486c2c | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1f66183b76a5371acd98441774d39fa81008fa38 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e06616a597bd4b1e51c10c25738a16066d898023 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1f32c9e9a771e0ce39fc01530a3c2762af265c34 | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9c5387246a4f91559a42491e95673a4388771423 | ORPH
    i686     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7a75a7ffd8957e487c02079ff4be63ac9ed2b6c8 | ORPH
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4ce3d3f0705d03a3ed7495d14b4c690bd6f00272 |     
 microblaze  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/12dc6798663f9a4509fddc8c8abc3cbdcc03b434 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c2473b584b51b0259ca9f2e07c918e1e7671dc15 |     
    mips     |        bluez-alsa-4.1.1        | NOK | http://autobuild.buildroot.net/results/6f58496eb1732fc3c22afbe231c2625f55084bdd | ORPH
 microblaze  |        bubblewrap-0.9.0        | NOK | http://autobuild.buildroot.net/results/07ddad4b04e249466b10de98b4274439bc976534 |     
   x86_64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/d3af759f6b86d8549b7e2fdc9206fa92de74a455 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3a7689ccef9b9726f3384bb654698b6ecc2a9f56 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c2d00481a2370fc6d09e6172f3f9604377c56875 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/688c69a81c1bd4f6277a07bee58c878afd1ed2a6 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4a32aca58ea07e62a0db67220668cd9058ee8f03 |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/31c41e86ece2f406efbd73715874bb39799690a0 |     
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/0a80f734914230a2546d975e50b49534adf23c7d |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/23ce9a46c620f378ab55a1638034f130abf1ce0f |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7b035aa5728f3da482c1e44d0bf018d5a492c072 | ORPH
    or1k     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/1fc61a3cdf0e0a5cf8086941d34c8a2a06c6b664 | ORPH
 microblaze  |        cryptsetup-2.7.3        | NOK | http://autobuild.buildroot.net/results/3a96bd7cd4a13d2770fb2b3ab56584099600be33 |     
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/70061d96f0a4adccaa5fe66b103bc5d19342b667 | ORPH
  powerpc    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f70b13c960b92464e25b1d95a698db7c259bbab6 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/700fe3977a835779e064f40a4d81602748cdf5cc | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9e8fe45a158c9fe21bca6257647d4e59fe5fc300 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bc0b23058ac99f771864c97454e840eff9ce1853 | ORPH
   s390x     |       docker-cli-27.0.3        | NOK | http://autobuild.buildroot.net/results/6bd718634409963c1f9a118757d5c5f1c2ecea56 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b8a1f92bab6d073cd6a609e69631a3b5859c591a | ORPH
  powerpc    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/ab2f856e845f4e85ca0e35f305fa3a1fefaf784e |     
 powerpc64   |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/339a5c9a82d2c2d2bd08f9a728b9ee8e8ab48928 |     
powerpc64le  |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/2d784bd410ed7e2631dd9bbaaa95c572c73e28fa |     
   x86_64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/328ecb9c270b62d49fb952aef9e00370803e5db1 |     
    arm      |           exim-4.98            | NOK | http://autobuild.buildroot.net/results/18b7df833ee6ef1cf97bb083c0bbf465de687277 |     
  riscv64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/8e54340f7279049ccbc12fe5490f19b8ffafd00d | ORPH
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/5daacff1b09ed53683e856932984a7447afd60d6 | ORPH
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8436b95765d36c904f64f8d677fb9db2c06a6dd1 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2dfab80af075221c37ae8affac5829d45e5b0a23 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e6247f50833fde556aa4a322902054063da1d515 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e8715df72baf3641ee4b9966c80ed5bf831015b6 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2c48609cac9959e19283c2058f475fe7fdfcce8f |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/2c33e8cb7fcccc65bfa38545cc01fa90c1064417 | ORPH
    m68k     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/3123aa1a1415ac2e3ea75456e78d198d083b3bc7 |     
   armeb     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/a04b1ea8b0732da2da44a1966490fd435d9b99db |     
microblazeel |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/f1231a7964675cdadf6f866515fb652db0d724ff |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/f8c47ab48c0361ab72f896950f2e62e830e8a727 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/da734787b0b4e753acc6fd92e31bd96ddff6612b |     
    mips     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a6b3bb06018aebf518e6a6a693cb8ed049f19801 |     
  powerpc    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/ddc7e77042f827c49479ddb83e489feef6edb8a0 | ORPH
  aarch64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/d92f91c1e70a8072a0960248fa41085cd7fb07aa |     
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/c2d625831a09eb434a5902b8c340b121a01648ef |     
   s390x     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/785b32d51c79b930b469363403970bde7f140f93 |     
   mipsel    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/b28b2732dc2d1357c038669d8aa4b01ca705caab |     
   sparc     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/780493796dcc64ba291e43049a9c37fceaf9593f |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/9b71c93f107622c5cbf6121a286f05fc05111bb0 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/692a8186445866426c7631bc47a77ea6037f4d30 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/f17dcaf50d13622e8941b33c29db532520feae75 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6131cdfb7e8b64ea68ae03a1c66f5a8fc53a404b |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8d2beaed1330c5ef4c37b0d65d23821600a27adc | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0b639b1e6b94f609c35cd3654b57a25498d87322 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5941fa4d845ff404bf42a8dae1bd41c264118556 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e2f1f9359a0cdd67478c70392e2e17bb50dce5ca | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/313a90526456011b5e147a2e07a62bba6060df24 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/94c39b9e0f840a1f4afcba05ac47716c871e9db3 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/43025a8d406e1fea7d427300a0cbd37f3d7256ce |     
   mips64    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/19ae1f3fafa2f76548a9aa31c9f63296e33cb6c8 |     
   xtensa    |         hiawatha-11.2          | NOK | http://autobuild.buildroot.net/results/0401387ea9992f73b1692d8278c614cbe5762ef9 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/3fcc95f624721d71538e4cce229cb081a86f768a |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/c8b7f0fc073959b875b56686778a8b5e52bfc407 |     
    arm      |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/37936b7c84c1f39dde0311e19bdb5f787d42078c |     
powerpc64le  | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/b08bf1332395d64a85a2ac2be7b35e21812be7cf |     
  riscv32    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/339e15e035fb9bc967f70fcc82d3ad2e1857e362 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6f4608e8d8732ecaa2b6c80eec11fd94fe51baf9 | ORPH
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/5b7e92e104d22bec3f5144eca82fbc771cd6fda6 |     
  aarch64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/7a74c3d8edd41897425a4ab0a7f434ce98b5df67 |     
   sh4eb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/99bf44e73224f0a7c8b2446fd91f3bfe13b62d21 |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/d8f23c5311e7e91d53f14d4a33c8104505e8b2de |     
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/240fe7c666087f539f371ff47bc5d6dcf99350fb | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/980d1e05d546fefe4ab8ae49cfbdd9cc91bda399 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/659c64af72c5b300604572556afdcb93f87de91f | ORPH
   sh4eb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/288bf9f2663fa61801ca37f7dea4243cab921fb9 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e6ef5457c20b953ed65d6001258f4c446fa590c6 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1a286f50f34f95a2c88202a301a81d656a83cea9 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/40f33ba256ea08050c38660f9faed2b1c6bebc1d | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/63e7b312f7a6989899c99935276a32a6ff086615 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b8233231445956b311480306b2e3e0a12eafcf07 | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/48971f2e06944370ccd85c612e46c50d247eb4f4 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/31372df7a719f0fd364034a0b67f8fc76e5f0f31 | ORPH
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/5ea4dfef5138d6305641a43fd5b49de902bc968f |     
    i686     |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/b6a80fa29b8dfb8c1da24b136251c9044f59e94f |     
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/10487b7920ad3350623c2a551e1a760b33b81705 | ORPH
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/5af8ae4fcf7a892725585193ef44c431ef3146db | ORPH
   x86_64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ec1a8032d7775ba956261b89c5e54f9d60c22346 |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9de2a9f51f7ebe23e0704c69b86ac276d7caaeec |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/eeaef1dc2a2132e754cba7a3eedfbad468035f87 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/59efd944ece6b0656617bc909a13f4687b655a78 |     
    sh4      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d0fded72833769f7be532ab45f1397e54b145e35 |     
 microblaze  |         htpdate-1.3.7          | NOK | http://autobuild.buildroot.net/results/cde17ab2bbb8fbcf81ab89b316d4133a04271a4b |     
   s390x     | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/43b12ebcf1b4d1081b8f115020514d248429607c |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/900c666804e7e0bf7cccf99d92c1c0742c8d8d6c |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/061d2624cd7614db1763999aced9d2b3a3426658 |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/e5f705d20a011b5639e8d60a0d4bb77fc7aede4c |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/4c7af7c1507c081216e0240bbc1243b2a1ed8260 |     
   nios2     | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/cc32457a7db4e0fabb7f1c41f7f56631ac5f503d |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/5d1991f9125ceae11833b4ed33d22b9644e2a650 |     
    arm      |        libgeotiff-1.7.3        | NOK | http://autobuild.buildroot.net/results/020fb5c6ef882353e83b5f0d82d0132c7a8f2920 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/beca1e6622e51278d5f82034101a7224b93245df |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/532b34e6824e99e1fd3638cb8eda0d80fcea96fa |     
    or1k     |         libjcat-0.2.1          | NOK | http://autobuild.buildroot.net/results/121a3c0dcd58703ff16862f496bc0469b06f19ef |     
    or1k     |         libnss-3.102.1         | NOK | http://autobuild.buildroot.net/results/1ae6b7d8b5a2eb4e8f815e1b2f49034581acb937 |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/530498140cf8c7a1d3c721b9bdf298fbf4750398 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d96c63620af9349c5ca6791cab4904055ffa5f89 | ORPH
  aarch64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/07211a7c1e7e62e2a18498e0921916c9d64b6fae |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/cbc7dbc6a4b26b8b4a0a9065205486de3c5d243e |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/585c4255321c887a4ce78ac52ba98ed8c9057ad6 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/fb2ae351c7d8501a15c755edac8bcb8be568579b |     
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/d84715f3eb0a6f9b8cc270d640963d52a90cca60 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/eb96b5e0a1dc2eabc8ef2217857a036bd08dd3d9 | ORPH
    arc      |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/59481ed66a47f14ee579f82d62db12a8debef8c5 | ORPH
 powerpc64   |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/db3573f004f78f0cbff346c9295641346236bb09 | ORPH
   x86_64    |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/02801bc6aa7ac53b27ace22074f7e740b569a562 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/5fbaff5107197007f20da3d62af3563ee772694a | ORPH
 powerpc64   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ac17aa2d4f2d8f8e735e92438b8e94784390eedd | ORPH
 microblaze  |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/f4663d1e86552b34e83f013aa26b7869bd827332 | ORPH
microblazeel |        lynx-2.8.9rel.1         | NOK | http://autobuild.buildroot.net/results/4bbfc040a491faabb6732e284f7b0c28b1cd9534 |     
  mips64el   |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/7c7ad67956f1b74407cb038fd32b07b0e24fa26e | ORPH
  aarch64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/b289a8d86e61d45e25c76e9dd4642a0351d341f3 | ORPH
   armeb     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/0788f6ee9a97f90a37ad1cb91a380687747f8879 | ORPH
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/c56c8581bfbbdf6865b31d6474505f2b0e8490f5 |     
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/67ef3ab6a1676d567f5b925ac30f3593a9ecde0b | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/784f8938e8097e781abf717c72b520de1664476a | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/24c4d0808c8bae1d30055aa3fd0cd9e267b37b61 | ORPH
  riscv32    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/e70f3410b0c152d50b8c6dda2dc411f9ceffceae | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/20fa6827814d080a2db3538fbfd9dd7ecb3f4013 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f80853fa9b108760b77710806444ac9d9a458cb2 | ORPH
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/38796f40083d950f07f8dd2c2c9cb5da54dfd998 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/a7a58cbd5b5fec78969446b12ae460b77c4dcd0e | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/e6fd921ed0f8388628a8140719a22bd561146d58 |     
   sh4aeb    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/fbf586eda53778843d608f2bd9b51f1333978a69 |     
 microblaze  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/e592f0c6185db2b36ad6bdeccb582d40e89e4f1b |     
    arm      |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/6831821aa99a005805668cdd6e3c8cda356c723d | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/eaa4b918c9b5d494e2cf5f597e115cdb593863d0 | ORPH
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/0925c9aa211273549155c421048a7d1714a3a497 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/8eebe21c1c529b2f38255ad2f1f0a4b3b34ced77 | ORPH
   armeb     |           php-8.3.9            | NOK | http://autobuild.buildroot.net/results/7b6265f460bc312853d3576c07f9cde9989cd22d |     
    m68k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/07d215b3b50f823b32bddd56997bfd361338c849 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/524048a6b46087fa039afd62041901dcdde44372 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/fafc3bf759711d71de235fcdaeaa0e7e76524d61 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/b376c75e10dd58ee6d237f0393623b33b79ba391 | ORPH
    mips     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/107ed189d2e423d10d6be125d161141b9d8ecc29 |     
    i586     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/3a92600c89a1f9f9bc65d47b86cfecfd37e2b80c |     
   s390x     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/dcafb429a692498e349e013e93712987949db0ec |     
  mips64el   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/fd7b65672360b5f41984fb8f10f5f02cfc6b9852 |     
 aarch64_be  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/39c40e30537e9ad692b2ea55d9209fff2b361d91 |     
    i686     |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/41333c0152599705396475cfd68292d1be94278f |     
powerpc64le  |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/001d248c3119a1eff6a2b1ce46b3a459b15acb38 |     
   s390x     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/f9560362958db4adb18b59ff0a8a6d8662e8aed6 |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4e0980c8b711354062e7befefc369e2a2cdcf00b |     
  aarch64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/d3ec1a721844e4c118bb423f8943869ffcbb4f5f |     
   mips64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/b1f99b14db1b019e460f90d28823731843821235 |     
powerpc64le  |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/e03e349ea0bd18cbcf244bf78798f11423ddc6fb |     
   sh4aeb    |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/ee3d59f5abe0e45e890fee4bc9785c78442a2be2 |     
   sh4aeb    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/f871ddb8cef7c2b8753a0fc87901edea753dad1c |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/8642604fdff7766eaf6d07fc8e52f770d39c67c6 |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/b620e8cea2f0cb271c06f873e5f87150bc9952b3 |     
  mips64el   |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/f62c7defcb84b6db0a00ae931018971f908d765d |     
  sparc64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/93dae5ccc8adf58d3400a55bfb27b561cb91a831 |     
   sparc     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/c93ab0c5b295873f6e7ffa284ea3e3345de255d5 |     
   arceb     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/ae72a8f7f76fcb9483f898500ec54490813afce8 |     
   arceb     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/8221df1c66f88c357fddc6cc6d97427212efa19a |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ca556b59b8852c994a6165576fefbf79dea626c2 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/438b8429e5a5f2092a27b63e229d5842e97f0943 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a28b976b6062728552d60f9cd31432e8704fe932 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3108704006d70582226ffe011688c35ce42e2bb6 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ab2f9aea5a31b9eb9858eee12f9429356621633a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/cd2e7012df21480436bff070a6b49b24bfaeb502 |     
   arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/2ee7750b23e15753d3f48a1fbfaa1ed0786f06b1 | ORPH
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/33af59e3b9b4bf67d152637314e28e571f08ca5f | ORPH
   mipsel    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/081d236c2b2e43d246ecc91b8268ce0e89de003d |     
   sparc     |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/76845f473c5192424db57189ba51e7c4d1571659 |     
   x86_64    |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/6c2c360101138348acaaef2a12c37bd7cd341458 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  fbterm-1.7.0 | 1 
  gobject-introspection-1.76.1 | 1 
          libcamera-apps-1.2.1 | 1 
                    ncmpc-0.49 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/cd8002cde8dc0d2b68fb07907f7777fa433a9e17 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/269f8cba20722d85eabda0e528404ce1d352dcfd | ORPH
  riscv64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/da732b80ff96a32171abae50b545d60268ee8e5f |     
    mips     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/3cb9d5ebb5cfe64f331b0b7dee96e5f8d732f0c9 |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/d7ad66b3549a390e3cb49548e8b99c93d532ff55 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                fail2ban-1.0.2 | 2 
                 coreutils-9.3 | 1 
                  ffmpeg-6.1.1 | 1 
                host-go-1.22.4 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
          libcamera-apps-1.2.1 | 1 
                librsvg-2.50.9 | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
         python-remi-2022.7.27 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d33b84bc96d8c5fc6d0e311eb7c9dcf9eb8282bf | ORPH
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ed4e379c5bd0c90f18530c5b54b521863d6917f8 |     
    arc      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5fecea3cc5c127a093caefcce6d4ef6d1d05631e |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/50e7eae10d69e0b902093622ab359e12bc97c345 |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/917f0f13be158f69f312688d6927566e81597699 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/95537c9e5736cca5336b82aea94fe6eb7c469949 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/cecba422ae2ab552d44d23b96941d947438a080f |     
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/d709e58b3d20406d10b399f2b48652e228e6ef10 |     
  aarch64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/95ac894660788a34eb560a9993b8f22bdc207dbb | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/e51e9524af23560d5081ffebd63013f5c98b22e2 | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/b5b690fbd101d16939f13e61e49b6c1a9a728a7b |     
    i686     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/058509970a26e213a748509d906dd38261928812 |     
powerpc64le  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/5e7ba65c6280b323490d721ea21102c31661c56e |     


Gitlab CI results for 2024-07-29
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7446364991  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7446364992  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7446364554  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7446364643  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7446364771  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7446364423  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
