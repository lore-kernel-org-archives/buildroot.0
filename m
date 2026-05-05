Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFA7FF885A
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 03:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41BF4811BC;
	Tue,  5 May 2026 03:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yg98ZmPiBzoQ; Tue,  5 May 2026 03:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1FDC811CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777951226;
	bh=ppWlTgUzbNhnTDfQJmVlsJtojDRXz6kBCAHdrbUkHSE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rMzT4QZHy3zx2kyWCRufQysX9pSTDBAzlxNg/Y8HIKhIyZbSV3BA+0FshIymVyWhA
	 AUjsO4KSFD9nEcWKY76gsMF6Go3+N9eCQhhraHjiBSZzMy8w6ZoSJxjhw1CYr9WekQ
	 qVZfXI+UFU90VXmOn1LP4h9arWtAwLhrmMrqwK1KJQNA+D3EhUF/MHwplPYhvGNnLT
	 Cit839QgQq/Q/pBPOTZKm/mKV6HJHP/48WzDPymZYs3J2F2VdkFkYqbsN6WC1dHSCT
	 +ksjatuCZb0sah7T9+648NcPZPxaHvElikQU2k1gJVfRGmt+4yE1P6ClzJ7xJO7JlM
	 QP14xVSw+tmmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1FDC811CB;
	Tue,  5 May 2026 03:20:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 979984A0
 for <buildroot@buildroot.org>; Tue,  5 May 2026 03:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79AFA6075F
 for <buildroot@buildroot.org>; Tue,  5 May 2026 03:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtxAt4kPf8KJ for <buildroot@buildroot.org>;
 Tue,  5 May 2026 03:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D2A556075E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A556075E
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A556075E
 for <buildroot@buildroot.org>; Tue,  5 May 2026 03:20:21 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6966d16b978so1711302eaf.3
 for <buildroot@buildroot.org>; Mon, 04 May 2026 20:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777951221; x=1778556021;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2jBLutCyXCI83Aoihk1Xwe6umDuWh95CsEUthsrPX0=;
 b=TrSjMM6qAzj+nKmn0jON320aCUYSZeGK4NArGY2hjFRpV8/muROGu4VnhZuLNhsxHA
 DK4YYbI2OOlS+jo3QVdk5nKRd6lYeKql0E5T+nfIVgopdbyF1/R2KS+dDaEWzeDnMYq2
 JKMMY34ORrJMIf9TS9RPuy0O0MQuyNJW8rdhjc1e3auYHXcgXrXNRl7jFuJRkrTy66WE
 R783D6n25Ig8bxuQUnYb2VDhvDWPJ8HJlgOPwkfLogbmOvjHeBZ4BCfwcxHagrtx6PCF
 3Q+zZ79XUIekQ4ZwHiiU8JQmNymlcgVk9l1Ax7kQw7V9/olRsQWxuMRiC5LjlkG8YEsg
 MjbQ==
X-Gm-Message-State: AOJu0YwR/5iJcit2Gb1cp4Ae/UvIV2vKPZlMORVNn16G/Fn8Zb9buQhU
 hkfbihNsBTiN5IG4dFim9uyQeig4hxeLHZ2/wVigtPovkX96xsHnwR4GdCtruqJa
X-Gm-Gg: AeBDiev2UI72OSfp1751M3j32Ud9VIOUSRB2RwR3FYm6/ysogCTUXcufLohFhH2yIu9
 NGJddKOlVFFpjePPHRi9shyb2wiPXvzmtOe0X4mL2KJ0TMZNNk2zSwYPDXKhfBiSrvrs9pyGE+e
 Y/u6sukg1hFH2zHBDFxr/VFjaqoO2pYkBxjpAfPrdTAug+eNfPJIxHRcWRJMMBb+1k+FVTkz8C/
 1HeAd/CwRAYbfdn9NxMf5q9mKnjk882lQGMQAlJ8oqbir7SeOQVb4sUNaw7/N1ZMhFnjE1ixZhX
 cC7hbp9zRSu1m+fMqSGR331PpdDIRk4du8myGkAvlFd7cWLQyRU3/UyUBcZHDwLpMtivPkQIQxh
 y7Mj3siN5lcWooIw5t/L5sGJgxiJVPJSEgA8pDwX6pGH6mWJ4WRWuQN1hD6Ms/W1dSyhz6IOEiE
 gd694hBww0spwCPPUCDxOxZ7lht0NT1ts8icxqiR9T
X-Received: by 2002:a05:6820:1626:b0:696:64ab:cd83 with SMTP id
 006d021491bc7-69697e1ac36mr6001660eaf.55.1777951220017; 
 Mon, 04 May 2026 20:20:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69689708304sm7001353eaf.12.2026.05.04.20.20.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 20:20:18 -0700 (PDT)
Message-ID: <69f961f2.050a0220.1077c4.8c7c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 05 May 2026 03:20:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777951221; x=1778556021; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=d2jBLutCyXCI83Aoihk1Xwe6umDuWh95CsEUthsrPX0=;
 b=cHFv1LAuOYuiaplNvlMd5lwMfZVV/xHEMmqWpVs5eMAe8UN9U29LekSK51MCFSQPSz
 XSxhsZxnPJFLWctucep9vkUk6CLobyjk47yR5yypApcrJ/UZm/rDSnrCs5+rCjWvGJCy
 z5SrOsWm9dZDno5wDVF/qwyDvmzrO3saGIoovg7bBNUF8WNzv1pMREMHqk4sWXrL1WOE
 8nmWyd9S9dWN8n2D0oP0hm0tOgigHdEckMp4IalxJFf1l/qYijYVuOykgIF+IsqrDt+o
 Gk/lncWJqh8OdFCf/u5DqobbBEJe8eJT56RKPWVtld9MWwwXnAm9rYbdO1BUjQllU1U6
 m1Gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cHFv1LAu
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-04
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

Autobuild statistics for 2026-05-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 26  |  0  | 29  |
  2026.02.x  |  2  |  6  |  0  |  8  |
    master   | 49  | 74  |  1  | 124 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
                   perl-5.42.2 | 3 
             util-linux-2.41.4 | 3 
cpuinfo-8a1772a0c5c447df2d1... | 2 
             libgphoto2-2.5.33 | 2 
           libmicrohttpd-1.0.5 | 2 
                  libnfs-6.0.2 | 2 
                libnss-3.123.1 | 2 
              libopenssl-3.6.2 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                   s6-2.13.1.0 | 2 
            18xx-ti-utils-R8.8 | 1 
               arp-scan-1.10.0 | 1 
             dahdi-linux-3.3.0 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
            erofs-utils-1.8.10 | 1 
firmware-utils-c42a3bc53da8... | 1 
              fluent-bit-4.2.0 | 1 
glibc-2.43-17-gdd9945c0ba40... | 1 
glibc-2.43-22-g8362e8ce10b2... | 1 
                 gnupg2-2.5.19 | 1 
host-android-tools-4.2.2+gi... | 1 
          host-binutils-2.46.0 | 1 
               host-gawk-5.4.0 | 1 
    host-mender-artifact-4.2.0 | 1 
            host-protobuf-34.1 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
              libcamera-v0.7.0 | 1 
                 libiconv-1.19 | 1 
                   libidn-1.43 | 1 
                 libusb-1.0.29 | 1 
               libvorbis-1.3.7 | 1 
           libzenoh-pico-1.2.1 | 1 
                 libzlib-1.3.2 | 1 
                 linux-headers | 1 
               linux-pam-1.7.2 | 1 
               madplay-0.15.2b | 1 
                 mdevd-0.1.6.5 | 1 
                       mrp-1.2 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.32 | 1 
                opencv4-4.13.0 | 1 
                openssh-10.3p1 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   patch-2.7.6 | 1 
           python-brotli-1.2.0 | 1 
          python-grpcio-1.76.0 | 1 
              python-xlib-0.33 | 1 
                s6-dns-2.4.0.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                  stunnel-5.78 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.01 | 1 
            vorbis-tools-1.4.3 | 1 
                 weston-15.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/1feeee1b9c8461f279e92733f01d49573e620313 |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/21075481e82ea81c3554fb8a8d938e20c8a753e1 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/a223f3619341d9ef73548d941ee915e46a8c8bd6 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/0cdcd76b87c1af29303d6f107ce35dc578f928c9 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0d6b684181d39caf5164f5ae9668514e12e2a10f | ORPH
 aarch64_be  |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/1d7cd0df9d1b6053c34aa7c89c4212cc5af7c252 | ORPH
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b9c850b7911d2a20411c6997e79795d6465a68ac |     
microblazeel |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/b9a906c0aad09e45debb1362b9e609f603d66060 | ORPH
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/1c529361b26852b475fe7df7736701d78f8c4e9e |     
   mips64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/e034f5a22870d99694e5ca2644ddc9340ab8d73c |     
    or1k     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/cf60fd91a019f8609c29b983b737bc806cc5d2fd |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/45713e1f8e706abbcb90f3e63cd7096e8bde6538 |     
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/66506df8fecd7ea37910cc3df39e556ceb590a1b |     
  aarch64    |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/e85bb07bf12c50a4c465016ae265ae911eff2bb0 |     
    arc      | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/d335a1e7a22071fea2c8c991739ee686275a8ee3 |     
  aarch64    |      host-binutils-2.46.0      | NOK | https://autobuild.buildroot.org/results/8c07b68430de71a750232fd8447301afee3aa1fd |     
    arm      |        host-gawk-5.4.0         | NOK | https://autobuild.buildroot.org/results/49273dc6d1ed886bd22e669db6844a9351072285 | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/f80106078998db6ee3a6caf5d9b64e1f37562622 |     
  sparc64    |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/b7c7aa8f55fc9ceb45a291e418d243d85e19446f |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/90b712877b54e1b59ee6a930887f0927f61eb619 |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/1b1b7d37c9a4222ddc98894f394165899013e5e1 | ORPH
  riscv32    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/c6f0e630a124221f721fded554d808da2132b826 |     
  sparc64    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/0c580863e77828ff4be88aa296a1eaa1aca8305b |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/0fc6a078185eb4dd2e32ce33efcc2a49f905e145 |     
    or1k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/fc8359e0b7392ecc9eb796f8b3d2b3711465f001 |     
  mips64el   |         libiconv-1.19          | NOK | https://autobuild.buildroot.org/results/7c166aa060aa5b406aa350ac1aa200c3a0abc78f | ORPH
loongarch64  |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/46b6f817b6a9de1a2e60d36c923e99fc81ebea2a |     
loongarch64  |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/952844e4ba5ea4d72726a2fa928736c8f25a7a76 |     
   mips64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/7f19c72b84188a68851f535af035ba732b142856 |     
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/429cee79982de70776b8aaaa722790db4f6809ba | ORPH
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/faf064fb23b3715674ceeaf961c9f1c0ef05aee9 | ORPH
  powerpc    |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/5b0fc973a40aac9b87021237407341f9a8f23006 |     
    arm      |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/9834b7454a5ea5da3fa5de4991e97e894d77593d |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/9c3e9850a677b4937d177ccffa83037951f3592d | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/8609e1ecd43bc67d8737e6cab1db868e2c3a0a99 | ORPH
   s390x     |         libusb-1.0.29          | NOK | https://autobuild.buildroot.org/results/904e161a7c553d7d3334b4960428bb46b3b7d3aa |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/84e730bd881f752fbe87c06eaae801c7ec5528ae |     
   sh4eb     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/4ac56a2f491282a98647c35daa50660bf98928ae |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/a5ccf5f9430ce0b58bd2c24a145257d18e68aaf1 | ORPH
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/c0d37ce4f5cc07a0b08d7371913dafc1a0d46f27 |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/56ea7ba251826b289afd2e9ad3ee1efb73f3a65c | ORPH
microblazeel |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/07bc67be0bfdf5edc111f175edefe770ba82996e | ORPH
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/bf85792c40f74940c82b970bee096f1cffde5b0f |     
   mipsel    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/0f5ebf1fb41f7580a863c7e3517079099a3ad9a4 |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/16fb59d97d0e36d3d0399af017bca2a86c013cb3 |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/06772fbe31ed27a035f6e7076cd9fba3e9883dea |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/60e5d024f2e5f59f958f95bd26a094fcda961160 |     
   mips64    |        openblas-0.3.32         | NOK | https://autobuild.buildroot.org/results/3c8bc78fb5669367f0ba80caacf4aeacf17fd8c4 |     
powerpc64le  |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/95f5242ed6a9597a50461b3be43ee4c59312e881 |     
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/da1254b53f281f12a8e11d3fc645745b9bd7a252 | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/2fc1af386060964f0939d5de54ce69188934f0cf |     
  riscv32    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/fdb7dd11e2cda85f548351d46c0a937b98290883 | ORPH
 aarch64_be  |          patch-2.7.6           | NOK | https://autobuild.buildroot.org/results/a3602722269c5685fb9c5ad540f1effffe44e81e | ORPH
 aarch64_be  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5453ec081640a50d77900d28bcd1168eee486185 |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/21095720921c3531316739f6b809b4b7a5029f83 |     
microblazeel |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a87a1a211acc4a96c4f834ecf926bbdd3d2d6a0a |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/1d8d63aa12518bf457e2e930b5c3e065077ccda7 |     
 aarch64_be  |      python-grpcio-1.76.0      | NOK | https://autobuild.buildroot.org/results/1f4a643d4ef99dbab9f9f760c07a9fdbc075b78a |     
    arm      |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/33ef2859c48f78552dd4a7d53b13955d3d9b05d3 |     
   armeb     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/b9e926ac89ac9be62f8910798d45fbe295333a6f |     
   armeb     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/d29f1da16eeece6565e6fbcf517c18cd2a063be0 |     
 aarch64_be  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/2f729e16e003e05fa693a3236e072707d71e9c4c |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/40b2a3a173d3188a67070b5ea59067ad0ae05e33 |     
    arc      |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/f5d840ff5a0e789174a8da36c64e680b7386e255 |     
   xtensa    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/a6a9dc6410597a1452fabf0d5c93042d226fbc59 | ORPH
   armeb     |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/cf298da5f423e6d5c5e8e2ed16ba8a6c1a1d24f3 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/24d93196f7ba6f35314d5a7d98335c0ead4765d6 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c6994e9012d1595cf7ba7e11bfd62fd5c1b28c13 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/7bc1d0c7b02754cd9bcf9ae04f400d9a7977a178 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/031a562b2b7c2f6f0f933ce1e2f593fcd00e61d8 |     
  aarch64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/199bc716a01fe5898ca0be5055b33b0552240b65 |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/2696a4c7302b1551baf043f8817c4e3aad336202 |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/9303b9dd73ee3dff5da0f417645fc5ce5f3537f2 |     
   xtensa    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/08014c597851f5182f8f4753670f2a04c9e06b44 | ORPH
 powerpc64   |         weston-15.0.0          | NOK | https://autobuild.buildroot.org/results/073ab5e7bd55c96f569a858326a5960219ad5ecd |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                    fcft-3.3.2 | 1 
                  iozone-3.508 | 1 
                libgeos-3.14.1 | 1 
                openssh-10.2p1 | 1 
      passt-2025_06_11.0293c6f | 1 
              tailscale-1.78.1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/249c06656ef483d5697d0c47d73ec90f55bd3816 | ORPH
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/75b12dbefb8af88d828ae01f64ddbf06e48f6b20 |     
 microblaze  |         libgeos-3.14.1         | NOK | https://autobuild.buildroot.org/results/07e3cb5722f3b2401fe93669232f2e8abbedc55c |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/72063b1e5348d47f81c99a0ea7f9a8cb10bd92ae | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/86477afcea8ff3633e04fe46d0648c06d225e482 | ORPH
    i586     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/aeb81009fdb4e824d3f69e9718da3bad31c5f88c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-util-linux-2.40.2 | 11
           host-go-src-1.23.12 | 3 
          host-libglib2-2.82.5 | 2 
package/linux-headers/linux... | 2 
                  cairo-1.18.4 | 1 
              e2fsprogs-1.47.2 | 1 
                freerdp-2.11.8 | 1 
            host-binutils-2.42 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                    polkit-125 | 1 
                    squid-6.14 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/08af2e469c5b2a47e1a56ea3287c193fef7773dc |     
microblazeel |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/4bb701c58d175165af513218cd286dd2d4b1aabd | ORPH
 aarch64_be  |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/bdfb34cf4607860f2f39dcc002704b4ebc277b7e | ORPH
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7c1ba6e2e2f580283d155ca5b377055d39779508 |     
  aarch64    |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/af3fb6533de5cf63c5ec983e75b916298d278a5e |     
powerpc64le  |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/9817175aba6f5faec1b193f90124f43d84ced84e |     
   armeb     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/d8f94a48c6db3a033e499362830172394606f23b |     
  powerpc    |      host-libglib2-2.82.5      | NOK | https://autobuild.buildroot.org/results/80425e037aeaf684bb06a3107c8b2f3f07fdaa10 |     
microblazeel |      host-libglib2-2.82.5      | NOK | https://autobuild.buildroot.org/results/0698a2c4d2a1d5c11f17ad24dfe7a7392607acb3 |     
    or1k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/5f3f2c187e889004a273bab78167dcec768b5a56 |     
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/98a9562bd8a27a8e88144d2aa05689d95de020c8 |     
   armeb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/14dd8e7513e2ea95d7e37b9dd56b1690ef4e8696 |     
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/353e594eb55b5e9e6a77902d7fb1dc37721c412c |     
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/01aa4d0bd4c2dd1beae47ef3e36074525b61b580 |     
 microblaze  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/c89356313592c945a83f7895c3607003f13d8f75 |     
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/249b4da9c84e4d26efe84fd73034babcf0a77392 |     
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/01f615f7a99061a12d402c1b4278f8d6533ee07c |     
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/634059a1de9ff5f0c250db6c971d2d21feae53f6 |     
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ea6db6c3de75b25fe95130d50983310196c6485d |     
   armeb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/dd2534e574b00013e5d6ac52beec87699f2c5061 |     
    mips     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/da1ff58a03ed1f6108faf92284404464000665dd | ORPH
   mipsel    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/728e55e1e569c7e0190597cb66ca85c6e87943d1 |     
   sparc     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/59b6afb5b4c38daf312a6fe660f4e4b3e7a1a6df |     
    or1k     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/06806aaa2c0a9ab516774a9947eed6ac875bb2f8 |     
    m68k     |           squid-6.14           | NOK | https://autobuild.buildroot.org/results/67fa94fba49e62f99fad124b4eb0e154559a2f02 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/40ab798c57a445027d793046b6f99d7015c243f6 |     


Gitlab CI results for 2026-05-04
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768044 | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768043 |      
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768042 | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768041 | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768040 | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768039 | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768038 | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768037 | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768036 | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768035 | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768034 | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768033 | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768032 | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768031 | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768030 | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768029 | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768028 | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768027 | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768026 | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768025 | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768024 | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768023 | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768022 | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768021 | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768020 | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768019 | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768018 | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768017 | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768016 | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768015 | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768014 | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768013 | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768012 | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768011 | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768010 | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768009 | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768008 | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768007 | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768006 | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768005 | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768004 | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768003 | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768002 | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768001 | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191768000 | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767999 | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767998 | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767997 | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767996 | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767995 | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767994 | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767993 | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767992 | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767991 | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767990 | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767989 | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767988 | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767987 | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767986 | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767985 | ORPH 
...tlinS390xz13MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767984 | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767983 | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767982 | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767981 | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767980 | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767979 | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767978 | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767977 | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767976 | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767975 | ORPH 
...cv32ilp32dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767974 | ORPH 
...p32dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767973 | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767972 | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767971 | ORPH 
...scv32ilp32dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767970 | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767969 | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767968 | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767967 | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767966 | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767965 | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767964 | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767963 | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767962 | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767961 | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767960 | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767959 | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767958 | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767957 | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767956 | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767955 | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767954 | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767953 | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767952 | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767951 | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767950 | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767949 | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767948 | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767947 | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767946 | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767945 | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767944 | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767943 | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767942 | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767941 | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767940 | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767939 | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767938 | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767937 | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767936 | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767935 | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767934 | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767933 | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767932 | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767931 | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767930 | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767929 | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767928 | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767927 | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767926 | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767925 | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767924 | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767923 | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767922 | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767921 | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767920 | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767919 | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767918 | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767917 | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767916 | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767915 | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767914 | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767913 | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767912 | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767911 | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767910 | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767909 | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767908 | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767907 | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767906 | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767905 | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767904 | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767903 | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767902 | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767901 | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767900 | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767899 | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767898 | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767897 | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767896 | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767895 | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767894 | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767893 | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767892 | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767891 | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767890 | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767889 | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767888 | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767887 | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767886 | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767885 | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767884 | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767883 | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767882 | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767881 | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767880 | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767879 | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767878 | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767877 | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767876 | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767875 | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767874 | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767873 | ORPH 
...linM68k68xxxMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767872 | ORPH 
...k68xxxMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767871 | ORPH 
...inM68k68xxxGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767870 | ORPH 
...68xxxGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767869 | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767868 | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767867 | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767866 | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767865 | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767864 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767863 | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767862 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767861 | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767860 | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767859 | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767858 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767857 | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767856 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767855 | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767854 | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767853 | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767852 | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767851 | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767850 | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767849 | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767848 | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767847 | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767846 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767845 | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767844 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767843 | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767842 | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767841 | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767840 | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767839 | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767838 | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767837 | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767836 | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767835 | ORPH 
...linAarch64beMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767834 | ORPH 
...ch64beMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767833 | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767832 | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767831 | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767830 | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767829 | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767828 | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767827 | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767826 | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767825 | ORPH 
...xternalToolchainArmArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767824 |      
...lToolchainArmAarch64Be | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767823 |      
...nalToolchainArmAarch64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767822 |      
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767821 | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767820 | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767819 | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767818 | ORPH 
...xternalToolchainArmGnu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767817 | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767816 | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767815 | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767814 | ORPH 
                 TestZstd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767813 |      
                  TestZip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767812 |      
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767811 |      
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767810 |      
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767809 |      
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767808 |      
               TestZchunk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767807 |      
                 TestZbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767806 |      
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767805 |      
                   TestXz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767804 |      
               TestXxHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767803 |      
               TestXvisor | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767802 |      
             TestXfsProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767801 |      
             TestXenArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767800 |      
           TestXenAarch64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767799 |      
                 TestWine | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767798 |      
                TestWhich | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767797 |      
                 TestWget | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767796 |      
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767795 |      
          TestVorbisTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767794 |      
             TestUsbUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767793 |      
                TestUsbIp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767792 |      
              TestUnbound | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767791 |      
           TestUbootTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767790 | ORPH 
       TestHostUbootTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767789 | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767788 | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767787 | ORPH 
                 TestTree | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767748 |      
             TestTraceCmd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767747 |      
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767746 | ORPH 
                  TestTio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767745 |      
         TestTesseractOcr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767744 |      
              TestTcpdump | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767743 |      
                  TestTcl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767742 |      
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767741 | ORPH 
                TestSWIPL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767740 |      
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767739 | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767738 |      
               TestStrace | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767737 |      
               TestSQLite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767736 |      
                  TestSox | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767735 |      
                TestSoCat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767734 |      
         TestHostSnagboot | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767733 |      
               TestSkopeo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767732 | ORPH 
                  TestSed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767731 |      
               TestScreen | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767730 |      
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767729 | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767728 | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767727 | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767726 | ORPH 
        TestRustVendoring | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767725 | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767724 | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767723 | ORPH 
                 TestRuby | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767722 |      
              TestRtTests | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767721 |      
              TestRRDTool | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767720 |      
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767719 | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767718 | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767717 |      
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767716 |      
            TestRasdaemon | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767715 |      
            TestQuazipQt6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767714 |      
            TestQuazipQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767713 |      
       TestPythonYamllint | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767712 |      
     TestHostPythonXmodem | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767711 |      
  TestPythonPy3Whitenoise | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767710 |      
       TestPythonWaitress | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767709 |      
     TestPythonPy3Varlink | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767708 |      
      TestPythonPy3Uvloop | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767707 | ORPH 
     TestPythonPy3Urllib3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767706 |      
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767705 |      
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767704 | ORPH 
     TestPythonPy3TZLocal | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767703 | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767702 | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767701 | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767700 | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767699 | ORPH 
    TestPythonTransitions | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767698 | ORPH 
          TestPythonTftpy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767697 |      
      TestHostPythonTftpy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767696 |      
       TestPythonPy3SymPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767695 |      
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767694 |      
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767693 | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767692 | ORPH 
     TestHostPythonSerial | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767691 |      
       TestPythonPy3Segno | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767690 |      
TestPythonPy3SdbusSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767689 | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767688 |      
...onPy3SdbusModemmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767687 | ORPH 
       TestPythonPy3Sdbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767686 |      
            TestPythonSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767685 | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767684 |      
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767683 |      
  TestPythonPy3RuamelYaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767682 | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767681 |      
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767680 |      
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767679 | ORPH 
    TestPythonPy3Requests | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767678 |      
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767677 | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767676 | ORPH 
      TestHostPythonPyusb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767675 |      
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767674 |      
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767673 |      
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767672 |      
       TestPythonPyroute2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767671 |      
          TestPythonPyQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767670 |      
      TestPythonPy3Pyproj | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767669 |      
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767668 | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767667 | ORPH 
     TestPythonPy3PyMuPDF | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767666 |      
    TestHostPythonPyfatfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767665 |      
...honPy3PydanticSettings | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767664 | ORPH 
    TestPythonPy3Pydantic | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767663 | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767662 |      
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767661 |      
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767660 | ORPH 
       TestPythonPathSpec | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767659 | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767658 | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767657 | ORPH 
...onPy3NetworkmanagerGoi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767656 |      
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767655 |      
     TestPythonPy3MsgPack | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767654 | ORPH 
      TestPythonPy3MpMath | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767653 |      
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767652 |      
...PythonPy3Minimalmodbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767651 | ORPH 
    TestPythonPy3MidiUtil | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767650 |      
         TestPythonMemray | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767649 | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767648 |      
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767647 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767646 |      
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767645 |      
          TestPythonPy3Jc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767644 | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767643 | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767642 | ORPH 
         TestPythonHwdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767641 |      
...PythonPy3HumanFriendly | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767640 | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767639 |      
            TestPythonHid | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767638 |      
   TestPythonPy3Gymnasium | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767637 |      
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767636 | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767635 | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767634 |      
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767633 | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767632 |      
         TestHostPythonFs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767631 |      
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767630 |      
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767629 |      
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767628 | ORPH 
...Py3FaramaNotifications | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767627 |      
       TestPythonPy3Evdev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767626 | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767625 |      
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767624 |      
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767623 |      
   TestPythonPy3DiskCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767622 | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767621 |      
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767620 |      
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767619 | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767618 | ORPH 
   TestHostPythonCrccheck | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767617 |      
         TestPythonPy3Crc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767616 | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767615 |      
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767614 | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767613 | ORPH 
 TestPythonPy3Cloudpickle | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767612 |      
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767611 | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767610 | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767609 |      
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767608 | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767607 | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767606 | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767605 | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767604 | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767603 | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767602 |      
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767601 | ORPH 
  TestPythonPy3Asn1Crypto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767600 |      
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767599 | ORPH 
 TestPythonPy3Apscheduler | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767598 | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767597 | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767596 | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767595 | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767594 | ORPH 
                   TestPv | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767593 |      
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767592 | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767591 | ORPH 
                 TestProj | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767590 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767589 |      
           TestPostgreSQL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767588 |      
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767587 | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767586 | ORPH 
           TestPodmanTini | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767585 | ORPH 
  TestPodmanSlirpNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767584 | ORPH 
  TestPodmanSlirpIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767583 | ORPH 
       TestPodmanNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767582 | ORPH 
       TestPodmanIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767581 | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767580 |      
                 TestPigz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767579 |      
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767578 |      
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767577 |      
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767576 |      
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767575 |      
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767574 |      
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767573 | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767572 | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767571 | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767570 | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767569 | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767568 | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767567 | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767566 |      
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767565 | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767564 | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767563 | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767562 | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767561 | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767560 |      
             TestPCIUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767559 |      
                TestPatch | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767558 |      
               TestParted | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767557 |      
            TestOpusTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767556 |      
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767555 | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767554 |      
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767553 |      
              TestOpenOCD | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767552 |      
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767551 | ORPH 
             TestOpenBLAS | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767550 |      
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767549 |      
          TestOathToolKit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767548 |      
              TestNumaCtl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767547 |      
                   TestNu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767546 | ORPH 
                  TestNtp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767545 |      
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767544 |      
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767543 |      
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767542 |      
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767541 |      
                TestNgrep | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767540 |      
     TestNginxModsecurity | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767539 |      
         TestNftablesInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767538 |      
             TestNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767537 |      
              TestNetSNMP | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767536 |      
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767535 |      
               TestNetCat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767534 |      
                TestNdctl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767533 |      
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767532 |      
                  TestMtr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767531 |      
               TestMtools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767530 |      
                  TestMtd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767529 | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767528 |      
            TestMosquitto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767527 |      
          TestMicroPython | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767526 |      
        TestMesa3DRusticl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767525 |      
        TestMenderSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767524 | ORPH 
             TestMenderRW | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767523 | ORPH 
             TestMenderRO | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767522 | ORPH 
            TestMemcached | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767521 |      
                TestMdadm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767520 |      
                 TestMawk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767519 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767518 |      
                 TestMake | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767517 |      
                 TestLzop | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767516 |      
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767515 | ORPH 
                 TestLzip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767514 |      
                  TestLz4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767513 |      
                TestLynis | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767512 |      
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767511 |      
                 TestLvm2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767510 |      
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767509 | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767508 |      
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767507 |      
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767506 |      
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767505 |      
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767504 |      
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767503 |      
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767502 |      
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767501 |      
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767500 |      
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767499 |      
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767498 |      
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767497 |      
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767496 |      
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767495 |      
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767494 |      
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767493 |      
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767492 |      
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767491 |      
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767490 |      
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767489 |      
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767488 |      
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767487 |      
   TestLuajitLuaperiphery | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767486 |      
      TestLuaLuaperiphery | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767485 |      
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767484 |      
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767483 |      
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767482 |      
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767481 |      
   TestLuajitLrexlibPCRE2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767480 |      
      TestLuaLrexlibPCRE2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767479 |      
      TestLuaLightningmdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767478 |      
             TestLuaLgdbm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767477 |      
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767476 |      
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767475 |      
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767474 |      
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767473 |      
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767472 |      
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767471 |      
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767470 |      
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767469 |      
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767468 |      
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767467 |      
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767466 |      
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767465 |      
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767464 |      
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767463 |      
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767462 |      
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767461 |      
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767460 |      
               TestLtrace | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767459 |      
         TestLtpTestsuite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767458 |      
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767457 | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767456 | ORPH 
                 TestLsof | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767455 |      
                TestLrzsz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767454 |      
                TestLrzip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767453 |      
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767452 | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767451 | ORPH 
             TestLlamaCpp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767450 |      
                TestLinks | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767449 |      
             TestLighttpd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767448 |      
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767447 |      
              TestLibLdns | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767446 | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767445 |      
 TestLibiioBindingsPython | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767444 | ORPH 
             TestLibGpgme | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767443 |      
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767442 |      
              TestLibCurl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767441 |      
            TestLibCamera | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767440 |      
                 TestLess | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767439 |      
                 TestLame | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767438 |      
              TestKvmTool | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767437 |      
              TestKmsCube | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767436 |      
                 TestKmod | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767435 |      
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767434 |      
                   TestJq | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767433 |      
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767432 |      
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767431 | ORPH 
              TestIputils | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767430 |      
             TestIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767429 |      
             TestIpRoute2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767428 |      
               TestIperf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767427 |      
                TestIperf | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767426 |      
               TestIozone | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767425 |      
            TestHyperfine | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767424 |      
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767423 |      
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767422 |      
                 TestGzip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767421 |      
          TestGumboParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767420 | ORPH 
           TestGstreamer1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767419 |      
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767418 | ORPH 
                 TestGpsd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767417 |      
             TestGoSource | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767416 | ORPH 
                TestGoBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767415 | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767414 |      
              TestGnuplot | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767413 |      
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767412 |      
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767411 |      
    TestGlslsandboxPlayer | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767410 |      
                  TestGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767409 |      
          TestGhostscript | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767408 |      
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767407 | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767406 | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767405 | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767404 | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767403 | ORPH 
                 TestGawk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767402 |      
                 TestFwts | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767401 |      
                TestFping | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767400 |      
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767399 |      
           TestFluidsynth | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767398 |      
                 TestFlac | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767397 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767396 | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767395 | ORPH 
                 TestFile | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767394 |      
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767393 |      
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767392 | ORPH 
              TestEthtool | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767391 |      
                   TestEd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767390 |      
                 TestDust | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767389 | ORPH 
                  TestDtc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767388 |      
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767387 |      
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767386 | ORPH 
                 TestDPDK | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767385 |      
           TestDosFsTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767384 |      
             TestDos2Unix | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767383 |      
    TestDockerComposeRunc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767382 |      
    TestDockerComposeCrun | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767381 |      
            TestDmidecode | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767380 |      
 TestDistributionRegistry | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767379 | ORPH 
            TestDieharder | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767378 |      
             TestDdrescue | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767377 | ORPH 
           TestCryptSetup | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767376 |      
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767375 |      
             TestCoreMark | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767374 |      
              TestConnMan | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767373 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767360 | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767344 | ORPH 
...yfsVarBackingMountUnit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767331 | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767330 | ORPH 
...SystemdRoFullOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767329 | ORPH 
...emSystemdRoFullFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767328 | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767327 | ORPH 
                  TestXfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14191767317 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
