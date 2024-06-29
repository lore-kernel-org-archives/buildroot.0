Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799F7C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 05:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1255F8133C;
	Sat, 29 Jun 2024 05:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoGkCKrrpSLx; Sat, 29 Jun 2024 05:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C867E845EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C867E845EE;
	Sat, 29 Jun 2024 05:13:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A472C1BF39A
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 05:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 928F0845EE
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 05:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRexwaW_Z0TD for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 05:13:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0C948133C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0C948133C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0C948133C
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 05:13:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 626FE20007
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 05:13:20 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 29 Jun 2024 05:13:20 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1719638000; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NEXlLTvYTG35Ue944DDw0D2q9oVLbtI47MfJWM/DFvk=;
 b=IfzK/9R2/LsqwDEX1V2mgxoYVERtnr2zbtY0ZgGXraxpdCKX8cx5TnkkDyvVhCW/Ey/iD4
 svdIxB+TasKLuo0QK4X1uOdK26vUJMH7lvAHX5XM5wYqQ7SUgEFGLC6bdQjijAtE74InO4
 I1CSdzCasT2JtQjP2tL4AiEvr2cXNk9V51/WoUgY7KV2myi0VhlhYGJAbOUeGKiWJIhjwy
 ts8HlLoSx4ONgw31u/v0GavxzAH+7R0X3vPrf3r7KaYQj38isv2+Q9tRL1RQ2vu9sKQULU
 BhXdua548aohdZ7geiW3Pb+mj011n3Rs7OOHK93A783xuP2/CR+22QQeUWW84A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IfzK/9R2
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-28
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
Message-ID: <20240629051320.OX6EPgscjv_i2UYzLJqmWSBIXmQEE6Q1bDqc0C8zb1U@z>

Hello,

Autobuild statistics for 2024-06-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 13  | 12  |  0  | 25  |
  2024.05.x  | 10  | 14  |  0  | 24  |
    master   | 52  | 886 |  0  | 938 |

Classification of failures by reason for master
-----------------------------------------------

              libgcrypt-1.10.3 | 104
                    zstd-1.5.6 | 78
host-prelink-cross-a853a5d7... | 62
                    gpm-1.20.7 | 61
            host-cdrkit-1.1.11 | 41
                     cgic-2.07 | 34
                    yajl-2.1.0 | 27
                  cpulimit-0.2 | 24
                 libfcgi-2.4.2 | 24
                 empty-0.6.23c | 21
                libressl-3.8.4 | 21
                    ficl-4.1.0 | 18
glibc-2.39-74-g198632a05f6c... | 13
                libmad-0.15.1b | 13
                dovecot-2.3.21 | 12
                   exim-4.97.1 | 12
host-android-tools-4.2.2+gi... | 11
                libssh2-1.11.0 | 11
               libtheora-1.1.1 | 11
                elfutils-0.189 | 10
                     flite-2.2 | 9 
                  libffi-3.4.6 | 8 
                 libssh-0.10.6 | 8 
                  libsvg-0.1.4 | 8 
                     mtd-2.2.0 | 8 
aer-inject-9bd5e2c7886fca72... | 7 
               cracklib-2.9.11 | 7 
       host-gcc-initial-13.3.0 | 7 
                 libcurl-8.8.0 | 7 
              fluent-bit-3.0.4 | 6 
libsvgtiny-ea9d99fc8b231c22... | 6 
                   linux-6.9.4 | 6 
                   memstat-1.0 | 6 
                apr-util-1.6.3 | 5 
                  cairo-1.17.4 | 5 
                   eigen-3.4.0 | 5 
            host-binutils-2.42 | 5 
       host-gcc-initial-14.1.0 | 5 
                   host-go-src | 5 
               libglib2-2.76.1 | 5 
                     nmap-7.94 | 5 
sdl_mixer-d1725fcb7c4e987ae... | 5 
                  ffmpeg-6.1.1 | 4 
                gnu-efi-3.0.18 | 4 
             host-clang-15.0.3 | 4 
                 libhid-0.2.16 | 4 
                       unknown | 4 
android-tools-4.2.2+git2013... | 3 
check-11970a7e112dfe243a2e6... | 3 
                 coreutils-9.3 | 3 
            gdk-pixbuf-2.42.10 | 3 
                 haserl-0.9.36 | 3 
                host-odb-2.4.0 | 3 
                  jack2-1.9.22 | 3 
                       kmod-31 | 3 
libyuv-413a8d8041f1cc5a350a... | 3 
                 augeas-1.12.0 | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
                  bcusdk-0.0.5 | 2 
                    brltty-6.6 | 2 
              cache-calibrator | 2 
             can-utils-2023.03 | 2 
                 cdrkit-1.1.11 | 2 
                 dc3dd-7.2.641 | 2 
                   evemu-2.7.0 | 2 
             host-delve-1.22.1 | 2 
              host-rust-1.79.0 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
              libarchive-3.7.4 | 2 
                  libnfs-5.0.3 | 2 
                  libsepol-3.6 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  mender-3.4.0 | 2 
                  ntp-4.2.8p18 | 2 
                 pixman-0.42.2 | 2 
                python3-3.12.4 | 2 
                  rt-tests-2.7 | 2 
sox-7524160b29a476f7e87bc14... | 2 
              udpcast-20230924 | 2 
                      xz-5.6.2 | 2 
          alsa-plugins-1.2.7.1 | 1 
                     apr-1.7.2 | 1 
                  assimp-5.3.1 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                     avahi-0.8 | 1 
                 avro-c-1.11.3 | 1 
                   bird-2.0.12 | 1 
brcm-patchram-plus-95b7b691... | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
             containerd-1.7.14 | 1 
                   cpuload-0.3 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
             dahdi-tools-3.3.0 | 1 
                 dfu-util-0.11 | 1 
            ecryptfs-utils-111 | 1 
                     faifa-0.1 | 1 
                fail2ban-1.0.2 | 1 
                  fbdump-0.4.2 | 1 
                     file-5.45 | 1 
           flatbuffers-23.5.26 | 1 
                   foot-1.16.2 | 1 
       freeradius-server-3.2.3 | 1 
                 gnuplot-6.0.0 | 1 
         host-gcc-final-13.3.0 | 1 
         host-gcc-final-14.1.0 | 1 
           host-gengetopt-2.23 | 1 
                   httping-2.5 | 1 
                  iozone-3.506 | 1 
                iproute2-6.9.0 | 1 
           janus-gateway-1.1.2 | 1 
          libcamera-apps-1.2.1 | 1 
                 libp11-0.4.12 | 1 
                libxml2-2.12.6 | 1 
               linux-pam-1.6.1 | 1 
               mariadb-10.11.6 | 1 
                  monit-5.33.0 | 1 
          ncurses-6.4-20230603 | 1 
                 openssh-9.7p1 | 1 
                openswan-3.0.0 | 1 
                unbound-1.19.1 | 1 
             util-linux-2.39.3 | 1 
                    ympd-1.3.0 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/47558468d5586b0d0953574307ee03d8a8fd1dc7 | ORPH
  riscv32    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/836df484d858ac671a7f0d6c8854d733ca86a558 | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c8717d4f25c5c4cad5768a726f6a58e123fdaac3 | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c2e20cfe1024df7c277d6c3740b58165d7afaeab | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/bd84cb68120eaea999137f9d8e5c87e5ef70d4fa | ORPH
powerpc64le  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d2bfcf81575b5999949d502cb7873cfa61811071 | ORPH
    sh4a     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/6fe43a4bb75007223ae557ffb3a3fcca6111820a | ORPH
   x86_64    |      alsa-plugins-1.2.7.1      | NOK | http://autobuild.buildroot.net/results/9305bc53c6f65ae61d62aa03835b27e0a44fe92f |     
    i686     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/44b8ee744529c92598f67b0d85339c8bb46dbd0c |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f309ec0accc080c12c0460400d9ae5a9b6d44086 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/776ad5c6683f468dde4dad7d4c3fca275bf0838a |     
   sh4aeb    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/d573e1222605caafd2f2bdd7346fb68dd82a5820 |     
   s390x     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/93cfe6bcc58062c035a7e23ce4287c329c429d16 |     
   s390x     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/be4f81842f50dfb0e196a87167fe241335792207 |     
   xtensa    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/57b5797f061be910b6b7cc902c14b160eee37f05 |     
   s390x     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/a1b35afa1a41c378792b237f7841124fb4922087 |     
    i686     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/81332869356b31008e0667509c675b941f9bf881 |     
   sh4aeb    |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/2cd52c35036eb53a0fedcd00b749184df5f3b2e4 | ORPH
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/77b5d629282786b98b5668c2c8bcbaff45b1fe1b |     
  powerpc    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/e5140a4042bc8fde576b07cf3b37e2fc6e711f32 | ORPH
  aarch64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/243e8eed2291811b37d2670b40d4d1ac961b5549 | ORPH
  mips64el   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/885e60e8c5e1d1c735507511a38614047bddedda | ORPH
  mips64el   |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/f09cfb81db7d9d04888130f15a102d346a7ee459 |     
  aarch64    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/624e9ed11c7e55580c0b79c38595b1b3cac6008b |     
    sh4a     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/11d4dabdf77258e47a36d695b697c68a26a759a8 |     
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1d823ae927d4c178cef396beabdbaf14e2580d17 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4ebb6048b65979e429bf3f770111426f49a8f1bf |     
  sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/94bdd6bad18c762d7e60aff1bb5f0d036d5b4df2 |     
   x86_64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/1521f8861db9c228315bbf2429ef11c041ba6203 |     
 microblaze  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/d3ede3833336eda50690221dc7352dd37ee21d36 |     
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/08df9d363ff157b4c96563cfaafdf1a49688fe2c |     
   sparc     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/ee589440e973b66e19a1ae839234943c5f7472b5 |     
    i686     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/7fa98c1ffa3b689560d2a350c806942eca0ab2d3 |     
    mips     |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/3825c95490f0ec1109e74262940e607db7e227f9 |     
   sparc     |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/1ee2cb829a2ed232036699191ea0c0f9cbf8d6eb |     
   mips64    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/c9e2ee6f00ce9fdcee0487cbc90192a06568cd37 |     
   sparc     |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/daf0b7ab5512b117c4073e2986ece86241526d48 |     
  riscv32    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/f006d8eb69afd4efbb53b13fb9f06f78a9f499ee |     
    or1k     |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/23584cae3ac8f16bffbbf80353f599773a2de6ed |     
    m68k     |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/3f5dfba772bb25938d0efd927fc7942d247cf7d3 |     
  powerpc    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/d69cae0404876ce531d5b60c4803bece8f93b73c |     
  powerpc    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/8668ed88c9061addda95c92e63cc6231665cd0d2 |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/eda420f28d427fbf4ff8703b6ba70bd8e9573e90 |     
   xtensa    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/2140300f8fc76c0df6307baaa325850695b02730 |     
   sparc     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/59b9f6fc6c3f96fd300209414c5c3b4fa31d2601 |     
   xtensa    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/0b48cd2b258c9d4fdf52ac260e915f45a156cf1d |     
 aarch64_be  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/3e93bfc65fee59345e5bef2108dc38cc58033a65 |     
    arc      |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/f9dc63d5cc09daeee7d27dfe36e429ad8964eaf7 |     
    m68k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/eda48775074f670070c5f41f9f5b273295692f2e |     
  powerpc    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/6f6ee13a629b70a61042dab5ce8e003c5cb78573 |     
  powerpc    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/0d791824872acdbb5b03fa0e416cd14875aeb334 |     
  sparc64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/ec09c16006f5cc467b2c48c3a52baaa2c73e1479 |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/4caea71a727abd3c0ec1f122851c737edab3307e |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/14bdf295595edae0470eaa7f281c9f85e7ba24a4 |     
   armeb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/f4594f99917ebbb7bf34e4bbd400c94bc388ce1b |     
   armeb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/0a1db1a89254c5c77d3960b0194e271e525c3ff8 |     
microblazeel |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/d9ac74510a5ed87c12a7da942efc24d4210689bc |     
    i686     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/a5740af23dd97cf989650f1718f41b1aec8c0a99 |     
   sh4eb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/cdb596e531813da2383795368035b391cfb30bd8 |     
   sparc     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/3dedf243f836d67fa41e350ebd5de8ffc9b8426f |     
  riscv32    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/92a47bbfdfe020ccb979f2961a973949458864cf |     
    or1k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/cdd36bec5ccb156c9a02005b897f5d507191d9a1 |     
 microblaze  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/5e2dcefc9c557ef6bb90a1edf846c19fb957a2cb |     
   nios2     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/ff5233264e1d993de99f0fed115f940388235308 |     
   xtensa    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/dcf8d332087bf369cc1c4162fa22c5073038a189 |     
  powerpc    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/b1ff1eb8c2cd47ec18fb93a726c9721ab5de5fd1 |     
    mips     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/957c7f4a21ae0613ec9ca5b00b92217cfa00058a |     
  riscv64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/2335d1a47e238ad740fe4e91daba36f9029ef082 |     
   mips64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/9cd572438efbe82d8f148c3c266c34ea7b8731c9 |     
    mips     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/e82a9f92b0bb66aac31d2d538545abe4ea32a75c |     
 microblaze  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/f9c71a81d4ae36eb08980b1eb43f894d44256926 |     
    arm      |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/00b38475f07a9c1a103656ef149e3f218851f24e |     
   nios2     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/0aefebcd3b52f0c9f9b7fb64ced71cf7e121fe2a |     
   nios2     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/8a359763d1297a844e282b718a589cec21a69465 |     
   armeb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/d880a838d2b139ec822d551fbf9f4de99b39f22f |     
   armeb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/8834952048f10c029cbe99bada206e37e86cf959 |     
microblazeel |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/7b98b1600397aeee923dd347e7a647f8c37ed473 |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/9637a2b5cfdfae9a92c749c2d8fb4c45bf290d90 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/6b1cd5881982e0f87cff302bb9de2883818a28f5 | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4ffd506cb669ae2305e4dfc82cfd6539bd0c5460 | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/9f7edca78e94692c004b4ad381ac9d4ca1c3810b |     
  sparc64    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e0e6be139a55782fdcc7f385aaa7ab5e8072f88d | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4976b46df91fdb3781a80f94c4445bfa34150938 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/965dd1cf8fa75e1ff1901540cfad044b76cdac9b | ORPH
    arm      |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/a534b00b9f93c9651047b0ee49a7bd4ddcdad041 |     
  aarch64    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/1a7e6fe75aa838953a90fa886367e11dd3152552 |     
   sparc     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/da84890f7f7daa2abfd46a2b860e505a5b9d8172 |     
 aarch64_be  |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/022eb6890b6682022e75bbb94edc3c46f8951d97 |     
    i686     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/bcca4cb3204a765025b5096bd052c908ab33947f |     
  sparc64    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/f678a3add767bd3d2ab50a6b78f0397b0757c95e |     
  sparc64    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/ad2d0c8cedc9ded9213d060060623971c81575dc |     
   arceb     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/7f88780b1b92b7fb41addf7c5928952e2125ae4e |     
   sparc     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/3e8c3be161248206a6d0a17d17cb0d7ed579aede |     
   armeb     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/fb7c9bc39c6d45734944e3aaa93f445414488495 |     
    mips     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/bbd8f10cc7824f0957784907eeaa7c15e5b6fee9 |     
    arm      |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/afb633e0badbf7c4152dec92e8db02c1686c4d89 |     
   sh4aeb    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/558d6a26addae0f4e409cd66468708a1a2feddd9 |     
   nios2     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/10a52963579a485ae772441f08fb0369a1112027 |     
    i686     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/7250b40bf66618080a89d2583f4f4028055ea642 |     
 powerpc64   |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/84e40af747c8a34506043d36806e0edfd8fce87a |     
   mips64    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/19f35f9fdeb9a229002939f0f780f0e697591d5e |     
powerpc64le  |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/22251435c9a8c92fd7f6c85231bf7cd509df5bfb |     
    arm      |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/37a2b077f828a6a011437c4d0fc766d3f3144b8c |     
   mipsel    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/7251d217401063bae490a1207c4d83aefd611fa2 |     
   s390x     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/95342e605323920d012541d8048e4dcefb589bd1 |     
   x86_64    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/6b0ae8daebd2ec4504ce0a3c5c822ab03df04c95 |     
    mips     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/d6a4d5fc2de5ba2b69549f71b285aa22d55bf5a5 |     
 powerpc64   |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/b9b2c8d4c23b685a98634011ea74105c1cb9287c |     
   sh4aeb    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/0b7f0f581854b2559256e11d0d9dde1aafc09597 |     
    mips     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/fef15efd1da28f261ed8196ad2bdbdcd6bb684c5 |     
   mips64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0cdcf4dcfc2db019bcc9c3747bcbfcded6c668ed |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/8fb9b9925699e5ba2b2c8301c4bec6882e5238d3 |     
   xtensa    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/73d7a41db740aa9006b5198594a50ceaf07485d9 |     
    m68k     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/9337fd8e76eed7c19c555001dbd79b42510448b3 |     
    mips     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/f7e6bade36f77ab92d53a21caed418586cfc3c36 |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/487a0e235479f89bc6372f5a7040c8498c18bd1c |     
  powerpc    | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/ffee0798d9cf6237877746a0a3aac7c533f5963c |     
   sparc     |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/cceaf9bbf47f4b6d993daf9e99e722df2d9fabf1 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/67d9a69b9798612a075dda5f044ce99b41a8f54d | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1c90905bdcdbdb404833513119e9a274fb211b37 | ORPH
   arceb     |         dfu-util-0.11          | NOK | http://autobuild.buildroot.net/results/8682e356a6f415cd9582a9b4c9e9b8d7039b8839 | ORPH
   s390x     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/2d80418df7ecce2d09eeecc39dede26bcaf41aa8 |     
    arm      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/c87765e94dc353fee5c3d0b0a7236bbf1695a3f6 |     
  sparc64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/1ec823ef98beedf082f8fee7d29f4a8eb9d5a64d |     
microblazeel |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/bda07ab32480560beebf1d667bb139294b9bd9d6 |     
   s390x     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/a08bb81ca444b44453b4bab819ba79de4a483102 |     
    mips     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/42a6a482d0cdae0e5d5b62b172c991485be82856 |     
    i686     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/1b1d54dbb19d1ef68796054e17a40379eb8c2547 |     
    arc      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/39ed020156f277581ad3c28e4e470c6eb8464d15 |     
  mips64el   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/ed32b09c7238f11b4cdccb7242d3a3babc69bd18 |     
   x86_64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/62802e40e6dfcba07d6e3c005c6e8186cd082909 |     
  aarch64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/dd37a59dffb86b2af120bb9514522b77f99e0436 |     
    arc      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/87be44c3f077320ae2508d58f5aae4d23fbfcc93 |     
  mips64el   |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/7ec1fa8a9c265b7bf984d443d2475e34b38032a2 |     
microblazeel |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/248e240a3e1fb23c792afda25c9da2e8377e6925 | ORPH
    i686     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/6fd059b4e7f83a38683341ea1ea02e13d1a92449 | ORPH
    m68k     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/7ec6677989d50d410580449da634bf5696ab7e98 | ORPH
    arm      |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/cffe9b26cafdb5baa21c6289ee94ecca8a819f79 | ORPH
   sh4aeb    |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/63b65412bec13cebb5430e6bc3bee76bf0c877cf | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7ee9e008860dc8d0418556f57bcf6f1ee9d83825 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8ee4a10499e5b111443baac4794b0104a0eff987 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1bf6d96af85295dbad4ed28e30c2ab37e43c286b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5fb071bb952b69ff58e22b6bfccd8ff4c69cf756 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e32534d166a4e5f182928d847477e2a5a275b579 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/33017880c45ae9a998cf454eb9e707de587a0ca7 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ae08c1c3c7485b6b63e71699aa057ce952f18b41 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e6a5fbdc79d5318d71ad94d7a3aec9e960d157bc | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b6d9b8b66536cbd12e1d52d4df88581e0579350a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/752169ebba20b0af9ba137adda360aedf69255c4 | ORPH
   armeb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/36bd789e79fbe9a1f98684cc17db7156c24b811a | ORPH
    mips     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/652e5dbe9324eb5753025b5f863d5548b8967c21 | ORPH
   arceb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/d2ba0fa72bd2eab891b0a4c18af49e107f8eeba5 | ORPH
   mips64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/390903ca4d505d317897c1a0734ea779b587848b | ORPH
    mips     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/fb7f99792d570c12a3d7752974b5111a867f814d | ORPH
  mips64el   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/e2c714eabf6afeda40de57edb1b9935f65a6104f | ORPH
microblazeel |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/98de3922fd463d854d162aaa5001d10b4b29b288 | ORPH
    arm      |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/af3c2ace2ad3a01f9f2e16cff382092583e47dfb | ORPH
microblazeel |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/3efadb3f644610944b3401ccb6ac643ba7a24c52 | ORPH
   armeb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/96dad51c48c4b3006f4dc75f132ba00dba082b90 | ORPH
   sparc     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/0f7fbd0a3cee9c5876d3bd8b740b54af352d0c0f | ORPH
   s390x     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/1cc93b6bef1f3a16305f6d6514ef8524b9d8f5d1 | ORPH
   sparc     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/e8bb8a70c7053870802ff7a5afc560ac052a2432 | ORPH
   arceb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/910c597f5d5a6db436833c7123c2cc396e119c22 | ORPH
    i686     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/af0c030243e8de92c3205ff5e8c28eb93d416648 | ORPH
  sparc64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/958ed5600d8cb3c9fd5236c7121a006421f489ea | ORPH
  aarch64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/d855df5d5790cf9d24abaf7207d42c782abb6802 | ORPH
 powerpc64   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/1fca4e4a86ab002a0cc540eccf2d78ffc444145c | ORPH
  powerpc    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/40c53f7025111cd4040d8823599e4eea9db78d11 | ORPH
   sh4eb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/9fe78af61ef59893c01732974ebb0659ebdb958a | ORPH
 microblaze  |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/7d2c9115bf25ade332b34674785d259750b327f9 | ORPH
    mips     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/fd35c2414eecf4851e891e220e3e16c52796e0a9 |     
    mips     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/02d55935ffc35cb326ff6bb75b1451cece95f291 |     
   armeb     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/a2d2baba8edf43e75c7cfe2e87b092dc1d8aa408 |     
    sh4a     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/0125f7db5ef702b08868348f29f61aa5d4f9a581 |     
   mipsel    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/fa1020a613f315d6e380214aaa12b71191fbc222 |     
    or1k     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/2cae384ddc14bc7bc71b71a66cfac1a40a66d68a |     
  mips64el   |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/e5622fb95da69d79c550f8b0289d95d7ea71c753 |     
   arceb     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/482700a283acfffb22ffba3fd0c65d1f2acc7770 |     
    sh4a     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/c8aa5af42ef7da8efbeba101e03ac36af1eba703 |     
   mipsel    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/c1271a54a189c84c36d39c0b18b097dae9a509e8 |     
   s390x     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/2e8768298583fc5de6daf8dd4cddd8f1d3343578 |     
   s390x     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/765abe848d9091c72b13b387513ccf15223f71f2 |     
   x86_64    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/5545af5d0b171abe7bd42196aa6c9e1e103b34ef |     
 aarch64_be  |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/7401311c18b6dcf8b15f0d6f414cffe340c4a5f1 |     
  mips64el   |           faifa-0.1            | NOK | http://autobuild.buildroot.net/results/9f262736fe44bbdf6697a695420cbf16436bc75c | ORPH
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b91a75b4ffa327d6ea1ec27ea8a4568c4baa8803 |     
   x86_64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/4da4f5285b8edc5570785f7b713aa8e21dda4286 | ORPH
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bace989b0341da183c2fa1dcc9e6982f70fb6ea4 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/fc1b211ce3b766019865f600c1fd8c14e28b54d1 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8f10fd2b59548416b6eb3a09c8d5e1d4c83f4ff0 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/66c24326a64c205b31843c3018780f0742e4bade |     
 aarch64_be  |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/025ef7136bdad6d450bbbb15fc31c6c92db662bf |     
    arm      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/bcf5ddbab07470994af46b2eee8439dd9986c7f1 |     
    sh4      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/6af9c62248fc7fd96cb5ddacb331ea8590b82e0d |     
powerpc64le  |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/04847f9850cb78805b9fa4496ac996d110f4ed1c |     
  riscv32    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/3c032354fcbe8625f7106116d37083a55a0a44a2 |     
  powerpc    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/aae841663d3ccd2ffdb901b2bd158beeb762b5cf |     
  mips64el   |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/ae52c02bb28335732e8eed9bb8120c436c3d0b76 |     
   sparc     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/769a18a7c6bbb806cf6427048941efea12786067 |     
  riscv64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/ce12519bb05c177cbdb0e338882b245c644736d8 |     
   arceb     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/909ff4c94f26fede3ffcc5750f899d423b1f8be5 |     
   mips64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/ffe48bd268e6361ff42242f7f11f9226a2349cf8 |     
    arc      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/198db660f1730804a2336330306d6f380d8a58d7 |     
  riscv64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/90976ab1437ae50acc3ec3d90feab4ca9f46fbea |     
    arm      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/393eb2cdb1c6006dae53b1282310b506af0a59ad |     
microblazeel |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/74f699e9f96ddcd90e7e623cc680b4c2191bdf0d |     
    i686     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/fb3edc5d4c89cc711fd5d8edd1ed8e03fa7be156 |     
    sh4      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/bbc8364e63f62de842d9da9bb7ffb280504cfa4d |     
   armeb     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/2daed49cca6ff8c9c02e9d8cf00f2a62b817ba8c |     
  mips64el   |           file-5.45            | NOK | http://autobuild.buildroot.net/results/47a8eec68fad2b4cb9488e7d412546149505ff74 | ORPH
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/f4dde65fdf4bf3971e4c6248784f24c322c3b663 |     
    i686     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/2fd3c19fe0fa9b4508b870ef0d2c55d68f4e6259 |     
   mips64    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/7c6e0a159720f2bb372ad49675db1fa34dbaf834 |     
    sh4      |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/3e8ed38bde1edb11ced1a264461af81ce93de9c5 |     
    sh4      |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/c4099ef425807e003c48527a2075e6fac3b3f00f |     
  mips64el   |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/c12b09e35329677ca98a9b89c1bb7c5903ce3778 |     
  sparc64    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/0e28e895a7491e18a77750e947bc071b7778be22 |     
microblazeel |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/106568a4f2620d7ccd8ccd595213404b69ac27cf |     
 microblaze  |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/1655d4cba1d24b7e685b530f47d5a2423e3d1d38 |     
  sparc64    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/e40b7bb66df883746d07c0b083eb6abb52ba7842 |     
   mips64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/ca21dfcf872f1b83bee2c4b9772bec69e35d234e |     
    arm      |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/e873710b375c311288c807778fcb45ee0f390886 |     
 microblaze  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/9946ee199dbcf5fd0b654e431206ab45621b5f0d |     
 aarch64_be  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/07366c650a837993743988117e1b17f42b92e156 |     
    m68k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/2526acc3f831e652b4a5fdeff6f866a56a72ffd4 |     
microblazeel |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/87873b79d066082fc991879cd4ad38063bcabd70 |     
    arm      |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/4bf21ff28cc65294a846f80d191f76b75508b0c8 |     
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/f9814253a23369aadbf6ada3cf02055ac29003dd |     
microblazeel |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/71507e7fbad4d8caffce061e6c3ca160d0ac7ad6 | ORPH
    sh4a     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/08bb78246d95604131bc517de0a6d52fda602ff0 | ORPH
    m68k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/b238ce50764c9b6e5e247b53c0d401d6369f68ec | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/60852e8853a0d53ba3e11a145ed1fb3cb2dcce17 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/fc422c21de218bd83ef05b95b83722785a8056e2 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/eb8a95262296727656033a615538181c8018225c |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/2ee73864fafd6e6f40d00d8ccfd68d4b88a8d2aa |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/74e46ac22ffad227a9d0d2c9d1e5af5186b61234 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/f05c0eec3c3817aaf4d3c5ad7e0df30809a793cc |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/1afb53cfe680f638b5ef68bd5d586394b338771a |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/dc1a4143ab91387c1a9f6878e1e49c94db973f8f |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/db97bfd10da28bf22bd35f9b647e482c74f103e7 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/f5810dc46e3edc4154386a360e1d40e17492d466 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/37e61197bbfa261398a1849a4166d3d062fcc3ce |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/33276d98cac4b4cfcf4b2ae1145331ee54a58c0d |     
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/6e894b626263a009bb81bebd7e0607d9543d7fb5 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/e2a8d8c304f166dea0c0802afac12cc612f51428 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0bb353e9e29990b2c1b5a4ee1b22237a4d375a10 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/197d6c5d6f3606f7de45ad30c0185bdda16fb9f5 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4ed0f7185c690de8ba49b168c32110ecc68a7f0a |     
  powerpc    |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/fa354a89ced8f32cf9dd6849c5f7e75261ae654c |     
   sh4eb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8dc846e5cac284b5a1cffe7a15e2dac87c9ed7eb |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2c8ead4882a29a459dc9386bcf259ebb6b691b21 |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/764ec31c859e11a108a13b756e8ad019f8606968 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/40d2671c94d0585a8c52ec9fecd75ad259f94fc1 |     
    arc      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/552896e6f49a821d1041c492aafa85b40e11ae04 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/cac4f6da2e7c2c314b6f8db785b8697c34b5e8be |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/429f19bd385fd557cff2e25ab8a54c1a22cd3841 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a215dae4befa27710a58d45b25af76fd468b63e9 |     
    mips     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6b8b6c493acee471ef478d6122a074c544234ed3 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/57edc6a517fe356e749123c3b3b1a81062b81a2f |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f9f902fd6bffa102b678c7eeef05db3935570bf8 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f672d0bfe2397ed8ae2ee5ee0b03f0854fd79271 |     
  powerpc    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/523123d29774a03944a6d897fc3ff20a63fb2f21 |     
    mips     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c51e04493b23b65aa9f2a6bef6a3cca14bdbfe7a |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/38bc24cf969ce5ae1d83b6a23dd102d333abf5f0 |     
    m68k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/305c92f86244255c78131b1fe73cfa812cea6d8c |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0ae7a93b8ba1615127ff1df424021ed788f6c5ec |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a1c0df9a9c0e2ae32501d997f244de688d981e48 |     
  powerpc    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2613b50acb59bbec60effccbc13453f5342f5e29 |     
    sh4      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/09240c63cc311823d02dd7e7d2601e49b3d47e7f |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/367d20f3e76f1f7ffe4ef698f713dc08ba32de93 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2d0a873825fda23c686463a24577b733c88c944a |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/4e9694d1e203961d084b94db0b962aa80de4ad02 |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ab547d8f63ad74d2167d1c11f79448364e674158 |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d5f99d90563b41037c0996735a27a4149d3f5716 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/80530832e313dd6633ce32b8659e83556f991dc5 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/47eb9a82e178e48304285c333f85a98f9fcc8173 |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/323dafe12d1fa02cb7328bae7c140e5a7afeefb9 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/cb2eb03d84fce37654e59ead6374231c121a9c9c |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/7107e6a520611002ebb6bc81cc75b100f8136ebc |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/5b3e00edcb5a928db24e9ba2f80161a43cc397b6 |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/bff911f772125cd26408d8dc3ca5d845cd901d1b |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/46dc674759545b1d74e99e859a59fe551e1cd8b6 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/056f4d5a2ac1073fc2d882e9dd6290adbadb9e1b |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/449b5bb3768f9bfa4cfa709a1816861c97114636 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/20d8d93053791d63bff792cc115ba58c012786c0 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0a89d93ac0e23013856384386ece7caeeeac0e50 |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/050b8a69445ab7a7a2fd592a9f28e5d159270a54 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/420e0e452f4277aa8e6596a7048a2af356bc5d55 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2b8402f6ad0f48a30cf6ceec0ecc342642a2073a |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9aad7bf89232b62554796c7804ebb0405987bf3b |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/650fea5514a2dc3cb099eb171b6d77250d4215d0 |     
    arc      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ad2cbc8e24eb5c35b97a5c646d2878f781e97a5b |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8128639a8c6b2a7bad72a440f4654e5b174c8aed |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2d8508d2809109ac9631a7db851c290045719654 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/dbe23de9ea970c4a7038e1a130ad6952acaf5f54 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6bc40d2628429d588fa350e2d9f3fecf08a0f5e4 |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f8071b49d6b24a0ebd1982d72ac3e793600a9ff8 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8f9a990d82aae6a5bf113f7223a71a66be9826d5 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1a4d05ee7b0cc8c67715f708817da08ddff9ea4b |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/7b2d8e9ee65fc5cf374e219ac18cf984d3cf06f8 |     
    sh4a     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/23fd143001cddba99571249cd26a3a18ba068692 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/fe4ea1642b26343357e412ed74dd4e9995f3ecb3 |     
  riscv32    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/cdbe6e90b2f6e9bf74d35c786cfdf9aecb806952 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/058354b2ec72c792bfd21e3cadf4540ba53cfa5e |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f87ae755ac76cb4ffb370cc72a460d38f6918498 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8580b7549f189fccebd215344e5597a95247a890 |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/e478f604c62177dbde442eb252836ee90d364c3c |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f0872a49d297242a87febf16b153644c7b79d37d |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/37eaaa6c7a736862a9e5cbb8bbc5829639560a6b |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/beb640491f975f36261295dc2791879cb6671af1 |     
   x86_64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/522ceef574c61c638128748bd20b02a10a5b806e | ORPH
 powerpc64   |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/400910a0febbaeb2e5e1872c3ff626b0b1dd7664 | ORPH
   xtensa    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/be440e4be9cb26c23b66656cd76f811b8060744f | ORPH
   x86_64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a5ee85863a386aec4273f79e6730f29fd6d8520b |     
  riscv64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/4a6fac97056c8b34aa0f2ef1e86170e6addfc450 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3cf4971aa1919b9769753da00ca95996c91687bb |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7cbe584c71a185e8893ef26feb584f0cacce04b9 |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/665236d2f205836bc4df38384bfda26ce12697b3 |     
  aarch64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/21de9d8c9e0d1e4f665d0d31dd22e729a1dc571b |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/390967e0c15778fca2b16f7f7aa830fec53edea8 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d1917720dbdd2f01c8c3ecdbd415dc3159de3b97 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/aefa0e3bccce60671d9327f918c8670b0b9f4895 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a22c9361c5a42b085375a23c7918ebc96aabdb11 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ad2a0063fc83d478f12774c6b361310867e5cafd |     
    or1k     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/9144ebbd270edcf5ab07d89e57c6d1ed5891b125 |     
   nios2     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/11ce166abefe0313fc31c20a0d8b923a2c6beefa |     
 aarch64_be  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/edd084b643c70dbf58a54d5e3dc2b81257bb559c |     
 aarch64_be  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/ed2e6f6a5596b4af675a7650407e1234f32f2db8 |     
   sh4aeb    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/6897466f30378921f3b7321c961e39d5d6f243ab |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/248bce2d72997cd3c81c87f128f855d5091b20b9 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/661694dc8877e685621c35d69e79f7926ac37176 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c171f5299d2919312608f1e66a6c88abd41e1729 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d179867a967995a883b9e6c9cce252013f603fc0 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cb0dc2bbdd64894e300fcd27907a16ae8cde4e2c |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8861c1038ee85373e494b2517aa48079efa8b1ab |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ef87241a4946da218df83f25ef0bff7a8d03c0dc |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eb718dae1cffc929b2d7bae31efe494d485e468f |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/be6bff0fe27a99e95ee0ccf9edf65540e98a19fc |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b6e5dc1205af86b6b17ca822910eafa6583bdf3c |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ca0c9d4eb21b48248d18776081f0c57e6a4ff9bf |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b94fb812db93aa5724b894f91bd6dc7fb812577a |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cc5e64f9449dde2d4f5916857d0c8a47380daaa4 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2cf2a424a0b425026c38195903c87fd38490667b |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/77aff5c7e3ac5b2663a8e79c67fd176a3bf22bc2 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fe0d5d4bf7259b0bd62ee32e40cd0d7f8fc2bce1 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/460196fa5f60720d925a9e124e86c799e8c369bf |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/da0f6274ce9dbd9fd7051f07d57f57ebac14ed45 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1d2e1f0f7cb7425c9d4a6b7cbf255816094ebd3d |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d357e37b49fbbebb8829e9c4b947a81598cfce96 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e554d5f0b20484475fc28ce453c823b71e0313d2 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/81c9341685a183519f789afb670a632399d72f64 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4f8a5fcff9009da9ddfb59333ad446a0369f48bb |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0a7d326136af97c1b10da1349b772f4f697822f7 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d25fc7b11ead4e79e30c68ee339ca3ee7b1a6515 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/98bbe4bc9f94a7e0ce1fdc4ae4299845063a9b5c |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/38ce8dcfb93dd1406df14775f51e5314fa2fb469 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1331db58bc5f1a6bb74b99c7350cccb2e3405644 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0aff3f4f86e4422261dfb8ad57bd0f818196b840 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1325a6236464271f835eeeb9236b94cce231f957 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d8b9617ffd51fa6473e39e68ae722f58e8f27280 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3739df2d041241fd3c57937e3108a7f1af2cc6cf |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0be1e08f26b04c8c7102fdcbc5af928872156f74 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/59463aa6af3992df18ca82dba5750295eb63e794 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/24a67b9d7965302782020e0cfb8b9c49ed476cd6 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3a276e2d893b1058ffe48f68abb6252081af223c |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4a4fb1a7c9a9e5fbfa39b147d73472253f16e5b8 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eaadd99532443dff639e847bc0172eac9f367347 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/18a2bdd924ed1f8136a4e3ff903f338bb085f973 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/02056474bf10a5ff8976712542536e01bc12ea61 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/39589e55d42bbf2419664e253c8eec177fd9cc00 |     
  aarch64    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/b02b60225c756870641f8a9d71e5e640ff22326b |     
  riscv32    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/d30840c34e40d06c7d2d802e3664a4dd3ddcfb28 |     
  aarch64    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/afd721dd118657177bb11ae2437488e77b1d458c |     
  aarch64    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/48ded7cabd028f8bb58ed83c201e3818bd5070ca |     
  aarch64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/50dbdd9632be311a0179a0c1e3d305cd7d5e5f46 |     
  aarch64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/51854a30ccdc8b080606ac1e7f285a5f984e2515 |     
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/de1b4a15f485a539ea53bd0950f06e80176785da |     
    i686     |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/9433e17f47df486743d98edb2850f31e463fda0b |     
 microblaze  |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/e560f913ce1c7af979efe4a426da4717acd6ff75 |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/8478add947a7ed891b94cb52a4dc67510a839d26 |     
   armeb     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/d42e6bd226b0f9f170dd02fef4e89cda19308e30 |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/b62a09e37faa622219654ac259750f37bc6d9f60 |     
    mips     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/4dc9cc9a765874be5c9b3a264d6d6fb5c5fab088 |     
  powerpc    |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/1eefa39e6ec5735fccf79f6ef4770b723d475606 |     
   sparc     |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/f000f965b220dfa3cb5a3305a07b45a22a6a2928 |     
 powerpc64   |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/00f8c295e9bbe2e7c62662c643b996d9a58644c6 |     
   s390x     |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/713f3d85aeeaf56d0d4552dc6a96546bf66e0e83 |     
  sparc64    |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/b82dc9c2de14bfa7f2cc1707d3f9eb200ac453f9 |     
    arc      |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/fd3b92121669346e35f71b21b2b0fa4bf9962292 |     
  sparc64    |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/d05490443492745cf4b9d369e610040aecebc54d |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/1d6c6fa0055510c01a6a3d4899043f3d75da4227 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/1d02274ebcbe26551d06039f0431edb44dd70492 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/aee78a8308c58bc80033950582c45c292fd8668a |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/dc3ef2b26778b7dc09b7878b902c60b9ef4d8fe9 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/b2b28c44a863a3e45c0b5a6b003baa19cab08bf3 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/8028a6cc2f874cb8cbf35837671fac7ebec541c0 |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2ef7f16985719a47d88eaa38d662b774acd97acb | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/96ba2480a944e8e5ac0693a3e4d97435eda1995e | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/04fc459c2250b45b54053482b7244e2705ebeff3 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2a4cd529cae19190a06bb6dfc46f45d68162dad4 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7982cec4dddfcc92fc200544b13b9714f596ef54 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0a611d655dce57c161d5d78b3e503ccec1b64d1d | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ca81d4fee6fa3d01899412a765a399abc971a9d4 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/35c3bf9b7df61a738e8bacbceeab0a3a3036cdb3 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d9f305d81b29e6f993df93d21cf7443e16b78dbc | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e7c2f9b0aa6f3db8c332d5d23104178a260e8462 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6152e98bb3475a6d866df53c27af4060b2039944 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/86c8b705709af996871cb1d4a841b9ae2109695b | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b3c7f80fc68f5b2c3a9c58c831e3bb2129ddf6f9 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/524847e27b3dcbe1d623d567cbd82781f5cb9e62 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b547743f68e546a6aab448011dcb993e51412771 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/87230311eb0bededc032fd2346a340dc68f3da18 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ea30e95973f2f52493f7e230ed49e4f378645f80 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/880cca7eb5663b78cdcc8aff96124fe2c06c70ae | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f00425b42eea252c5e99591a77c2654029514001 | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/858996d988dc611db97e9003f4ea079345879e20 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/aa1438bbb273d3b6331024843eb50477bd748dbc | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5af315bf5a0f21c4ed3a9d769dd254601255c6f6 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7f9d25da03db9af40d8e1e3633aaf8b9399835a4 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b96e274aa8d2b099530748a1adf37b012d8ebb21 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9216b31053733c20b26a69aa045e3aecb903e54d | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3d497e49d9c9c736aff48136644358cfaaaad43b | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e7250e4e18b1addf2821658a8bf4ed690e758a1e | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e5d553ed76cc66f3b345d60f676a51c506c51f13 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4c0e28aecf9dc0c868487877271d73b4889f9646 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/936258fe44dbf4dab347afaf42f918feda2b9dfa | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e5af0993bbc9b1981897b273520f971e84388498 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/28e11c30c2eec0243d08679e67adefeb8c1381c8 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/24e7b42f0866b7aa46b7cb6bbf217200ee39f59c | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c74841e9c1a2b402c8fee4239807e9ccc6ca15ab | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2fa4decd15f2a76c8f80e535b9fecd495722d7bb | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/378a2746a7cc406e25f203399c053855aacc4d80 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/36fc03b2776d656c41f9766838bb637c3821fbbc | ORPH
  riscv32    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/301898cd87981d4f29cb4253d5b647381c54937f | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e00aad84d9db571c9d12c0fee0e10ed957cd80c1 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/03704a4fbd27caca778af8477264976a86b1767b | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/227c3623e012236d69daa57f1182fd69166facca | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0f08bd50a47ceb8ecc1f26dfbd93714b2e8623f2 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7ddea7dc3ecabbef627baa771217d26b222abb77 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/85fef8514d6052e59797b05fc41e2875253fc63a | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a5e126f9988d76237de70aa794665dbf329a8397 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3d165e8f1053aac697b94e1d03e63fa2d1f8423a | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/95e3e06d2c60ae96057a5a0bc45f73bfdf0aa854 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/db9b78e80805459e9ef950d642c306c275635d20 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/61ce1983d3525f900eea958a544616f9d31fb8de | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a4007c27a603f2fb4a627bcf5c26b1f9a1a0da20 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0aa491b5e256e1f0c020ce7703e2286cbe43950b | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/315e03c8575916e8c70474342b442a4d50b32486 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2e4c7afb14a013fb03f48021a1be2ba06b97f1db | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6e7ad480d217d323488911e50cdf2b42cdafb481 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fc517e48c365bd646d4c4c97cf4a0c0416c46b8e | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0dfde542b63b8f7dc855e61d89fa577f04b7f6b3 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b2c6dc04143a4596d0461fa1185fcc1a5e4fed94 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/905f05ee4d566fc25d84a94892bd9cc7d4ce7565 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/28e48836b5fea1703833ec21e8199d3de6b87480 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/24cba6ccf6be5cbc8cf0d7bc960b66341962d225 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c43fd4ee0e05b9635055c8d0ff2a1e77746ba213 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6b7ef6333c101fe2b0606092fe0fb7bf104ca984 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0169bd283f6475185480873335edec6f49bdbbe0 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/76f24816b96ce150f2c810acf644b8278c635747 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d1c1e3968b62d552dfb62d2720fb99ea1f5f5eba | ORPH
  powerpc    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/26deb11ac515405d6c74c3f05d7282d9ca649478 |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/9c0e102094d3bb327e9fb349637225ed7b3ea830 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e390b79eea121596cdbe503b9cf76d351c51aed7 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4c85e3c31f4ce17bfcda5bc5e4bc934292012103 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e2525ff98e62ad101aeb8a78cf4e4fc56bbd09ca |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5773bc19542f063bc40087110ef3383eb9a22c79 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d7f1607b47103faf5c49eeea7600e4700f1a0c9d |     
  aarch64    |          iozone-3.506          | NOK | http://autobuild.buildroot.net/results/b10057ed668a3dceed4ba9e8ca88199e4e85f767 |     
   arceb     |         iproute2-6.9.0         | NOK | http://autobuild.buildroot.net/results/bac68bd0fd5c7e96c2577ed6efe8111ee1f1f7a0 |     
powerpc64le  |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/fb85c9d59db57362d99bde334ab193d3d0e48949 |     
    or1k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/28ee10095c10b2c42a39311844823a4a45a082f2 |     
    or1k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/5f878bb348c8e5f720c2a2ced34d2008f8b3d65f |     
  mips64el   |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/2df9a1b34d22f57bd069efa9130b3c2c87355d85 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/f3f38444ef61fd87472fcd08d860a767825597f7 |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/4591843ecff3922ca8f3b9a605920eaa7b7a0559 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/5d971fa31904869926f4ba5bc25e1cdc0b72dcd4 |     
   x86_64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/abb46dd896f072245ec7906302c61585fd355dd3 |     
   armeb     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/94bb4f56ae7c905f38b3101b9b1afd85cf3643e9 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f8c968c323079c9ed40569898c838264cbe6778e |     
   mips64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/523c7075b9a20608924c1c7154e44854f44c8e82 |     
 aarch64_be  |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/78e25472641e4b7a5835481193dfdd329cf25d8f |     
   mips64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/0c53ddc351eab157a09bca36f9509f67602c4f53 |     
  sparc64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/143c1abdbc041af946265b4bf8855dc9e33a95f4 |     
  sparc64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/114d4b32ea0f31744ab8d42d319d6bd7deb3f474 |     
  aarch64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/2b09e32c84cb008630e5aee366b8cdee798372f6 |     
powerpc64le  |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/6d9b736dd5db37babc0db8c6fbb7719603034ee3 |     
    m68k     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/a10865eb06bb24ba6f186911c90a15b2d1b0a662 | ORPH
   s390x     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/d5a5a831a3f3c81d97f080e06fa6d3be0fb8071b | ORPH
  powerpc    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/dca8537b07cb1a23002fdd478c9515baffe5f7f0 | ORPH
   armeb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/43185a5a2189172652ecf2cbc880566117140e2f | ORPH
   armeb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/9dde73608d55554b2698d44e427062ea5d0576bb | ORPH
    arm      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/549106256b5601d481aa1953ca36d0532dce5b76 | ORPH
   sparc     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/5ffcd8be7198b39c19f2c33ef044494f3c2f7c69 | ORPH
   nios2     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/97f8964bdabe008effc9a5bc538d39a5924b19cc | ORPH
   s390x     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/5986e23de8d4e625109aa11e6e05ea10d6714579 | ORPH
   x86_64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/9524a3e92952d47cb7e94509bb0bac83f4bb7838 | ORPH
    m68k     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/6c71d57941ef291a2515c14aa2a805144088857d | ORPH
 aarch64_be  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/665b286bcd50a1766ec74c12de3aa2e4cd1608a7 | ORPH
   mips64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/e8e5236f29fd3861e26090b3806be9012ade8253 | ORPH
   sparc     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/6741dda7fe1fcf31e937cdcac82fe479d7472692 | ORPH
   nios2     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/1cfc9964f6346b756e7b8f6520ee18f74dee3381 | ORPH
   xtensa    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/aa446c30c2d967ac7c6be697e065eb8d6e694a99 | ORPH
   nios2     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/67fdac3dbea6f8a7e78b38c8c3feeaf1b876f8a4 | ORPH
   armeb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/b4bd4f01b7c7753c1e7050e2450b7f616027230b | ORPH
    mips     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/5b505e81435a049f462f83a5d2e8f0f549f33691 | ORPH
   xtensa    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/0085615b8a50e8a98970c8259d253f49830c4e5b | ORPH
  powerpc    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/d13eb8f5019ea95b40a0e2cd12e62780862770e6 | ORPH
microblazeel |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/cb86e4c1636692fe38341ce65b162d1e11f7714a | ORPH
   xtensa    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/98f9948af674f6d0e622930212e13a960acb36a1 | ORPH
 aarch64_be  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/09fe4d627faf38040ddd6a727d56b1ca64789502 | ORPH
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/943b72f1251b2417c16ec188450f456c50c32f85 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/657881fda49c73a14384a5fc26b383f1e3d7bbe3 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/e597a8618be4fd725f26966e51e14afddca58cfa |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/4d50ae416839965d27dcb22a3e82af552f9d0a9d |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0f4e18b7948422bc738e70303fee99101d76a562 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/48de2be4bcf0aae8b1419ed64ade0075ba3f6e9e |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/e21ce25eb3977f7b53cb0da5b3645d95025d8eec |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f629b985714f842c5e7254845eddf8f14ea8a6ab |     
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/0728fb39e7358bba7c3e68c260767d3bd6dcc597 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4df79a107a4dce44b205005721f92ea028ffcca8 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f7e16a34ed3a545299a3ef5ab1e1f96c275e2813 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/7e0b450f0abd9306cea0ceaad3c61ed974b48cfe | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bb4087b57acc8954079b90865aeb5427e0bc118b | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/189a46cca8ed1e2ccfb9f9e78fb9677fd236df45 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/02da69bfb9c686cbb367ba630014265aca9e9639 | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ac57c9670385dba0ec41df0d2049fc8eeb5ce456 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e67dd4654f10e3bfb4612a479af06fba9c13d1a0 | ORPH
   armeb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bde317f2dabf29a2ed4e63ba32e18dcb1e70c8bf | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fdc54f2f6ec0860a6d4c6541ba5d14f4f2e915ac | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e143091e2abf48cf647ce893a616219c0e1f050e | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/104cfa6fcbe984b79b3f1d39ff6a749e7dc612fe | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4780e45164a417b64fb10027204eb4dd9e447f00 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/7f4145e348976e8de93850b40b9d5e07816f4bf5 | ORPH
   sh4aeb    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1409a7a861354a9952714a02f25af218a917cc02 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/30bcc6f9ef34a06021c5ee62d663665150ddf06f | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/109668977d07e199aeab031c19b95de1eef6b15f | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/44156d110850c427006e67602cc2e5e899c8a724 | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/db71029ec6abc4b48c789eeb86bf2c3132c6a868 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1e2cbd5dbdae120867ac727580e13cd1f84bf0e2 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9fe188228e48775b7579aa9b1f39466c7c1c2996 | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2596ff288a611562a3972d4d2d937e3e23511dc7 | ORPH
   sh4eb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ada58453c604ad22cd39ece3f761a58b3494d9d3 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a87267b32bfb4048f089c7d35e2541c94f2170ee | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/525f99f4d7122e27d7ad77b8566e9d5e5f1fa712 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f8dfb2f03ed9408b48bb154779e802d45ca4af2e | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a50a8d222dc90c0c14b07de7edbbaf04a7bee51d | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d9bba4bd1224933f8012002e6d29a01f695be495 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a6e140aae21bbe4eb7a6d11f9310c055ef578cb4 | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6212ce4c931cc9631889e1e84683187e2f144ad0 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ddb917bdd2199e5f825f5836d55b05b5fb40f125 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/511a1dddab091d89468299baf51c1e45f2642ec4 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/7bde823ab94a55813923b3556fdfdd8ed2e47928 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/5702e1ede3e027e0a3be24aa52fb58e805a650f3 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6c2b8f7bcbf14956a570030afc4e0773c8e81625 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bb91978cf09d36ea4101deeccea88e31443ffd86 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d18b1c510e78f2d3ed066b80c645897ea21b70fc | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/29f4331de2b0290ad422e5bb50e64ee04459e9fc | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4c0b5ddef6a0dbef8f117ae6b00546b351bb2b03 | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3530cf1a4230053a32be38218d246e0831743ea6 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/64e0cea8f610a142a92eae8131a76740a40ce352 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/76ed3c7f9cc81e62a992873e2d88728a95c311bb | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/36670b6e1b893a3e6f3f70efe3966cf6fdd3b083 | ORPH
  riscv32    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/8d57b5a828d6eb327651aa5a07cc2db86002c23d | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/813ba4961198102694bce8a719f5ae8b605d526f | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/76f52e0fca59003af590a63e3efe5f3a8e7281a3 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/408de6032c884840102d485449ac680852ef08ee | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f37370be4a32ab2c0936cdf685953cd6a80c1abd | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d42325255056bd9c6e41835ecadd5461c7d330fb | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e09b865228e9e68c648295b8294ee7b9bf5b727e | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9c8109d2c9b023b65b94b0a1a53cf0209601eaab | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/16a03b392ecb1340d5b038afdfc130fb9de0c9f8 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/333b98541147a25822810b8fa6423bde7eecdae9 | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/858fa80dadb942cd228614018cde9d3ebb9dbcee | ORPH
    sh4a     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/0e4f21f6e262cc5f9b0024a55d386fb6ba39a80b | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/488374d62d25d7f6b6cf4cc4f3979cc86661e9cc | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/0b0d5be541582313b30c13dd9a9f81e516e12faa | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f3608413b5e259ba13d2d13ac71f3f3b8b316b4a | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3e80375d883fd33d4c831f09163072d66820376d | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/11ac68db6a60dae246c59c1f52577ba032ac854a | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6d5e823cac2b3b7ce9235c7c6cd8cbb293665d1d | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/edf4510d519a2bb3c568c00a72e9cde2e4ce965b | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1ba4fde6e852c82ba74946be59548a09d0ced6ac | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2642d75e5337e18c00917f535b627fde09579140 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/21c8afea6f77a688c57946cab58945b4465068ce | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9650c36ead25711eea602687817dd1c7f19c8110 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f2ffae2aabe8fe441229f139b2e9a9ae66fd49a7 | ORPH
    mips     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bb3c398bf5d359d0fa56491a27b4c042c6c2b92b | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9bae75c6bb3f72a336f8327abe88f89c752caba1 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/23a25ce018e8fc8500b608c5c0ffd0664a9d1083 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e4bf4220cb599ed1e8f335b4e9409bdff6ef77cb | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/17a066f0c77ae49692a26ed9683a6b83e36f1b81 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4b63032cd0422889252fcd84778384234a1b7356 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/114ff3f5984b238600631dc675e0ca491c1c2605 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/7c167a7ce588f68b3d6247025881d131d06c6016 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2256092a417709b766f49f3ab87c1a2d4d7490b9 | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/99e9d33d006f6721aee51aeeb8cfc092a4dccda0 | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/030e9672add884e7a7f9abd93b7703897b1b9d80 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f85f70894b6daf78f769d27bf7c44652bce56ac0 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d45cab048f24f5c94943293ee23371f66e935b0e | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f523217b2ee0e905f8fed6ec3adf6942b6f085f5 | ORPH
  riscv64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e686e48a5b1e71b52fc9a72f8ceef3baf1a251b4 | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3c56a3a083c0eb35d45b4879b089b7ac0a559d61 | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/5ffb81746ef9a82ef6c11a0decfc724df5392b32 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/565b48b94dc9a65358fc8b440c631f80fccc8f39 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/50b29c69f60313d9f5171c07492965370797e40b | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a97f7ca91a0c2ea701863d9d740d72c0abe470da | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/179c2826c9a1258227c7b8762cb451cf443b3b54 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/08bb4f38901bba1c96a67c448b39c0cda7078bab | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3017ac3bb9cc785fa786908d4e2f43318fdd96fd | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a9ec827e9df52cbbfd0256f876d76d0acf84d416 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/51224bbf656c66f5353d1ca71256b29285ee6045 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e8efa59ee1aab47b7b7182046a28833b84c2b228 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d4e8b670d3887a8910433bf57dbef33bd3c194cb | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/32a9a4640d2977b9f931ec7236bd1ef690696dbc | ORPH
  riscv64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3ac354ca8acee1d1e5a7dc8e8ed7d7e380c15ae5 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/5b01bb72306286801e8af3ebaa8dd038487879cd | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c49b8c0e014ed248e79e648a8014fc196559e0c5 | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3b8955bfec504a4f8b97439cc53ecbb329d34095 | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/77129be1b7722b830cd4f60797b66b959648663f | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/418e9fb6dec84ff231271a971a96505ec1bd8407 | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9f746c66d3440068a00261b78dccc6a63ea0cfc6 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/8030dd04d337dc2fce31281527a8c6cf4c392886 | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4cbf5f3666f426045ee5ccf001e046f58a47b771 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e2dfa066f090f094e8353a9abe9c63dfa8a3e57b |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/961e95de3c9ebe8ac2c5f5586ade8a5252885e2e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ef6755d95689de6e90013ad455be055d1157dcbe |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0636e24b36928a081b2398622f3ffbf8ef5adaaf |     
microblazeel |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/2e7605ee098d5ab12f9b032bd1061f7b57d10139 | ORPH
   arceb     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/3c5da9803667cf4a0122fc681449e6df5e8adc11 | ORPH
    m68k     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/1d1f71b7bc18b6da3581b95f4bf17663434bcc48 | ORPH
   mipsel    |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/2debf9ae3b3d17b18ac3af21e6e9b599c888b5a2 | ORPH
 microblaze  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/1b4acddba17d27279dd1cbdd8c7f6e8f15b73d77 | ORPH
  powerpc    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/5b4c0b4dc113994ef6712ab5a433afde8bab4ad4 | ORPH
   nios2     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/ae1e2988e57fe525b4e2bb6ffc9cb1c4502fa874 | ORPH
  aarch64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/aea103010462a6af82200c20c3ada9538aca7758 | ORPH
powerpc64le  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/eac7f364ef7253ed44aefb096bff1bfc99d981ed | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/9ca794d7378cb83c06d19c60aecf0e6088d016d5 | ORPH
 microblaze  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/be5643093e6d0667d6b0a24c74fbd2a62250c619 | ORPH
   s390x     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/237e33bcf533a1ff1c75cfe230dbe454c9debdac | ORPH
   sparc     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/13939ce13e93508333052ca9daedde50ac86bb94 | ORPH
   sparc     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/2b394228bfba7811c1a5f338771f7b304f94cfed | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/ecab27094729d6c6f01e1b7fabd5620ebf5029da | ORPH
    i686     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/8178f885619cdd0d27774bd93333fc5801bd4fe3 | ORPH
   x86_64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/3877bd1fb73045e70d426e0a197505ebf194bbc9 | ORPH
  mips64el   |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/36d90f672912c0c85d0612d01d09bee99b238749 | ORPH
   x86_64    |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/dd5649e041b6aa5c301fe780e4cb9055ece0b821 | ORPH
microblazeel |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/19840593fcdcd6591affd38dbc44a373758d96be | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5e1d7e6f49daaf8a885e97daa17e46e951f30586 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9fd6f3467098c26eaf0cc26d4e3f104aef35671a | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/95eab46b0797df8184ac8f748570706786d47a31 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e72abf0f9a981b89be5ec7ea0724a7942d4c455d | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cb39671a2563050c9830dca33ad7a6ffe0fb15ce | ORPH
   armeb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a071362fa5425c25d1e9714751fffa54ade880ed | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/35358cdc6a929a8f1c4d33f5b3088b5ba29b055b | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7cd15233bb59d26c269bb1f54f2d64b531a32c7a | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/acb626da8f43224d8714ccd5be4ff5c6514e2447 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0a8dd11f579af21f651ea6ff008dd5374cf19e15 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/14ba63dd9c9f375adf8676793ce5c824dd2a7c4d | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6c831eed4c4dc949f33c4326b245e3f5bb28842b | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/197e2e5fba24fc70e36a45a2af0e76a67852b618 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9d868262781450150c565f96ac28b877f3a71256 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8becba28355caa0076322159bc9d433e2a7628b4 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/09d74ab275ec1b101b83a0ee1717a2d5dbf89f60 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3c8710d7e0e001f26b4376633de56c3bf3fcc69a | ORPH
    arm      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d4190f71cdecdb4c0a7c523b568ee968001839bb | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/04eadbf08229e6e3734f4c8e2889e2f87f29f99d | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/83fa5bc4732963293dbd3c44ed83bf734fb0841c | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ff952d6eb0caf61e4837fe015ca3c014fd6e7879 | ORPH
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/031d867b7a01f314b2a594b6b122ec6e22b9c13c |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/564e3030057bf07e8fb3c4ca181f0991aedfbae9 |     
  sparc64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/a50280ff14ced2abb5bfff537da3a4a56ef5d894 | ORPH
   sh4eb     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/6b7e0997ba1c0e6664ac9f0570b4c9d2f821c25c | ORPH
 aarch64_be  |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/3591903d5b55783d9801156540dce3cc9d5caa70 | ORPH
   nios2     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/8f82b38c86291464734aeef07e11404c7d8f6262 | ORPH
   s390x     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/5f8ae6adcdc8b7cf2aec6f572c016002d25b55e0 | ORPH
    mips     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/784dc09b2f4b1bbae02f1e5678850c891cb6244c | ORPH
    arc      |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/4c290326ae296f3fb7a15ebd40c02ffdbb674ccb | ORPH
 microblaze  |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/432aaea052fb2d66589993a8f508360330e08031 | ORPH
microblazeel |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/7094ad1059c87f3ab3761b21587deba76efd81fa | ORPH
   nios2     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/b2d6b9234ff61cd79babedcf5bc47990f4a47ba3 | ORPH
   armeb     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/b92989e51e9aa7671e44a65575ff4bbd88e293aa | ORPH
 aarch64_be  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/2a983b0cf68771c3d1d87fa21d861c3cb88af7a3 | ORPH
powerpc64le  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/7a0d9f94f2e465f1e03e7e7d1749a2a33b0bc930 | ORPH
powerpc64le  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/2bbef51428e9f26e916221d10705466fc6599925 | ORPH
   sparc     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/f0cb4c5fd75880be3e13f1809948961d7f97d070 | ORPH
   x86_64    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/3076f408e410dc10a05860478de5cb073a6322f2 | ORPH
    arm      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/f2aace5d1566be6ea2dfcf64dda42fc14fcb17d8 | ORPH
    arc      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/a474ce8a63abd455e1844d8e610f756c349580f0 | ORPH
 microblaze  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/d243d29cfdc9da1ef8a8c9cbc199b87ad6790df8 | ORPH
   x86_64    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/215e2d8699fdff37387a44da7fcdb3654e265dc9 |     
    mips     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/2bd10b31ca6c2b028ddfff4569fc0e3c4e2bbcb0 |     
powerpc64le  |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/5e37a74fecda6d9b3051bcec5ea7e24ec02c2f8d |     
    arm      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/5f7df585eb50038c1f3f066d1a05a1e77894413d |     
  riscv32    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/a038f2986d77ade9bc76eaca29de7c28ebcaf49e |     
   arceb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/1c9c3a6726c8d476a8c42a1a5a32e48fc55e6840 |     
    arc      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/e2e73bf8e16eb7f77fffe6ae27a7c905dbb270fe |     
   sparc     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/a11f9ef89fb6f8e3ff8a48dc5e12b6500568a1f7 |     
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/8052fd4fdef39ccdad4b2d4141036658f70874cd | ORPH
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/c86fcc236a63c7fd170d8722578d76ef25d0d518 | ORPH
   xtensa    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/1ef73e11152320f49d1bafc6f48126b8a74dd0d8 | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/a70dc64eb7dae3f0a9b65aabee0b319291903ac1 | ORPH
 aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/6bb249a77292ccbb505a02d4918aed37d315a9c8 | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/d406c169899f988b77c6dd2e5ef71e864f7ed95d | ORPH
    sh4      |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/17ff16797212765e4930b4802d47e32a39a0e24c | ORPH
  mips64el   |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/0714582edcdf1916dd9552c722475ed0fffe8ed8 | ORPH
    arm      |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/ca1b8e94c37ea177c7219ed6c68b7055407545a0 | ORPH
powerpc64le  |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/b961eafde3f89f2f702fcf53033cd8293bf5bfb5 | ORPH
  riscv32    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/28fa5648232f249adab1304c5e9c3d08f1e422d8 | ORPH
   mipsel    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/bddce0443ec27a783b14dd0c852b1c6cec0276a8 | ORPH
    arc      |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/5e2263e73bc904cb569833a914d2f993938b5cb2 | ORPH
 powerpc64   |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e012ba60a82c89757dda641f191cd06ec35b1f5c | ORPH
   nios2     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/1b283ea5a5232eed62a9dfffbdeec8cbbf99065f | ORPH
    arc      |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/903030fff06256e4f3a708aa8478a2caf09d01b3 | ORPH
   s390x     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/3ab76e9ac89381802ff783b9bf701c645eace03e | ORPH
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/c8802435a27c4af8a46ba67f0c8b00a3eca68711 |     
   xtensa    | libyuv-413a8d8041f1cc5a350a... | NOK | http://autobuild.buildroot.net/results/e6be627597dd7f0138f77c93e55c3d580f765dda |     
  riscv64    | libyuv-413a8d8041f1cc5a350a... | NOK | http://autobuild.buildroot.net/results/5b39ea333657dc0f3c5de89ac7ef4861edbb9b2f |     
   xtensa    | libyuv-413a8d8041f1cc5a350a... | NOK | http://autobuild.buildroot.net/results/8ca446ee4bd657a661894dec66f45aa02b6a7325 |     
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/6ff3b7defc6d2c4e3557e66d8c4e4feba6972a28 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7e7bd052fa65da918c12f41d8def42dbc052707d | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/04a5211c8510e06923468f88f2f826c9e07baa6b | ORPH
  mips64el   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/7142bc5d92858b483d4ba33f927de0786c17ce30 | ORPH
    arm      |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/4ef906590176847a27326c845f692c1318fd338e | ORPH
 powerpc64   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/9c223db07489fbab6dd3fdeb402ed418fda93b8d | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/533c149f6e0429eb612ba1b70872a2b599d0efef | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/73a03bef7ee0b4eb0891d3e23b993f85a75bc6a1 | ORPH
    i686     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/769478a2e2d73e1800ba92058d3156e1bef82ab0 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/75dce77886145e88beb8fdb3758766173fc8d556 | ORPH
    arm      |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/d3e3e8aaf300e9ec7eebb03a84e7053aeb66416a | ORPH
    arc      |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/f5792b8bf5903b5edd0fe94fcac48f0b426c99cb | ORPH
    arc      |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/2134285db7ce74f53df2d72a87dde0ffd0be0c41 | ORPH
   mipsel    |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/6309af023c357211f7769abf4a9f0a5fbc002822 | ORPH
   arceb     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/bb23fa19679a5e14b76aedce9e98fb66ee6f216a | ORPH
  riscv64    |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/b6c15169c476964b7bd9612e4097e1ad44375f4f | ORPH
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/368de2ddb6ea923cbb53d1d68c414ff5b5394d80 |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/7894e02a3b968474fa4f89d8c471007ef5947fd9 |     
    arc      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/e3cef75b15d4a1e9883f6fe1b80f6f4faa90ea1d |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/3a84ad07cffc80f8cc2eb17d4afb8f1ab2f06186 |     
   s390x     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/68d8c7cbdb79b180aa7da6bff7f600a377c9ca0e |     
  powerpc    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/9e3b9b6da6e2dc1d4f2db259f05005f2f84ebe9e |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/bbf60a2b6feaa822080e62c6172ada261810a85e |     
 microblaze  |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/2093efa3fb9e6594965b565f6b438b96889ab30a |     
   x86_64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/5ce014b6c8c27a4b7d14b4df1548834e9057da14 |     
   xtensa    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/3d03961ee2a708d4621895af423900217151c002 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/5107e5302f0d5c7d66a52985cdb5f2cb5a255fb2 |     
   arceb     |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/a07a6fd0dae966a8423246a797ccdbd90221e5cf | ORPH
   x86_64    |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/6f45cb627f54d4764b903ea092e25d71befb30a7 | ORPH
   s390x     |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/5f3906212592b04a129dc2d492a9a623f32e2efd | ORPH
  mips64el   |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/b998032a2a8e77362c040ff0d71408338da54767 | ORPH
    arc      |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/fc6a97087868a4e90e9f49b3b02143e694247755 | ORPH
   x86_64    |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/417ef0b2a80e8ec5859813a9f16f773881899025 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/3f28031f1aace2714b167f40de8a3b15ebb4f834 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/2abbbd848f30f23a40f3a683456dc4f797498e20 |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/162a9851f8cd06da2a68dfd3697485e049680668 | ORPH
   arceb     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/a2d5349d8c6d2118438e47caae786c04f39751e4 | ORPH
 powerpc64   |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/a39617940e022a08d0ee10d52c95bb305739f00f | ORPH
   armeb     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/59118f612610bbea52bcfc977c0de35e78abfad2 | ORPH
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/c8eea5d08d8e9e98b57ad9a3373d1fcc640d8e53 |     
   arceb     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/413aa81d13b5b667a6ddfa527d9cbbed767e5151 |     
 aarch64_be  |          rt-tests-2.7          | NOK | http://autobuild.buildroot.net/results/dcad3e877ad06ceef2a922a9ad5ae9b324d3750f |     
  sparc64    |          rt-tests-2.7          | NOK | http://autobuild.buildroot.net/results/e4dc5c6e4e407e52c8eb386361e1387278e35426 |     
  mips64el   | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/4980df19a10fafece5a7a91c9c92b1c3f6c79840 | ORPH
   arceb     | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/df6036de43db830dd6dced0590fd8e256f7456a3 | ORPH
   arceb     | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/b531f06fde03ace3c4ecbac3e84df8e1cbe49610 | ORPH
   armeb     | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/88672065fbe6ab8da67bea1d2415c9c86080eaf1 | ORPH
   arceb     | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/241b2347fa65e7be32b8fb366cf82a986eb895b1 | ORPH
  mips64el   | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/19726a79923672ecacaf1527998a93b9413fe754 | ORPH
   armeb     | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/1bc396386aa3321fe48101caf9635ae41feb057b | ORPH
    arc      |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/76433b6bfac1c104e4b2c70b96b6ebc7b4e86c3b | ORPH
   sparc     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/f7cb6e6492740f2938ceb31897641e22d2effce8 | ORPH
    or1k     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/f6401e1e0c0a643bd559d41c2f781e40a80ce4e8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4f0e8f1887b8c1433d9a2ef3186b3d6a934e5d97 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/5ae5481002714736b00cb3eae8184958e7297f3f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/da18851a84f6a0891d7bcb8a909ab8cc8491725a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/eac2a8e0c7a3e146c8b31597b241d94731b5d874 |     
    arc      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/711d7b568fbe95657659b1c4fa32eddefe24a7a3 | ORPH
    mips     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/5e7e5a0eea12ba5792695c079080850c3c032754 | ORPH
    arc      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/e4bcc48437f4579f96ac3027c1b32b86d3afebc0 | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/dfc6b2d5e5505691182ba76459f80aae51e8d109 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/e318440b9df0d5c6d42ff9b21c13adf2acd101bc | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b1f29fe8d84aafce3dd86123142da19c5d55592d | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/219277738f554b7e4475afdead4ea6bb81aad9cc | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/38145277e605ad4b72cfd5cca0828bfedd9c7240 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/63dd5fda61e22a23930dba33581331385b47703a | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/95feb364d268b33a0dcaa60e7114d9d7f6afa5aa | ORPH
   nios2     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/d210e66aad4b550c0f478db155e2449e594950f3 | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a612674e722ff1cbf9d7f78d80efea63d2bbdcba | ORPH
  riscv64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/d7159e6a0d4c417514d4ccc356bc577d2a68f001 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b4e1be1c648b5dfc8dc0dea24d42626de9b2e05f | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3f0a4ea8cae0009fff7adca5a7726c0e784f22f9 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/420d4d82dfe2fbd6695e6cacc0871893e76c0d5a | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/017aa0008cb8ab4a1a84431744faa519109eb036 | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/dc83d30520309f612dfd967114f1c1e70f68a612 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/c03496813290c5d49ef2e2712beae34e498bd615 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/e0ddf1d9f5e6d46cef0ebd05fcfebba02ebe2157 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/c10f048b815378b9346f72b9568511f5aa5223f9 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7516d23ba85c19ead0ce2a00ef47a5b387aad064 | ORPH
   arceb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b75af14c71eb417d1db82bb956e608cb7d56485d | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/20235fab6d13ebc149ab3189d607683c9283012d | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4e9a32fcc11ca585ffd1e6c2d481826685390319 | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/17c954cf161f5d60db4405e06171c19decff1fa6 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/434882adc69c790951447ac5680829b2a5a2dfd5 | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9b7f906b73f3d94974532226f1df52bf6411efb8 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7d4524dc6a987e96e43b5361c3c15e54cd92fdcd | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0acb93efbd88caa072fd833f340260eee9b64d02 | ORPH
   sparc     |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/2b7f3ff41fc6510896cfa8b002fbb69c46426c7e |     
    arm      |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/f914234ecb2fc842cb7e7233f8bda6a5460adfa8 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7491da48dc557bfad1dc8ff9d8d2c3b65982192a |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c13ad09e2d4c799092f0d17216a0fdbaaa4843c4 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e160703e686174b5cf2ff8be7a05702b5eb15def |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0939431dcc2e48e16d9012ad28a40bc2b6428d26 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a997c8972f4d11944e9e81050bd7795f58342aec |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/94266d3b119439ab77f31003ea8c815fa924307f |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8a0252e727bc784997b3876b63cf4a3ca4c4e69a |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/889c55d0051557c3df14312dc26be39119a34d50 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e53df182a7357708aa6b95056a4c721f714c6405 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5e2b5d9cb17255f93059f7f212a5db6b5af48aec |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/63e64e818395a2efa7efef8f84e0de5fa4610042 |     
   xtensa    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/771ebc87f0c7119d8cc54da47ffe609e283fdf18 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/832cb27f424b95c267481dfc316a73de0daf327f |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/08b0bae16bc0eb1a35c91399a29f49abcf59ec8a |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3fec6685e70fabbaaacdb04cfbbbc35804d68e23 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/38aaf9c2e6c18570c3f80f13899e622d5d2bf9e4 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3842a45b5d0b5b5e2f56d3093e0fc4b3f428a5c5 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c45a76cc1115f01053c19dc73ec9f7d145393047 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9f6706f058e59620e0f4a48e986a60100101f134 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bf34d266879aa9532fd12e364ee9e0e698cfa2b9 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2de2700cdd150b8dd7d23e9f847e58c49e9573c7 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e1263916296b8e39f29cae4bf8dcbc3a8b039eb2 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ff32118ddfd6250fcf98c040e2535c618da7fdeb |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/aa3c54383cc88996a0fe34c5a8446b4e711acbae |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b503d379ab1a975a6117fe9c27d4550cd14b5667 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1d98e5c5fde6241c9ee000f1199a54ea7f51980d |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a5b737cd0aba45ceae086add848d3b0361afef4a |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/86166b3f8b7afe3d526bd34fd45a5fc41cb3d90e |     
  riscv32    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7375ad654f6ccc9435576488fc596c2a6d047802 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/afa348cddeccb0ac0de5b7e77ddba0f3b8f70db9 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4b8be9b34e0018465829d76d04e8086bb8e496c3 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f6ae136cc6b3758b2e1e27b0e4683cb8535c7873 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1b9e6f7e467b208cd372b8970519db46ce538768 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/518668a84ae6d5ec3f259f974bf8ceaee45b4268 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/26fd3b8b0f0b65d3b495ca8ec9eef4e912cefa96 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/32c60d33beca51d572dbb69c9267df724eaff8e0 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5ac13c7cdd478a872aeec30c85219ead761a7efa |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8f5b9fea4b15b1a39acbee626ebe8fd6ac904e7e |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/598f732f54da9f53c9596926d6cf49c79fb0b274 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bb46a7b2a4c2c7d68de8b4c52357fc0c6410f79a |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/14101e1a829bab5c69bf493a967ab5bce10c8073 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/313da5c1f11fa732b1327bbd3585f93f6ed2485f |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f80acbd93b8bb78ce8ae2ca07ca0e43047dee375 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/63dc5e617938b8b9550d0273c794047b18565b00 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bef06c923c48022f80dd40c9bec93f16fac1978a |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/31232cfb181072469989604594575e05aba42cdb |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2c1955cb69d97c5bb72b2cfd907d68c6572a5976 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/216813b05efbb14672dc66fae928688854b3c40f |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8dc22377ff04917b251b4dc51735527df2063563 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3ffa57f463c850b1cf6f24ccc13491b795d71c39 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/11c673a93fa6ccdab3fbae76519a6254e76a6a36 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d4f14af19ea54ba9e62f124e8a19c41e854f437c |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b72e21813db95a78ef25cf4bee273b6a4d709cb4 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7acf0aa4accda59447704f20973efe09affae8c4 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/aa934110d2dd7fcd1ad1abef356f633746f4b5ab |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a19b647d6372918769ed7dbf09a32bdb62bbf792 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/19d77252e99c3e1662d0c297720002a1ed9e6f6c |     
  riscv32    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f051388fda69bf9edace9059d8bae1d72d01f14b |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ea2d6c4df51e316847840235e32f32bae04ef95d |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/133c2c66562670a143e71f9401c11c79e1c4821a |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/90f9a43efcc829588f264c1c84574a6e7a62750d |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3411d8c3aa27f5cbe17befd216e3276ad060c15d |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b9f74703c26c1d5d94ec1657a21cb0df6a61dcb8 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/25dc43c48bcc80ba999f72f364e81cb0a02fe985 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7048879318eb0cb73cba466d56862f198e365c05 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/42f94e3fd850aff3133dd28ff83a7da8c146ce07 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/994b0c16bbb2e1710a1622a04e4b617eb568a61c |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5a9c24de67b8b59cb7182adb3a52a98895856afd |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3b5247b46f1f658060b648313a1ae9510064efb5 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/19cce69e96c2f07ccf38736e1ff001adecf3df53 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a79841442dbd874ad87124b5ff8393c14a5fb6ab |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3c2260f87af90104b6724a3cbd2742b4e527cadc |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/562653e4024215c1cd772184bd9d6de3311fc8bb |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c2f3aa03bc0abfbb41e90a58c00f7237d0bd3a0d |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/47d9a8102f686ee3782a75ac56255b6847a06348 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4fbb9cf97b2c08c7302353127ea06533ba9d14f9 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/30af119a643028f51c2a59ceb8c1c10f717a5335 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/36090e662a5884ebad363e44e3586c81b6a211fd |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                       unknown | 2 
  binutils-arc-2023.09-release | 1 
                  bitcoin-26.0 | 1 
                 coreutils-9.3 | 1 
                    fcft-3.1.6 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
                  gensio-2.5.5 | 1 
                gnu-efi-3.0.17 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          python-grpcio-1.60.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/e326bc4a42fdbb094d1f021e0a61545044dbf8f9 |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/b1dc112ec3ce9ce0d484b1ed7d4136edfd41d724 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/743b3a082c56b5a09d6f448e0f4bd9451b5d39c9 | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/7bff4b2687a9fcb0688ab4be8149eed15057c9ab |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/e79abfc5876773e5448028ceaf4d2b87b9bead2a | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/ff56a940b5ec8b11ace8232bf612882656b12751 | ORPH
    arm      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/bfec009b0d5bc11fb270b5ed4697644fac500f9f |     
  aarch64    |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/bf2c6653b240baba16d1ed77b9e23c5ab4a2e937 |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6e88fc18f18e2a5b58c3879807fd3a5b8a6ef5dc | ORPH
    arm      |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/89262a128218a1c8345db4cb4d0b72514df36d38 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2c393bb99c83be58144ddf9281ce1d323c86c8b8 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a27c8378388f8a1e0304964830f00c382ac977db |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.1 | 3 
                       unknown | 3 
                  clang-15.0.3 | 1 
                fail2ban-1.0.2 | 1 
                 gnuplot-6.0.0 | 1 
               gocryptfs-2.3.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
               libglib2-2.76.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/431dfd1af9d6eda2c1315cfc2a7f33f08ddcc386 |     
  powerpc    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0f6345781363a7dee2cb719396cb959d43d3307c |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a4ca0f71809b7dabe1bd0977d6aebc51fb78e080 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f70b07e37a3fc73d9bffaeb5a73312da11ac54ff |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9ebb12ffc0fcf0b691674685ff439fecf853df04 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/0a6d8faf760f2f7e2afc3dc96a4581b19276ba15 |     
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/cb22534c76016bd3c598bc1885000003297beb75 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/10b620b5a6c04cdfaabe84f83bee80a4dffb6457 | ORPH
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5b1f25a45dcd3a849f8850e08c252fcca891e871 |     
  riscv64    | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/813d3222f4f1e1df613bba4800c94aaa68af3e36 | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/476f3225b20ecf581a53e1a003d198e5e9b1447d |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/a39d20b9e037368c42f70dcb47967a2ee4711785 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/42cf0a01b3463a2685f0d927e4dd98c7b9f14a8f |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/67ca845c3b0196ec67352bc18990b8b2b73b1e84 |     


Gitlab CI results for 2024-06-28
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891216  |      
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891221  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891236  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891242  |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891253  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891255  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891256  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891259  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891261  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891263  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891268  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891284  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891285  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891292  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891302  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891313  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891319  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891332  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891342  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891345  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891349  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891350  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891351  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891353  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891354  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891355  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891357  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891358  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891360  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891364  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891365  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891366  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891369  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891370  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891373  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891375  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891377  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891379  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891381  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891382  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891385  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891386  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891397  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891411  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891418  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891421  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891422  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891424  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891427  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891432  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891434  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891439  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891445  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891446  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891448  | ORPH 
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891454  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891455  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891456  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891458  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891460  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891462  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891463  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891464  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891465  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891466  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891467  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891468  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891469  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891470  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891474  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891475  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891477  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891478  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891479  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891480  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891482  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891484  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891486  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891488  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891490  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891491  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891494  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891493  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891495  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891496  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891497  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891500  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891502  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891506  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891505  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891507  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891510  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891509  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891513  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891517  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891519  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891518  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891521  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891523  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891530  |      
                  orangepi_zero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891525  |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891528  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891534  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891531  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891538  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891539  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891541  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891546  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891547  |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891549  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891551  |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891552  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891554  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891555  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891556  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891560  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891562  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891563  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891564  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891569  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891573  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891575  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891579  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891582  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891585  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891589  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891590  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891591  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891593  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891596  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891598  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891601  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891602  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891605  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891607  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891611  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891613  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891615  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891620  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891621  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891622  |      
          qemu_riscv32_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891628  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891631  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891632  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891634  |      
            qemu_riscv64_virt_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891638  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891641  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891645  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891646  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891649  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891653  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891658  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891654  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891660  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891664  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891687  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891665  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891668  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891669  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891674  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891671  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891678  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891683  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891681  | ORPH 
                     raspberrypi5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891685  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891692  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891690  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891694  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891697  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891701  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891703  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891705  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891708  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891711  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891713  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891715  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891718  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891721  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891725  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891726  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891728  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891731  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891734  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891735  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891738  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891741  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891742  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891745  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891747  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891749  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891750  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891761  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891765  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891770  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891778  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891780  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891783  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891785  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891787  |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891791  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891793  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891796  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891798  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891800  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891804  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891808  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891811  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891814  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891819  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891825  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891828  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891830  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891835  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891841  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891844  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891850  |      
                       zynq_zc702 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891852  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891854  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/7198891856  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
