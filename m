Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29CDC61D85
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 06:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25DFE400F3;
	Thu, 23 Nov 2023 06:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25DFE400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwF7IArv4cTs; Thu, 23 Nov 2023 06:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8A7240298;
	Thu, 23 Nov 2023 06:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8A7240298
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67CAC1BF342
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 06:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08A3340298
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 06:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08A3340298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-_sLQ2X-4gp for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 06:38:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93CC7400F3
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 06:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93CC7400F3
Received: by mail.gandi.net (Postfix) with ESMTPSA id A012A60003
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 06:38:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 06:38:27 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231123063834.08A3340298@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700721507; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DvdIHHpQ2YgngIXVUjxy7yn1aIlWpKMbA3qeoMcwh9I=;
 b=YfuOcI21It2xYyI7QW8mhQ7Hk1faN29c17gLNejG4P5Eize0mzIlfmDbzDQfTXyviR9Gy+
 6YY8kw7B2jV8JBmFUgk7nrAfPzXWu9jjbStMevG0MLq9GMfuH9BtNyMS6+uVMkgSoWr51K
 CNEY0dbFb0IT7xSbp9xfID1W2uLJUoklinQCx5KGSp/Joaa+jVupqZs3byoIA3dOcb4Uyn
 ShWh6LBBPXF19rfg1KqftbyxiY6d1qHrB17ufo2rarAHccW3e4J33hXSQJy2Qq0SAb7zIy
 joH+wHkEfkeQUnyOejA2oJLhzP23i3AFAXk4iVYFE6y9vWJ8laz23EHyN2v57Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YfuOcI21
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-22
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

Autobuild statistics for 2023-11-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  3  |  0  |  4  |
  2023.08.x  |  8  |  2  |  0  | 10  |
    master   | 58  | 50  |  1  | 109 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.38-27-g750a45a78390... | 4 
              libarchive-3.7.2 | 4 
  gobject-introspection-1.76.1 | 3 
               libglib2-2.76.1 | 3 
                libressl-3.8.2 | 3 
                   linux-6.6.1 | 3 
                   openrc-0.51 | 3 
                elfutils-0.189 | 2 
               host-runc-1.1.9 | 2 
                libgdiplus-6.1 | 2 
       libzenoh-pico-0.10.0-rc | 2 
            optee-client-4.0.0 | 2 
               apcupsd-3.14.14 | 1 
                    brltty-6.6 | 1 
check-11970a7e112dfe243a2e6... | 1 
          cryptodev-linux-1.13 | 1 
         gobject-introspection | 1 
                host-go-1.21.4 | 1 
        host-sentry-cli-2.20.3 | 1 
              hyperfine-1.14.0 | 1 
               libbytesize-2.7 | 1 
                libglvnd-1.4.0 | 1 
                libselinux-3.5 | 1 
              libsodium-1.0.18 | 1 
               libunwind-1.6.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                nushell-0.85.0 | 1 
                    php-8.2.12 | 1 
          python-msgpack-1.0.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f55c06a3863103f35ab11889646cfee8a1ea9257 |     
powerpc64le  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/f560328673e4382e9c9c0fe6ad25350dfccc52b2 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/2d1b8d932c95af477c1c5495896c81c95a9c45a4 | ORPH
  aarch64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/98798ac4348364550fa2a2ad14b4d49c871b1da8 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3e39322ef685ef7eba419613e13abf67c8bf2c32 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9ec0d1b38bfc200e4b5b555deea42f3518bb599b | ORPH
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/75cc55fe8fc55f6e8e1335c2fc620584b93d40ba |     
   arceb     | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/a0f2bf808b1dd2ab13d8b6b8675f2493543c08eb |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/c827da7f767128206e74c866c1b76c18045e13da |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/15dbab076132882e7b98945b003806fabaa55bc4 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/927e09eb6c97159f8802ca633641c5fc2894b529 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7aaf0804aa3992c0acd7b734ddea9197b2ace6ec | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1d64b29cd8dc58daa659be6027b049b8098d7d56 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b6b70d2d288e868afb09291fec7fa8eb41e8ec4c | ORPH
  aarch64    |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/e0a71c491fd8d66900fefe9279b4d7dc86fa68d1 |     
powerpc64le  |        host-runc-1.1.9         | NOK | http://autobuild.buildroot.net/results/383dc5c47e62c54b54acb23c8de2e05c725f2d32 |     
 microblaze  |        host-runc-1.1.9         | NOK | http://autobuild.buildroot.net/results/83f2d263bb210ac6ad305ebc8f4684df5d54e7cf |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/7d88d00fa3560cfc815955eab41d99e88c4ce997 |     
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/334c15a9d03edb2d34d86094ff7099ede1d36a97 | ORPH
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/d55bbbb346952f3c28d37cc9a7752378cea9b617 |     
  aarch64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/3db5dcd7d518157665c876b31d745296f163e0c7 |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a35d24f6c031a8b67218c0a61d87c9761407696e |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a455f5f2c8bf8a112fb635846958be805e5da47f |     
    arc      |        libbytesize-2.7         | NOK | http://autobuild.buildroot.net/results/118525731f91aed6010b3747cefd7f0ce1a27bcc | ORPH
    i686     |         libgdiplus-6.1         | NOK | http://autobuild.buildroot.net/results/167709809d89403da21c7f1c52c117ea0bbb328e |     
 powerpc64   |         libgdiplus-6.1         | NOK | http://autobuild.buildroot.net/results/f2af11baddeb89ff249d39f5a2a72dada8b47989 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7d031d638b4fb8a77a84db10e101b5004fc2b1c4 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2b34e5fea93e93f520f4a5d0d900bf16de0d7d8b |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ba0f999b3b42e0f49a5b340da5e1c99e69fd5a5b |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/e2d324cbd5bdf6032c5b08fd186b3a1bd8a11def | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8d8b3254e0408caf105e0e188a95be418b4a228f | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9f451f06c44e24098140192a3316de726a32c05f | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/d350e24efa5b92ef2de84ff12efa170f87b8151e | ORPH
   mipsel    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/0e21119319055253c97b10c940a9b694ec399924 |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/ff06acad7d2f75576f0c941cd026661932000735 |     
    or1k     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/79879cc30cea44c1e7fcbc41c4623c4b1397e4bd | ORPH
  riscv64    |    libzenoh-pico-0.10.0-rc     | NOK | http://autobuild.buildroot.net/results/c9138c32157042aa5bb1bfd3a8446e4c9361d0f5 |     
    or1k     |    libzenoh-pico-0.10.0-rc     | NOK | http://autobuild.buildroot.net/results/991c27792b5832c7bddf855703f7fbf266f0eba5 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/bb8a35d62439b3961c7ccaf1018bbd887b6222f0 | ORPH
   mipsel    |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/2b01fa6ef095edd89af346cac1a0765638f8f82a | ORPH
powerpc64le  |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/4c25f36bb95cd0e51f318d5b758686fb4a78c6d2 | ORPH
   mipsel    |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/55ac21396763fb5733ac9ad5213a40f83f412ab5 | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/70fe6282f9d367fe77fe7f594dd6a2a39af4085e | ORPH
   mipsel    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/02670e644c3a8b0bb4331e80c57d2ab0e882da34 |     
   sparc     |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/93e27f3b9bfb4ca605cf0d6fcca82db1a894b3d2 |     
    arc      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/0ce32ede2af1f56fe5eeda247f32b9fa6b99bf73 |     
  aarch64    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/08d00e1701c29c07a56556b52e93ac81d3ec209b |     
    m68k     |       optee-client-4.0.0       | NOK | http://autobuild.buildroot.net/results/9f57d8397532daa7d87b2b2a61c597db94eeb567 |     
    arm      |       optee-client-4.0.0       | NOK | http://autobuild.buildroot.net/results/ed2eeecde10fb02c1d68f4e0f00a14b41daca4d1 |     
   armeb     |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/6411c375097f6341d13e6d3f3c165d38aa39ec12 |     
    or1k     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/2bbc6a1e04f8db05a668f4ae6f4f8238c6b7baa1 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 2 
        edk2-edk2-stable202208 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/6456d423e14222b50b451fc684d6d8d5e98962c1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8c61488507af642d32a7041c98c68352f8ff0922 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d4cc1e8ae40d09c2cdac22a15d2a4c335110b710 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                  linux-6.4.16 | 1 
               valgrind-3.21.0 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/41bae74e2baa4725d2ce7078096de161ffd26703 | ORPH
  powerpc    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/d03d17edce3143f0a3a340ed6f1c82eed554249f | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
