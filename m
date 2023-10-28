Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0697FC0032E
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 05:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 682AC41EB9;
	Sat, 28 Oct 2023 05:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 682AC41EB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fz0Tt2-y6u4c; Sat, 28 Oct 2023 05:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1DF41EBA;
	Sat, 28 Oct 2023 05:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C1DF41EBA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB9091BF31C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 05:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95BBE41EBA
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 05:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95BBE41EBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5v4stPTCQdW for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 05:42:07 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 194AB41EB9
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 05:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 194AB41EB9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8411320012
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 05:42:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 05:42:03 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231028054209.95BBE41EBA@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1698471723; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=26lwzbVN1gs8Z/9evqOC6+8V67M9J7d+2sFGZ1y4BZQ=;
 b=oscN2T7C688a0Oke2Mwm4jOHGxxNYwjggoDqL4heovSMhIUOSPg7pwgzNBA9wwhOLTz82j
 8eJ7MjywoNPicxH/udT1953ks0e3PPatPkMKW4KfW5Vhhmfv/GAfmfF1LmPw9w4vtkIDsW
 Yt0qIVq9LSHO67hMuBYA8ZEXZWfJ/sNnRN5nqA0izWscNrY8aebWj0FR7+T0DUBVTA06/K
 HQCzUH9v3dq+jq3zM8VznZl2Tdb51nvecxxsXmwVvZaQCWFdX3vxB/jQopKrYPa7ywVvt1
 bPoNUViq2JCYl/Xs/WiqIHk8DZAFhwqBCSQleBC6vNLjdSk2t13KT4jVwdtjAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oscN2T7C
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-27
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

Autobuild statistics for 2023-10-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 15  |  3  |  0  | 18  |
  2023.08.x  | 14  |  4  |  0  | 18  |
    master   | 46  | 82  |  0  | 128 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 9 
                elfutils-0.189 | 6 
                 openrc-0.43.3 | 6 
                   bird-2.0.12 | 5 
               mariadb-10.11.4 | 5 
              gcc-final-12.3.0 | 4 
  gobject-introspection-1.76.1 | 4 
                host-go-1.21.3 | 4 
              libarchive-3.7.2 | 3 
         spirv-tools-1.3.261.1 | 3 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-6.5.8 | 2 
             strongswan-5.9.11 | 2 
ulog-0389d243352255f6182326... | 2 
               apcupsd-3.14.14 | 1 
           at-spi2-core-2.48.3 | 1 
                    brltty-6.5 | 1 
                 c-icap-0.5.10 | 1 
                 dc3dd-7.2.641 | 1 
                     frr-8.4.2 | 1 
              gcc-final-11.4.0 | 1 
              host-rust-1.71.1 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
              libostree-2023.6 | 1 
                libselinux-3.5 | 1 
                libsoup-2.74.3 | 1 
               libunwind-1.6.2 | 1 
               lightning-2.2.2 | 1 
               linux-pam-1.5.3 | 1 
              liquid-dsp-1.5.0 | 1 
          lttng-modules-2.13.7 | 1 
                  motion-4.5.1 | 1 
                nushell-0.85.0 | 1 
                 pango-1.50.14 | 1 
                python3-3.11.6 | 1 
                    qemu-8.1.1 | 1 
                 samba4-4.19.1 | 1 
               trace-cmd-2.9.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f41522dd8585f7b937512f9c04ac8cace265b135 |     
   sparc     |      at-spi2-core-2.48.3       | NOK | http://autobuild.buildroot.net/results/cce9f0d283c86b0c15f495af400b586adb62da92 |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c290d74b5f4a0a7046173ecf025bbfdad2f2074f |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/a1e04c9a51ae8ecdd2d69a5ba39b14808b6c3f9e |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/0ef1626f91d840ff5435eadb64de0127094ed230 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/33e08e3937e215449c9f1421553ab8397e197450 |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6278ac4e9dab2dc5814300079a644655d65d6e2e |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/998e694791d7eb0b9650368e263cbf63191869e2 |     
   mipsel    |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/9d54bb42e8218174e4fade142e5219500a4ed31f | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9b5b105778de10d963bad442fae7eb061e6e95b8 | ORPH
   mipsel    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/449c12c0325e47a0d80ab801a6c3f9396a949db4 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9796a1fcab227797f685a4d5469d4e02a2509023 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f2f0dbbd0cb8a7307ef2ffe56f048fc04c8f6fe1 | ORPH
    or1k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d06dcff767f6165085744abbb5b8ee5894d51865 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6e82d0e1bfc5cb57a7975dd8c59fe85dd16ee2e3 | ORPH
   armeb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/263a3c3527eedd581da13571f42802652b04883e | ORPH
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/60f7b54fb565564444c53fbcf2431458edec6336 |     
 aarch64_be  |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/4f61b2b1d626d5926b95be9b94211e4e93468472 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/dad942dafe0a537ed7412412d593780402da76d7 |     
   mips64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/7c2a4697f615a34498ee028f1ff583b084e1a683 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/0858f76b190383a5119125da794c475cf9517b49 |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/5c3844dd0018bca64573955823447257cf9bcc7e |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/57e23c88b14378d0d66549faf129075889af7355 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/adef0faa3118a40ab91b6e840f76d8cea1ee86e9 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/13d17d5fee75a8ad2d1b3c85716686c2106f3039 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/363f982cc1fda5d729bfd683c62e985b6832a156 | ORPH
    i686     |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/1d69c50385f70223d365d59ed7743aaf4f92d5fb |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/68b0ce69a669de839119f93a214b30dc786088e5 |     
   mips64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/80350c53cc2861f09599fca04c8bcf7a2ebf1289 |     
   mips64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/e7bf6d0a94ce4179edec0f93e0b33abe61cac247 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/1ff36f48bb24cc43b29604c250eea46914b7ebcb |     
   mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/1cb5845b72dd0171f102f42c14db2fc720fbee59 |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/1d31fe7de52c8268108899a64fe16998af98228a |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/542959d2fbec7abcc194777eb4df4421db91494b |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b707b8dafea5285dd243e112b3dc86f7c4cefca5 |     
    sh4      |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/bde796c819358e8552ef50f189289248b7239641 | ORPH
   s390x     |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/52d09ae1388dd25ea4f6f467c9bce5600c558338 |     
microblazeel |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/bd86e61822df51291930e191e6f86a40c303d3e6 |     
   sparc     |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/f2aae1c3842af45753fc69ef4c9971dcf717afd8 |     
   mipsel    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/bc60e0be2912956c683373ce1e4853921e0f4dab | ORPH
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/cb8012c4b48de21191142430e3a022299a5e5288 |     
  riscv64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/cf1adf9331fd32bab8fa181b0f872190a5b7c438 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/6b2905492fd1b96dc16d7bbb1245de457637b1e7 | ORPH
    m68k     |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/bbd52fac29963a71364cbd776a494d12ae4d2f47 | ORPH
   s390x     |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/46370ef2a371ac445ad33ee2a1c880ca6b4a86a0 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/09d87ff6c2c9dbc84bcfb154a4812dcb5fd32339 | ORPH
   x86_64    |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/acad28be4bd5499ecff49046d647a898cd617f22 |     
    or1k     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/a0bf49a1a9b3c7da6c6466c53ab9ac0e7c30c0f4 |     
powerpc64le  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/73d9c956b00ccc19e8b2226c60207b59cfd4eefa | ORPH
  aarch64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/2a6323fee39e8d4be6122b0fb0802e0da00647b1 | ORPH
microblazeel |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/11e77254e26b81cbd8a4789c2f14fd9f8feff2ab | ORPH
    i686     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/3e21f2939a78ba5ee2cbb0a35e8bc27a017a1683 | ORPH
   mipsel    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/6d0f7ed6d0df6b670170647f4d2505921411ad8f | ORPH
    mips     |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/f5df448a7afd661268a3607347eddda9ccd137d9 |     
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/b41f94baf1e57e7edf27e697cf6f251dccd472f6 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6ee76dc186993c131e509cd0cc45bc04b5ce0523 |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/fa69e84fe7da382270cadb9912d652a7ecd1beb3 |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/5e8672d49e1b7494ad7961e4ce345fca668ae964 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e7d3e946fb48bcf3b79eb3c8d1f6e9eae26da638 |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a6cbb01692127600a41a91cac8d2b9ddd01ce847 |     
    i686     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c03655ad982fb9f48e3432b9f20458969c7639e3 |     
   x86_64    |         pango-1.50.14          | NOK | http://autobuild.buildroot.net/results/e8b5a752a62621099942b29c1642747eef2930cb | ORPH
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/b67a4e4bd97518e36508ea1c32b26d3b053a7cce |     
    mips     |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/44c5b7c5815ed79213b7f34e8a0381f7d75a2dfc |     
 powerpc64   |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/1358b7c7768025e0dd4561e241c81ef762ede4a9 |     
   s390x     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/b9685355b31b6c71ad248d4d3fa3d08bfed75369 | ORPH
    m68k     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/57f0bb17ba312a26a93f7f6494bebf0404685f37 | ORPH
   nios2     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/912e213237205fef529195471a42564abf6ed1b0 | ORPH
    i686     |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/fdde7226f7d00a379654146eb7b016c6b7980d87 |     
 aarch64_be  |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/9bc68b2ac0af79968874fce029a456d7d26eb6e9 |     
  mips64el   |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/2bc9adca486a120114b5368865161e5bb568ab04 |     
  mips64el   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/2eaf3af9346e0a5299d9e381e41823aa1e5e978e |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/77dfc6352d722dbba83fd72b0e40a7d882060744 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/38ef832fd7ed201a7affd21fbc03662d153b9c49 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/28040b58c8bad807ccc1147074df60e872701aeb |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/0ca6560c669a44d39e9fa25bfacef43e4c2b1f6e |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/38a61f62a8ad8d94b35750dc40352563a0ee8aa1 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/2b8c6bc67d99dd7fb4874d80d477122ea92622b3 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ef0e3effab557c380f50a8f64c23082fc5608fa2 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/e0665006f1fe8d2b26a910014fd30746e828055e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/62be7800efa7a6217fe417afac55c99687fb0c07 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/8405717c26a8d2969c80f3ba75285c564db6f48a |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 1 
               host-go-1.20.10 | 1 
                  linux-6.1.58 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/567584b54c1eee2b8e6ffd9907d07724bdcd9338 | ORPH
  mips64el   |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/73b508341aa0819f8a303bd239d9cbb686326973 |     
    sh4      |          linux-6.1.58          | NOK | http://autobuild.buildroot.net/results/09f9f839b6ea09a62d2e5dc88717c223c91914e6 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                elfutils-0.189 | 1 
              host-rust-1.71.1 | 1 
                 systemd-254.5 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d2d21993aefc25e070ca82113f39058ea78683ee | ORPH
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f8108247ecb1ff5e437ee481bc901beb203dff1b |     
   nios2     |         systemd-254.5          | NOK | http://autobuild.buildroot.net/results/73555d7c1450fddad9cf881802ed172fec805a34 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/3218b7f6276bfbc6bce08ef64caffb9549d99a07 |     


Gitlab CI results for 2023-10-27
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622376  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622385  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622456  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622465  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622478  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622482  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622538  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622582  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622585  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622588  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622591  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622599  |      
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622615  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622618  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622685  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622686  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622740  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622769  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622777  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622829  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622842  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622920  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622932  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5378622950  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389164905  | ORPH 
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389165746  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389165810  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389165851  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389165917  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389166017  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389166075  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389166280  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389166679  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389167076  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5391013846  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389167416  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389167628  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389167644  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5389167753  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
