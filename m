Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9859BFF885A
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 03:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD7E40F98;
	Sat,  2 May 2026 03:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9OJkOW27Tf3; Sat,  2 May 2026 03:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A773F40F93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777692411;
	bh=xfweZj9IZ0KuT2911LZ0ydiasgWhLGQTugyg5+7meNA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P+QNXH7iqtbwQRVzR3CuNY2+l3S+ZOffVxt+4Xp0urTnAx3gXgfUT+l6B4Og9il5R
	 BILD8QwaBwU7Wt1dXRxEqOhUwZZ3UFqZIE1CC9ybXwIzujH5uU4Fd96Bkk7L6jpw6j
	 MmHpqLGG5mRprE9WHIzDpWtTB6POSYdpcPL0tt/cRfnEgTGrIzGcRZ9zwOZ56o5qq5
	 EjZhC61pYobuqtGgqxmtRbO2x7Ys8ZQ0d5IBuhJN+dSPr74FJz0prUsrBa8dy+eqbq
	 wFZWgVQszdzalmKasgJnnQyw+UK+5mmvC5aA+hTSGHIfCDGRGVuQlQxDWjVZs8RwED
	 MyxG+JM8FDXZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A773F40F93;
	Sat,  2 May 2026 03:26:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9A70293
 for <buildroot@buildroot.org>; Sat,  2 May 2026 03:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEC8E829BB
 for <buildroot@buildroot.org>; Sat,  2 May 2026 03:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKe1VkuBJe6r for <buildroot@buildroot.org>;
 Sat,  2 May 2026 03:26:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFD148290B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFD148290B
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFD148290B
 for <buildroot@buildroot.org>; Sat,  2 May 2026 03:26:47 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-44c350a5b87so30738f8f.3
 for <buildroot@buildroot.org>; Fri, 01 May 2026 20:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777692406; x=1778297206;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O9e/6rMJ0xKu+8bwEY2eQSIszHDLWUOMHhaW8EmmpcA=;
 b=pbqx5BEke8H3gBu+H/TU5KqQSHMSWB00QU8AyS7NsOtOL6z5OC0IUKAOTetirri3kK
 WW1KD+ua2N54ORLw2MrAWDRcJ5oEKXr+EDRnO26ZRUId1wbd7FNjE05uxLPyAuvKfpyJ
 pu3dSwEe0UOteWR24FinPGRfNVmoqm5I7W5d0U6qmTTtMv5uil85VrGWcsFv6S2Nt0/W
 ekSeIVsa7Rl2G03CBuEjD3Zf/9S8PSZkZ+5uNya3jbxKNn4rioWgKFt6jP+1I1FIBWIR
 eJly7q6AFFsBTP09b27RsdwkVJnzmBJ6+zdmGG0sd3lJmufw64APZnHGiIj/x7AzG9IW
 384Q==
X-Gm-Message-State: AOJu0Yw47ZQZNzl2bgGJ3aQ1PimQ3XbwPiMYKfQlgMA5a8R5TF7a82Rh
 ijvSFR6HMVRvfTYnZxM7huFloh0OyF/T53FJkgLuoyS6dLTj2Oqkzd7L8qbDgZlb
X-Gm-Gg: AeBDievPJGOaYflNPg6u+DBH8T7xS0bbfst3HiIHDEKgLGmjxErP3sanKNn99OFG0il
 sKbACVtU284zyIdZPFZj91vB84jFJgmxpy/jAPqM1ACjVA+s8J57Lz/QZVJEz4INWFdhR6RA7PB
 MlFsdX7bdwpVwh3bqZxYEh4gcgdrmtUGDdDvFdKLqcQOvPwUvl9ANr1GP5ze9v9zrhniP1/GMW5
 aLzt9CN2I1CANot5Z2DsEy8YcrYqU/8t2fIx0Wp0aR6PLTWvASUB52SzHWhAF7+YPfb2kZNpv3X
 uzG0YDaa61n7rqeRZPu+vT/4qkcudKLY5brfBJBhFf2wknbzT5NebUh6hruDZpDNWaZQ6+NofTQ
 NUhGs7xW0aZ/uI0xCDxU3WRoSed5WkaMoslfVW0lCMMNS4b6IjyMlpgaQiAZkNcGR5qiediX3Rf
 OFQYFxYq9nWLcO1KCyotYwps4NCHyelrt0kVVHFsbA
X-Received: by 2002:a05:6000:2c11:b0:43d:7a97:78a2 with SMTP id
 ffacd0b85a97d-44bb596297fmr2696755f8f.28.1777692405358; 
 Fri, 01 May 2026 20:26:45 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7cf97sm9892353f8f.6.2026.05.01.20.26.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 20:26:45 -0700 (PDT)
Message-ID: <69f56ef5.df0a0220.1a77bc.fffe@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 02 May 2026 03:26:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777692406; x=1778297206; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=O9e/6rMJ0xKu+8bwEY2eQSIszHDLWUOMHhaW8EmmpcA=;
 b=PujAtDH8WkGv5SpTRsnVzzbL9xNj2o20UrUDJM2SXtIyvSmcFA9RmiVOl4k1I8Ib2I
 y5gs9DWY+oqSXKDxFolCy6nUN9g6oHvnfMJ3ralEM/vjesemaGGtSXEnSjI8j9blJqvI
 SmwlN/ES0q/MdAvthypskiZHhsaTOTuf8QT41vbuc19w9PfVkUmm7nrezNUBVYRhUlYc
 LODvLTyrPqpLEb37DZnIA3soRobmRfPkZ2962fOrbAcHLBJE5mOQQqpBzdM3y9/YLWbw
 hohBJDrgdzCOK3uG4E8itp6bJ3jWJ/F5/iQACwM474O7/6M50lJ3DoiScpr3bJeiqzfv
 gagQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PujAtDH8
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-01
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-05-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  | 18  |  0  | 30  |
  2026.02.x  |  8  | 11  |  0  | 19  |
    master   | 44  | 86  |  2  | 132 |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.41.4 | 6 
odhcp6c-f19dd37fb467c9cf10c... | 5 
                       unknown | 4 
             dahdi-linux-3.3.0 | 3 
                  libnfs-6.0.2 | 3 
                  stunnel-5.78 | 3 
                  cairo-1.18.4 | 2 
                   dante-1.4.4 | 2 
                 gnupg2-2.5.19 | 2 
               graphene-1.10.8 | 2 
          host-xfsprogs-6.19.0 | 2 
                 linux-headers | 2 
               linux-pam-1.7.2 | 2 
                  ntp-4.2.8p18 | 2 
                    olsr-0.9.8 | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.42.2 | 2 
                 sqlite-3.53.0 | 2 
amazon-ecr-credential-helpe... | 1 
                   atop-2.12.1 | 1 
  binutils-arc-2024.12-release | 1 
                     bvi-1.5.0 | 1 
          cloudflared-2025.8.1 | 1 
docker-credential-acr-env-0... | 1 
                    dpdk-25.11 | 1 
                    gawk-5.4.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
          gitlab-runner-15.5.0 | 1 
  gobject-introspection-1.84.0 | 1 
                   gssdp-1.6.4 | 1 
                   guile-3.0.9 | 1 
                haproxy-2.6.25 | 1 
            host-go-src-1.26.2 | 1 
           host-python3-3.14.4 | 1 
              host-rust-1.95.0 | 1 
                  iozone-3.508 | 1 
               iproute2-6.17.0 | 1 
                    kmon-1.7.1 | 1 
                 lcdproc-0.5.9 | 1 
               libglib2-2.86.5 | 1 
              libopenssl-3.6.2 | 1 
              libsodium-1.0.20 | 1 
                   linux-tools | 1 
          lttng-modules-2.14.3 | 1 
                    musl-1.2.6 | 1 
          ncurses-6.6-20251231 | 1 
                    ne10-1.2.1 | 1 
           oath-toolkit-2.6.14 | 1 
                 openmpi-4.1.8 | 1 
                openocd-0.12.0 | 1 
           python-brotli-1.2.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
        s6-linux-utils-2.6.2.1 | 1 
              tailscale-1.78.1 | 1 
                 uclibc-1.0.57 | 1 
ustream-ssl-5a81c108d20e247... | 1 
        util-linux-libs-2.41.4 | 1 
                 wolfssl-5.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8bcf2c3cb677765f7680c8360f81c60750e35d1b | ORPH
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/3463f8401c8aa99c375bdef50bed365f63646030 |     
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/8bb2a3c9a095426ce7c6db6f9914f0fd7c9b8aa6 |     
loongarch64  |           bvi-1.5.0            | NOK | https://autobuild.buildroot.org/results/9aac2f6c9620fb149a05529660cf55878c04d279 |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e6b5e26cdae8ad7d699b0b31b18fd67fac55e70d |     
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/31aeaf2b78353a64c0d0992d7d26e3d457f1c947 |     
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/b81715b36123f873a39612e1d13e582f72d84064 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/81d30e10d7c41eb8ad7565a86ca2b9947258106b | ORPH
  riscv32    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fcdb3e7528089abee61a2f2880216272e87d7e2f | ORPH
    hppa     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/052dbed555ae7182f2d54de59a2080031230066b | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/edb84deee784c9a99d7d17369ad61103e85fd0c8 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ded1f45dd6a99bc3584a4099583e98012aa66e01 | ORPH
powerpc64le  | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/62b0c2d0e404cd0192ceeaf699edf78c0741854a | ORPH
   x86_64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/fe4b63075c69654e6547b8d5c008bd11fef9bf41 |     
  powerpc    |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/8bddc53fd3f46e9ccbd0584ca8d6aa3b3f1f1483 | ORPH
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a97d7f0a85aa4594733ee5dacc4e24905376b1dd | ORPH
    arm      |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/fee8d46be500608c42636458720518959937c166 |     
    m68k     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/e177c06bf8b8603509050834ae99456cc4829688 |     
    i686     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/bd2291676eab00f73133835e2696ab928f5ff58a |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6cbdb8fe9b31b8e175e4c57b978ce3278a70e52e | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7bea85e568083837b0f05aa1c0d637c240d9a60c | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f07d117d5d23e8df2d91172e90219c65c8fff7b8 | ORPH
    or1k     |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/4fc6bda0bf859e46f25c2cdde04152e318438b96 |     
   mipsel    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/26846a40e05913b30a884679c3da2cd6ca628f17 |     
    i686     |         haproxy-2.6.25         | NOK | https://autobuild.buildroot.org/results/33f927285143af9883661ad4ecf6283f868532b2 |     
    i686     |       host-go-src-1.26.2       | NOK | https://autobuild.buildroot.org/results/91f7c1e1e772cd9d232b666f779424fcb41903ec |     
   mipsel    |      host-python3-3.14.4       | NOK | https://autobuild.buildroot.org/results/46c48ee694166b04b15d5159b5a7fb5b21d69723 |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/5c19f717a4d8661adf947c054b4ed7e0056cffaf |     
   sparc     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/f001db937cfbc5c1a53526848621b99c4433fc2c | ORPH
    or1k     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/40450f7ecbec48c63e8c1f1eb9ec06656bacb5a9 | ORPH
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/4b12edd38656c8e34b78d5684fee64b41c259c2b |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/7b0ff7efaeb7f5af5621dcd286cdc4928b77d130 |     
   armeb     |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/0a88653467a07e3eb0a3af1c29be90576a44c67f |     
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/8e8274f5057f5fb0c15fc6bc0fd22c8b51b3cddc | ORPH
    m68k     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/7b8e64e6770f47488af19c84e5adfcab7dbe8c95 |     
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/11169c45ee378b61efe66e6e37be05330d000773 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/1555dcb7f59348e022a7bda0ce079c91f601a884 | ORPH
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/970a3c94a7514572e1a02331fc241520d6002be7 | ORPH
    arc      |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/7574bdcfe5a84b224017d9e2febd5fbd57f251b2 | ORPH
   mips64    |        libsodium-1.0.20        | NOK | https://autobuild.buildroot.org/results/6cd3157e18383a065ed77684ae25b58c30ddb448 |     
    arm      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f251f1ec1e9c084716ca8d94720873af37c58401 |     
    i686     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/37e645f9771d9eccc8f0cc4ef010f4bd02e427cd |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b058a68197f1b9c40f1140b1210f579283d0ddc7 | ORPH
    arm      |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/7a4dc73d8dcf6debe3a43a84eb4fdf87f8a3db21 | ORPH
  aarch64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/4fcadec9f9bb4b3b767cffa8ed015e64e1dabaa1 | ORPH
 aarch64_be  |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/d03ec1eca43a82bbc90724d0da2003462d1c778c |     
    mips     |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/b1281501ea4a0c337c8366654353d23c81d59e94 |     
 powerpc64   |      ncurses-6.6-20251231      | NOK | https://autobuild.buildroot.org/results/cc23d19c29b27eaba2523734e3211185e425b2d2 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/c32e7a3af74def9a03a25d85ffbc44db853e96ca |     
   s390x     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b4657b8c0ab9dd40c1e053e7f8236822d1a51d82 |     
 aarch64_be  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/35e3cd98c4299b975d6dae8e50da00bf6f1bb826 |     
   s390x     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/b64e6d11e4b9fe1f352d18a94e1989fa9778bf56 |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/64d858eb70ad2cf3086d6ca503dc3a160d83706f |     
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0fad043a8c1a24a60e6f2cb2fe8e3a71571b6bfd |     
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/f6eeb4cf17667b125328e1e24a39c4f7dc7bec30 |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/a405043787036086b696033370ab3ee44574cd6b |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/5c2b2c258ac1da1ce173591d7e387ca3915af2bd |     
 microblaze  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/a8b6b394d0826077651cf76cbec940d5fac54fd7 | ORPH
 microblaze  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/c4b0eb0afcd368a4f4480670bfc9963464855349 | ORPH
    mips     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/597cad00936bdf4e90d21a1ecbe499d222f3fabd |     
 microblaze  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/92fddebd209c1b82d48c95987e664f3b341b756a | ORPH
  mips64el   |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7c7eb6b478cb96bda7b8a01b6677870459c0cc64 | ORPH
    arm      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a025066590fe24762fd650f43b2165174b1969e4 | ORPH
   mips64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9358194fc9136fe3fd507f16e8c63539759382e2 |     
    sh4      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/6987953e0f2c5d8fbdb9d0ed6c00f6dcf46dce5e |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/ddb8982053ab57de58876ba7028a4af4e17f66b3 |     
    or1k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/b306b1a640bc5f6684fa8b6c903e89ddfd860add |     
    arm      |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/16743f65069cbc16dcee45d7db164ada6287f971 |     
    m68k     |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/d484e1cdf824f949dc3d17355b2cf9bc658039cf |     
    m68k     |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/a9f8b29b27d30f92da0b11e45bb05400d3793b5b |     
   xtensa    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/dd6403c527f60f7d1c9629c824a362ac26fee3c3 |     
    sh4      |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/ae2fca20826a0681a8f67e01280030febc9a8922 |     
 aarch64_be  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/675ea779ce25bea11d043469070f0e227523973a |     
  mips64el   |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/cc5f4b94775519b2ff3901cdb524376913589835 |     
    mips     |         uclibc-1.0.57          | NOK | https://autobuild.buildroot.org/results/278b8a3f3c80dab25f263bcf79fdeebe2a4e445b |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/1263618858f7de68a03bc08bdff8075111745716 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/0bfb4c40dd06ac8375ae77d233ad52b48dc5eb20 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/013992b3fc44cd83cacc904b1b812eab1baa9ee3 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/73af24291a338579cf8335de08f5d55dc7ba9145 |     
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/271beed4e65c3644193a205b98b6621faffc5581 | ORPH
  aarch64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/7bfe41e8e5c85a9b2cd8f2983997f721034e69b1 |     
    or1k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/64f530521dfa1739c5808037b59d7e75ed3b8594 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/b5aa2d89c73acd5def5dcdc12a5dca8b2132f39c |     
 microblaze  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/14111dad470007c269a6a3614664068ebbbc85c2 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/99b47221f07f1f320528653ec944a27da66a33b9 |     
  aarch64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/8a06e5847b5b0bf7eaca4e747c807131b9af38f2 |     
    m68k     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/b59bc83c82aecfd2d21c80218d082e4f81cff5ce |     
   mips64    |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/c141763fa49b48cfd7751a93e70188d9fe7c902b |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                       unknown | 2 
                   i2pd-2.59.0 | 1 
                  iozone-3.508 | 1 
                  libbpf-1.6.2 | 1 
                 libzlib-1.3.2 | 1 
        ltp-testsuite-20250930 | 1 
             matchbox-lib-1.14 | 1 
                       mrp-1.2 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
              tailscale-1.78.1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/9323886db53ce4b40a5797933cd3c87772ad05de |     
    m68k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/30419f62115773b98f2f868f5a42c9429aeb7f9c |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/9e51cddd69001573ec40b8c69ea144a6a980cc8d |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/7666e773606228c5f9fd101bb8d307f4004516e8 | ORPH
microblazeel |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/64272fb3b11afffd65e923df7e32df3a784e8fa3 |     
   armeb     |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/9f2320a87569eed3679ad2ca53edb6fb42d90493 | ORPH
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/3aafa727006d7f1ac08f919dd6c1d0725d92c5b4 |     
   armeb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/12be5c89ffee93eaee9047c1649b54e60355e7b5 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/be0b8eda7d2aeafde6d73faf317d36892d4b6564 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/f65463c178a1f81e2a47ff838c78fc7f34ea6b3b |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/10f0c60e97bfb0ea6fdfcb12d4b14c93041f58c7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 3 
                  ffmpeg-6.1.3 | 2 
 host-softether-4.30-9700-beta | 2 
ulog-0389d243352255f6182326... | 2 
               asterisk-22.8.2 | 1 
host-netsurf-buildsystem-75... | 1 
                 libgee-0.20.6 | 1 
                 libzlib-1.3.2 | 1 
               linknx-0.0.1.38 | 1 
                 logsurfer-1.8 | 1 
               openblas-0.3.30 | 1 
                   perl-5.40.4 | 1 
                    qemu-9.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/1826c712ea45d5abfe5df9a48c02495953c75203 |     
 microblaze  |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/3c0029b07c14faee2e1c3d2c71295d173bc6cd76 |     
    sh4a     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/ca9034edeeffbbeb5f3e039ad8d296e043bf53e0 |     
microblazeel | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/0ab367555eb32989e00232bbab97a6abff37a13c | ORPH
   sh4eb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/8ed7044714bf7925601c75259c020d714ecbbc70 |     
    m68k     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/95047e3f6f2e816cd55a110c8cb9c5f891dae517 |     
  sparc64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/ccc21b8e7e775450f2008dfd57e7974e8f9b2b88 |     
    or1k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/2fb1e81e6286c27524b5d34cf6c38b9f602fd0cb |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/0cff2f94c0d545ca8e8dab89f7911c3ba1af24f9 |     
   sparc     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/2ce2ef0aafa49da4018915aa3bf8f32818420103 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/805a1bd624617847a54703a50b90b5d8bd1b55b5 | ORPH
 powerpc64   |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/307a5deef535e5970f8b608d6165d97c9ecb819b | ORPH
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/32325f3cea921df51e2e5f0f9b8f88f33fe9daf0 |     
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/2840885d5301ca21124999646d832be3afab4f47 |     
   sparc     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/62f4271d9c7c75a57e48afa5ac1e539ec5dcf56a |     
 powerpc64   |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/490e083631afcfa6f0acc176733a3f9727a6d1ef |     
 microblaze  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/b01b96e9ca9bb3425b0fd929b0d0ed381af77a9b |     
    mips     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/15bc80945359cb26cd9d29293d99a0f44945a6de |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
