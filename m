Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A663C30658
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 05:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A11D8149E;
	Thu, 27 Jun 2024 05:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-dVdbndny-1; Thu, 27 Jun 2024 05:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3A9981287
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3A9981287;
	Thu, 27 Jun 2024 05:35:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4D81BF3EC
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 05:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B10F414C0
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 05:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sdh2Mv46Iwjp for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 05:34:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00F62410DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00F62410DC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00F62410DC
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 05:34:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FDAAE0009
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 05:34:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 05:34:54 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1719466494; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3s6RXjYTtp18oUWJpy+sLcHzpuwZk9Bw3XYsTeUsO+M=;
 b=XebGstT0et0l5aCC0UE+IZwFpCScQEogtXHEZdejn/PDHGRzYnhaJhWLPnMsJIKTm7i/Rb
 bNhmchCiNMnJJujkqyWo3HPT+A7sPmdgS4QhxlrAJE4O/C7oN0XOytE69uzTuNg2kJzNw+
 JT06XZ6Y9g9oWEIf5eRJWHERPbBuuWRkOK+b3Czh72UlJKVF/5VGxG9uwC7VXW99+1BoO6
 KQsk9ISKVzUIWr1v0iZbMFlEYiLNyhNJkXv2JIMPun61CDWmHacqUy7XFKoLwLCtvq4bqB
 DIRwpefHMxTjUX82YQye9VJ6fug8TA9aO2pIeDoPByPqhCrOANPqY8JsdYHB1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XebGstT0
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-26
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
Message-ID: <20240627053454.7Rok8X73Tro2yXP32iiwzxKEk4YBln5V7L_KSCI9Vsk@z>

Hello,

Autobuild statistics for 2024-06-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 19  |  9  |  0  | 28  |
  2024.05.x  |  8  | 16  |  0  | 24  |
    master   | 39  | 667 |  0  | 706 |

Classification of failures by reason for master
-----------------------------------------------

              libgcrypt-1.10.3 | 61
            host-cdrkit-1.1.11 | 41
                    zstd-1.5.6 | 40
                    gpm-1.20.7 | 36
           host-python3-3.12.4 | 32
                     cgic-2.07 | 25
host-prelink-cross-a853a5d7... | 24
                python3-3.12.4 | 22
                libressl-3.8.4 | 21
                 libfcgi-2.4.2 | 17
                elfutils-0.189 | 15
                libxml2-2.12.6 | 14
                libmad-0.15.1b | 13
                    ficl-4.1.0 | 11
                libssh2-1.11.0 | 11
                    yajl-2.1.0 | 11
                 empty-0.6.23c | 10
            host-pkgconf-1.6.3 | 10
aer-inject-9bd5e2c7886fca72... | 8 
                dovecot-2.3.21 | 8 
                   exim-4.97.1 | 8 
                  cpulimit-0.2 | 7 
               cracklib-2.9.11 | 7 
host-android-tools-4.2.2+gi... | 7 
                 haserl-0.9.36 | 6 
                       kmod-31 | 6 
                       unknown | 6 
                     flite-2.2 | 5 
glibc-2.39-74-g198632a05f6c... | 5 
                   host-go-src | 5 
                  libffi-3.4.6 | 5 
                   linux-6.9.4 | 5 
                     mtd-2.2.0 | 5 
android-tools-4.2.2+git2013... | 4 
             dahdi-tools-3.3.0 | 4 
                     file-5.45 | 4 
                  jack2-1.9.22 | 4 
                     nmap-7.94 | 4 
                apr-util-1.6.3 | 3 
                  boost-1.83.0 | 3 
check-11970a7e112dfe243a2e6... | 3 
                fail2ban-1.0.2 | 3 
              fluent-bit-3.0.4 | 3 
       freeradius-server-3.2.3 | 3 
                gnu-efi-3.0.18 | 3 
          host-asterisk-20.7.0 | 3 
                 libcurl-8.8.0 | 3 
               libglib2-2.76.1 | 3 
                  libsvg-0.1.4 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
               libtheora-1.1.1 | 3 
                   memstat-1.0 | 3 
sdl_mixer-d1725fcb7c4e987ae... | 3 
                     avahi-0.8 | 2 
                 avro-c-1.11.3 | 2 
           crucible-2023.11.02 | 2 
                 dc3dd-7.2.641 | 2 
                    dust-0.9.0 | 2 
                  ffmpeg-6.1.1 | 2 
            gdk-pixbuf-2.42.10 | 2 
             host-clang-15.0.3 | 2 
           host-elfutils-0.189 | 2 
       host-gcc-initial-13.3.0 | 2 
                  host-kmod-31 | 2 
                host-odb-2.4.0 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
                 libgsm-1.0.22 | 2 
                 libhid-0.2.16 | 2 
                  libnfs-5.0.3 | 2 
                  libsepol-3.6 | 2 
                 libssh-0.10.6 | 2 
          ncurses-6.4-20230603 | 2 
                  ntp-4.2.8p18 | 2 
              skalibs-2.14.1.1 | 2 
sox-7524160b29a476f7e87bc14... | 2 
                systemd-254.13 | 2 
                 apache-2.4.59 | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    attr-2.5.2 | 1 
                   bird-2.0.12 | 1 
                 cdrkit-1.1.11 | 1 
             containerd-1.7.14 | 1 
                 coreutils-9.3 | 1 
                   dhrystone-2 | 1 
                  dump1090-9.0 | 1 
            ecryptfs-utils-111 | 1 
                   eigen-3.4.0 | 1 
                flannel-0.25.2 | 1 
                   foot-1.16.2 | 1 
                freerdp-2.11.6 | 1 
        gmrender-resurrect-0.1 | 1 
                 gnuplot-6.0.0 | 1 
               gocryptfs-2.3.2 | 1 
              host-grpc-1.51.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                   httping-2.5 | 1 
                  iozone-3.506 | 1 
           janus-gateway-1.1.2 | 1 
             libapparmor-3.1.7 | 1 
             libblockdev-3.1.1 | 1 
                libesmtp-1.1.0 | 1 
                 libp11-0.4.12 | 1 
                librsvg-2.50.9 | 1 
                libsoup-2.74.3 | 1 
                 logsurfer-1.8 | 1 
                     lxc-5.0.3 | 1 
make: *** wait: No child pr... | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
                 mokutil-0.7.1 | 1 
                  monit-5.33.0 | 1 
                    ncmpc-0.49 | 1 
                openswan-3.0.0 | 1 
                 pixman-0.42.2 | 1 
                      poke-3.0 | 1 
               postgresql-16.3 | 1 
                   rauc-1.11.3 | 1 
                 rrdtool-1.8.0 | 1 
           sane-backends-1.1.1 | 1 
                softhsm2-2.6.1 | 1 
                 sqlite-3.45.1 | 1 
                unbound-1.19.1 | 1 
                    ympd-1.3.0 | 1 
                       zsh-5.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/cc2dc6443317cdff477fcf75bbbe6077b933f6b3 | ORPH
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/734c0a4017713bd434687d9b77f338257f79c7db | ORPH
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/5c77baf26e552dd313524479290b3e5b57587559 | ORPH
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2f2b0b9be551687d75b4a8e7fe7b44e3ceedafc3 | ORPH
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/19c26d0bbdcf2e0ff1ad1263877d95108a2874af | ORPH
  riscv32    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/54948ced60178b7b0f1fc95cc8359dac27a220b8 | ORPH
    i686     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/40c41b2eae2fc3d943dc30ed0bdfe2f18303ea6e | ORPH
microblazeel | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c62746054dd7b42758892092c09101ee30f08e50 | ORPH
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0508d0eb7f7a7c2c3668d73c14c119a324b5dcfe |     
    arc      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/65af03902390fccbb5ee73036a74dd57c13c4da0 |     
  sparc64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/729741a2d22c12ae747a4f04257c2978c110dc07 |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/62ce9f26742986c2fe66fd56f1540bf8ab35f5ab |     
   s390x     |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/ccbc1a30a1253d1acb23ef70a0aa651ab602a3e6 |     
 powerpc64   |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/e472618ca9ff4a3cf460f607a8dfa317832ca622 |     
 aarch64_be  |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/90facd8bb52d5d4fbe551c5e37cdbef7e492bcf6 |     
powerpc64le  |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/9d19d78748753b0a2b05a0a0fe6cadf974329c6f |     
    mips     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/d547d6c9f6884bbe1386b05dc30bd0c4f757afa4 | ORPH
powerpc64le  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/e106b8e3bba698ffc9a753c4ed1c9cc6a8f1358e |     
 aarch64_be  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/b7138b51766e25cc2ebd53c8684c6505d55cfe77 |     
  powerpc    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4f5ec8bad0923f5c21df39eb942aeddf76c1d9d8 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/73de946cda72735af1641bd70b778d3b74740041 | ORPH
 microblaze  |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/51200adc7c436d2801a66ed9f7f9fa2bc58b0273 |     
   x86_64    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/e15273ce64890b702689b664771c4423d8143cb5 |     
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d0114f73e9bb2034eea00c131eb76a1e5a7d38d0 |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/a4457ee39a43b6cf19e5f6a0e7a556d0851ac973 |     
    arc      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/f7a3c60d4bf787b897cb14f231c4800f14b351cf |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/41dce564333523f24a9622ee680ae9da068cb562 |     
   x86_64    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/33196117107646e4b31a38cb8741444467be4b55 |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/1f5d85a211454c1490e72785f3788d099387dd3c |     
 microblaze  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/31387ca3c6d602f371e47ef3b9d9947d94bb9064 |     
   mips64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/822dc24f03e11f05b08ea4100fb1695c3f5e5daf |     
   mipsel    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/5a5200fcf7866f396174bc07aedaba6fb6209083 |     
   s390x     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/4ec27daf500c54be4982c4029f130f439aa21901 |     
  riscv64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/66e7e87718bbb281aa96ac546a2f50ac143fc452 |     
   armeb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/d56dc4eb866f2ccbbc88288ed40359d9cb3df6e3 |     
powerpc64le  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/855af3243b9bed2a9f4a70bcd5b2f4eb328543dd |     
 aarch64_be  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/552dd55889a70260f126ae6a1f03390eaccc6cce |     
 powerpc64   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/10a1991d3cebfac27b4762648624cef261a85712 |     
microblazeel |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/86c3869d5a41e3a2143350e214a7765cbba677d5 |     
   sh4aeb    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/b83fea9e566b6b81b7783aec82b598962d3e5609 |     
   x86_64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/bca419d309701a2152fcca37d8a02ca815aad75a |     
 aarch64_be  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/b04fc726b67e8616c96ba16f47bbd65d21735b56 |     
 microblaze  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/d1c212848ca5b4b97eebda86f95ba522ed1cb9be |     
    m68k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/3459603e5457e152785b26c5c6539c4f9f67425d |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/2f2496cddf5c113453c152816c64b806c759265a |     
 powerpc64   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/bb8dec5232ac3cf2c9335ed98d02ae43198d6b1c |     
    i686     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/0f0c74af5ea916b8955610f5a7ef4b0ea28018eb |     
  aarch64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/42e4e716411dba3d51c19ba8aa6fa1967a5783b5 |     
  powerpc    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/a7a6fcb3fa23bec0f40c75454ba6a1a0d856c757 |     
  aarch64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/3c19d9e3c4c5536f8cdd8bfd116dfeb31764a518 |     
   armeb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/081a26bfe19028810d3d19813efd790b570edf29 |     
  sparc64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/3f63b0c7c139b0191ea97361752bb0304268c594 |     
   x86_64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/cd64e9d2e8fe61db470f75137a3e36c77460c734 |     
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a98f2bf6dec77f7f913d71b71ce025e9b5acd0d5 | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/bdd29865829e07ac46679867fc7f841b7f89da5b | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f121c1afc634a729a061e2fa8f15ab1fe8123f2a | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/7d0a95e9eb7c6e6485871f63a3db1258c9d76745 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4baacbf4d52110079b76442306128128bd77ca84 | ORPH
  sparc64    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/8e9eee3b634d0e90739f03e82321fdbdb5f68f0c |     
    i686     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/b7af3359456922b0cd320fbcdf9ea78c612cdf62 |     
   x86_64    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/e52c2cc77bf5421cb2a1e24d1276df3984db2ce9 |     
microblazeel |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/263bb9902757e5abfb79ab172d2bcd9f5e2ffcdd |     
  powerpc    |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/051a556053ccc4be24977a0d77d87ff67b65063f |     
   sparc     |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/803f45882067fa1f78069558736700109fc92cee |     
    arc      |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/44ed12aec80f1e76bd08a5b3abe23283f0c3ccc9 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/cde348224275a118f395eb5e921ca4f8ed05b7ef |     
  powerpc    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/35eef9daee6e924bf635a37e9bfb0a1c3d8607ad |     
   mips64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/5b75b625fcb4e3bde122c3d7863e20f0bf27e014 |     
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/356770f5c34177a8d427ba4da9d0b38cdd6ba1cc |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/cb715b173075bf974aaad778d7bf4cd760d32cdf |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/9f05392b6a67c2b5c4fe4e1d51da8c2ca5a2d2f6 |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/a246cc465d585926c25ed7208d3f1f5bc08c48c8 |     
powerpc64le  |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/788df9a30f2aeca144196f97866bea0acad561a2 |     
    i686     |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/608d671188b4839f8076c6bd077ed5990bce8b51 |     
   s390x     |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/c87211ef076d19e48058a7333deb1916d095c365 |     
  aarch64    |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/95737919cd63f5e4f6118be6e7858ff44f0f8527 |     
   arceb     |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/072b274b6e85df2ce9b52777d566a187e77d731a |     
   x86_64    |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/5da7a132c2ce9e9fd058f48438ca5a122a4992f6 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6a9e1d1a25135933443b40878a415c388e354a63 | ORPH
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e9360d07b3297b177d9f171f5e360996083c837f | ORPH
   armeb     |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/7af20435e24288271b606181551bece5e86843ea | ORPH
  sparc64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/7484edfa0b8c45bafb8da051ca839bf174c8f93f |     
    i686     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/23f4229992c5e79260b2bb31917277abe6c7bed4 |     
  mips64el   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/5a1882719a39650163b2d4d323bb5721eed84257 |     
   armeb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/461025c060470b67de5cb7818b7d30b3cfa740d4 |     
    arm      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/671101314a9e3ef213cbd821329d7f9ee7e66d7a |     
   armeb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/8c737d716bb0bbdc1d96950fbc02334ea1e8bdac |     
   s390x     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/ab74f59b3d82269f903101fffaa7c4068b6c37fa |     
powerpc64le  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/bcff2c8008d76b7a4279658eebc70b6441cd543e |     
    arc      |          dump1090-9.0          | NOK | http://autobuild.buildroot.net/results/1d5804974153f96e80f5200793ec8cd12c9fa18a |     
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/cdff78b3ff20e3f2d55dae5db115dffda1817138 | ORPH
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/8e348f4c32ce37fd8e6dc674b88a5644f78aaa31 | ORPH
 microblaze  |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/622276b73c8c325510bd0b39f1d5b53d7f54c0c5 |     
   x86_64    |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/d89f0126e45c9f763b74014411f2a5eca954f48c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/12905fac8d9b13a88fa2be44f571c83acefcb779 | ORPH
    i586     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e8745ee8cd3cc9713fd4058da228163a3ace0669 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c3181a22fd97684035449eb8fd18f1534eed041a | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c36119da91e554e1fcbaa9578280f26a9ac9741c | ORPH
  sparc64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a845dfb26c8a525a45e2c5a7219b41f3813e1613 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d466f2138c451d079ab0524d1b786851c8512256 | ORPH
  sparc64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f148e320a132a406647988b030e1cfc905e8d1eb | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a551cdbe3a539759dd90b23d84df54bb74d7a39e | ORPH
   s390x     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9d5694e170fa7d90ad893530f115f08af9e1b746 | ORPH
    m68k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d4158c3ba80f0c141a34d32ca9e460a59a4e1fb6 | ORPH
  sparc64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0e0e1a4a6d49f3452e5618c5320b6e5a29b831b4 | ORPH
    m68k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/935ee181eadfaec132047c386145e936a0fa2868 | ORPH
   s390x     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ccf73acbb8c117e6c3333e184e2471bb43134349 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/efc59ceeb5035e35fb5271484d637103a46e5d57 | ORPH
    i686     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5f7be8655b29f45e7003bc839f27fc135e8a294d | ORPH
    or1k     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/57e5ade698ad421c88a325e739fac882f7f065dd | ORPH
 aarch64_be  |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/3852cf51e5061191123ef674394463546294dbd4 | ORPH
   armeb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/720bd94793a6ea57024309832d991b6d7aec32a2 | ORPH
   s390x     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/0200f267e7d3de64bd8c3f36bdf9419ead586bc8 | ORPH
   mips64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/5958c1b292a5d377660c858136a77c1fc5699693 | ORPH
   x86_64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/cbe3c43c09a34f3c895c72a2b1508267c1e9d8f1 | ORPH
  mips64el   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/e9b502b64c24885aa1afd2ba80779c6226748f89 | ORPH
   mips64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/1c5db3285a81c23be47353de5e270870c035c8d7 | ORPH
   arceb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/518a9ade3bc33f89765bd2ac234373963b319356 | ORPH
    or1k     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/d19accbcef787a973a1f0777abcae023bcf27c67 | ORPH
    mips     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/ff27d5ebd7f24ac8cb236b83c67c2c75255e51c6 |     
microblazeel |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/5f8b7e31c4e64d6587af996f9616cc8c3b314039 |     
    mips     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/2f9ced2e157b63fcfd63fc48255471cadcdebbfb |     
microblazeel |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/a45127e05508b9d1d2a86a48e44a53b7a8d466c5 |     
   s390x     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/81943a440ed54948d40c0533c50d8ea66baf7b41 |     
    arc      |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/477f05ea7b494e73eb559160af883f60ea550d2a |     
  powerpc    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/1eb367c7fc1e89e1d4eade950755036358aba461 |     
   sparc     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/9c4214603aa3d66314e599db930c703239835c76 |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9d2ea0bdd94ba3bd0d2faabfc66424d5f5bf6c3b |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1fdada10d0b8b8c677373df1d50697a73cc0c672 |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/42d10edf27284c32605372929475df740ff5beb2 |     
   mips64    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/76a7d74ef344ceb1da1a5f5e5e32fd816ceaf8f2 |     
 aarch64_be  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/612fb08268cb289b46e9feb41986050ca380a606 |     
   s390x     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/a603797bd1efaedf493a0a48686d54085d8e8100 |     
    sh4      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/0bc713a14ae76ef7f88b5208cefee22827de7105 |     
   xtensa    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/760d609788906550954068a787c36616b730590f |     
   mipsel    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/316cc6c4a4ce55ef9c2513ee0e2e6691e696a91f |     
 powerpc64   |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/5cc8a43ecf85fe4eb8b12a37794b84624c4403ad |     
   s390x     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/b10fbaf46f4553772580514e74c87344efe85b7e |     
    m68k     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/8b462128fc3831abb11c86e795987fb56b85090d |     
   s390x     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/491eee0b8fe8dc6caf6b0d7f60b13846c75efa2a |     
 aarch64_be  |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/526241c7f3e613cab63414b2df11bc5fca708e05 |     
    m68k     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/3b60c9560deb07a1ffe24c35de199fd3817946b9 |     
    sh4      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/f9de344c96c136a6e0f505eec36f9a5d8574e2fe |     
   x86_64    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/fa38e6f25d7fcd495b564d453a30d175c0688b12 | ORPH
   mipsel    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/a74ba77dbd80486ccace9a1e33242b33f5d5ebf3 | ORPH
  mips64el   |           file-5.45            | NOK | http://autobuild.buildroot.net/results/96fe9fb1637f51a6f70f96136a3802233136496f | ORPH
  aarch64    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/2fe45316696ec8df690dc4ea4446fb4b78669fec | ORPH
  riscv64    |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/7bfd641b77c4052f8456bf866766a115e949790d |     
   nios2     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/83e19ad2fc1211cf8b8d4ec9f6d1b3289d0be472 |     
   mipsel    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/fb5a8da3139347cff2735e4a573fcba7d9e077aa |     
   arceb     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/9aef4e07427757158bff4118955902c9a79070b4 |     
powerpc64le  |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/edd61c627905ce24fa1a431a97430032ffa1235a |     
   sh4aeb    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/bf6133114f647d6bbe7340c2f25ef06082d9f140 |     
   x86_64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/d9fc3728fc282dff67674b02136cc1dafb78f9e8 |     
   mips64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/107159b97b817ebc02a7534eb1e0a931ba21a88c |     
  mips64el   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/65b169e55e7d130895ffcc100388364cad6b6bf2 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/e5816e5fc1b862624a1cce963ec25ce89fe70a53 |     
   x86_64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/8b6d04eebf48ac07a9ab8f11c17e358fb7ca84c1 |     
  sparc64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/d6924fd190cc5b7d6b7cf1da6926166db460ffe3 |     
powerpc64le  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/fba0ec52f86bcfb4a4c27fbd6f1c34fad2a0b8a1 |     
   s390x     |         freerdp-2.11.6         | NOK | http://autobuild.buildroot.net/results/8af9ce75072c06cc7bc7c2539cc894f241aee693 |     
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/f929d0c65f73fd46111775bebf7b65cdd3ec0dea | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/85e3bcf1fc3017a9ecccc1d3c7c8b2cdcb6f4a27 | ORPH
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/020860276beb50d62b20e5926a14f806c73a61cb |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/94f143157b3ddeee96e04032508d4097ac0cc2dd |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/bfc75beefb492c872720e43dda4291189f2acd35 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/455c3f21ea38ded45762de1492abdb8694244676 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/987a24bb19807e1f8d62f959c9fa7dd9474b120c |     
 powerpc64   |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/e65a739637c44df1024d98707e988f666fc78977 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c1d562beddc31d3eacd34006f1796aea2318548c |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0a113e633f278319ca396fbf309d0ac870a07f17 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/229617770cfc40cab051756e5390c8b2d493024c |     
microblazeel |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/b3d9ae84451d8429745f1d7ff599ed6a1d8ea118 |     
   s390x     |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/ae2bd3d5d0b1069c78c706e8c4d21d5f07f8fcf6 |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/4f56dc5c954c28bba8bcdc7ab041ec6ec3929a3c |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/fc527c1eaa0c258a70c2298a86df341306d488d8 |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/996899536007b9ea7485bcf15d9eead65a21b534 |     
    m68k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/aaab8c359c66b25b42bad8c099f9228602889d76 |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/752d2631674b1079cb665f56046309c0922568b0 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f2fb16cd2c53467ffac39a807418d3a9dd3ccc52 |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/849903a03cfc272ff1ffdf17e71086e6dd493faa |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a60b8d87daa88e7961f48b84b5365ea65c290ee9 |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/5dc2454d16f7cd492e9bbf82650233df25efd5ae |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/bc965b97bd512c17c2421ccd5ea60609746addc0 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/08cc181c9284d35d700b6be3efd5ed6a71c3a77f |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/745f2025c55beef1bc2a1b27342f24bdc5367dd6 |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/861e20fbb147235113e7a38971efad93239118b9 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0c2fea789f2cd7b986e7f48f41e90073ce788071 |     
    mips     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/7291f28b895f593bb91bc1f1a89fb060a1ec10ff |     
  riscv32    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/42370a14aec432a3e2306ff30ec3add1ec109043 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/70c28e0bca73e754cb4ce1955d75115e87836613 |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d9a030440b7cd44e6c15e74d4ae08f50802d11e8 |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b8112a446b52b72f5fea3012acf19d9212a6c27e |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/81e2f20d39e2b01a5b37d85b5a5f6e7986805396 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2dca689a891bff02dfdf8ea305a582f3c6e407a8 |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/742142e8b3a888caa7053130a561d5e87064af62 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/52f9e04526d88c5689a97f9bafad0ca64c09ac13 |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/bb790c373cfb4da9537364a003456d19c526b693 |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d2f8b2409915c4f97e24bda06ada66327c6d1c5d |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/300a88bdcb1ac615a6e2544668073917974a859f |     
    arc      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/82ecbee860ea513e87b770387ec2a0b2d83fe911 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/fb826ce87cdda5c63c5d90787065ac2d29f3e282 |     
   xtensa    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/977e644412bba537e8bc8de0f734cb9cd821752a |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/3e7cc0b359dfe7cf2242b05ee8031d8c9006b3d9 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/fb2b06e66176c6645821ee0c12c65853df873374 |     
    sh4a     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/5827180b5ec1cc7018ef9086a9e210a886e32b6d |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/7733f0d3b510cbd88b72d4aa734aeb4092cefe27 |     
   sh4aeb    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/afaaa70f06312778ad0a60f2e12c52cb1dcaded3 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/49fa72b468d269f9742e22efc3a6a6916c8bac62 |     
  riscv64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/7d34b2644af9d520820e891de38c101018f23224 |     
   sh4eb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/73412ee7f871ec18aa265cb66091ecd830fc4736 | ORPH
   sparc     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/76d710bee9a5d525d29c4e45d36ab58dd45dc1d4 | ORPH
 powerpc64   |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/a4161c3e8c400bf65b92f07ecf84dc3987129c3c | ORPH
   x86_64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/930952fc6d79a54ed8dabe161404516b68df40a8 | ORPH
   s390x     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/d074ebc8f823e563e64d37c3ced2ae3b493be11b | ORPH
    sh4      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/687638482f4a903e7e50db9ea6fb5fc427f1f8e8 | ORPH
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/55e6970ed639f209bdecac3a2f04b81e49713730 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b928017070f76b9390b0d1406c031ce77a181489 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6ee159bde26e27534e98648078a06546139c864e |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a9b1031b1966301d5325961d47588762a7703017 |     
  riscv64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6171e12deb713945bf3f12e048375410fe45e780 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/be43e337f9647f887e50dc1d5ddacd4596850ed2 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/2089debed9cd67a1d7109d1ce857171cfad3cebd |     
   nios2     |      host-asterisk-20.7.0      | NOK | http://autobuild.buildroot.net/results/53734e1453ff82b3448b6391e2655280d13e1e76 |     
   arceb     |      host-asterisk-20.7.0      | NOK | http://autobuild.buildroot.net/results/0110008ef51524c873d66f6c122df0728181bc57 |     
   mipsel    |      host-asterisk-20.7.0      | NOK | http://autobuild.buildroot.net/results/b07e51ebc5a451eb23d1d3e578d059526e89d741 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ceb9c7fef56c536da3ff4698c17ba38001c2a504 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/654ce5fc635dae126231f5ef68451afa8ba62a2a |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/42ee3032a1d3f696d3631dd4a8509ea00482d1b5 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/daa74f27c5384b45611bc6b4e69e5a46d9d54e4e |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/380e8de295612b4f660c8a992abe5c114b4d50c8 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5b2cb9c2971284a03932213953054186c95d2bfd |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5f0d6bfcf202e9e7be20284455f2283ead5f661c |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/118ce2ffb46861172f60e471e5b82874d3ab8e12 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c31f2e84ced1e25611f732dc40b2859de2415ad3 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/50113bd2817d7f1914a966e396dc305dd1697625 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5e81b1e7978f78fc717d0248ef4f5cb737a1fd18 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a2724743c683984a3682b4c189a836f6d89684fa |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a7a438fabd1f1960ab717b49c20157a5c72581b1 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3e639cc43fbbb079123ca990ae3c742810c89122 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1c68b2947fc07ff2db4a2caa1e610a3260250fd8 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2e4960601dbb197a4307190866e428eeddecf8d0 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/80420c8d7c9ef55a47229ea56f110a96d4f0c71c |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/88511ef6c5e0f0a72453eac67f62dc8df83df4a3 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ccf1826047fe4ea5e1fe2946c3915782c36ce734 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/837be5accbc604b5825c8b723887c6581a476c78 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aa1a40b99cff8a77867e99776a380f6f49ee88c2 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7449e4b506f16274d038fdbd5483302a9c65458b |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/73c46d2607c33906c8a1a99418c2b69cef4864d3 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/676e495ec335dabaade6e8edb076c360c18976f2 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/482a64b43db736a9301d5ff98137ae7a4b3c26ac |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/100005f0669030c13c427f48c6d57f07e225b4d0 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eda5d3210b67f12072f6b424b7328952129835c4 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a1c24eeb8c5913db53910f98a4b4ec8349e5ef15 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0809c1ea9fbec36dc86546ff75d5f4c57ec356d5 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/31919e46786805e3180f19913bb33986435f1b00 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fd9ea23003e1c724eba3eb5f46d56d238d0d94f3 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b9dc09ea39e0f174ac1e111fa798d37bdb667530 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ad03beb086e56ffd91d1a61c5a8b7a2a3f3b581c |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e3ab5f85c5e4150e889ce95f834932ce78afb5d6 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3ff6c3f8e1053291d4721c8fcee12a29409a2213 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4c3a84d9d00bd59c5a24a6b66fde02df45435ff3 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c6e73d6f8b4b6f634d338ea516d3256b5dfce777 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8116f11e1098ced4797855fef599f4e6f40189e6 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/94a77d3251d3567d829e91481d5b6ec54e3f4473 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/caa080dfb2de8205ffee4c6572e4a3a4c2cda8e6 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4552cfc0eb80f7ef84317052e238c82aca69e926 |     
  riscv32    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/f6b1d981484554ccfc9c6a7d43528b8e54a54e2f |     
    arm      |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/d13f910a800bfc152308da35598bca2c890f03be |     
  sparc64    |      host-elfutils-0.189       | NOK | http://autobuild.buildroot.net/results/62e4826e0f31290ec1600488a8e655370bd41bcd | ORPH
    m68k     |      host-elfutils-0.189       | NOK | http://autobuild.buildroot.net/results/815c853392f146439290cffadbf753dac6f9cf5a | ORPH
   xtensa    |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/e77a1ce3c08ca33bfcf161dc099e1aceff59f541 |     
  riscv64    |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/23b9350c18553df541288eb7872252bb980beb2b |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/d6d7ddbc09a25fc8a81a95849b2dde6adb7a6160 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/2aa7a8769cc796384a1b1af69f4241ca78e02894 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/35f084a9eb11bafa200dc58c6972a414abc88c9b |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/f389e0345b0bac56755b8f9c3e3ac90ea06c65f3 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/cec323f7a99fc3e6c7c08828a51d26f9c2d787a8 |     
 aarch64_be  |        host-grpc-1.51.1        | NOK | http://autobuild.buildroot.net/results/5502dc21df1d25438f43915032b7bde10efdc723 |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/af24fbe868e8558cf8514f8d71c965a47d43c5e7 | ORPH
    arm      |          host-kmod-31          | NOK | http://autobuild.buildroot.net/results/a2fb0de095b6c84523eed4d271f36e18883c5d09 |     
    or1k     |          host-kmod-31          | NOK | http://autobuild.buildroot.net/results/e5ac5d664f722dec1520f7fd5e1ae5a79b7a56d6 |     
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3030a6dfb1dc29b0bc6f774a315313934131e53c | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2a47317ece220fb19386ac3bf64ae5daf4ee0a11 | ORPH
   mips64    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/bc34a0e94ab22c323ef102c8ee0846c1d6c4f0cd | ORPH
 powerpc64   |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/9c638ee4458bb4e2134f68105b3a40246abbae1e | ORPH
  sparc64    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/06c4521ef3566886175860796503ba173e1cc9d0 | ORPH
 microblaze  |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/4bb28625b320b6b771969bbae5dbf5ee793f832c | ORPH
  powerpc    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/4b12c16bca3947a2e0f1bbbdbb244e892a50619a | ORPH
microblazeel |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/35829b860ef12a1878a702d89b70caa574e0d7cc | ORPH
   sparc     |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/527d013c93fe5433a712c75b801aa0cc1702fe96 | ORPH
  sparc64    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/e093e2d1f54a93dffc60b8848ab1401d699a00bd | ORPH
    arc      |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/0d0702507e943d08e5b16aa896de0965bdb2eb37 | ORPH
    m68k     |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/22e38975da1e23bd88277403d5cdd4428718001f | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5a5f59cbb732a7bab4008d61edbf626905061410 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/34dbba955724c615aa6355e5b0e124dd67913049 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ae6414982429a7abc0e6749378a47d1b695dc2da | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/65007d25eba3a873fffee50c78ce6747ecd79bf9 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/26cbc0e1af3d26da3d46b09a3fe88a8597bb1a29 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/da28e8b85afd4e760ee95ca46b65adaa12991f43 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8dfd921bbeb0d4e6a21f0d8c61504ca5483ee73d | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/49e24f7bd7401e8e7da26ba8a9c6dd8a90e81090 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cef8850897eb69946d5cd36fa95c0011aa8a90d5 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8a0230ac09e785c60816096076dababf0580ac47 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a6d14efa961599e1712a36c82cd827b109803c97 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7ae1ced9fbc95857dac890bad36d64b918d21c53 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/290c7da5c4c8b6cf9e13f32ca4709965deb8f89f | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d97024643820ec71ccdb448dedd03161851a3b0b | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b19e6fec216e79a12a20a4406ec4bc65d6ab078a | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5171792271ae767ddd1cde013dbff0b6de774e9c | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/effc9e08431dbd3c5483510d7073a2c61803f2fb | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c959cd04bd316350059592c1b41b81833a043e73 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ca4e8c98cc0e74c80904c7eb54ee1cadb61c8363 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/15c477c122a62b0f113ddc7ac070d28c9d244e1d | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c714e917618f4ee60049835149558044c56f8df5 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f83295eaa015e858f15fb902c09712efefee22fb | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9db14444e8bfb0d8429624498189b3d19bcd42ba | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ef203a05dad72a3b3f729de44eb28821936961dd | ORPH
  riscv32    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/b4bb6ba84b73ee40beabe1066e7454d8f65b3292 |     
    i686     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/48caa0a3c2856fd686d22de1e7a197a5b28afe85 |     
   mips64    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/f8c295e1af8f27953eafa65bdd6369b8ef2dc8f8 |     
    m68k     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/c93c841c5615d22e4a5fa9f63500b373b55fba3f |     
    i586     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/5ab6a815546ff829b9aec34cdf16d135c1992ec3 |     
    mips     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/1ea60034dcba32fbeb216a5deae9243efbaf51a3 |     
  powerpc    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/41c388bd384299013138a03ffe7be897c77bdca2 |     
  aarch64    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/f0aeaa501d8892703652c33875f167ce6995e91d |     
    arm      |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/2ddb6475c1a8ddc27279601c39289f458e093802 |     
   nios2     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/1a1e9afc2ad4afa52a88faa3a07533acdd409c0b |     
   nios2     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/433ee93fa892621d8edef072ff611e5b1755cd84 |     
powerpc64le  |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/30572b0ae87d5b3977433008967bf1286a94a907 |     
    arm      |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/6521dcacb6863e82b887a82348443a561369029b |     
powerpc64le  |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/d1afb2993478a2feaab4c8c07c48007595084027 |     
microblazeel |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/3b990283cc99b49077554ccd064e26e2c76666ee |     
   x86_64    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/1d4c214a8a9dd8d2dc6e054ca56c75afa62fe51d |     
   mipsel    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/cf78d7a9cee875c6daca82c6f5e506855acfccca |     
 aarch64_be  |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/bb83948b1875ffb6fd92deaf903e6ff86fad8d73 |     
    mips     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/348da9078e23ee27e3e55c9caf1ad77f9c2c89ff |     
powerpc64le  |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/18b4f63fb24055d9c7e7d91060a57972a433629c |     
   x86_64    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/abdc67ede197b42d14d70e9a884661c53edbbe00 |     
   s390x     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/0bc3a6541b74961495367253bc7c31ca7163ffb7 |     
    i686     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/aec3848dd0012728c9f2c245d911e1c222fe78eb |     
   s390x     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/b7a20ffeb9872d3102cade4f577d15d46fe4cc96 |     
   mipsel    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/c2c016a1859eaa1b0c837fb1283ec18ad854a5c1 |     
  powerpc    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/0d5b6245686c0e35247e1e3e2038c6cf0737a9c3 |     
   sparc     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/0604006f9b7c83cb056906f0e8a85c95d84d87c6 |     
    mips     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/69e63ef4b3f56c40e419651d4b0d490b4265b0c5 |     
   xtensa    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/4153f1de50e2915c6c27d69d06b5ba57de57a956 |     
  powerpc    |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/0157f800ee3a10791d4957fe5f38dded9a2b4e25 |     
    i686     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/ceeebeb2e765479cdd7d64d484e6f18dc3004245 |     
   s390x     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/bd0b0fb3211c520dca651ae26b3b60a39574e53e |     
 powerpc64   |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/638cc483a4767badaffc6760003d23080595fdca |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/14f25b85b9d846f3fde13c8f328dae61fc10528b |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bf5dd35958a286fb67bd867081f005bd05db53fc |     
   armeb     |          iozone-3.506          | NOK | http://autobuild.buildroot.net/results/d0adebf9baeff7d896ebb31304f7feca2d4d0872 |     
    arc      |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/eb08692db3625ef6795d69ed98a32df54f54e0db |     
  riscv64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/d8be28fd02005d250ebdbf0f66c4f1a4841926de |     
    arc      |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/32a8b21aad9fcdd838ea527c78687901a63dd489 |     
 powerpc64   |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/31808fbacbff6fe4f7ec1f54744f5e7ea6e63617 |     
   nios2     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/19d701d5440c00be6baf8c986fd4ba4c2f581b80 |     
    or1k     |            kmod-31             | NOK | http://autobuild.buildroot.net/results/1d18f9481103f90d3117cb758895a088bb9fb31d |     
 microblaze  |            kmod-31             | NOK | http://autobuild.buildroot.net/results/bea0810973ea574fe409496270f12bb5c664055c |     
 aarch64_be  |            kmod-31             | NOK | http://autobuild.buildroot.net/results/2e006cbeccaab06e128ba7959dec9f889df97fde |     
   x86_64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/7a87b50b90b5079b1758060c8a66559e95cef5af |     
    mips     |            kmod-31             | NOK | http://autobuild.buildroot.net/results/3b10d804e4fd4a0905976eb6c702449e97339135 |     
    or1k     |            kmod-31             | NOK | http://autobuild.buildroot.net/results/36110b745a50360eba6e50c9f15a535d9ae3f130 |     
    arm      |       libapparmor-3.1.7        | NOK | http://autobuild.buildroot.net/results/646b9a1b326fa89a0c12e619cb79e96033ac4afe |     
   x86_64    |       libblockdev-3.1.1        | NOK | http://autobuild.buildroot.net/results/9d617298982589715fcd4e57c0f6347e02ab557d |     
powerpc64le  |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/66ba878386e4e478645edb6a282e82820b8dad7f |     
    i686     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/7a4d9595197cf23080a23dfe9bc0e60b8145af6e |     
  powerpc    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/9add7283813388daa95b16ef76acb3c4e9ea7c2f |     
   armeb     |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/fc6fc33fd5d49e1848f6d845327100551b133607 | ORPH
    arm      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8c7ee4057f272471f9278e9edc01a5bb909316bf | ORPH
   sparc     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/388d19ea6f56b43d18663131ca5a10c19727c01a | ORPH
  sparc64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/7f7dabb546b45e2b0cc8eab14807bfe17a27bae2 | ORPH
    m68k     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/787777fcc4fe95d55972dea5b5678d59c526a908 | ORPH
   mipsel    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/0890fc9653c7aba0f766a5e8669010fb296989e0 | ORPH
  sparc64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/f7f23b68c744b40cd5d3823cf6ecfebd32f1ba44 | ORPH
   sparc     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/d956e6d17d877482da185196e2acc50ef0f07229 | ORPH
    arm      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/837124e58d4b04671a061222c6e38ff580f55598 | ORPH
    arm      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/77651f2541de58932dadad42fa1857d24da717db | ORPH
    i586     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/0336cd8a0f8dadc0aee317918a70034f0d760ec2 | ORPH
  mips64el   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8650402f37f6096188c6ca03b09566d28cb10b2a | ORPH
  sparc64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/6208477045461de39ec1c4b47215ba37b1417259 | ORPH
   armeb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/0a6a910a48b4137617d37aea08de6f506475d00a | ORPH
   mips64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/0fbe9359a1fcf4b6b408cb744b2c5c738aa941a8 | ORPH
 powerpc64   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8e2acb30240118839cc2dd07c4d721b1fdbd5500 | ORPH
  mips64el   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/04648fedb7cbcb986ae6f9265f99b3e323f76d19 | ORPH
   sparc     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/4861ded9a28e0e648882f61f15e7954055fb44bf | ORPH
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/823828d0e2c3646f1328e4ad5e0d6c02d4db008b |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/8169dafa20babd18f6f7cd360af86716d701578e |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/216b8ff00139eae92e344fa81e7f98481435b0e6 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/4d7243c3e019b9ac3a5a67a742dff051646a3071 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/acd7f9060c04a82784be3c2e654559edf6a517af |     
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/64684fc1f6714c4cb0e5ff13ff53efae1e1775db | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e068f1c151d0c7c8f07692d6e3c98e7366b5021b | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6374f9db1adf12f40321e41f91627af9d3b28e39 | ORPH
  riscv64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e54ead8bb1d8afe8d3e5b901bde38855265235b5 | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c2050080be656b5dfaff2acb1df1a3b338367242 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9356f6ea3b39186662b61a644dcfbadb8dac62d0 | ORPH
    sh4      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/54be0d8fbdc3b341136bdb5b9fb3a5993608c1f2 | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/90dac6ca625df67b39027aa988a8d64f1f52d190 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/b85baa0aec73aee21d80b74d91daafd98d052f06 | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/dd834153031529bda2e965b3ead405c8fcac470b | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/993c973050e5144fb97a600626e6812685a4571e | ORPH
    sh4a     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fc4893dcc4f2889ba03323c666bbf11dd6397f39 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ce31c44cc2949f820264b4f4357815acba8ff82e | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/cb27e8b744961cb963e44875396f63a1aa754edd | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d9addcae8547ac15423af84c32e9ad304a8dfd5d | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ca47d6ac442c3796923ea2b69ae2e03b7edcf87a | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6323f2b1b118205f62d20caf1c23771adbe83447 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/723418ed25982a4716d2b5aa07af62b712cf033b | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/563d76f5e55693119c8d753fd1b4499f843ac981 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4102b10e7b25fe185a8c93dde53fddae37a6c969 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/0173daac3d4cf2c70db3c8b7a1294852bf4b2536 | ORPH
   armeb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/399ff3a9f73684c5ddc17b129ef6dde3c67a1fae | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fe3802270b44173725995c98325dab49db7c3043 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/04c961f999cec43a4c2176a9e31547eb83000e0d | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c191fd7ccde7f5d001f5d1b72579993c6ca2f17c | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/7907b5b0c5f2216039f254787362a204a782e2de | ORPH
    sh4      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1297a15173b5a5974926a7af8e7af55dfa91a464 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/be768da7aab1dd4cd2514060d241994af3d3a143 | ORPH
   sh4aeb    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9885baabce3ae073de5a69066e544fe8f8a86fc8 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/522f8dc8f0ae45f7e8227a6f72c3c70d801b912f | ORPH
  riscv64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/7ca9b3318c3260f2f47ae686e2f7205f23ba2669 | ORPH
   sh4eb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4d04f294119e903e5cfd2f844954e28f4ff352a1 | ORPH
  riscv32    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2f3d7d051185d79b3278496e7c80fc6e522bdc69 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/58dcc803e2ae8c5bbd3ce26ba85d808aba4573c0 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/b58896a50324c5ddf185d4b3a72732849610436c | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a9ae0c0dc78e672f9206df41bfd9900b6901f958 | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/0c1e96856963a629ca2e935a2ed2c15b1395a7db | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2525b5c969b3183878bc9c1b03497c68a7205cf8 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/b941beb0ea16622afe17a1764896a1a372aaf717 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9688277f16e53f859ca2fd43ca9b37b21efaf337 | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/469fc4a67546b2f0c4d5a94f9f1db95393a7e03b | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2940634dd85f5ea4b08b083b45fd43ebd540d363 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/46db7f3e5aca15eaedd0d876e6bd8e4a437dc2ea | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/0e7e7c49c8b5a784a44abd669807b1917c8cd94a | ORPH
  riscv32    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/8531fd5e2d74c22a2574cea38cf15eba09510dfc | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/249e8b32db90ab12f6377bb1cdc5838eeb8b5bd4 | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ca6914d6f849f0f6e9af6c799ca4084c2bc25aea | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/90cbe8a196fe84655f8cfcc215de5bec059730c5 | ORPH
   sh4aeb    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ee34fa69a3b29d773ecd95f6fb2830bc72587dd1 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4e42cd6a33fc9a0d95d015928c94ed5a6f98bc5e | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d4a3922e6ca90702ee4aed7f5c81b9fabd71390c | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/868a3f71547f9c609fb645c6fe7f95f196490a08 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/cc2d512b188d75be566c388bda5872799785c80e | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f6f150515ae49b79ea232f0823f252566be7a9fd | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/13fba514a4af0e63925fe9fd05d6e4b776467f97 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ebd5c45d30a6398d85f2734c3a65c1d382941682 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f5f6db2aa20a74bb2a0565457f629814500e58f6 | ORPH
    mips     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3fd2969b5e45a5b92efaba8359aac243716453ca | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4210060e120e7388c042883629447a6679bf6cb8 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d218f297a93e25648d5e4d33a4954ce6f289aace | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fdd4608269f85a7b5fb530cfbbf0f1f85ceda645 | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/242eb3086791094b2300e195e8d2a4d93736eec5 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/027a6c4010840a33dd2129a51c521d70d3559a90 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0a02d7f341668d9dd82a70e469d877522931ab6b |     
    mips     |         libgsm-1.0.22          | NOK | http://autobuild.buildroot.net/results/8a4b77afba746ecf21a50c29cd0f5e3eaeaabb95 |     
    arc      |         libgsm-1.0.22          | NOK | http://autobuild.buildroot.net/results/168524c53a90b8ff8b95b215ed9e40775cc6fc58 |     
    mips     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/0064af3c3a417c348bb289ad0932d41616af7748 | ORPH
 aarch64_be  |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/66314fd48b2149d6f91e45bc892da7010e5c8e98 | ORPH
 aarch64_be  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/7d63af63be5897b305865ce555bda06ae55a5de6 | ORPH
microblazeel |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/8ba1230e648f17521df427762cfe6e181718a4b8 | ORPH
  aarch64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/5071298ed362ceb0573384dbce6b025eb4f09e52 | ORPH
   s390x     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/6a4ddbb593b6f4b230e95f82526f83abe5233661 | ORPH
   mips64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/e2a124a02003bc5c32860053fdd70170d06542b7 | ORPH
    mips     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/441cd46f9176bef0756ac22a52dbb849bb171863 | ORPH
 aarch64_be  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/9035d10bd698c34709ab2eb5d5756688feb89962 | ORPH
    arc      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/cfa7a8cf05643791df0e39f76bc6344361186ae8 | ORPH
    i586     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/6f245fa7f9d254a0dfc02c95c26463d0468be835 | ORPH
   arceb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/f507b4171e060d5b5ba372ad95f3f040f40d80ec | ORPH
    mips     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/cce5fbcd07805f7d3573bebe494665962e55370f | ORPH
microblazeel |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/cfcdb78416b8f9fbdad162cd80a82f68d538a124 | ORPH
  powerpc    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/99963bf4c4434fa7f425be85ff580d0c14be84b2 | ORPH
    m68k     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/0c30fe2b7330db225ee4bda9eb85bdd7478df369 | ORPH
   arceb     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/42bfd1cd1818f1269627896f3a72dae4d28b6777 | ORPH
   mips64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/4916843c9fb64e9317f62ac0295ffb95141fb1bb | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9595a37a20dd85e12ee2d97ef6a027eb04ff210f | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2fb75b4efbbc4219330fd4e220117af32a04c971 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b9673fd7a7df839030d64f07e324e8e026e0cf34 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c4a8642c1fef630f160af517b2d8e75430364578 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/db1bc501bb5f05291d1021c96351a715d5bb51db | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d10da4eab5e62c4eeac76bd86c21a1dbe323288a | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e673e8f375cc05ccc8782029236584e7155171f0 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6f6811d81de790d776f403d1ac233bbc6d862fb2 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/194cacf8a0c9bfbcf069f8fcdbf83d95fe0e063d | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ecd2be76bb9a9c545510b4cbca1472912f00e2ed | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6777761168f2bd9988943be73300a6b86ebe76ea | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6bcbe0b828d7829ba6d9e1adaf4060469dbbd31e | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6034d792638dc60697bda12b3d795fb5b5e2f399 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/100ad73d7bd30edc33c2a05e1d174e7e4ef8d75b | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f3209f89d45942eca7949a1d3cd20af5e21afbe1 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6240c9f02be80cdf7693ed4928823ec1ab1ccbd5 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/459941d703c24a5df3669bc56cd5fc327c7c6fc5 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f39eadee7955c2fe7587e4f6808600e13fa2c1f1 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4ec357772579a974cb09d7b22510bf132110ccee | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/328cbf54f8cbea4b8cf970a2d3db61fab038f914 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/94bc35751a85f0017e5d9b069f8ab542db106c4e | ORPH
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/d3a38d8178da9791f7c3b477922a8ff2cf773538 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/e37a1becff2bf9b4924b033a4ba13c4f951857ed |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/4e27b211e68319c714f2e82e558f440dac43096f |     
  sparc64    |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/b58aeb77988317afd11653c2de82f7ecc21d2391 |     
  aarch64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/091dbb99fd3441ee67760c1ac0bc27b1eb5bb6c3 | ORPH
   nios2     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/e6cb402d21628ac7d29c566ed12513d28f4c4d11 | ORPH
 powerpc64   |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/fade8a08842aece5aa50d61d066d33c2ab1b5282 | ORPH
  mips64el   |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/b7cdddd6ffa00d24483ae475da6039d07c484448 | ORPH
   sh4aeb    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/7fc1bc3943ed9a1bf0dfc4aafd1674647b39b360 | ORPH
   xtensa    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/62dd5a0bd5af5ae9e04631d3006193ca855e944a | ORPH
  riscv64    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/cc7f7b7b91c9ff8b3dedf1635bccef991a6ffaee | ORPH
    i686     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/9db6a5304be2add702740f4efca3c678e29c2436 | ORPH
  powerpc    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/06b8b781db135ad3bf8b2735852f48688daba535 | ORPH
    i686     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/53b4966cc09cfd59182bd64fa4b906609376e106 | ORPH
   xtensa    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/ee69ce55d9680546c9fd8a774cc3b86bcaafa60f | ORPH
    or1k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/46d234012b672c06e5192e0effc02da696bac623 | ORPH
 powerpc64   |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/ef3b7aa06471edef2802beb1bc5402a2abca8e11 | ORPH
    mips     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/1f5b98e87c8b6c21bd65319e526a414dd23f7f54 |     
   sparc     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/ee5ba8f8c5dfc81e480bfffd9c8492b5b8eee542 |     
  powerpc    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/ead71ff6cf1b4c18df97e8ac4d4d6c752b1bb964 |     
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/d63e7a4e3f31aef14a61d2a79d945761592cad21 | ORPH
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/29b879492d457c7283a54f1b4ee7da265bba83ef | ORPH
   xtensa    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/73cd8c99c03f2c416c5844d76213fcc7ad78bb37 | ORPH
  sparc64    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/3281c4ea4a86b55721a8a114d1fcf9af9bac8368 | ORPH
   xtensa    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c670e8fd193dcb3eea146d2f120f8de4e6630522 | ORPH
   mips64    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/7ecb8fd426cbac5e5bfd26b4f087c7cd6880cfb8 | ORPH
  aarch64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/2f33ce700bb52119424fbe9b2fa121fc24731c2e |     
    or1k     |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/e69b175d233480ae18edd799109b08fe9ed63dde |     
   armeb     |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/c00ce7b6ac69ebfd849e423fa15990490c884aed |     
  aarch64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/cb71e84abc7d109fd817916a92c475a027ee8a8c |     
    mips     |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/9073258a197b5af112be7734a8326f83ac97184c |     
   x86_64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/e66a46b494b71a83cc65ea2ee15e38d4f95190b5 |     
    or1k     |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/4a9913424719ddd0718695d54f2daae9dd4d3b6c |     
  aarch64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/4c89ad1098a59659f6abb3dc60b82e5d4ec05a6f |     
   armeb     |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/8dffb2cd136a6d439dfd2898194c5d40583bb529 |     
microblazeel |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/ed14ea31a93499c7af63d7312a66a98c7b901e86 |     
 aarch64_be  |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/f94e14c098c8a50f24ed6846177b96a4ccff48a6 |     
   x86_64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/03f43a556fe81f709ccb23cac8486e658d1a17de |     
microblazeel |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/7ba8aadd8958e211b59770b63137802fe6b8e5d6 |     
 microblaze  |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/09cfb826f71fc2649e7f3bfe4639507b216e453f |     
 powerpc64   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/0b59a411a04b7976c068222dfb77e7a773ca16b1 | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/57f30c58c2b4df0f11748d8920c9acc89c793058 | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/1faeff54ed8927de5644bf267a551718e79644a5 | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/43b4e95007ec79e0874daef07a6aa5e4b9324b9e | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/49c0c55ef5195a637bac7b6bc8d2cb39c3070c95 | ORPH
    mips     |         logsurfer-1.8          | NOK | http://autobuild.buildroot.net/results/10209e4cf44326e003af136a39f3bc28570ce1e0 |     
   x86_64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/a6354021ade24cc63c26cc9fb8bcee243df45ae7 |     
   mipsel    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/664094488e6b4507c85b27ad76c56484ffbf33d7 |     
  mips64el   |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/29d63dfce16abb67d5f7ac24483518043286b49f | ORPH
  sparc64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/9fe8e72555e2005136342d57cf3256fa3cb6396d | ORPH
  riscv32    |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/80409978d38a30a5e08805d0025bc5def9141045 | ORPH
    m68k     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/d027d3421925da3c3e78ca5fb78149a4dbd5ab46 | ORPH
   s390x     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/95548721158424f9350c48bf297f220c61dcbfa0 | ORPH
    arm      |         mokutil-0.7.1          | NOK | http://autobuild.buildroot.net/results/dcdff542ecad0724418826ead9846c1fd8b3e4a1 |     
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/9dc21d46606904f12f363ebabb0a58755ac6ce31 |     
   arceb     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/b289d371fd6812870f9a4a187c58eee032f2378a |     
    i586     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/9e594a66fa25e088cfaee9ed33443a9ec7af129f |     
   s390x     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/63c01e87b1439f4a73606c16766753e04d5ad11d |     
   armeb     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/441642ca9f57b972a2bc41de5dbd592e298e7755 |     
    arm      |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/45bdc1532f008e57dd57ba87af899a11b47864d6 |     
microblazeel |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/f0c4e10da26931805523390af4cc19adc0550e6d |     
    i686     |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/3d835dc4ae4fee4d2a88d1da274dddbd6a26d518 | ORPH
   arceb     |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/f0721b83f4d690f1199c81c594fbe9443a056834 | ORPH
   sparc     |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/b2aacc2dc32f0903408e3a3ebdee589a2e1b479e | ORPH
    or1k     |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/b0a9c174af747a0abfe697191eaba70c5bde1178 | ORPH
   nios2     |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/4438ff9f9a526277b9d7fb4491435cdfe08e2733 | ORPH
microblazeel |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/94737fc208208bcc3b7bd42598f834a1812ed11c | ORPH
  powerpc    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/e40afa2a4ce0fb719f27dfcd2158523a0f3bd962 |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/6f5ddaf0b4feabe76cca7bb9461c218aee0c420b |     
microblazeel |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/a0764213876bc557c3f2d62b5c27b86ada49a578 | ORPH
  riscv64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/cbccc6cf51bf0c8007b586c7383af7f3279f8f98 | ORPH
   sparc     |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/bb5bfd060d3b211ef51979e1caa7196d224e2828 | ORPH
microblazeel |        postgresql-16.3         | NOK | http://autobuild.buildroot.net/results/fcc088411a10c885dbab2ab4997495a96b918443 |     
    or1k     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/203590cab58ec47d3d6540568c3ef00c7762097a |     
   mipsel    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/8c1979835425c38fb4f59508f9b0de4faccba5af |     
microblazeel |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/7e471e9c21331dabaf44033f0e2f5e6e29530497 |     
    or1k     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/8394dc1454aefb3dd51d01aa5169858765318a95 |     
  sparc64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/d0a18d68bf466f66e99cb587877e80b83bc851d0 |     
   arceb     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/3ad4e9854b099896067990013fc3c6baaedbeb63 |     
   x86_64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/6633980cf267faa7e17ad886d3addaecad1346ff |     
  aarch64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/06d51c52601cf1fe79239fe29c0dbaee12352477 |     
microblazeel |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/2237797b3e83d37247ebb97b97c03bf7da372bee |     
   mipsel    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/6a02cf686dc5facf3c933ecf083ab95b8cb4d55a |     
   s390x     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/b6ec4895228b560d3cef5a778ccdd7362070e695 |     
    mips     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/2bf94a1c3630d22d9a086763414ace43b935b2a0 |     
 aarch64_be  |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/163012d1aa67888ba5ebdeff9ddc69793a256a12 |     
microblazeel |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/eba2dbf3b472a675091374b74fef80cd38b6501e |     
   mipsel    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/9ea13e4062e51a0f5a4d552275ee16af18a49077 |     
 microblaze  |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/33226b82e6bea45455de75a4a9eb4b37ad6b68b2 |     
   x86_64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/c5387eba3798a2870686a5ec768edfaa2ebf6db9 |     
    or1k     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/ca18c1850e34d021f729611a2d7a4cc5568757df |     
   mipsel    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/646f49c9372171acf22fb3094d328ec67e272eb4 |     
   x86_64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/21fc7a22c0f169925e3b14bcb609fe734b4de857 |     
 aarch64_be  |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/b068b6488c6bbf217ff225b5ca746a4e4e41788f |     
  aarch64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/af035c53eb7b0b269b3d5d89b2821ef50b2e59bc |     
  sparc64    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/89ad9993dfc40fe90f986299bd98a79573debe28 |     
 microblaze  |         rrdtool-1.8.0          | NOK | http://autobuild.buildroot.net/results/6996dbd764b0066da49dd009f1385196342c89dc |     
  powerpc    |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/bfd3d2b67af176d217593157ad6651da04a4613d |     
powerpc64le  | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/b880f502f940e8777c45498e64c4be9ebbf97d64 | ORPH
 powerpc64   | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/dcb2eba1d23635a575edc69bc73cd21cac2c2675 | ORPH
  aarch64    | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/b9db95b94bb91d962c1cbc7b1a473be262de46ee | ORPH
    or1k     |        skalibs-2.14.1.1        | NOK | http://autobuild.buildroot.net/results/407347570fbde1446856ea6626b9dc1c9ed1d2cb |     
    or1k     |        skalibs-2.14.1.1        | NOK | http://autobuild.buildroot.net/results/0cd61cc7320fabe2044bf28a5177afc542c41ab6 |     
    i686     |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/a8bdb9e58bed6b30b41318e61f7f660fd655d747 | ORPH
    m68k     | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/e19cac0443a5623a4fcbaeb003d022a7a5c8c10d | ORPH
   xtensa    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/48de5ba602b267e96d95e263ece027d77fce5e69 | ORPH
   armeb     |         sqlite-3.45.1          | NOK | http://autobuild.buildroot.net/results/0a2db15d556e1ced34b5a847cbab2981bca9728c |     
   x86_64    |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/6854889c3200a81dce9d3ed7db7e515822eda8d4 |     
   x86_64    |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/2d4f0c427bf72bceb6bc73f8621cf933c67814eb |     
  aarch64    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/367e9cf6d4e2d754bd5a27e080e34f1fac7bef93 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/05926d8eaae7fe149d18c51df65450942fe89db3 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b2084807cf46ad690a4a4e39dfad1df9e0fc0f7d |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/a40c166388e1c63f1f69954fe9b1aea0ca41fd4c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/314425c9655245c1060d87a6adfab0847c2df12b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7827a3d09c2fe879f59d86dc5d611fed86a6f59d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e3c2146307752b97b542feb5df8940737983a9ec |     
   arceb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0057cbcacc45679707be82155aa77ff041e0200c | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/fb6a2726098d20ed714d7f7deedb684eaab0b592 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a47cba73f7419072a59eebe1287a50cff4ced724 | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7768ad19208a1bf82704eb64220b9b3e955acf45 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/22fe68743c6a6aa5e299c617d68eaf80d88966a7 | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/793d1346ff2fe825473abeb769f48c916338a0b0 | ORPH
  riscv64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4d10f461356976c419703c6fced784d715f0de46 | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9d44fe738259cb7da6c077ad5e2d488d2be6b802 | ORPH
  aarch64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/48cac7dc6fa1227ee4e20f2753c5f76fd8e3af26 | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/00885b1fb0f525a2fa314d594f97c51c9a1e2072 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b3788f88729d6e64985bfd28e348b8e177efed8f | ORPH
   arceb     |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/164c844f16bf0a1e5bd75446f1e3939b174abbfe |     
    m68k     |            zsh-5.9             | NOK | http://autobuild.buildroot.net/results/7922287ab9b007edf6497ae258bf7a0bc5771674 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/518f51b2b78182fba915c5abcde1ba7939035356 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6d18a6c2d3e4e8d89fa6e60a5050c0dfaf44d265 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/aeaeef272e51ebca524e9a7bdca0f249663cae92 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4b8d5c03bc24432921514388aa857d81c36ff4ee |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a8568adc80f9a6c6f85e9a1dc194078b42ca40b7 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/488b3c844a5f3eade58a6d7d36c192baac82ce9c |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/324144fefced586f2c743280a89d879f2747ce5b |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/af207c7df25b0b29428b39d25dea66a76ed223ea |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e0917e0a355ec2663d6707dabba7d5108bf82b7e |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ba8183aae0f1ef9d4db13a6acf59fe5456e46528 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/551bd5d215a1b4e291ddde838ace79b2073a4799 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2243de3f46aa45b8841b32a431719f0ba4c2e8bd |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2d497cde78718fd3afc210c7f2602a8fad17542f |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9dc880bbd58eef954c1bf61e340c37568ab29f85 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6117bc64b2b0865fde04fd7dc6637c56eb670e72 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6bf154468231cd425ceb60d30c54529607dca65f |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/de38b5c53a0eae1968b7fa14d47783d75a54d964 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e3172e695b00688f10157a1acbcbf22d274d17b9 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b9c8aead6b46f6b4dbd9ec606f35d6ae9c25ab0d |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/72cf7975966a46506c40c3468156fb396d9ab87f |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/32b1cb60a2a460579f07b015ea561de8c689a411 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c504a427e5b0ac0b1697683a04826b5b4e94ced1 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d8bb9ace81117d5577f1072a79e03a50e87c3524 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7187980ddac63393a9271376c6ca16af784b79c1 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f9042c1640b91e1780975fd4800809f6f0ebe368 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/52a920b5c970b5ab68d8e90ca6981395063f39c6 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2eb30139ba3445328eddc1fcfa8ef8818c19bfda |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/db03559ae5273a6f3462bd15910049b67072c578 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f826c878c741a99a552831580b8b8a9b976bdc96 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c939b2a3ba72e6a058a30bf8ffd8ad3abcf44a03 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/53c37ddae32dd2c3bae20a3ec5629c714fc246a8 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/824324be8da6165abbe53815f08a5a48ef829511 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5f76c798b8f5cae4dc0407f425806c695f2d2414 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/00c7c7a3ba7994dfc1fb12ea9912b9ff22d175ba |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7a268e43cd9b0b591930beaaa66e047f943bcb92 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7c41283cfdb008b52c0e6284a168c5069c71a0f2 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4fe7b3bc12caa6aa3cb029e156f874be1f22d31f |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1bee276e44899e8fd2a454e5e0fc6e17031a984b |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f07eea7289ee186dbbf65fd7183852505c8c5cf7 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/95235a988e85f61de9ade1620cc7ef560f62135a |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                elfutils-0.189 | 1 
                 erlang-26.0.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.17 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          libcamera-apps-1.2.1 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/31501b09dc83ffaee1edc049587fe4a4561b1813 |     
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/224df63701da76ab3eccf716744e27c394fc5ae6 | ORPH
  powerpc    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/5f103c3330c46faf8e9167ec986aedda9c522ee1 |     
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/940428f9cc87829d146e2da0d6adee753c3e0ca1 | ORPH
  aarch64    |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/fde8246e4b88760be8d9f328047046afb1e799dd |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8c508f4acaed613cd1d17ad91ef310e8dbe22d3b | ORPH
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d9c038d50e5e18afc2e4772d8c61419d47c803b1 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f05ab8636d6267eb47f1ce374a3c8cb7966d24f8 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/e07dd27561f2361e9e1881401c3b854fa4152a9b |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 4 
                   bird-2.0.12 | 2 
                 coreutils-9.3 | 1 
                   duma-2.5.21 | 1 
               freeipmi-1.6.14 | 1 
                gnu-efi-3.0.18 | 1 
                 highway-1.1.0 | 1 
                 libp11-0.4.12 | 1 
                libressl-3.8.4 | 1 
                openswan-3.0.0 | 1 
sconeserver-8d1935919a20133... | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9693a90a9328c8f5002f666871a380d283f4f377 |     
  riscv64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/5edfb79928568e49cfebd5344a4a28bd54332feb |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e51158c34fa5bd525b0827a43afbc15f8d574633 | ORPH
  mips64el   |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/ed09a82b4eab30cf8c69eb93419010a6cdb54b29 | ORPH
    sh4      |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/66fd8ba82061c38d9afb0c54782e748c86b90c51 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4277a36f4cd54c4bd2630c814ba1df17c0167539 |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/8489c9ae6f97bad51338de0954d70c4207003e3f |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/22e70ddb9593d6a38a201a5ed499c04f5c905222 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/309241e374d70d2e4c8aa5167e2ba3748d5ac1ca |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/51b663ca45051d416c36a83470a5826adbbc09e0 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/693951596e7c17ef356ae3e516e5b8803d56a669 |     
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/8512937bf7a80eb18e01b3504f81b7b23779598b | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a0adc995e94daadfb86dafe0feaf9712e05a2a0d | ORPH
    arm      |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/d69ee95f8758e2946e0062085b29abdee3522e34 | ORPH
  mips64el   | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/9f6333c95a21006ddf407ed2eea68da4124b95d0 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/8f6521ac6adee19e28abe2a8fd961ab510fb4d43 |     


Gitlab CI results for 2024-06-26
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168025669  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168025671  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168024086  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168024096  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168024306  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168023449  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168024347  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168024348  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/7191925205  | ORPH 
               TestZchunk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168024387  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168024393  | ORPH 
                 TestZstd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7168024399  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
