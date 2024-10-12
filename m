Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47838D1A42D
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 03:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48A836064E;
	Sat, 12 Oct 2024 03:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pf5RtNDuL5zw; Sat, 12 Oct 2024 03:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E2E6064F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9E2E6064F;
	Sat, 12 Oct 2024 03:17:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A67291BF867
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 03:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D5996064F
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 03:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVSKApqv96e4 for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 03:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D380C6064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D380C6064E
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D380C6064E
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 03:17:28 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c957d8bce2so531173a12.2
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 20:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728703047; x=1729307847;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v9Tl2MZxogvf59OmxfLZjGBx2sqH3aatcr7F2Nx1Z7E=;
 b=OyN+8Wx9YEnkiIop1jrlDe+Eyt3kkU4MDa1PMnuCLHff3+AnFeSuWxywgcRhUUynKL
 POo6aMdVodFgax7ZJbIBNujPrB1Xvis+gSNfdysLMsB1DVHLDG3kYA92p+9oz+qYHqB8
 UxqoGPPWv2pm6TJzA12/zm9swDcmDgwPNyKFARvn/zQolkYqSneFujGw84EqpdPGq7TY
 UxYJ6UA1SXB8/TcVlLfmP6Eto9jIi6R5pP0byDDXca8BwueCcCdhzw99mBYSsz5Mxcbd
 WVl6OvpL1FpKUBFY7+Y/JPntB+iXGxaJxH3JY+TZBAJYtAezIAUaOAZjVmBzXNj6A443
 bgsA==
X-Gm-Message-State: AOJu0YxN30TpXHRliHFSrb79IeUklZd8Tl4QHwu8Z3x4iA9K9XJ4K8zA
 wEHro2SzqyQhcIQNDv6finu83GObrgp83F2lNB2HhN7+trkbF+i2ZHVopw==
X-Google-Smtp-Source: AGHT+IECtcN8/VOoHYqOi+pwYaY89rCZHTsn0SkRfzvrXXrl3n4zeBfyOESmace5cqHqjA53OahaGg==
X-Received: by 2002:a05:6402:2402:b0:5c9:137b:b81b with SMTP id
 4fb4d7f45d1cf-5c95ac50789mr1487449a12.25.1728703046184; 
 Fri, 11 Oct 2024 20:17:26 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2588sm274417466b.205.2024.10.11.20.17.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 20:17:25 -0700 (PDT)
Message-ID: <6709ea45.170a0220.51d57.b410@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 12 Oct 2024 03:17:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728703047; x=1729307847; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=v9Tl2MZxogvf59OmxfLZjGBx2sqH3aatcr7F2Nx1Z7E=;
 b=YRopGhQDYPvTzIShhvABfylx89zhnSVamsfPwlAHjM6keuRsQY49GH5IfjNdwgdMYJ
 s7qpHt9fumgNdVbI03MkzKsb66rRveIxOa1TAGE2BxRQLcSFca5tYOFF6V6e9YdX/Bub
 9dhlXtwMJohP3m06x4EcwAHvxJg9+B3+U2/5tYKSCK+Qrfxlg8h79/NJF82WCNedG0TR
 dqnGWrKC8RNaytFzSQgKsMrO6f3w4Fdh4mKEYn2yPh/Zz1sKPL/MnkJGmyI9WVBXdNSu
 ipSDmrBUcWShctqrZfGCumzviGg5RlnZZZh2/THid10UiINwmkaFRw25OuGyBnhM6bpx
 2Jqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YRopGhQD
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-11
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

Autobuild statistics for 2024-10-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  6  |  0  | 10  |
  2024.05.x  | 17  | 28  |  0  | 45  |
  2024.08.x  |  3  |  5  |  0  |  8  |
    master   | 14  | 159 |  1  | 174 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-8.10.1 | 25
               procps-ng-4.0.4 | 16
                 linux-6.10.10 | 7 
                 apache-2.4.62 | 6 
                  bind-9.18.28 | 5 
  gobject-introspection-1.76.1 | 5 
                    git-2.47.0 | 4 
            host-binutils-2.42 | 4 
              host-rust-1.80.1 | 4 
                       unknown | 4 
android-tools-4.2.2+git2013... | 3 
                  ffmpeg-6.1.2 | 3 
                 gnuplot-6.0.1 | 3 
           host-librsvg-2.50.9 | 3 
               linux-pam-1.6.1 | 3 
                 pixman-0.42.2 | 3 
               pulseaudio-17.0 | 3 
                 coreutils-9.5 | 2 
                  evilwm-1.4.3 | 2 
              fftw-quad-3.3.10 | 2 
                  libsepol-3.6 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  assimp-5.3.1 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.2 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                  boost-1.83.0 | 1 
                  brotli-1.1.0 | 1 
                     crun-1.15 | 1 
             docker-cli-27.0.3 | 1 
                   duma-2.5.21 | 1 
                   foot-1.16.2 | 1 
               freeipmi-1.6.14 | 1 
                  fwupd-1.9.20 | 1 
                 fwupd-efi-1.6 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
            gnuradio-3.10.11.0 | 1 
         gobject-introspection | 1 
          host-binutils-2.43.1 | 1 
 host-binutils-bare-metal-2.42 | 1 
   host-mender-artifact-3.11.2 | 1 
          imagemagick-7.1.1-31 | 1 
                 libcddb-1.3.2 | 1 
                libdrm-2.4.123 | 1 
               libglib2-2.76.1 | 1 
              libopenssl-3.3.2 | 1 
                   libsha1-0.3 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
                libxml2-2.13.3 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
               mariadb-10.11.6 | 1 
       matchbox-keyboard-0.1.1 | 1 
                memtest86-6.20 | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p18 | 1 
                opencv3-3.4.19 | 1 
                openswan-3.0.0 | 1 
                   pcre2-10.43 | 1 
               pcsc-lite-2.1.0 | 1 
          perl-net-ssleay-1.94 | 1 
           python-numpy-1.25.0 | 1 
rtl8189fs-9a82349c2c40515f9... | 1 
        s6-linux-utils-2.6.2.0 | 1 
          sphinxbase-5prealpha | 1 
                tpm2-tss-3.2.2 | 1 
                 uclibc-1.0.50 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/67b44527b43f2e2311695cc3b30288d86c8c0a64 |     
microblazeel | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/57a145b74e2922423ca76e5a2021ef0bcf21c8dc |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/86d2d3ca073a9dfc5628ce053d630194d2e06e93 |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/9204e68a4b0ff5abad46bfe7eabe0ce65d9182a5 |     
  powerpc    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/3ee366a02841cca25f3bb7a0b8b013d1b0f9d6de |     
   mipsel    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/370c7ef629d48a6fba2e9403b9603cab0c66e785 |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/471897bf4253c316e93a6b348b2ef07ce337b06a |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/1a7aa0213e9c0bb79ffdae740a490e158ff7a5ca |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/d105f87751747a3838df416f7a800e60947437be |     
 microblaze  |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/435e8a2575a0941bc2149050522f7c65b602123d | ORPH
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/72d5b4f5e69148d8868e508eae9e8ec0dad7efb8 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/dc566b37e00232011fb563e5a9438c31da7fd80d |     
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/58a46856cfde0785974e030ad8250783754780f2 |     
powerpc64le  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/975e280371314bb716f0615f1e57e35faddc20c2 | ORPH
   x86_64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/6503dd7676c8141e53ea4c9098e8381ba8ca96a8 | ORPH
   sh4aeb    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/bf772dfbbadbada48ddded9c242f23abe42ae183 | ORPH
  sparc64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/f8bcb2d5cefea50c617f4f1c394799ced787c10c | ORPH
microblazeel |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/10d9d394c51de00daca5d84bea514cc231410b1f | ORPH
    sh4a     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6a5eb2088d95b0bccc547cec3af1c9717e034b67 |     
   x86_64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/bc0f3df889fa127d8326a591a8611edcfb33b23c |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/4285d51ddc6e157a40377dd905ced70908a1f2da |     
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/17a002403665d5f514403d24377a4f61c60f7979 | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/593bce461be3d6ed5c83c7c47f7c6f39281cd114 | ORPH
   s390x     |           crun-1.15            | NOK | https://autobuild.buildroot.org/results/651b3aa61da771ac3aa90eb8125a6950e59a978b |     
    arm      |       docker-cli-27.0.3        | NOK | https://autobuild.buildroot.org/results/de0be3c45aa0c02fbd515908e66b4fe139c98de5 |     
   arceb     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/9bd91c046c8612abbd35c74ee4cc64c94a49c6d3 | ORPH
    mips     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/d1b16d259c92188bd8b5a2f4ef1cafdace7579e0 |     
    mips     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/43a16db24c4650e07abeecffc0702a7dd3301075 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/675b6d930f100689ab7e16d1c363f04e7c158580 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/2ae9d9edb89ee51c512655e9e91c5901388287ef |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f57cd9a05619d441d9b7d9fe519df425686c7eb6 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/78a7d14d0c9f189bd889d0a2f68cccf68ad16bc4 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/f7f8bca25dc5c526cf9291c6c3d6374d5fbdf66c | ORPH
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4f1b201e7a4690a843db7d17558a321d6b60bd19 |     
   sh4eb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/5e50920a9226c1c2111c8e6b484bdf3d0a6df4cc |     
   sparc     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/f6b87f3cb1725dc95a64fdf8d4b2773e8ad32a8b |     
   x86_64    |         fwupd-efi-1.6          | NOK | https://autobuild.buildroot.org/results/835969f8a3d2e697c90809ab81fd21d50663d7c5 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/93dce7dcc45324dcf71f81ad4fca7a581e7611cc | ORPH
  powerpc    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/80a6bb40a1c0efc1db19cb1b0928100d969e9290 | ORPH
 aarch64_be  |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/67d80fd5f07f78bd3dacbec7ed6f8050a7a247e2 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/ccc9277fbfcdcef6793d22b382270caf43479254 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/b70c06c3f8bd82393c0cf4728f734efb18381400 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/157311123eeb9c5ac6ddadfb5b4c62b4c6764189 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/385585c921c32a5e9b9f1717c7b4702c6a487767 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/739fd836166a2ca7bcb4246299672c0a03eb494a |     
   mips64    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/a93eb95a0204929d65f470c304b0b9a8c6a3f4b9 |     
   x86_64    |       gnuradio-3.10.11.0       | NOK | https://autobuild.buildroot.org/results/7c15102191dc8aeb87094a202280056c0fa6b8a5 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2e659b89e4d9a56b1aecbc23671fd140a4700094 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/cda3e45f6cf4c464134e9676f1cba0ee9d6fff53 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/71f61025c13c33bc444daee948fa89d01e6c17ed | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c15878eaf74b771c1d916e1c76783b035e82f385 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d682f210e556e96651ae89b5d931a5a44163ff03 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7640bdeaef624d8cb9e17ef388979673348ddc77 | ORPH
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/24a3b46bd7bef8c7cae3b528616d565496c23217 |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/940b62fd307208144a5e17d1bdfd7c282a3c40a4 |     
  riscv64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0b73df90319d90941c7208870dd2178f24979e71 |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8d74ddbbe60208b3bed932a69afe0a7f3f5c1efc |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f7da26b0fdbcf7350f9d30394688537e8a5fab81 |     
 aarch64_be  | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/dcaf867d3e0c0ddbaaf29e9f299674193d05a5af |     
    arm      |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/82c2652ea294907d0bc4cac92c6f552d18b712bd |     
powerpc64le  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/01fb2e1a98a1e5c65ec9ecc098627a155f1b4aca |     
  mips64el   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/da47590a178cca2eda6246440d88b2e2d8182ee0 |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/e09c789e52749adcf95cd082a636f79b6950c665 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/fea23a91a9e1e85fa3c64d3ef53865c8c9bf953d |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/c0d127095017feda93a37a4457b35a734f27d464 |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/4f55a14bd6bb56574acb74663b15d08817042303 |     
  powerpc    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/e1cacfe0cc1f3e1ad781bb922dbd3a818bed0e80 |     
   x86_64    |      imagemagick-7.1.1-31      | NOK | https://autobuild.buildroot.org/results/2202da550d2a67a2786b38792332b68bfbd86044 | ORPH
 powerpc64   |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/f9b3af64df3c79d9b3b6247634beb50d9c8b21cb |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b1c57c7a66d1537dc9b43a5c2ae14bb9ecb19adf |     
   sh4eb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e4fff4bb5e7ffea984110040677db37b34aadbcc |     
  aarch64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/85102e7c3fa3b479d1c78d662ea06e83ec35f119 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8e09546d436908f2f34504e37cb654712febf2fe |     
   sh4eb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ea1fd1a02e07406d645faef9c4455b68dd3bd8d9 |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b1903be1ca5c9b96ffe7ac7a5842fc794e04479f |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7bb3fbfa20e3347e14f5c8060b4c6319e0df55a7 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/893a1892189ddb55c08c4d7a824edcfcb2374686 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/64eac9516d91a391fdee622b135b010fa7f8e43b |     
   xtensa    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9fe6ec9e49800066ff233f54cf2dcde4ccef10b2 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/360939431003016d3c2ac12ade7d175db767d870 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/bb7a71370b6682a778e45de69054b9f495f86c4a |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9883f295905094859cb9494c4234647860bf90d3 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f691d25e0d53b12a72a3a5baa589f943c14688a4 |     
    sh4      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b6112ee0345d2f20e9c5a6ca0e5b5b96d8c28103 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5b150cb99721a5d3ee4e4bccdc8ef2a7c30739c7 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3e23bb102858f69e02f39fca9cd5d19ee8e55aa9 |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/974632fd835add9ca2e3de7d5579718b15d165b8 |     
    arm      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9a5d2daf05a901460bc51b65622d37828341702c |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/78d006211cbb617357a40d345b7145dc6af178a2 |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/11a8dc174471e93512076ce55e2e44de9febc28b |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/60a7a3e7d85bb38de2e491861734d51727527160 |     
microblazeel |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b1e01a7a6f3f40c05de51d7425aee0fdfb773fe1 |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/031e904ae2cbf3affe34207203115b666fe8b1c2 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/550c089cae7c6483e70076664afd2ae5f5a29b7d |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/17b7fe1cb89e3e794ea8f1b14b49921c48a34df9 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/e774bdedf1e54d77bfbdcece132eed0ffca34f6f |     
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/2477e26b749d4de8e645107fbeaa43867473d1da | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/74d731f8a3e93468c21bfd1d227f55d9524e14d1 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/d53a33d51acc92054be5908d1428c51f56a408be |     
    or1k     |          libsha1-0.3           | NOK | https://autobuild.buildroot.org/results/168481f7b2ae8de3b69e44aec3679bb6f31fa459 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/cb56d51885805ca8cb0d35400e2fa29a33127e06 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/6434e3d596df68f46d544da4348874e77307f2b2 |     
 aarch64_be  |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/acde5941f175e41215d86a669bbbf3a2874a5585 |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/31a7a5aabb91a3bf9dd2c0bfe5c187d06c58cb79 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/80d0c1b87be1bcf9a62b7ca3ddbd1c4e1a037069 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c0d3b86b8132890b07f78a0519ec416946d59fc6 | ORPH
powerpc64le  |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/4512cc7e168fa1a986e7442c321a4b56adf64b81 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/269d4d2b32dc8744500ef750cd64825acfcd6e69 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/f4c9e1db0977182dee6583d97fb952d7759e8d40 | ORPH
    sh4a     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/1a4225897e7660a36e057d62520ac35e68311a5b | ORPH
   nios2     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/9480de450f06da71178819be37dfd6d92d445e59 | ORPH
 powerpc64   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/97c49d4323f9175e37020cf1a3586e6d9a0e0a71 | ORPH
   x86_64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/662bacc0f65634879029086982d48b7cb16fb71e | ORPH
  riscv64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/f8d319503e46908efa50063ec4d6f96959ca1bab | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9065ef02e44b04bae86d0f6952be4768ad580ed9 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/91907d7b0c56b08e926cbf6931ca312b216be812 | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5fd57bb3608becb8198d0544819ffef84398772e | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3944f24c96de503e07aec321273a56aea1b1d4de | ORPH
  powerpc    |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/ce2e2aead03c1e2aa96d18585148ef9e65055db8 |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/e80f4de798f590b47ff23c6a5b62f279eda3b5e1 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ae8f99211a63b1afe47db8db4b93911d1045a810 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/971bd8f8e4d59ca8334d4fcd5480ba6c8419156b |     
  sparc64    |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/11a9d443727831ce5f7e140571fbfabc2ff1d1a0 | ORPH
   sparc     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/ecf771b5465d513cde0e4d232dbf7c5fdebebbff | ORPH
  mips64el   |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/22746edb8cfbc91d21e2aa490a7525aab7253a57 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/5ced2d3897ad09bc73b26c9a3f58e85c4edc7f46 | ORPH
 microblaze  |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/2939d6540edc29cbe26132aceddb7553e7c0bb5d |     
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/f13a3b67ee50888a77d04283c01725a627da2d71 | ORPH
 aarch64_be  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/37b51533592669be09c7ba3fecbd66b2a8b09902 | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/8608547a063126b8023f85f430d562d7c6d914de | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bb38675b2cd41e6388e375332a8c768e0ed0d17b | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/eedee279c75f572591900010063a9b99f2766b92 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3e7261a8f6cce03f2940983cec4b834816ca1df1 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4b2d7246992f32fecaa5c31c378e301068fe1a4a | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b15f2355a057771e5a20efd965fda42ebebfdb4e | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/eda7c51e7f4a292b0bcf52fef301c9c4938eb3ed | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/91cf2d9a45eadcd69211413c0f90dc5ee5869fd6 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c916c09d159e1e919c720363960c3a1e82f19565 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4ce32d3fcc28ff010cb87a22dc2563ab8cb890b2 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f9845172804d598870fc5bf3b4338b9e88f16514 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/978a3b3c533eab762063a279edac4afd6944b73a | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bdc872abe8270cbe7fbd96fa46e84e3d592899d7 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bd3198af8d8f7bc1e8460d603f427cd1a5823cd5 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/52023668921f23842c9f471183caf1d866873171 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/23bd85f3906bfd3de30e2533af61830dcc742742 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/312962dfbbf828b0793fe0b1c75ce95b707582e4 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/28e0e62ea4bc0c6238c9d65c7a11202fb26224bd | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/3384624b5a07f8fb53a9016810f62d8767a65c4c | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ed7bc1bfd97e888174fe1e78d46a8d55420f7dfa | ORPH
  riscv32    |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/c0d9448194d0fafbf89598fa48246e57acfb280d |     
powerpc64le  | rtl8189fs-9a82349c2c40515f9... | NOK | https://autobuild.buildroot.org/results/83e8fef5a3f1d1337bf9665f40659a2fca029fdd |     
  powerpc    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/4023ab2ee199427520c3902f52425caec1ddf587 |     
   s390x     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/118dfe86eb63326d0c92bec78521a9c13ac17e89 |     
    arc      |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/69475363bea32336d2ba1b53a8253029ab3d9de2 | ORPH
  riscv32    |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/dfd0aa52305ca90f06849d3ddca8db4e449cf82e |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/891c6ad47b98cfce82ae7534fc45819f8c758565 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bf0360903e1f0ef8690701b2e2c64726770d0c06 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8ffdf480bc50a8d254edb2910705b897d201608b |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5f7bfa414b2e178e07d4c4d77b1609ce455b798d |     
 powerpc64   | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/f3a53190ef2ef46726bfb4e890b1aa2809cc80a5 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 2 
           host-systemd-254.13 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.6.50 | 1 
            linux-fusion-9.0.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/7fca23d967e542bed699ebf5253350ba21746da0 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/bae1911e2d28507bd89becc919f7fb7a18620118 | ORPH
 aarch64_be  |      host-systemd-254.13       | NOK | https://autobuild.buildroot.org/results/8ca87bbcb57ec29218073e4ac77a8db834d037a5 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/fb2d13467ee87aba8112163effbf9d11e8fc788a |     
    mips     |          linux-6.6.50          | NOK | https://autobuild.buildroot.org/results/8dca65e9c9a27a7375a7ee578b667797944bf7f4 | ORPH
    or1k     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/6e677a2a9e8a30f42a802206a7e8c818d29c5841 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

               procps-ng-4.0.4 | 3 
                  ffmpeg-6.1.2 | 2 
                 gnuplot-6.0.0 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  libffi-3.4.6 | 2 
                beecrypt-4.2.1 | 1 
                   bird-2.0.12 | 1 
                  cairo-1.17.4 | 1 
                   foot-1.16.2 | 1 
                gnu-efi-3.0.18 | 1 
  gobject-introspection-1.76.1 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
                host-go-1.22.5 | 1 
              host-rust-1.74.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.8.12 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
              skalibs-2.12.0.1 | 1 
               sysrepo-2.2.150 | 1 
                       unknown | 1 
                       zip-3.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         beecrypt-4.2.1         | NOK | https://autobuild.buildroot.org/results/9ee70597cd57072be029690c4a8961b1238e9b64 |     
    i686     |          bird-2.0.12           | NOK | https://autobuild.buildroot.org/results/1c5912487e129c09c4f03df0b612fbfbbb22ad96 |     
microblazeel |          cairo-1.17.4          | NOK | https://autobuild.buildroot.org/results/6eed6c9b24b1f803a65b77e2d7eac464e2c4befe |     
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a17ef26fe3a9aab2b9345c2059fcb00b12228c11 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0a0360489c93e66c92ee10866a8ec77b66f1c439 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/8d7605ec2a0e304f3b4eda34f96ffc1aba4109f7 |     
   armeb     |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/af061ac2fcd30bae0d8b3765a4935f4242f638f2 |     
microblazeel |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/78eee72eb7092f9323267a55a0ae4149ccdae76a |     
 microblaze  |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/c55c661b85edcd130ba675bd3b0f7362cae9dc97 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fc07314098d6ed7ba658eebfff6f4098ef7631a9 | ORPH
   sh4aeb    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7d48219ee838f94ee6aa69a8784b89c87168def5 |     
  aarch64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/4c6770155159beba933813da55386d205a92a98c |     
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/88d1fa7a7808c95fbe7770758bf0380809c2ac74 |     
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/28a3ca00616d16b0f99121d5cda3fa190871fe3d | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/492793eb0cc3318a60186927747f7f56358c0d12 | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/ad69844a32b336359328a6f319df698076f6f29e |     
    arc      |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/41d40cbd15fe03c1f57a90dc6307e9b0a374614a |     
   arceb     |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/89b47b4f41a7b310ded7e0b1c7a3dedd564b129f |     
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/90b17375448463a4f95e34de77a6e5bd1be7c894 | ORPH
  mips64el   |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/f80752e825762f4eaff834df85f0dbc5d8bf185a | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | https://autobuild.buildroot.org/results/7eddb8c417222db4edeefb934ea2b98dd15e9bc6 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/634f23f4bdccfd4f0d9e90001a969a223cdb8332 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a5d6dbe722105a7775988696a36a4b1f5db3065d | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ede71fc936878c92b5ccea97639f30279da49ab3 | ORPH
 powerpc64   |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/9441843131dc7ade176251ea626d030bdc0ebca2 |     
  riscv32    |        sysrepo-2.2.150         | NOK | https://autobuild.buildroot.org/results/4ac900ec2119fcdf6695a11d67dfc4dd94b51905 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/229de0ede99f67ae9945f89e14b525a808680b59 |     
  riscv32    |            zip-3.0             | NOK | https://autobuild.buildroot.org/results/4fcec93f0c3100810eb3fa5a15651f5ddf00d5b3 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                espflash-3.1.0 | 1 
               iproute2-6.10.0 | 1 
                  linux-6.10.9 | 1 
                 pixman-0.42.2 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/ff178f77f7a788831e0ceabc01804738f731ae68 |     
powerpc64le  |        iproute2-6.10.0         | NOK | https://autobuild.buildroot.org/results/aed68c40cff15fdf9215863d5095c28103cda2ed |     
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/7f19400a10c56aaa24b17c8d8fbc96090970f9dd | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/ad5071dced725c9902da3002f32518b250217efe | ORPH
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/64d02fbf66b66ecfae6f4afc13775a38300c31b2 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
