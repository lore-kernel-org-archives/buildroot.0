Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D588FC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 05:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FB1960D67;
	Fri, 28 Jul 2023 05:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FB1960D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNsSGiKk8h9K; Fri, 28 Jul 2023 05:53:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEDB86061B;
	Fri, 28 Jul 2023 05:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEDB86061B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88A5E1BF3AF
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 05:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4149D84033
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 05:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4149D84033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SutfU18lmluE for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 05:53:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4969C8402B
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 05:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4969C8402B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CE82C0008
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 05:53:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 05:53:22 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230728055327.4149D84033@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1690523602; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QhltpfCAHv/ZjCOcKjZp/d6edJogxanr3cMaxFPyQVw=;
 b=VJmBHwcEqFlsE0QBxP0CVqo+Doo1AWEBEw0r1tjrt8CCFRRrtuZa2Thrm7qgqbPhf31DDc
 jnXyeqiaqKCexF+HAJuFTp/czPKJlpFX1SZ/ZAfWQMu3GB9fRfDf8S3zb1w3YfVnh0VDuS
 jcrgiB1aXd6bVbrWxNPtndwOeGj4Kn8uhDHyY+UzF5RRuW4cwuuCbXjuvowazz6qVWNsql
 5cVDysYgm7XGbvnvxvw33cVfg4xrUlacYrCcrbv/A5yoJ6BIhBzL8XYnPesOQuJpF/QO39
 D3T+/F4AAI5gZ9bn4Cy6DvgtSSOlvUO2ImGp9EH8YMDSNpFqQ1RcW7q8N9gNfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VJmBHwcE
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-27
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

Autobuild statistics for 2023-07-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  2  |  0  |  8  |
  2023.05.x  |  2  |  3  |  0  |  5  |
    master   | 87  | 103 |  5  | 195 |

Classification of failures by reason for master
-----------------------------------------------

         host-sentry-cli-2.8.0 | 12
                       unknown | 11
                   gupnp-1.4.3 | 10
         gobject-introspection | 5 
                   perl-5.36.1 | 5 
             host-ccache-4.8.2 | 4 
                host-go-1.20.6 | 4 
                 mpg123-1.31.3 | 4 
              host-rust-1.71.0 | 3 
               libglib2-2.76.1 | 3 
              fluent-bit-2.1.7 | 2 
  gobject-introspection-1.74.0 | 2 
                 libpng-1.6.40 | 2 
        ltp-testsuite-20230127 | 2 
                  ntp-4.2.8p17 | 2 
              open62541-v1.3.4 | 2 
                     php-8.2.8 | 2 
             util-linux-2.39.1 | 2 
                alsa-lib-1.2.9 | 1 
                bpftool-v7.1.0 | 1 
                  cairo-1.16.0 | 1 
              cannelloni-1.0.0 | 1 
                 dash-0.5.11.5 | 1 
                 dhcp-4.4.3-P1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                  eudev-3.2.12 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                gnu-efi-3.0.15 | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
          host-elf2flt-2021.08 | 1 
host-gcc-final-arc-2020.09-... | 1 
host-gdb-arc-2020.09-releas... | 1 
                  kexec-2.0.26 | 1 
              leptonica-1.82.0 | 1 
          libedit-20221030-3.1 | 1 
                   libnss-3.91 | 1 
                   linux-6.4.6 | 1 
                     lxc-5.0.2 | 1 
                netdata-1.33.1 | 1 
                    ola-0.10.9 | 1 
           python-bcrypt-4.0.1 | 1 
                python3-3.11.4 | 1 
                    qemu-8.0.2 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.43 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/525ca7fe78015168c186ffda5fa52c0edb2071c9 |     
 aarch64_be  |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/17de49501acb0ab1bd855d2a69059bbd13a7223f |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/041ac8f0809a0f9415c545b7585cd197db08b55f |     
 aarch64_be  |        cannelloni-1.0.0        | NOK | http://autobuild.buildroot.net/results/074ff966f106a4a8208e943f054230793eca3fb0 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/6201f1a750b593edff0d36c1390fd26394fd1b53 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/501b420971c5e75ff2bc170c55435c83a6270087 | ORPH
    sh4a     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e7c92a875dd572bc7f9ada2217f490b7e3269e56 | ORPH
    arc      |          eudev-3.2.12          | NOK | http://autobuild.buildroot.net/results/ef01ae1ecdfd020ae5ec903b59bb28147c192968 |     
microblazeel |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/3667126ee954f927f83ccfbaae3c6fb8ebd07dbb |     
  aarch64    |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/70960056479eab860e94eed993566fcb78c4dbbe |     
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/10613230cf3f8970bd06d81e3ddf073d5317ae49 | ORPH
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/8a71df3b1e80ee4df3b5128aa7b9f453c01559d1 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/a5b13b7904dda324f3dc214477b56ceceabbf3e3 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/bad21b42c058cec80539a848d084b60a324ea293 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3395d32e0e819bbc0c4bcf98031aee138b595e15 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8da2815d94ef9e8c5ab05747b9d2b13c4691a9df |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/337137d7c2ca84e0627e9be99b0d59e4612f2733 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/86defab4ad8ffd02db02f991de6ddd3542ea88a7 |     
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/fce8cb23a4a911e8d6ac8bb2f341a8ff444891a8 | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/852ccfe4ccf5523f2951d053ea15572015923914 | ORPH
microblazeel |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/2272d4b804fade9243311c4ae09fcd11be88a584 |     
   nios2     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/5e23368ba9cf669859f6b10e56bd2c6583ea07ee |     
    i686     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/42f2732515d9fc0526cd4b8f2aa8aefc6460cd5f |     
   s390x     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/f3e8a8a86e08be2aaf7a6047e074e60d3f968a7a |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/019834db0ccdf4e1bc04ee7c3f33921834f3575a |     
   sh4aeb    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/395a77474e190a7b7897047345927baa7ca73050 |     
 aarch64_be  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/c664a7a5547ee39413e78c788445b0e073087329 |     
 microblaze  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/aec2c8c390e3cba4d4eca1a61c6a3adff606b6ad |     
 microblaze  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/039ec795da71f66f5150718cd940ae45031ca2f5 |     
microblazeel |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/c6ef669848dc6d3e4a7f5591d385e731927818f9 |     
    mips     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/e2d36dca863a8fd7a8905c86e0fff69e0a588447 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b9c04937de3b67b1ad8fa4855b91b315e848cc42 |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b879d497a1338d7749dc74923b66833a080a6781 |     
  aarch64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/e9e51f87a2f539db273cec7134db0bc207baa054 | ORPH
   arceb     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/0813a4de94c03469c6b8fc42f21d35bd0b5aee29 | ORPH
  mips64el   |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/ac7f978aa25b326f513fb4784832847dfdc344fc | ORPH
 powerpc64   |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/ff22c9f7ca74b606f5a06a9cfb8a1eae1f20973f | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/7f89586c0d959d5be4a496daceb7b03262ed8e66 | ORPH
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/68b6d2abe901b22d0d860a52c2d23f9c448ab439 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/10437e9d62a96fcd45517ab2c2303d73ed56729d | ORPH
    arc      |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/8b2b32684b30d5953e7215fa04f17b21c6c178d1 |     
   s390x     |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/17976aa719e11aee06621de659c2af599340fe20 |     
  mips64el   |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/0fea2269074c2b1f2ef954952d3fcb82ff17e14e |     
  mips64el   |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/d0a81df7256ed2827882dc8750f3663275390c38 |     
   mipsel    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/6772f25b6c5afbbdaeadb2ee5467fe4072677ea0 |     
   x86_64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/11aecb044b950ca82d5e0b76b6fe42297aa1b802 |     
   x86_64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/bed6b115bae3f06d6006329c61f851a9fad5b86b |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b8b3dfb831b99ae10d02d0e3ea872fbe7c30128a |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c1bcda6570a7f46848ef3f671076fdf01edd3e6c |     
    mips     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/905c29d72f885b784426f5a6b54e93d3321e398b |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/73ff233c292355f6089208081bee4bd3831d9cdf |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a2d0ad30e04374218a190b76f785fae20f321ca4 |     
    arm      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/38811cfd47b64dd434676da44ae647321dc6b0e9 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b19516a3cd70024aa2eec6cbf88ef3348f6366f8 |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c3722f0c7f78ad6b60ea1b86af0a9adb05837f0e |     
    arm      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/bdf0a70afe1c32e0f7688c71ebb2a2df76bea8ac |     
    arm      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/46ffab2ad8193f24a4c5b62d1e8b7b093a68e7dc |     
  sparc64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/41feb4e69406f05fb2d55a294ea7f664e911afd7 |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/141fbae718799114f02358de4a954a61fedeaada |     
    sh4a     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/499115439680adfb4b40042468e5bbb65d91ce6c |     
   sh4aeb    |        leptonica-1.82.0        | NOK | http://autobuild.buildroot.net/results/271cb84b3e595acb1b90c06b223ab4836312c394 |     
   arceb     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/26c3bbc4ff6b87a5ea7f3b70dee4dfa9bb9f3796 |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6e02d4171680ddae72928f9f923f7a3e083b75a4 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/dd4d06a92244ef752f0fe776ddbdb918db4e1d4c |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d19bd2bd9a91838c06bca37d96d82cf0292c202a |     
 microblaze  |          libnss-3.91           | NOK | http://autobuild.buildroot.net/results/6aef171794b33e8ff2cf4182b68518bb24c6a05e |     
  riscv64    |         libpng-1.6.40          | NOK | http://autobuild.buildroot.net/results/4daace1aa38d48443f0bb9b55881cfb5ee5e3d0d |     
  riscv64    |         libpng-1.6.40          | NOK | http://autobuild.buildroot.net/results/e24405755da05afde141aaff94a02dd93e7a3df9 |     
  mips64el   |          linux-6.4.6           | NOK | http://autobuild.buildroot.net/results/7d54ef63e8deed788e964623cc2c71231a9a5571 | ORPH
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/661fa706f6f02595a87ccc7fb59dce25acdc4ebd |     
   mips64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/99917de0e98809c534394f9bf96ea32f285de444 |     
 powerpc64   |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/817f83884bf4d910682768e0cdec302d589b7e58 |     
   mipsel    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/f7f3f1b6d202099794e52bc8922c31d78fdccbc3 |     
 aarch64_be  |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/04a06ad2fa09fef9d03af7c399c4f3eaffc3f484 |     
   s390x     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/5c57f09cde573d59ea95341a5cbc300a8365c863 |     
   mips64    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/392c450a807a736d4aaed2d1b4ca36d3345dcb26 |     
 aarch64_be  |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/5ed3b76a83dbd6b21e34eeb44222b1cc527e900c |     
  riscv64    |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/f2b466853ed296fdc8b4629f36e5a6447658f82d |     
    sh4a     |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/7a1b8081e26d88366644816ae29f4ab99621f144 |     
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/a3212a7a367c76ba2eda6ffb57135d9573db24f8 |     
    sh4a     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/7506937ea8164678bcd5a66392310ddf0ac9cb00 | ORPH
  aarch64    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/f024930fcb651e6f4f5e55411f58ab3625e054ff | ORPH
   mipsel    |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/4dcf8ee784f4fc27c769dc4463f5ca86e4e5afe3 |     
    arc      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/d98b7c070daced1d35c3bccb0d72fb8377537e19 |     
    arc      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/7a269e693985b38ebaf0b6d87684cdc7626565a3 |     
    or1k     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/1bec4deb27d8f7566199b6973f3235c0efe4de31 |     
    m68k     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/4ceaee4fd927593b4d7932b164d3dc3f288b2948 |     
    arm      |           php-8.2.8            | NOK | http://autobuild.buildroot.net/results/68ff154cb158518f97cf5fc604a764b9cc2487d4 |     
    arm      |           php-8.2.8            | NOK | http://autobuild.buildroot.net/results/1d09a0a58cbc1712416de746d57d4532df580673 |     
   mipsel    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/c0121c46a85f162afa108b70fe940d528c4a952c |     
   x86_64    |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/28d3e138494c0a6debcab4250b104cb5d7d83467 |     
    mips     |           qemu-8.0.2           | NOK | http://autobuild.buildroot.net/results/4a55a7fecbcc2a95521d89d7f76a9544977cd027 |     
   mipsel    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/c44a679e6e52dc592a89ef376becb15fbd50728b |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/d6a5acd5249ce5eddc362bcaa8e87d6893aa81e6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/24a6ac16eaecd489355b4bfb1384b8b020f9a3af |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8bc585f6d7844c466164a3e53f8f03d0673f98ad |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/29ef2de5c651458c24d8ae1c8f6c11386480d30b |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/0b524a377314a3f35d16daedb58e0a989abfaf5a |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/1ef56d62979eac05e082c77df26953518a1a442a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8c190ef05642de82d77514e2a8f48ca994859506 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/924ac2a40327e04ba7aaf42e3780faa115462a21 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/746db82d056b148ed9c73b4529d5768f9713309e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/dde500005ab34d27a1b7bce92aaab68cf59944f5 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/cf7d9cba491ab7c5d232fb24ed92160ef239e04a |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d814c517f3c2f5732933f97ebbfea3256cd34f86 |     
   sh4aeb    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/4b56de5a8b7a966bfd76f7a6f99aae8d0dccf0af | ORPH
 microblaze  |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/eb62fdb1538e824eef411f0411d2731f01a8911e | ORPH
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/5730b28f2caf4508e9c14a8f14ec6f941152b3a1 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               libglib2-2.72.3 | 1 
                mongodb-4.2.18 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2521191b1fb56d1eebc0fc1f61ae85f4c65187b1 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c977fd99bc5ec392cd5c7a2fe16f51283a042a26 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

               libsigsegv-2.14 | 1 
                  linux-6.3.12 | 1 
                       unknown | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/ac7a2caeb68d4106c04b61456e8c6fffc26507ea |     
    m68k     |          linux-6.3.12          | NOK | http://autobuild.buildroot.net/results/e2d036ba2a831ff3a74a8daa71b9c9fd669007c5 | ORPH
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ee975a1af983e1c3e500bfbb8668ac81053e940f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
