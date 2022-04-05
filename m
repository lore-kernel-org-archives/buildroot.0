Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B3CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 05:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E53B6402D1;
	Tue,  5 Apr 2022 05:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8of1kJDHAn3w; Tue,  5 Apr 2022 05:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F7A3409EA;
	Tue,  5 Apr 2022 05:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 006751BF34F
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 05:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B0E82668
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 05:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUJAQZsx9O4l for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 05:25:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B0A781A12
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 05:25:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9E1BD240003
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 05:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649136332; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mQ9sCf6UcJ0beitKdfbNJ5NKBOwE2skTz9P/Os26WaI=;
 b=eqohdXKh8d2tDoALR8WsdGOkft1AaZEQfogh/DXg5+z8nDyt6nySjiX63LGWGeV+I03EsK
 S9qrVh24PKPWCNrb8jFQpK7u0LD68i8SZ51yi7GrOVsbT2p4xhnD0WdmQvqayCIZrdxbCD
 CcHRyZZ5oXs++Tbpnyukr9XQDdgqhFUoDDjBbtwVyLvrrcMMFuxNYzALUWDbeegys91wHJ
 1X9VejtxGqYvM1Cn9vAG4zgV2Zo4+NYuCTcOIUNQWvIw2Mmq+fKi0OQ55vacVGFv1rjdPm
 Og64yAnZ2gZG73JyEif9cotQ07EPe/0dWiEbtOzFC/AI6PsqMbpDGWqjZg6UQw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 05 Apr 2022 05:25:32 -0000
Message-Id: <20220405052538.D9B0E82668@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-04
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

Autobuild statistics for 2022-04-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 77  | 69  |  1  | 147 |
  2022.02.x  | 31  | 76  |  1  | 108 |
    master   | 143 | 401 |  4  | 548 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 49
                 linux-headers | 32
         host-gcc-final-10.3.0 | 31
          linux-headers-custom | 27
host-elf2flt-7e33f28df198c4... | 15
                libressl-3.4.3 | 14
                 dhcp-4.4.2-P1 | 9 
           host-cloop-3.14.1.3 | 8 
          host-gcc-final-9.4.0 | 8 
                libkrb5-1.18.4 | 8 
                python3-3.10.2 | 8 
           argp-standalone-1.3 | 7 
              fetchmail-6.4.29 | 7 
                    git-2.31.1 | 7 
                    opus-1.3.1 | 7 
                  pango-1.50.5 | 7 
                       unknown | 7 
glibc-2.34-109-gd64b08d5ba7... | 6 
             libopenssl-1.1.1n | 6 
              dieharder-3.31.1 | 5 
               libcap-ng-0.8.3 | 5 
                tpm2-tss-3.2.0 | 5 
                 uclibc-1.0.40 | 5 
         host-gcc-final-11.2.0 | 4 
                 zlib-ng-2.0.6 | 4 
               arptables-0.0.5 | 3 
                    belr-4.4.8 | 3 
                     frr-8.2.2 | 3 
  gobject-introspection-1.70.0 | 3 
                   host-nodejs | 3 
                 libcoap-4.3.0 | 3 
                     refpolicy | 3 
             tpm2-pkcs11-1.7.0 | 3 
                    brltty-6.4 | 2 
              bubblewrap-0.6.1 | 2 
              fluidsynth-2.2.5 | 2 
fs/oci/oci.mk:99: /nvmedata... | 2 
       host-gcc-initial-10.3.0 | 2 
        host-gcc-initial-9.4.0 | 2 
          host-util-linux-2.38 | 2 
              libgcrypt-1.10.0 | 2 
                  libnspr-4.33 | 2 
                  netsurf-3.10 | 2 
                   perl-5.34.1 | 2 
polkit-a2bf5c9c83b6ae46cbd5... | 2 
                tpm2-tools-5.2 | 2 
                 wavemon-0.9.4 | 2 
               aircrack-ng-1.6 | 1 
                alsa-lib-1.2.6 | 1 
                  bind-9.16.26 | 1 
                  botan-2.19.1 | 1 
                  brotli-1.0.9 | 1 
                       cfm-0.3 | 1 
                  cppcms-1.2.1 | 1 
                 dash-0.5.11.5 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                  exempi-2.6.1 | 1 
                   expat-2.4.7 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/oci/oci.mk:99: /home/aut... | 1 
fs/oci/oci.mk:99: /home/aut... | 1 
fs/oci/oci.mk:99: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gdbm-1.22 | 1 
        glib-networking-2.70.1 | 1 
         gobject-introspection | 1 
google-breakpad-7515ab13768... | 1 
             gst1-libav-1.20.1 | 1 
                   gstd-0.14.0 | 1 
                   guile-3.0.8 | 1 
          host-gcc-final-8.4.0 | 1 
             host-pango-1.50.5 | 1 
               libcap-ng-0.8.2 | 1 
              libeXosip2-5.3.0 | 1 
                libkcapi-1.1.5 | 1 
                 libp11-0.4.11 | 1 
                 libpsl-0.21.1 | 1 
              libsecret-0.20.5 | 1 
               libvorbis-1.3.7 | 1 
                 linux-5.15.30 | 1 
              liquid-dsp-1.4.0 | 1 
          lua-cqueues-20200726 | 1 
                 mesa3d-21.3.8 | 1 
                 minizip-3.0.5 | 1 
                mongodb-4.2.18 | 1 
                    mpd-0.23.6 | 1 
                      nbd-3.24 | 1 
               pipewire-0.3.48 | 1 
                 pixman-0.40.0 | 1 
              pure-ftpd-1.0.50 | 1 
           python-brotli-1.0.9 | 1 
            python-ujson-4.2.0 | 1 
                  reaver-1.6.6 | 1 
                safeclib-3.7.1 | 1 
       shadowsocks-libev-3.3.5 | 1 
                  spice-0.15.0 | 1 
               spidev_test-5.8 | 1 
      startup-notification-0.9 | 1 
             stress-ng-0.13.05 | 1 
                  stunnel-5.60 | 1 
                  sudo-1.9.8p2 | 1 
              tpm2-abrmd-2.3.3 | 1 
               trace-cmd-2.9.7 | 1 
                   uacme-1.7.1 | 1 
                    vlc-3.0.16 | 1 
              wireshark-3.4.12 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/523a13a29b0673ee0e60385b05bf975a40e5c688 |     
    or1k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/a329d361aafd1ebb4f039c0a12bec45bce8bda8e |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/6e2cff70aafa3ce4dd1239c9050279209f8e03e9 |     
 microblaze  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/b8276e9e111a709651a7e9a0892fcc75c8bbca36 |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/40f7d1f98e6e5f69eeb946a3fcd891d18b41affa |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/8377b3b680c212e15503c5380756421ff4724d6f |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/48a9df6ab5b79128824673a553d232cee5aba83f |     
  mips64el   |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/d61e274b037a55e3bb070ce2d9e191cbdbd4234b |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/58dba13ba433ab5b49cfdd17434a15fb4c1ee6ad |     
    or1k     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/be3dd8e5531369e7d66bdb6ea97d9734d762e5bf | ORPH
microblazeel |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/20fc88f297abfda0018985c2949de6c7f1926755 | ORPH
  sparc64    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/da28190fcfbef23ed4a25b1632a5ac7eca259dd6 | ORPH
 powerpc64   |           belr-4.4.8           | NOK | http://autobuild.buildroot.net/results/41f05966b556a344deea6b9400d051bc2b7e3234 |     
  sparc64    |           belr-4.4.8           | NOK | http://autobuild.buildroot.net/results/c54e7f1e9a846f34d8827a54355bc39cbb83964d |     
   sparc     |           belr-4.4.8           | NOK | http://autobuild.buildroot.net/results/002674acabe8d962bca4b9b95b8ce62d2a219c6c |     
   sh4eb     |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/4f7bf62ad6e00a435c1190b1cb9ef1a748371f8c | ORPH
 powerpc64   |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/f800854b903076279692359b1d723814dc27bf9a | ORPH
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/552ff2471698a34a4d9bc5326b43cf102914f24a |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/76990b107ed8cb01efba656e4f459edc45d84a86 |     
    m68k     |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/239dfbb0b269ff2311373f7934d98706896498c7 |     
   mips64    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/08b7e137ead5d0f0d38831cd1fe6b295749e7fec |     
    mips     |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/793be17affa393774fe3e7295360fff73056a3fd |     
    arm      |            cfm-0.3             | NOK | http://autobuild.buildroot.net/results/20749d7b5553e95946f530fa746213feb21f3ae1 |     
powerpc64le  |          cppcms-1.2.1          | NOK | http://autobuild.buildroot.net/results/367a34a74b37cb51896679448b00cb48723605e8 | ORPH
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/23f5770aa3b8b47ea4502bf72e3cbbc778665a73 | ORPH
  riscv64    | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/08cee5ab6904e2dfe34b106d7055461a459efbf5 |     
microblazeel |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/c36233bbb1bfd3cd5ea8f144dcf29bff3545d355 | ORPH
  riscv32    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/9750710f786abe93fb9c9e29ec9f927f7da74d43 | ORPH
   mipsel    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/5fe1e2bd0c9669aef09752c971d1be24cea093af | ORPH
  sparc64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/b40faf078b08fcb8da4ad82062602974582a8454 | ORPH
  sparc64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/ac68bddd7c1eda7ed1868043295532731e390cc4 | ORPH
    arm      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/337e8446915758ee1affacfff758f81a4b1624c1 | ORPH
  mips64el   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/80bfdc173ab415481a0b77198fdbae520751d795 | ORPH
  riscv64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/d1f602a78c870e4ee517364f942e0cc034cefe08 | ORPH
   xtensa    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/8a52e3e24d5bf58e37306ddd39383928a63a4b59 | ORPH
   arceb     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/28a672bfcba7313be4e459b802570eacc28ee8ce |     
  riscv32    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/959a119349d2556584d550bea1a9ff2bad7aaec6 |     
   mips64    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/66c9cba8304ff250dc9975aba2ca4c0719f5064e |     
   nios2     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/bfe5df72036842d083fc791bd7c53d835c9ba992 |     
    or1k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/4b7f807047714926b00b97df89b79a3a5d0a4d71 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/909c3b24d7834103078f1cc555b476f7a0a6164c |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/96c61c6d6cb41d31cba28931ae1a64b96db55612 |     
   arceb     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/317bdef970e860419487826c83257406e58b6c68 |     
   mips64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/9e01b809bc2d974e7ec695c9d226a5a645ceab95 |     
   arceb     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/d82539949a6eb37ce23bd9392b86d3ef72ef00ff |     
 microblaze  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/c67a838306fd2c0bf536b093f81b53bb6473aeae |     
    i686     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/43206f1020f28e6db0d50197422f9f686b5b6c20 |     
   mips64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/a24705f3022dd948b8c4c5b6649380a78005df1b |     
    m68k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/a1b640e37058e24db3e117a3fc6e10d1c3b56c9e |     
   xtensa    |        fluidsynth-2.2.5        | NOK | http://autobuild.buildroot.net/results/178b944ab89ed8a811e3cefc8572c415025e7847 |     
  riscv32    |        fluidsynth-2.2.5        | NOK | http://autobuild.buildroot.net/results/8e3b9025a7797a659f5a1d85628f0f2a642e1ff0 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/2f5925f35b38996f47142f0e716730c6db174d38 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/50a95fa08dfe2552cce6f95b498885af738d210c |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/3b86046e284edbf22dcb28953f53a4ea3a87ee39 |     
 microblaze  | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/8255f55ad3f404dd577b854234108723322e1018 |     
   mips64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/1c4a5a99cbed16af92500cf16c615ee2135784f5 |     
 aarch64_be  | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/ad28da19e91fabf356bd7d647991b163c6f29e94 |     
 microblaze  | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/be39afab805ad0416a5cd6b14907eeb2817ffb1d |     
    arm      | fs/oci/oci.mk:99: /home/aut... | NOK | http://autobuild.buildroot.net/results/8a156a662478b5cd45a0890a819b00db6ca13b2b |     
   xtensa    | fs/oci/oci.mk:99: /home/aut... | NOK | http://autobuild.buildroot.net/results/296654514ffafb5e2c50554e287f5a818d15e2fa |     
   mipsel    | fs/oci/oci.mk:99: /nvmedata... | NOK | http://autobuild.buildroot.net/results/0ab2c6b276d63a90f8a6291e031a037c561cb446 |     
    mips     | fs/oci/oci.mk:99: /nvmedata... | NOK | http://autobuild.buildroot.net/results/6fe401b1801a7fecad9e15175b17c7c296793213 |     
    arm      | fs/oci/oci.mk:99: /nvmedata... | NOK | http://autobuild.buildroot.net/results/79f4ceb41f6cd2926d041e58466314838f784d04 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9a6e185e22c11388f50a61dd6fb4fa6c4e7ef4bf |     
    or1k     |           gdbm-1.22            | NOK | http://autobuild.buildroot.net/results/8f7c041c945b006b7b188978775eb379a65f18df | ORPH
   mipsel    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/6f7ed28f34c8b7820a96438c03f3607955c9dfff |     
   x86_64    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/e9e9f4aca285ab90d2b2ac50573122966803943b |     
    arc      |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/e75d082332c78f4e5dfffb45373fba0b05474c1a |     
    m68k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/5484be815c0684bada527dde52af15805be7ce25 |     
    arc      |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/dc0b6b12ec31423826f4047bed8c6d6a5b3c9f98 |     
    arc      |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/a5be65d6c8aa821da4ca7a0fc7e4a260bf4724b9 |     
    or1k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/0a64c17eef885c7cca64b7d52b4a7b218bd19f25 |     
    or1k     |     glib-networking-2.70.1     | NOK | http://autobuild.buildroot.net/results/6dc9c1c214a76968596054f809f75e2a04ea3764 | ORPH
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/c0729bc3e24fed3307494d44f40701eb2497f598 |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/0dae755a29426819f793bf34c18a5d83b87d4b14 |     
   arceb     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/b53c3bbc3d16f9236531f995670efce2593f0b3b |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/905775dd7dc9b4912dc722b3eb5dcc231c102725 |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/402af2b3c47eb3cf1ac0d382137572fc35d0c903 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/5ccc985ee43d51bceb552b74edd079c6e314b089 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0ed1cf35b577dc5b6fc8bb48da2cb6b9da29c251 |     
  powerpc    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/be253e409890e9b954b04eeb07108fb5c3b1d415 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/4507dc391dc39e1303a1f04e17685ebc4d4a4450 | ORPH
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/7c46e0d35b9aeb57508346c34b98cc1efa7e1564 | ORPH
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/192ebfab38b962163eac3223b88f78bae68e2afd |     
    or1k     |       gst1-libav-1.20.1        | NOK | http://autobuild.buildroot.net/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a | ORPH
    arm      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/5709acf2760a86e4a64137ea7bb9cd99752cc4a9 | ORPH
    mips     |          guile-3.0.8           | NOK | http://autobuild.buildroot.net/results/d14760e28d65db12dc56b5b5acc2fa6543d841e5 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/652a658beadb030a3ff80dbac0f6cc906f211b04 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fb0bf33d83483c9b60f3537967aaa0084cf56ed1 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/79373606e708cd47837bb52ef5e1afc8eb58e285 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0af7eab572c898b5611ed97c7feed8eaf60f35f1 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/68cf5e0737933d368b5beb7b02b1bf71ebdb7a1f |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/49d70541d7252a973f6941e2a4027fed2e4fb395 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/006df6858263875292c4d9cd110fbe9dfedfa727 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1368303975d6fcf91ea99d0f39e76dda7a9df57a |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6c8c826ff5a521fe3771d31207e37d200818dbe9 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/408e948d097a6691acd5b82e88c2572bbf5d6ba2 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a543f4ad42505d121a7d18ed9f21a101aa1b6471 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1a17352cf75373b63846dad51d4ff94d6029aedb |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/139450b6c8d37af57229cea8623e77d2a4012e5d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/104313f3d79978dff755cfc49d52887c8c1b93c0 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3369151d43e2745cfebd7f31cb59e3db5ed98165 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8cece26547d3fe11be143cdf1df6c2ed38edd672 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/767e5267e800663ece9f5f0e2b78db61e388a466 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fac5da65c48ad69287d12bd4fb9279aa30d76e3c |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5f6635e0c2bca640fa4cae85d8111ff207e511c0 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/33ef4c39bec33ade8e835bbb30d1baaf51802470 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/44a5c04358f1b9a4e2b5c6227ccfbcb0bb1080a3 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fda4b668340691e37cd219394fde8470cb1ae823 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cd425d5710722c6c83a39cb8735d3ff9d9a51172 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4c7f20bcfc2e8652a370f4860c30ee5bf381b58b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f556836d6774770cbec172c54f50b998d037ae19 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/403cf787c7b21f356163a2c81ef424a93332abbb |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/69c427bc2ab2cfcb8ffbb37fc79e2a5819869454 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8a21d8f8cd31a3020f7bcb75eebfde0941b858c8 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bc111cdfd6be4d13410efaee5058f45634e0414d |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b7c49f9bc2092abdf825775bb6f578af4c40f7df |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d2772aef7bebba5af89588bd4f5a66e226b054f8 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3795f9d29512c84cde7b086244f7bcf6c6e26a57 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/48d921c382bd2e560aaca8f691a8ccfc42a8c8f5 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f76c4f3f78c346973c6fe5388b967b1f74bfa108 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c28611a43b17665c158e128c81a395026b253814 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bfe27e81365738e25236ce84cbf0448469f6c6eb |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5976790f5fc4d68cf3b059cd693be5dffeb2d53d |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2bacc3349fee5e7a49eb153d6271df3e43711274 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/704d4306ed1ab829bba3588096e70fb1664d96f9 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/860f43326498b6b649c394a124db4dd223329c03 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5a0ae7075b87fcd38f3de3eedbd489581235569e |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9020901c74977df9c1084b842cea3464b4589b4e |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/07a2585687ac16672b74ac10329e96a892fc1c04 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/42afeaac69fe1ee71201c5fc82cbcd0e5460afb4 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e3205d5229c57d017419e758aa34aea6f20624c9 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3845519561292e797f7586c6ad9614458953da6c |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d44cc0335c43f1783edba345bb1bed228c12b3d1 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/660cc72c0bf1de64cb8e8df20846afd1888b7124 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5c80923e5a23ce079fdc008a502c31d0f37c18fa |     
   xtensa    |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/1cf6617a198c5821bdf0486d03d7a35f4f1f3d6d |     
   xtensa    |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/dc5bf70235b6b4ef92ef1beb995c773037173920 |     
 aarch64_be  |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/fa55b41231d156a5bc56360fe72138d249e0d1ee |     
   armeb     |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/3a03c6bfcebfd18df971ef739070428436548884 |     
    or1k     |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/a151e8e61b50f006ca5006bafca4271f4841a3a7 |     
   mipsel    |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/a21bbd96d66148b70fdd5b027e21e5b2016dd367 |     
  mips64el   |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/c19785169c34e372724aeb975c9e319fc016e159 |     
  aarch64    |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/c03095255a3680ae58160e0844d350e5867c8c74 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/602559268e44af696e716cf252e922b840f14c37 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/5e4fb09096ddcbe641cce2799ceb1bf880b67665 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/671b66cf1ad809a272a58eae693b8b7efaebe61e | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/308005a546285be6e9561b9ffe225db6464b37b7 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/ca7eee7b94b52cec65fb4674bbd30d0b8baf28bf | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/2833acead90bd1fb61d4eb701d88455dc0401508 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/0f282f4617a746255fda3b679155c5d29e699ee4 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/61ab82bab53f6c0618eaf0b21001fcc6c84e94d1 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/053f5173b39a17bd5bb5041ef4a096a977e5584c | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/e67f82e36d56ca84339c94291fa94b62b3d8a050 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/d2394ee0cbb9a6f74bbacb5b28a4fafb18cbd38c | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/1d512401165be19bcae6c535deca5fc4b1adfd67 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/2d75bcc1f5d205148184bfb79b6e2b7c9465a07a | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/d16269768f8a4df17d61694495f7ac30399aed33 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/1447e1970606f05bddab37b949036baa21a7f81b | ORPH
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b8132b762a289a94c92d4b12055eb25afd20186e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2406c0da7c6d4bb67f4da6f575bad49b95699abf |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d8eec955b0b32a3583b1e7f59a5a80d1ab937b30 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/91bd86bcfdfd03c93be11eeeb1d2e61eb36fb4bf |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5d4b6aea91be6712a6996a8992a0ae9c5199c43d |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c803eae1579ab6d648077aa76b93b43c18bf7b19 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dc109c0f84e432c624543df9f4ce1d963c0f23ea |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/298b97082a7c6c5fb1b7949285fdb92ea116dcd0 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1e0e48c23aa531b9456027dd5e66d49b593535d8 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b08ed81c4b4687d781fafe9eea14ffddb2e75546 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/aa8fcb8fb61ee1bb9c3d32032cd8dd2a515f5480 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/660e801b5a3a2fd358d9c9171548006c772ed1ba |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/985f85f47c994b43c6fae4651197bade73414217 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9f6adcd613cf8724e9731ee10ebaa9120ba2cb88 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f69493e64c03ab2d367a7f79d05e4483450236df |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b3a89908d9f968b1e9cfa0817c2ba1a663c72782 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/414dc627f6fd057fa9633dc05dee27616327cccf |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/292e0e46cc397a8995f7a4a86178f04ae2606e19 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a202a8a1c4221d9dbf29b2945d651f07fe9e176b |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6a2837ae595998d32dcc5a9c90ce19bb8674a2f0 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5aab33ecefeac462fd5f68a8d1afbcbac7210b9a |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ebb2cbfb673cca2e1034e88aa5a7aaad9f03f9a8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bd7923f16e64f7641b21a565859303dc9d02f6c6 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e71f5fc61a5b317e368716613cddc05ba677131b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3c3caf75d4166608e66aae0b57fd8056938724ad |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/25904bb640aab2d709b4f066eb3a5a236d8f8e6f |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4eec5545493e2469990314fb2fd1f6df8f6d84b3 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6a24223fb7b3f47096e2dc22dbcc35464b2e9e89 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d8266427e859a578cad6011b306bb125353a7c23 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/05f19b5ca20beded6d49fd3b9de03c9dc4759b46 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8759543cb6ac8e310c6d33e4874ac6325a9741a7 |     
  powerpc    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/b158e78f5318fafd7069f32cd142ee4df2c501a1 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/90f43fe969fdd52e8696fd4232b2181b1b233094 |     
   x86_64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/6679fdfc9329c97f1be2ac12cd5623d0cb22ac00 |     
    i686     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/f80f7ff2fa32e0e09712db6aee0268daf833af71 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | http://autobuild.buildroot.net/results/968e70b3df9d41fcadf7435417d6b5e53f89957c |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/cb120fc480036b5fe7c1e3d5627d0c33d7f117b1 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/51f8dac7a0a430f96082564bfcc75f468c2d76f7 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/1aa26d9ac79e66b6d089f6df20462eccff7baffb |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f61bcc0b4b18eebdc2f48f55de4617928579bfd0 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/bcaecf3b7bdeffb412fbcd57eadb91791144d662 |     
microblazeel |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/90cf12c95494f87eebf2cb103c3ea7076dcf46a0 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/1e1c3eef45e6f826ebbfbb61538b2f03a31b4747 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/a33bae47ed0a6f4fd76e6934f5d9c2e33f9820b9 |     
   arceb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/1a814c652fdda02a7a8388f44acedb61ecacf693 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/deeedf985ed62e2cfdbc91fcbb1eb143dfa81f1b |     
    arm      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/d36fb2fe9591e8daf1b5a0449a829ff4bcaae5e9 |     
   arceb     |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/2f0584c487a72b8cf4284101e9e569778bea8933 |     
   nios2     |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/b9e7f5c0e6756ae2cc0c7521cbd258d16eb9e809 |     
   s390x     |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/0098787e531a7e2d62e6d0b66a9f122200abffc5 |     
   mipsel    |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/d2ee28bcaecd4391a82b8107e0aa2d6fb224c154 |     
powerpc64le  |       host-pango-1.50.5        | NOK | http://autobuild.buildroot.net/results/aa42be64826876fc1bff21f3f596870d7a405afd | ORPH
    i586     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/38fbdbc8c6a69d9e47938898f34ace8d02438500 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/299ea0c125444b6fb17a6942d6d1726a38a9cf99 | ORPH
    or1k     |        libcap-ng-0.8.2         | NOK | http://autobuild.buildroot.net/results/9f647c1e142afc98e8a99a012bf37c44782e5b41 |     
    mips     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a6c5f847349ea6abd17a9bac28622e73c68a806e |     
    m68k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/09ebe27b7fd08c312eeb3018a8f1a78299084a2c |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/4692bd47ed2d3e0c8bce9cc3b4bdad814a93d910 |     
   x86_64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/32e3e8c6cdb1a08b7497a1d6e49def9e4744aa44 |     
   mipsel    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7e14c942d9a47a787e61db0d94e425b33e159b3c |     
    i686     |         libcoap-4.3.0          | NOK | http://autobuild.buildroot.net/results/ecb51283d7bfa052d8b8271efb0a5621450672da |     
   nios2     |         libcoap-4.3.0          | NOK | http://autobuild.buildroot.net/results/30022e437f349459994dccfb612773d529d97a20 |     
   sparc     |         libcoap-4.3.0          | NOK | http://autobuild.buildroot.net/results/9745b0610e70b5636a1dd80e93df20dd0f69ed39 |     
   xtensa    |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/a45b07aaeff896ba6fe6d6dfa9883107e1aa4216 |     
  powerpc    |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/8f5d9edc8a9ee87561d11a136b55717b4882c282 | ORPH
 powerpc64   |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/324d1557d81b055e573ee86ce62977dd4ec8b510 | ORPH
    i686     |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/35141ea3046f5a4593e0b27ef92e4ace6bc0be66 | ORPH
  riscv32    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/86e9f9126669b70f22c41ae96a7cc6f0e010f2ee |     
microblazeel |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/fc57efb1cf5b95a274bc10e4d68641f10c553f78 |     
   mipsel    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/078957b0c24fde17227ae03543a986bc9a583b7a |     
  sparc64    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/94e063c288212da3dea0ddb36a50efeab21d8c38 |     
   mipsel    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/0d042d0be233e6995b566425012f62e4d85d61c1 |     
  riscv64    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/e2a2a8ce2148ef7a31897d54de90861b2d7aa90a |     
   nios2     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/9b542894f4f6060f53c9defd017d3be86d5f1c11 |     
   mipsel    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/965cff6e1dcf1f7f1444b178c9e92431b2327f4c |     
   mipsel    |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/28938c2bd6a4783db131a43ce1c79b71669eaac6 |     
    mips     |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/ac0f4564d9bd3121cccd36649ed27c00fe984951 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/8975fe0d10cd15024ff0e4897d0632dd1dd1fe5e |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4cf3a920404dedc729ded202f203c1086412881a |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/f73f1a8e8fd0b6e053a66de3a6364804d682f8c8 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c45ae79d291f562ad96ffa25f6fcc12e040e5bd2 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/5da390a1c5cdd44fda576cd8a79e067844648fec |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/18b6a81bb3c5e85a4a2e62023e8e5df361a9a257 |     
  sparc64    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/de3b1e97796f717eac47d291911e3e1517cb557b | ORPH
   xtensa    |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/32d1f8dc1c8d1c81deecf645bc0455b14b694ef6 |     
   sparc     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/57f13f14f3b8590af9d9529c14d3344dc129a2f5 | ORPH
   sparc     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/5a1a8a5dcce92567cbc8c943f46637f1acd68b14 | ORPH
    or1k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/83ff578f515086fa5cce9acaefd479b6714b34c5 | ORPH
   x86_64    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/6a7e90f8e8936f65f8c7b40afac67da2ad9db918 | ORPH
   mips64    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/bec994c06ef5648118936097e9a1045ee4ebdd45 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/b96719be7ef33b6e67c132c6e13f2272ec5cd18a | ORPH
    i686     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/ea50ae7ec1530bc247c298f167b06b28226087d9 | ORPH
   xtensa    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/793dd3f837343a27f2950f6ba169505fe3482147 | ORPH
    arc      |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/f2da690a0bc5bcefa6e93e3ab636b493e2b7572e | ORPH
 microblaze  |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/bd3433a2fa80b5a0916f357e0fa6159d6422a639 | ORPH
    or1k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/2442e4692392aa35035e1469e3acb3a87de3c378 | ORPH
    m68k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/3c134754c4dc24a33c04fc0b0eed3adba2e9610a | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/4cd27f2d03173e4944dcc9d4723999053dbcd4c2 | ORPH
    m68k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/dae63f519bcdce46fb5edf9575b88d4dcd1277b8 | ORPH
   mipsel    |        libsecret-0.20.5        | NOK | http://autobuild.buildroot.net/results/890a67a0e0ee59f107b2ac14918614da65ecc8f7 | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/392f595dcb0b0b4cde7051b3c2da0c51d9ce5971 |     
    arm      |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/a2d9241cf54ca80a373f1e961c2a9d840aafc72b | ORPH
powerpc64le  |         linux-headers          | NOK | http://autobuild.buildroot.net/results/79da95f2d3737f166bea615f0ef986a756bca1ef | ORPH
  mips64el   |         linux-headers          | NOK | http://autobuild.buildroot.net/results/539243a3c69342e50a94b7ec321c1cde765b64a4 | ORPH
    arm      |         linux-headers          | NOK | http://autobuild.buildroot.net/results/673e3ac3ee3629d8ed815c1e8a982e2081b2e7e5 | ORPH
    m68k     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/e05da1da5088bb6bbb9990b1f93b0aaa7f5e614b | ORPH
    mips     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/3f567a25d254b0191bd77e3f3a28d703bb64dc3e | ORPH
    or1k     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/2982d85eee6a6c30924d80190a7e3c0b3be5113f | ORPH
   xtensa    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/be6e30e17c17c7b2effd1493b234fdcb75c603e7 | ORPH
    arc      |         linux-headers          | NOK | http://autobuild.buildroot.net/results/080202036ecb1a98e3c35b368949c10e277e64f8 | ORPH
   mipsel    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/464f12fc3421a9fb17edc55edd419ec86d175fd4 | ORPH
   x86_64    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/31186b77ba8d779d0ca00af255075b011027ee23 | ORPH
    mips     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/70d79037b71aa5a0175a1e45a5c0762438c61231 | ORPH
microblazeel |         linux-headers          | NOK | http://autobuild.buildroot.net/results/f037d34b4a7c2dda8d5120722517ba0f016f9284 | ORPH
 microblaze  |         linux-headers          | NOK | http://autobuild.buildroot.net/results/b3196af1fd3436b942de8c16663669b8d73d29d7 | ORPH
   mips64    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/838661da6622b36ae254748ae021c9e6da15ebf0 | ORPH
  powerpc    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/f3a60de0c55eb2424a6372d4d22a3019118583ce | ORPH
    or1k     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/7d9b0ab594e98405458a1c17be922a76c510b5b7 | ORPH
   arceb     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/cab88c81f438bafcecf7e8ca5c4832db4c3b90d8 | ORPH
   x86_64    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/ed1dcad2c20d0aa5ad2be3b3829132969c8f0113 | ORPH
    or1k     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/dd15777c03cdc4a0154bd85049af2609962e8195 | ORPH
    arm      |         linux-headers          | NOK | http://autobuild.buildroot.net/results/f5c36377360740eb8a1ff6c8c011ba64713f9e55 | ORPH
 microblaze  |         linux-headers          | NOK | http://autobuild.buildroot.net/results/2cf3e9c5983402f21b4afbc0374116c263cfd91a | ORPH
    m68k     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/69ba6720fe32ca4290cffb6700a783f9092c7ac2 | ORPH
   mips64    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/a34b52645155786a02f3bd9fd67ce5394380a4f7 | ORPH
   xtensa    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/35c35ec7f63f2ea9748645bc96459b70da04aae1 | ORPH
    i586     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/7c00e45517083a65d1c4fdf75dafbdd63770a347 | ORPH
 microblaze  |         linux-headers          | NOK | http://autobuild.buildroot.net/results/e2175b1672540668bd8a008dda5577042231ac67 | ORPH
   s390x     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/70390475c4073c56e4cde051eff0474cc433203d | ORPH
   x86_64    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/e5d4318c7ccccfa94fd916788a611ac56e21c792 | ORPH
    arc      |         linux-headers          | NOK | http://autobuild.buildroot.net/results/8bde93d2d2d160fa1a0ef724dc6d99ba454a8c6d | ORPH
  sparc64    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/0167300f5e55acce1d55661b91c765020f4bc455 | ORPH
    m68k     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/6d065a32fd3a8c30f744b3e16b6e0cee09264fe5 | ORPH
  powerpc    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/117c08e414776202446a9fdb96d084aa3c16af48 | ORPH
   nios2     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/07982405be231fff697de67d50470a121bf0408d | ORPH
  aarch64    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/898ddaddeeb443bcd82751c9c357be66cd75da90 | ORPH
   mipsel    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/9e2b54b3c3c324e78556c348cda8b167f7152410 | ORPH
    arm      |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/d37920e88ae64a9b20e6fcbb5409857a16716834 | ORPH
    m68k     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/663e661f1271b2cf7e71165b3e455b6a973622ec | ORPH
   arceb     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/add383aa8c568e40c066fb827b2bf88dc157007c | ORPH
 powerpc64   |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/103b3defe0ceaaee05bb7e66b5d49c75b2adaca5 | ORPH
  sparc64    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/bdeee9e005ee5a033656e28105ebefd9d15d1224 | ORPH
 powerpc64   |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/e802d96f24fc023b2ce0ed720b681a8ba93b047f | ORPH
 powerpc64   |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/6ddf674c54942243d2f415f2639bf1aa0d3b2d09 | ORPH
   sparc     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/c5b7a96d62ead11751ceeaf011111a9be868ffbb | ORPH
    or1k     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/cf29526cd3fa20a00738f9aefccbce3eb73ad7a0 | ORPH
 powerpc64   |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/04fc1209ca69b080ff534f0c6e921ffc1f196a07 | ORPH
    mips     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/3bb26d656a639e65e18ff6a44ec1fec43215d147 | ORPH
  riscv32    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/29822f351289c59bcfb2b9ec2125e589996b543e | ORPH
   arceb     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/d100677bd2ecc99f06728b1326364ca72fe66247 | ORPH
   s390x     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/77404453d35031c872e9823ede2063966c4435ea | ORPH
   xtensa    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/34ac8b06e765ec6534c10390bca956a06fd53fbf | ORPH
  sparc64    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/123299c24298f433233575699e23527d0920082a | ORPH
microblazeel |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/dd8a760df103c770aa5ac08b76b2ce4eb373d928 | ORPH
 powerpc64   |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/72ca69cf8388b979ab7b90194bedf8bfa80c7e7a | ORPH
  powerpc    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/91ffe4a6e15c5db295a28a8f81dd2dcb493582a3 | ORPH
    mips     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/a1d548c7962b09ddbaadd0407be4803103c48175 | ORPH
  sparc64    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/ab25569956ff205c21a0be9d6a319833ed014f7c | ORPH
   sparc     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/046699580b10bd45f7838d1348c1866c4c200bd2 | ORPH
   sparc     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/3760a7503056152fb60d86b096d2bd02aa3c0925 | ORPH
    or1k     |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/abbad243e94dfbf947a56f5626f2d5a62c627092 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/e6280e300c3d0c529bd3837878ac3e5a17df5543 |     
   sparc     |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/c20286be4d75d77ee5ec6a4031a6b4b636ef10e2 |     
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/673fe08821cc7289524193e0a0caabf42757ae64 |     
 microblaze  |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/2002004505f6447d1cb89246c211a1042d46132a |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ea438067973a1743ab72e3d5968115b58ad5ce58 |     
  aarch64    |           mpd-0.23.6           | NOK | http://autobuild.buildroot.net/results/527ee199813abbacd61c3fa32b517ea60af60659 |     
   xtensa    |            nbd-3.24            | NOK | http://autobuild.buildroot.net/results/3264ea563a178765f09ec774a02973839ff063cd |     
microblazeel |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/b9b764caed95375957c684df54c882af964d1fac |     
 aarch64_be  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/47157a7a1e48f9d52df423e232267e736e158424 |     
   s390x     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/cde158600d70d208517a4f05a9424979f2778b1c | ORPH
microblazeel |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/45d762bc423d6d50baa2cfe31269011af3fb8d70 | ORPH
  sparc64    |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/83f75ce9fa190e31b1719d95733e7bcbf0f038df | ORPH
   xtensa    |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/641a501b67fc15a59bfb7d8a0214371e86e9c2f7 | ORPH
powerpc64le  |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/219e624fb935ad6bed44c6a92a63b519307927fa | ORPH
   nios2     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/93c15e8ea8409844ebdb27c5228fbe31e2f66dbd | ORPH
microblazeel |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/e541b8aaaa9814f794aa7595c2ebbd286a37d0cb | ORPH
   xtensa    |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/f8bbb9249268a070093f3176b9bd4b643fc837ac | ORPH
    arm      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/1c32be0775fab73c78620278d9c522203569b99a | ORPH
   xtensa    |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/d9c248a7487fd487c72f2d2fb498adc0d508c9af | ORPH
    m68k     |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/31048466a486bc6d8d15884b5d4b998606ab2c32 | ORPH
    arm      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/79363526ad787cfa829d5071969b86d03c6ea634 | ORPH
   x86_64    |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/d7f486a213b35f1535e016974ab5a811d34d3240 | ORPH
    sh4      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/f3a3a094034b5506dd607d7c8f4e372db6be646d | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/37d84ffdac86ee45f0a2ac8413b9a15b76e4a94f |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3d9e736a3c2f3eea5138e737759dda0266f88228 |     
   arceb     |        pipewire-0.3.48         | NOK | http://autobuild.buildroot.net/results/6019f4e9676743685e8af81d60ef198c1eba1fde |     
   sh4aeb    |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9e9ba93320749292f743b7581af4a73bafc906a1 |     
   s390x     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/722d83d5d98b38f2a154f94a28403cb5664a16bb |     
  riscv32    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/59f4125a5f9e7adbe73adf95536f8e5e6532a764 |     
   s390x     |        pure-ftpd-1.0.50        | NOK | http://autobuild.buildroot.net/results/cb807663510a3c658e70f1a4c24784ec40a0e552 |     
  riscv32    |      python-brotli-1.0.9       | NOK | http://autobuild.buildroot.net/results/dc17eb4c447353bb4c21f22f2d562e9ef3f16aa5 |     
  powerpc    |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/b11600bdba42be9b211163e92afa3173276c3f8f |     
  mips64el   |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/d068fa60982e8903565a3d9e99a486d0c36c88c6 |     
 powerpc64   |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/377a3c32f1272c8f1bba30b15a1608cd1d413f00 |     
 powerpc64   |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/c457a79fd764e152cc209064569592dda4d19e58 |     
 microblaze  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/95c8e7d1656a0256213a3b7fda4ffd2a0f6f401c |     
   x86_64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/8310138563c1ad3ad52cb6b33c1cc6acd7766252 |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/1b270dd3dbf62fd989a02a2fbe0bc3b234ef2b2e |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/dfe47fdd594bad248eecf16ed7075563ca049815 |     
   x86_64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/7db854c40b1fd4b69480fe0927b217d3dcefa995 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/d1d2ca05f97ebafcad4d8e9e0e56642527d69b13 |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/696100891ece88b54a2a281817245384052743a7 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/8e3e46b8d5b163a1b736e36a5458f74bb2f82f3f |     
   armeb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c34c1a0e37f2e40a7ab67fc8de3d9152c158b74c |     
    arm      |         safeclib-3.7.1         | NOK | http://autobuild.buildroot.net/results/3f26840b27ca666f963833919fbf08c8c5041cac |     
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/4524430db6503a0117911ecab5ab520b6b4e2e1a |     
   x86_64    |          spice-0.15.0          | NOK | http://autobuild.buildroot.net/results/3db7a9887ddae8a0ad6aaabd8dd54ea96c8f9385 |     
 microblaze  |        spidev_test-5.8         | NOK | http://autobuild.buildroot.net/results/a5c008aaff40f4851ffa36439c7340b6243a4842 | ORPH
   nios2     |    startup-notification-0.9    | NOK | http://autobuild.buildroot.net/results/9ca13e761ec591c7cdca82add560879e38677f2b | ORPH
microblazeel |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/e3293fb1106ad5ddc6ca77ada78bc65298888a4e |     
 microblaze  |          stunnel-5.60          | NOK | http://autobuild.buildroot.net/results/939e1e5f4be7dbfb48a84d7b8373c93e93abf251 |     
   mips64    |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/e84c8494149da42acb5d149ee3d06319836010bb | ORPH
  sparc64    |        tpm2-abrmd-2.3.3        | NOK | http://autobuild.buildroot.net/results/b56725abd8652103b7a0a2b146899308391708e7 | ORPH
    i586     |       tpm2-pkcs11-1.7.0        | NOK | http://autobuild.buildroot.net/results/752509ecd0497984cd44bfe3cea5a1c1276417ed |     
 microblaze  |       tpm2-pkcs11-1.7.0        | NOK | http://autobuild.buildroot.net/results/aaedb264a68918428ad805e748188c0073fbfac1 |     
 powerpc64   |       tpm2-pkcs11-1.7.0        | NOK | http://autobuild.buildroot.net/results/dd4e7a0e048104d7d968f3d4b053f707530c198a |     
  aarch64    |         tpm2-tools-5.2         | NOK | http://autobuild.buildroot.net/results/fa77515df1986882dbb96dd37a7b9045bd4e4ada | ORPH
  aarch64    |         tpm2-tools-5.2         | NOK | http://autobuild.buildroot.net/results/799413a002ed1241bc95b88e9275e9dfbf89774a | ORPH
    arm      |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/9dbd3f6282d5681e9fe51843b010b786bcae9140 | ORPH
    or1k     |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/cae6cb9b88aa35de80394f5d9f97380a3016fdd5 | ORPH
  powerpc    |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/d232b584f93837509b36fc29e1526240305d0dbd | ORPH
    or1k     |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/52d19da5e157f3eb24557d9f64118c7dcd5f07ea | ORPH
    arc      |         tpm2-tss-3.2.0         | NOK | http://autobuild.buildroot.net/results/2d43f0b90a808ab54196ba0bfc11f37d60c75043 | ORPH
    i586     |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/9a88aaf92760b34958ef5b1708de83e46ccdb587 |     
    arc      |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/3589c08d56f22785ab5d0891ddb21996b1d50adb |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e8306c4577d216bb1b13df483bc6bafb872d5ab4 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9366f61105bb208327b752e1939e07bce817e67a |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4d66e80f4ca74fc2905ec92fd91aef804e682def |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8b63ae3640920ad8303ab2b0f78f3a2a76618212 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/609373d42602c33200a61a9c303d8477adeb2832 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/a90b0bb9c7966ea290a2aa9b53e3fe4cf444bd6b |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/caa403ad1feb20731e55ec4262d18d8ff206836f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/02ddb8ab91419f37c8eceb27173463b21f1a21c9 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/67f51bfe12f672e296fb9ad46c7538fa98a1abc8 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8d6d5ae2fcecddd62fa2c22159b37153b62e13df |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/00e8786140baf96a4f7fdcbad9bce7767cdda7bf |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2859bf712214baec0175deb1e1c4ca10156d6f85 |     
   s390x     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/f51b0e7eafd0c21ce09a9faddd3e996233246ad3 |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/795117fca796d4cc1d0dd14dd55b11e87cce2852 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fae4a9755093aa97ccf5662a917e6aa46b8023f0 |     
   nios2     |        wireshark-3.4.12        | NOK | http://autobuild.buildroot.net/results/de91f080966851e82a20fe0842a25bad934e9b92 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d57cdffc28201948d85b54ac789776f58cb6b0db | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9234be48d389ed74ad0db2f4ec594b0b9f39e34e | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/35d4ca3881c3db42de9f73a2f0a92f7d43c62839 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0460845d361472b44cb27459977be7ea47d3aadf | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 linux-headers | 6 
            host-binutils-2.32 | 5 
host-elf2flt-7e33f28df198c4... | 5 
          linux-headers-custom | 4 
                    git-2.30.2 | 3 
          host-gcc-final-9.4.0 | 3 
           host-cloop-3.14.1.2 | 2 
         host-gcc-final-10.3.0 | 2 
             libopenssl-1.1.1n | 2 
                minizip-2.10.6 | 2 
           python-pybind-2.6.1 | 2 
           argp-standalone-1.3 | 1 
                  bind-9.11.36 | 1 
              bubblewrap-0.4.1 | 1 
fs/f2fs/f2fs.mk:62: /nvmeda... | 1 
fs/ubifs/ubifs.mk:47: /nvme... | 1 
                  gensio-2.2.3 | 1 
glibc-2.32-50-g737efa27fca5... | 1 
                     gmp-6.2.1 | 1 
                   gvfs-1.44.1 | 1 
              host-audit-2.8.5 | 1 
            host-diffutils-3.7 | 1 
host-gcc-final-48152afb96c5... | 1 
host-gcc-initial-48152afb96... | 1 
               host-go-1.16.15 | 1 
                     host-llvm | 1 
        host-sentry-cli-1.57.0 | 1 
               libgcrypt-1.9.4 | 1 
                libkrb5-1.18.4 | 1 
                 libnss-3.68.1 | 1 
                 libp11-0.4.11 | 1 
              libudfread-1.1.1 | 1 
                lmbench-3.0-a9 | 1 
monkey-f54856ce250c4e257354... | 1 
                  netsurf-3.10 | 1 
                numactl-2.0.14 | 1 
                 openal-1.20.1 | 1 
                 openvpn-2.5.6 | 1 
                 pixman-0.40.0 | 1 
                rocksdb-6.13.3 | 1 
                 uclibc-1.0.39 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
                  zeromq-4.3.4 | 1 
              zlib-ng-1.9.9-b1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2b18c128d9954d1d82c70819a3b00dcc28507d6d |     
    or1k     |          bind-9.11.36          | NOK | http://autobuild.buildroot.net/results/f66c92557cb4f379e1dd7cb7e1d880badc65c935 | ORPH
   s390x     |        bubblewrap-0.4.1        | NOK | http://autobuild.buildroot.net/results/29da2544789fe3a2743befd298cc7e0dd2c38e3e |     
   s390x     | fs/f2fs/f2fs.mk:62: /nvmeda... | NOK | http://autobuild.buildroot.net/results/4ed55024b225ea7f86aead221301659314bf5ef5 |     
 powerpc64   | fs/ubifs/ubifs.mk:47: /nvme... | NOK | http://autobuild.buildroot.net/results/fd5968312772ce3e5564d9f513456de27c4df962 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/19b24b842ee7f592c00ffe7163690eb80f283ff9 |     
    m68k     |           git-2.30.2           | NOK | http://autobuild.buildroot.net/results/73705c4b7926600c4cc7cd4e3b7dc7a75d3438ac |     
   xtensa    |           git-2.30.2           | NOK | http://autobuild.buildroot.net/results/82b97fb707c468e311c8ec222aa6ed2daa459f9e |     
   sparc     |           git-2.30.2           | NOK | http://autobuild.buildroot.net/results/3c5b32717cc177231b656e3c2b52f9bf50e4d7fc |     
  powerpc    | glibc-2.32-50-g737efa27fca5... | NOK | http://autobuild.buildroot.net/results/6616772dd54922fbc325a463c60aec3af01268da |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/2dbe5cf13eabaf22500c6cf9d0206375526ee651 | ORPH
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/47acf225cdb19b9d6191c3f452d0c3b8feb7ccbc | ORPH
microblazeel |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/04dc08ed661b5531cf23f1ec6c0e91064b9532e8 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a1a2e42c7c00280ea0387de51e9bc840929bef8c |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/43276dbe70729a999a0550e728b47570272e9e1d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7c43259ae77e8c6e44d414b79b83b13080ba38e1 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/93f8ac5f80fd835066a9fc99df33bca97b6e95fa |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0ce10d424fbb98bd7efb1e8efcc846d1fd5e31fb |     
   mips64    |      host-cloop-3.14.1.2       | NOK | http://autobuild.buildroot.net/results/b4d0b7d1bb00324617eccf8d6981e3cfd9e8eaa6 |     
   x86_64    |      host-cloop-3.14.1.2       | NOK | http://autobuild.buildroot.net/results/af65fdc6b351cb17ea8d7b6b46629df143859568 |     
   nios2     |       host-diffutils-3.7       | NOK | http://autobuild.buildroot.net/results/b3ce5cec5f4017d4c0c8033490f1b62ca7beaf83 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/70133cc6c059b0a7ecef366e44b317b77e172a46 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/ab9cf22c24408c958ba75047ca52fd7c6cc7557c | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/ba23050aa1c87616adee627b066fa660773c567a | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/092922705a62c19d78bf5225ab6f99ce7791255f | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/dae70416f4490cd518327d701696df30ce25eb8f | ORPH
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2b6bfda1ee977eaadf2c8e5eb5c45dc2bceaa811 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/35033cc0903c2be76a5ce91a80904d41366b482a |     
    csky     | host-gcc-final-48152afb96c5... | NOK | http://autobuild.buildroot.net/results/6cc9ae6785e6ec47cc7ec40b8ac3aab34856e877 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/2267e7e7e60ab57d993316c9baa69c75d1b58f94 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/18685773dc0fce741cc83fc697a3240e73341360 |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/3f5d9a484a01820f787c7e4ab5ea5c10c2474930 |     
    csky     | host-gcc-initial-48152afb96... | NOK | http://autobuild.buildroot.net/results/46846aa855c5b951ecddcf24c0676eec8288ed8c |     
   mips64    |        host-go-1.16.15         | NOK | http://autobuild.buildroot.net/results/4e7650f6f0f08cd8e02095bcf69019fbc871ebb8 |     
   x86_64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/92e47e7ece9a65a67511af51478d785b77173dac |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/62bea34f5651e69c07791e82209931ea8b9c0865 |     
 powerpc64   |        libgcrypt-1.9.4         | NOK | http://autobuild.buildroot.net/results/29b6ebe052eefa1593bfd856589b8a37f9b2e7e0 | ORPH
  mips64el   |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/619de194848fe5e61aed80fed93e5e83da1dde6d |     
  powerpc    |         libnss-3.68.1          | NOK | http://autobuild.buildroot.net/results/01f01654e284025a94140800d045a3a3e3416b52 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9f57328258006e51f4e12f5681288d92b0ac30ac |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/2e18899bfe12fd2565af6666222e11b5c8517991 |     
    or1k     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/066175e725e16ca2e050a7f2e3200bc58caff227 | ORPH
    m68k     |        libudfread-1.1.1        | NOK | http://autobuild.buildroot.net/results/8cda24ca0edaaab048fabb1675fe4fd788fed370 |     
  riscv64    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/fe5159e0261974ea1afea74f0884582ed4f7c58b | ORPH
    or1k     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/33267aaa41ddaa2b9c3a2beea986afae33f82563 | ORPH
   nios2     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/e378145cbeb4599f62a36b1a67a57aaf0975f2fc | ORPH
    m68k     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/879c0158e529ded628f28d181be2bd1fd21aaf28 | ORPH
   s390x     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/d4da389299ffc3ee850b568a3696a39b76777a9c | ORPH
powerpc64le  |         linux-headers          | NOK | http://autobuild.buildroot.net/results/cd5c460aecf44052f23b2407f3fe265065eaef89 | ORPH
   xtensa    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/a534c1e32ecbbdfa5ecb0f06a0c9290ca0a1a291 | ORPH
    arm      |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/d2d49b653625e3d2f1ef32883cb0b81029721b8e | ORPH
   mips64    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/2b65c00fa4dffdd15d8eaabe5a2c89233e792a0d | ORPH
 microblaze  |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/7d90510e54b5093d142ad9be21d7770714c15762 | ORPH
 microblaze  |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/78746e0b1ee5cac07d3863164f293f0d1b93fc36 | ORPH
    mips     |         minizip-2.10.6         | NOK | http://autobuild.buildroot.net/results/81abedc0ee0897910c3f44231c22cde54098831a |     
  riscv64    |         minizip-2.10.6         | NOK | http://autobuild.buildroot.net/results/c3fcb936e406eaa0cb857c16b506d437d1250f70 |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/3402d37c08bf8ac19db4f2fc75eaeb6a99e36587 |     
    sh4      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/03b8024481bb241cbe7e86eb2dc23abe362ebbc4 |     
microblazeel |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/42a4923b131e2ae37596e8a72710f01d80ae918b |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/f84ba3280227d143a0d933a83e9a1e4d86c57c48 |     
   nios2     |         openvpn-2.5.6          | NOK | http://autobuild.buildroot.net/results/12fa3921ccbecefc83a0c1401385685d41c6b851 | ORPH
   mips64    |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/437a689ed8f4814d70cf0d92c765dcb3f9ccb13f |     
    i586     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/0e06830273bd90e04c30aaff3ae9377cf4d19359 |     
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/d46684b015e49a27f1cdd3d9fd6a0abdf87b66a3 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9ce7ad945f6105a318067a095805848565674c65 |     
   xtensa    |         uclibc-1.0.39          | NOK | http://autobuild.buildroot.net/results/653585de6107dfb48b19893a71364ccc6ff64ce0 |     
  sparc64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/b35d7dd398459e27ed67cd03a04c96382834e76c |     
 microblaze  |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/b7fa664773af9318087989f0ab6e2efe7cb6ea09 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2ed64df556f440131dc8432f2576d95c199614cc |     
    arm      |        zlib-ng-1.9.9-b1        | NOK | http://autobuild.buildroot.net/results/f07367eca47dc41ce098382c27f5de05b8453e58 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            host-binutils-2.32 | 8 
         host-gcc-final-10.3.0 | 6 
                 linux-headers | 5 
          linux-headers-custom | 5 
           argp-standalone-1.3 | 3 
glibc-2.34-109-gd64b08d5ba7... | 3 
         host-gcc-final-11.2.0 | 3 
                 uclibc-1.0.40 | 3 
                       unknown | 3 
                    git-2.31.1 | 2 
           host-cloop-3.14.1.3 | 2 
             libopenssl-1.1.1n | 2 
                    belr-4.4.8 | 1 
                 dhcp-4.4.2-P1 | 1 
                  exempi-2.6.1 | 1 
                    flac-1.3.4 | 1 
                       frr-8.1 | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
google-breakpad-7515ab13768... | 1 
host-elf2flt-7e33f28df198c4... | 1 
                   host-nodejs | 1 
             host-pango-1.50.5 | 1 
           intel-gmmlib-22.0.2 | 1 
               libcap-ng-0.8.2 | 1 
                  libest-3.2.0 | 1 
              libeXosip2-5.3.0 | 1 
              libostree-2022.1 | 1 
                libressl-3.4.3 | 1 
                     lz4-1.9.3 | 1 
                  mender-3.1.0 | 1 
                 minizip-3.0.4 | 1 
                nodejs-14.18.3 | 1 
                 opencv4-4.5.5 | 1 
               openpgm-5-3-128 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    opus-1.3.1 | 1 
               pcsc-lite-1.9.5 | 1 
                python3-3.10.2 | 1 
                     shim-15.4 | 1 
                 thrift-0.14.1 | 1 
uclibc-ng-test-0844445e7358... | 1 
                    vde2-2.3.2 | 1 
                    vlc-3.0.16 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/c4d09054f9599a0375629666fabf6b8ad0c7221c |     
   x86_64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/df94dd30e9b9bdb4b90b9339435ec281bef7c247 |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/b1e0c6b118ef6938c2a180ed464396027b003c1f |     
   x86_64    |           belr-4.4.8           | NOK | http://autobuild.buildroot.net/results/81abd166bf80940f0ed2dceab356ab0d48901960 |     
powerpc64le  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/f45f6f779b6403d863f7e6915ce5147dca87711c | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/42ed726b3eceac412cb7cb5e600f73f3191346dd |     
 powerpc64   |           flac-1.3.4           | NOK | http://autobuild.buildroot.net/results/646bf1d56eccff9ff8a3a4d1a608a43afca3679a |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/5b4040c196c7095a04e25384527cc15543a78380 |     
   xtensa    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/77c0c343e32e2d6b2dc5f745a538b730ba751ac7 |     
    or1k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/afc76eb7c1f8b3851e1bd18de58b53052f0860f3 |     
   arceb     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/f27d2666e3a41d43be3591bcd4540d3011a61379 |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/f42b6dd21dd223acd46bfb57647277992d8c2eb6 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/30abaca223ad9ed7a274cf80c7f6aa5e1b742901 |     
 powerpc64   | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/ed084af3a7e9e6c5e93c69d31896586bb7ce3456 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/d14a14df8c9bfdb5fe06c902fc4c0a865d830a74 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8d7b7676170cad0d3df4b048bb4bcc69ee0dd6bc |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f1ffb09f327910519d841f79dd00a9e8ce772153 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c57985ba4f310ecd9a151af834d47bb2e0b0bd36 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/11e85e60b5eb617237598fd2ba97f288fed2e5a2 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/14e4a8d7f09d1f47d997b86ae38e3ba83459ee53 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/77003e3a8702f6ab03f375424f8416f0a0803ee9 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1fa663fb89551422a6346aabae154ab6cdc543d8 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/849cba46ef37ddcedb41b774b8f7ba79c2094712 |     
   s390x     |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/b1b8bb3b8db82c8c2bbdc6364f63c39346b59f8e |     
 powerpc64   |      host-cloop-3.14.1.3       | NOK | http://autobuild.buildroot.net/results/651a74f54a12d8dac98ef97d03cdfb6e9e965248 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/7f68c31b1639753c2060e50dd465316a1e79bc6e | ORPH
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b7bdbf5fae218e6648c475d59f4706f4c56219c7 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/25754ebf46b7f6fc1be6e1e8ec24505b737047b4 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bbb4fd38b7eac62fd3fa8ec41a4339cc9e3ee495 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7617ca3bfe8e92998b93767b6f3db4cdb08f0d99 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a417519405e0e6259472aa0fd2e229f0142c2ca4 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fe8ddea122ade6c9cde0dc786e4faf922a861857 |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/a538c82fe73d1c68b1de0b8082c9a100bc6a3902 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/0fb443fd8bba8894286f4355267096c79e3fc6d1 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/c277f3a1ea9aba6c5b61afdbde75d82ee5f23d4c |     
   xtensa    |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/0005524d40b9a9e9a00ace6c6e97b806ac20acf9 |     
microblazeel |       host-pango-1.50.5        | NOK | http://autobuild.buildroot.net/results/f743959847f91593de84ef240e27a42a1204de22 | ORPH
   x86_64    |      intel-gmmlib-22.0.2       | NOK | http://autobuild.buildroot.net/results/5c4508f06d51f5f7b850974978df036e8688ebfc |     
  riscv64    |        libcap-ng-0.8.2         | NOK | http://autobuild.buildroot.net/results/c4dc80a5be8df4b51c5f8cf2ba90c1617f26c633 |     
powerpc64le  |          libest-3.2.0          | NOK | http://autobuild.buildroot.net/results/0dd755effbdddfa1b578fec9f1b1c9366b6822bc |     
 microblaze  |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/543acfb20a7a64c946be83963b6a60d29510a06f |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4ec21460a032c2a7cf929566a36974707a1f7d45 |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9f431d2cc1a7567a05b158860c76db5ecf5f4e6b |     
   nios2     |        libostree-2022.1        | NOK | http://autobuild.buildroot.net/results/393441490bca0979d609815dba03d2f2110fac60 |     
  mips64el   |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/dd568fd2ad1cf3899ac52ec223c7305be8864306 | ORPH
powerpc64le  |         linux-headers          | NOK | http://autobuild.buildroot.net/results/2055a4453d9a78925578d0a315740e4378fb176f | ORPH
  sparc64    |         linux-headers          | NOK | http://autobuild.buildroot.net/results/623b79fa31ccf63c6e8d6d0fc8178633feeb7c86 | ORPH
    mips     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/52ff9310979dbfa7439615c7026e3978632bf231 | ORPH
    i586     |         linux-headers          | NOK | http://autobuild.buildroot.net/results/f229979a99415d7c2f4f696b2631b1c40f656299 | ORPH
 microblaze  |         linux-headers          | NOK | http://autobuild.buildroot.net/results/d0923bdddcde2b2b1945a3a85a52b083ae3eaa4d | ORPH
microblazeel |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/582241bfdff2eeb0825ac198806942448cbdbc4d | ORPH
   mips64    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/a9421068ef06caf5ec27f431c6e73e80b539c9bc | ORPH
 powerpc64   |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/da83525615441cc52fe8577674867eaf3e52cd25 | ORPH
   mipsel    |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/9207fbdb61ebe7a2f71c90e051f9d01782e19bf3 | ORPH
 microblaze  |      linux-headers-custom      | NOK | http://autobuild.buildroot.net/results/b86c66e53eecfb5f70a02dd5f1a51fce2dd38f46 | ORPH
 microblaze  |           lz4-1.9.3            | NOK | http://autobuild.buildroot.net/results/e33b35e19256353d08ba989708ff842b724ab0f0 | ORPH
   x86_64    |          mender-3.1.0          | NOK | http://autobuild.buildroot.net/results/621c057c0b8b627c8140456a2b0af4f95d239dcc |     
microblazeel |         minizip-3.0.4          | NOK | http://autobuild.buildroot.net/results/b9cf0e57553bba93245dff9117869efb159f57d4 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/a1fad2cd4427f501008a7e98f2a616bb31fac46a |     
   xtensa    |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/58b4ba4c8b6b4e127763f7f6fd4d87a60131419a |     
  mips64el   |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/c363d49bb01b33164058b013bbb390379d26e619 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/738e75edafb4da159847d30d736132837cf7f6bc |     
    mips     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/28fa52672b84a2e5e7eb073e56bea41156bc08b3 | ORPH
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/ceb8f41b9dcef35329ab221365233404de4d2348 | ORPH
microblazeel |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/f6c0c7fd345f919cc3c41019b255f11d78c8756c |     
  mips64el   |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/3f71fd1919f5ce7972c1f3ff85a7930074b4f9d4 |     
   nios2     |         thrift-0.14.1          | NOK | http://autobuild.buildroot.net/results/9aa5d9ccd92cb8073b91107f5f917e9440dac374 | ORPH
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b018b52a7748c010ee900977a64d42e171843ff5 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1280a884e5922b022950905e40b00ebb32e443f5 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/5fa3a9691d63aa6ee0bfdf4e27a0dd3620cc3ddc |     
   mips64    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/9a10496be1a9d4e1e68f313cb3058f040a11f819 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/89b207e2c1bc8924e27d6f27b3ae670e65c0a182 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c06d57b57c9d7867e3fb7fedd8b5ab39872af285 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3d3fc40d1298672da1d1877aaf55aefa92c46218 |     
microblazeel |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/360aeae32b874cbdc009864e9d7a4cf998eb2151 |     
    arc      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/22290f70a45fc69b5bfdd2a9f78785b9b76e72ef |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0c36503a49ff237b59adc48ea6d230746b0f5d16 | ORPH


Gitlab CI results for 2022-04-04
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2286618413  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2286618451  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/2286618473  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/2286618483  | ORPH 
              TestPython3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2286618506  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2286618513  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/2286618517  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
