Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C185C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 06:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EDD6402E6;
	Wed, 29 Nov 2023 06:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EDD6402E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xjf994dEA0aM; Wed, 29 Nov 2023 06:39:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32AEA401F1;
	Wed, 29 Nov 2023 06:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32AEA401F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 054C81BF32D
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 06:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A75681E9A
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 06:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A75681E9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvKHubSCZWqy for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 06:39:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8589581403
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 06:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8589581403
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD87140006
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 06:39:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 06:39:27 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231129063932.7A75681E9A@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1701239967; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fiLWdIO9x/34fYrw6zGdSFNlw3jAvLT2JKe9tICNVeY=;
 b=OX/yos7wY258S1jJZTWliCSb8joYUVyetVrueEGrNMTh/4NDZ4lDaGP4ACzd0JP9WB0ZC3
 PVg3XwlED8z60d2yywIXLtzh1KTJl5ALNpjDm4nAuZgREwT+Z6bnit0Bl8MSEiCgkQFRmo
 vWZGVYK5wuJFBspoRtT2DereBxxlUqtX044pbB2F9C0OCzuWCNvgqllPV3nqR5+RkUHGs1
 xExbqwWCFoFfYVkDsjvbKTjqOtTJbDrJHXvKrAy7CPBTJqnJCbgaqYS4qrQd7/EOgj9tWG
 jURy6c44aMGQ3RXCsa5qiuQq/dtsbgfsV9i9j8IMNynE67YGeL7Ke7zU24VxjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OX/yos7w
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-28
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

Autobuild statistics for 2023-11-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  2  |  0  |  6  |
  2023.08.x  |  4  |  4  |  0  |  8  |
    master   | 50  | 36  |  0  | 86  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
  gobject-introspection-1.76.1 | 3 
                libressl-3.8.2 | 3 
                libselinux-3.5 | 3 
                elfutils-0.189 | 2 
            host-erlang-26.0.2 | 2 
              libarchive-3.7.2 | 2 
  binutils-arc-2020.09-release | 1 
                    brltty-6.6 | 1 
              host-rust-1.71.1 | 1 
                libglvnd-1.4.0 | 1 
               libunwind-1.6.2 | 1 
       libzenoh-pico-0.10.0-rc | 1 
 Makefile:727: target-finalize | 1 
               mariadb-10.11.4 | 1 
                  motion-4.5.1 | 1 
                    ngrep-1.47 | 1 
                   openrc-0.51 | 1 
    python-cryptography-39.0.2 | 1 
         python-rpds-py-0.12.0 | 1 
                python3-3.11.6 | 1 
          refpolicy-2.20231002 | 1 
              tinymembench-0.4 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/0f66a3670d8c149d4d699f45c6123305e1503509 |     
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/05c0b6b17cf2dbb5724fb3a794f60435bec46332 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1e24e33f4613132cbdd075df6ada0d6c1c471a5b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/92486d016783d048ca5ec505e894a4502c7ad630 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a8c024155d5fe9517c78c6d135353fbda05355b0 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/81adca0091c5c0392a944b08a3dc439a30c1ce6a | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5eb888c8b7480a00a2fd020b5101a59d99ce5b66 | ORPH
   x86_64    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/261da05df9d6da580ba2a98ee8863b7512794475 |     
  powerpc    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/04738a0779363d437f9c8980c0c9b1fba228b21b |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b2f70f263c21d1e5bb607c06d565ec969af24b53 |     
  aarch64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/8fd1c9b64bae33e95630519adef6acaf80a47f82 |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/c1df2cef9aec7639a845659253507474d3b8a49e |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/d4217a62e2956a91cbca9da5616288185d7ba66a | ORPH
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/443c50d3890ed7534ed5402cf1c82235a987c811 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ecffda29c852b69fdc5d73f376ca813b1f71fe66 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6d61e52b9d2842942c71321b26ef40cb45bafdc5 | ORPH
   mipsel    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/709e314cd1a83a43a8760f5b30c7092c326cf6c1 |     
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/2573547a404fa1be146a7a110543edcacae45468 |     
   mipsel    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/d85c81f87adf3a5945fa369bcec233e6def2ed12 |     
    mips     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/1d9c5c0027837570be11c7e94c1621e32e4bd129 | ORPH
    or1k     |    libzenoh-pico-0.10.0-rc     | NOK | http://autobuild.buildroot.net/results/b54c4cb6619b9dda1720c79325e2805fe932e912 |     
    i686     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/e2f42ec50dab62a2e0889c3b3caa38b86ee09e12 |     
   armeb     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/99cbf0ff388daeaf0075c2964acb5f923e4c80ff | ORPH
   s390x     |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/c83c7b78d14915f3d230f5fd72281451b063a025 |     
powerpc64le  |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/5e20fdd169673b52afb8944fc53843452ab98e27 |     
    arc      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/c2a67e440be61e16ae3bc54432e2808f105c6db5 |     
    mips     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/396bcac608acf5093b20478121cfbe7b4f2b6ac3 |     
    mips     |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/0e3035f76622d274e29d643b9a233305a8a75530 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/6e0be38c2cc34f7c023522f555403a717b1b35d7 |     
  aarch64    |      refpolicy-2.20231002      | NOK | http://autobuild.buildroot.net/results/210db01ac72cabd42e1478900cdbfa4cf4b19bcb |     
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/b250fbfd8479b119a7136e70235013bddc6f3056 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/10d33db10663e351524c6acc87eb05377db999cc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/18d6d4e19c3a68a18b43a49a584f5698e80e46b7 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/ea007dc41099870cb3b609951a50cfdd31f8d3fe |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/fc44c6a30e108325388a0c81630cea13fbbddb51 |     
   mips64    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/c2ae886d2bb9a1b19476569c95bad9425f727f4d | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 dhcp-4.4.3-P1 | 1 
                   perl-5.36.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/e20effb54321fac02f73ec024589955e16df6dd3 | ORPH
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/15bb3ca25a0004975e13a1d521bbd4e161119d5f |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

glibc-2.37-45-gb4e23c75aea7... | 1 
             host-delve-1.20.2 | 1 
                  linux-6.4.16 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/c2e41a915d35fb709b13685e4c1c6ae8b06ef506 |     
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/da777b931eefe6a20342e1b70ef2f9c7274b3d76 |     
powerpc64le  |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/08037fc11a2e7b7a6936de0630a034f24a9d9ad4 | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/ab2611f19d5ea6fd35fedf11f35f740429f3f6d1 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
