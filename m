Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD4ECA101E
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 03:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 233BF80F08;
	Tue,  3 Sep 2024 03:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeQ5QtunVFzV; Tue,  3 Sep 2024 03:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D072480EFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D072480EFE;
	Tue,  3 Sep 2024 03:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB0BC1BF867
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 03:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D996280EFE
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 03:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nP9erSc1LeXp for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 03:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60BE480EF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60BE480EF6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60BE480EF6
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 03:17:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42bb8c6e250so36597145e9.1
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 20:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333423; x=1725938223;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eJhcxr1qbR5Fj1jwJ5BhpDawpWmLsv996jKCa5MVYoQ=;
 b=tBXu+orcHTguq1eaDwH95JqOijRTTQvTtgf64JAgUGxlVKH0DVLAXsXEGGD7v+Ca02
 i8VT+p2qKqcUiwaeaw1GHMgqxKBfCKje4JgLsIffTx0yzP0VJCKS3JzbuyHTQhscJ5Ka
 xG3Zc/E25Y+nfrSvA5GHEZVT6peRR7mFsJXnVBziImeomq/fTgqyPkibUY2rFJbpl46I
 oz7vq+I43/t+LZVRTrIiS5a4E+PXlxhGgl+YQaKvYpIwa2sxzDen4kGRQ9eZPdrQPz9g
 I/OY2gRkWBafe9Yawf/oOodIkr7gJByIpOqzwbzTzK8KQJNfPtpto3igJeqPz2+tkqM9
 Ynjw==
X-Gm-Message-State: AOJu0YzOSeu3Bx+Xd6d5kkKMYUhKF1s3ol0po5qern7B+ZkiCljzrmva
 ptCOX7Qpm/y4Fuu4jGi92RcCcNP4aWM+M3X054UUx8C6lBAMhu/61YL1+Q==
X-Google-Smtp-Source: AGHT+IEKKXhJSollkjee42+jBlWYsMyZ0s0g33SQLqo+zMip1kqkfYBjJrqVxEMih2hzgdp9L0Bi/w==
X-Received: by 2002:adf:f250:0:b0:371:7dda:d7d9 with SMTP id
 ffacd0b85a97d-374c94554a5mr3634496f8f.9.1725333422278; 
 Mon, 02 Sep 2024 20:17:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee5080asm13228643f8f.18.2024.09.02.20.17.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:17:02 -0700 (PDT)
Message-ID: <66d67fae.5d0a0220.12217b.2bda@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 03 Sep 2024 03:17:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725333423; x=1725938223; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eJhcxr1qbR5Fj1jwJ5BhpDawpWmLsv996jKCa5MVYoQ=;
 b=YDy0aj+l/kgF3TDh+5iKMZYQN7fYGgBSMb+AFOAvmORgLEiYzKUSROGUGtIkCq/ZIW
 63l7oOzoiOLNn/li5smQm8daj8NCrY7RxtxsvnYPRFSTaSrw4VgGDnXZR577QGfakkQt
 6fvXIfuj5F4LzX5aUB5SynVHOeinWzOWG0l/957agNDJbZg+wQdWE5PqCd16TLKumEkY
 n9IrJFykoQXF04vCIy+1PJl/HiOGWZniwiHLzF1RQEgIgwYiIMA+PXj9i0unFjk0Fr4K
 4uIa3Hkmlt8APfhoZmmbJoZsrr1DbAw2zcakRK8FcbVgsyvcFWR19wZssnva3B/Hw3iX
 2e8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YDy0aj+l
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-02
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2024-09-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  8  |  0  | 17  |
  2024.05.x  |  6  | 11  |  0  | 17  |
    master   |  4  | 254 |  3  | 261 |
     next    |  5  | 16  |  0  | 21  |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 27
                  linux-6.10.7 | 19
               ipmitool-1_8_19 | 14
aubio-152d6819b360c2e7b379e... | 13
          cryptodev-linux-1.13 | 13
  gobject-introspection-1.76.1 | 9 
               linux-pam-1.6.1 | 9 
glibc-2.39-74-g198632a05f6c... | 8 
                  ffmpeg-6.1.2 | 7 
                  babeld-1.9.2 | 6 
     linux-5.10.162-cip24-rt10 | 6 
               mariadb-10.11.6 | 6 
             armadillo-9.900.2 | 5 
            linux-fusion-9.0.3 | 5 
android-tools-4.2.2+git2013... | 4 
                  cairo-1.18.0 | 4 
                 coreutils-9.3 | 4 
           host-doxygen-1.8.18 | 4 
                 libvpl-2.12.0 | 4 
                 pixman-0.42.2 | 4 
                       unknown | 4 
         gobject-introspection | 3 
           host-librsvg-2.50.9 | 3 
          linux-5.10.162-cip24 | 3 
                  ntp-4.2.8p18 | 3 
               valgrind-3.23.0 | 3 
                 apache-2.4.62 | 2 
           at-spi2-core-2.50.0 | 2 
                 c-icap-0.5.10 | 2 
                   duma-2.5.21 | 2 
                     file-5.45 | 2 
            gettext-gnu-0.22.4 | 2 
                 gnuplot-6.0.1 | 2 
          host-elf2flt-2024.05 | 2 
         host-libxcrypt-4.4.36 | 2 
                latencytop-0.5 | 2 
                 libv4l-1.24.1 | 2 
                  libva-2.22.0 | 2 
      python-autocommand-2.2.2 | 2 
                  whois-5.5.14 | 2 
                  acpid-2.0.34 | 1 
           alsa-plugins-1.2.12 | 1 
                apparmor-3.1.7 | 1 
             batman-adv-2023.1 | 1 
                  bind-9.16.48 | 1 
  binutils-arc-2023.09-release | 1 
                    bsdiff-4.3 | 1 
                 erlang-26.0.2 | 1 
                      fbv-1.0b | 1 
                      fd-9.0.0 | 1 
              gcc-final-13.3.0 | 1 
                      gdb-14.2 | 1 
                gerbera-1.12.1 | 1 
                gnu-efi-3.0.18 | 1 
               graphene-1.10.8 | 1 
             host-cairo-1.18.0 | 1 
            host-ccache-4.10.1 | 1 
                   httping-2.5 | 1 
libdbi-drivers-0bfae6c43134... | 1 
               libgtk3-3.24.43 | 1 
                liblinear-2.45 | 1 
              libopenssl-3.3.1 | 1 
                  libsepol-3.6 | 1 
            libsvg-cairo-0.1.6 | 1 
                libxml2-2.13.3 | 1 
                   linux-tools | 1 
                   lsuio-0.2.0 | 1 
                   ltris-1.3.2 | 1 
       matchbox-keyboard-0.1.1 | 1 
                memtest86-6.20 | 1 
                 mesa3d-24.0.9 | 1 
              mosquitto-2.0.18 | 1 
                    mpir-3.0.0 | 1 
                   p910nd-0.97 | 1 
               postgresql-16.4 | 1 
                python3-3.12.5 | 1 
                tpm2-tss-3.2.2 | 1 
                 uclibc-1.0.50 | 1 
           v4l2loopback-0.12.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/4b02af5bf11757bd368f1f9ce0810086bcdaf0c4 | ORPH
 microblaze  |      alsa-plugins-1.2.12       | NOK | http://autobuild.buildroot.org/results/495ccc643a0687053a2796d725ff8c12ac507e18 |     
microblazeel | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/3d7289ba06776aa060e34b1a8f1eaa4e610d202a |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/d46547c201f0794c68eef8c527cd2c2afd6dc821 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/7c21e2f3bce58d57a3cebe324ce671534eddfa4e |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/a8498efcbf9699e1dff76e0f28881d6703206e09 |     
    m68k     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/04ae3edf3f8105d8b1f6e6b828e481415024d9e4 |     
 powerpc64   |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/a2a26cb6635375344f0b357b2a52c01b48c7279d |     
   arceb     |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.org/results/9c80d3b33e1e1f6159429df9d82b6a81cfa0a0b0 |     
  mips64el   |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/22a427343b34c705a60e5edc8ecc7884a16d163b |     
   armeb     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/fe48b8b391c2442123265d1c2eea32e58d8faa98 |     
    arc      |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/d628e9ff283c580e059c8566a2c661728784f9c7 |     
   armeb     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/6479974dda072f960a9e48dee82e441268bbf006 |     
   armeb     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/a43aba2ffc07e125d152b2821ea47cbcef3438f8 |     
   arceb     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/58f22c38ba817dbf90ae7dca7fc8543483b6bb18 |     
  powerpc    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/adaa26fc98b4af36c1bf074cd6208ee7de7ec0ff |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/6820088e43ac3eb7d62ed2f1e005585f2c1f4f6b |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/4c3ade75c1baaaddfc10d91db971a5184194333a |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/5b42f65f9d9aaf57e7ed94641d7cd6d40ee468bc |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/d94aab90b260e340c91cc903a8e6bb6664b1ddec |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/016f168f9e7c26da785fe973dcfd39dcc01e1a79 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b3dac6f980dca95fe89f4495cf8882231375f3df |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/e3a4f8ed0b58259f162e1558c25e32ef1b737bfc |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/8295acfc85a27c1023a1d33bf3ea0b40d2c1c771 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/0623ddda097fd9ad04df0a7ad49cfee340b0ddde |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/2ae29e5e8a466b8ad241c5007081be586aba8461 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b3bbde5bc8b6e231cee59f4c23f43d76dac8d323 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/ae9ed815584605261a92bf9f5180ee483d622a78 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b8d9c21e41b6e9ce19337b0c8fff8f02be7688b4 |     
   mipsel    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/4953bb8dbbbc926750782fbf9f0ba7be73fac28a | ORPH
    mips     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/6aa30a6ca08fb7f9ed202cd11803abf466fecfc9 | ORPH
 powerpc64   |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/a230cd9d42e625b5b757bfd88504fa7733ab14d7 | ORPH
 microblaze  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/4047565938254ca6446e6b89a9fced1d7224629a | ORPH
   sparc     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/c34d871413e9d56ec35509990f46bb1c035f4280 | ORPH
   s390x     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/daba88583bfb08494b4f8fd101249daa60d3c398 | ORPH
   mips64    |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.org/results/faf0ecba7cb85342506460bda7b5c385b2a024be |     
 aarch64_be  |          bind-9.16.48          | NOK | http://autobuild.buildroot.org/results/3ea626502d093bc5b5d086137dcbc1ddf05a9127 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/4da404ae22f689413394cd4c7fbd66608ba37478 |     
   sparc     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/5ae34cdc6c91e6989661f20e02476b7dd959b429 | ORPH
   nios2     |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.org/results/bfbdae56f64877cfdb8e5cc4e4c691e964ca4531 | ORPH
powerpc64le  |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.org/results/f86d96dcaae1c7e16592eb29e0c4f2d49d19d0c3 | ORPH
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/6bfd09045594b9124ca4a71c4c001428b18073e2 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/2a15b28650a80eeadb2df5464a939fe9e8c921a1 |     
   sh4aeb    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/893dccc552c02a326b97d780035912fdaa397dea |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/c909345ad9ca4c1e0b48f35b5bfae3f18a6536fa |     
   s390x     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/941d5053731e072ba2f42877a4c96a6f65872548 | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/6c9d19bfbbcbac065025b27aed5175be4d9f0f8e | ORPH
   s390x     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/d625c284d4ecb86db915ff195935fc303d503b4a | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/99aaa11a7bda107a6032895a8ce0634401d212a6 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/cb2998d94d62fe798e995ae89b826e1e67950731 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/b1dd7b4773221f3166a1f0f90f17a808f70e02e6 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/834a7a62077d88fec992c3d9a75952880b36b1e5 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/e44ae4d764de405427e1e46c3b5fb941de1305fb | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/ec9ef793e50a4ff594654bc027e6d3592c0dbdf0 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/2c5d75a77bc40a8f9141a14df785840903c11707 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/7087a75fb9f6dba9c098580561cedd2f56696740 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/259395eac308574ce394099e36e0d084e279efc7 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/0e01430e28fd296c925e05b7b564a5463115dc55 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/b230854dd4daad0af7b9fcf997e3975f375cc478 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/8befa9b1bb1f3fb2ae192ef19b3116f882904c7a | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/2c630e59154e2da23a58854fae2525e329104285 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/bf98b47d4d4040914af0f4aba8d12127a012976f | ORPH
   mips64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/6634d65a68bb8d9db5bfcbd9809a1809c17a51d3 | ORPH
    or1k     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/7908af1334f5f0094c7de936b12b7580337c422c | ORPH
    arm      |         erlang-26.0.2          | NOK | http://autobuild.buildroot.org/results/6cfbe9550507198c9aa73ab83a1f2a46d3d58772 |     
    mips     |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/3b997a30ef72050216aa595d7fc5c4124707593d | ORPH
   x86_64    |            fd-9.0.0            | NOK | http://autobuild.buildroot.org/results/1711172736d24756579ade22954baf28ac4ea5f4 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/7360d192422f4ceb5207cc7d5356ab6468d192e8 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/add8a405b1f916d10619e3d3412996d1da702931 |     
  powerpc    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/be87ae5f3e95397e618d641a5cae6a9a4a9d6d23 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/49b1c24bba877a11bd803a5c1eb3f5847be8c64b |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/ab8b2f8d25cced7c67ad59000cec491d993f1d19 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/1fd2cd1c660df6fd3ee82d18c95bbc4420719ead |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/72783712444aecd91baa577216992f4f3f7a2c73 |     
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/fa1a64cab4315f116bf4e895d02279efce5736f6 | ORPH
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/71275fd592236d1f6528858afb2fe76f4b476a7d | ORPH
  powerpc    |        gcc-final-13.3.0        | NOK | http://autobuild.buildroot.org/results/8668ca116b2d0b05a9728f43db33c9f74b04502f |     
  riscv64    |            gdb-14.2            | NOK | http://autobuild.buildroot.org/results/f904927797d1a74f8f7397da8f1d26d643ee8938 | ORPH
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/eb687c04eed85efb8fb968eddfc045b44741ea8f |     
    i686     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/9b4751c6f5f83ee0ed71eae6539aa1ffb7e88fc7 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/626ee127e852aab2f0425c4a97b2788db8a22fda | ORPH
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/59be0c0268981934022339a0def0743df79d4c97 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/44d020c1fb807df76bc82b5f76ca5fc15a1beebb |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/dcebcda86ec9281ee932029cc3107ede364ca519 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/eb177985e308e1c1a2093570101d6e40041f49bf |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/9f2572416f2445913b5a549f0e1d16b0ddf95b4f |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/81b930e4f809461b71a9a0664b2a8ea35ceda4f0 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/4ba1ad9225b4fdc65487b7aa443eb2015a16a333 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/3008d000c7002618bf8ca536edf9fb355a669254 |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/4f8b1af332bdb2a76a07e48fb9234cab0c52a8a5 |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/3abdc01e3dd9de57706d9fdaab7356e8ee4ad98f |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/f6588da64aba8777829a4bf4cca5791642e63d94 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/98ee13c9138b2a6d912f67ba2dd39138ffdf6ae0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/1352c992a5e6ce2fdf5324333b40a2ac30b6be56 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/fb51871161f771ad594202773933ad8c22776155 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/9b1622d599887fc955ade8a510fb257cfb405758 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/7ba3ab2e3e4dd5561839d5cc7cfd1e48d19da64e | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/702f5817019058c4d9f4842bcd572000e9e2756a | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/ff655f1e716f992377a850e3482d04b3a5119257 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d03785808e1f5c996c6d7af49ffab1370eb74860 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b65b823c3a9bb96e928de95ce7a47ef41a03ee15 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/97ce8b5526e69b4c0599d4f087bfa165f11ffac2 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/eeded396fbe5724d9677b9c5c8a77c2bdf246696 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/bcf01a19f38d4b0e5e3c40db50104076a1b2fe17 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/e2c6c4c1afc660dbe27196f2f649fc8976a8899e |     
  riscv64    |       host-cairo-1.18.0        | NOK | http://autobuild.buildroot.org/results/913610945000b21c49fc0a30041e0dcdc61433f5 |     
 powerpc64   |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/24670d5f76a12e15626e6f426b86748a41d653dc | ORPH
   nios2     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/fb6bb47511c622a87cc624cba6993e766f8b9ae6 | ORPH
    sh4a     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/15c4328923c89928d928af44ae3014550b5e34ff | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/1b4f8090fdd724ee4c69a5f6d4227e4f73a2743d | ORPH
    mips     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/511b4cf54be4afb8da807e74f5b6e780f9973e92 | ORPH
  riscv64    |      host-elf2flt-2024.05      | NOK | http://autobuild.buildroot.org/results/8c78fcfbda226cf1dbc4b47578f3514ee3fd81bb | ORPH
  riscv64    |      host-elf2flt-2024.05      | NOK | http://autobuild.buildroot.org/results/5685f019b9adf8623e11d60f2a0f86f91315c582 | ORPH
  sparc64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/99bbc68d2b0bcd5fd40595417fd8a756751ee06b |     
   xtensa    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/5b4e3426ddd2aeb4d40485552e84a8c1d866d6f5 |     
  mips64el   |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/1b8da8105661d194ecfdf82c75f5631042c019bc |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/4c8f22878427215da05bd30f4e16671cfc477879 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/4938d4ef767562b18251eba5af7be8ae41b897f9 |     
 powerpc64   |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/a7f9b13a2dd329ca9c5d00c12d06d472791eb99c |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/fb32d75112aa1d242650a5a7cad458ee9021d556 |     
   sparc     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/052e4508b2723156724f28e29f14668a67b2ef98 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/7c4af32e729a742ba5ff8f868f2fd72f3bbfdfa2 |     
    m68k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/4e5c41ecc009fdaafeecc3ee6a0c23a87ffb5a8d |     
   sh4eb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/e53a83ce126293d97c545adcd68ae2b2841d5af9 |     
   sparc     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/7bfcf23cb701464c3e3ba20788b89ee53cd9d157 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/ab00fbd4b9a36fd3a290af74c8727c8e6afee8af |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/0eaa51d1a137c21c7a873b738f5b80713239e226 |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/442b74c81b4e22abdfa04fac07794b980e317714 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/0d5be69583768c556fdb7fb257ef3740019ee5ee |     
  sparc64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/eba519e3900c94bb6e50f175fad96d402fc9a741 |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/b2bb59a2a6192f26289e91d39cc7e483455620b3 |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/17f4438ca7abb797df3206344d46155072d7bbcb |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/ea5fb632a44ad47cfd1fbc5ce1d8e263b9e5bd7a |     
 powerpc64   |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/67f3727792b1a24a2259ead5138b6b5d84e44f36 | ORPH
powerpc64le  |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/43a9daa5b61d20ac0faddbac9eb6cbcf403db850 | ORPH
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.org/results/de3b350a8b4708abfc6290964bbde6ec081a33ea |     
   armeb     |        libgtk3-3.24.43         | NOK | http://autobuild.buildroot.org/results/7396ba44bca20444d5e4e4f2e157dd0274f0d558 |     
    or1k     |         liblinear-2.45         | NOK | http://autobuild.buildroot.org/results/a462dac99964fc914427420cc9af8a7482904e32 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/cc9c36290f238260ae0ae7f1b8b291af63507c35 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/6b928eb54af8fcb78e3f0f6bec7b072ef18fd3f6 |     
 powerpc64   |       libsvg-cairo-0.1.6       | NOK | http://autobuild.buildroot.org/results/c823cad5682ef4d628b26c80dcf22c98d243c37c |     
   mipsel    |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/1b95428d335548a0c72e583236269945d93e3554 |     
    sh4      |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/e9057719ded6c33cd49d3c3d1d814eb293f36fce |     
    arc      |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/bf8bbfa9e1b014ff8c4978dbbbf0d8e24b36b23e |     
  riscv64    |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/f10d13a81ad37e423d22bfa47020d8c41f6e9f8b |     
   mips64    |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/fc0e7a9fae8751f95b83d48f8f37e7c9f6845591 |     
   mips64    |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/ecf85639afda581909566f2754e01f5493a5b6b4 |     
   mips64    |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/de692dbe593960d92eb5e5ab1d582082b2cefca8 |     
  mips64el   |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/594a37871001207a3e8517ef8593a7493e16f6bc |     
   x86_64    |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/c5ed71e6768dcbca3155ed054c5b7a8352b1a43f |     
    arc      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/dbe125c38ec96182c202515d2925ededd324bf9b | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/36fda229ac56d0aea94ec561b6b6cf4c7d3cf6cf | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/195223784c3e8626bd432f5ca147e9dcb77bab33 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/eaf1278bce7166f9953cec0a94236010429c0a15 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/12c8d2a4ac4a5a208ce7b23bfe324669cea4f73b | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/5577cfeb8bfcec8b232960266559c9681d1d1217 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/e7d7422be0f256af1e3c7ad10e947c8bd549ceec | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/0f6166684f1cabb96faaf6b3e9ee2cc6337f7e31 | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/8cffc2b955740e0081dcf355460cad2c6b08c95a | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/dbc43ec1f82404a7661a85e1e990c8abb80b8188 | ORPH
 powerpc64   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/b798e44f5880b1c578720e9281498077f3b50a30 | ORPH
   sparc     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/4159429dfe75027000729b6bfd99ab0430defc05 | ORPH
   arceb     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/b0e6dc4f578095c0c3d0180574b643f44c61a693 | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/40a4ea4f44d9ee9b02bf0bb9f396da9be85d5fba | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/27beea7aa0423c8610edba7e13783864ba8a20c4 | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/dd20cefb9b97b49ccb38ce2ffac75cdd74cb00d2 | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/6bd3620330a9efce87bb69179e3af8843e668403 | ORPH
   sparc     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/b1f808de6c9d129276f07ba67bccd85a1fefbd1b | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/2ab245330245d6d6c8af460bfd95caed755efa70 | ORPH
   mips64    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/a8be7aa7ca2813ea129d3d0bba242d52f62f602e | ORPH
   sh4eb     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/0d87d59789dbcdea3dd5c079eff7620f9ac1e135 | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/fb634f10245984446217aa488052022a522efd0f | ORPH
    mips     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/3b00faebf289e6b0471f53fecb07994d9eecac43 | ORPH
   sparc     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/da1362ef39f46ceed1f502bba95eb2d843206ac8 | ORPH
    arm      |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/cd4a205c89daedef70177e6998401d71d77f2e6d | ORPH
   mips64    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/b265a71c2cd3e9f65744657dc9c9e2228190df85 | ORPH
    m68k     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/076e0aebd41fe4dfca293bc7e49f72307dd623a7 | ORPH
    arc      |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/d0457ffcf4c7f4b0b9f991ca76eca67188162ec1 | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/913b9883abce2a403b2b7818ff03b3896881c7a5 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/6254bbf31f05c654d09dc2bac0345322d724e14f | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/eed1864ab34e36ef714d7f226a01ab19787b6f2a | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/e9a90e4daa4ce2b1b2ce4f1b4a9746b221b87721 | ORPH
    mips     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/2369020d3452860cc3513001f88e82eb70ad44d5 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/1de348442d1a36f45903273f1d45043418335157 | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/b198dc46daf33775a8297b8a3dcd4777eec839fd | ORPH
    sh4      |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/7a5d97f27797b36ce8abcf1f5e0241b34e8a7666 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/4f9b35dbe47f19083d569bf3e102a3164dfc433d | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/212f78fca6793a75daf17972c3008596fbc66409 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/71653b6a836c3e0b8b2f7b9ea9927f3b9d2726e2 | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/69e7c0cde13fd52bbf7ce0a66f92f17457de830c | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/da1259b0a9f8e1b607df03510890e8d64efcb79c | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/288903280dc72f3f1870e6e2c68181624f882cee | ORPH
   armeb     |          linux-tools           | NOK | http://autobuild.buildroot.org/results/1fdc1fdedcaa1abb66917a2c46de752605f51a70 | ORPH
   x86_64    |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/545e59a9e0f3016e39c8a38910a97c221a8d4a89 | ORPH
 aarch64_be  |          ltris-1.3.2           | NOK | http://autobuild.buildroot.org/results/c80d1f9ec6b7b572f62e95c7b41875af88984d70 |     
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/3dc1332e15cc935de853bff01c7914d5b20f10b1 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/8787ef66ce97b72e334903fa1efee8a9f5b4affb | ORPH
   nios2     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/053f9bb27b130a4523c075ed0dc52b8046a26773 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/8fbe3ce1d222a38071ce5d79d34d443b92ff3be0 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/a17019f8ea8af74b4a9a83a9fc83353983511e4d | ORPH
   arceb     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/4efe7b28dd5bd9821402135aa0d08a47b06ac3a2 | ORPH
    arm      |    matchbox-keyboard-0.1.1     | NOK | http://autobuild.buildroot.org/results/dadfe255612a2a7caeb49377b6c73d1027a8d6da |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.org/results/b539091c86fa5680d837041834e36b4776ec1f15 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.org/results/4235e5ea5d15e1d43cc1264a57cd3766b9c1312e |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/d76f56b1e8d7ebd4dcbf44acff650f4401210d86 |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/d174917556241d7c5da4444999cb9f8ded1a7eb7 |     
   mips64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/319d8b9b8e24457183eff2abcf88e375bd54db4a |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/3bed1f807ca59e08c6fed6d6e9f8e557055c466f |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/5739d9ad6349a42c450f6153617bfc198d972998 |     
    sh4      |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/ff7695f2000e9217372afc0bdad3b574e60146a4 | ORPH
   mipsel    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/6a5a2911fb7a7f354600acc9370e3679a1960f73 | ORPH
    mips     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/aa52257a64b5b536bfebd00036bed28303470256 | ORPH
  powerpc    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/1838d9c9b8fbb950aeacd814ebd00d6c25216690 | ORPH
   mipsel    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/6e2c62fee69cb2f7cbc3463e96988696925d0316 | ORPH
   xtensa    |        postgresql-16.4         | NOK | http://autobuild.buildroot.org/results/43dea0d3b618e826e866477124284bf89204113e |     
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1e794c6b8681bf20feee573a9d0090e228d975ad | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/182bcee7d6c49b5041066157cc86897360296da3 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/dee9b96d9fb0cf4452d865542fdf60acb1e25a99 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/57bf7912bb42129cda89c304a22cda2ab85362e1 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/5babddfee37f7a9a26325bae2228c3e518f16d75 | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/5c05fc3d9d1dce226ef7dcd66489fb09a4408838 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/6f4c442e83ab86c33f5ca0d425fc27a5c99d7aee | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/e08d4eaf3563d0c365e0e7e39ef1ece656a40b78 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2e3ca4b995fd3084e1fa73d4fe1227cab052490d | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/0a4175fa60f715de73ca197d839f75c44314a53c | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f5a3718237786607fa820189b4428454adc4f306 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/bb9e26ef2e67d7f0eab0f77c673b223d67b5a9cf | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/01dad5735ff5a9f656e76d5729e3f5e689f0b9af | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b7bb42ae0f78f186e7a1dc0d500f9119d2d22863 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ec7b3c4e0cd0240d2b3dfa0e4b9971ca162cf637 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/49dc6edbd35256559518ef3a2b3daea74aab5143 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7dc3fa0d0547fca5b7cbff127b3fc410433b7912 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7f07c745dbf87f7a54d80c8d74bcfd865cca1f21 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/07681cbf47ec9c57fab288af7278feee6e1f36d4 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/49fceeaa033cf374b6ac84073cb7f34d33276686 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/34ff5d40b09ec1304b526a21b969154c18ab7237 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/486d407f558f0859c62c9f22fca390df00e60466 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/856549e29f6a4c32cdc207720b06ab2bb041773f | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/90bb392ce463d0af77adff1f16935a410c8f3322 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f22d998b4b343adadaa4bfbc8dc9f3ea65951eaa | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ca9726f31640009cc21157b4e6870740ac447780 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/5666d9e9e71ffdcdf97584a7ffcc0dffbf2b7e2f | ORPH
   mipsel    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/90ba4d31cee6017eb746c00eeaf1505007b7c482 |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/226e8dab3b232d6cccf876798e294cb63b91febc |     
   arceb     |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/3837cbac7585d9cf05aa34056f25dd5ed514e182 |     
   nios2     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.org/results/5ddabd29dc756209eec85814200d3beb884eeeee | ORPH
  riscv32    |         uclibc-1.0.50          | NOK | http://autobuild.buildroot.org/results/6079874018ebf7b5400bbd43a9bc89f71d0576ea |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.org/results/1f5143ea0fe5860fa9dde6d637ff73f0501c83da |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.org/results/4a4057484769456a4316c855229ebe4f47096e2b |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.org/results/42c1ee65dacffa776e852d6ac7b2a3d5cd0e1503 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.org/results/901b8633b5844f93679e53efe01c5a01277f201d |     
   s390x     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.org/results/5048f84de923b776b51cc3f38195f4005b78b4b2 |     
    i686     |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/16d6ceaf38c8ecd6839cf42029a99abe3986522a | ORPH
   mips64    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/682a3fb59a2a0795f35270c5b231cd97789fa9fa | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/f4da5836a2a3b0786bc22f926ac66532d8770309 | ORPH
powerpc64le  |          whois-5.5.14          | NOK | http://autobuild.buildroot.org/results/718e44986ec5d37df6f61437bb215804208c5841 |     
  riscv64    |          whois-5.5.14          | NOK | http://autobuild.buildroot.org/results/b71460ca5c3ce6756be4c1593e8ab0b303f3b09b |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
           ghostscript-10.03.1 | 1 
               host-go-1.21.13 | 1 
              host-runc-1.1.12 | 1 
          libcamera-apps-1.2.1 | 1 
            libnetconf2-2.1.28 | 1 
                 x11vnc-0.9.16 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/a339661f5624e88332e5f19fe4b7ee7182493d55 | ORPH
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/de3099ca9ce78e69f242940bd5e04cb78acc2860 | ORPH
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.org/results/ec11feeba4a26c45fa21f7cf002806a0fb5429a3 |     
    i686     |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/22dfc552f3bc6b272050e5e0bde82a24693b7d6d |     
    arm      |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/93f8dc1c3dfb5962fb66859f5b569cceb6ea2b3c |     
 aarch64_be  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/e79c94d87eb0abb23af34f99a4155038d89288a5 |     
 aarch64_be  |       libnetconf2-2.1.28       | NOK | http://autobuild.buildroot.org/results/7186a59e0c524e6b62ca6311aa4fa645d4bc00f5 |     
    or1k     |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.org/results/1b032f3de8309bea2bcae8a413bf72ddfc0cc70f |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

              host-runc-1.1.12 | 2 
                 dc3dd-7.2.641 | 1 
host-heimdal-f4faaeaba371ff... | 1 
host-prelink-cross-a853a5d7... | 1 
                libressl-3.8.4 | 1 
          linux-5.10.162-cip24 | 1 
                mongodb-4.2.18 | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.24.0 | 1 
             sofia-sip-1.13.17 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.org/results/47a8732b87034357ab76bb3fdbaaca917028a645 | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/b516c17e960b8d5471ea6cfcf371c0a2b0780d03 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.org/results/0a168fc277148b7cf8b58a946f175b43fbde90e2 | ORPH
    arc      |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/7a5f431213d8a0035914818b2e6e5a0a5c60d580 |     
   arceb     |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/39c2276546d4434e894c3571887270e7b76833a7 |     
    arm      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.org/results/a641d6ec66f86f7bf1695a364658e9a7d3e0042f | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/ab05f8cdde314933695485fe9aa205bf11b23a94 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.org/results/6a3a81347572f7685fc3176a80320f7a896d8388 |     
    arc      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/100386ab71388bb05473c924bda1277c9cd4e257 |     
    arc      |          nginx-1.24.0          | NOK | http://autobuild.buildroot.org/results/1c0d54f9af334527019da177bb74a43901084652 |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.org/results/55f38cc99d5d067b5fe6066dd835062980fcaa2d |     


Classification of failures by reason for next
---------------------------------------------

                   atop-2.10.0 | 2 
                  fbterm-1.7.0 | 2 
              host-rust-1.80.1 | 2 
                    norm-1.5.8 | 2 
             bluez5_utils-5.77 | 1 
                 dc3dd-7.2.641 | 1 
                gerbera-1.12.1 | 1 
                     gzip-1.13 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                    mpv-0.35.1 | 1 
      python-autocommand-2.2.2 | 1 
         python-remi-2022.7.27 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/865bbd31815e7e85abd8e26692506441c1f82d84 |     
    mips     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/ce1349837f903d3cc7e4c6d60216c3f1cdb23965 |     
 microblaze  |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/1874b11c9d072c0c68b2c4c310779df2022ffaab |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.org/results/87f67ffdda934bb3e9f25fa8a1a48e6ed2c0eab2 | ORPH
  riscv64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/a380925adfb88f32674a502c41de26773796dec8 | ORPH
   x86_64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/e9cd45099e447f8a5807cf422e6174514046c2aa | ORPH
powerpc64le  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/aaf054b0bb336d45203b0d869ec6f9e00528ec8e |     
    i686     |           gzip-1.13            | NOK | http://autobuild.buildroot.org/results/80ad3ff8576f82cb146bbccef04969865acc62c1 | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/33dfb9d840feaee55ac52015fb8c00b5eb8a6b1b | ORPH
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/102b67d73180de42adee4a503941fa8eb5b4803b |     
powerpc64le  |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/9a7a7400f55b1c4aaf61d40a0b6bdc5cd10c17d8 |     
   mipsel    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/953ea9bf820cd6f78300566d036732cd3b7a2342 |     
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/62bb189f2707e77f24d97e068859be2f69cee915 | ORPH
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/4a9fe657e65d1d099e5e6e89e0adbc7c863d2079 | ORPH
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/267dab8c6ab35d472aafe0e532abf54ab7008e73 |     
   sparc     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/00e30cc909078467b45420ff47dc8a17d5c48a85 |     


Gitlab CI results for 2024-09-02
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335305  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335306  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334756  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334769  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334637  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334889  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335036  | ORPH 
       TestPythonYamllint | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335057  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334596  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335093  | ORPH 
             TestXfsProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335095  | ORPH 



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
