Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35628C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 05:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6FD781A5F;
	Thu,  1 Aug 2024 05:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1U-gh7BruAlg; Thu,  1 Aug 2024 05:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B5A81A24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B5A81A24;
	Thu,  1 Aug 2024 05:29:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2D881BF25B
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 05:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF8BF40926
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 05:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngupOOHzqTre for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 05:29:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EE3940903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE3940903
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EE3940903
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 05:29:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B76FE000C
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 05:29:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 01 Aug 2024 05:29:18 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722490158; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AlAbvWrsvXQv1SL5Ge+Vsnji6QHgrwii8o2XUVQUHcA=;
 b=mHYIhAxBwkETR/XaME3ko8F1fGaDAiYIgW/nKVhLW6XBP1toYGPEKRmbWGUVdMdjs/2Ozv
 hL2PMmqtVt39kImEiBNnh86BHqVXk6MOxDx7mmMi8PkEz5WpK9DCbEcfCgqEGQbUWC1cN2
 2RZovV7W0Sr23gXmrQnF5UOcnSJCnlbKNeJMHfaLBnEK1FATTjVrR/rHTB+xkL/6A51X+I
 zL5REHOgb9ERFLI1j/j2RavWiRzbFezARuomruTEzIYcfrel7xVVMfW47wVzHPn5j0hG3J
 YIFzoPrmxRbgdOsNtOfabc8RZa22pH/KxjBwjHVCVc1PKZutfvZJrdc9fHOtng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mHYIhAxB
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-31
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
Message-ID: <20240801052918.XX0SCSjSP1UGzAzTn27Yg0gLTJ7gAbNEQooWcutyI3k@z>

Hello,

Autobuild statistics for 2024-07-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  1  |  0  |  9  |
  2024.05.x  |  6  |  8  |  0  | 14  |
    master   | 65  | 153 |  0  | 218 |

Classification of failures by reason for master
-----------------------------------------------

                  bcusdk-0.0.5 | 10
                host-odb-2.4.0 | 7 
              fluent-bit-3.1.3 | 5 
               procps-ng-4.0.4 | 5 
      python-autocommand-2.2.2 | 5 
                     avahi-0.8 | 4 
glibc-2.39-74-g198632a05f6c... | 4 
                libressl-3.8.4 | 4 
                  linux-6.10.2 | 4 
aer-inject-9bd5e2c7886fca72... | 3 
                 dc3dd-7.2.641 | 3 
  gobject-introspection-1.76.1 | 3 
host-heimdal-f4faaeaba371ff... | 3 
         host-libxcrypt-4.4.36 | 3 
                    norm-1.5.8 | 3 
                 coreutils-9.3 | 2 
                  ffmpeg-6.1.1 | 2 
                   foot-1.16.2 | 2 
               freeipmi-1.6.14 | 2 
                gerbera-1.12.1 | 2 
             host-delve-1.22.1 | 2 
host-go-bootstrap-stage3-1.... | 2 
host-vboot-utils-bbdd62f9b0... | 2 
               ipmitool-1_8_19 | 2 
                  libffi-3.4.6 | 2 
               mariadb-10.11.6 | 2 
                  mender-3.4.0 | 2 
                  ntp-4.2.8p18 | 2 
             parsec-tool-0.7.0 | 2 
                python3-3.12.4 | 2 
                 uclibc-1.0.49 | 2 
                 apache-2.4.62 | 1 
aubio-152d6819b360c2e7b379e... | 1 
  binutils-arc-2023.09-release | 1 
                  cairo-1.18.0 | 1 
                 chicken-5.3.0 | 1 
                     crun-1.15 | 1 
             docker-cli-27.0.3 | 1 
              e2fsprogs-1.47.0 | 1 
            ecryptfs-utils-111 | 1 
                elfutils-0.189 | 1 
                     file-5.45 | 1 
                flannel-0.25.5 | 1 
            gdk-pixbuf-2.42.10 | 1 
           ghostscript-10.03.1 | 1 
                gnu-efi-3.0.18 | 1 
                 gnuplot-6.0.1 | 1 
             gnuradio-3.10.7.0 | 1 
 host-binutils-bare-metal-2.42 | 1 
         host-gcc-final-14.1.0 | 1 
              host-runc-1.1.12 | 1 
 host-softether-4.30-9700-beta | 1 
ivi-homescreen-5ab78a19e95c... | 1 
                jemalloc-5.3.0 | 1 
                       kmod-31 | 1 
               libcap-ng-0.8.5 | 1 
                libcuefile-475 | 1 
              libgcrypt-1.11.0 | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.3.1 | 1 
                  libva-2.22.0 | 1 
                libxml2-2.12.6 | 1 
          linux-5.10.162-cip24 | 1 
              mdio-tools-1.3.1 | 1 
                    mpv-0.35.1 | 1 
                   ncftp-3.2.7 | 1 
               openblas-0.3.27 | 1 
                 openssh-9.8p1 | 1 
                 pixman-0.42.2 | 1 
               pulseaudio-17.0 | 1 
           python-daemon-3.0.1 | 1 
          python-grpcio-1.60.0 | 1 
  python-pypika-tortoise-0.1.6 | 1 
            qbee-agent-2024.23 | 1 
                    rtty-8.1.0 | 1 
                s6-dns-2.3.7.2 | 1 
                 shadow-4.15.1 | 1 
               tipidee-0.0.5.0 | 1 
                       unknown | 1 
               valgrind-3.22.0 | 1 
                    vlc-3.0.21 | 1 
                    wipe-2.3.1 | 1 
                 wolfssl-5.7.2 | 1 
                      xz-5.6.2 | 1 
                    zeek-4.1.1 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a40797aee8772c4b8f04cac88c4837f83b2761cc | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/1a1da91af494e7e1f2b46ab21df840c4c2a3a98f | ORPH
    i686     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/fd63353e0cff51ccd1040a645165ef23344df495 | ORPH
    mips     |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/d9ad0e4ed104dfde6875ae2e62e582fe19acbc37 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/e0cf97e45ff751edc1ce0dac488290b08a512cc3 |     
    arc      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/160ab49c902c6702c116757c8c0e879abba1be36 | ORPH
    or1k     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/dbf6809141f12654a47ef17d68d12ab6e80e493d | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/91f427f7775f2d8b33d27e23643f8db91e8bbec4 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/94b129a981523014949bc1ed7508f189e4a08ff6 | ORPH
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/330c04600fba380039bd25b417ddd8cacb9c91c0 |     
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/a5b5a0ffcafb96bbf6d9e40448a0a9b15da5a914 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e8e6ea12b677fea83cbcd97935ddd467d1fe339a |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/9df2c776ad8c27e8ac2d350cae6b524c033e256e |     
  riscv32    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/70de188ccb67101743384150ac0b1bb728f83b49 |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/729cb468c0fde250950d7cf27677f2d13baa8264 |     
   s390x     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/f2d9273e29deef7ce6e0632472ddf349369b674d |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4135c00e44c7575f21c1ba9cb4d4eae78c58435e |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/99f25f9b2232520b012bb1523b6d439b5e6096a5 |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4460f90b4feef0048bddf40bb854996ad550d033 |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/8dbe8867fd243c0a001d21d2e4c921e88b193eef |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/16f5fd4dd0e3fb0471decc02df0188442bde61c2 |     
   xtensa    |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/36faba6343db6b58f28ff8ff191268d32f19c3e7 |     
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4b65e59dc7101e8532f7ed4c7c5a4189998c48c9 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fda5c9f5185cefc13a6e35fd0669beb5d0033b39 | ORPH
    arc      |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/7c3276d5e5cca6a9424e70d7b4b5d5758ab73ec1 |     
    i686     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/41b32db7f9cbbe63190645a32a053e3bd35616c0 | ORPH
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1fda6c6b20c2c34e03c1c2c2bf50b6fb648ff0bf | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2b5e653b2fdc0119ad96cf10ca4ef88da3421f0b | ORPH
    arm      |       docker-cli-27.0.3        | NOK | http://autobuild.buildroot.net/results/2ff74093227b4edbdc2fff6b430082753025f105 |     
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/417dcdcd8faaa8a4876b2e12bae976bcb629c9c8 | ORPH
   nios2     |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/c2cf061aa1b05998331c8c07d2515ebb53f2aeaf |     
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b1394d19f9fb3d634f7cdab031bed64ad82c8be4 | ORPH
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8031a721a7a82296ce21437d45e9df58ded0c2df |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/24073d7cf9dde0f0387b1c4d95e14dd169ab123b |     
    i586     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/4c6f7d9c1d709fe7850a9229675b3447c04808aa | ORPH
    arm      |         flannel-0.25.5         | NOK | http://autobuild.buildroot.net/results/bd545f22e9735f8867bf878e3562ff6d6ab6cc3b |     
    sh4      |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/e8900d427dac62229d0ecf7e738e772feb5d4bb3 |     
    arm      |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/c83a57efd316a2567e6c71340c66a4f1f70925de |     
    m68k     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/d9b6e27b3c7cf932c5f13fad7e2d1954899d39fc |     
  powerpc    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/a6a746043451e0d2307ba5031e5e55fe5547554f |     
 microblaze  |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/42e0b68e14c7175c13d14c220bdb10f7295bd98f |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/497d30fc19b2fa057e6afcc2c9e68415820a0fdf |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/ab7a6edd505583f5bbe56fae1609db6a24288434 |     
   sh4eb     |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/6f679a5d5dda1b2cf50cd0281e7c7ed7a8c153cc |     
  powerpc    |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/9c56f179dafeb29c52de817d9846522fd143ec12 |     
  aarch64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/a65213703056b89d7d877c2fd79524de9f6d4baa | ORPH
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/49b8a09e3eb6c0e766e0dce6ec340d5a75580e32 |     
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/5bd0cb8711b611ca54984fd5e868098eea7813ea |     
   sparc     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/a83db003cf7620b1ed5b25378abba2b66590f159 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a1b19be63c0ae71e2b91213947865dd48eae02e9 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/bf8f54bb9f8c22bc2a954ee1c348db5ab1930b54 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/da6d5d7201a7c0dbd58720535d9d0dce6dd2a7f4 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/337131fe4c3b03cf88d1b4bd05aa6f3b7cbe3477 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a92a65a9fa60c806c856a1ffbb4644f2c3012fa9 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/d2f9e70f06f02dbbf01962004bfdc4da39d23304 |     
    or1k     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/785a56570cb67fe8748c1260861b455923eea40b |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/694b4b8dcc72a19541f08e829e96206758dc04eb | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0b73545c2028378857c516935a008a0bbe86178d | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/17bdc758edc8f8bcfd3aefb4f084bf1fa1514146 | ORPH
 microblaze  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/f9aa89500bbe29d41de19c8a0c2d824bbf5076c4 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/a7195999a1ad2a5f5e415f9e189cf349c7211207 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/eb7a4d2ed19032279ea836ff74987f61d62658dd |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/45339edbacd0f50579e0b1602be5f40db00c942a |     
 microblaze  | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/b8a4ee2e0393f23b4e8bdfd9d7cf90b9cc0cd784 |     
   sh4aeb    | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/88475a344d6a489bd50328d55ae18b2940bc1016 |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/62d0be20d93bdfbe054294ac8b350a3cc449488b | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c4e10ec24da425f83b9a3d8a6a7f8d50fd50805f | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a92d245141fd06a457664b91008189b9d66ca2c4 | ORPH
   sh4aeb    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/2de2d7f63a10592787743dda6637688b8fa7b883 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f531be7ffd9f64a55615ee1b0dd4457b336a7f39 |     
  powerpc    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/ebdbe59073c9c81f82cebe91d91e98a4bf63cf87 |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a58ebdd40606ffa12d9eab8b86e97e804921c175 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0dfb6dff9c5e516059569dd7084a2a41fdaf6abc | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f6d3188cadfd1e68c4cba5d2668b6b1ca0491d33 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/52966453bb144e9aac584c6665aea6bbf2800fd6 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f3afa5a4188aa5d22696179bbaeffc57fd775c68 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/14c1802318f3d976b9a4281b8686b2d1a1b4594b | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c8a893c3956c273a4abd51b829dc38b21346c781 | ORPH
   mips64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/eb5bf6e419a51158e47bb37963daae5a2bba5fc9 |     
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/f29ab4136318bfa603f2ec48b3008321e1db9afe | ORPH
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7626b24f84ecee340f53aed1216da797633976b1 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/48accb84abe594161c36e2cd70d120d0c682eedb |     
   mips64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/922ef4b1d8786eff9b7ea060e1d915a41196ecd0 |     
    arm      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/e59bcb5c92df4641adba1587e076124c810db72b |     
  aarch64    | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/7cf4847c9a5e748942270e3b773b750064273c8e |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/68bd1532b2b3801ceb3fa52455ae6fec9b9afcec |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/59fcfc5a9d89c92ab2d6d269920bbe0b16e6919c |     
  riscv64    |        libcap-ng-0.8.5         | NOK | http://autobuild.buildroot.net/results/599ef4b693a51aef73c169e443c6a46faeb83831 |     
  sparc64    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/eccf7b38e75684c8829fe3ccc2c96cc3d48b5ba0 | ORPH
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/47c4420a7fb9da00dcb89be61c6c9aa6a7a4d77b |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/5cd547d19d6d947f7dfd8a5f606a719485e26b47 |     
  powerpc    |        libgcrypt-1.11.0        | NOK | http://autobuild.buildroot.net/results/98c85cf7d5503a140afd3dd5ffeb91e4f535197a | ORPH
    arm      |         libmpeg2-0.5.1         | NOK | http://autobuild.buildroot.net/results/26d791ed5fa54e0aab06237c0ce514d3ca1ede90 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/3fa6779ab009b3e05bcd744d591d7c116e3937d6 | ORPH
   armeb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4cced911f47c6a1f550c97eb6cd0c13d978f36db | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c4095bfdaadfc8ed3113c251797cc0c6cb55dbde | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5b601f7efdbfcbda640a99bb60eb9634879ba949 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1d36ba0e1b5c060560a8d266e7674b1231983e04 | ORPH
  aarch64    |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/f3112c9a2ffbebcabbbd33cda6366f05a921972f |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/75f5718e47bbe7c54eef91717795958ab948abdb |     
   sh4aeb    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/6a1ce11b6b9963f023f6e56a0842dea9a20934c0 | ORPH
    mips     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/de31f26589454b792a910382ac15ee6664d38c77 | ORPH
  powerpc    |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/611e208995356e5641e20b55f5eaf926fdf773b1 | ORPH
   armeb     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/11501d32a53a0e55eefc413535a86226ea98377b | ORPH
    mips     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/33d2f2fbf50ec66bd53229be55a26dd3d29d3fa8 | ORPH
   x86_64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/fd89196a1dd972a642dff2370e09fe25d74cb9b3 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/ce0da12889dc0c6787b6c20ff6f3f16d62bf5b16 | ORPH
   xtensa    |        mdio-tools-1.3.1        | NOK | http://autobuild.buildroot.net/results/edf47df96cde6094c890c0b74034cced90335a39 |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/2ff58f950d710dcdce63df3876b5cb146661597f |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/fc7006dc64e735150e20147a8f05a34e72019562 |     
   xtensa    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/139e612abe45fafe393dd1cd7a7824293581d3ac |     
   sh4aeb    |          ncftp-3.2.7           | NOK | http://autobuild.buildroot.net/results/cc7d52954017d16a804c4c81a4d09944cda467d0 |     
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/60105c5cff087d8b6b317d34865d5245e9bb7cfb | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9e1e76c25af9db6f0f3684f24fa751fdde0052ac | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3d2cec69043831d6aaa65c666daeee429aa1465a | ORPH
   mipsel    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/463c4b81a8602992761c56a1004a848f11f1fc62 |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/16c66aee66c4c6cdace5efa77426c9c6fcff9ff5 |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/848aaf2278c08980e7764b5335fc54a6192ac3f8 |     
    i586     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/46f48fe61011e35b8fc3f068a39b2b1444f53afb | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/838d959995154384d03fc7ec9cbb23167e57c925 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/8f82fd8845cbf2ac3ef277bf9ef61eb0e5a9e122 |     
   xtensa    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/f82d006e010685e6090e71a4d9438a07364934b3 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/e8bae7bfd7d6a7987f3afa199d8d944429144817 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/45af3b45b02607450faedbd45fea64905cf33d5c | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8d5fb627040f9030d7083cea17762d97f493c203 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/a4903cf0ebba5d956d887182c8d315e8bb9de580 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/7982c03d93da3a0cfe1ff43da7583279cc1250ec | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/e69403d17fea65ab026468cee5c79b920332515c | ORPH
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/48d835eb70706f9f9d68b76432d79e048f1787b4 |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/66aeeb4f40cb2bb3773fe0379dcc9cc6c7452c3b |     
   nios2     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/f0ab42fa615bc232b21ac0a208cce62dde443607 |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/7bccc4100109268d2432728f91e4af0aee04a9d3 |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/2fdbf88a059f730eab5022c4bc22c77beca469a5 |     
powerpc64le  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/a6674043b7b3b8fd0a066aed06712d933e1c0559 |     
   x86_64    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/729860c7a32ce372148d3eb24b92c8ed9ade15f9 |     
 powerpc64   |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/279fb96708cf5f1196cf09dd6d70ea7c846bb2ea |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/0f000df22ed2bc732bb1990e797654d945a9523d |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/91e60cafee6d43434e4e765753992f7c0c56ddef |     
  riscv64    |       qbee-agent-2024.23       | NOK | http://autobuild.buildroot.net/results/afba04dda95723e579f71714eebcc3598865416d |     
   x86_64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/f61d9a7c5f6564c9d80a1f00d8744a1b4caa3a65 |     
  mips64el   |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/3bcf971e29cdb9bb49682f142f072bdff1fa5f77 |     
    arm      |         shadow-4.15.1          | NOK | http://autobuild.buildroot.net/results/5bc7f4c11a9547537d4b2e048eae8453f1a2f021 |     
   mipsel    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/2dae37ab2a7b15fcf39d35fb96cee183ff95652c |     
    or1k     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/714445a05f4032540978df02f431286078a27932 |     
   arceb     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/aa5a9bdf0197a2ac336251e979ad7ab3c9956ffd |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/93f589830a46961ac19bb522c53562e22a5ec616 |     
  mips64el   |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/937489e6f0c04600b9ebc26f71923c964881c2ef | ORPH
    arm      |           vlc-3.0.21           | NOK | http://autobuild.buildroot.net/results/777b1ee2886007e1c8a18c4d98504aa79ac1ef5a |     
  riscv32    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/42e9fce314211c6fe754cadd0fd9fa11ef62a8a4 | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.net/results/1d6da0095670d03aa698b3034c08796252a02ca5 |     
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/b46db3b2b1116466464a719ca142cad003e99157 | ORPH
   s390x     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/1d83ec30b5a18b60daef696fe54f4295f747bc65 |     
   s390x     |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/9c270c764f44e1fe6b30b3bf924ab8daf1660ef3 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               libglib2-2.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/646a0a1e5d29c9f0db015c4863cc86164650cef6 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                elfutils-0.189 | 1 
                  fbterm-1.7.0 | 1 
                      fio-3.34 | 1 
         host-gcc-final-14.1.0 | 1 
              host-rust-1.74.1 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                  jack2-1.9.22 | 1 
               quotatool-1.6.2 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/281c99ca08a8f1e9514b4c2281aa424f75998eb1 | ORPH
    or1k     |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/48e65147420e37cd71d233b6f84c2d19b9d50ccf | ORPH
 powerpc64   |            fio-3.34            | NOK | http://autobuild.buildroot.net/results/7d4b40674a48a5700e17e38b5a7454b8f1fe6da0 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/2c623467df2b664175abbe4f931de2894b1dbcbe |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/0f1e72eca901b9856c92c8064178a07c0cf981fc |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2ad23b70bdd05420dcb7accabf242a7c2712489d |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/ce2a4454ddbebcf7b25bac2b849d775738ded7bc |     
   arceb     |        quotatool-1.6.2         | NOK | http://autobuild.buildroot.net/results/cff1061be38fb93e5fe7275dd7cea547563aa4f1 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
