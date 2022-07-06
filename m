Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63FDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 05:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F03CC80BCD;
	Wed,  6 Jul 2022 05:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F03CC80BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJ3stUJR-rW9; Wed,  6 Jul 2022 05:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E9880D8C;
	Wed,  6 Jul 2022 05:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E9880D8C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F40E51BF83C
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 05:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D958417E6
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 05:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D958417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5oVpe5V4-aJy for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 05:44:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D499A417DF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D499A417DF
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 05:44:53 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7D27140002
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 05:44:50 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 06 Jul 2022 05:44:50 -0000
Message-Id: <20220706054457.9D958417E6@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1657086290; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fVqm6WvuMv0A2rAftEJl0IH3oifi/pw/TANGlRQcPBs=;
 b=gB2zst4JMMRj2R0JpbMoe+nl6zKPZXdrczYg8KCN3q/xHtl0FX/3ZkRF6xnFnmn9rXrNR1
 32fdK7XMCGll+1Y5VoCzLGck+klFPth4e0gqGW2BmhOD6G+sAozSKUDBh/AAw4OJL1XKX/
 rPLFDfC2H+Qc5vAyCiXSKpqV3XJQORFhKgvoKJtlVyF0BEsvrUsGEWDqLAjXmgNNeaAvyU
 3sEsoVkkNj+FNjdsmCmsYVyIBopKvso4Hq5HkAhveDLQO6Cyd0J5M+dWVJzWc80lfICYIM
 HIiCe/CaA9UwAX38+SVyiUrBlq1WCEdtiHOZjQfrE3Sf+vWFkY7vAur/OBFZFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gB2zst4J
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-05
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

Autobuild statistics for 2022-07-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 16  |  6  |  1  | 23  |
  2022.05.x  | 35  | 20  |  0  | 55  |
    master   | 83  | 255 |  2  | 340 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-7.84.0 | 111
              alsa-utils-1.2.7 | 17
                       unknown | 14
                 uclibc-1.0.41 | 11
glibc-2.35-96-g2c4fc8e5ca74... | 6 
              host-rust-1.60.0 | 5 
                iptables-1.8.8 | 5 
                 zlib-ng-2.0.6 | 5 
             libopenssl-1.1.1p | 4 
                libressl-3.5.3 | 4 
                   speex-1.2.1 | 4 
                speexdsp-1.2.1 | 4 
         host-gcc-final-10.3.0 | 3 
          host-gcc-final-9.4.0 | 3 
                host-go-1.18.3 | 3 
host-pahole-73383b3a39afe86... | 3 
           libfreeimage-3.18.0 | 3 
                alsa-lib-1.2.7 | 2 
                bitcoin-0.21.2 | 2 
                busybox-1.35.0 | 2 
               gocryptfs-2.2.1 | 2 
host-spirv-llvm-translator-... | 2 
                    lame-3.100 | 2 
           linux-5.10.115-cip7 | 2 
                 linux-5.17.13 | 2 
               tcpreplay-4.4.1 | 2 
toolchain-external-codescap... | 2 
                   tor-0.4.7.8 | 2 
/home/buildroot/autobuild/i... | 1 
               belle-sip-4.4.8 | 1 
             bluez5_utils-5.64 | 1 
                  boost-1.79.0 | 1 
                 dash-0.5.11.5 | 1 
               erofs-utils-1.4 | 1 
                     frr-8.2.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
                      grep-3.7 | 1 
         host-gcc-final-11.3.0 | 1 
                     host-mono | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
               libbytesize-2.6 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
           libsamplerate-0.1.9 | 1 
           libwebsockets-4.3.1 | 1 
       linux-5.10.109-cip5-rt4 | 1 
                 mesa3d-21.3.8 | 1 
on2-8170-modules-73b08061d3... | 1 
                   perl-5.34.1 | 1 
          perl-net-ssleay-1.85 | 1 
                 pixman-0.40.0 | 1 
           powerpc-utils-1.3.8 | 1 
               protobuf-3.20.1 | 1 
                       sbc-1.5 | 1 
              swupdate-2022.05 | 1 
                 twolame-0.4.0 | 1 
uclibc-ng-test-0844445e7358... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/25b2da427cf3102e5ca00ab6d9007e5c3d765752 |     
    m68k     |         alsa-lib-1.2.7         | NOK | http://autobuild.buildroot.net/results/c8caf3995a92067a6f81d7f42b053fa273ac14d0 |     
    m68k     |         alsa-lib-1.2.7         | NOK | http://autobuild.buildroot.net/results/686a076288d1e229099266f4446cd71be540e447 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4920464cebf599eaa97a50f0cfac908d0583f427 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b049f2f5b5676be177a9821e9aed818e1e41f7ad |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/dc094ca60031a61ec0ce517271e4541ecb9a4605 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/530f092721e8dafbab6ed1efc775ea5f4a48df5d |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9bfc80d769218323dea85d3abf79414c67804b1c |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9e90eef8572618cafaaff955943a5a3d6179cff9 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f791dcbcf83198613d5cd7293beaa40e8760e3b1 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/10d2af3c7e5699b6a980eb0a47918a2ff23714c2 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/132d6b48d0049a60649c7ebfbd6624633515e33f |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2626554a3b3057fcfad50cfd6ed8ca3ecc3cf25b |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/fd9cf2dfd6c9484f946f35c016156d8f5b258332 |     
  riscv64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5fac0eab581d966bd23197ca67b159f964daca1a |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a5c4bea6370b45258d0600c09aa923ba80925020 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/53b88683bbd8232a8daa375603c788cc58f2948f |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a76c435da0ba3a5d5c91ff58af0f79ab966169ed |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4a5f483e844504fa5a6eba50fd3654b6cd123f3f |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4e15a8635c87d38291e6c83cb6d94778b0862e31 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/658a1f8945b1dffa5b7df159064b50da53abf0d5 |     
   x86_64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/247d0b19c114b39475ea53d56215b14253ae8dd7 |     
   s390x     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/e05024b17f0bbb89d1cd04b3652fbfc13bef2801 |     
    sh4      |       bluez5_utils-5.64        | NOK | http://autobuild.buildroot.net/results/38df08686983b63812ebed4a6296dbb0e6e41712 |     
   arceb     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/3dff6cfc1f04df79f28d2d241bb4aac33246eccd |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/cece5fd23d9e91f4fe32a2ea49ea2c63be120976 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/109c96be262099e58fe918a21a08cf907e70ef71 | ORPH
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d2eda9c01bd9f0f460f6d7b56627c2267ab1b9e9 | ORPH
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/8a44346b97680de968ee33a4f9a4a755ff6fb1dd |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/51f0154b11adbb58563f0042726144f170fcd7c0 |     
   nios2     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/780b83420879d8c0a657801e193d020154bd982f |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/82c0a93ce89bddfe8539c0cff1722dd5d795d6ea |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/1a8deee61fcf5664f62957a8976d94f0c1e39ecc |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/472d6e3082da051d08bd3e67ed7810a74bf72a55 |     
    mips     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/adca5f6a49e7d933572435616a2b966fdafde960 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/5b81292c174f2eaab8272692a4dcda02e380f524 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/2d24510118413e686ae4ba804ffdd0ccf6281e93 |     
    i686     |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/2dd1bd7fe132098b34b6476885889d8ea7f6a08a |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/e1758b169d8d665b4c2ea1d4749744bef44b54f6 |     
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/cb43a1613ede5418acd4415a2e237593601439ff |     
microblazeel |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f5165f4e2f224c0fb90a546bc9ed4760c4818c14 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/783720994d60d41e9ecc55036ff5e0772c98e1b2 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cc53af77b41bbe4f2721c5ad7d8964e65d6e991b |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3e1ffa89c1881384f68128bc2ebbf50d2581915a |     
    i686     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/15ac0a93609876dfc3d002470d6fd1176065e59b |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/5aa30a7269eb08aff540855e3f6179b5d09136df |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/64672052776179200c80a1de4676f77f2a6d2321 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/aaf27663d3c2ed73ddc56d59bf9f3c3b32dbc89a |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/856cedd149c77654cca8aa29108343a496cee265 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/125293d72fcd366e0c8961ae42a93798c1496ae1 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/6b9410ee737327f5faf6ce7db020d742b83b8a53 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6b130b809d4f7b4dc85f070da6af4dcd59132681 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/03ba4e92aed4c552cb7aa8438d348bdeff2d6b4d |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6261dd8aced8916d0894647e90cf13fda47c71cd |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/73bb007b3d34e95512eb0e88668125399ec97ab0 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/021105bf1cbcee3ca30184045c8bf445e794170f |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/bea0e51c238d72a704a9645f37fc58bfcd382faa |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/b20a361d0ea0ac06164794048e077f682a53dda3 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/df7c9e5fbdd505b8ac496a5b289163618ebda0b7 |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/73ae411590735e97197de5a37ab714846e5d50b5 | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/71552c7098166731b4e5630df17b85b3308c3484 | ORPH
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/f942e62808b08e57605576f552609ee80a90c099 |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/cff35a0d84bb8c37d76909bbfe8ca838e863d77c | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/5d0a9f84f3d6aabdf2d40b709dac7d37e946480c | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/6d47e0e2e23adc2799f04994b4604dcfa37dcaaf | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/702671c400cf9675381421883636cbfa95ba9606 | ORPH
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/934d00fe035cbf053f98aaf38a3139cb5dea1bce | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/f978641be5e7010494b5cb5d14919a928d6316ea |     
 aarch64_be  |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/b996d01f93588fa7cde520aa3e6f3ba6748e7b20 |     
   sparc     |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/36635ed30a97f8be924e4e95d5640ecacd9f3c3a |     
    arc      |        libbytesize-2.6         | NOK | http://autobuild.buildroot.net/results/11637229d2d1806d548e054a149828f1a6d6bae7 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/cca2fd08faf46ec1cae046def1fd216f4962d358 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/afccc9fe0e86aa2f7753243d6a5126ee59860692 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f41c776dcb14ff7994d46eeb107279b823e1b0ae |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/319b02d7b72e7c518b33a7821472d3424dff5b2a |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dbb3dfc90baa95410164b4891a9c16fbf320fbdb |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f7a9160e514e118272c3152c225e20c892dc12ee |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/34107ecdb48509efef78cbc37c0b9bb5cc44eb5d |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/809be8b291542da800b2170bbd6d3828ee62aa3d |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8dec65181587c34d6c328016f9f0900d4b45cc09 |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d767c2af058f60bd42ccbd714e145ac1bd53c01d |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3787a3577c16935e669dc240f40e49d3390e883b |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bb8b1a48d057f9fe7e82448398979f120c0dfefa |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fd83c6e301098bc2c7bdeaf11d7e07f1abe86d0c |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/35defeea655466dbc6b03bc861b2e14c0b4d8503 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/223f0d8b7b9d388bc9ff1d399f337196a6b4a986 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8e590ecda0f18a5582c0e6549620568b11a687e7 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d42af393a1a02c563cb09e986a1e83d42b7daa6b |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f80d15e2dcc1e0a5f977c17016590cd515a28a2d |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7afa789ab19a102b92f118a73c36a9f11dcb4d84 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e0ae458f9b52be58212339927a3744592deabb1d |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/77c58331f86054b36598ac4e7d8829b6cf2912d5 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/58b30c3ba933b633791bcb041adf0c0d757b0ac2 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b9da6e3fc42a1d1f0947ad8a830a84b9e1fcc053 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ad8b62a9efdf10d5b4417afb7516bb0f17238fe5 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/64343742d11b1aba1b52a5e4c5402b2cf7a793b9 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4e33d367fff05da3f9d080deb657bc2ac2e0d6ff |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/05a4d53ec53e477606cc3402348a856931cbb9b5 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a1eb224d6eb149caeba93d3893752838eaf26b9e |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fbb4abfd87c0c5b584d06bbc1b1d393799325583 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5d4d15379e74189c185aa7d6083120c639d492f4 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a831eb56b7859ecc9ef096cb29cd54f6f65e91b5 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ca5f367bd8e42a97d8760ea8c338122d1de04a70 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7082fd1400a8a0940e0d1f3e71b6a88f33e20dff |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7b2ae2b357bd7170505ac750d447a97e348d584f |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9d87746381a98d38f4d9f5ec1baf7d3730ace725 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/51d57a31eb3cf4343cf7391b8e63a39d32c1e5fd |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/64f8e42e0bc115f49745e12c9f1e052c6334c367 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c29879965433604b7548db0722a5c7930293b01f |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7f92316fade98ff2ac71832c16986750efa3b370 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8d48fb1b42f3bbf36abf67a5755cbeade4eda3a6 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b19b1617a6a096e9c2e1603a840a1ca9acc77d66 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1c337b044ba088e9cafa908c7876131d9f23befc |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/07f2dc0877b816d70ade8c75b7bb852ff9b05319 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/01b6d94f139d6b3005f90ee0a10c9af7a6a377b5 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ad55fd49f4d8c680bd42cfe2bd5dae098a93438f |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ddbb389be734be74a20d2d93acaf890e35ac997c |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d1c45d46c12a3e4fb490316ab1f16b7631baab4b |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/37fa822badd0d0675bab6c2de7e74bd043e3a746 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/421ba136a4ef38a867c66b3c11f1e9848270f692 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a385952bfec1fc4db0dbf07f3c9aba3f18e3d7c9 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/59f25ee2979a6f8eefd061b99e33953fa28dff20 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/087e3119b667ebf7876cdbdfd5119d87fae948cb |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/390f7be04948825fc4254029872446be929e5cfa |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/eea22d823ed12409cb300f4d59961f5ba5572c70 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/41d5e7379872037e71002bc7ca7266ff6e98bfce |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1f2ae7caf1c9d0f9b66a6a8de10b65f0c7fe9d4d |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/35ce27614f86686412d1469a23148c3b25ad1adc |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fe10cd6ffe90f84f7822d54524276a27f60408f5 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/32fdaf5f21759f44c169250d141b70f4bfba3065 |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/35004d9a9caaf3df0c5718a8e583476d91e08168 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/473323ea96097adf10efbd9139879624a7e2fe54 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1ef9621c241e89227355281bf97694225dbb6c06 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2eb86e97fc946d4b608faa1f52280a847aa29ab5 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/36f1617e2b0ca5e9c649bd0a46bea227d80ef544 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/566d47177b28a4654dfba64a86a1c2c4061bddc1 |     
   sh4eb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9bf779059fc445bd225a39806d1d72a90993d54d |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c5a1f5484a78847468ee3b78bf4ba30ebcab1234 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/81f574dcc025ae32a0650db1104290d82fe42629 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/930d49907f127ad0e4b7386704aef0cc03c78a94 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/07fa7c0c7059cbf0b0f7e1e956a0daba32e74bec |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/308c64988913a89f6ddc33240afa447fcc5ccf0c |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/289422e47716b5952ae83d93b78afecce2d30b05 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b440a96ada9a0db3ee978c0165cd29150fc93305 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0453490af579b63254188f310e2a8c80c3ae4c77 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/68bb2f95fcadbd74a90a49cd528cdcfef52a3a28 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/11748127989b6270ca6833408c47117838c5c293 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8a4bdcede91e9dff408743da0545afa2acd42436 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dc41d4ec79551e816af515c1cf6b61d3412a36a9 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2943dd5eb84a9275035b27f874296b6efabd93f0 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/557aa66d15d2ee7e97014d5293088c2f2330f28d |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b6d9893aa3b2286808f5a8e11703a8f83ff5e268 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/62b8fb4fad2779314d374d2ff1fc04fc0e5a4b93 |     
   sh4aeb    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/87b76ff517d19b9229287bcbc760be553e3c7dd9 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cdd49f8ce08cab8d8ca78840f16d07ca73db26d8 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/64b039974ecc7a8916d0416ca6a7c765c608f7a9 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6b50f44555cdd5f74e303754aee0db364d0d3295 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3c8efbee79ef11d07a2d59aaec5bda19abe080f0 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8a30fd2a71f9b64393300e1e75bd011dbf12dacb |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c6db64e61254c013019e6d97f6d1659a9ef7e176 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9775ea49e2300d9d78501d96058b2526e4588934 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f7b971c942a91d8ad72a9f717c61ca511430e495 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/828f112913768ad2ce303fcaf7364ca4d77834f4 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/693c52490493ba07cef3bd6f3de0f9aa00a1c23d |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/98839ba0aadf070e950a952f00d19086ec32dbd1 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1e1b3e099f78b19aa83210892f6d20ef7e13855e |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9a89fd614aea565f459723c5adf02db7b8cc6dbb |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/31ae202e5be5f7c57e54fb1e42a096c9e92481e3 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6e041ee33842dddca16eea8ed1644c5474b38bbe |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2af51f19d37648fe7ef9548af8fab9c277315e7d |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/897b3fb65dcff8acebc4c6db0181f8ae598e23cb |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5412910cd5fe982e32f0c545e03b72be460ec5d1 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/26e5373a2e976eb8c957847d8c4dd694bce457bc |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/03e25183b1e3e52e50f05845a21e60ae234590bd |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7c288b3cc61d3c57133c1d0179120ea1952c11ae |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bd8b9d3762fb02861587895e1b7a8ebca3678272 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/652fdbc41ec9880d4009e51a69fb5b7a9b4862dd |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3aad577c8dc0888f54982d806364ad5fcd61c296 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/aeb8fd9dff137c5bbbbad845197df4e46d72cd13 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7caf3d20c1719051ca501e038c8990c07812c73a |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fa7fd11604f5bc1c381cde55dab4168bf1406c1f |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/33f99e67c4ad67cba81674ea7358fe0d718ba6b8 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d89806227d5cb3c0da993fd0a7a3d53f48f9a73d |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2c094dad9144b84fbf6c8db020cc45e3d1b02c97 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/cb20573c467ab1a6babf38a65a3cbadd1fb28476 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e5324bf5105bb4b0fde1c0d50fdcc6594a60f466 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0c419f49928962118c8b8cfb742ed72d90a22ecb | ORPH
    m68k     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/228d604270136a03928027d22dabc763570fe672 |     
 aarch64_be  |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/f2bb91971afdcc7720f8b5c4333b7ece9ad11611 |     
    arc      |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/62d7cd084dae383b8bd63234b77d57367c621ede |     
   xtensa    |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/fba4fae3a72b2606073bc124480ae42665d4fd29 |     
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/28c22b46ab6bab3a2f74704731fe56e99bcd8e79 | ORPH
    or1k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/1451f05e4e6deddc1e62d0d378fda8022f95a8e0 | ORPH
    i686     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/0bf918a3136c302f5b30439f70bd46a4ae1443d4 | ORPH
 microblaze  |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/588646bf6e7c08f54be1d641948aef23b20cd22d | ORPH
powerpc64le  |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/516f2649831acbe2e698d7d83289be81c881f1a5 | ORPH
   mips64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/4b86058e319868de5fac88c8374d3531b056aef1 |     
    m68k     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/b5575d04d1ccca0836f04e478fb27d39419624d7 | ORPH
  powerpc    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/59ed33ff2b14565b617bbbb3d76588839948808f | ORPH
   nios2     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/32ace1f25a8389536ef25a8e23d9347b82000b26 | ORPH
  aarch64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/54f2b244a09e11486118f1fe9a0e3b5dd8278f40 | ORPH
  aarch64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/2ec13b33be3967dad4bccd6b6465cc632fe2a432 | ORPH
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/87cb46bcdc1050bda01515798c7abf338a780803 |     
   armeb     | on2-8170-modules-73b08061d3... | NOK | http://autobuild.buildroot.net/results/b5a4a6eac0226255ebf02f634f95832afd5f9226 | ORPH
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4c5c4552a77eb9dc5224d5d701848c06e09b6336 |     
   mips64    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/7e1600a63278b2405ce4ac4868ebeef03a361abb |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/258e4d6d98d852ca42408b3777c48a92351d360d |     
  powerpc    |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/a0690d23cb450e38c40fe754c2e0afbd44a3f437 | ORPH
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/87a28069cdb6d5bc7cec3b8a7a0c72278ac2586b |     
    arm      |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/91880a3d1041686b992c0be907ac1db66bbfd497 |     
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e3d92097f5561d6b397627ed5d1648e1eb4e30f9 | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/0bac29ee9b3149bb1305fe98c918a81a64d5e2be | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/3f581341495caf1456054e3e614ac63bd7778563 | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e78cde252097d3617bfd1d8dd62beb40f17978ec | ORPH
    arm      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/9385438b9d1ef9020e840b82d0840de7049eaabe | ORPH
 powerpc64   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/07c6f9795d8c9301a64cdd104acf811d57ce9b47 | ORPH
  powerpc    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/02648d70fd2a9ed95e9d8a3595176fedac11e6e2 | ORPH
    sh4      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/6681eb7eae79ab5556278c26610436e97c294850 | ORPH
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/08a0bdbaf41f60c62d6d97fc60ad0d8f8851349d |     
  riscv64    |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/854dcee7b6ff3903d8d865c685cbd0489f946bcf | ORPH
   x86_64    |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/275be33c901e539611661cbd1472bfe3022094d6 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/adfaddff97ee679c660e91c9efc1b23b6a3321a6 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/16f6d8204bdb4c803f3b994eb18cb1b25a901603 | ORPH
    i686     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/9cfd84827c793fdf7c4fcc30daf811aba6cb5e48 |     
    i686     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/f1a26b8e1cf3bc5784d79c274ec4eabe9688a77a |     
    m68k     |         twolame-0.4.0          | NOK | http://autobuild.buildroot.net/results/aad2720f15f338d28f24628cb030c6e8997de9c1 | ORPH
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1e93d4bef0d2042b58c159666003144cd1b669d4 |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e93494a1b52d7efc6280e7206f24e8c96b3ca546 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e928b5f97a2f4eb66d7b1a385858f4a16bb65ff9 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6d9319552c673595c51b695a4441fe2494ba822c |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fcb51cca6a9d8760ccf36084598a2157d2eda0a0 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e99e4ef7ba375a2eebb0c554c07e398952c44db6 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e932f69f94c009bdbff435922a6300f6584a447d |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1f3fa7226bbe78f83fbb2b926a65bccd4ab71734 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/93d5366bb89df19a75fb6fe924e8cc674bf393f4 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ca94a8bb8e6df55cbfa07d0db3631ec6637f901b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/96df18add09391e7996a02a25f29441c8c88b658 |     
powerpc64le  | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/0a37c4aabbcb676952bf785e5a12465df0efdf8a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5d35bd0e7a2d86b8e7aafaa6d7e6a7b9aceb7dd8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c489a9f5d458d7d792275a4255427125f4ee5803 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/08724056e20ab03db368b6ad11f66f36c6a12355 |     
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/9d40daf590981cc2759550ed76c7a5ac03945d71 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/4ef11fe0fb452fd03dd9d43074cc3c5b3116ac06 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f710395ba957cd2ed777c0fc2157280d8f8688eb |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2f99c6b998a8bb8fd24582b11ef426faecd464e8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c06838be4da7271dd26216e2bc6d943c85fbb3d9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/141b75ceb38bba53e32f933d0dc868df33c7859f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/51ed268ee2414fed8b0455a711bfc712f0420772 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/23617a8159ba556abdda946b4adfd9f201ce4849 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/e4a6eab3baad70c728e8a122ca0a21d22681cd56 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/debdef363c428747e6c31fc9d48c928624bbf12f |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/67bfc47c9fdb04e620034e464c4ecbf9bd158bee |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bfb7c96ccae5987c0a55e9d5c3a44728578fb1c6 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/538e7311d5dd9636bdb326bacf76485c1d3869ef | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/449c8a2a3463bc33ed1f5f50a3e209fa8c8f4b49 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9d6bdb5dede65ac2fec23e66c92723500eecce5b | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5b15096812dc41e8bf469b6affe3759006f6b218 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 2 
                  exempi-2.6.1 | 1 
                       frr-8.1 | 1 
                   grpc-1.43.0 | 1 
                       libuwsc | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/906282d08d44e45c78f448e408775dcfde12c81c |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/a1cb2cd9c3f9510d4d2e073ad3e6b75b9855be66 |     
    arm      |          grpc-1.43.0           | NOK | http://autobuild.buildroot.net/results/d49591e156ae5831882b7f205e4365ff26d4ed44 |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a041a7729b4f15cdca00c1148a5c0385f075d5b3 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4d43187246dd4a4feac74a628693d2e8067a0a02 |     
  riscv64    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/10acde74ee86cdd6447b44fbec437d80f69e1f97 |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b0877a80dbe3d56653f3a4691d847a14faca73ff |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

               protobuf-3.20.1 | 3 
              swupdate-2022.05 | 3 
              alsa-lib-1.2.6.1 | 2 
                  acpid-2.0.33 | 1 
 glslsandbox-player-2021.08.24 | 1 
                host-go-1.18.3 | 1 
host-pahole-73383b3a39afe86... | 1 
                libressl-3.5.2 | 1 
                 mesa3d-21.3.8 | 1 
     s6-portable-utils-2.2.3.2 | 1 
                    sdl-1.2.15 | 1 
                   sord-0.16.8 | 1 
                wtfutil-0.41.0 | 1 
                xenomai-custom | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/5a7808dd730fbbacee8b85ffcf77c55bb46dbded | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/6cd5c308e0e778d276460fb98605cd2b50893614 |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/17ea17c94a939e5dc390539bb715e1f507f90f94 |     
  aarch64    | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/86fc17f36febeaf3c009a11d257d48723d02d0f2 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/eddec9f7a7af1f5c62d210444a8802d89a26efbf |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7b1b51fd47bef92dfa28ff055d0602af793af862 |     
 microblaze  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/f66d964ecc3eb32bfd6d800269e73c56c8ff2997 | ORPH
    mips     |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/5a9f371bc49da9cf4acd544f6ed6988e7aad7c22 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ff07709d5a0ef66a9bd26ca875ad9e8dd98ae92c |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7f5403b19b53621eccbf52812adceb47fa1f580e |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/50eb5c7f370e4cc89283d8b27a849e0496f04668 |     
microblazeel |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/8527ae1fa235d02b030150bc08e459df6df26337 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2a8dbbce1596c1ef59e951a32477e5d49d68b21e | ORPH
   x86_64    |          sord-0.16.8           | NOK | http://autobuild.buildroot.net/results/4b9a54f85d1e630824256b1a15119b95265cf6f5 |     
    mips     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/9da67eef4e4313b6744c3d75e22f1dce2cae5869 |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/8416dcda4441c6821885815d23d30dad122cfa7a |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/af84da4c97967e8e3ef12a3b7e3f9c8a51a7b497 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/dcdff074b1a1baefc52afa4aad4ba7a5999b830e |     
 aarch64_be  |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/6903e9559ced657255c162894bcbe5e35a63974e |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/4a2f2589b1acc3ca0ec8bab3ad72509e0c126476 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

