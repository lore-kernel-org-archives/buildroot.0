Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D167C4332F
	for <buildroot@archiver.kernel.org>; Sat, 24 Dec 2022 06:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E0B582137;
	Sat, 24 Dec 2022 06:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E0B582137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUcEDK_esuIL; Sat, 24 Dec 2022 06:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D8DB8213A;
	Sat, 24 Dec 2022 06:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D8DB8213A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 960F41BF307
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 06:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 419B040332
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 06:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 419B040332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lv2Bike7SpY3 for <buildroot@lists.busybox.net>;
 Sat, 24 Dec 2022 06:38:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5F7B400D8
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5F7B400D8
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 06:38:51 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2735C240002
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 06:38:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 24 Dec 2022 06:38:49 -0000
Message-Id: <20221224063855.419B040332@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1671863929; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2pxOp8ktbp4bsKCQz148wzxTMvwQqohR6647XxXsMM8=;
 b=GzEyVvLG0gURN+sZkqfrHyFbcfGjE3xGMjgoR+Sxfo+TtH7IvBNvaD5VUQ7dIqDOsMGi+I
 cIpbmrfzTnTskZYJJjK7tkY1haY5frX6nPIxe91h0lqY2iZTjwX+4cc1D0tB6UObBlIz06
 62MUvJ5GVPMf68Oeqsx+Kv45FbY/F1IXJBonT2B7HuHWBGEsN2X+ZGuMDe/6L3PLYCMIxx
 jQemhKbX2NbvmrWIsm1U001HAXgTHAQKLALdp3j3MAgl5GJsPmj8w6YhlvZJ5zYdLHFKUa
 SOTK9aWgy9BXd+4XSfb/N8MzJYz04ybP4ZRDdF1APxnsTeYqPwfWx9noOSQn3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GzEyVvLG
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-23
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

Hello,

Autobuild statistics for 2022-12-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  0  |  0  |  2  |
  2022.11.x  | 14  | 14  |  0  | 28  |
    master   | 196 | 339 |  1  | 536 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 39
                   aubio-0.4.9 | 30
                    fwup-1.9.1 | 19
                     xz-5.2.10 | 13
                host-go-1.19.4 | 11
                    opkg-0.4.5 | 10
                    pixz-1.0.7 | 9 
                       unknown | 8 
glibc-2.36-66-ga1dc0be03c9d... | 7 
                   linux-6.1.1 | 7 
                    bat-0.19.0 | 6 
  gobject-introspection-1.72.0 | 6 
            host-binutils-2.38 | 6 
       host-gdk-pixbuf-2.42.10 | 6 
                    crun-1.7.2 | 5 
                     efivar-38 | 5 
                   gvfs-1.48.1 | 5 
                  jack2-1.9.21 | 5 
            host-binutils-2.37 | 4 
              host-rust-1.65.0 | 4 
host-spirv-llvm-translator-... | 4 
           janus-gateway-1.0.3 | 4 
               libglib2-2.72.3 | 4 
                    norm-1.5.8 | 4 
                   trinity-1.9 | 4 
            host-binutils-2.39 | 3 
host-go-bootstrap-1.4-boots... | 3 
           host-libzlib-1.2.13 | 3 
                host-m4-1.4.19 | 3 
         host-sentry-cli-2.8.0 | 3 
           optee-client-3.19.0 | 3 
                elfutils-0.186 | 2 
                  ffmpeg-4.4.3 | 2 
             fontconfig-2.13.1 | 2 
                     frr-8.3.1 | 2 
                gerbera-1.10.0 | 2 
google-breakpad-c85eb4a59b6... | 2 
         host-gcc-final-11.3.0 | 2 
              host-pahole-1.24 | 2 
    host-python-greenlet-2.0.1 | 2 
               libcap-ng-0.8.3 | 2 
                libdnet-1.16.1 | 2 
             libgpg-error-1.45 | 2 
             lirc-tools-0.10.2 | 2 
                 nerdctl-1.0.0 | 2 
              open62541-v1.3.3 | 2 
           python-numpy-1.23.5 | 2 
                 systemd-250.8 | 2 
                 uclibc-1.0.42 | 2 
                 wolfssl-5.5.3 | 2 
                  zabbix-5.4.9 | 2 
                     ace-7.0.6 | 1 
                alsa-lib-1.2.8 | 1 
                  assimp-5.2.5 | 1 
                    attr-2.5.1 | 1 
             berkeleydb-5.3.28 | 1 
                   bullet-3.21 | 1 
                dovecot-2.3.20 | 1 
              dropbear-2022.83 | 1 
               dvbsnoop-1.4.50 | 1 
              e2fsprogs-1.46.5 | 1 
                 fdk-aac-2.0.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                  gensio-2.5.5 | 1 
                 glibmm-2.68.2 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
gummiboot-2bcd919c681c952eb... | 1 
               host-attr-2.5.1 | 1 
                host-cpio-2.13 | 1 
             host-delve-1.20.0 | 1 
       host-gcc-initial-11.3.0 | 1 
     host-moby-buildkit-0.10.6 | 1 
          host-util-linux-2.38 | 1 
                 host-wine-7.0 | 1 
              hyperfine-1.14.0 | 1 
                       iw-5.16 | 1 
                   json-c-0.16 | 1 
                       kmod-30 | 1 
        liblog4c-localtime-1.0 | 1 
                    libndp-1.8 | 1 
             libopenh264-2.2.0 | 1 
              libostree-2022.7 | 1 
                 libpqxx-6.4.5 | 1 
      linux-5.10.145-cip17-rt7 | 1 
               linux-pam-1.5.2 | 1 
                   linux-tools | 1 
                lmbench-3.0-a9 | 1 
mali-driver-87c13e6994b20b5... | 1 
               mariadb-10.3.36 | 1 
                    musl-1.2.3 | 1 
         mxs-bootlets-10.12.01 | 1 
                    ofono-1.34 | 1 
                 openvpn-2.5.7 | 1 
                    opus-1.3.1 | 1 
           python-bcrypt-4.0.1 | 1 
            python-bunch-1.0.1 | 1 
         python-greenlet-2.0.1 | 1 
            quickjs-2021-03-27 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
                    sdl-1.2.15 | 1 
toolchain-external-codescap... | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/ee3b50ab8779c1bac872b4f64702acce00df4e45 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/76b9470f8e8057da9b5fa2f286e12af61b4832e7 |     
    arm      |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/b0ae1475d3b201ecb042a3a71a2f68a084d09c24 | ORPH
  mips64el   |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/dbb78b132e1f8f14a2f55331df14abcaa6f5a480 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/77a05a936956e59b6124309354f18cf05e6d5b78 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/47672ffc369c5a18e8800ae45a3777e3dd330a99 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c5aa6325d4099533b8817964227c8ca664466e54 |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/81491c1f81a22cd0eac3ec3faa4764d7a0ce6da0 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7ce6244c11d52d00d4f58c4fcc0b87a4a291c52a |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/bf9b7a1e7cffb7ed2b344393b7e608a30c911dd8 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/43469e3fabc3ca2fe2a3d2a5fbd4d498d13e0a61 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e88e61a1b9dbadac2e9ad3048fb1463f6d2f0f00 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c9aa59eedae84c488ec94053b94ec92eb205969a |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/382b27d41c200605f010358b86e78dfa0e7247b8 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/75a5b5d84d36e0154c17a555ec06eea3795f34e2 |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0297459d7a36b92b6f8d7bdca9ad5c9fe94020be |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/78fb6b17336994306550681f1bb97080dbef8bb1 |     
    i586     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a2b7c14a0eb6f26eb9ea261f97f32b04838fc8ad |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c9f0d09789f3232fb92284229fca08fd20948a6d |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3aab4885b76d021fbda1a1c32823116e28d4510c |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/234af9250b07af26c069dc9b44f6131a39cca6f1 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/182b0b776d7aa019c89e7ea76305681a3083e22f |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/30f1429b63ab530d7f857abab4df4c5364cf2865 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/267e04093871880a8b6fb9a1c1fb2df88367196f |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/094e44069aa5aac6f809c646a46379bb08209ea9 |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5f10a1e61115b896b78cf71b8159a1f45e2b76b2 |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f50e14513c2d12919f7e259b67e82b3d14eaa763 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a642826f9d168790700d11f9b34cf6dd3a302d5e |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3268b28a07424df5ba81fad271cd7b40244ca510 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ebf1787a71fca6e6cfee04d2042e8d5cb2d2917a |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/bdf609a71fe89a2dd78cc0ff33c60eb78fa2633b |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/73531ae4bd2d2fe269f31b812781b00ab82fa4f1 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ad8d91996c7f8be522215be35cd8a7fc28407efa |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/592546ffeabc00b6f44aaaf84a78131185087cd2 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a6aec2a456babd8a27c1b4c7c1276c48a646e541 |     
 powerpc64   |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/50bb7f1f98272e5a5ab87a74d4cd12f6c67a8589 |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a3cc9b894d02de32eea82d649b2b6ddae37fe3db |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/d48cf37e70cf0d07159ad0b40cacadadaf626e40 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6b1434c70efc724f2e5763118db4ee8e90f6d64e |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7945298e9f0653263b2c8ee92c3f34bd45a7ee7d |     
    arm      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f83b69242bd1c23508e595b5c9071d498e866d57 | ORPH
  powerpc    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/4cc4629ba92ba1d964f3b0f4b86ac0bfe9204c6e |     
  mips64el   |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/34e4d74aaa6cf23037a8dc2853e826f51499e951 |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/cd78fe2177940fced25d34bcbb033d6d3590a330 |     
  mips64el   |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/6aa9bb7dbaae6f3de11bb1f4ce090889266b5286 |     
    m68k     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/9c70c2b4f3e75191a1c53b5eb61facf2f74c11bb |     
   xtensa    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/213db23b334f31bcb5cfaca3a75940b8d5148a3d |     
   x86_64    |         dovecot-2.3.20         | NOK | http://autobuild.buildroot.net/results/eee33c597ca1fcabe4937a02ba47c67caec4c100 |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/707032ae48eaeb28ae1529cd34b7904303c41d63 |     
   nios2     |        dvbsnoop-1.4.50         | NOK | http://autobuild.buildroot.net/results/dca21a1e2ad93d25a54b6b03ff0e2905f448af88 |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/903ae3e712b42c54186e22e183023c9759e0a440 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/14273c9511c0ba2e8e184a27b30938bbee236ab5 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/6ee08e031a25053e2d8b32332b8ea0ed87f37c64 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/fb1b03aea7953d00b94a478ac816416d26889e1a |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a91cd94776be969568208e519aef456a63a91f6b |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/1d4c007bbefbedc960772c378bfc7398a8e612c4 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/020d8282b6988a0d42a209b725ff3ad2a16e2561 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3b140c6105be328c8ad96ea94d307a24fb8bf4c0 | ORPH
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/e12b03dbb0826497c92b7fccccb08ed629ba3236 |     
   mips64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/4c44d4948debea6406a6905d512a63e26d6a8775 |     
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/e54627d23f2c3bc7b9e1cbb2992e259ac6f438b9 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/1768e3ce087ed12d3e6a6588d9c5e8ef5f30b43b | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/6a99d6c111eeb0ad0f57527b3a709ae2517c232e | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/ec90a95e5d92126d99e04f9a29381cf5defeed9f |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/e64b841deb1289b6c30dd90838126071019183da |     
  powerpc    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/aef6b1332017bc24e1f24c61d200d6bef4731ce2 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/17f2474bd26097bbfccddb54dbdf6295d75fd9e4 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ea0177923f198a7bb88cddf5bc3aa1128053e8c9 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/23413da7f0896bb743be81bc576fd73b0666eba1 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fe3f8570bd330ecbefd94cbb3fee92ea9f2a642d |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/454cbcdccbf152710db45919ef902d64290304f3 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a823344a151e7d671959e402889fa8a314a9073f |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/017345f1cce6a8a7fcf096a0e4730482376f5f10 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6a6a2fcc4b3cd500cb4a0b5bc9465281e0078ec1 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/65de72fee4bbe5976d32afd26b64a5952abcf85f |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/39038608c7930b00cdbbfdf744b0a02796d56e73 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3aa9f2f63d9810edcd98eb91f5ce14c68a7e6cf2 |     
   sh4aeb    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a8b47c4a789aba1d6a7878945a67f58cb5088cfb |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/16da8c52341e9784ff651c3ffa40b6ea0d031703 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7399c74983d0c29dd993717b7cf7a380476dfc8b |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a2f8dcf9fe8d078ab9fb91dff86eb74001ac66ec |     
   xtensa    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/abafc446fa6e66147a9306d122c37bd908c05a61 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a02a0493d2c494f55b3346366911c912ffa2e88b |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d83b72ca82cd96701f9b33f8a98171661dc93772 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fdb2cca405602f3befeb50c5807dc16242cf93c7 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/171d5fd18c12002a3946799b4158ffbc4c1b09a1 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3ae00152fc3e669ce2e807550b216d601042cc71 |     
    arc      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/7d07407f4f406c9af642797e9eba34e5d2c4da64 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/49d050680aaf105e576b5ee0ee033b03813db282 |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/05d00e0aa0f6065a3823e145bf17469e13762add |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c3c57cac145c082d9c9a97f38379c4fcb37260d9 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/30cf65da1f46df0c23fd5869eb3e01cf2b1d5f79 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b8f17771c648900841bba95fe16965d820619a25 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a3b034c4cbe3cae5b86076f561c939d2ec0ac246 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4e8dabd92d1e64bc4763f62cf57a85510e9500b1 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/bb68dc77a7e88cbbc6c3d1253a440e5536a9c88e |     
   s390x     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9ea5508421ca1142a7b7d4c6bb363cac8171e24c |     
   nios2     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/5d387c5e4eb56a51eb50dc52370ecd3bc60319df |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/12ec5c5c6ab02c51e01c7a8a1b03081926bd98cf | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ffd0b5292af0067a86b90ae54a9f9cf4b0d22cf1 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/670a509b157a14f4d0348ba645124fbd4717941a | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cec747ca395ac9cfaf8bdf67ef3fe845deb4fb21 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b2a131dedc8bc374fa51d3244e451c42e97ec612 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/707de0e5d19408fd52448ecb9b1ae5ac411d6853 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d169b7a923e81e843bf71c75f7b8e2b23f29c3eb | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fcbaf0c7e1efb779358e815c770d5aaeb7c2cd61 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/fd7c64af413b3db4b28f8ce466ed5e46906ddae3 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/b6ee20e3f299997afc22b65c65f414991db8153d |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/3d10d0272350e311c67e1d90955714725356deab |     
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/3bfaa108e12439c76249cecb0098b034d9a5a632 | ORPH
   sparc     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/f97b4e6574610a978ee94757690221f7d1950dd8 | ORPH
  riscv64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/24cc0cb87ba7a290d3dd9e39b48cb3ada4a4346b | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/4dfdff4e1c0662a417f412ad416b0c94f3d05b20 | ORPH
   mips64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/e973a5764600629ecad799e3610383bd2c078619 | ORPH
   x86_64    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/838bfaf11ff4f74da6c8676180097f84a5f59ad4 |     
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a9f55363f9b9e306edc2a354302befb5fcb5b239 |     
    sh4      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4d148b89b346ef30cf7d4d0776631e5c86e22125 |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1cf2fd6dab6faacf04f41bf35471e90b927b481a |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/74471fdadce821d14be437037b7fd288bf2fb591 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/37c6a07567d563cf9d5949b1b7bb555aba914715 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/88829189fc61c25b7fec0adedc2d2142ebb41595 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/27bc6a635176158c6c0ba306e588f8e88a448b8e |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d7de7860c391be4398c8cfdb2fb0ab82037e60ee |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b179c2df79a367ba40315727cc1d5d93eae3bdc4 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/689500fa0ced39cba5ceba8370a9df69a1a8fe38 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/85f8e021083c5598a8a3f498733f0427bac72e79 |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/7e92d78ef977d286d87ca92c71df28658c09c8a6 |     
   xtensa    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e5029a72f05910c6335974b7324785da80b12e35 |     
  sparc64    |         host-cpio-2.13         | NOK | http://autobuild.buildroot.net/results/b00c04482ce08d6251fb1213b0c39fd396b64645 |     
    arm      |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/1d7203526e27b07194e823213dd72ed60bf92777 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/21e44bc9617400e7a5654ca26c4a120e7baf5b53 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5c7a96b5d10ddaf37c119acb92bf40b5335f8d3b |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/15160bdff4a8f3ab16abcd9b370adb95c36394d2 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0e8638440a4e0826e3f0433d51e64257d6ca5c40 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1c5ad072f7b8d63225460169bb87f6c70c667030 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f0742864bfedb1cf55226f39220f363a13d67d5d |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/97bf485289b455ee8194adaf07f44eb3ba24467b |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f1af8d20191e9fd1b918644e1d0d58d8afd903e5 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e6541ca7748f9f0c5c0b249c27095b3a643fd048 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7620ae937f04e034ae300ef94a4370e9f100a523 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2e06b5c2048364b0535afd3626439515a7b117ab |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6feb2a1e2c816ba0b1ce0e2ff83bc03e0ed02c38 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/313bd112d8d495becf89a082925bda5d86971df6 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1e0fc30c1fa6b262eb9ad76d400cc7a3ad0890ee |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ffa5a0d22a97641855fa23e356b5d93f0cb3f4a1 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e21d26bbe4914ab9030f94fcc470cb2a05529738 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6ce32cfe11b92204c292c91830dc6bfc56fcf765 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ef0608c84580474d28b2b1d1b97b896351141c37 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f773a25521eacfcb3b4014c5c73e41434abc013d |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f3aaa57730a22a6ac695ade58d9c8c0a8fb358c1 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cd560534b1d8428bea9c164d260a8b2b557626bc |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b866391065f4780d637cb8957bb46b1122058ce9 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/12eea5348056cde6146200343d9d1a0a45e69bcb |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ef79e0d441043854cb29c95b62a95a8fd9197af2 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/93616249a90db440943d0f2da186405c3155b535 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c7d3f94eb5b74aff6cf8126766ad0baaf3936393 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/473ff13b623478b496a9ae0d49073415a69ba511 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5abf63e67610276d21789cf4c228cc9d169da84e |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/34a8b85b1f760ce1262af72f1237cbcf7d6d1dd8 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/708644bbc3997f6e1beaacf4383b9ccd984b3778 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6e92d1f8c403a286340e0e6bbb7dd31a7984a502 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/808b8cbf1e243096a664e15702475369f87991e9 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/159265c85a0e3eab7dcb409ee5e5466b8c01524a |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6f7885c0293be1eba9eb30c03a07f72aff07324f |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c417a5cbe8db4af6275cbfb400c8c2e0553aa19d |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/983e3cf65014cd79a599afa73e5bcc700780c7f7 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b7af0dfdc3a8b98312bfacc0d84bd9cf1d855135 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bc8ee1bd6c8502fe8b52274a077816b57976eb1d |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a3392873f9ab87e27bc80f719d60f24d3722d50a |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/97a0d164ebd334bba9f75808eca87d8552c31ac8 |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/9d30e514686eff142d09585dca7deb4c901c9779 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/abaa53fb2b132f2c8b02475d0418b7572e1061e7 |     
   arceb     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/bd79d723631385f77522e55baee0bd88ed2ed67d | ORPH
    mips     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/8ff1cfa254920749a43e235c4084b8524d0edf6f | ORPH
 powerpc64   |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/ec202bd7185c63c3db35a9a845366e7d1436e5df | ORPH
  sparc64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/7a778594103deb0fec0d60fba053b2fbb53191c3 | ORPH
  aarch64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/b33ff492e344aa3fc901d089c1d2975089b6b912 | ORPH
 powerpc64   |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/3a4a9d426bc3cc6651d5926dede6a73ee21ac3eb | ORPH
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/02195894114ef6baad2988b498e80c5b98fcc829 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/c584b5cf55012874865d869311f9563b2a728de2 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/1c5bf2ef83f8f6922b40ddd42608da9dba3b763d |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/24511e85ab1c726ccf1b7092fd636e128c6b7182 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/a8161da4d4c0d6c06b3bf1bcc42d73809e48386f |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/787128ecf4acf7b6b59f2c960beec73e5b67647c |     
powerpc64le  |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/816973b510bf4121044d44cdb9c45fae1257e7bc |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/12eb8a10b3c897971e6d6a2cfeb24a6e8a6b4e41 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/7d5d13f26c1db10246c658586672eabd88130b36 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/c19779a747e009c83cf7bfc0c2c94a182990381f |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/a5a8028e84f91307ffe81136b6201775eb17a730 |     
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5c96843be6c274264f43b31e5ec72455018fe713 | ORPH
   arceb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/528784af0c580ecada449a3f7839f096290d0a22 | ORPH
  riscv64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1dfcb942fd00fc02325e76489933c2c0fb31b21e | ORPH
   xtensa    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/5ad9589999ee94c3306d1ae635a01fb1fe5e3273 | ORPH
microblazeel |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/1ac0f446e193b1cc1b5408133c6b79183f832254 | ORPH
powerpc64le  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/4c81d2c7197aabd5d291b2aef9a991b3b08933ff | ORPH
   nios2     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/e420a9c3ff04a5a38725939125284ca7f17118e2 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/161612906fff28eae4834b1a3d83cc2bb55be937 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/5cbd9f38d206712c3378fd343ab0981b0132b2c1 | ORPH
  riscv64    |   host-moby-buildkit-0.10.6    | NOK | http://autobuild.buildroot.net/results/3a9f8bfecb1855ac303f13a0a000e1b475b80c5d |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/af8d17b6c9df533f8801fb8edd2730a9d0367c41 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b76e279362a4f04684a4ebe44eaa80605e1178cd |     
   xtensa    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/93bdbf3d1dbe802f04b11e5cc07d7f7a69fb28a6 |     
  riscv32    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/6e3f68a26b5178e7105399aab62da3fbc2b94486 |     
   armeb     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/bb4eb0e26fc785a37dc8881c8241f2361e7a2683 |     
    mips     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/0fcf1b86c232e1a193dd6224b4f22aa3465104b5 |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/ead7349aa1a4ed91954315188630ea966e3243f4 |     
    i686     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/0c3c88dbfcadc8006678d96b173568c7d763fa96 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/7f262e749afa008d939416d1061e1dd2ac34bc07 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/28fa301b1ae5bf3a5bb80e27d34144fa91d2d65a |     
   sparc     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/be32239b1a61fc091f06c5e2197cd3e9a3f385ef |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/4d15947945ff22332ca94b7be07f4369730cab0e | ORPH
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/7e0b919a1ba77644ac08b8d964275390d4e644ff | ORPH
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/cf7e35552975565fe99bb787edb8debba221e0db | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/fc3289e4f24deb5ddceb049015eb3ae677479013 | ORPH
   sparc     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a22ce4b94c3e23af691479c4d5649cb5c10597fa | ORPH
    i686     |         host-wine-7.0          | NOK | http://autobuild.buildroot.net/results/bc38173ab8a2325312300d2b36df3b32c80e9cd7 |     
   s390x     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/b6091db01435f8af8338d9582818cf98444a00c2 | ORPH
    m68k     |            iw-5.16             | NOK | http://autobuild.buildroot.net/results/1936db2ad5b447aa3589604650f4e9863cbcecd8 |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/7cc3021355fd99fb218b8db55ec691a4bbbf4851 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/2ca97482ed5a23161cf714ceedce13703a824bd4 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/6fa4593e4fc026877a6fe65426c0dc05e3a970f0 |     
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/7432a856758656e72b45b94b591594b90839d54d |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/1e5dc347d1908644b2d5600c12a2e0d14e626407 |     
powerpc64le  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/28600345c1a5b9c114255b2284081c033575ef04 |     
  aarch64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/166396c2ed5a40feb6f97a1f940d286a4a98943d |     
powerpc64le  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/2872adf776cba0b613ab166dd3e5111d3d40486d |     
powerpc64le  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/41c5b71a07a4ec5d54521322308bcd1428c85d80 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/08e133d749ace73960272b5fb7cfde840c8e2d47 |     
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/b09e076a43565ee5a40f546f9e5dd786f1b93cd9 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3e08c612d25cf06313aff2c9d6ff17e540b53cfe |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7b8a3f611850336395e5d59ed1c3aa3b4ed1792f |     
    mips     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/66eee5da2d205d6bbf46d7276e6eb55828d98557 | ORPH
    i586     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/1094d7eb1d30da88545f8e2cd53074821555ff23 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9d8939dac85dbbbbd8e626f4df6b68215dfbe661 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b0f496112f6c6a894d65e93e458a095fe0fdfffb |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f68b624505f4ff6c20018638b05ce334b2e5bb56 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/16b3abb6e5b1c870c04e1e8c1526f806883e67b8 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3e1f5ad4a12d146a5de81e38bd3fee205161985c | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/241769297e14e34c6d8fb4c46fd61a20b1b03cc9 | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/1e6e17b4a3a28c75211eb63e97c2e04fcef646be |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/a531c928f9878965bf7b586d894db850658e3b27 |     
    mips     |       libopenh264-2.2.0        | NOK | http://autobuild.buildroot.net/results/c4dd858d83f9607a8bf46bd8534c47286c908948 |     
  sparc64    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/33b518a222cffe702fb14ba5686be9a216f6a39e |     
   mipsel    |         libpqxx-6.4.5          | NOK | http://autobuild.buildroot.net/results/226bc6f17f34c9c7602848d52aa85cad4f5c927e |     
 microblaze  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/d32ceb3c4b0065ea9a60115c42f264cf08810238 | ORPH
   mips64    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/72bca4e3d727f1367a4fb8d5960071336731f531 | ORPH
  mips64el   |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/afcfbd239dba34d65008015c0691c52bad3cd99a | ORPH
   mipsel    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/c35e41ce0b3145cab2a2e057b6c22bb8f2d53776 | ORPH
    mips     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/15652256080b36766cb94a6fd50596e1e1a897fb | ORPH
   x86_64    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/fa513c51830cda7817a2d2b40e14f60b4fed5759 | ORPH
    mips     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/48e81de959fb5c79f0008eaa71b54ad4a8fe566b | ORPH
 powerpc64   |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/646d8a64747d7199b5d2e71364cea4f5a2430b62 | ORPH
    arc      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/03a55923fdddae2b5da1f3d0f3691340f5744114 | ORPH
    arc      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/4aa634fed87ae4ae53118eef77bf46624c933dc0 | ORPH
    arm      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/0fca78388942527585998e0261de90dabe084cef | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/0d6209b2e39c610462c455325ec07f7ad2ea0ed0 | ORPH
    i686     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/89dd3d50a7c727098ce1e207ce03a36a57a5c062 | ORPH
    arm      | mali-driver-87c13e6994b20b5... | NOK | http://autobuild.buildroot.net/results/1e1e7c8755ffe504b99b70398f9391726c1ef389 |     
microblazeel |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/751e7746f70c1b001f7754b7c90a79d8141d88c8 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/868ade8716c1aec884f0dd04e1d3edeca4462b49 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/f75706a8a8b0236473f2ca3dffa45f0d39ea72b2 | ORPH
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/be0345e7cfc501fae0fe4cbc9bb9aef6a67e2e82 |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/1b64272dd9802e393905673ebc26c46577bd3595 |     
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/48a1376c9bf63cb8a93321446272bf5a9a4e7a19 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/063b55035560f7072e496fb7ff9bc3e160f7a8ae | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7b9723b4bad13b5640d7bd8851ceb018b28aa55d | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/390fc2cd39dcfa2f8a3f23cb4236e8ea1cea309a | ORPH
   sh4aeb    |           ofono-1.34           | NOK | http://autobuild.buildroot.net/results/0365bcae242303cf3d5f81ad61ef61bc983efd0f |     
   nios2     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/98322bce0a10c7f1edb22748048199a9043d3e53 | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/456da2fc46d1ee2b23243f051ecd05518bc0c5e5 | ORPH
    or1k     |         openvpn-2.5.7          | NOK | http://autobuild.buildroot.net/results/abacf7ae1bf6bf5f3e4b735ce7d17d8309b60d03 | ORPH
    arc      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/3628546f1fa7c9b43672b6b3add906dea7f5ae20 | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/fc4d874f7f85099813cad81ddef775e7d3a2ebd8 | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d8f2e4b651e0e1d00570d0c041ac8dbcad20125f | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/33967301fbef520c858f21e1ba112dbb6110ee35 | ORPH
    m68k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/045b19d26911095b4ce221630c8bef3cee253ed3 | ORPH
   xtensa    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/44a5d3e58cba402e48d1b90fc9ce99f02ac895d1 | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/ef1c7a1436a89d0a62c5088a129a475e68a85f42 | ORPH
    i686     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/54e79385e221913d64d504c4a0d19a5c3571361f | ORPH
    mips     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/a90e4778408ae08ba102420dbc387c688e055aaa | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/bffed0e530cbb72387ddaf7574e0ec997c150995 | ORPH
   arceb     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/ccf3498e980eda1ae36de292effe0ccc8afd2e6b |     
    i686     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/950f398048dcc4ef71fa6939b0353b022adea314 |     
    mips     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/1bdbf50237b26ad785aae81a9c5931de21bcb01e |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/46a9bd9ca0fe4ccaed9d35c8ca083b148a9da9fc | ORPH
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/3b533bebf7f8eeeb36b642a4effc5c0cbc038455 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ba0e30a7198c6a531f552557c1b9d968385e5c71 |     
   mips64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/38a6ea87ffb7d45cc4d7ecf030412a0f496c07c5 |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/1d6fec6d63dbc990d5596ceef23d36479f1f88eb |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/2f0022e7c08be64758f0ae7fd5695378d3d74892 |     
   mipsel    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/4ec8ce2dbefb0d80d0cbb1056cf0816ce8f8c5b3 |     
    sh4      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/6740d9c3b641d97e8182313d97a2d9e35ccbe108 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ef3294c768e0c6b2990a5b185c4bf70772453fe7 |     
microblazeel |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/8658056624d55844a489e980dea1205556cd1d50 |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/cec8e94bcbd22fbd07d90f30003a2e787f8c037f |     
 microblaze  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/5b761c51c22c9b651b1d7c13b59579e6be9d36da |     
   x86_64    |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/49022584a21e3eafb685afaf0224dcd9e91df066 |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/7e80e7a64037534e73a51395dd3c85cb4a631a85 |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/dc0261d1e7249168e0166a359e86ecabca7b74cb |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/52e60bef9a52b673f2f4e43c435fbe2144a2e599 |     
   xtensa    | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/cc84b5f62ca59572f0f52086f157acc0409c03f5 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/dbc4ecc7895726d31923f28b8a70067cc2cffc78 | ORPH
   s390x     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/7bc34d035721715d01a4762a93f06a5ffdde6d54 |     
   s390x     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/68bdf7eb1146cc9c70b7c8b187c7c929cfcb48cb |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/cdb6b341abef051271c9724086073cea4f6db852 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/af540fd1c46ac0d1d68847dc89a4fbd6adb2f05a | ORPH
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/96aa70ddc4c0621a7b2c005e3e7c2adcc9d106e4 | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/f2a454b3506c073af0fafe839ddb146b6a14a986 | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/50314ec78f1e304f341804123cf806575f31eca5 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/ac850ff02c5faffdb933ec0b850afe258dc1abb4 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/766fde4e9cadda8e101d3360946baced0f138e57 |     
    i586     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d3f77f03ffe374acba19b332fea5b70774702d22 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/0f0f8ed599662d05e505504d45a0bdc0b419c574 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a2164a9b6061a2c4626231d33d9d49bec69a8590 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/2f97cb710d922de00035312b8896f2722c82c877 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/451f157c53e9a7452b9e999de1dd4da06b75e72d |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/dc30c93d92b2a61113325bde31def4ff277d7547 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/509bf201fd3377e4de31adba2748bbb1291cdea6 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/a8e808ff6a8d6d01205db1a5aa921d70c68f4f2f |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/af6c8b149aa2fb8e66aeea50b995573afbbd2f37 |     
   armeb     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/acfc738e5b2e045d49622ac816ebb465c1ad5a91 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/036b32c35991a72189dd3bc2b86d063e854c4e53 | ORPH
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/bec41ba09904a7dee586d0f6decf8efaa7b91584 | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/a04e8d6d4a1a4712e0f65529dfa3cd22ec1bce4c |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/584281e22e54dcb39fa852405ebf7a491d4d3b9c |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/f8b0beb8724487e70e8b808c8444652369a47daa | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/8d2ec000e36406d8ee383ace9f6548a4a190137e | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/7b66305fd853244db2ea522486b09167132bebf8 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6defbfca801d293a5d79cc13c1c62c377166fe04 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/eaa127e6e88d5e6e24a474d55d5d36f65960a993 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1d47b4a66a057c9683d5c1d8167849cb0e309113 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d66cd0a5443606a87aa83b82cf6dd511eda4483d | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/df5b912c969ec1e7c384ae0f449b2a31d89dfe0e | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1887f515715707969e7f54c92809f30b87ac06be | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/7691a61d95d4a78cb10af3dade5d19ed7c0f68b3 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0b9fa80c1507714307efc1b863805cacfc43dd65 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9ebe0a647915008c75c8034085440bddf6d90e44 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0f2060dd39b8ecb3a18ac177d2571d8184e4b725 | ORPH
    sh4      |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/93c708576f19228e24bfd2fad707da446f879ca9 |     
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/35bed53104ae105c9b39614680987bab9cf23b83 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 2 
/home/buildroot/autobuild/i... | 1 
                    bat-0.19.0 | 1 
                     efivar-38 | 1 
                      gdb-12.1 | 1 
                gerbera-1.10.0 | 1 
                host-go-1.19.4 | 1 
              host-rust-1.64.0 | 1 
                  libnfc-1.8.0 | 1 
             lirc-tools-0.10.2 | 1 
              open62541-v1.3.3 | 1 
ulog-0389d243352255f6182326... | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/0f381781e6deb1fde554dd6c2513e7e3ae7724a9 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/01fd6f5406fffe198be5b9ff7aa4760465d04a01 |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/32ac2de490260c4159b6bdfb35ebaac76b8ed483 |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/dca22b848aa4920a1a83149cac98698524cf7555 | ORPH
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a57452071895d9bcb91352dc50a3ea14465b1551 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/0bc38e9616344e815ef9e37d118f403e75485445 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b815c33182d1c7d5c403ef1287b52d8ac65b52d1 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/09ce6dcd394390f287aeacd2a96617e3e4f85595 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6c7e3e7ea0c29c5fa4f1b4f47a51c88a4c3b297b |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/b14631a068d918d42488f3fbffe298bc7b04186b |     
    or1k     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/1b3d6755a6740d28734c46881d09ec5acd6ea7fa | ORPH
   xtensa    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/943e33d34f49908037bae41164d6b030c3266bad | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/73deef0fe4b70c67eaae3b3130afe3d69f58effc |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8e4a2a6538939959b93ee2d31705eb57cd91dab7 | ORPH


Gitlab CI results for 2022-12-23
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942959  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942970  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942972  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942974  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942976  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942979  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942980  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942981  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942983  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942984  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942987  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942990  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942995  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942996  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942997  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511942999  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943004  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943005  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943014  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943067  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943068  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943070  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943071  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943072  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943074  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943075  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943109  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943345  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943382  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943417  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943419  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943422  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943426  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943427  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943430  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943433  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943431  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943435  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943437  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943438  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943440  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943443  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943444  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943446  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943448  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943450  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3511943451  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
