Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9447C3DA4B
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 04:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9F396065C;
	Wed, 17 Jul 2024 04:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQPqGLhZI5Um; Wed, 17 Jul 2024 04:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D23A607A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D23A607A9;
	Wed, 17 Jul 2024 04:44:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6D91BF37A
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 04:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D18A81340
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 04:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Si84P5_gYgOp for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 04:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC04681327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC04681327
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC04681327
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 04:44:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 261F94000D
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 04:44:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 04:44:43 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1721191483; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YC9hp49JW8rjIyOYLJjrdrGuQaOoj+c+/ewZOvx/K5A=;
 b=URjQ7HYM0w3LvM+TYoFqNO5+n5oljLWT2/FHf+PdXgUlKxwZ99r+M9IOJBlcA0hqCo0rmq
 ZFpn6LWpz5uInAgbnP52dcF84GhxFl2ar49MdXRVh6gkx39TASIg5VlGqoD+RbOBus5PNV
 BTn6X8BV4P8VhrtQt3yLfB6XM34i5krnMRlMDANpwwcKDZABMsQ572v8e4wmeK70Ima0Rw
 Njkx5+i1hpmGTIZyyNcwZDKGXXg8/wEC66YSl+NUG/DH1Tu3YLt0Klx6++h0Ezj5/1PfUU
 2GmccwYoGrhdnh7kg5JX2/5YeDTfwe9jySum2oVYjyQAVQVJvU+IJkUSh/GxZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=URjQ7HYM
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-16
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
Message-ID: <20240717044443.UiOhmDFHjAFqBb6uY9YvrKcVnyUdBO-ck_ju1H-sQVE@z>

Hello,

Autobuild statistics for 2024-07-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  | 20  |  0  | 25  |
  2024.05.x  |  5  | 16  |  0  | 21  |
    master   | 111 | 429 |  1  | 541 |

Classification of failures by reason for master
-----------------------------------------------

                  cairo-1.18.0 | 133
                elfutils-0.189 | 15
                  bcusdk-0.0.5 | 13
edid-decode-6f117a8f8c0e76e... | 12
                host-odb-2.4.0 | 11
                    norm-1.5.8 | 11
glibc-2.39-74-g198632a05f6c... | 9 
ibm-sw-tpm2-5452af422edeff7... | 9 
                    mpir-3.0.0 | 9 
                   evemu-2.7.0 | 8 
                gnu-efi-3.0.18 | 7 
                libressl-3.8.4 | 7 
                  ffmpeg-6.1.1 | 6 
             rabbitmq-c-0.13.0 | 6 
                  libffi-3.4.6 | 5 
aer-inject-9bd5e2c7886fca72... | 4 
brcm-patchram-plus-95b7b691... | 4 
  gobject-introspection-1.76.1 | 4 
         host-libxcrypt-4.4.36 | 4 
               libglib2-2.76.1 | 4 
                  libsepol-3.6 | 4 
                   linux-6.9.8 | 4 
                 openssh-9.8p1 | 4 
               tipidee-0.0.5.0 | 4 
                     avahi-0.8 | 3 
                  boost-1.83.0 | 3 
                     crun-1.12 | 3 
                  fbterm-1.7.0 | 3 
                     file-5.45 | 3 
                  libdex-0.6.1 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                     mtd-2.2.0 | 3 
                 pixman-0.42.2 | 3 
                python3-3.12.4 | 3 
                       unknown | 3 
android-tools-4.2.2+git2013... | 2 
                 apache-2.4.61 | 2 
                apparmor-3.1.7 | 2 
aubio-152d6819b360c2e7b379e... | 2 
                 coreutils-9.3 | 2 
                 dc3dd-7.2.641 | 2 
                    gdal-3.8.2 | 2 
                gerbera-1.12.1 | 2 
            gtkiostream-v1.8.0 | 2 
             host-delve-1.22.1 | 2 
 host-softether-4.30-9700-beta | 2 
host-vboot-utils-bbdd62f9b0... | 2 
                   httping-2.5 | 2 
                 libp11-0.4.12 | 2 
                libxml2-2.12.6 | 2 
                   linux-tools | 2 
                mongodb-4.2.18 | 2 
                   nanocom-1.0 | 2 
                  ntp-4.2.8p18 | 2 
                s6-dns-2.3.7.2 | 2 
                unbound-1.19.1 | 2 
                 agentpp-4.6.1 | 1 
                     apr-1.7.2 | 1 
                apr-util-1.6.3 | 1 
           at-spi2-core-2.50.0 | 1 
                 augeas-1.12.0 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                    bat-0.24.0 | 1 
              cache-calibrator | 1 
             can-utils-2023.03 | 1 
                 chicken-5.3.0 | 1 
      docker-cli-buildx-0.11.2 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                      ell-0.65 | 1 
             erofs-utils-1.7.1 | 1 
                flashrom-1.3.0 | 1 
              fluent-bit-3.0.4 | 1 
                   foot-1.16.2 | 1 
                 gnuplot-6.0.1 | 1 
             gnuradio-3.10.7.0 | 1 
         gobject-introspection | 1 
                 highway-1.2.0 | 1 
        host-btrfs-progs-6.9.2 | 1 
           host-gengetopt-2.23 | 1 
host-heimdal-f4faaeaba371ff... | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.79.0 | 1 
igh-ethercat-f5dc109176400f... | 1 
          imagemagick-7.1.1-31 | 1 
                iproute2-6.9.0 | 1 
                  jack2-1.9.22 | 1 
                       kmod-31 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                latencytop-0.5 | 1 
          libcamera-apps-1.2.1 | 1 
                libesmtp-1.1.0 | 1 
                libglvnd-1.4.0 | 1 
             libgpg-error-1.49 | 1 
                  libva-2.22.0 | 1 
                    links-2.29 | 1 
               linux-pam-1.6.1 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
         lttng-modules-2.13.10 | 1 
               mariadb-10.11.6 | 1 
                   mimic-1.1.0 | 1 
          ncurses-6.4-20230603 | 1 
                  octave-9.2.0 | 1 
                picotool-1.1.2 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
python-unittest-xml-reporti... | 1 
                    qemu-9.0.0 | 1 
                     shim-15.8 | 1 
             strongswan-5.9.13 | 1 
                  sysprof-46.0 | 1 
                tpm2-tss-3.2.2 | 1 
               valgrind-3.22.0 | 1 
                xenomai-3.0.10 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/623f693c35663513ce52194286bf814072b20590 | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4c3b3aa54c831090c701652d574f2494618d0e7c | ORPH
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e606d7c02f66bbc5d9826c265ac30a4aa90f62a8 | ORPH
    sh4      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d35128b47c7b25f23b1358ebd5a72b71f78248d7 | ORPH
   s390x     |         agentpp-4.6.1          | NOK | http://autobuild.buildroot.net/results/58c18d565100889012670e9de80067f94830d2c4 |     
    arm      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/9f97d40d403085cdcadca13959827c579aade07f |     
    or1k     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ad820e204c3c2d928efed3ebd1e906b658b326ed |     
powerpc64le  |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/9a56052136cf2c7eaf882d34d596e9dec2863f1c |     
    i586     |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/65e6184f37ed5eefeacb98e54d3275418813a23d |     
    arc      |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.net/results/d6211de793cd97221d64214332a8a6c4afc8266a |     
   arceb     |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.net/results/a06fa3f61948d7a7c5caca0533b04bba7c5982a2 |     
  powerpc    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/3964dac828f6c2d5e25554c9ab9c280b9c218bb5 |     
    mips     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/affbd8132bcf2ca4dcf49c2f62f4f4641680904e |     
    arm      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/29f420696067d0833b231903b7f5e495c14565e5 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/1918eda684fd81eee5c0b99f71c8a71be01e0216 |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/f950e7800a089e15ab11c3423be9609d4809cb24 |     
  powerpc    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/387d47f41dbd554491bfea7d8c3ccd42c11fd96b | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/51ad76eaac3bf8a363f8b143e56a6ab268224222 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9af902f769e7b6da6fd73036d6b31455ff66e9c8 | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/072faaddf02b1de3aa6f45108f50f8aa7cfc491b | ORPH
   mipsel    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/54a2ece668434c2fafbbcf61b5de61731829f63a |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/d0d5ddb4b9597711bdf466e6cddfd5009858f748 |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8cb5fa6054b646b0296675de31bb14a7e364fe84 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/fb7cea4d37bbba7930333a6c66eadf6d179e69a8 |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4b634b45356a5271259237dfbb55568820d38449 |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/02b6c3d60727b8de0d3a04bce6a96fadf0134723 |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/6ee7d20a77056d23c66a83b4307601fcfb8b9cf4 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/855ccf04435a16edcfd8586b75ee960bd4fff8f4 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/975ac739b604842958c19aaa164c6d3c7ff21be1 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/a70922a809a6625cccfb88a78133b122e2bb957e |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/dcd6bf083b6bdb0ca6233138b7d197105ad8ab4e |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/d0f84b2f65e494661c3ea2c6df928da4cd3375fb |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c7b9be189a10b01bf74a31318d1f070af245dde9 |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/cf1ed552785494f402c3aa42572f2cda8cf1804c |     
 powerpc64   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3d44fc276b43dc6af1fe2e0e4f1a5251b51e2868 |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/eed39385e358e53b98cb11ec3cba067fbdb6fe96 |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/85af145071d4c3a0fddb6b5aef21ccfd0eff8424 |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/1c168c569caee16076dea67816c05301cb0049c3 |     
  riscv32    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/6347fa2fd3da89063f2577b9b30f5fa7a55c79ed |     
   arceb     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/225e709c3386321293c006dbe3f149caa380401b |     
    or1k     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/42cb04e781aa29f6d62b7815765ec37f452611f6 |     
   sparc     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/48bc6455dcd03af819e1b0c9a2ccb3cf20aed2c0 |     
  riscv64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/e01e75ee7bcd6784c6362f14781d85949d4e8941 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3cf082a456bb03c737e27c3b00f03b500aa0ca77 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e844b34fa6cb78ae0308f3ad09fc80276ab3482a |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c4c757f16f20efdb66f51fc20f52bb919a8a79df |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b5ddacec8f35b114171d99bbc598a172c40ce729 |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8f25b9271aeb3f4ca5dccee4d1fcc184ceb920b6 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7a832f0f32d45b38fc1d09a8dd6c3a8da7b84254 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/35d629bdfef16a5c31ec21f3094e9095cbea83bc |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/54c23648503a4c749a4a0807d4f9dad517c761c5 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/955abbd86996efb921f3e6601781be58e9943ada |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b49cb7d1ed96b11e4ed2343245831c5112fc43f4 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bc860f0ddab001889c5a0ec34755d02f96c6a238 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/572ea89fe5d3a40c0afef60bb4ad4060eabe3e09 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/38359fc8b0976b6fdbeaf1b835cd3f0560c8bc2b |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c7c7009176e3b270357e4901c78f982e0d2736fc |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5bcb2449d395694862eebb3f28df623bab1eb161 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4d68e4ca780a32fe1ace19c34b059fa456a8fd40 |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b7d53033ca986f18b8ad6cb0d341191494865a35 |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6b1e54ef41b10196d79581cffec82d8153694e79 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/09443b9a2dc72c53e9a4f58a7663e88f76073370 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/01a01278f9a5d84c9409585bf63297c3872703c9 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/49cd9e80c63305be05e0958d9c42f43262b38a75 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/40b236c8d49ac9574496070ce3514abf8b7b4d4d |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/77add53d84f099d718740ecd53a8d848fe87f21e |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a74cc88250a100e944d5430604c9b4d728df478a |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b09e4a9952f06757f2af1e98573e2511ece7bed9 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/75aa8fad51b20489f5de522e97fc498d1852f651 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/91b0d6435e323a86d8c26507ff76df269c1e39f8 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b51e094cd3dd6fe09da87a22822752b23773d1cf |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a75ecfd72ecafba93432fa3c831980d2a3deb5cd |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a13a0dc8f156d30fb5a739ebef20e75fdd5ce8fe |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1be422a35c3e9438342eb1db320ac3991191f39f |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0de816ea801ca3ccdd49a04a7603c4b1375eeffd |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a705d9349c1cea9b27231108673ad90b2ebd2bb4 |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5a0597cdf9a7e59e7c6584477aa02a00ee9ee611 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ac7aaed1c540e8c377cfdd1227b00afc65468a86 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b1f4b8dfc20ff7887cfcb4cebda660016a8218a5 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/295991c66d936b8ad5c7aba042511b199c77dae3 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/43b15f19a42c9805f8068401342bd5a30e1bf06d |     
    sh4a     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/856cc67fa863b42829023efb7c0d56192d5a15f4 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/689f945b5e67b8e10702bdd0d740a0cdd5473598 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/857d4bdb95335d15a4df4941991a0fbd2e800c23 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/714664b7e5b82fdc9ba37f6dab31bbfb49b5dede |     
    sh4a     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b41c00483b3ec7563d836bca9f62024d8ec81704 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f3aafa6f6127cc74465c4de5f7055497945ed8e3 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bf42362c7f7891c9b96dbb14e2ac0928f8b88b0a |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8ac3a9d8697713b6b0f9e582870efc5631946819 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/629c0f08230af05ccc71144ef5c0c89ec5821210 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e5c3174a1c5f05163b6c4a3ebce024e919b1c95a |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/562e43dc7be8635b04a32da850f918de64351abc |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/449f097ab38d3cebf62eec558bdd6c5a69507109 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/befc5222318c45d6a3edbf209881f76a3e11e8ea |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e482d60cc92094648f86881d70b2fb3e072e4c6e |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8f7283fc36807a85acc0a43eab2966a5da2eada1 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a75b2f2c38fdd24daa3997ad6fb9bb48449890d4 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e778e664fe2784f613bd83f4d37c1d5171b4824f |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/fd63b18fc181abe25db114897f530dfc625ede78 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bb81585b848a2ed3b59ba0b4c0a75b4f9c6a4207 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5c8c0c96f33d8b3f241cc14c0b3e834c3e4eef91 |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d7bb1d11c490dbca11454f578ef868b2dc5694a6 |     
    sh4      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7cfd97139dcd6b3ff82aec31a5158f220252abf5 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/76d801b8f9dc504b88015b764c776449cac1cd3c |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0e43e112f1a1b2a6c63254c753e49baf2eb84c06 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8eada726bb26bb5d9c38357cabe031ce3d190fb3 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c758add397bcf6f6000a0d205911b0db7317400b |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5e517e59ba5dd769d3f09316a14e0e895efa6f00 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/534fe0f89c4b6525e66cfaf69b516d17b1c1f4cc |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3bf913d32c72140c3fa5b7c748245735f5bcd99f |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/89c97511c7cb4f446bd556776aecba47eaa4aba3 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/21efd02c96a32bd361d04e047ea1f541e053821c |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/619bbd95961ade9e5e4f173df6ba9957f19b1e42 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e9a8fd7cd0c2f16f8aa94c7b0a424a8e9504e230 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2945c5096db8957cc7dc4af6f1eba48b3e97141c |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/78357a3229789ed54b52496bc1badd162f100404 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/74388e7cc429b405089ce74b1d73cf419a201f05 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4f1334f6f601f2f213f3802924e8e6b67eba8dff |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/31750bdf5d242c4421f29cdac30940b8dbcb903e |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2008ee037ca5fa2d5963c95b6d45de8a6560227e |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e381b481c5a6c1b6efb81ead988c0bb55789eb8f |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/defd227d93325556d838611d2ee48db14109107b |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/db4962211fa6fb8d3492ffffff2634423bce9f9d |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d1da41413dccfb9159844512a4b8554a267cffaf |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6b569d4834403df53a4208aaf33c00a570a7343c |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/cfa940e2502cadf2e77f08ba8a2f078255480df8 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5f0a335a898db7d9e54ef2e4c6f4c6a4952e92ae |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0e1ec4ddd09fd04f96183fb59d956d0f324d19c7 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6deea3acf4aa843679d61d064813a44182b7807b |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/02ea0e617bf254f5cdd79174d5adb4b87f71edf1 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f1a5ed89b1b1ea7e69f39a73b9eb690526396c7c |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1b6675b06ebf18ef8db357f8d8820f90af419899 |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/11ef4ce800d59624c653cdb86ae13721bf506828 |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ccb818b57da08c1e53d48b88f0a212dbd891004d |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b759a7cd09590a13f18cd24c413f11ad2a2cd0c6 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8cd0dc2ba8564ca728259ad6589f3e7c59ebb686 |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/fa956f444953ac0fc560883965f812d28f15be73 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/afd76ff875afca3933a4300acf7eafc2e313d4ea |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d57fae3657f5d82e16b471c3379cbb3b16044054 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/eee9e9223d8a04b45771d619620b684374379e79 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4f6f78c1ead44dd3a23c7af8b6e3a80da12b20b5 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8609cfe2e4007a2d47b9dd8c2ef8abb6397af344 |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d23e56233695dbe382bfd36ca30cbf27c407580d |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2a63c38ff1a3d74ecd823f165097d38ce4e18c8c |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3352d2cc35a437b73ed88e638fc3a648a0cb0e45 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b453707a4e7fca72df84bb71fdaedd658bcedc32 |     
  riscv32    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/49b60dff1984f77706068bf963cbe3d3a2ad0d51 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/79e097a3cfa7eb57e50b00febc16e6ed92336b22 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d13d8f1d948cc4c40c5489f1021a1d4c60f2c4d7 |     
    sh4a     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2523eab091e5265a78165d9892d7cad823fa6864 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/48d4cbe3cae982b0086a3669e86791fc2db6c50c |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8ac1a5282020c68db6ba628cc98e9f3205b0a3d4 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/815bd009578afafb39b4b38cef8a4dbb92b9c932 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4c6c207feafc1173c2d6d669002e21146fbd10ee |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bbf9d82ee0697db3cbc39c72c2dce28947b8e380 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/da3b34db4e1b93b8bf51bc1d482a3323c9bd35f6 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2fc37a889249a7f373da0cc229fb40b3c0cbec6f |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1fdf3088f214238bfdb4b5f10cdc08d423529aa0 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/39bc2fded38181edd0ee9fdbe48067d1476f6228 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/66a2d2ba70a1de14c9df2df9a18a2416e60352ee |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/87565d9b545fd4ce31af9bc221aa1664181a906a |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f73bb1668a9c4061d19220fc2bb5f0d7abeddb8e |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/385bd245642ea3095e6c9fae350926173e21983d |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3557ea1f6808710207aa77c5f7c23911afcd2ef8 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/62eaabaf12661daf0a958f1f05586e67e44dfd39 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/416c0873f94af942c40ecbf1fbc3b872aa410531 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5901ff975439b1a78ba94a6446587c2263193b5e |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d97b2cc815c5f5e00fb136cfb62fbd81022c3664 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0f7e47cfaa14cbeb45c72a35c7e45e4b0c3b00b7 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/94dc97961523958769787785dfd73ac16d883bfd |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/932b7a1d065694525a2edd457b3b4c27d1b40b1d |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/af4fa96148d37303c93b1f05f41ed12d2139261e |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e24c88d7c3632e2d78beb27bb8c11f4358df8f27 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8a9445e81d7f3cc350eade241ec19f86fc0221bf |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6661a7188e4fdd8e4e2235cfaf9e9643f09c34d9 |     
    sh4      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/cd1bf9874eddd73434eb013cc5aaaba0e55ef9c2 |     
   sparc     |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/fa1dd7c6723fa58bb3318da9eef98e9a6445c72b |     
   xtensa    |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/32c843a5c1f940599bfbf29795eba0702172e641 |     
  aarch64    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9c314ae810444943c8d9bbae0a99d92f92397027 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/769ea75055f219bf0dac865404a84edb4e16d71e | ORPH
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/58bbc3f258c9919e1d2bf47136cd26db4eea6204 |     
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/5f2cb090bee87fa41cf21b6c7ae2c34759f08490 |     
  powerpc    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/1d4abb57ffd161ef1f8d0c7046e6ce665a3a97ac |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/5311d29a6dcc8cd9d3ed2272084d56c9c35de8ca | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/88edc9ab1f6e43727a7a2b92daacd5cada242d96 | ORPH
  riscv64    |    docker-cli-buildx-0.11.2    | NOK | http://autobuild.buildroot.net/results/5a501ebd4e5f4fca96410f2151ae01b1bfd3875f | ORPH
   arceb     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/9e1c80f7c9c5b63c7987f9b7ebf67d9745191b7d |     
  aarch64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/916b5b4312882b44174470388e01081cafd317d2 | ORPH
 aarch64_be  | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/ffdfefa5def8aa85bc31aeb29ef592b725f1628e | ORPH
   arceb     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/96388e62ce1a0810f11556e4ac6751c5b625653f | ORPH
   s390x     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/c671db250eba37cf924014244a69ee3887632c0d | ORPH
   nios2     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/fa762acce74d563c219483be90f17e89f4916747 | ORPH
 aarch64_be  | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/c36b3860afe4e7c158a57f97e590e0e3b8ac4df9 | ORPH
   xtensa    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/297a654e1eff4961be2e2a7e3f9a417259476c96 | ORPH
 powerpc64   | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/7bf8732583bb7b6f252a27d32b5482ed9c6e3fcf | ORPH
   xtensa    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/8c3505be81748ef00e08d6ea352091939a3b1faa | ORPH
 microblaze  | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/31186da82d53cc67a4b4f6cfec8b928d9db8f2f1 | ORPH
    arm      | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/c7419ad9bacac45575e7f2b44588587fdb5f6618 | ORPH
   x86_64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/1b3612d5ca03bdd2925ec3217d00ec6f87dc5e4d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/76443f9d746fa259a971b8d6c47472e849da2f01 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f19737771491f065359089050421f8902e90c118 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/eb63d2f3abe2f84070bd39c4efdc6561e61c642e | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f1367b352c1594c172b14ed6d20cdfa259c5306a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/027681ea31733c88f68d3544d9f6394df91321e0 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/403dc75dd5662d0e3ca6674a01f1935cfb2683c2 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/437aaffc496a1129b97294ef0b04742b6d750835 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9d93021d2de91d15f854fc2f634638876ab8ff9f | ORPH
    i586     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2d2dd6adc623b88443e0f6bc7d09f48750ac240c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/687417f2a08e309c54c39c55d7cb26e9327eac1f | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8121b2577b26f771e8fe6f1c78e3f91dc4df80b2 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8ef24861aa2865b2a26def97b116bce22a8c24b9 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/40f2fb1bdbf84c6853f0dd959a328c320fc000f7 | ORPH
    i686     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/66b065a1bc79e80959d0ae5790997bf999793f8f | ORPH
   mips64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c7053243e77a152363f381ad65d2cf21a2258abd | ORPH
   sh4aeb    |            ell-0.65            | NOK | http://autobuild.buildroot.net/results/3958b5e7e139f5de10792f5d39921b22da69e8dc | ORPH
   x86_64    |       erofs-utils-1.7.1        | NOK | http://autobuild.buildroot.net/results/a56d5917b5a1e8c75368349f75ec425aeba1ff15 |     
    m68k     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/bd84adc08be21432508a92fef6595d2e112fdd54 |     
 microblaze  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/f709ae09780a580c93d057aa0d72efb19d11cb25 |     
   x86_64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/546d832d83f180e72ca400b673f3bab026d68155 |     
    mips     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/1a2856dcf20191bc4f158ce1ad4c028a0166fa0d |     
powerpc64le  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/b94daa46a77335c0aaf12afb73711f9cb9bcfee9 |     
    arm      |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/9b2a4e002521ae9a7083303f9a585df000180970 |     
microblazeel |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/6d4f0e51ef7bb7c7819586afb6491c126cd3420d |     
 aarch64_be  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/a520583be6e86993d268d6535f727a352bd92028 |     
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/9ad421925c2dacb9841796aeff030a9228933ec7 | ORPH
  riscv32    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/85a6df91ede5b0c957d7ce7415599354369b2edb | ORPH
 aarch64_be  |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/32692672be4eba8b3da4771264ffa62e57517f29 | ORPH
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2af330b9a5624995feb4a9e6e70414e41a8aaa64 |     
   armeb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ef642c210b683bdc979fe33cb858592425dbf356 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/baa4779fe0aa6ebc503eadaf5bfa0e5a46e4c8d1 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5ac341442d833cb31962b5e6018cd6df4101aae0 |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/608d2d0751fb6acd8dcb51567576bf9dee11ed03 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/061667ef3af5372c6f19990ddebfba0fd0cedfa7 |     
   mips64    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/dd078cdf250da978fa83af60930f0b0054117d36 | ORPH
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/6acb7b1ce0029cd8d46addb110528ae560d7f4ff | ORPH
    arm      |           file-5.45            | NOK | http://autobuild.buildroot.net/results/fb97a88eccc41361694f59d931d0a660358dba1c | ORPH
   mipsel    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/685b02b9eb03eeff39cde58f440f18d64d09b3c7 |     
   mipsel    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/a7364baea29319c6856c1048ac7fb9fb7131d862 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/e647ee5eb6dc871bd6f58db941894598fe54aff2 |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/4b6ada46ed27b4a5c06f760b20d9377b8d13b10e |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/ea2064501e3664621e4ceb8364e2ac82efcfb860 |     
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/5dae3ac321f1281e04a488c757832c5eba4142cf |     
 microblaze  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/27164f2ad656d8a9ac893cc0990b711f0dfd12d8 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/4ac6abacb5028d900d0042a48025bcf092f074b8 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e08a0aa9f1619a1a73d20305101d2191ed0926cf |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/020a46e1bff00dd35645ce72ff8c423ae716abbc |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/d9b8ff2d1f323342699841539e803d1348a79247 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3da9d0688f3657fd6141d3b8018dece72b95df9c |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/bd966df86df13be9bfe220bfbbf5b902c31ce7b2 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b3184e8c4e836a7f0bf877e9bf0c153b0a36665e |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/05bfea95160b312367a2151a42ff73c1e4b804f4 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/02e8c8759fcaee46cf2c406f630ece8083ef62b0 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2baa4ba51418677ffc3adf7af21433cbaf7cfa9e |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d3bf30b1b39538a61bf07ea0bf8e393b56068cff |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c992fe6a794c4ae0e52c42e6b3cddd83fbd68797 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/aa34b6c63c569b8509dffb0e9596362fbfe5e7f2 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/412f8709483295a7413db5e6b4966aade387de87 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/1939375e98d3cabd1b1dcbfd37fe20b0cd337818 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6c91a06df82c972eda77b8a05abd3e0cc35fd49a |     
    arm      |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/c42bd085a968fe631c1124856651e15340e8d179 |     
   x86_64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/fb27f0a448f905fc48fc4648711a6a5c946322b1 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2acff064128b7865bb38aac708a8f87abaafdd67 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/52198b10522fac8fea5ea7ee2769b62a93c39414 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/236504aab23ba4113afac6d80aaaca7cdaeaf4b6 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/751f3cd748bbe3e180eaad1183a21f8ee0995594 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3fb85d5c163eced673786e4b0d5afe51a4c135ca | ORPH
    or1k     |       gtkiostream-v1.8.0       | NOK | http://autobuild.buildroot.net/results/91a15a7be7eb81a2f782a08f4d04a259b9146cd3 |     
powerpc64le  |       gtkiostream-v1.8.0       | NOK | http://autobuild.buildroot.net/results/5351d3e372a061e16b957ee05515c41c1f55a1e7 |     
  riscv32    |         highway-1.2.0          | NOK | http://autobuild.buildroot.net/results/5a957dfb02a6d5fe2aa24c7a044037162b3e5a21 |     
   mipsel    |     host-btrfs-progs-6.9.2     | NOK | http://autobuild.buildroot.net/results/7bf5161a86dbef9a73eebf7f7a1d32054af2afb4 | ORPH
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/68bbb998ec4e4011339449862d7a4d28f28c923c |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/f495b6809e908055c68a1613b8796e77ac2d482a |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/18684a929327c28d05f3744f913d761807fc4bc8 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5d6aed29a1985114c21a2a285f35b810a243b32f | ORPH
    i586     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/7e44bf9075236ab1159cf7cefd8470fe090a46e0 |     
   xtensa    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/4eb9fc60b42c7ed75fdc44f893fded9dc4cd4e7d |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/d8de124c9c0ac851cea80ddb86b3290f1955be80 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/fc547ba63450ea3ced118652b34e8546d0bb0414 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/bc4588bf63d06621236d087ff01a3f48fc3303d5 |     
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d109665c7650ceaf4dc9c2e8df59103db59080ee | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/066faf7578587218aef1c164ced437129793fc95 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/63f0312bb6a15cd3b4945b24298cfaf806dda00e | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/caca40748538339cee67d0f3956accfd78aff19c | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/94c618b81c95c2f4f36ae0f27e890b90aefe683d | ORPH
   sh4eb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/be31aadc8122c5342c3ad50b4c3500db05986812 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/46e0ab2e85a4c76cb59a2f25810f91655f1aca30 | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c30cc9c809f9420256a9d05035e42fa268152d36 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/10e3c0178d4ba7c81cb928d4da701f07ead0d252 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/08cb801e01fadde5c857475fd51b82a49afe519d | ORPH
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/92307f562c67d597416d5aeeef51442aa8bb3f74 | ORPH
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/2f8a092bb74411a62f9bf95a6d9b86dfa575903b |     
   mips64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/645dba6a1f8f8e39d7e3b11da7c21dda60b2c483 | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/ff77de5ac02935f8d47a6448fad1c35cadb588aa | ORPH
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b00f76faf237e40f71f3e2511de6bf319ce1f30d |     
 microblaze  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/dedf2934b831a70e488dea3c6af338fa75d9fe4e |     
 powerpc64   |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/26e5fca346bc3cf6e471a3f7aa77b8e0a7696430 |     
    or1k     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/f8e2d37fbdb407a46d496b6ad5111e945b293ea6 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/796ac452bdfb5ff7818ad846eb4865e46a36d561 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/17c857d7636e227728d10d4cb893ebfd313ccd71 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ea7d448c4b33c7998caef6705040dda061071b29 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/744c9f79b8cae6b8ad20cdb4160815317c3a7c56 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2b5f4fa4554a065fd8d885366664cf8b7689fe54 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/15f4b67ac945f16eb0752d66766648757a4ce9f5 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ea91387898e2342a13fd58630096b8ebc033f0db |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c8b0b9340cda605b0e9b209c5a0aa4585245dbd9 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2ceb1bd317c9c83127256c87adea75f2e873ddb2 |     
   x86_64    | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/cef6b231d97b317cfc5b5324621f762748751ede |     
   sh4eb     |      imagemagick-7.1.1-31      | NOK | http://autobuild.buildroot.net/results/7dea8086aaf2731ec338c2d501b5a8f8efc80aa4 | ORPH
   armeb     |         iproute2-6.9.0         | NOK | http://autobuild.buildroot.net/results/aaa130ee40b6a2ac87f27487bea891d2e026e8da |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/ca1d09f345353352f23093296d1e387518895538 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/63169f20b3612344548f17e097d0ebc77869212c |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/8b91bed778e6071d150940c787e02ee43f325502 | ORPH
   s390x     |         latencytop-0.5         | NOK | http://autobuild.buildroot.net/results/c0feec63c726e3998a24a3c25c2e81c77f36a45d | ORPH
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4b2501c3cffeb59b021077902bd1a2edae4a38b4 |     
    arm      |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/314628840fe3bd8f9996ebef24e08cf31e84b26c |     
    arc      |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/6d79801d7982665e2e528e30d493eb507adc4879 |     
    mips     |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/4b1a48ce96714d122fd66e9d97d4122a6dc6c96e |     
  sparc64    |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/aa94e36a3941957cb88bee84d373b75d2c47d84e | ORPH
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/48bbda2379ba389eb2a57bd9cdeb164d6697c76e |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3bef2141daf9dea93eadbd8d65ccbab78e740db6 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0848d6a4bba7111457fc999244f87003c67fcd4f |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/65fe25c46d8eae24bcb30a092adcd17426fd2233 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/2825a04cf137a65ead1baf28848e602e2f984e9d |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/3cf8ba2ea09472652a58de80a31dc2eec6b8d88a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c5316a5c767a2121bf750eeddfbf7fc6a5069a4e |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1f42f40f5bcb23409dd9df1a38719c64120fd408 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b76755952819f20698d5ba51bb749bec46706fce |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/02f1458b7a322a4cb638267135ebdc5bd6b5f92b | ORPH
    m68k     |       libgpg-error-1.49        | NOK | http://autobuild.buildroot.net/results/bb670067501a2734922da0b2baeaf12eaa46ccb2 | ORPH
    arc      |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/517a327a56354f60ce98542d57a9646fcc7cfa7b | ORPH
  aarch64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/85bdbcd3d7494a941b712c4a7ec881687e1342d5 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/132f27b8ffdc8156d7a1981588fc34a923a11b28 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5ec00525e9d8c1886f03530cce09971bfe1cb21e | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c0067dbf8feecad0133ad454d2f9fa64c4d8bc21 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3c37c9060d3b5018874d7152ee8260be246b97a4 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9f15bd34648eaa46115eb27e2403ae2902c342e3 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3aff5147384ea2315bedc6de1d15c3b28e3c9843 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a32d47b4d2f12bb8e78d6ed74b644d85248e854b | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/fe826477dd131925f38e6c6ba3e8a4f74d8acee3 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/42b05f02dbacf544a62c5174e84974c7c455f0ec |     
  riscv32    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/4af6ae3876048a43b8b0cc52777824e67770b984 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/f27e1e6f0739126ea6c03bd6aee1e0c89b814c6b |     
  aarch64    |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/4e71a4478271cb46178aa5f7b2eb30777896fdcc |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/c5ed8811b277a3ecba57f1e211901062f47e54d7 |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/e3ffecf2c36bd1324e14fa2902b61a29411e0bd3 |     
    arm      |           links-2.29           | NOK | http://autobuild.buildroot.net/results/a8b8546b65bf466733a19c22332179bd8f7e1424 | ORPH
    i586     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/67c271b87f9405f5cd2a97a25c18524476550b5c | ORPH
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/1787bd118699cf45d5b743457ded4d8412e8ee8e | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/29757bf04576b01c5caa14209bbc827fb39c9113 | ORPH
   mipsel    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/c9b369f9cc5ffb865b943bc21b8e445675c6bb35 | ORPH
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/33e646d4143a90f967b88b94fb3d08e820958891 | ORPH
   sh4aeb    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/a656a2ae92b67a8dd7e6fe2b94643eccf76ca484 | ORPH
  powerpc    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/91468479a7cdc6d17320405e7bca241246847ef4 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/94fd3c3f30d8f38ee65a55134ccd91b72732e32f | ORPH
    sh4      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/850485095d7e81615806a16dd2e7c9ec897d606c | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/fcd621c6f19648101be84174c7111abc1d62e6cc | ORPH
    mips     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/05bd643a58a683d8a3f6e6fc106d41a9ff1c3eda | ORPH
    or1k     |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/cd9f5fa536e60926616e84549019a5754e88e9b8 |     
  riscv64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/e79e9d0844e530ca26d8c915c372f6d7e8b50c9c | ORPH
    or1k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c7539b804bed8f81afed6f73a980c98638982239 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/8f0fc40d4197dd66939a01e2317daddb0af3aa83 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c438208185c15065df8c9cc99e93466a17c212ca |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c21bceccf27f00646c870c8a29c3815791679ed5 |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e14b8277694fabb87f26eb524e12cb557a1bbeff |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f84491efb9eb869bfe6c6471008a0368688656a7 |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/73f044f285cb210ec68d19fb05cd31b9598af1f1 |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/73a8da0f4e6b1f9533af2a448f3f5993d01378f4 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8f0b7fee4bb68ebc5b8bf1db34038522787830e7 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0fa039a264908eb4cdae094960350fe6dc52143f |     
   sh4eb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4274f54ecaf6cc02fde49633e81b90e617eec367 |     
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8d48139f533294aa23e7c7c32f8bd1459397ca90 |     
    mips     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/83623d61603e6bbf62f7060e615524bb5aed8104 |     
 aarch64_be  |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/6f80459bf7e06af21a9ccbcbe422d377691d32ea |     
   sparc     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/b0b49491b8f566f7f139975d3007278dd2419341 |     
  riscv64    |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/3965158938ad6a9c855e32d363c5d87ce95b510e |     
 powerpc64   |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/ef4a04a8f14b0f657ed4b2f2ae2fdbf1bb20508b |     
   xtensa    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/5d40a4c99605c031be1efb601b2b3640281b83ef | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8737065851dac54c72855b0cb88ef7e119f52e93 | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9e879ba56cb7904b292f7431c75d69cfb5e41e12 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/32d594da7198229edcc66c99327b4c1e6e127de1 | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5ef8e3054e506f959483f5810d59c60b91337a8c | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9819a54e6575eb53d4ee293a4a566bdf33341e8b | ORPH
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/81e8df340368ba6de8eeb0a0402052caa66c7672 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f01961813d8649dbbbcf34bb4acc0a6f8565f2bd | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/20cdc5da9115a1224056ae4c56bbe9b47d60765e | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/02d6a466bb8f4e60556fd21af95ff8e4a60865bb | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ea2b00a7257c03b4b64bcc5798bdd500fab38a2c | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5da46b820bd48379e80bce44d723a1bcc8de336e | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/1d693a3d2329cbfd64f75b1bcd299516d31fd043 |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/bd0cb101b366574d27144f0634977b7b8a33f122 |     
powerpc64le  |          octave-9.2.0          | NOK | http://autobuild.buildroot.net/results/8447188a4665de1af3bcf92223744f07b84542ee |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/5721ec6284655d3a2371dea98f5f63c9ee8cbf8b | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/636ebefedc39a37dea5a4f40633a4478eb9d8901 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/421719ba5ac9d7c66d76670a5a3ff70593757f09 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/1f141152dace8a850bf8e202bc5fcac985809e31 | ORPH
   sparc     |         picotool-1.1.2         | NOK | http://autobuild.buildroot.net/results/0bb7ea550e02ed654acd0bac7a42a5f8e13abb13 |     
   armeb     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/4aa486c07a5c89da8b78ee65d6b2b9cc7d64ba00 | ORPH
 aarch64_be  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/62d98b698e035625f60d4e54efdf40dd3d30ba2b | ORPH
 powerpc64   |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/584a9d768f799bc929103a7bf616645f68b01ae7 | ORPH
   sh4aeb    |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/331842780f41ee548b6844fc2cab940c5ae256b0 | ORPH
   s390x     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/a0dc691e39795a6bbae55148206a4c246f0336ab |     
  sparc64    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/b63cb3c39b902facf846eecb0408cf2436b11177 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/e0498bbffd8fb09c5a2e7af6db1741e7e195446e |     
powerpc64le  |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/80114688ae1907612bea65e434046baea9079838 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/81a83152ac70ff013eae5fefd804636d98d324cb |     
   mipsel    |           qemu-9.0.0           | NOK | http://autobuild.buildroot.net/results/38cf4d1749fa51f88943f6ce283547caa2c53ee1 |     
    m68k     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/d7ac566bbb57897da40e245bf7d68ac95b9d0b78 |     
 microblaze  |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/0fc891fb58673e5ef9127c90087aec1aa14009d1 |     
  aarch64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/935365e3972d4a4cec13fa844e15d99502223c5c |     
  aarch64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/6e5879f1688c9481fa3ccebc50e336ee914301b7 |     
   s390x     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/464a950784a085931fe2055be791c99d8c7a9690 |     
powerpc64le  |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/f0063c59b6ba80ca70de4aa8b4682509a8e83b7e |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/206896232dd9626b6af35ed607be9e1583bccc7f |     
 microblaze  |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/9369f7c5f42f421da6f84cb7c1fd94ef664cb1e4 |     
  aarch64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/8ed96505be04bfca2672a851338c8ce056efd8e0 |     
  mips64el   |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/c0c71645ec39eba41ee8e415bcdc5d6145b4151e |     
    sh4a     |          sysprof-46.0          | NOK | http://autobuild.buildroot.net/results/42a09f555c615db3cfe172bc93a2d67e6b19ca59 |     
  powerpc    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/9d8c7fbcc38ef0d90baea5f07f469351bc5428e8 |     
    arc      |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/d5f278fcce016405333edf887d6349f6cc8fd737 |     
microblazeel |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/e358d0909062cd7fd1ae2e604a7ff0c84dca1f01 |     
   arceb     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/f5993c80393ffc430a82b1aa213d6e7e298c1a1d |     
   mipsel    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/dc21c174057b599093083b3e1859afdca5fe52d3 | ORPH
   xtensa    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/16e23f1d2743b6496707763b71f032150e79b465 |     
    i486     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/a3aab356abbb960f2a9d23883362a365bb619a1a |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/f9efc2d57f57075fe6ca5c29661c4917a399485b |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/2deb2e875b93cff867c73701775dd96484a73222 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8cac3283b74670ae04bd128f73749e3cd4ebef57 |     
   mips64    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/43ea67423105d557f946101adcb479cab21e89dc | ORPH
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a5299f6109a20cd7fd08e233109abf75fb7e5bfd |     
    i686     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/920cd8c54839cfed6f569e2d8d6c484109322029 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 host-tar-1.34 | 12
                    zeek-4.1.1 | 2 
                 dc3dd-7.2.641 | 1 
                elfutils-0.189 | 1 
                   foot-1.16.2 | 1 
                  linux-6.6.37 | 1 
                 shadow-4.14.3 | 1 
             util-linux-2.39.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/782385b9dee79b18348d8cde94db897796db697a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d197a5c18fca4157b8e17c0e9345f16a0348481b | ORPH
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/0667d06219075fb485f361cf7d6f64755ee650f3 |     
  riscv64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/19fb7c14d8e9d8efe666c52f3c6c633c865891ad | ORPH
    i686     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/053c078a63c561dfd8e3652a6b2302b1fca4314c | ORPH
microblazeel |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/a069439ed425af6f6e13991c6d6e5d6d69c22aeb | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/17b7987282dadefadcf782609c0ff9a04ff60d91 | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/a8d7331f949ead74165523cf4c9e26852feae754 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/6b7dfd257ccda0fe4b8a0c80db1b5d1419303aae | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/ac305497cdd86ce78bcee87d64cd720157abbb60 | ORPH
 powerpc64   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/bb9843aead626df6e2cf57b2ba1a75a62bafd997 | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/6cceffd80f7a102f6603c123f140294979a1cdce | ORPH
   mipsel    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/353ebbc9294280ce7508a453ae293e03dd4e6b85 | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/023bfd16b93504da03d7b97331b0b1913b513daa | ORPH
  sparc64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/7f7bb8b7f6be1c02cbc3115d20f084b79c317eff | ORPH
    i686     |          linux-6.6.37          | NOK | http://autobuild.buildroot.net/results/fd7417c1b4f5d250bc88563e27aa0534ba78ee11 | ORPH
 powerpc64   |         shadow-4.14.3          | NOK | http://autobuild.buildroot.net/results/3b275ba9bc3f27cdf8134ca3738d0fab4b7c66f1 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/d11e9acd50cf751d937101642bcd81371d87b525 | ORPH
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/e61f14aefeb7d47e578d3a7c670173598c2e2fa4 |     
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/fb03615a503a61aa031ee789ad12ced0491be2ae |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

toolchain-external-bootlin-... | 3 
               alsa-lib-1.2.11 | 2 
          libcamera-apps-1.2.1 | 2 
                  linux-6.8.12 | 2 
                       unknown | 2 
               host-4th-3.64.1 | 1 
host-binutils-arc-2023.09-r... | 1 
          linux-headers-6.8.12 | 1 
                    ncmpc-0.49 | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/d3c0b198acca3ced10f86f9e1278866ef2bcc4d9 |     
   mipsel    |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/69e280453f36994212d20cd96459a9fe2f440ca5 |     
 powerpc64   |        host-4th-3.64.1         | NOK | http://autobuild.buildroot.net/results/17577e52e58c5d23dae8c42185153f79545130e5 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | http://autobuild.buildroot.net/results/bbbe00244872ed2c96b5fb05ce932a262d121ece |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e5f86730b32e8d5578f42ea912332e4d657d9edc |     
   xtensa    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/05cad35ac485e464dfae7daa33f0297ce9cdbdac |     
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/c330741f01f8332665fad7bc4faf15b8d8c55d83 | ORPH
 aarch64_be  |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/ad45b6ba3645066f451b4ceda3b75222bb636f66 | ORPH
    arc      |      linux-headers-6.8.12      | NOK | http://autobuild.buildroot.net/results/a2962d9bdb7a513d7b59a8680025fbe7753f9924 | ORPH
 aarch64_be  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/070aba0cb6c86275f0f44d21450861838131e170 |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/21db3c14079d7ee635a6d1e015f12718cca35af0 | ORPH
   s390x     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/96def33d78e0d81a1eb05b3f753f76f8501fe394 | ORPH
  powerpc    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2d37a5c3f0e7dd1c3ee30bad64afd02a514c46c7 | ORPH
    i686     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/634cf8439f35b6d325bfc7e600d32a8210f55d16 | ORPH
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/9c9f7e92695cd1164f5525015677d838a361d7d4 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/d65d8d461de314841eed5e22e91f646a746260df |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
