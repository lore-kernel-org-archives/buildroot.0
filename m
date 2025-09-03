Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FFDCA0FED
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 03:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F2261CB2;
	Wed,  3 Sep 2025 03:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDam0OMEjEF1; Wed,  3 Sep 2025 03:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A0161CB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A0161CB4;
	Wed,  3 Sep 2025 03:20:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD35B2BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 03:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9368241367
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 03:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ttr_3ivX1KB for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 03:20:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16B1641371
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B1641371
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16B1641371
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 03:20:39 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61cb4374d2fso8721466a12.2
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 20:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756869638; x=1757474438;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kQZrmcr1yaXjSvrmPZKUFViKxKdua1geMfGrggpUm1g=;
 b=NE1wuAji8uiVjRiCgxbpY+7k424eBdgHHGu20N+fyACs5mC9oQx8ix2W0XP9iPcTOJ
 RGB5cDl4fW6rUGlK3siANK5wr5K5yT4zXBQ98jY132rmC/wZCu3aho5Yc/YI++lJOiHx
 4uOo3zgvB6pWWIKdjwnR0owF6EhDpF/OuJ3zCLkvElAiKGVtIgI/sLwPvX39rbVxRNb2
 sNezC7ngpIvkcBGWwVW5glf1W0OboZ3HnNDsFAg8pHEeMvsTQpeLMkYTC7+eWiY3U9Y9
 InlisSLvZsniqw14UpW0DJHm5RzuufAZTrX7SWNCYvDM4SwYl+71FhL1Z2mxCXxwvr3c
 zS4g==
X-Gm-Message-State: AOJu0YyxrKnkBaxM87jH21y/12P7NTg9+uJLlCdplf6YrxoFxY9EOL7c
 YebpZ9Gf3EG0aot9b0Jcy5oSONILz3mVh1yuDSduwgvR0gySdfq639QsjZyXNw==
X-Gm-Gg: ASbGncs+QivtospViQ7kCNSdTPjbBQNOOQVjxqSIk0Y6Wka6Hez9VBnRkZU6mpfqdkb
 dOeGzvQO6whtsmVP4MmVLcmSKxi2/PZjzP6Das+akVF+1j+vPNP91+Xoevxdo9+dyG1+G/j1dY8
 Tf+SnUEvmUXrmmpX2kF062vtfcgIOtaBrvDwOngPfDWoUcoRAY22vCeTWKBpTMXTkngUnWf2bpF
 HklZ7nQYPmdhBmZcuaUJTvZeByo22JEB8K6GhNKMWUHSrRYpjAU0ftmr+UbXCnZx0VUt0bReVbJ
 FAj7TJ+AZbugETGcK29iS3CMdtbMXAPq1t6/EK4BJ6yn8kNthnvZuDBF5El/1VX9tSusDpNUUay
 W8Dntw4rbJ2v3pFvebYX+I93E0kuVELjY7eehwksw
X-Google-Smtp-Source: AGHT+IFvd+AiItKx1iJRAXahafAjzlToEBxlJ978lHN/URCTPh0dA0qhSJZhR4UITxgoqfkPks3qpA==
X-Received: by 2002:a17:907:961c:b0:b04:5a68:8674 with SMTP id
 a640c23a62f3a-b045a688c2fmr322921066b.35.1756869637727; 
 Tue, 02 Sep 2025 20:20:37 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0420ec9787sm751587566b.72.2025.09.02.20.20.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 20:20:37 -0700 (PDT)
Message-ID: <68b7b405.170a0220.37f3d.572a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 03 Sep 2025 03:20:37 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756869638; x=1757474438; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kQZrmcr1yaXjSvrmPZKUFViKxKdua1geMfGrggpUm1g=;
 b=PwY0L8HqUlR5/d/v4umytPv8H29YMzWQYcQJx01Hda5MazQ5mgMHPU4nTzFIiQBdI6
 y3e/ctioQjnsQH2cDMEzwIh5BxVLkIRooKMtWgrAgkpfkVz8ZacRQb4I+PP0D2C0FT52
 8RrU/NGuN8FQKsORtqaQu35/PuF8+Yma90LUfCGz2v4t6HuGHn6Xl69z3ljVqDTaI5jf
 mv8+lf4lTzYqhYlIjqx/sCUXIrCsOfC7EFzZD67yntlHiSrsXK5egzpAhhG5o3gvfZK1
 xUkVCEQPS+iMtXTrEE1uMzBhSovCrjfM8qupwqZtaaXMij5204fJai6QC8bZZWvISfPP
 mHOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PwY0L8Hq
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-02
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

Autobuild statistics for 2025-09-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  9  |  0  | 13  |
  2025.05.x  |  3  |  3  |  0  |  6  |
    master   | 28  | 81  |  2  | 111 |
     next    |  1  |  7  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 4 
  gobject-introspection-1.84.0 | 4 
            netstat-nat-1.4.10 | 4 
                 host-gdb-15.2 | 3 
                  mbpfan-2.4.0 | 3 
                       unknown | 3 
                    bat-0.25.0 | 2 
                 libgee-0.20.6 | 2 
                 libiconv-1.15 | 2 
                 linux-headers | 2 
                 logsurfer-1.8 | 2 
                    mpir-3.0.0 | 2 
              netavark-v1.15.2 | 2 
                openvpn-2.6.14 | 2 
uclibc-ng-test-132c6134d691... | 2 
                     unzip-6.0 | 2 
amazon-ecr-credential-helpe... | 1 
           at-spi2-core-2.50.0 | 1 
                   atop-2.11.0 | 1 
                   avrdude-8.0 | 1 
             berkeleydb-5.3.28 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
          chocolate-doom-3.0.1 | 1 
              containerd-2.0.2 | 1 
                     crun-1.22 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    dust-1.1.2 | 1 
               ebtables-2.0.11 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
                 host-gdb-14.2 | 1 
                   i2pd-2.50.2 | 1 
                 inadyn-2.12.0 | 1 
                   iotools-1.8 | 1 
               iproute2-6.15.0 | 1 
                 libbson-1.9.5 | 1 
             libgphoto2-2.5.27 | 1 
              libselinux-3.8.1 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.16.4 | 1 
                lmbench-3.0-a9 | 1 
                     nvme-1.12 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    olsr-0.9.8 | 1 
                 openal-1.22.0 | 1 
                openswan-3.0.0 | 1 
                   perl-5.40.2 | 1 
          perl-net-ssleay-1.94 | 1 
                rdesktop-1.9.0 | 1 
          sane-airscan-0.99.33 | 1 
                 siproxd-0.8.3 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.1 | 1 
               trousers-0.3.15 | 1 
              udpcast-20230924 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/ffb55be7652bc889f7e79582762a84af870ed062 | ORPH
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/022f0f3c369720c350998b3a5dfae009d857c646 |     
  mips64el   |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/a6ea223b023d03b92be483c88f77e580d4656bc6 |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/d21d58fcec00502ef15b2a739b4075b0faa9071c |     
  sparc64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/750597c27e07d7872aec9c211798b436dc47239e |     
  sparc64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/ecc3b0c83e691e9a8ed5c7ff9d0a92ee06409f20 |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/5ccae973d947bc6c6a185bdc0507619ada25ad70 | ORPH
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/823215ed22f38eea33abc254d5241710f274b375 | ORPH
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/ecac51f279f74c127c5f36ae80cc43caffd198f7 |     
powerpc64le  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/23d4e4e060283c26970fda3c7cea5560595f7f76 |     
powerpc64le  |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/19a107d151f656b26be1ca6bfc34a57fdb3de65d |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/260d830ce7fc584ce1fbb5d0f72e74c7b71b02aa |     
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/73badd60ec43491f13fcc29f96b4445ad4704023 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d0f57f502c7b7b4e49d0dd8aaaa3a29ae440f918 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b7425fa39688078bb331ad1f261b51f34513270d | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/18a1a89a5332fa9e8ad87c540f71b1a7a54fa8d8 | ORPH
  mips64el   |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/090207ddcb2628b2926f7c271ce1bef9496df705 | ORPH
 powerpc64   |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/16379fc63dcece3238d843306bd5f4bf7962a986 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/bc00b60bb7c5f1f2d67f783a8d832c2a386d5a3c |     
    or1k     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/c0238a76c10cf240719ca7d26dc0a3c253a601d3 |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/7c8dd26be5675e41bfcb93884240bc3b6c192637 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/22e33271ccd5cca34781765a89a1e4f063d64252 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6623d5686fc1a3489ed66672a976da9faae450fe | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d66b1dbeda174bd5180cd54c8b9a8f8d91647fd4 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8628cce3b44696f2c140610b211ab8e0fb2076a9 | ORPH
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/988faf1c7741e1cea476a4d04401313cecc64edc | ORPH
   sh4aeb    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/fa6dce8c05f20d7ad2a60cadbaf8b6147ad2ba34 | ORPH
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5d9f0f4830cba55356df5499b0c4e9218a42ee33 | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/7b5688fb87b9510e1f5f0b6b3f49a5ad7115966c | ORPH
  aarch64    |          i2pd-2.50.2           | NOK | https://autobuild.buildroot.org/results/f6059af9cc657923f3abf067e8f18d3027932a95 |     
powerpc64le  |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/357284d35ef5945e318cd993e7bb72d5e53aeb99 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/30f48b2e64e8600cf40326b18e3ef11af74c1e9a |     
   arceb     |        iproute2-6.15.0         | NOK | https://autobuild.buildroot.org/results/53891016f9acaf1e201cafb1c8579bd7fb44839d |     
   armeb     |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/1f0be8f10ee17ea5441ae9c1f93109cfdc0ac6bb |     
   mipsel    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a25e44fb606f9831f7c4ee6cfb11bddf37f82b3e |     
  aarch64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/82c3da7eb6a7ab5b30148cf27536958e9a350b80 |     
 microblaze  |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/d7e78afc2dfdd0e0296680d38cf28cc5a1fd4bd1 | ORPH
 aarch64_be  |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/4cde2e48657f93e8f71f79ebbc2cf33f57518191 | ORPH
  mips64el   |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/81983a0733231a75bbb5cc029cee255981312970 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/57c723b61e4feb8d76841dbffdcce211f30ee48e |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/89a7f137568d7e5f3f410b285befc294182de597 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d642c77c7b1b7f09a36c2a35655fd264f9b52a4f | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/71c9093991251942931407ce3eec057e030715f9 | ORPH
   x86_64    |          linux-6.16.4          | NOK | https://autobuild.buildroot.org/results/0221e5ac84f673c3a65f159af66fee732df546ba | ORPH
  powerpc    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/5a45e0d9356ae92d7868985e8d2f96ed8aea8da9 |     
 powerpc64   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/35e52ecdc91100a80bb69a33c6cc578f5c216956 |     
   armeb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/5c281b6e861cf7a2ab3a87734ea15bf51c32f334 | ORPH
   sh4aeb    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/2c6daa32388a3e593bb896c826deaf76ce4d4931 |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ace78d1dbbfc3ebca19bd25ec304b499265bb7f8 |     
  mips64el   |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/28e61ce4a72e1c368762def6829e3ca9c039ed2a |     
    mips     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/ef197b993f55af75c0bec9397b2a6614926b9a0b |     
   sparc     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/4c09219bf4915f725b452604fae07b75da4ce60d |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a80e40eb4407c74213f97e221929244e19c47f71 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fcc66ab3c1239ada3e2385cec4dc0fb6688885a0 |     
    arm      |        netavark-v1.15.2        | NOK | https://autobuild.buildroot.org/results/f4f528012ce0facb96a61872946c5e6c4ad1a740 | ORPH
  aarch64    |        netavark-v1.15.2        | NOK | https://autobuild.buildroot.org/results/a3d978bda0ea3bbfa90e63df469b0299b349e759 | ORPH
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/ac0b4dd00cc7f952249f9658f5e656cc9c249ce4 | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a656a2598a454003d5ace3fbbbf6569bd3a9fb52 | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/4107c71e056548adf256d4af0c72c03a09eb0324 | ORPH
    mips     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5e0cde71da89ef4e0c212410126dfa2baf485de0 | ORPH
   arceb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/63a28a495dc67e2c8306c9d0f5b527e61453298d | ORPH
    m68k     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/b157fd188083d45e7d7621d50be5469f9adace7f |     
 microblaze  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/6019eea9336511afce4287f31490fb7b8c2fb78f | ORPH
  mips64el   |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/bd9aa0623c6e70f20c31f72989e28c54d6c769ad | ORPH
   xtensa    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/631c81bf9fa6f2741a6e4d3b4b06aa87af8ba836 | ORPH
   sparc     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/970c16d07cb71f974fe7fbce74e07704fae8369b |     
  aarch64    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/a2c4adc2a5a2be88f6bb533163cb70d7d578f3bd |     
    i686     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7f8edcda8b2d0ffc0ed80671e0087a17d15ff2b5 |     
    or1k     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/e9ee5bc4e26cd14ebc19ea6dbc3cc7a099eb9be9 |     
    mips     |         rdesktop-1.9.0         | NOK | https://autobuild.buildroot.org/results/c0efcbaf6bd17c00762e4c03962dc4a391847379 | ORPH
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/4eac0711cf85a2f614fab09e3d1f2bfe9f369fa1 |     
loongarch64  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/30a83910a27da756a1024983fdb3ebe5ff9a1b03 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/b1f8c6956646d83130984cfbada27e45175626b8 |     
  sparc64    |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/5595524134417a28969c230a3225842a41c921bf |     
 aarch64_be  |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/02cd92d1471cae0e00f77d505487ce12e550ed92 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/b3d1665cd381cbfe60825944b2c131e6756376fa |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/1a43b906c37bfa25bd361652b4e390cdbb2df7e4 |     
   arceb     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/cff7cb6cc216d7f7def578de8e39f579393c5bdd | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/af22a2c776fccb0ecf306b2ddae5eee8d27cba49 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/943cfbf5cfcf9e753314b68f7335610581475db5 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/f61bbccb0e702d537fb597ad75b099bdce47991e |     
 microblaze  |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/0b872a3c56a1876a04addc5a8c8459806c1a6e71 |     
 aarch64_be  |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/2a70aa63655040bb5e9dad2324aede4591272032 |     


Classification of failures by reason for next
---------------------------------------------

libdbi-drivers-0bfae6c43134... | 1 
                 libgee-0.20.6 | 1 
        liblog4c-localtime-1.0 | 1 
                liboauth-1.0.3 | 1 
                  prboom-2.5.0 | 1 
                python3-3.13.5 | 1 
                 siproxd-0.8.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/69c86f453c99f4338117e8c4d309328a793885f3 |     
  aarch64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/0e8a66e89e03dcd47d558e96ed17c3a5149a2949 |     
 microblaze  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/f3672f990d633e2cc74e1da1842a3dbac135da81 |     
  powerpc    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/4a2c352bbb5c27b17ac9a532e69f880f1e06aac6 |     
   armeb     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/ee3f4a0b124dff141d809f30fa74b1b56a233b05 | ORPH
  sparc64    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/a419f20fb111cdf2e78da88670e9d535f093bcf8 |     
    i686     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/910d617059e8301bd2d543b2fe4ebac60fdb9a45 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 2 
                   cvs-1.12.13 | 1 
  gobject-introspection-1.82.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                 libgee-0.20.6 | 1 
          linux-5.10.162-cip24 | 1 
                   perl-5.40.2 | 1 
                ramspeed-2.6.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/65a955e67e6b3a6d033c381fa8fa476b3f4050e2 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4b0d472b01f41e3547340dabc358b8697380ee30 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c2c6ca902fee823dd29d1655e9c931bb7a59c1c0 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d8ca5db96000f4878521e41e918bd1a866f390e9 | ORPH
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/546fc979941f3f789f82eb1271d098fec2290fb4 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/674d1b15165931888ee5139a1cecac744bd8c361 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9590ca4ce235ab6478771e4c83bab8e2d5c8a32a | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8aa56be998f19cc350145a0c936d81d9de7847ed |     
   mips64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/ed647a1efa63d84a9474278d23980d8ac21e89f8 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               libsigrok-0.5.2 | 1 
                    ofono-2.18 | 1 
            python-yarl-1.18.3 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/c4e0fe20b7c5d5384686006c8ca04fbc43e78704 | ORPH
 microblaze  |           ofono-2.18           | NOK | https://autobuild.buildroot.org/results/eefad562652e7cd4c4d6cb3df26d6131b8e52182 |     
 aarch64_be  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/7f3df4a1978f8522b03b446aee370eefcf10b6e0 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
