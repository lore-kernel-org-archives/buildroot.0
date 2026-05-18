Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC4CD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 03:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF6D4294A;
	Mon, 18 May 2026 03:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGyWWLjWqVTz; Mon, 18 May 2026 03:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B3A5428F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779074436;
	bh=J9TGIyFc+xLYX6q5AOLy1MqkPuiXBeStqNu9LnczhMI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XCoQFG7hUKrTcaAdC7SIB3MKQdkynORQFIJ7aXg0vYlUF3FsQpc5nkbzvzffDhWS5
	 nJ2JVW7h3eAydrE4l4xORk1kG1pyZMDZskH5KYlNQ+uBd0iWa5aLgHgRV+yUNRrO9B
	 Uy4uD54BrnewENRR8ZTN5CJRth7pzrTEeECdP2X3oTbRA+XR/rqPbG/r+3YWCJWbls
	 dADd0xgOuyH6ui/h58y2mJghvQ1ThcPJENMZTjpDnuiu/aP1GBYyHIDiOQ+81iEhfo
	 I+ESlq3kmHZ7Aaup+Uk8IobGIr67HTlAQKzlymGU6T6j2FHlv9CN4RKryx5B+DS3IZ
	 8FDEd6yoKdhlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B3A5428F1;
	Mon, 18 May 2026 03:20:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E697265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 03:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66120428F1
 for <buildroot@buildroot.org>; Mon, 18 May 2026 03:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBUKyvECtAdT for <buildroot@buildroot.org>;
 Mon, 18 May 2026 03:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21C7E428A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21C7E428A3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21C7E428A3
 for <buildroot@buildroot.org>; Mon, 18 May 2026 03:20:30 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488b0046078so14609645e9.1
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779074429; x=1779679229;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0S51QlhBkVtg1bgwtdd18hJ3qyjBEGI7TPy3X/4s+c8=;
 b=Je5+2TT6M4LCiQaYXVeprZT/quBwGZRqBxMpZsRanxibOC/RKo5AeTxbym0kSCmuS2
 y36D2/c/c+B7KHR5Anom1q+8AOPm2JKbxUYLepc7JpE4sl0Yi+ie5+YVmy3e5esZoPs9
 3dI/djUG7Iceaj4mPsu7PI+YxB0d4fINxxCXbBx9KfNMEzTYcKKn/yF9XCuUdcFmMTRm
 bzdpfYarVyEk7IfN8aW3pgkaUfnWAQ0apjQ+wCUXyEsqkwKvXgTYouzliYxkrYJL5zek
 6WsWEHMBn9KxbbM+2IL02/UYZX8+ioM7EiTsomp7b/E6Uybz54Qghgg2KGDs5S4U+TiQ
 RV0w==
X-Gm-Message-State: AOJu0YzIV6n4cZHWmWBoPE89qPoXeT9t9SdsZ+OZuxPpqQX5iNmQZYEG
 umEUDMUi7SNDW/igM141e3AxYTIHGiYS5xcPT/cxeja9d3FjKwl01JP8UDnCMlLj
X-Gm-Gg: Acq92OGJAsrDKB2hiQR3TtiJ44t67FptmZZs4z/ZoRZBJeKyIeGAzlY6XPQ6q6kXSVj
 CU1L289CiD5BY7aMjD/BGRwicaISORsHJOjfE6Wt1cczvWNtCwMyOB7K/P5Lm2oRbFGEP0xXsry
 euKUTwjl7NhA/aUPEPpc86olSofQ5x7m9/ZFsksSZQ/qIgymffnHW4nryukE/x1NSbDfsIioQiH
 gAC+X+P8ESPoKmc2vhGLeeAi/jPOGolmrdd/DPKT9TJMWn+d+PXW3y7TESqKGdqpw8BcnglnElg
 guW4yhjzNbuuLU0M9knKz91p8+EC3plxQKoec3nzCn2jKsDg3FflpU41gzDVVUZtwNRO1UaC5x/
 WWFjWg7HKM3ZsuV2cTX/d03hLEN5MYwZa3lHnva9oOsUyJMPTwwBx/ZLlAmAG2iRiNDy3JMuDZU
 65BF2GzHAxLVyCvMp4d3MVlx7dUH0ucsLeyBzeTA4F
X-Received: by 2002:a05:6000:4007:b0:456:ba09:3e64 with SMTP id
 ffacd0b85a97d-45e5c5b3669mr19679557f8f.1.1779074427436; 
 Sun, 17 May 2026 20:20:27 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe1a41sm36735365f8f.31.2026.05.17.20.20.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 20:20:26 -0700 (PDT)
Message-ID: <6a0a857a.ac75277f.2ba7f3.42f2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 18 May 2026 03:20:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779074429; x=1779679229; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0S51QlhBkVtg1bgwtdd18hJ3qyjBEGI7TPy3X/4s+c8=;
 b=CVedaByQitbggIYeCTueiovFCNnuVIfor3OuThKk3qHDrl07d9vXnDU6hRw/dw2/DN
 YakKL/RqCO6Y8RizhODO2VybSFDzclmtUiP2ER1Wat3dxEn5VajHtMnvV6o3SyQzKI8t
 9Aw2VesAGd+hSwVhsqW12QemROTWnpx/2jsarzucEwentyqNAkAu/kvXoIrD5au3v9jg
 5ftwlmPClqyj4QwEZYwRtWF6TWoo2Yf3tTaQ+EasWVee53z/w4h4qbVUFaJbQtnpuOpU
 F6UtwXZ6X46Nmkrhqh6HpiA938JeTaHO528/yPn2whrS4KN0HgSxnQunCmEJo9zKlPOV
 OMuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CVedaByQ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-17
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

Autobuild statistics for 2026-05-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  | 58  |  0  | 71  |
  2026.02.x  |  7  | 17  |  1  | 25  |
    master   | 45  | 138 |  0  | 183 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-15.2.0 | 10
                       unknown | 8 
host-gobject-introspection-... | 6 
             dahdi-linux-3.3.0 | 5 
odhcp6c-f19dd37fb467c9cf10c... | 5 
glibc-2.43-27-g4070d808bea1... | 4 
              libopenssl-3.6.2 | 4 
                       mrp-1.2 | 4 
phidgetwebservice-2.1.9.201... | 4 
                pipewire-1.2.8 | 4 
                  stunnel-5.78 | 4 
                libnss-3.123.1 | 3 
                  cairo-1.18.4 | 2 
               host-dracut-110 | 2 
                  iozone-3.508 | 2 
libdill-32d0e8b733416208e04... | 2 
                   linux-7.0.6 | 2 
               linux-pam-1.7.2 | 2 
                openssh-10.3p1 | 2 
                   perl-5.42.2 | 2 
python-remi-2022.7.27-37-g1... | 2 
       sp-oops-extract-0.0.7-1 | 2 
ustream-ssl-5a81c108d20e247... | 2 
             util-linux-2.41.4 | 2 
            18xx-ti-utils-R8.8 | 1 
amazon-ecr-credential-helpe... | 1 
android-tools-4.2.2+git2013... | 1 
                 apitrace-13.0 | 1 
                   atop-2.12.1 | 1 
                bpftool-v7.5.0 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                  dlib-19.24.9 | 1 
                    dust-1.2.3 | 1 
                easydbus-0.1.0 | 1 
        edk2-edk2-stable202602 | 1 
                      fio-3.41 | 1 
                  gensio-2.5.5 | 1 
 glslsandbox-player-2023.04.05 | 1 
                 gnupg2-2.5.19 | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-15.2 | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.95.0 | 1 
                 host-tar-1.35 | 1 
               libevent-2.1.12 | 1 
libftdi1-v1.6rc1-2-g92d657b... | 1 
                 libmbus-0.9.0 | 1 
           libmicrohttpd-1.0.5 | 1 
      libphidget-1.24.20260127 | 1 
              libsecret-0.20.5 | 1 
                 libzlib-1.3.2 | 1 
          linux-5.10.254-cip72 | 1 
     linux-5.10.254-cip72-rt32 | 1 
          lttng-modules-2.14.3 | 1 
                    lua-ev-1.5 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                    lynx-2.9.2 | 1 
               madplay-0.15.2b | 1 
                     mtd-2.3.1 | 1 
                  nginx-1.28.3 | 1 
                  ntp-4.2.8p18 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
             pptp-linux-1.10.0 | 1 
            python-iwlib-1.7.0 | 1 
            resiprocate-1.13.2 | 1 
      shadowsocks-libev-v3.3.6 | 1 
         spice-protocol-0.14.4 | 1 
                 sqlite-3.53.1 | 1 
               tcf-agent-1.8.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
               usbredir-0.14.0 | 1 
           xtables-addons-3.24 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/f48a50ae76861430f864b8e9a566e7f28fe1c27b |     
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/067518afcfb6e9508b6bd6f7c15d7478ec79dab0 | ORPH
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/55ffd1f02c63a620808130f63f5fd2befd0d3e0c |     
    or1k     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/b7d85729f0ed76b756ec7577c7a8ee5ebb5a36ea |     
   armeb     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/d07467bdee3af462a57af02b02f7544f5d1cb015 |     
   s390x     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/bf23a7c11a2900050a5b20b905304c668dde9137 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/d184c252a3cc9a683250b0053819c97177647ed5 |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b72079de1883dca3d1a115879977383f3f67cdd4 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/a8f842841363a050734f9c5a28dda71333341e1b |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fb4b5af1123a52cec52befe49f3c75657d6e3565 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8d263b369869fbe1cef2726d4dab288fe135ce86 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9bbe521f9264997af9d4458b57afd7b6d79b973b | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/56ec5cec0d9e3b0e7910319e6699a5fe40f8f6cb | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/68ed2b9d977d52e0c026f6b2fb96d152d74ad326 | ORPH
    or1k     |          dlib-19.24.9          | NOK | https://autobuild.buildroot.org/results/50ffb17dcaca4e6f1091ed4421784d70c7279568 |     
   armeb     |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/949143710e1ce21ffd93903fd6a82e9750d4c351 | ORPH
  aarch64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/162ea3336da463314e5149a6ff1ac5ed77de696a |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/4cfca5c35ebe3b3dd27eed04ae563e9e48023c6e |     
  aarch64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e4ed42a27e23193a78dc717cfdd1c5dd2ea5e3d1 |     
    arc      |          gensio-2.5.5          | NOK | https://autobuild.buildroot.org/results/06e155f7cd8c839247a103454730bc2e527e90bb |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/e523ca34899975713debeebe2370033aca2e7445 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/ae1b9c05ffc03db31a7519448e48bad3bec7a8f5 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/b7723c4e189a652ffba51dd4629529c338b13688 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/bae4b58e59060be8e64d5508e632aab0c68ba3c1 |     
  aarch64    | glslsandbox-player-2023.04.05  | NOK | https://autobuild.buildroot.org/results/8b47525fef4de3d5d6a1be1bafbbe2c5dbb2609f |     
powerpc64le  |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/ec3bfc2f72ed869d611d8f7e49d23d7ace1659f5 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c29d5b3a0d88d18d177d5beb3714d05dd07a2335 | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/65bcd45c2035c778bb83a09bc71f84d436fdc34e | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4e72ccd4197012ba1c711098bef6e9c0d0e44fd1 |     
   sh4eb     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/bede475ea7c1dffb40143dfeaf6bda91c004e811 |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/848fe76f7da95899d2d8b6b7dbdabe4a5582a2e4 |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/9dc06f529a5775f94b5fd890e1ee5d727fb8d48d |     
    i686     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/014653df016e0f1f3caaeadc4e2f766fca8d0e26 |     
powerpc64le  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/f60b5fef8198cd0719469218cb1d8c117fc13376 |     
   sh4aeb    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/af510820689956162a86a6bea7c00ea5460a2b68 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/38a715ca4299902bb93a07e48882ca3f37f615d7 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/7fc13d25026e3a50137989d85a3648c9992946c6 |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/2a1336c3d5c068285f9edf0e46095d159ae42b77 |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/e6da3ba07cbb826f4ed65a602aa159f4c5e8cca4 |     
microblazeel |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/bf2b0496d465745589709af5c95225ed5d535507 |     
    sh4a     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/57da8d5bba0083bfba08505a314d26dae3476a12 |     
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/8409befb51217b7a5fed05381e900d0f364e08e3 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9a0a8127d88d8cda53524173df8b677519b496f7 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a166e19d072dbbde3248b0be31c758c36f74771b | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1b363e9e1a96a035cc6bd0216fde12f3c4e3e710 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2bafc754121f6663b8e155738feb8f5354a7055d | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c75db28f3b29dd6f8afc3b461aaacf1d353e3304 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2af03a50f268427605d10cb76d5f3135a71f237b | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d0f1c80e59c8b31da9a24182b0faae97f84cc466 | ORPH
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/1ebab6727a8082fb386aa565a3bdec7b8aa79500 |     
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a72d605303a34dd8b455b121ad20e1f1a59d594a | ORPH
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/eaa360b199745274732d09572f80460129e6eab2 |     
   mips64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/147df84c84a4466cd4418c0913ffbe78307b45a5 |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/7abc34f1b84989ac28be78117956885195874133 |     
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/89aefdaea1b9b0eb414896527abd43893f2b040e |     
   mipsel    |        libevent-2.1.12         | NOK | https://autobuild.buildroot.org/results/f606e4c8355070dafdb19e549b3115f1b5ae7587 |     
   sparc     | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/9cc65cbe4431864b440b6a969d584ac2e929156e |     
  powerpc    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/7e27e00cb18d16cf37f6df2111654f8b47de29fb | ORPH
microblazeel |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/84b5e8488a4659069bac529a7e5e7b82279a2280 |     
 powerpc64   |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/02d4960194447da626038e2dcdc5abf2fa0bc139 |     
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/a029ee1c204715f144bf6569b2cf0bc279d26130 |     
  powerpc    |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/1df6843f33b5e271f0d10f1c0fd83e2b32fef14a |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/2eef33de19e3694be75e6368bff5823d89ed8de8 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/53effe6571030e1198d76e011b9beff3a0b08fc7 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/868d29159e31112a89d1d2d2f44073ee41aeb724 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/b85dd2e092347dad5b53820a884b949947c2c13b | ORPH
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/9977dfdaf12b575045b38f0e88a8b68e30b57259 |     
   mipsel    |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/689b0900cf54869d890c5dabcefefebe5ad08053 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/5128306a0e18485d1264d21b9cd4c0c309b27a02 | ORPH
    mips     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/22d2d697966e1343c30867d08a41403d46c95f85 | ORPH
    m68k     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/96aa275394b140095cda72240c41906b2eac8987 | ORPH
   xtensa    |          linux-7.0.6           | NOK | https://autobuild.buildroot.org/results/81369bb0c0e3659fd9d3deb36cea5048a159ca37 | ORPH
    i686     |          linux-7.0.6           | NOK | https://autobuild.buildroot.org/results/a7d53a569fd9200ead55bb68742f5eb5e2582c55 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5388703a1418ac5aebca0bbe3004cc6fb59f924c | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/057c8232e2bf6c07f72e4410e9538fb50a327c7b | ORPH
microblazeel |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/e136f07c47705459edd2b2cbf3abc34eb1e52527 |     
    hppa     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/f4d44f01fac48d7475b705f39f3422434fa2e43b |     
  aarch64    |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/1ec95569d133220a2afdfd9ba73b627adce28dac |     
   mipsel    |           lynx-2.9.2           | NOK | https://autobuild.buildroot.org/results/d3215fe35264631c214626794c2e6e74c21e451d |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/bdbcc6fe92fc42dbc389c06d940ae75ea876212b | ORPH
 microblaze  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/6c83cb74adbf79ebd602b7deb6b09cdea2067328 |     
  mips64el   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/512fb082ced8009209865ad25d5cdb46a59647c1 |     
   sparc     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/d7a5798b0ca135ee75027ec256016519a6218b24 |     
  sparc64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/adb09028ce9b7273f142861df4135f33753d7ca3 |     
   sparc     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/542d392f8de4232a79c7fa6e856c1d1ddb379bff |     
   sparc     |          nginx-1.28.3          | NOK | https://autobuild.buildroot.org/results/37427a7793363a73f57d25e5d490e3a2722d5fb0 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f7c974e74ed8fd4d654a11a94e48703a378113a0 |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/b774c1bef2bb73615c97b3ff6873efc390814af9 |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/5f04088342098ca1c99deccffdc4832cf2855756 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d5ad6c0edf7f4e4a9c12e26803a5a59b200d4a4f |     
   mipsel    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/9302db97528beeef00fdf86c481923dca108d8b4 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/cfe37670153e0043b64343fb22dce9db8374a253 |     
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/44151f7546293c97e294687352a7f47e3502ba11 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/1536b80831de16b0e43fa98fd1133c007e82e1a6 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/d56a32075d7babdaa132fa074eee8f6c8b67493c |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/323a1c41f3ed48b09b6fa998caf9583b39923d67 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/b24e46d0010f92609097ce63903f6d1bad4d7bbe | ORPH
   sh4eb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5804cb3593f161420f027aa55f70e0f97e2c7788 |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e67f5b0e4e3c31c11c4da76845b06be99e6c5488 |     
   sh4aeb    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/62b6c4416242856739d12fedcc3aece3fa89ebe1 |     
   x86_64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/f9a1f1fa40ebed2c5f65bf0c2b13dc2e04ab369b |     
    i686     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/1b050b2101f7bf928aa71188948d18c46972c3e0 |     
   sh4eb     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/b1e6f50c1c393cbb254af15c74c4e3129c53692d |     
 aarch64_be  |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/d676cd1bfeba5fe4868a0afb34bb4be85955da1a |     
 microblaze  |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/83b70b1082badfc855d128e45706d8afa984c1ed |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/ec32b0b0b20f6f51c3ed8b134cf4276260332d29 |     
    arm      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/88105cad26118fd15d7de907df1b3385d2694cae |     
  mips64el   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/2f83aa20eac43ecc998de06d7a7fc4ab55f73edd | ORPH
    mips     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/7814d4b1b3dd177023c27c611ea8f0a6df6d1763 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/15599ea42c57a4ad0e83adb07ea67364bebd21c7 |     
   sh4aeb    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/76859882716d475cf491d9451472ea0de5779359 |     
    mips     |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/d9d0d02bf1e0aaec609d847ede5603ed9f8ba5a7 | ORPH
   s390x     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/10d8797f391dde9c09005e9fa4fb2287308460d3 | ORPH
  mips64el   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/af6ac3455c5e988b7fc497c816293a1362d443de |     
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/62bab51f15bbac4ec6e7d3a3cd4c1d051a3fc6c6 |     
   mipsel    |     spice-protocol-0.14.4      | NOK | https://autobuild.buildroot.org/results/ba34b8f775f49ff651434171cf17b6b3c2e47ab3 | ORPH
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/d7efc6f6eaa90a7fc741ad8ae1a7b3cc94205f38 |     
   xtensa    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/05fb878e59a0237047aee35a4100d5ad4b3afac5 |     
microblazeel |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/7f5610b2ae9193ef96a5c29fed82aca630e02d00 |     
   sparc     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/75c3d867b3408bb06455bbe41d5f8193486d27a2 |     
  mips64el   |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/4b2064161b861252e07bc513bc26480bb1991d6c |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/521decb8e87bcbbbc6ba51849dd5f1a7ee57a05a |     
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/835bda7c2fa01d8366d63527fa37bc78a8aa51fa | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/4b31b2e1a50c90ad75826eaf6812e4e602ebc350 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/9acb3fdf4c1ecbf1286299960fa3e5bc937fb606 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/cfad23b0a2d55be6236fd00ebb97b10a57bf9d60 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/75a05355d331869287c16aed720640c3a278b81a |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5a6523f3a33a6292f70771d696bdc5d4beeadb60 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1c487c4263d7dbafa3f817b3fb0e769416902a1e |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/3e7fcf4e6e67b1c4c609e438fabc7f6ccf5a3884 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/5899eac3294e665673fcd0c9468955e10d7a52fb |     
   sh4eb     |        usbredir-0.14.0         | NOK | https://autobuild.buildroot.org/results/9a0ece1f81bf8d120bbcf65b53500872b4985728 | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/94cc334431e02558f7fe99faecc5849628ebe51d | ORPH
  powerpc    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d6c37640fce666c26eaf0bab487b933044867d01 | ORPH
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/79d186987dd2ccb4514ca87a690422e4e105e2f5 |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/32d20b03276759717397fe30815edb1566516114 |     
    arc      |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/3761b4cfabf2778e40c0cecc96c71d6fb12adeab | ORPH
    mips     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/4ee322b01c2550604c77f67a15491e34a487f83d |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                bpftool-v7.5.0 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
    host-gcc-bare-metal-15.2.0 | 1 
host-gobject-introspection-... | 1 
                host-odb-2.4.0 | 1 
                  iozone-3.508 | 1 
                       libcurl | 1 
                 libmbus-0.9.0 | 1 
              libopenssl-3.6.2 | 1 
     libphidget-2.1.9.20190409 | 1 
            libxkbcommon-1.9.2 | 1 
                 linux-6.19.14 | 1 
               linux-pam-1.7.2 | 1 
                memtest86-7.20 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/ade171149d4f81bc1a3b8f2f37df13bb61cac119 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/4dc61951216a3cc762b25da2c7b91b4de376356d |     
loongarch64  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/1c832ed6f82de3002f5a0c4c568ec49dcb7cadb7 |     
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/436ba59bdd98d6c7bb55e946402d715439371a9b | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/82f86eaaea6c11ff15c138f5ec437d29619ea93d | ORPH
  powerpc    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/573f1e1e8971690b9ff3c02e50ecba0f83d9f09d |     
  mips64el   |            libcurl             | TIM | https://autobuild.buildroot.org/results/5dc32c1e32ce62a8c78152e10384cea3d6547c42 |     
  mips64el   |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/32aaa7f833523bb43ad3ac6a0ef709fb13c81113 | ORPH
    hppa     |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/3f96ef762630e81c3a3204a9e2039f0d82bb5eb2 | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b2a83426c93f3b37bb50cc4a5e0023dbffdbce76 |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/782fabe0101d295ad1b94005f3e541a5fa2985d6 |     
   x86_64    |         linux-6.19.14          | NOK | https://autobuild.buildroot.org/results/1b1c3e1fad13b10e7b7fb72c411383cdf5337e31 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/fa2f86ecf9aae79c2f942af07d5440c137662f12 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/8ce82c61878d37a47d5689a35a547384e7d1d545 |     
    mips     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/277ce26e4e283295c727e1682e9fc85ed6f06edf | ORPH
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/864d2ef0d96864767a4849959ac30f18c59414e9 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c2cf6d61f5fb4f74fa761fc49d3fc4d23e8b5f48 | ORPH
   armeb     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/513a2aaa43f7a1cf1a3911f1cca619da65d4f323 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

host-gobject-introspection-... | 4 
        host-python-lxml-5.3.0 | 3 
  gobject-introspection-1.82.0 | 2 
                host-odb-2.4.0 | 2 
              host-pahole-1.27 | 2 
        ltp-testsuite-20250130 | 2 
                  nginx-1.28.3 | 2 
             pptp-linux-1.10.0 | 2 
                       unknown | 2 
                 vmtouch-1.3.1 | 2 
                    bat-0.25.0 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                   exim-4.99.2 | 1 
                freerdp-2.11.8 | 1 
gemmlowp-16e8662c34917be006... | 1 
                haveged-1.9.19 | 1 
host-binutils-arc-2023.09-r... | 1 
host-gcc-initial-arc-2023.0... | 1 
                 host-gdb-15.2 | 1 
host-google-breakpad-f49c2f... | 1 
           host-libtpms-0.10.2 | 1 
host-netsurf-buildsystem-75... | 1 
              host-rust-1.82.0 | 1 
host-vboot-utils-4b12d392e5... | 1 
                  iozone-3.508 | 1 
                  libbpf-1.5.0 | 1 
                libdnet-1.18.0 | 1 
           libmicrohttpd-1.0.5 | 1 
                  libnss-3.108 | 1 
              libopenssl-3.5.6 | 1 
                  liburing-2.6 | 1 
                  libva-2.22.0 | 1 
               linknx-0.0.1.38 | 1 
            minizip-zlib-1.3.1 | 1 
           oath-toolkit-2.6.12 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.4 | 1 
                pipewire-1.2.8 | 1 
             python-lxml-5.3.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                setserial-2.17 | 1 
         spice-protocol-0.14.4 | 1 
                    sslh-2.0.1 | 1 
                 wolfssl-5.9.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/a71abd5fb5c32d531c9f6ea31f03d8b50bd8764c |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3a89a4b97eef02a4a5f2fff9b96e4016c4ce86c3 | ORPH
   sh4eb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f8ade29067e5772c396b1cafa68eb40b6f78a800 | ORPH
powerpc64le  |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/e7f7f7931df2b18c81803b33f96c4d3f20b8dd95 |     
  mips64el   |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/98e2dff1bece58248061e8ffeb86358e29af2f95 | ORPH
   xtensa    | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/0ad0d7d88bea0e7b811cbc7cf49d6d1fd54ff77c |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d0018288bbb6bc03d9a7f70404eab3b7ea014e58 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8cd1139de2fbdad8b0cd42adb5daa47545d6bde6 | ORPH
  mips64el   |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/c9b82c744d6d350b3689d42b200f1d3763f747b1 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2d36f9a3146270a5fa4c47171303c8e88db1711a |     
   arceb     | host-gcc-initial-arc-2023.0... | NOK | https://autobuild.buildroot.org/results/42f04a9a50fc52f59ce348106e4d0fb55f2032bc |     
  aarch64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/bf23d25399aa05f737395018cccbcf7268e24a55 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8e15980498440e187c160c122bedff49d59c59f1 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8e2d9a729d62ecf836591d124220d03149491ddf | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b37c50b2bd187e81a5ecd33a87bb9645dd9b797b | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8a5f39f455256b13f07c5355f34370b68b137159 | ORPH
   mipsel    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/455d11b43d86afb228b394dda492ac2a5b42b047 |     
  mips64el   |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/e1021cdac3c9b1d8f11f4cac261a630ee22b296f |     
 microblaze  | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/71b3669776b1d2e0adb51d431f94173eb297f53f | ORPH
   sparc     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/ca3492948e447736382aa464732e43c44edb78c1 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/af921786a824bb183d9aaeddeb04876eff0febb9 | ORPH
   sparc     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/0b6d56d1dd71ce20f72b5012d9deb8c35df92372 |     
    mips     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/7f3859c7279cda682bd349423a372aec33c4acf5 |     
   arceb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/0aa3f78806e8ee41bce0f6a4c936e52e28cb0977 |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/6734d9f7433099867d8058502dd859605c27eff6 |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/7c92f84a2f1c0b8bd07aace1e7a3e138cd1a76c5 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/776a12e9a43f45d4a534713d5c12eae574428c35 |     
 microblaze  | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/473375b78dffec143e2db39924a1d5112947db14 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1dd70a658a7eb00c36254e75567dc9551bcd4a90 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/46eedf34b9ec3bb4ed8495a0ebecab94794d7c14 |     
 aarch64_be  |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/e09aa3f923bd637b90d8df29bfaa011e94740b22 | ORPH
   mipsel    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/16186b8fa6a5bac325151f4874016d1d629dca91 |     
  powerpc    |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/b8cda21f368e31eaab813d4e87e2775da313b2f0 |     
  riscv64    |        libopenssl-3.5.6        | NOK | https://autobuild.buildroot.org/results/6ed4bef7ae967a70947c183135345c0ed90cb650 | ORPH
  powerpc    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/9abb84ffca2a269f48a732788484594e426af3a9 |     
   sh4aeb    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/96906b2302ef34c37c3a6ad19c5b000f484f4f08 |     
 powerpc64   |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/49aff4683781d6013e3e23573699eef5ba680ab7 | ORPH
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/cba3a6abb68ddc49a9acdf481913e0729dbea2f7 |     
microblazeel |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/10cf58de29eef3f31d193b7122b91305059e168e |     
  aarch64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/ad166d7859dfdf0273975ac9e3cec10703bec676 |     
   sparc     |          nginx-1.28.3          | NOK | https://autobuild.buildroot.org/results/111c802d9218ed607b1615eb17e2bbd4918bc94c | ORPH
   sparc     |          nginx-1.28.3          | NOK | https://autobuild.buildroot.org/results/e82a5602c9fb2fe1c98d2ccd74381eb632c3ec9b | ORPH
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/225645916ca459be2f2f9371aab71de9153be821 |     
  powerpc    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/a4242c430b0d8baa52e7a2c8ce1cee94b2760f3b |     
   xtensa    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/3d41bf13c510e07fe6e09391b493ae898157d94d |     
   mips64    |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/4a25da9e4a55d4d90cc8281bf3c4b9240bd40be0 |     
    mips     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/185042454e8a89bd2ace8db608abf2569456c71d | ORPH
   sparc     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/06c9fa2cd6f1646b26e59a0c5f70984bb274ffab | ORPH
 microblaze  |       python-lxml-5.3.0        | NOK | https://autobuild.buildroot.org/results/ce3df6157e8744dc2479273316b4739b6d536aa4 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/bbf437a3fbd71a30ac08ffb1bae618c8688601fd |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/612ffcdc78bca0b2607e4e069aaa386f0e57b11c | ORPH
  powerpc    |     spice-protocol-0.14.4      | NOK | https://autobuild.buildroot.org/results/bcfe07478ba65f3a2e852f13b42542690e1cd25a | ORPH
    arc      |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/d002ee8c160f87b3162e897d9b34383edd921083 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/4bc91964c8b6c72a39ed3316c609a1a2ebd1cce7 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5362a3972f09e5894ade7d8755ab277cd6d88ccb |     
    mips     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/f60e242ed15dbe478060fbec5c9ab17b4fb1131a |     
  mips64el   |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/7aa737740219629c2a1cc5198d205510961e218a |     
    mips     |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/1ecfbdb12f40e4e44fd163dd3b09b6c438b326c2 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.17.0      | 1.17.1       | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.6        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/000018 | 20251212     | 20260408     | ORPH
                      adsp-ldr |  DISTRO  | https://release-monitoring.org/project/388235 | 1.0.1        | 1.0.2        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 50.0         |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2026.1       | ORPH
  amazon-ecr-credential-helper |  DISTRO  | https://release-monitoring.org/project/359761 | v0.10.1      | 0.12.0       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/226905 | 4.2.2+git... | 35.0.2       |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 13.0         | 14.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.0        |     
                      argparse |  DISTRO  | https://release-monitoring.org/project/007317 | 0.7.1-1      | 0.7.2        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                        assimp |  DISTRO  | https://release-monitoring.org/project/006988 | 6.0.2        | 6.0.5        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.8.2       | 23.3.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.58.2       | 2.60.3       |     
                         atftp |  DISTRO  | https://release-monitoring.org/project/015219 | 0.8.0        | 0.8.1        |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.5        | 4.1.4        | ORPH
                      autoconf |  DISTRO  | https://release-monitoring.org/project/000141 | 2.72         | 2.73         | ORPH
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/000142 | 2023.02.20   | 2024.10.16   | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.18.1       | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.17.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2026.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2025.4       | 2026.1       |     
                   bats-assert |  DISTRO  | https://release-monitoring.org/project/372274 | 2.2.0        | 2.2.4        |     
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.15      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.48      | 9.20.22      |     
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.45.1       | 2.46.0       |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.2.1        |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.8.3        | 1.8.5        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.86         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.86         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 8.2.11       | 8.2.13       |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.91.0-1     |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.12.0       | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.7.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.24.2       | 0.25.1       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.8          | 6.9.1        |     
                         broot |  DISTRO  | https://release-monitoring.org/project/141357 | 1.56.2       | 1.56.4       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 7.0          | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.13.0       | ORPH
                       busybox |  DISTRO  | https://release-monitoring.org/project/000230 | 1.37.0       | 1.38.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.14       | 0.6.4        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/021328 | 2.4.3        | 2.5.0        |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 2.0.0        | 2.0.1        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.311        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.4.0        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/007680 | 3.14.0       | 3.15.0       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.7.1        | ORPH
                        cdrkit |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/000287 | 7.4          | 7.5          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.6.1        | 2.6.2        |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.8.1     | 2026.5.0     |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.5        | 2.0.7        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.20.1     | 4.3.20.2     |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.9.8        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.2.1        |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.8        | 1.4.9        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.7        | 2.3.0        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.2       | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.10         | 9.11         | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.43.1       | 0.45.0       |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/021408 | 2.1          | 2.2          |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.24         | 1.27.1       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 3.5.0        | 5.0.1        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                           daq |  DISTRO  | https://release-monitoring.org/project/013264 | 2.0.7        | 3.0.27       |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.25       | 3.0.27       |     
                        davici |  DISTRO  | https://release-monitoring.org/project/021340 | 1.4          | 1.6          | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/005356 | 1.14.10      | 1.16.2       | ORPH
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.5.2        | 2.6.2        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.26.3       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.2.4       | 10.3.2       |     
                      dhcpdump |  DISTRO  | https://release-monitoring.org/project/021415 | 1.9          | 1.10         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20251001 | 1.3-20260107 | ORPH
                     ding-libs |  DISTRO  | https://release-monitoring.org/project/013710 | 0.6.2        | 0.7.0        |     
         distribution-registry |  DISTRO  | https://release-monitoring.org/project/378976 | v3.0.0       | 3.1.1        | ORPH
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0.1       |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 28.3.2       | 29.5.0       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.25.0       | 0.34.0       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.38.2       | 5.1.3        |     
         docker-credential-gcr |  DISTRO  | https://release-monitoring.org/project/377457 | v2.1.30      | 2.1.32       | ORPH
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 28.3.2       | 29.5.0       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2026.1       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/007454 | 3.3.1        | 3.4.0        |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.4        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.3        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/000457 | 1.16.1       | 1.17.0       | ORPH
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 25.11        | 26.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 110          | 111          |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 10.2         | 11.0         |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.2.3        | 1.2.4        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.9.0        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.6        |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/000666 | 3.4.0        | 5.0.1        | ORPH
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 26.04        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.194        | 0.195        | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.16       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.2.5.15    | 29.0         |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.27       |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/009323 | 1.1.3        | 2.0.0        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/016913 | 1.11.10      | 1.11.12      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.31       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.34       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.9.6        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.60       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.34       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.26       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.29       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.23       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.16       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.10       | 1.9.1        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 4.0.1        | 4.4.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.9.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.9        | 1.3.2        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.23.3       | 0.23.4       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.2       | 1.38         | ORPH
                        fbterm |  DISTRO  | https://release-monitoring.org/project/008331 | 1.7.0        | 1.8          | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.3.2        | 3.3.3        | ORPH
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 10.3.0       | 10.4.2       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/000790 | 3.11.2       | 3.12.2       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.5        | 8.1.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                          ficl |  DISTRO  | https://release-monitoring.org/project/021430 | 3.065        | 3065         |     
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.41         | 3.42         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.4.1        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.28.4       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/021433 | 1.14         | 1.15         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/021434 | 1.14         | 1.15         |     
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.5        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 4.2.0        | 5.0.5        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.7        | 2.5.4        |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 7.2.0        | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.26.0       | 1.27.0       | ORPH
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.4          | 5.5          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.16       | 1.6.17       |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/010442 | 2.11.8       | 3.26.0       | ORPH
                    freeswitch |  DISTRO  | https://release-monitoring.org/project/021436 | 1.10.12      | 1.11.0       |     
                           frr |  DISTRO  | https://release-monitoring.org/project/018555 | 10.5.3       | 10.6.1       |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.16         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.16.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.1.3        |     
                gcc-bare-metal |  DISTRO  | https://release-monitoring.org/project/006502 | 15.2.0       | 16.1.0       |     
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.11.4       | 3.13.0       |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.12      | 2.44.6       | ORPH
                     genext2fs |  DISTRO  | https://release-monitoring.org/project/021440 | 1.5.0        | 1.6.2        |     
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 3.0.2        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 3.2.0        | 3.2.1        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 1.0          | ORPH
                  gettext-tiny |  DISTRO  | https://release-monitoring.org/project/021443 | 0.3.2        | 0.3.3        |     
                        gflags |  DISTRO  | https://release-monitoring.org/project/008735 | 2.2.2        | 2.3.0        |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/017093 | 0.7.0        | 0.8.0        | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 18.11.3      |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.88.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.1        | 1.0.3        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.3          | 0.3.1        |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/001215 | 2.5.19       | 2.5.20       |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.84.0       | 1.86.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.1        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.8.1        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.46       | 1.3.47       |     
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.14.3       | 0.15.0       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/001257 | 2.12         | 2.14         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 50.1         |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.13      | 1.29.1       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.10       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.13      | 1.28.3       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.13      | 1.28.3       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.13      | 1.28.3       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.13      | 1.28.3       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.13      | 1.29.1       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.13      | 1.28.3       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.13      | 1.28.3       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.9.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.13      | 1.26.11      | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.13      | 1.28.3       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.13      | 1.28.3       | ORPH
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 5.18.0       | 5.20.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.11       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.57.2       | 1.60.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.27       | 3.3.10       |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/011695 | 1.9.19       | 1.9.20       |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.3.0        | 1.4.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.25.8       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/001332 | 3.5.0        | 3.5.1        | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 2.0.1        | 2.0.2        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/005387 | 0.406        | 0.407        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.12.2       | 2.13.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.59.0       | 2.60.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 78.2         | 78.3         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.8        | 1.6.9        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.2-19     | 7.1.2-23     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.12.5       | 1.12.6       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.25.9.0     | ORPH
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.508        | 3.510        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.2        | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/001394 | 1.8.11       | 1.8.13       | ORPH
                      jemalloc |  DISTRO  | https://release-monitoring.org/project/001441 | 5.3.0        | 5.3.1        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.3        | 3.7.0        | ORPH
                           joe |  DISTRO  | https://release-monitoring.org/project/001467 | 4.6          | 4.8          | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.4        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.26.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.26.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.26.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.26.0       |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.6        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.2        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/009815 | 2.19         | 2.19.1       |     
                           lft |  DISTRO  | https://release-monitoring.org/project/021863 | 3.91         | 3.98         | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.0        |     
                 libatomic_ops |  DISTRO  | https://release-monitoring.org/project/001561 | 7.8.4        | 7.10.0       | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.6.2        | 1.7.0        |     
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.7.0       | 0.7.1        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        | ORPH
                       libcoap |  DISTRO  | https://release-monitoring.org/project/021471 | 4.3.5a       | 4.3.5b       |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.2.4        | 0.2.5        | ORPH
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 1.0.0        | 1.1.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/006308 | 1.18.0       | 1.18.2       | ORPH
                        libdrm |  DISTRO  | https://release-monitoring.org/project/001596 | 2.4.131      | 2.4.133      |     
                      libecoli |  DISTRO  | https://release-monitoring.org/project/375859 | 0.10.1       | 0.11.3       |     
                       libenca |  DISTRO  | https://release-monitoring.org/project/011686 | 1.19         | 1.22         | ORPH
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.5       | 1.13.6       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                        libffi |  DISTRO  | https://release-monitoring.org/project/001611 | 3.4.8        | 3.5.2        |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/001627 | 1.9.2        | 1.9.3        |     
                       libglew |  DISTRO  | https://release-monitoring.org/project/007878 | 2.2.0        | 2.3.1        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.86.5       | 2.88.1       |     
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.24.3       | 2.0.1        | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.4        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 2.2.2        | 2.2.3        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/012587 | 1.0.23       | 1.0.24       | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.51      | 3.24.52      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.21.0       | 4.22.4       | ORPH
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/018397 | 20210624     | 20260326     |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.51       | 0.5.53       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/001637 | 3.0.20       | 4.0.1        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.31.1       | 1.31.2       | ORPH
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.3       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.3        | 0.2.6        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.10       | ORPH
                       libksba |  DISTRO  | https://release-monitoring.org/project/001649 | 1.7.0        | 1.8.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.49         | 250          |     
                    liblogging |  DISTRO  | https://release-monitoring.org/project/001654 | 1.0.6        | 1.0.8        | ORPH
                        libmad |  DISTRO  | https://release-monitoring.org/project/021487 | 0.15.1b      | 0.16.4       | ORPH
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.13.3       |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/007308 | 1.32.0       | 1.34.0       |     
                         libmd |  DISTRO  | https://release-monitoring.org/project/015525 | 1.1.0        | 1.2.0        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.6       | 0.14.2       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/013148 | 1.9.6        | 1.9.7        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.11alpha    | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 3.7.10       | 4.2.14       |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.1        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.3.0        | 1.3.1        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.23       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 6.2.3        | 6.3.0        |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/007953 | 4.38.2       | 4.39         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/002503 | 3.123.1      | 3.124        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.7        |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/002566 | 3.6.2        | 4.0.0        | ORPH
                     libosmium |  DISTRO  | https://release-monitoring.org/project/007023 | 2.22.0       | 2.23.1       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2026.1       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.2.1        | ORPH
                    libphidget |  DISTRO  | https://release-monitoring.org/project/115726 | 1.24.2026... | 2.1.9.201... |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.10.4       | 8.0.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                         libqb |  DISTRO  | https://release-monitoring.org/project/009399 | 2.0.8        | 2.0.9        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/007307 | 1.36.0       | 1.38.0       |     
                  libqrtr-glib |  DISTRO  | https://release-monitoring.org/project/192056 | 1.2.2        | 1.4.0        |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.4       | 0.22.1       |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/001713 | 1.11.0       | 1.12.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.3.1        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.62.2       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.7        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.8.1        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.1       | 2.12.2       |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.35       | 0.7.37       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/018547 | 2.7.0        | 2.8.0        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/001729 | 0.11.4       | 0.12.0       | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.4        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.15.3       | 0.16.11      | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.20       | 2.0.12       |     
                 libtraceevent |  DISTRO  | https://release-monitoring.org/project/288159 | 1.8.7        | 1.9.0        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.4        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.3.3        | 1.5.1        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/001748 | 1.8.1        | 1.8.3        | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.25      | 1.18.5       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 1.0.3        | 1.0.4        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.15.5       | 0.15.6       |     
                        libusb |  DISTRO  | https://release-monitoring.org/project/001749 | 1.0.29       | 1.0.30       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/009998 | 1.28.1       | 1.32.0       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.18.0       | 8.18.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 12.3.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.16.0       | 2023.4.0     |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.9.2        | 1.13.1       |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/003531 | 2.47         | 2.58         |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.19       | 0.3.26       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.6.1        | ORPH
                    libxmlsec1 |  DISTRO  | https://release-monitoring.org/project/005200 | 1.3.9        | 1.3.11       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 3.13.6       | 5.4.9        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.9.0        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.9.0        |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.26.4       |     
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2025.10.13   | 2026.04.22   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.20       | 1.0.22       | ORPH
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cpp |  DISTRO  | https://release-monitoring.org/project/021499 | 1.1.4        | 1.1.6        |     
                          lpac |  DISTRO  | https://release-monitoring.org/project/371628 | 2.2.1        | 2.3.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/001842 | 0.651        | 0.660        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.14.0       | 2.15.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.14.3       | 2.15.1       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.14.0       | 2.15.0       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.5.0        |     
                  lua-argparse |  GUESS   | https://release-monitoring.org/project/007317 | 0.7.1-1      | 0.7.2        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                      lua-zlib |  GUESS   | https://release-monitoring.org/project/380938 | 1.3-0        | 1.4          |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/001856 | 3.12.2       | 3.13.0       |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.2        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.51.0-1     | 1.52.1-0     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.41      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 6.0.6        | 7.0.0        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/001866 | 1.25         | 1.26         | ORPH
                         lzlib |  DISTRO  | https://release-monitoring.org/project/021513 | 0.4.1.53-4   | 0.4.3        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 26.01        | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.8        | 1.7.9        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.15     | 12.3.1       | ORPH
              matchbox-desktop |  DISTRO  | https://release-monitoring.org/project/235369 | 0.9.1        | 2.0          | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.30       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 3.6.6        | 4.1.0        |     
                        mbpoll |  DISTRO  | https://release-monitoring.org/project/368619 | 1.5.2        | 1.5.4        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20260511     |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.8.2      |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.40       | 1.6.41       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 8.00         | 8.10         |     
               mender-artifact |  DISTRO  | https://release-monitoring.org/project/020630 | 4.2.0        | 4.4.0        |     
                    menu-cache |  DISTRO  | https://release-monitoring.org/project/001968 | 1.1.0        | 1.1.1        | ORPH
                         meson |  DISTRO  | https://release-monitoring.org/project/006472 | 1.10.1       | 1.11.1       |     
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2026.04.1    |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.2       | 1.28.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.16.1       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.2.1        |     
                  minizip-zlib |  DISTRO  | https://release-monitoring.org/project/005303 | 1.3.1        | 1.3.2        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2026.04      |     
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.30.0       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.12       | 3.0.15       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/014864 | 0.24.10      | 0.24.12      |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.40.0       | 0.41.0       |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.48       | 4.0.49       | ORPH
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
                      multicat |  DISTRO  | https://release-monitoring.org/project/021734 | 2.3          | 2.4          | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.14.3       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.27.2       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.2.16       | 2.3.2        |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.45         | 1.46         |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/002048 | 2.16.03      | 3.01         | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.26.1       | 3.27.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.9.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.6-20251231 | 6.6-20260516 | ORPH
                         ndctl |  DISTRO  | https://release-monitoring.org/project/010381 | 83           | 84           |     
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                         neard |  DISTRO  | https://release-monitoring.org/project/021866 | 0.19         | 0.20         |     
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.3.0        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.19       | 4.4.3        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.17.0      | 1.17.2       | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.37.1       | 2.10.3       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.14       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.4.5        | 2.8.2        |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/002073 | 3.10.2       | 4.0          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/021197 | 1.56.0       | 1.56.1       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.12.0       | 1.12.5       |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.68.1       | 1.69.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.28.3       | 1.31.0       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                           nnn |  DISTRO  | https://release-monitoring.org/project/017080 | 5.1          | 5.2          |     
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.22.0      | 26.1.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.22.0      | 26.1.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.3.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                         nqptp |  DISTRO  | https://release-monitoring.org/project/293307 | 1.2.4        | 1.2.8        |     
                       ntfs-3g |  DISTRO  | https://release-monitoring.org/project/002504 | 2022.10.3    | 2026.2.25    | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.108.0      | 0.112.2      | ORPH
                           nut |  DISTRO  | https://release-monitoring.org/project/002510 | 2.8.4        | 2.8.5        |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 595.71.05    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 580.95.05    | 595.71.05    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 2.15         | 3.0-a.5      | ORPH
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.18         | 2.19         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v14.4.1      | 14.5.2       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.4        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.5.4        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.24.3       | 1.25.2       | ORPH
                      openblas |  DISTRO  | https://release-monitoring.org/project/002540 | 0.3.32       | 0.3.33       |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.8.1        | 1.8.2        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.8        | 5.0.10       |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.63.1       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.4       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 13.1.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.41       | 0.4.42       | ORPH
                   paho-mqtt-c |  DISTRO  | https://release-monitoring.org/project/021375 | 1.3.15       | 1.3.16       |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.6.0        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.31         |     
                          palo |  GUESS   | https://release-monitoring.org/project/389410 | 2.28         | 2.29         |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                        parsec |  DISTRO  | https://release-monitoring.org/project/183223 | 1.4.1        | 1.5.0        |     
                        parted |  DISTRO  | https://release-monitoring.org/project/002596 | 3.6          | 3.7          |     
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.10       | ORPH
                       pcmanfm |  DISTRO  | https://release-monitoring.org/project/002607 | 1.3.2        | 1.4.0        |     
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.4.1        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                    perl-clone |  DISTRO  | https://release-monitoring.org/project/005875 | 0.47         | 0.50         |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.07         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.23         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.41         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.98         | 6.99         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.013        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.647        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.85         | 0.87         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.84         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.58        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.097        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.81         | 6.83         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/003050 | 6.14         | 6.15         |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/011809 | 5.515        | 5.517        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.052        | 0.053        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.42         | 9.45         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.53         | 1.54         |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/006578 | 1.0051       | 1.0054       |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/010665 | 2.002004     | 2.002005     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                 perl-sys-mmap |  DISTRO  | https://release-monitoring.org/project/005675 | 0.20         | 0.21         |     
           perl-time-parsedate |  DISTRO  | https://release-monitoring.org/project/003469 | 2015.103     | 2026.0219    |     
                 perl-timedate |  DISTRO  | https://release-monitoring.org/project/003463 | 2.33         | 2.35         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.27       | 5.1.28       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.5.0        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.5.0        | 3.5.1        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.8        | 1.6.5        |     
        pipewire-media-session |  DISTRO  | https://release-monitoring.org/project/236416 | 0.4.2        | 0.4.3        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.5.1        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.14.2       | 1.15.2       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.7.0       | 5.8.2        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 126          | 127          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 25.10.0      | 26.05.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.6.2        | 3.6.3        |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.17         | 4.22         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.14       | ORPH
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.10      | 0.14.11      |     
                          proj |  DISTRO  | https://release-monitoring.org/project/009463 | 9.8.0        | 9.8.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.5       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                     pure-ftpd |  DISTRO  | https://release-monitoring.org/project/003731 | 1.0.53       | 1.0.54       |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/034074 | 3.1.16       | 3.1.17       |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/021245 | 4.0.0        | 4.0.3        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.17.2       | 1.18.4       |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.22.0       | 2.23.0       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.17.0       | 2.18.0       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/026271 | 3.0.1        | 3.0.2        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.43.1       | 1.43.9       |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.43.1       | 1.43.9       |     
               python-cachelib |  DISTRO  | https://release-monitoring.org/project/101091 | 0.13.0       | 0.14.0       |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 6.2.4        | 7.1.2        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/064102 | 5.9.0        | 6.1.1        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-chardet |  DISTRO  | https://release-monitoring.org/project/003798 | 5.2.0        | 7.4.3        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.5        | 3.4.7        |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/003802 | 8.3.3        | 8.4.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.3        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 47.0.0       | 48.0.0       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.1.3        | 3.2.4        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/021697 | 1.1.0        | 1.1.1        |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 4.0.4        | 4.3.0        |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.2.1        | 5.3.0        |     
                 python-dotenv |  DISTRO  | https://release-monitoring.org/project/019788 | 1.2.1        | 1.2.2        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.1       | 0.19.2       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.13.0       | 4.13.1       |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 5.1.0        | 5.2.0        |     
   python-farama-notifications |  DISTRO  | https://release-monitoring.org/project/389426 | 0.0.4        | 0.0.6        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 25.9.23      | 25.12.19     |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.62.1       | 4.63.0       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/006459 | 3.1.46       | 3.1.50       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 16.1.0       | 16.3.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.54.5       | 3.56.3       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.49.1       | 2.53.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.74.0       | 1.75.0       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.76.0       | 1.80.0       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.76.0       | 1.80.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/003882 | 23.0.0       | 26.0.0       |     
              python-gymnasium |  DISTRO  | https://release-monitoring.org/project/289852 | 1.2.3        | 1.3.0        |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/005487 | 3.11         | 3.15         |     
              python-installer |  DISTRO  | https://release-monitoring.org/project/197662 | 1.0.0        | 1.0.1        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 9.8.0        | 9.13.0       |     
            python-iterable-io |  DISTRO  | https://release-monitoring.org/project/374467 | 1.0.1        | 1.0.4        |     
         python-jaraco-context |  DISTRO  | https://release-monitoring.org/project/062309 | 6.0.2        | 6.1.2        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.4.0        | 4.5.0        |     
            python-jaraco-text |  DISTRO  | https://release-monitoring.org/project/023436 | 4.0.0        | 4.2.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/003893 | 0.19.2       | 0.20.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/016910 | 1.4.9        | 1.5.0        |     
                  python-librt |  DISTRO  | https://release-monitoring.org/project/388232 | 0.9.0        | 0.11.0       |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.3.1        | 3.4.0        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 6.0.2        | 6.1.0        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.23.0       | 0.24.0       |     
python-magic-wormhole-mailb... |  DISTRO  | https://release-monitoring.org/project/019823 | 0.6.0        | 0.8.0        |     
         python-markdown-it-py |  DISTRO  | https://release-monitoring.org/project/088959 | 4.0.0        | 4.2.0        |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.2.1        | 0.2.2        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.11.2       | 1.13.3       |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/021702 | 1.1.4        | 1.1.5        |     
        python-mdit-py-plugins |  DISTRO  | https://release-monitoring.org/project/149444 | 0.5.0        | 0.6.1        |     
                 python-memray |  DISTRO  | https://release-monitoring.org/project/267110 | 1.19.1       | 1.19.3       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.2.0        | 3.2.1        |     
                   python-mpd2 |  DISTRO  | https://release-monitoring.org/project/019721 | 3.1.1        | 3.1.2        |     
                 python-mpmath |  DISTRO  | https://release-monitoring.org/project/003930 | 1.3.0        | 1.4.1        |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/018463 | 0.0.22       | 0.0.29       |     
                   python-mypy |  DISTRO  | https://release-monitoring.org/project/008453 | 1.19.1       | 2.1.0        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 2.4.0        | 2.4.5        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.11.5       | 3.11.9       |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 4.0.0        | 5.0.0+rtd1   |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/016689 | 0.8.6        | 0.8.7        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 12.0.0       | 12.2.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 26.1         | 26.1.1       |     
            python-poetry-core |  DISTRO  | https://release-monitoring.org/project/071155 | 2.3.2        | 2.4.0        |     
              python-propcache |  DISTRO  | https://release-monitoring.org/project/375192 | 0.4.1        | 0.5.2        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.27.2       | 1.28.0       |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/003979 | 2.9.11       | 2.9.12       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/013384 | 3.0.1        | 3.0.4        |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.11       | 0.8.1        |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/039654 | 2.13.3       | 2.13.4       |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.46.3       | 2.46.4       |     
      python-pydantic-settings |  DISTRO  | https://release-monitoring.org/project/342182 | 2.14.0       | 2.14.1       |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/021583 | 0.23.0       | 0.24.0       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.27.2.3     |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/007284 | 1.1.2        | 1.1.3        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 26.1.0       | 26.2.0       |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 1.3.0        | 1.5.0        |     
                  python-pypng |  DISTRO  | https://release-monitoring.org/project/006706 | 0.20220715.0 | 0.20250521.0 |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.13       | 1.2.14       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.6.2        | 2.0.0        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.22       | 7.1.27       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2026.1.post1 | 2026.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.1.0       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/005548 | 2026.4.4     | 2026.5.9     |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/004004 | 2.33.1       | 2.34.2       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.13.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.4        |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.19.0       | 0.19.1       |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.39.0       | 4.44.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.58.0       | 2.60.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 80.9.0       | 82.0.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 9.2.2        | 10.0.5       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.15.3       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.3        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.16.0       | 5.16.1       |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/021613 | 1.3.4        | 1.3.5        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.1        | 5.10.0       |     
                python-textual |  DISTRO  | https://release-monitoring.org/project/209284 | 8.2.5        | 8.2.6        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/021614 | 0.22.0       | 0.23.0       |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/019609 | 0.14.0       | 0.15.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/012211 | 5.14.3       | 5.15.0       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2026.4.28.13 | 2026.5.7.17  |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/004071 | 25.5.0       | 26.4.0       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.5.1        | 4.5.2        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/021617 | 1.3.4        | 2.0.0        |     
           python-types-psutil |  DISTRO  | https://release-monitoring.org/project/221807 | 7.2.2.202... | 7.2.2.202... |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.9.0.202... | 2.9.0.202... |     
       python-types-setuptools |  DISTRO  | https://release-monitoring.org/project/214295 | 82.0.0.20... | 82.0.0.20... |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/004076 | 5.12.0       | 5.12.1       |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/004078 | 2.6.3        | 2.7.0        |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/028526 | 0.46.0       | 0.47.0       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/008743 | 0.2.14       | 0.7.0        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/020617 | v3.1.1       | 3.3.3        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/006108 | 2.0.1        | 2.1.2        |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/011805 | 3.2.1        | 3.2.2        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.148.0      | 1.0.0        |     
           python-zipstream-ng |  DISTRO  | https://release-monitoring.org/project/215954 | 1.9.0        | 1.9.2        |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/066674 | 23.1.1       | 25.12.3      |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2026.10      | 2026.19      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 10.2.0       | 11.0.0       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.1        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                qoriq-mc-utils |  DISTRO  | https://release-monitoring.org/project/377824 | 10.39.0      | 10.40.0      |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 12.3.2       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.11.1       |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.9.1        | 6.11.1       |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                         quota |  DISTRO  | https://release-monitoring.org/project/004145 | 4.10         | 4.11         |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.8.0        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.15.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 62.0         | 63.0         |     
                         redis |  DISTRO  | https://release-monitoring.org/project/004181 | 8.6.2        | 8.6.3        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20250923   | 2.20260312   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.7       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.1       | 15.1.0       |     
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.48         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 11.1.1       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2510.0     | 8.2604.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.10         |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 25.02        | 25.12        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.15.3       | 0.16.11      | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 9.0.4        | 9.1.0        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 4.0.3        | 4.0.4        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.3.0        | 1.4.2        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 45.1         |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.42.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.15.0.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.2      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.2.0.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.4.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.8.0.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.6.1.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.9.1        | 08032024     |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.36      | 0.99.37      |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.4.0        |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.1          | 2.2          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.10.1       |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                     sdbus-cpp |  DISTRO  | https://release-monitoring.org/project/070626 | 2.2.1        | 2.3.0        |     
                           sdl |  DISTRO  | https://release-monitoring.org/project/004777 | 1.2.15       | 3.4.8        | ORPH
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.4        | 3.4.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 3.2.2        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/004783 | 2.2.0        | 2.4.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.4        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                         seatd |  DISTRO  | https://release-monitoring.org/project/234932 | 0.9.1        | 0.9.3        | ORPH
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.9          | 3.10         | ORPH
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.14.2       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.7        |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.5.1        | 4.6.0        | ORPH
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.18.0       | 4.19.4       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 4.3.7        | 5.0.4        | ORPH
                      shapelib |  DISTRO  | https://release-monitoring.org/project/004804 | 1.6.2        | 1.6.3        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
                   shellinabox |  DISTRO  | https://release-monitoring.org/project/009501 | 2.20         | 2.21         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       siproxd |  DISTRO  | https://release-monitoring.org/project/179540 | 0.8.3        | 0.8.4        |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.15.0.0     |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.22.0       | 1.22.2       |     
                      snagboot |  DISTRO  | https://release-monitoring.org/project/351979 | 2.5          | 2.6.1        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.8.2        | 1.8.3        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.6.3        | 3.6.4        |     
                        snooze |  DISTRO  | https://release-monitoring.org/project/376662 | 0.5          | 0.5.1        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.11.1.0     | 3.12.2.0     |     
                      softhsm2 |  DISTRO  | https://release-monitoring.org/project/004850 | 2.6.1        | 2.7.0        | ORPH
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.4.341.0    | 1.4.350.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.16.0       |     
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.22       |     
                         sshfs |  DISTRO  | https://release-monitoring.org/project/011058 | 3.7.3        | 3.7.5        | ORPH
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.3.1        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.23.7       | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                    stellarium |  DISTRO  | https://release-monitoring.org/project/004891 | 25.4         | 26.1         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.21.00      | 0.21.01      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 6.0.5        | 6.0.6        |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 26.03        |     
                      supertux |  DISTRO  | https://release-monitoring.org/project/004911 | 0.6.3        | 0.7.0-rev.1  |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/016289 | 4.2.5        | 4.3.0        | ORPH
                        swaybg |  DISTRO  | https://release-monitoring.org/project/020562 | 1.2.1        | 1.2.2        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.4.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.9        | 10.1.5       |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/015714 | 2025.05      | 2025.12      |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.41.4       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 49.0         | 50.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 3.7.11       | 4.5.4        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.9       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 258.7        | 260.1        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.14         | 3.18         | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/001982 | 2.2.1        | 2.3          |     
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.96.4       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.2        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2023.0.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.11.0       |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.3        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.8.1        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.21.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.15.10      |     
                          time |  DISTRO  | https://release-monitoring.org/project/004971 | 1.9          | 1.10         |     
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.24.0       | 2.27.0       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.1.2        |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/008699 | 1.11.2       | 1.11.3       | ORPH
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20260401     |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.7.2      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.3        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.3.1        |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/018777 | 1.9.1        | 1.9.2        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/007873 | 3.3.3        | 3.4          |     
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.2.1        | 2.3.2        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/005021 | 2025c        | 2026b        |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.19         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.9.0.1      | 4.10.0.0     |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.24.2       | 1.25.0       |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 6.2.12       | 7.2.6        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.9.7        | 1.9.17       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.91.2       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.1.1        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.52         | 6.56         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.10.0       | 2.11.3       | ORPH
                        utfcpp |  DISTRO  | https://release-monitoring.org/project/020545 | 4.0.9        | 4.1.0        |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.4       | 2.42         |     
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.4       | 2.42         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.18      | 0.56.19      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/013639 | 3.26.0       | 3.27.0       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.1.0        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.8.1        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.4        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.2148     | 9.2.0498     |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.2.0        | 3.3.0        |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.84.0       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.352      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.352      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.350.0    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.352      | ORPH
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.7        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.9.0        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.24.0       | 1.25.0       |     
                 wayland-utils |  DISTRO  | https://release-monitoring.org/project/129361 | 1.2.0        | 1.3.0        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.52.3       | 2.53.2       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 15.0.0       | 15.0.1       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 11.0         | 11.9         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.10       | 0.5.14       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.4.15       | 4.6.5        |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.10.0       | 4.0.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.50.5       | 2.52.3       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.47.1       | 0.49.1       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       | ORPH
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.30       | 2.0.0        |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.1        | 1.1.2        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.9        | 1.1.1        | ORPH
                  xapp_fstobdf |  DISTRO  | https://release-monitoring.org/project/017156 | 1.0.7        | 1.0.8        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.10       | 1.0.11       | ORPH
                      xapp_ico |  DISTRO  | https://release-monitoring.org/project/021722 | 1.0.6        | 1.0.7        | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.6        | 1.0.7        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20250912     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.3        | 1.2.4        | ORPH
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/012314 | 1.3.4        | 1.3.5        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/005164 | 1.1.2        | 1.1.3        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.1.0        | 1.1.1        |     
                      xapp_xfd |  DISTRO  | https://release-monitoring.org/project/015024 | 1.1.4        | 1.1.5        | ORPH
                    xapp_xkill |  DISTRO  | https://release-monitoring.org/project/014993 | 1.0.6        | 1.0.7        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.3        | 1.5.4        | ORPH
                xdata_xbitmaps |  DISTRO  | https://release-monitoring.org/project/013645 | 1.1.3        | 1.1.4        | ORPH
                       xdotool |  DISTRO  | https://release-monitoring.org/project/008648 | 3.20211022.1 | 4.20260303.1 | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.23       | 2.1.24       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.21.1       |     
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/015059 | 1.0.5        | 1.0.6        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.1        | 1.4.2        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.19.0       | 7.0.0        | ORPH
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.47         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.19       | 1.3.20       | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.12       | 1.8.13       | ORPH
            xlib_libXcomposite |  DISTRO  | https://release-monitoring.org/project/001769 | 0.4.6        | 0.4.7        | ORPH
               xlib_libXdamage |  DISTRO  | https://release-monitoring.org/project/001771 | 1.1.6        | 1.1.7        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.6        | 1.3.7        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.2        | 1.8.3        | ORPH
              xlib_libXinerama |  DISTRO  | https://release-monitoring.org/project/001779 | 1.1.5        | 1.1.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.2.1        | 1.3.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.4        | 1.5.5        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.14       | 1.0.15       | ORPH
              xlib_libXxf86dga |  DISTRO  | https://release-monitoring.org/project/001797 | 1.1.6        | 1.1.7        | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.6        | 1.1.7        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.8        | 1.1.9        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.3        | 1.2.0        | ORPH
                xml-security-c |  DISTRO  | https://release-monitoring.org/project/005197 | 2.0.4        | 3.0.0        | ORPH
                         xmrig |  DISTRO  | https://release-monitoring.org/project/017499 | 6.25.0       | 6.26.0       |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.14         | 6.15         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.30         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 401          | 410          | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 24.1.10      | 24.1.11      |     
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/005284 | 0.8.0        | 0.9.0        | ORPH
                            yq |  DISTRO  | https://release-monitoring.org/project/303696 | 4.49.2       | 4.53.2       |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.15.2       | 4.16.0       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.13       | 7.4.10       |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.3        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 8.2.0        |     
                        zellij |  DISTRO  | https://release-monitoring.org/project/300087 | 0.44.2       | 0.44.3       |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/011706 | 2.4.1        | 2.4.2        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/016905 | 2025c        | 2026b        |     
                  zisofs-tools |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     | ORPH
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.8        | 0.9.9        |     
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.3.0        | 3.0.2        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                  aardvark-dns | CVE-2026-35406   | https://security-tracker.debian.org/tracker/CVE-2026-35406  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                      asterisk | CVE-2026-23738   | https://security-tracker.debian.org/tracker/CVE-2026-23738  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                     capnproto | CVE-2026-32239   | https://security-tracker.debian.org/tracker/CVE-2026-32239  
                     capnproto | CVE-2026-32240   | https://security-tracker.debian.org/tracker/CVE-2026-32240  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2025-54388   | https://security-tracker.debian.org/tracker/CVE-2025-54388  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-42050   | https://security-tracker.debian.org/tracker/CVE-2026-42050  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-7598    | https://security-tracker.debian.org/tracker/CVE-2026-7598   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-3494    | https://security-tracker.debian.org/tracker/CVE-2026-3494   
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-33414   | https://security-tracker.debian.org/tracker/CVE-2026-33414  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                         putty | CVE-2026-4115    | https://security-tracker.debian.org/tracker/CVE-2026-4115   
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-urllib3 | CVE-2026-44432   | https://security-tracker.debian.org/tracker/CVE-2026-44432  
                python-urllib3 | CVE-2026-44431   | https://security-tracker.debian.org/tracker/CVE-2026-44431  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                          runc | CVE-2025-31133   | https://security-tracker.debian.org/tracker/CVE-2025-31133  
                          runc | CVE-2025-52881   | https://security-tracker.debian.org/tracker/CVE-2025-52881  
                          runc | CVE-2025-52565   | https://security-tracker.debian.org/tracker/CVE-2025-52565  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2026.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                  aardvark-dns | CVE-2026-35406   | https://security-tracker.debian.org/tracker/CVE-2026-35406  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                      asterisk | CVE-2026-23738   | https://security-tracker.debian.org/tracker/CVE-2026-23738  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
                      binutils | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
                      binutils | CVE-2025-69646   | https://security-tracker.debian.org/tracker/CVE-2025-69646  
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69645   | https://security-tracker.debian.org/tracker/CVE-2025-69645  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                     capnproto | CVE-2026-32239   | https://security-tracker.debian.org/tracker/CVE-2026-32239  
                     capnproto | CVE-2026-32240   | https://security-tracker.debian.org/tracker/CVE-2026-32240  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2025-54388   | https://security-tracker.debian.org/tracker/CVE-2025-54388  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                         expat | CVE-2026-45186   | https://security-tracker.debian.org/tracker/CVE-2026-45186  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                           frr | CVE-2026-5107    | https://security-tracker.debian.org/tracker/CVE-2026-5107   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-5450    | https://security-tracker.debian.org/tracker/CVE-2026-5450   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         glibc | CVE-2026-4437    | https://security-tracker.debian.org/tracker/CVE-2026-4437   
                         glibc | CVE-2026-4438    | https://security-tracker.debian.org/tracker/CVE-2026-4438   
                         glibc | CVE-2026-4046    | https://security-tracker.debian.org/tracker/CVE-2026-4046   
                         glibc | CVE-2026-5928    | https://security-tracker.debian.org/tracker/CVE-2026-5928   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-42050   | https://security-tracker.debian.org/tracker/CVE-2026-42050  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                      libfuse3 | CVE-2026-33150   | https://security-tracker.debian.org/tracker/CVE-2026-33150  
                      libfuse3 | CVE-2026-33179   | https://security-tracker.debian.org/tracker/CVE-2026-33179  
                     libgcrypt | CVE-2026-41989   | https://security-tracker.debian.org/tracker/CVE-2026-41989  
                     libgcrypt | CVE-2026-41990   | https://security-tracker.debian.org/tracker/CVE-2026-41990  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-7598    | https://security-tracker.debian.org/tracker/CVE-2026-7598   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                  liburiparser | CVE-2026-44927   | https://security-tracker.debian.org/tracker/CVE-2026-44927  
                  liburiparser | CVE-2026-44928   | https://security-tracker.debian.org/tracker/CVE-2026-44928  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-33298   | https://security-tracker.debian.org/tracker/CVE-2026-33298  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-3494    | https://security-tracker.debian.org/tracker/CVE-2026-3494   
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-35387   | https://security-tracker.debian.org/tracker/CVE-2026-35387  
                       openssh | CVE-2026-35386   | https://security-tracker.debian.org/tracker/CVE-2026-35386  
                       openssh | CVE-2026-35388   | https://security-tracker.debian.org/tracker/CVE-2026-35388  
                       openssh | CVE-2026-35385   | https://security-tracker.debian.org/tracker/CVE-2026-35385  
                       openssh | CVE-2026-35414   | https://security-tracker.debian.org/tracker/CVE-2026-35414  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-33414   | https://security-tracker.debian.org/tracker/CVE-2026-33414  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                         putty | CVE-2026-4115    | https://security-tracker.debian.org/tracker/CVE-2026-4115   
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-39892   | https://security-tracker.debian.org/tracker/CVE-2026-39892  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-urllib3 | CVE-2026-44432   | https://security-tracker.debian.org/tracker/CVE-2026-44432  
                python-urllib3 | CVE-2026-44431   | https://security-tracker.debian.org/tracker/CVE-2026-44431  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2026-3087    | https://security-tracker.debian.org/tracker/CVE-2026-3087   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                          runc | CVE-2025-31133   | https://security-tracker.debian.org/tracker/CVE-2025-31133  
                          runc | CVE-2025-52881   | https://security-tracker.debian.org/tracker/CVE-2025-52881  
                          runc | CVE-2025-52565   | https://security-tracker.debian.org/tracker/CVE-2025-52565  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                      suricata | CVE-2026-22264   | https://security-tracker.debian.org/tracker/CVE-2026-22264  
                      suricata | CVE-2026-22259   | https://security-tracker.debian.org/tracker/CVE-2026-22259  
                      suricata | CVE-2026-22262   | https://security-tracker.debian.org/tracker/CVE-2026-22262  
                      suricata | CVE-2026-22258   | https://security-tracker.debian.org/tracker/CVE-2026-22258  
                      suricata | CVE-2026-22261   | https://security-tracker.debian.org/tracker/CVE-2026-22261  
                      suricata | CVE-2026-31932   | https://security-tracker.debian.org/tracker/CVE-2026-31932  
                      suricata | CVE-2026-31935   | https://security-tracker.debian.org/tracker/CVE-2026-31935  
                      suricata | CVE-2026-31937   | https://security-tracker.debian.org/tracker/CVE-2026-31937  
                      suricata | CVE-2026-31933   | https://security-tracker.debian.org/tracker/CVE-2026-31933  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2026-33243   | https://security-tracker.debian.org/tracker/CVE-2026-33243  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                      asterisk | CVE-2026-23738   | https://security-tracker.debian.org/tracker/CVE-2026-23738  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
           binutils-bare-metal | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
           binutils-bare-metal | CVE-2025-69646   | https://security-tracker.debian.org/tracker/CVE-2025-69646  
           binutils-bare-metal | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
           binutils-bare-metal | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
           binutils-bare-metal | CVE-2025-69645   | https://security-tracker.debian.org/tracker/CVE-2025-69645  
           binutils-bare-metal | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
           binutils-bare-metal | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
           binutils-bare-metal | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
           binutils-bare-metal | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
           binutils-bare-metal | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2025-54605   | https://security-tracker.debian.org/tracker/CVE-2025-54605  
                       bitcoin | CVE-2025-54604   | https://security-tracker.debian.org/tracker/CVE-2025-54604  
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                      bpftrace | CVE-2024-2313    | https://security-tracker.debian.org/tracker/CVE-2024-2313   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                     capnproto | CVE-2026-32239   | https://security-tracker.debian.org/tracker/CVE-2026-32239  
                     capnproto | CVE-2026-32240   | https://security-tracker.debian.org/tracker/CVE-2026-32240  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                         expat | CVE-2026-45186   | https://security-tracker.debian.org/tracker/CVE-2026-45186  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                         forge | CVE-2025-66030   | https://security-tracker.debian.org/tracker/CVE-2025-66030  
                         forge | CVE-2025-66031   | https://security-tracker.debian.org/tracker/CVE-2025-66031  
                         forge | CVE-2025-12816   | https://security-tracker.debian.org/tracker/CVE-2025-12816  
                         forge | CVE-2026-33891   | https://security-tracker.debian.org/tracker/CVE-2026-33891  
                         forge | CVE-2026-33896   | https://security-tracker.debian.org/tracker/CVE-2026-33896  
                         forge | CVE-2026-33895   | https://security-tracker.debian.org/tracker/CVE-2026-33895  
                         forge | CVE-2026-33894   | https://security-tracker.debian.org/tracker/CVE-2026-33894  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2025-61101   | https://security-tracker.debian.org/tracker/CVE-2025-61101  
                           frr | CVE-2025-61107   | https://security-tracker.debian.org/tracker/CVE-2025-61107  
                           frr | CVE-2025-61105   | https://security-tracker.debian.org/tracker/CVE-2025-61105  
                           frr | CVE-2025-61106   | https://security-tracker.debian.org/tracker/CVE-2025-61106  
                           frr | CVE-2025-61103   | https://security-tracker.debian.org/tracker/CVE-2025-61103  
                           frr | CVE-2025-61104   | https://security-tracker.debian.org/tracker/CVE-2025-61104  
                           frr | CVE-2025-61100   | https://security-tracker.debian.org/tracker/CVE-2025-61100  
                           frr | CVE-2025-61102   | https://security-tracker.debian.org/tracker/CVE-2025-61102  
                           frr | CVE-2025-61099   | https://security-tracker.debian.org/tracker/CVE-2025-61099  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                        giflib | CVE-2026-26740   | https://security-tracker.debian.org/tracker/CVE-2026-26740  
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-5450    | https://security-tracker.debian.org/tracker/CVE-2026-5450   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         glibc | CVE-2026-4437    | https://security-tracker.debian.org/tracker/CVE-2026-4437   
                         glibc | CVE-2026-4438    | https://security-tracker.debian.org/tracker/CVE-2026-4438   
                         glibc | CVE-2026-4046    | https://security-tracker.debian.org/tracker/CVE-2026-4046   
                         glibc | CVE-2026-5928    | https://security-tracker.debian.org/tracker/CVE-2026-5928   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                        go-bin | CVE-2025-61727   | https://security-tracker.debian.org/tracker/CVE-2025-61727  
                        go-bin | CVE-2025-61729   | https://security-tracker.debian.org/tracker/CVE-2025-61729  
                        go-bin | CVE-2025-61732   | https://security-tracker.debian.org/tracker/CVE-2025-61732  
                        go-bin | CVE-2025-61726   | https://security-tracker.debian.org/tracker/CVE-2025-61726  
                        go-bin | CVE-2025-61724   | https://security-tracker.debian.org/tracker/CVE-2025-61724  
                        go-bin | CVE-2025-61731   | https://security-tracker.debian.org/tracker/CVE-2025-61731  
                        go-bin | CVE-2025-61730   | https://security-tracker.debian.org/tracker/CVE-2025-61730  
                        go-bin | CVE-2025-61728   | https://security-tracker.debian.org/tracker/CVE-2025-61728  
                        go-bin | CVE-2025-61723   | https://security-tracker.debian.org/tracker/CVE-2025-61723  
                        go-bin | CVE-2025-58188   | https://security-tracker.debian.org/tracker/CVE-2025-58188  
                        go-bin | CVE-2025-58187   | https://security-tracker.debian.org/tracker/CVE-2025-58187  
                        go-bin | CVE-2025-58189   | https://security-tracker.debian.org/tracker/CVE-2025-58189  
                        go-bin | CVE-2025-58185   | https://security-tracker.debian.org/tracker/CVE-2025-58185  
                        go-bin | CVE-2025-47912   | https://security-tracker.debian.org/tracker/CVE-2025-47912  
                        go-bin | CVE-2025-68119   | https://security-tracker.debian.org/tracker/CVE-2025-68119  
                        go-bin | CVE-2025-68121   | https://security-tracker.debian.org/tracker/CVE-2025-68121  
                        go-bin | CVE-2026-42499   | https://security-tracker.debian.org/tracker/CVE-2026-42499  
                        go-bin | CVE-2026-33811   | https://security-tracker.debian.org/tracker/CVE-2026-33811  
                        go-bin | CVE-2026-33814   | https://security-tracker.debian.org/tracker/CVE-2026-33814  
                        go-bin | CVE-2026-42501   | https://security-tracker.debian.org/tracker/CVE-2026-42501  
                        go-bin | CVE-2026-39817   | https://security-tracker.debian.org/tracker/CVE-2026-39817  
                        go-bin | CVE-2026-39836   | https://security-tracker.debian.org/tracker/CVE-2026-39836  
                        go-bin | CVE-2026-39819   | https://security-tracker.debian.org/tracker/CVE-2026-39819  
                        go-bin | CVE-2026-39823   | https://security-tracker.debian.org/tracker/CVE-2026-39823  
                        go-bin | CVE-2026-39820   | https://security-tracker.debian.org/tracker/CVE-2026-39820  
                        go-bin | CVE-2026-39825   | https://security-tracker.debian.org/tracker/CVE-2026-39825  
                        go-bin | CVE-2026-39826   | https://security-tracker.debian.org/tracker/CVE-2026-39826  
                        go-bin | CVE-2026-27140   | https://security-tracker.debian.org/tracker/CVE-2026-27140  
                        go-bin | CVE-2026-27139   | https://security-tracker.debian.org/tracker/CVE-2026-27139  
                        go-bin | CVE-2026-27144   | https://security-tracker.debian.org/tracker/CVE-2026-27144  
                        go-bin | CVE-2026-27142   | https://security-tracker.debian.org/tracker/CVE-2026-27142  
                        go-bin | CVE-2026-27143   | https://security-tracker.debian.org/tracker/CVE-2026-27143  
                        go-bin | CVE-2026-25679   | https://security-tracker.debian.org/tracker/CVE-2026-25679  
                        go-bin | CVE-2026-32280   | https://security-tracker.debian.org/tracker/CVE-2026-32280  
                        go-bin | CVE-2026-32283   | https://security-tracker.debian.org/tracker/CVE-2026-32283  
                        go-bin | CVE-2026-32282   | https://security-tracker.debian.org/tracker/CVE-2026-32282  
                        go-bin | CVE-2026-32289   | https://security-tracker.debian.org/tracker/CVE-2026-32289  
                        go-bin | CVE-2026-32288   | https://security-tracker.debian.org/tracker/CVE-2026-32288  
                        go-bin | CVE-2026-32281   | https://security-tracker.debian.org/tracker/CVE-2026-32281  
                        go-src | CVE-2025-61727   | https://security-tracker.debian.org/tracker/CVE-2025-61727  
                        go-src | CVE-2025-61729   | https://security-tracker.debian.org/tracker/CVE-2025-61729  
                        go-src | CVE-2025-61732   | https://security-tracker.debian.org/tracker/CVE-2025-61732  
                        go-src | CVE-2025-61726   | https://security-tracker.debian.org/tracker/CVE-2025-61726  
                        go-src | CVE-2025-61724   | https://security-tracker.debian.org/tracker/CVE-2025-61724  
                        go-src | CVE-2025-61731   | https://security-tracker.debian.org/tracker/CVE-2025-61731  
                        go-src | CVE-2025-61730   | https://security-tracker.debian.org/tracker/CVE-2025-61730  
                        go-src | CVE-2025-61728   | https://security-tracker.debian.org/tracker/CVE-2025-61728  
                        go-src | CVE-2025-61723   | https://security-tracker.debian.org/tracker/CVE-2025-61723  
                        go-src | CVE-2025-58188   | https://security-tracker.debian.org/tracker/CVE-2025-58188  
                        go-src | CVE-2025-58187   | https://security-tracker.debian.org/tracker/CVE-2025-58187  
                        go-src | CVE-2025-58189   | https://security-tracker.debian.org/tracker/CVE-2025-58189  
                        go-src | CVE-2025-58185   | https://security-tracker.debian.org/tracker/CVE-2025-58185  
                        go-src | CVE-2025-47912   | https://security-tracker.debian.org/tracker/CVE-2025-47912  
                        go-src | CVE-2025-68119   | https://security-tracker.debian.org/tracker/CVE-2025-68119  
                        go-src | CVE-2025-68121   | https://security-tracker.debian.org/tracker/CVE-2025-68121  
                        go-src | CVE-2026-42499   | https://security-tracker.debian.org/tracker/CVE-2026-42499  
                        go-src | CVE-2026-33811   | https://security-tracker.debian.org/tracker/CVE-2026-33811  
                        go-src | CVE-2026-33814   | https://security-tracker.debian.org/tracker/CVE-2026-33814  
                        go-src | CVE-2026-42501   | https://security-tracker.debian.org/tracker/CVE-2026-42501  
                        go-src | CVE-2026-39817   | https://security-tracker.debian.org/tracker/CVE-2026-39817  
                        go-src | CVE-2026-39836   | https://security-tracker.debian.org/tracker/CVE-2026-39836  
                        go-src | CVE-2026-39819   | https://security-tracker.debian.org/tracker/CVE-2026-39819  
                        go-src | CVE-2026-39823   | https://security-tracker.debian.org/tracker/CVE-2026-39823  
                        go-src | CVE-2026-39820   | https://security-tracker.debian.org/tracker/CVE-2026-39820  
                        go-src | CVE-2026-39825   | https://security-tracker.debian.org/tracker/CVE-2026-39825  
                        go-src | CVE-2026-39826   | https://security-tracker.debian.org/tracker/CVE-2026-39826  
                        go-src | CVE-2026-27140   | https://security-tracker.debian.org/tracker/CVE-2026-27140  
                        go-src | CVE-2026-27139   | https://security-tracker.debian.org/tracker/CVE-2026-27139  
                        go-src | CVE-2026-27144   | https://security-tracker.debian.org/tracker/CVE-2026-27144  
                        go-src | CVE-2026-27142   | https://security-tracker.debian.org/tracker/CVE-2026-27142  
                        go-src | CVE-2026-27143   | https://security-tracker.debian.org/tracker/CVE-2026-27143  
                        go-src | CVE-2026-25679   | https://security-tracker.debian.org/tracker/CVE-2026-25679  
                        go-src | CVE-2026-32280   | https://security-tracker.debian.org/tracker/CVE-2026-32280  
                        go-src | CVE-2026-32283   | https://security-tracker.debian.org/tracker/CVE-2026-32283  
                        go-src | CVE-2026-32282   | https://security-tracker.debian.org/tracker/CVE-2026-32282  
                        go-src | CVE-2026-32289   | https://security-tracker.debian.org/tracker/CVE-2026-32289  
                        go-src | CVE-2026-32288   | https://security-tracker.debian.org/tracker/CVE-2026-32288  
                        go-src | CVE-2026-32281   | https://security-tracker.debian.org/tracker/CVE-2026-32281  
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
                      harfbuzz | CVE-2026-22693   | https://security-tracker.debian.org/tracker/CVE-2026-22693  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-42050   | https://security-tracker.debian.org/tracker/CVE-2026-42050  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libbson | CVE-2024-6381    | https://security-tracker.debian.org/tracker/CVE-2024-6381   
                       libbson | CVE-2025-0755    | https://security-tracker.debian.org/tracker/CVE-2025-0755   
                       libcdio | CVE-2024-36600   | https://security-tracker.debian.org/tracker/CVE-2024-36600  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2025-70968   | https://security-tracker.debian.org/tracker/CVE-2025-70968  
                  libfreeimage | CVE-2025-65803   | https://security-tracker.debian.org/tracker/CVE-2025-65803  
                     libgcrypt | CVE-2026-41989   | https://security-tracker.debian.org/tracker/CVE-2026-41989  
                      libglib2 | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
                      libglib2 | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
                      libglib2 | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
                      libglib2 | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
            libglib2-bootstrap | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
            libglib2-bootstrap | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
            libglib2-bootstrap | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-7598    | https://security-tracker.debian.org/tracker/CVE-2026-7598   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                  liburiparser | CVE-2026-44927   | https://security-tracker.debian.org/tracker/CVE-2026-44927  
                  liburiparser | CVE-2026-44928   | https://security-tracker.debian.org/tracker/CVE-2026-44928  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                  libvncserver | CVE-2026-32854   | https://security-tracker.debian.org/tracker/CVE-2026-32854  
                  libvncserver | CVE-2026-32853   | https://security-tracker.debian.org/tracker/CVE-2026-32853  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-3494    | https://security-tracker.debian.org/tracker/CVE-2026-3494   
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                        mesa3d | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                mesa3d-headers | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-35387   | https://security-tracker.debian.org/tracker/CVE-2026-35387  
                       openssh | CVE-2026-35386   | https://security-tracker.debian.org/tracker/CVE-2026-35386  
                       openssh | CVE-2026-35388   | https://security-tracker.debian.org/tracker/CVE-2026-35388  
                       openssh | CVE-2026-35385   | https://security-tracker.debian.org/tracker/CVE-2026-35385  
                       openssh | CVE-2026-35414   | https://security-tracker.debian.org/tracker/CVE-2026-35414  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2025-14179   | https://security-tracker.debian.org/tracker/CVE-2025-14179  
                           php | CVE-2026-7262    | https://security-tracker.debian.org/tracker/CVE-2026-7262   
                           php | CVE-2026-7258    | https://security-tracker.debian.org/tracker/CVE-2026-7258   
                           php | CVE-2026-7261    | https://security-tracker.debian.org/tracker/CVE-2026-7261   
                           php | CVE-2026-7259    | https://security-tracker.debian.org/tracker/CVE-2026-7259   
                           php | CVE-2026-6735    | https://security-tracker.debian.org/tracker/CVE-2026-6735   
                           php | CVE-2026-6722    | https://security-tracker.debian.org/tracker/CVE-2026-6722   
                           php | CVE-2026-7568    | https://security-tracker.debian.org/tracker/CVE-2026-7568   
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                      protobuf | CVE-2026-0994    | https://security-tracker.debian.org/tracker/CVE-2026-0994   
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2025-69228   | https://security-tracker.debian.org/tracker/CVE-2025-69228  
                python-aiohttp | CVE-2025-69230   | https://security-tracker.debian.org/tracker/CVE-2025-69230  
                python-aiohttp | CVE-2025-69227   | https://security-tracker.debian.org/tracker/CVE-2025-69227  
                python-aiohttp | CVE-2025-69229   | https://security-tracker.debian.org/tracker/CVE-2025-69229  
                python-aiohttp | CVE-2025-69226   | https://security-tracker.debian.org/tracker/CVE-2025-69226  
                python-aiohttp | CVE-2025-69223   | https://security-tracker.debian.org/tracker/CVE-2025-69223  
                python-aiohttp | CVE-2025-69224   | https://security-tracker.debian.org/tracker/CVE-2025-69224  
                python-aiohttp | CVE-2025-69225   | https://security-tracker.debian.org/tracker/CVE-2025-69225  
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-django | CVE-2026-5766    | https://security-tracker.debian.org/tracker/CVE-2026-5766   
                 python-django | CVE-2026-6907    | https://security-tracker.debian.org/tracker/CVE-2026-6907   
                 python-django | CVE-2026-35192   | https://security-tracker.debian.org/tracker/CVE-2026-35192  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-tornado | CVE-2026-35536   | https://security-tracker.debian.org/tracker/CVE-2026-35536  
                python-tornado | CVE-2026-31958   | https://security-tracker.debian.org/tracker/CVE-2026-31958  
                python-urllib3 | CVE-2026-44432   | https://security-tracker.debian.org/tracker/CVE-2026-44432  
                python-urllib3 | CVE-2026-44431   | https://security-tracker.debian.org/tracker/CVE-2026-44431  
               python-werkzeug | CVE-2025-66221   | https://security-tracker.debian.org/tracker/CVE-2025-66221  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2025-13837   | https://security-tracker.debian.org/tracker/CVE-2025-13837  
                       python3 | CVE-2025-13836   | https://security-tracker.debian.org/tracker/CVE-2025-13836  
                       python3 | CVE-2025-12781   | https://security-tracker.debian.org/tracker/CVE-2025-12781  
                       python3 | CVE-2025-12084   | https://security-tracker.debian.org/tracker/CVE-2025-12084  
                       python3 | CVE-2026-4519    | https://security-tracker.debian.org/tracker/CVE-2026-4519   
                       python3 | CVE-2026-3087    | https://security-tracker.debian.org/tracker/CVE-2026-3087   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2025-54566   | https://security-tracker.debian.org/tracker/CVE-2025-54566  
                          qemu | CVE-2025-54567   | https://security-tracker.debian.org/tracker/CVE-2025-54567  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       qt6base | CVE-2025-5683    | https://security-tracker.debian.org/tracker/CVE-2025-5683   
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                          runc | CVE-2025-31133   | https://security-tracker.debian.org/tracker/CVE-2025-31133  
                          runc | CVE-2025-52881   | https://security-tracker.debian.org/tracker/CVE-2025-52881  
                          runc | CVE-2025-52565   | https://security-tracker.debian.org/tracker/CVE-2025-52565  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         squid | CVE-2026-33515   | https://security-tracker.debian.org/tracker/CVE-2026-33515  
                         squid | CVE-2026-33526   | https://security-tracker.debian.org/tracker/CVE-2026-33526  
                         squid | CVE-2026-32748   | https://security-tracker.debian.org/tracker/CVE-2026-32748  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                      suricata | CVE-2026-22264   | https://security-tracker.debian.org/tracker/CVE-2026-22264  
                      suricata | CVE-2026-22259   | https://security-tracker.debian.org/tracker/CVE-2026-22259  
                      suricata | CVE-2026-22262   | https://security-tracker.debian.org/tracker/CVE-2026-22262  
                      suricata | CVE-2026-22258   | https://security-tracker.debian.org/tracker/CVE-2026-22258  
                      suricata | CVE-2026-22261   | https://security-tracker.debian.org/tracker/CVE-2026-22261  
                      suricata | CVE-2026-31932   | https://security-tracker.debian.org/tracker/CVE-2026-31932  
                      suricata | CVE-2026-31935   | https://security-tracker.debian.org/tracker/CVE-2026-31935  
                      suricata | CVE-2026-31937   | https://security-tracker.debian.org/tracker/CVE-2026-31937  
                      suricata | CVE-2026-31933   | https://security-tracker.debian.org/tracker/CVE-2026-31933  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40226   | https://security-tracker.debian.org/tracker/CVE-2026-40226  
                       systemd | CVE-2026-40225   | https://security-tracker.debian.org/tracker/CVE-2026-40225  
                       systemd | CVE-2026-29111   | https://security-tracker.debian.org/tracker/CVE-2026-29111  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2024-57259   | https://security-tracker.debian.org/tracker/CVE-2024-57259  
                   uboot-tools | CVE-2024-57254   | https://security-tracker.debian.org/tracker/CVE-2024-57254  
                   uboot-tools | CVE-2024-57257   | https://security-tracker.debian.org/tracker/CVE-2024-57257  
                   uboot-tools | CVE-2024-57258   | https://security-tracker.debian.org/tracker/CVE-2024-57258  
                   uboot-tools | CVE-2024-57255   | https://security-tracker.debian.org/tracker/CVE-2024-57255  
                   uboot-tools | CVE-2024-57256   | https://security-tracker.debian.org/tracker/CVE-2024-57256  
                   uboot-tools | CVE-2026-33243   | https://security-tracker.debian.org/tracker/CVE-2026-33243  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
               util-linux-libs | CVE-2026-27456   | https://security-tracker.debian.org/tracker/CVE-2026-27456  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                     wireshark | CVE-2026-0962    | https://security-tracker.debian.org/tracker/CVE-2026-0962   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
