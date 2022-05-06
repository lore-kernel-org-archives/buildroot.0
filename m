Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1DAC433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 04:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87AA34047D;
	Fri,  6 May 2022 04:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_59d8aMekm0; Fri,  6 May 2022 04:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6273040329;
	Fri,  6 May 2022 04:47:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C9E31BF30A
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 04:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5934840329
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 04:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDV3xdZrfOPM for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 04:47:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E96D40025
 for <buildroot@buildroot.org>; Fri,  6 May 2022 04:47:06 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A1614000E
 for <buildroot@buildroot.org>; Fri,  6 May 2022 04:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651812423; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iqLgxm8dmesbe8xIK15TgfOgXLW30iRkr+jTu2kUZ+4=;
 b=U8CME5eW0yYe8o0Hwsi5fdCs7+NDq00dFPu03nQgXGk4IFn1OfKuq/JfBgaTyI6vP3l6tz
 Bft3LxNYwxDuzc4wvSsVJ+AuuzP2MWED2psVrnMAysFZaFKDBuJHVBzxDkdifxDvrF3soO
 M55uIZ/ccI1RV9sSRkBYvR7aVjKy1PrZZrEX4VMY+PYaiseKuB/7xKPO2FtZTHpIvBof+s
 C7Oe/HmusUeVEvihK+u3fCeLTCRAI+xBZTqEuB4X5gShfjYnoUQbyu3xNU3zROro5jPy1o
 YLqEH+bUVywPjzVrx2sjOzfbLYxueuL8Tq0cI96LZX3G32JuXTknYm1OENG6OA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 06 May 2022 04:47:03 -0000
Message-Id: <20220506044709.5934840329@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-05
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

Autobuild statistics for 2022-05-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 24  | 10  |  0  | 34  |
    master   | 192 | 269 |  2  | 463 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 22
         host-gcc-final-10.3.0 | 17
                    git-2.31.2 | 16
             libopenssl-1.1.1o | 15
                 uclibc-1.0.40 | 10
                pciutils-3.8.0 | 8 
               protobuf-3.20.1 | 8 
glibc-2.34-109-gd64b08d5ba7... | 7 
          host-gcc-final-9.4.0 | 6 
                  zchunk-1.2.2 | 6 
                host-go-1.18.1 | 5 
    toolchain-external-bootlin | 5 
         host-gcc-final-11.3.0 | 4 
                libressl-3.5.2 | 4 
                 linux-5.15.37 | 4 
                 zlib-ng-2.0.6 | 4 
                     aufs-util | 3 
              host-rust-1.60.0 | 3 
           libwebsockets-4.3.1 | 3 
              memcached-1.6.12 | 3 
            ocf-linux-20120127 | 3 
                     refpolicy | 3 
                       unknown | 3 
android-tools-4.2.2+git2013... | 2 
                arp-scan-1.9.7 | 2 
                busybox-1.35.0 | 2 
                    dhcp-4.4.3 | 2 
                  ffmpeg-4.4.2 | 2 
                     frr-8.2.2 | 2 
  gobject-introspection-1.70.0 | 2 
host-google-breakpad-c85eb4... | 2 
             host-libbpf-0.7.0 | 2 
              host-libcap-2.64 | 2 
                  kexec-2.0.23 | 2 
       linux-5.10.104-cip3-rt3 | 2 
                   perl-5.34.1 | 2 
          perl-net-ssleay-1.85 | 2 
            pkcs11-helper-1.28 | 2 
polkit-a2bf5c9c83b6ae46cbd5... | 2 
            qpid-proton-0.35.0 | 2 
                tinifier-3.4.0 | 2 
toolchain-external-bootlin-... | 2 
ulog-0389d243352255f6182326... | 2 
                       xenomai | 2 
               aircrack-ng-1.6 | 1 
                alsa-lib-1.2.6 | 1 
                    bat-0.19.0 | 1 
                     bc-1.07.1 | 1 
                  bcusdk-0.0.5 | 1 
                  bwm-ng-0.6.3 | 1 
              containerd-1.6.2 | 1 
                 coreutils-9.1 | 1 
                cryptopp-8.6.0 | 1 
                 dmalloc-5.6.5 | 1 
docker-proxy-339b972b464ee3... | 1 
            ecryptfs-utils-111 | 1 
                   eigen-3.4.0 | 1 
                      fbv-1.0b | 1 
                 fdk-aac-2.0.2 | 1 
                     file-5.41 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                  gauche-0.9.9 | 1 
               git-crypt-0.6.0 | 1 
                     gmp-6.2.1 | 1 
                  gnutls-3.7.4 | 1 
         gobject-introspection | 1 
           heirloom-mailx-12.5 | 1 
            igh-ethercat-1.5.2 | 1 
                   json-c-0.15 | 1 
ktap-23bc7a4a94bd9e4e1b8b7c... | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                 libbsd-0.11.3 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.70.4 | 1 
             libgpg-error-1.42 | 1 
                 libp11-0.4.11 | 1 
               libtalloc-2.3.3 | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
                libzlib-1.2.12 | 1 
          lttng-modules-2.13.1 | 1 
luajit-f2b37f51f69ba7e9f8de... | 1 
          moby-buildkit-0.10.0 | 1 
                       mongodb | 1 
                mongodb-4.2.18 | 1 
                   ncurses-6.1 | 1 
                  netsurf-3.10 | 1 
                     nmap-7.92 | 1 
                nodejs-14.18.3 | 1 
              open62541-v1.2.2 | 1 
                 openssh-9.0p1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    opus-1.3.1 | 1 
                    php-8.0.18 | 1 
               pipewire-0.3.50 | 1 
                      rauc-1.6 | 1 
                rng-tools-6.15 | 1 
rtl8189fs-73f826f0fa74b2fc1... | 1 
rtl8812au-aircrack-ng-3a640... | 1 
       shadowsocks-libev-3.3.5 | 1 
                  sudo-1.9.8p2 | 1 
                 systemd-250.4 | 1 
toolchain-external-bootlin-... | 1 
                  vlc-3.0.17.4 | 1 
                  waffle-1.6.1 | 1 
                 wavemon-0.9.4 | 1 
                wtfutil-0.41.0 | 1 
                  xvisor-0.3.1 | 1 
                      xz-5.2.5 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/5f51e9f98274d25dc2c0d4bfc73631627e252307 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/c88f271aceb450ad47e646bff85cc20f89a0174e |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a2f1018776ecb1e1dfca291b3c17b902ee4c82e6 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8a72ce390ee0ba18ed93b94bf73b127aba55cff8 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/30659141967bc581ddefc29a7bb8d441ed92bc01 |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/c6d345844052e3b49422fabc9b6ef5fe0fbaf9db |     
   sparc     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/767233f6066319cca20663b0a2c9b1de879ce89e |     
  mips64el   |           aufs-util            | NOK | http://autobuild.buildroot.net/results/69e59d64f9c2e133672eacc00b0ffcebf8651edd |     
    mips     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/7a88c9abd1410c9bf1214bc62c5a4408549301ed |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/adc70f4db84b8c18a095b3d2ee9cbd20e983a676 |     
  riscv64    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/6d7ec50f3127ab55277e9d0e879c3a2b00036087 |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/72d6a2fd1869fc2cdcd0e2226247262c2acf578e |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/fb69fb33826fbb774210cf77d08fd84cfdf5fa9e | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/4a1fb12c7a72ee01ea9dcb719ae33434379c29fd | ORPH
  riscv64    |          bwm-ng-0.6.3          | NOK | http://autobuild.buildroot.net/results/e9ee868a9e2ddaba98c1925466fc1112ca634c93 |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/0acacd81db460f9fd3986a6b02fc92232bd51e47 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/60634497830198e042b34bf81738c395a8f6559b | ORPH
microblazeel |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/1332116e5f6218fc22d8f08c0e46d67b07076a72 |     
microblazeel |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/19c21ab215c92cece8e970bf8694e6749c45bd2e | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/3c7bdd5705b25e2c73c599d8b187fd0fa60dc098 | ORPH
 powerpc64   |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/4e7510090c0022414e5ececff711fb696a19bafb | ORPH
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/a976b8d6bf5f1a05cab2a185ab212ed771a624d3 |     
    arc      |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/0f6b1d52cd89408926510f65bb2ac9cd67f8f270 |     
  mips64el   |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/baf7295a2669d8bbc7667140831e2e3e7a3f2ad5 |     
  sparc64    |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/bac0f2f5b8ec0154a7399e7f5763bfbed311088a | ORPH
   armeb     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/69eca72ab90c78f3cf37ded9a418f36ac2e2c905 |     
    arm      |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/2c5c0cedd1cbdebd42893cbf7ba91ee8765c380b |     
    arm      |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/c14681425de9e0abea546448e85dafe365a32993 |     
   armeb     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/4e7ebf0f7b574576bdd1ef5bfc9fc4faa2e19200 | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/53f3b7e2e5d9f7e521ec823adfb2c5c75563e7a1 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/8e19bdb2df1e9bd2eda8054d4d960ab596f5e155 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/83ec0287e452834f9a6999561ba591db91c1cca5 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/4100bcfa892875fcfa3c19b8ae559bc4813bca32 |     
   armeb     |          gauche-0.9.9          | NOK | http://autobuild.buildroot.net/results/222d35fcb5d2c0b91025fc0472c52991c728e8b5 |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/ae85f1fe3370981de5dc5df757ed2bb64d507d0f |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/65a00d1d91760c6b31231c822647ad6fdececbdf |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/790075d823f366ed89090db68f32fd402f7757b4 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/42c3760699378a19dfef6109e7ab7c1da60da5ac |     
   xtensa    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a88e8db31b5239d6d98be23588cedafa4c69144f |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4255661e1a9a5b80c2145410119f7bbd325d45b9 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/31997d10b1b60998faabd0ed8804211483b3739c |     
    arm      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/017cea63f9157b32e802bf7d027a10c48ea3fedc |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b4b7a2ba4e50926e28ad805161f31353fa49b075 |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/5e21f8151d8d9eb9d20231ca297e25f0360762d3 |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/aa52db2ad7300cdf35562a73d3915b808de4fd32 |     
   xtensa    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/0af4025169de3dc111db5d9a93a05bcebd9ac75c |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b6f21b6023b37592efc3089005d5d01926e29d84 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/2f5151e2d01f7d2242e91c225dc0586f5b14c00c |     
   xtensa    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/17c0977a76a118a4f46196553cc36e590e5f5d91 |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/6e42451c17834371698ae2251146f73814df2835 |     
    mips     |        git-crypt-0.6.0         | NOK | http://autobuild.buildroot.net/results/b9409ca3d76351cb9485651ff88c3ee45ce50075 | ORPH
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/5d67ae6b5e982b419b6f551c1ce148d42443b330 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/8b5c542c64a7bc2bf2995b03dc868f2291640bb2 |     
    sh4a     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/7b09a34dd22f64c95767a8db3f3db57b9d4fa7ae |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/8f6ccce01e5efc0653077c5eede6f78af925294c |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/92ab47603d16c1994340ae525581a28079ec125d |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/d6f1f49e5e733533a070c6da28dd21df603f3568 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/5a125112e3162577d9cc417dd3ce48e76bc7d47c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/842c5f36f89ea0fa8d808b4da4bcecc3bf94bd87 | ORPH
    i686     |          gnutls-3.7.4          | NOK | http://autobuild.buildroot.net/results/c7f36d5ee0e36f9ba5ca9cdf0cb4575536327d50 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ddb658690d2c41144a7ac1f7d6fa4b8b91d9c522 |     
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/52677168fd7f445a14c602c559ec5448eba8a0ba | ORPH
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/8217f30bf6c24ab553d82b95c81b2f860eb3eb30 | ORPH
    sh4a     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/25d9f5c35c4b787192089c6e94b9530af5c483c8 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b60e622a1a2f0bc33003a567c0e3eadbc583ba32 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4d46553e626fefc484691c3a4079a5d71dc54681 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e2fb6914d2fa5e0e3a5e89b3b755411f3c0b173a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/71e8802f3927add6bb9eb782c4d63830586cb6ab |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c55c2a63c10485444f4dd03626ff0144cbfd1732 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f7fdbddd7e50d7f7aa999d614d622ce499dbabaa |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8ba147843d265dfc4d5c5071a368cd08178582f4 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4ff8d5879c82d7b5cb2da6e96d75247ece7f1f94 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8730d3a266bcbb9d2148f26a1facaf91aaa31754 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6ec6c1d530622b9792603ae0ab285fe0079851d6 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6b1a4285281a7ea68faa2684aad7c4235f982086 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6ecbb6bfbb756f14cd0c05b7bb3ffeb7c4515ee6 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1f7a569d42572f0f8ed1158c07dfa6e21157f7e1 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ab68b2f48f536f2ef0004fdbd52c9c62e9199da9 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/07de8d431678418fdae3baec9441fd41bb454449 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5681d001c028fbb1c66a901a3232a5238891b607 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b7034016a1595e0aa10179fef43e211d7f8ca7cd |     
    i586     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/5f00b56edcd76977fa1f0b0bcdfeed201ed6b9e1 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2f03f2be32ad9898a990f6f0264d8c8d51991eb1 |     
 powerpc64   |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/8eb37b81661ba79bdae9aeab0f9282e3a4e9b038 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f014b126fcc6b607d3dd880d5af2463ed300b3d1 |     
    i586     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/89cc4e7e677c57176a15c5d1f1f5d5baaaa5a2c8 |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e6f28a218b5f684fa13c913a116867b842929df4 |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/dec6e318ed03178f764473b54c0235212ea3d643 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/deccf3c1b15b748b4dc34b036d694ef3f45c353c |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/1950348218a4f097f078d158977c13f8b0a97d6e |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/0a5214d4e7069f2c66148b9eae186c0cd1d06bb5 |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/69322bdba0bb4bd7b4ba1a3f68d9cbe9ea015027 |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/5cdfb0f8b1f9a036d95c52b97eaa0c57fbb63290 |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/6b3f1f79903aaa8166e53cd804451ff60f6a3fad |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/2912e27caf623fdfe09824f1977eec42415d4106 |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/5325dbc8080c135c9789eb8818bb251883b1ff6b |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/213576932cd9910cfbdc51d9a539798db209a26f |     
   x86_64    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/18cc7db0f5babc1cc0c6461f50f9ab99720b4021 |     
microblazeel |       host-libbpf-0.7.0        | NOK | http://autobuild.buildroot.net/results/5bb7b36712e1f4413eeee614822486cfc2bd225a |     
   xtensa    |       host-libbpf-0.7.0        | NOK | http://autobuild.buildroot.net/results/0b72779da05a4a478e1bc293a686e59f5e0f8ed4 |     
   xtensa    |        host-libcap-2.64        | NOK | http://autobuild.buildroot.net/results/153d394fcb280003bc6dbcd3c081960174240b71 |     
  powerpc    |        host-libcap-2.64        | NOK | http://autobuild.buildroot.net/results/fdb3c65ffd8dd44094369064ba9f4a5dbc5a8c20 |     
    arm      |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/8b3ac70e369c8c02cc7491d8ae862225c2cb85ad |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/d3ea28fa8dc64cce65c6d5bb034860786721d180 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/2ac71c3f4a7d0785c96258f6eefd1a39c178b943 |     
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/26009e62ecb08a6d80f3ab82abe97eba8416d704 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/8328d9ff604f09b050b0169194d339ead498969e |     
 powerpc64   |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/fbc15f516d5abc41ce1e39f9e169c2836e5f427b | ORPH
    sh4a     |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/bb25a582a2df77c0176bdda1683d6606d9452956 | ORPH
microblazeel | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/f24b2a81c85a9a1d86b0e337857864fc6a9c26db |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/f8fda70abe99224fdf1a1f604f412016080c405e |     
   sh4aeb    |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/daf3366da7599a304b967433ec164831a60dbd21 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7cfc5a000f62b027be8f318263876d286d7af533 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/dadd0cebb763c1c1a8b4766c1ea504cb2ea60850 |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/4a1bf921cf72b94e9d87d7b60fc76364491aea10 | ORPH
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/56136ea88abbbe7cf319717b310d69b4c176a790 |     
    sh4      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/fc38e200580335ab5d37369bcbd9d2b04ef477db |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d10887befc3f4b709b569ffc0c4c0e2e5bdf798f |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7358de0734a6126546e9d35425305a4d07f5b882 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ee7a8fb84edb63deec48e3f38b087f1cce7e4ef2 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e448f2c4d6ed48cd35116e0c8059d1f531eb6bf5 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e31739de60d76265d594118b1f4b80544b5e4fe1 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/69eeb976c7727fd40504e8654e24592aedc3c24e |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/3d25c4ddeebb9d01806ef8d4253c110ffd1db0da |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6b4570798b326f196b6985e72019db6b1397917a |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/706a67b31cdc9f60f687c20b982c402b2f53603d |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0eb4f7315e8a4bfdaaef35b28aa3c10dc03d3c1d |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e165cfd852f8b124922faa8ba61aea0fc6111f58 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/a82b70be6ae4a5621cb962cc3f0765f6e3590f1f |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/9bd3e14926d929b1995bafdfec969d4bc58e5107 |     
   x86_64    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/be199cea396af443da7b00a2aa10330e27062f0f | ORPH
    sh4      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/96fddd59aed9c6c2f2ff31e25c03c93883775c8b | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/4ac8d3af4e95c0c4baf5fb137bee681d7d5de96e | ORPH
    arc      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/295636dc507b29eeb8e7863e995d65e8566004ed | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/2688776f967867d882e0879d9335320bfa55e785 | ORPH
    i686     |        libtalloc-2.3.3         | NOK | http://autobuild.buildroot.net/results/0758fbbd7ab9fa8af8171b52516f16ccaa096b29 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/b4068e117de137a6a15024da037112ba7a09a9fb |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/28e7be6732f9bcf744b9feca73895fa7df34cf5f |     
    sh4      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/cd54b6ecd53bdff0e31982dd0a4d645c68a12e8f |     
 microblaze  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/88749efc84ad7882a790fa857c8f43e9573ad040 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/b2b9b10ad53305f0d99f4e05bf7d87f1205af9f7 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/5efebd82e532718631d4730c00f4d6b419cf7cfd | ORPH
   mipsel    |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/97404a9225c71136c275d3241e76445d7f4286c2 | ORPH
powerpc64le  |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/088899f3cfe447b35b1f5c1bea73e09a8f852234 | ORPH
   mipsel    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/cfa1ebed82dbb43861561d1125a21579736ef4ee | ORPH
   armeb     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/f526091b879b9162cc2d1f5c9f97be2da58caab9 | ORPH
powerpc64le  |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/2e6af3f11939bc60055f64e68e621ca9ff0d20d2 | ORPH
   x86_64    |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/8bfe3391cb9c68a923c63e356f1e0043882fb033 | ORPH
   nios2     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/a9b7fdb98426799df9ecd02b6a08d77e848baae1 |     
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/4cf83350bf89bbbe0b3c4a584dcd965af0b175a5 |     
 aarch64_be  |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/61a446734b3a1b8500d4d8f6ea6b7e576c991063 | ORPH
 aarch64_be  |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/c75ac95aa912e66b0d9cb2153d9ebd1d15137ee0 | ORPH
  aarch64    |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/73862dce51725318e305c94f4056a0636323f71b | ORPH
powerpc64le  |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/7e3cde93b33262caf194cf25659a3ad2e83e7f73 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/de86b2a1dca62c936feb05c866c8bf2b1ab2cdac |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/54d23b1c8dade12f51ccdd75806e72c4d5ca428a |     
  riscv64    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/e2e60464fd75e985352a4caabdfa9bb0483bdd4e | ORPH
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/956347023574f5b1133ecac2a7b1e5b7deea2cdb |     
microblazeel |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/6c5c37eca4c5667eb4630e369c3087c19d556a54 | ORPH
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/1db2bd9a9d0a930d0a9dc636a73534f2bfb0c19e |     
   nios2     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/66a8229f7e21705264330cf035a81250eb993013 | ORPH
   mipsel    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/d842a21d454d35e0ee16f933808818e3601ee74c | ORPH
microblazeel |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/8c6f39261da608286303768ac5b5ab609bdad32e | ORPH
   nios2     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/ac7a7088fd8d7caa74b9dde751573553cbe2708c | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/42efd973da0b8d27d5b88b9b03cbce449b3e4456 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/2ba0360fb84b72f8102ad5c4844c3fb6e499505c |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/748e3de94ae06d57a8424da6d080a0eea8e1371e |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/afccb9aa1f1e130f814c7ecca1943e54f1449d90 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/dd914166dcd0c721426c4d285cf04bd28dc6d315 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/04bcc04acc54a2774120a67268966ccc0273f3cf |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/18a6967280de68d9f44f856bcb55672c742f32f5 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0b5cd129536b6d43502c8748dad0ace626e5a29d |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/59188d5ca385ad8eda26a89fe34d0f14679fc192 |     
powerpc64le  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d7b0dfac82816aa848a6250b0c9041c4ef952c5b |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ab57279bd55c74b9567921cc1d387d52ce2b6126 |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/900dfd11831eee62462b425a3f0d2fab797a4b35 |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cf5ead0129a11fd5c2b2df6dfb91a7c3ae67e43c |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ec44fcd6d3c1c5c084b6747f4e25a6805196f50c |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/86b2a990d0cc1ec696d23a4fa8ea91d1fad39f0c |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fdcca03395b52397274de501913b0ab0b9f7b969 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3ea79ddae30ed44dc4b63f3d871f2e93e49dea59 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/15dbf42ee38615555834bc82bb6bf4a2758c13c3 |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/74929dbebc5ba2395d4eece1ccde961620af1274 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4f03761d74b91d701296937a372edc001020ac2a |     
powerpc64le  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9301c520f06539140aba099ed2f9e5c9e183a9d1 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a26d8f8eb435539c8ef1451f09e8fec402ed2f89 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2e2f5f7366206aeb959fe087ddb0ff1a5f23297f |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/805055dbbecba5bea07e5bcd71e629104f277753 |     
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/a5f7fea1c0ea4fb61cf4b23439e7127551c54cbc | ORPH
   mipsel    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/4a2b939d5571759d5a0061b5177d84e58faca022 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/a06ebfc2a91bdc7d15cae46748ca0ee78a50c10d | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/e3ac980517043a3e290f4e424d1f7a0b0e700b2f | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/3b6a2534e96541a51fd8010c09b7c1e3ff0c06c1 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/2956d343ef7b3a309dd839ab5df3382ba732d94c | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/b22078fc8cd0c833496b711febb319392f727c1e | ORPH
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/49f58d574479acfc1e9017ba6832e414f15102e4 | ORPH
    i686     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/811ed752aaa7512918150f2d1fdf634ff1226cbe | ORPH
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a251e1693f04d15c00b112191427a1ead5eedd6a |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d98a182698a7e74063909cbda69ddcdad1e3ff61 |     
   sh4aeb    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/a19a65b3df927fc5b34ae4bf1b093865c4fb09f3 |     
  mips64el   |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/8e3457dbd9c550042c198b426633828018a140c4 |     
 aarch64_be  |           php-8.0.18           | NOK | http://autobuild.buildroot.net/results/d43ead8d64d1dd9074146f372a3f89f2585b14ff |     
    i686     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/868a05cfaf4f24a33a7288edf575c955f6b5d6b8 |     
  mips64el   |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/2947c80b14432cd84a104e1a27192bd10ed574cc | ORPH
   mipsel    |       pkcs11-helper-1.28       | NOK | http://autobuild.buildroot.net/results/65140d4653f82b3ec12283052b44af5d653af643 | ORPH
   x86_64    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/517c6081c99e8c412a05590ce6e6eadab0b6447a |     
   s390x     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/987685a91c4f1a26d20b8e056e8e31416fe7b000 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/07d55dfde6d07692544002740a6ff8a96dd05733 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/cb438fe1ed1995ecf5890f8cfe2995be3f225816 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/73683b7599352f08cd5ef558a8b26a32714c407a |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c881d05b3a6fdb18bc59e4a3add194a9e8b653b1 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2b390b7a21bb18eae7ebde50908085c176bb6f62 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/74b35d8a865ec732a209222a7dfb71619ab63ece |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ad1c19b4658ea87649d772d3882dfdb630c5bcec |     
 microblaze  |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/25c52d2e2e2ce73d2bd2effd9f232bc590615fe9 |     
  riscv32    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/47d555368358a471a768e13ab66e3464b5db61dd |     
   nios2     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/183ca3118df483b8b78f785539f8d4e253f8ad2f |     
powerpc64le  |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/0e22a8d231eaec81fdc76b54728802fb00544082 |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/32af61b32c0c9be695c3bb41208a689e90f73106 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/270245a12f16af8d983a45628d85b787e53d899b |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3ff9b5267d9233b1e1eedb42c7042f8fc11f2b02 |     
    i686     |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/82744437609f0ec90dae9f0630f5d1219ff51869 |     
   sparc     | rtl8189fs-73f826f0fa74b2fc1... | NOK | http://autobuild.buildroot.net/results/618c2e84b768f7a45a870c2df8988bdbfa4ccb25 |     
 microblaze  | rtl8812au-aircrack-ng-3a640... | NOK | http://autobuild.buildroot.net/results/e3654f902224538eb2f6712cd42890645d589a21 |     
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/2aae418209c5eef37a4267ff5b9eb33452067ee3 |     
   mips64    |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/363001ef556e392f7294c47f1961fb4f491233c7 | ORPH
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/855a7a81da6c96356adb019eda59bf111111d6a6 |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/d3105c7eab0a501415649b04885498ed6a18d367 |     
    i486     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/19cbbffb45277866a860c355ee9c5a8f2e4b77b3 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c3af3616101b56df446b49ccc015a284f6a2a82c |     
   s390x     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/8e5a6c1f882e383a537abc57782aca4f36bf77b7 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c6c0a8dc9dc789447821db714247767ae11aebad |     
   s390x     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/00ac95b629213dcdf257ebb8d9c719d5886de68e |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/3de15947624b65c0f00af3b5d7b242e12e2a8ede |     
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/aa367c02955b5cfcedd9833f4adecd1bfdbe03d4 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/629516c4bef42ef9e78132ca07a42da8eb4da14c | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2b39a9b1c98ebff0a8d5842180763909eb8b161a | ORPH
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c65700d61c0ad1384b6e02700d3c352582127fc0 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8fa956716a37888503373f3b929c9f007efd6718 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ac070f70544c8d99d32d1026cd51dd38405b6c30 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9b4f02cac05f0b9fea97df3a795436d02046146b |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c0c348227067bca3114e684111ed32d8f04ca020 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/fcfea0b63188460f3b54fe1f4d3aebf9cbb0cbf1 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/726c77d4d96b3e0e6e51c37d7d38c2a8fa6da109 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b66301bda2a40df5cd25ce33d3ef6866cef45f4d |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/185d02ee02967733225532bc6fa83a0883ae5355 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ca947ec08455a5d13d8a94e010bd9af2e2d32b87 |     
    arc      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/51bee91906f52edc63eb5c3bfb5d4df56029a655 |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a3da1813135614650e7e00597c07dbc886b61f95 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/34d780c1f8e33d7a6803307435b729dd1cf2fef0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/9171abf40ec7a3e722c8e1dc477f56555b505a2c |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/e1f37db69e33c5927a0539a87cfa1d0745b60692 |     
   x86_64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/6c0fd1eac48d5080c58d5d237476b63f018d3bd0 |     
  aarch64    |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/0445d2376d9174158be4fd97060e8b7e62ec50bc |     
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2e736566f479614ee92fa1350d541769bf4d9603 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/bdfe6fd71c271cb33fd36a3ccd789dd4b5757120 |     
   arceb     |            xenomai             | NOK | http://autobuild.buildroot.net/results/1952b6789a55ef92e85b30cf60425e181ee7dfed |     
   mipsel    |            xenomai             | NOK | http://autobuild.buildroot.net/results/b2a4555cf7109ca9a3e3639272283e6aae5a5e52 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/f62e091c77a9b36bd87b07de0251cdce2597c070 |     
    m68k     |            xz-5.2.5            | NOK | http://autobuild.buildroot.net/results/4a80063acb0618840dfb1f282ec800d9ea993a74 | ORPH
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/6629e84e138dd4316461cda5436c6dee801b75d7 |     
   sparc     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/f66e6a53d92e0e083a9ab9489d55f76724109451 |     
    or1k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/2fdd53ab23ebb65a96a09f5ff52fb0ad679030ed |     
 microblaze  |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/3ba100c99b9555222d2fabd311cf727f26b3d8a9 |     
 microblaze  |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/ab9381fc0618c910d1452bb4d36995a49708519f |     
microblazeel |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/681b52916f269a8bf1826362abc811b78b707ebd |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3aa0df3a08f8e4bff21c8caf461bab4955132b12 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/89139b2ca8216c72042ad38d8e7b62f13ba15c28 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5f6a8f1668cf5a775b3a37dbf7336f45deeee0b4 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/923cf961361f5b8d4a5547b415275346eeddf5a2 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/7e3ce6bc76d2d47d9cc7f93978aeaec028dc43ca |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bird-2.0.8 | 1 
                  exempi-2.6.1 | 1 
                       frr-8.1 | 1 
             host-gtest-1.11.0 | 1 
              host-libcap-2.62 | 1 
                linphone-4.4.8 | 1 
                     mc-4.8.28 | 1 
                   mp4v2-5.0.1 | 1 
               poppler-21.12.0 | 1 
tvheadend-1295dd2be863f5beb... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/69232ebfda36f9f3b7365e83414c31f83624103e |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/83eef5b037ee633e6f9f7b9dccd3e3f9953254ce |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/93fb14c703538a448a22198b33d515875f484fa6 |     
    arm      |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/9c82cce738aae6fd57325089ad615af5e61464e7 |     
  aarch64    |        host-libcap-2.62        | NOK | http://autobuild.buildroot.net/results/c113f9feb00e15fbae6c35323b84f009064ed538 |     
  powerpc    |         linphone-4.4.8         | NOK | http://autobuild.buildroot.net/results/d5636e352f95b38fcb991a9ac41026ec35ebcd96 | ORPH
    arm      |           mc-4.8.28            | NOK | http://autobuild.buildroot.net/results/e3859d1ce5de7ff19638685bef33b5e952beb6c6 |     
  mips64el   |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/21ea39df1bef6b74f37014901e4669feaf6c52b0 | ORPH
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/0cc4fccc7fd9be1de4acd8f4448c035455772f77 |     
    i586     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/6ebd5654b470b837c9907fb520ded95ddb8472d5 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

