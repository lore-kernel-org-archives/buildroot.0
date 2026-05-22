Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C7CCD4F5B
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 03:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66876F5F3;
	Fri, 22 May 2026 03:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yumMU9sy5X5F; Fri, 22 May 2026 03:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81F5E6F5F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779420204;
	bh=wo+XPRvXj97jYSm/P4UdUkjGltTY+AVFGAkUFo7nng8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IqAJ5gzMZKph35HtxFuYa/v5XMHM9F3dAIjz9Y9ocZXJI3fRlXFLqgvsY8eWpWjuP
	 PBfghKdg/T7eygURAHUfbBEuPIV0JT/NqcTazRXIkVISAOsoBHcIjV9EqkcJcyYsB9
	 Mu1QARNMao+Fl047a19+FNy4XJDR8BTIQUUut3ByhbFAmKxAqPt7lmdySNcLnoVpfB
	 J8dIZ/JisP8XudmihrXn7q+bWfKzA0vfL5swQtKeJRkm9K8pva3x1DmuiAZH1tIcM9
	 1meaLjoPPBCglhIGKg/Hvz4L+gllff/rZLjJd09pqeA37J3QpORqQlVC7/Nqc5PtQB
	 9e1TXfNIIDbIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F5E6F5F4;
	Fri, 22 May 2026 03:23:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EABA265
 for <buildroot@buildroot.org>; Fri, 22 May 2026 03:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C1CD6F5F4
 for <buildroot@buildroot.org>; Fri, 22 May 2026 03:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDViMFz5ct_v for <buildroot@buildroot.org>;
 Fri, 22 May 2026 03:23:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35EFF6F5F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35EFF6F5F3
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35EFF6F5F3
 for <buildroot@buildroot.org>; Fri, 22 May 2026 03:23:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso43447285e9.1
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779420198; x=1780024998;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zr9s4THjuURRYkcdRlMgTv8pBSuAkD5G6XGxus8b9S0=;
 b=MMe09Kq6kw8zD/sm6j1VEdkDi/noN/wKhDwrnqXVijVWpyn93ScXYXlaaQG1zG6n2x
 0Wo8LzwczNYjsiLmod62OK0qNF9FbEooUX6Qxo4cL/m8DALlRsA96F91I4oWCTA+CmHc
 DpAkbZZ7qppUHNkdLT3T3uooWYt2yinv09FeKqcsJQmdNNZw5208LO+7hnu1adlurhj4
 ylN3PbsrDDewLCCXPnIHFJ7/QIroWvn3HW2jZhI/fHQM6BtY1ysy9qatlnbYdr/4qWJF
 wlz8LlQz/3aiTOdnWIjs4B6lNTJQB++z2IjabILWNx0882tTELxjszZ91ZENKitDCwxk
 9eFA==
X-Gm-Message-State: AOJu0Yx3+/G5fMdah5RuI/YCBYFS+4Ez+dnVvJJDTqJsQeP7tmgwxOtT
 TF3Dof6ZI9h4BJ1sg9pfTxJnjH1v1e0IqTAgoQYcdgi1SKK8PhmFQnIeqy9gMyye
X-Gm-Gg: Acq92OGYB8ZqIBbbUfRrMjjwlzMJWVrHPkTPQOyTxlkmOv0svAkv7356mCLtTG2/2gH
 WJWFLIfv1gUwtRGDyUORxgKuyAw23njdoaxsa3SH2j08IGNCaP0eUu9YSvPmQDQLibTV774LwEG
 vi3q0wwTtga8B1Ri6Oo6J2o9UKjONvRjA1l9/RFT/nGfjS4wMicLOL+43gQ8Z7IgedfdteRHQvz
 sfAZ5uxAZcDdOawo7iEx8Dm2m85DDoY/dnrMUGmEkyK6S5ym6L6CGZCFEX+1OZF21jIoiZA3x5x
 /Q7f4ZjZ5Qy10LkftVigajqZMO1MysxH7b1wVuL9p4HziNgsiHO7xCDM1BlvraBuR6Q7WzCWSfs
 BRSM3NmJV5vrwqC4duX65yhlgfc6hN76HHQ3VW9QtkSw47OKiPrx99pvThIAcf11yk3shqXFjQt
 Y1VSitChLgkzNxcAxnbEHFpTW6aAVyp+zyyudlw/fe
X-Received: by 2002:a05:600c:4ecc:b0:489:2005:b36e with SMTP id
 5b1f17b1804b1-490428c9564mr17456725e9.19.1779420197323; 
 Thu, 21 May 2026 20:23:17 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490417a3be1sm11141475e9.3.2026.05.21.20.23.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 20:23:16 -0700 (PDT)
Message-ID: <6a0fcc24.4c64d880.24312a.bbd7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 22 May 2026 03:23:16 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779420198; x=1780024998; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Zr9s4THjuURRYkcdRlMgTv8pBSuAkD5G6XGxus8b9S0=;
 b=ch0tHhs3+3e1S8mD1HgN+g21DjmM0Y9VL+T2psCYaaEcF7i1BhkbiCPM4mpF3LqVcw
 tJxmxVmzGZFuwSGHl25H+dTW/foqtG2XHpN0J73bdKl11d4trxF8NgD1i37gFzSXPm+d
 N5Ju7JQEq9f01sEoRJ1zgIKRKoJcWzIqIgoiOS5CPD5WTi2IjJfOJs1b8OI7wJCU9hiR
 dmmAwT2gyAlfw/4trxOR5wRk0vThxIZTX5cx8+dNd7R7ghh1Cr+oOtAujR/lPnRTvxNn
 iEFB96TJCIGtzJ6AW/iwPWRAnqomgwDK6fKyIsJYRUafdnHrFTI/I96G4Dc/OTdS7D6s
 wINQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ch0tHhs3
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-21
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

Autobuild statistics for 2026-05-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  | 56  |  0  | 69  |
  2026.02.x  |  7  | 27  |  0  | 34  |
    master   | 90  | 354 |  0  | 444 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-15.2.0 | 36
host-gobject-introspection-... | 20
                host-odb-2.4.0 | 12
            18xx-ti-utils-R8.8 | 10
               host-dracut-110 | 10
host-gcc-initial-arc-2024.1... | 10
               linux-pam-1.7.2 | 10
odhcp6c-f19dd37fb467c9cf10c... | 10
             util-linux-2.41.4 | 10
              host-pahole-1.28 | 9 
                   perl-5.42.2 | 8 
                       unknown | 8 
                      lft-3.91 | 6 
           libmicrohttpd-1.0.5 | 6 
glibc-2.43-27-g4070d808bea1... | 5 
             dahdi-linux-3.3.0 | 4 
                 host-gdb-15.2 | 4 
                  iozone-3.508 | 4 
libdill-32d0e8b733416208e04... | 4 
         libhdhomerun-20210624 | 4 
                 libzlib-1.3.2 | 4 
                 rtptools-1.22 | 4 
                 sqlite-3.53.1 | 4 
                easydbus-0.1.0 | 3 
    host-mender-artifact-4.2.0 | 3 
               libpthsem-2.0.8 | 3 
            lua-sdl2-2.0.5-6.0 | 3 
                openscap-1.4.4 | 3 
                openssh-10.3p1 | 3 
                 systemd-258.7 | 3 
                     bc-1.08.2 | 2 
                bpftool-v7.5.0 | 2 
              e2fsprogs-1.47.4 | 2 
            gdk-pixbuf-2.42.12 | 2 
  gobject-introspection-1.84.0 | 2 
           host-libtpms-0.10.2 | 2 
                host-m4-1.4.21 | 2 
            igd2-for-linux-2.2 | 2 
               libdvbcsa-1.1.0 | 2 
                 libmbus-0.9.0 | 2 
              libopenssl-3.6.2 | 2 
                libressl-3.9.2 | 2 
                  libsepol-3.9 | 2 
                       mrp-1.2 | 2 
             parsec-tool-0.7.0 | 2 
                  sdl2-2.32.10 | 2 
                  stunnel-5.78 | 2 
              tailscale-1.78.1 | 2 
           uboot-tools-2026.04 | 2 
ustream-ssl-5a81c108d20e247... | 2 
                 aichat-0.30.0 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
amazon-ecr-credential-helpe... | 1 
             batman-adv-2025.4 | 1 
                  broot-1.56.2 | 1 
                  cairo-1.18.4 | 1 
                  cjson-1.7.19 | 1 
                cryptopp-8.9.0 | 1 
                   dante-1.4.4 | 1 
           dialog-1.3-20251001 | 1 
        edk2-edk2-stable202602 | 1 
                  eudev-3.2.14 | 1 
              fftw-quad-3.3.10 | 1 
              findutils-4.10.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
               freeipmi-1.6.16 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
                 gnupg2-2.5.20 | 1 
               graphene-1.10.8 | 1 
                     grep-3.12 | 1 
             gupnp-dlna-0.12.0 | 1 
                haveged-1.9.21 | 1 
                 hidapi-0.15.0 | 1 
host-am335x-pru-package-5f3... | 1 
host-autoconf-archive-2023.... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-16.3 | 1 
           host-gengetopt-2.23 | 1 
              host-guile-3.0.9 | 1 
                 host-lzo-2.10 | 1 
               host-make-4.4.1 | 1 
            host-nettle-3.10.2 | 1 
                 host-tar-1.35 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
host-vboot-utils-7dfa482d6a... | 1 
         host-xcb-proto-1.17.0 | 1 
                   iotools-1.8 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                  janet-1.41.2 | 1 
                  kexec-2.0.32 | 1 
kismet-52bcb902e36b2df1562c... | 1 
     kvm-unit-tests-2025-06-05 | 1 
                 lcdproc-0.5.9 | 1 
                 libavif-1.4.1 | 1 
               libbluray-1.4.0 | 1 
                 libbsd-0.12.2 | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.86.5 | 1 
                   libidn-1.43 | 1 
                 libjcat-0.2.3 | 1 
                libosip2-5.3.1 | 1 
      libphidget-1.24.20260127 | 1 
               libtasn1-4.21.0 | 1 
            libunistring-1.4.2 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-7.0.9 | 1 
                   linux-tools | 1 
               llama-cpp-b8117 | 1 
                  ltrace-0.8.1 | 1 
                    lua-ev-1.5 | 1 
          lua-lunix-20220331-1 | 1 
              luabitop-1.0.2-1 | 1 
luajit-871db2c84ecefd70a850... | 1 
                mini-snmpd-1.6 | 1 
            minizip-zlib-1.3.1 | 1 
                     mtd-2.3.1 | 1 
                  multicat-2.3 | 1 
                 nettle-3.10.2 | 1 
                opencv4-4.13.0 | 1 
                 openmpi-4.1.8 | 1 
                openocd-0.12.0 | 1 
                    opus-1.6.1 | 1 
                  pdmenu-1.3.6 | 1 
phidgetwebservice-2.1.9.201... | 1 
             pptp-linux-1.10.0 | 1 
               pulseaudio-17.0 | 1 
           python-brotli-1.2.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                rocksdb-6.20.3 | 1 
         s6-networking-2.7.0.4 | 1 
toolchain-external-bootlin-... | 1 
             tpm-tools-1.3.9.1 | 1 
               trousers-0.3.15 | 1 
uhttpd-15346de8d3ba42200249... | 1 
               unixodbc-2.3.14 | 1 
          usb_modeswitch-2.6.2 | 1 
        util-linux-libs-2.41.4 | 1 
                 vmtouch-1.3.1 | 1 
               vo-aacenc-0.1.3 | 1 
        wireless_tools-30.pre9 | 1 
                 wolfssl-5.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/cb07d85251dd89094ee12bf5c60bb3f35043b4aa |     
loongarch64  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/bd109f9fa5277405a74989a75a12b70547e8148c |     
   x86_64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/5e0b7046a1d6e6dea3a6052209731f61341c377f |     
   sparc     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/bad12c187b2dcec457ce6c7ba0bb8a3658b14944 |     
microblazeel |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/8ccc642c394920b3389d06b63f49f4dc40f03dbe |     
 aarch64_be  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/5fa73ebf46d0b5fe96bfa23e89dfd35de42ac006 |     
microblazeel |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/29f65188796057c4e77ddc06bf7f1fde28ce566a |     
  riscv64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/b70839046ca1b02184f6c082deb6140044298327 |     
 aarch64_be  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/3490522e8a83d32b18e7c0c9fc03779a5d04df58 |     
   s390x     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/d371a7f456c79c00b631da33241f6666a74984ca |     
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/bd60272ff51b38c841b27f5fb49d6ca806adc87d |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/94cc455c147b0ab503814e37970d15fc49926ea8 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c8a5f9dce7404b605712f2453ddfe5501e7d434b | ORPH
   xtensa    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/f61626a583dcf1687f39a191a04c15906e5a4642 |     
   s390x     |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/0bcf7c34db71ff6a73de345a9e252575912085c0 |     
    sh4a     |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/621ec2c41e863127fa277a25f7092bc37bc7e33e |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/b4d7a49d1d75de207b74a836afd622ec32b85c7c |     
    i686     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/8cef598caba3b998e68b714091ebaf60b77ab6d5 |     
   armeb     |          broot-1.56.2          | NOK | https://autobuild.buildroot.org/results/e74e2e27d4efb2b825b888dc335046c901c16e2a |     
  riscv32    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/aa626f7b8651aceeddb367f77f0b706b5a9aa311 |     
  riscv64    |          cjson-1.7.19          | NOK | https://autobuild.buildroot.org/results/e654b5fc19ef27746c6684c1598bc88d78474547 |     
    or1k     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/fbebf28b5199a213a9a0c45da12340bd3c9b3a8a |     
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f3dea18551a1ba11657823caf0bd9f700b57ee9d | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/62ed1e761578f3d768e21d0af909035eff8a100a | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/26b85faadd25c006b4eac38d7a41980fca428b5c | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/57223d912a2109bc1b69d4cf6ece60172cf043ae | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ab95b6e1622739d89af6c6b9dc08b06aeda88c94 | ORPH
  powerpc    |      dialog-1.3-20251001       | NOK | https://autobuild.buildroot.org/results/28de26f79c0dab8bd3dc1d6e2f4df907c1ef96e8 | ORPH
  aarch64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/10d9596ae0909e3ff8326b78307f03877ee2d280 | ORPH
    arc      |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/876487dce819e1b03714e86a71a6e784e250f338 | ORPH
    mips     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/166638aac959f0406bfad0c31fe623bf976ea38b |     
    mips     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/db5f361bd8dac0d3a40cabdb5e2d1cc9e3738608 |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/b2933ce46e245efc482c4a3266d4f32c123b58b7 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b997774d4b14b0d899d182c55f9f91b17a53589b |     
powerpc64le  |          eudev-3.2.14          | NOK | https://autobuild.buildroot.org/results/aab430c85f0dfafa6be3538b6949161503d5f079 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/75360c58992ed19107d7c4b7f87c9c57e086f821 | ORPH
  riscv32    |        findutils-4.10.0        | NOK | https://autobuild.buildroot.org/results/c4880be5d998256a503a59173a915613eebceee8 | ORPH
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/ee918e8476ed843513247a72bdff26975a556505 |     
   sh4eb     |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/f66b64f886d38eb2bc2d13869b4f09cb157e5cc9 |     
    hppa     | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/f9a4035dde01afc652e37cd12d025a51fce2fe14 |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/688898c3675022935fb9a7c115c4cd934badbd71 | ORPH
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6b7d90779db2120ef946da5e4e7b6cd73e161c23 | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/8cf58d03cc26af2490523c30f92de58dc0ffb65a |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/777bd4a1f85312f1c818d4f158ad93eb14bcb42e |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/841e06f227cc5ed0fad12523197ea2abeb3d2b67 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/b8a2d7f3e11fd5b857d7e20150913e2dc97b3e8d |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/fe446a0f8ae9cd370d83712a868db14858b6a168 |     
    arm      |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/284a890e0be08ed17e3178d7ebb14a56635461bc |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8e597f695a6cd36f1920b64500e09ff9cfadf9d9 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1129f040144a9da8148a89ca2c032c38ed19dee4 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d148f61e51930225fe324a40f5216bd259b429e5 | ORPH
microblazeel |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/1df5108165f7fc6b4d68cff754bbe3bd05cb127c |     
    sh4a     |       gupnp-dlna-0.12.0        | NOK | https://autobuild.buildroot.org/results/5f69b5618aa29c48cbf706b567a5556d177246bf |     
powerpc64le  |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/0ac14ae94c1da373e033acd63c8436f2182f6b86 |     
    arc      |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/93b216651b5c8f05f507b2fafddd39cb6db18a52 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/41f5a6f794b310e5f8cbdeefebbff31371091741 |     
    mips     | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/e5dec515551e2b47fb57db4d303d2d8d0d7186ce | ORPH
 powerpc64   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b9039834e840103dcb4eb3d6e264801a358903e2 |     
  aarch64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b7a3ad457e1517ce308e80fa85484f869b5f1b15 |     
    arc      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/ff29e92496dc3ec104a18ec3c506817678a5f102 |     
  aarch64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/2b41680ba8095078a29f1ed440f6b343785b7ee7 |     
  sparc64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/6ebfbc70e2fdb2a0f67bba53d0b476fca1825496 |     
    arm      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/7afd2e7562b5cc9e7b89977354d8ce82403ffd9d |     
   sh4aeb    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/ecf8eacdce0368c59607300b26bd9b992310bfc6 |     
loongarch64  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/462eaf6821b405aa11fd81d3691d12d55712e8df |     
    m68k     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/415ac890958aab2aa1c13af4fc2b374ce1ca592c |     
   s390x     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/d80291def71c19abb303f38ed1f924413bd3122e |     
microblazeel |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/1357d92bb88a11f163caec5d0f2d21961c142103 |     
   mips64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/ada2f019f36405387d05a61f8ccfade82af0e0eb |     
   mipsel    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/4e38190d3b6873bf76e341460b9f2ce3a3f64007 |     
  powerpc    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/f117b9d7b20a4b9d3b602ce3e25a42973a2fc981 |     
    or1k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/9d5c7e9785044fd7327e6e13e7b04cec036fc2d1 |     
  mips64el   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/df99e6dc93bc0d553aff40ae354625a20a521a3b |     
   sh4eb     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/dc075ad35e441799a003b3845bad8033870e60a4 |     
   s390x     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/c83242d717661dbe7b1b769102195cf122ad76f1 |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/5493793cc82ab1ca6230bfe2ff42780bdb4ddc46 |     
   xtensa    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/88a3049f29180f60cf7fe8b9e3b56e76a47065ea |     
  mips64el   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/49cc147bbda5cccdf7a2229bfb292c00c53e910c |     
  aarch64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/fd74ba5b3b149bed83e9d49b8153d2d2362203c0 |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/de53a7dc4a8841c0dd2428a0eb2c0befb452c410 |     
microblazeel |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/a86d4a83877a8dda01ab8235e1fde7f182f07ede |     
  riscv64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/b61c7a8bfcb597e631d311939240c8fdbf00a8aa |     
    arc      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/37b075598270605bed9898c097b15d279d238912 |     
  powerpc    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/cd449ab68d70dcb526ce6229fb7f32b065560701 |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/23943f583d1f3e5ef86f0a12cfcbb46ab1d4ad2a |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/284e4e5e4573678ad249153cec120be6baf35a8e |     
   xtensa    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/c4e113530c33aba9aa103f82139931c3e26322b0 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/52d120d749a55c221b6966d11895e557d4260f17 |     
   mips64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/e726b7a04b30e9fd9d1c8b29a38b612393367a04 |     
    or1k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/5fb2616aebc1ad94068e41b6769aae8fa1212853 |     
    or1k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/b4fac52c19aa02b26ea4d21a89a20e94c2d466ff |     
   mipsel    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/3a4f9452ef6fe9b112dc3e771fe382e93404e51a |     
    i686     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/6db932cbaa319ce1d34aa8030fef63967dacceb1 |     
  powerpc    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/00d03132e882c8c7694c917b166182901db3cc90 |     
   armeb     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/6be0e50fa65b05856feb0691f2464ca367115193 |     
  powerpc    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/fb4df571dc658612aab44e34294239a680513be3 |     
  sparc64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/e12adac2ca299b98997dbe19c2a0e0134e2c49ba |     
    hppa     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/84c814f6b07ccbbe6a83d4e49993bd9e0acfb018 |     
  sparc64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/5bf0e073e43d3c63e294bab933225b103433a973 |     
powerpc64le  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/6df34d4b490bb8ee5a63c1f8ce8b15c192e9f7c3 |     
   mips64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/aca64ade45cb4c53656cc82ad20b302e1cd9dae7 |     
powerpc64le  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/97c84a216fe7153094bed61b54910d3fb0210384 |     
   x86_64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/25df909f511da90ca6f7c380fbc3830391321ee4 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/1cca40dfffefa38023eba603850a1ff92d692be3 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/81bf332b971289661473ad99e118603cb9025a1b |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/700f2b315890860ae1034627767d35df1d22303a |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/66a3ff4e5cf96b67c0c2592093a8046394ee4ba2 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/d2e59575c9521df4d9c1bb8213e04fb7150e2d9a |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/0683bc52f94bed2d922f3556725142e70962c51f |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/8bbd0edfc1eaf057a47a6ae8df6e033162586360 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/4c7bc5ac38ae1c446cccd06e1bf734843f0c50af |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/1c7340f4d35f18604e5a1d1baa97ad01de2e132d |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/5a8176148c9bcb0a11c22c5fab36eaaba4519700 |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f7ff0f52ce9b7d3244b615d60d1d265518fad119 | ORPH
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/d6f24002e9ca0543eb95777b44ff385c89cbeb91 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ce15d9e82a27f75511d906218cffa222be707bc7 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/27558388acf4449b4cddc182450fea80c9e0994c | ORPH
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/04429bc2122215f032165085cdceeb5042b16034 | ORPH
  aarch64    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/2d375dbd203d44a343b0de7cccd599c0d663c489 | ORPH
  aarch64    |      host-gengetopt-2.23       | NOK | https://autobuild.buildroot.org/results/cd644815ab4538c33a21f7f89eecc77624e290ad |     
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7283fdfd7c9ff5ed982db7b303f20d21b6b6008 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/01e77a2f9f1c9ec576ba6b0b32c4a5e0b17dbc01 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3d9fefae5c62f811ceee2fcb3d87c55bb7ccc536 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fbf4736e16526fe08acb9ab639aee2887d2bc81a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3608fa09af192f3c68f36c43f47798e99dec1b6e | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/44f281f669b1e7371a55bcab473720b229025180 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d01ff60956008f665f7d1c2e1fd2a6a7ad0f6a30 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b2aaac34216a85ec301e53c95d109510e0c4db21 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0792ee255c4f0377531e22203a50d33f39f6c093 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/827fc467e37f75933cc19d63931f3a953315acea | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/307be9625d27908666c9e560b98935ec68d4b06c | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c73b46071b9d87021c917d6c459a1d14b14be93d | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/924d46d0d5d5986541cb5f38a90e4e03c6f56689 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/acea7270fb3d97a82e1ef95f83dcd1109e160cb3 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bc3ee6ce187fbe24b54c9380888c3a15f8f2829c | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/844c48f1aed911761d914b777bfbbdc6a1ce773f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c19871fd7ec3370342c3cf63563cc240d99cad3a | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1237d7befe9b14a3137329c26570265e86e55910 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e145029678c25d7600b5185082d141220b3b3d3 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/55275e3e10aa78fe56274106d002a94a57ca66b2 | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b0f556162e6de386c0fed71e392f793a4ea171d5 |     
    m68k     |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/8abf448c4e127c1f51efe1aa05945c1d56d4eba9 |     
 powerpc64   |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/419013e29f65febf1119c8d5787b502621ecbdf0 |     
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c430a65f57c143515808385ead3211d89ee2d18e | ORPH
   x86_64    |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/9912e98cda363b2a44496a3041580735cf9bd827 | ORPH
 powerpc64   |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/55af9ad3744b4e8d2b30ac0eeba86535682a7b7b | ORPH
 powerpc64   |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/499c1cf46bad42d8a74b4c149540176c6d2927d5 | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e7372f62c9a514519e2cddd0ae2cb7f354959500 |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/8a0f3ccfdd047dcecd8c757bea83537e788f44f7 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/fd016a38647a2ea8730aa2964b1de6802e58c8e1 |     
    sh4a     |       host-nettle-3.10.2       | NOK | https://autobuild.buildroot.org/results/0ade3ae9e545f616989cc20cb49ad1f9fefb9e63 | ORPH
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3d1d7cab8bc16cec3b89e3f124cdb8986e45a8f4 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/9f34ff974889452f19c8d322c4cc6efa5d4b3dd9 | ORPH
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7d69f4098d0975ee514ebf2c6f9a73c62729fb89 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/afb439f6571ea941fb48488df1f9f159421ef1d3 | ORPH
   sh4aeb    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f772b125fc71c5172a86448caee73fa9b92d6c9d | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a284bef78fd0cd65896d83f80788ec93a30549e1 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/30af063dd8892bfd804e25469b80fe4b45bc7143 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/14c607c867e2e172fefd1d40b6b0b095c8774fbb | ORPH
  riscv32    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/36f3d6a4f532e27c21a098170ec70dd49588072e | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b74cb548c52041dcc36d4ee6826119461fb6f988 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f76e54106b728343bd7ff4cd318dc3814e489f53 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d6a563f12002bc5c8a0d3a420d2b16771bb47b48 | ORPH
    mips     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/c33bab5db9bc20a9f79e1cbb3a03f0f8eeb001a1 |     
microblazeel |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/355bbe83290c5cb7e15ffb77bada8b93fb8d3d02 |     
 microblaze  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/f730f41173e5496f8c1c9a716ba6d4cbb1fe0da4 |     
loongarch64  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/8a18d8b443dddc0b218a2697e0ed8bf821555aa3 |     
 powerpc64   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/64fd2d5199723f520e95f7e880ab542553f24c62 |     
    hppa     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/51ed6eb03d2e220be0d90ae8a641da02736970c0 |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/dd0689145e2c5cb10d696badb4f9294bcdeba42d |     
 powerpc64   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/1bff0cfddefbec6fcb56d7f2390e325ef4c1a66b |     
 powerpc64   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/35b97af1694628243ff00c9b2a0341f5af4647df |     
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3623a0be0d4766f012d5019a2621c48a645e4900 | ORPH
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/9528e938395471a248f999d8eb8035ce57abcf6f |     
    hppa     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/b7bb5c5977b90a98016186669da30eb2b4543a47 |     
  mips64el   |     host-xcb-proto-1.17.0      | NOK | https://autobuild.buildroot.org/results/45e354666b79613e489d1528f8b9673a7eb74a95 | ORPH
  aarch64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/cef8179b7e391c818ac34dd6d80914a12a5a8478 |     
  riscv32    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/333ceb962c32d4a210d03279651f2f623e67ab5c |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/d3bf1e907569b36c0051642cd48fc006e18823fc |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/09e395eb4c82f2c6326b3dfaac3b9a56bbcd1924 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1be744f067bec352e014dc467f7b1d222b4ce2f3 |     
    m68k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/28bdb6052e31e7f5c10b8cdbe29874f573fdf9de |     
    mips     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/264c6fcf7bb203ee2cf637533f5b56149078de21 |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/90f613a200dfa7b57a19ecddc26a935fadac4598 |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/385fcbd88c89fd5d5a97eeb02b63ff38320e4c69 |     
  riscv32    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/7bc544d8306ab2910a505d328090fcd8e7459a93 |     
  aarch64    | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/23a210505669847739dbb7bed5f33e643ab927cd | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/2e29b4b056fcc32673ce82a093502ecfa485ef08 |     
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/e69e04f67882661d8a891627ff46172dc72ca363 | ORPH
   armeb     |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/1cd7d582f2e01b9aec0af497ee47330003db0941 | ORPH
   armeb     |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/2a4135953e0b3eb477b0ed0ba8dfe415483429d1 | ORPH
 powerpc64   |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/77035cbda0531d2d7d09bbb5b9975d43cee60638 | ORPH
   sparc     |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/a1c925b87a53bf0e7bd5f8945b30848eb75d2253 | ORPH
loongarch64  |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/c92266a20d6641df3af7fa30b6f92b8a03b0f8b9 | ORPH
loongarch64  |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/3cdca117366936ba959f1c5f6d28543d34ff71dd | ORPH
  mips64el   |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/d00d6cb021c55918f1ef23e7ad337e05bb4cf792 |     
 microblaze  |        libbluray-1.4.0         | NOK | https://autobuild.buildroot.org/results/69065f9f3bb61ee73b400e8ee1a3600fd9d276c6 |     
   x86_64    |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/e2f1cf8f664c5553f388b00d6bbb5c1c6cc6b93e | ORPH
   armeb     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/53cf39210d70e0350964a52402cf6621330e458d |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/dcd12763a51e6d6c06145e83a57554582f315e31 |     
    arc      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c474d8215f5289f60b1faa883a2652d16a65c993 |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/2c0bf0e34126f974a965b3143a2293408a63c0e5 |     
  powerpc    |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/f3028817a7f92c9fec6dd49dd6ceb038c13d2321 |     
    arm      |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/5052a67fd267225dacd08b22044cded0d96eae04 |     
   sparc     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/7d3133cb650fa6769c7d3b7f2e2a063c4fc226df |     
    m68k     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/f57e8b7409d1f6e3f6caecdc2ef3ab825ce778e4 |     
   sparc     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/85336d6cc46e311be515f36915ad906792c07d1b |     
    i686     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/f9cf2b43f4a17b0a913e551fb91c74affff2e8e8 |     
    or1k     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/caa65548da37120a387a270df7225802bfa15628 |     
    i686     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/e252c2ac13987a8a281ffaa598af75f40dbf0076 |     
powerpc64le  |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/6727f25c312ebd7cb1f0e720728eab063ebb365a |     
   mips64    |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/b92a929aff2067de77cb4242f37abbfa0cfe8bc9 |     
    mips     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/124dc52cf28925f4e744ebd50d692c0ccaa6de2f | ORPH
    mips     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/9423e07d7a6b1fd2a07296399b41e852ff6abf2e | ORPH
  sparc64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/282f6fb2f5fd70d3ab0e225d22e0da2a4df43131 |     
    mips     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/3b80bd408e3bbed83f7e0e35dd21e4fd7eac2277 |     
   x86_64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/e650652310113d0515b8f80f5aad4fbffecac902 |     
   mipsel    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/9ea4623590222aebe66f41003430ee3a32e6a82d |     
    arc      |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/3c154a2a84bca5671b78e19e23a226b4efd11198 |     
   s390x     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/a723d493b55d5c140dba1b9902f5166b4218fc0c |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/01ce80c09c9d397dc41f8574bf1a2520a0e07400 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/b73010a6223b3cbd961cf9c7c39c6da53d27d66e | ORPH
  mips64el   |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/8c23b662ba06c3ff2531106c0db7d47aa23c3cbe |     
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/6889b3712067677e2185d3ca620cb18be373e929 |     
    mips     |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/8e29b2739956c0d9ffd880538f3fedbc7c3d355f |     
 powerpc64   |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/7b70f1eb046f1d87b914def3e3d474ae46ac0317 |     
microblazeel |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/6ff0278074bff99148648404fc26ba242d8aec0a |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/96be7e9b9967963a15d03a2dabbfd66c36ed53a0 | ORPH
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/96f95ecba7c28ee8ad5144acb5edd449b282b1e5 | ORPH
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/217809d33a18edbd7db24e6979da735b40e436a3 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/09c98ae430cc30b0861387db524c0a32114b3f77 |     
    or1k     |        libtasn1-4.21.0         | NOK | https://autobuild.buildroot.org/results/a3d35530a34b4476a46cd2987ed25fdf8f71989b | ORPH
 aarch64_be  |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/4cf82818d4242ce835d60c9d2681d37f2fcfe7fb |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/2900f24b1586571245063ed7d1018780da4ff1e7 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/9ff6fd8b8d911754dd442f220dcabc9f9be34172 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/2cf3eff72f422cc66842bb6f6936b4e706d3ee1e | ORPH
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/c075316f1793979a01e1c8c2fb243aa19a150019 | ORPH
 aarch64_be  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/5938b525eea66db87013ef09c6db6532ad13d00f | ORPH
    i586     |          linux-7.0.9           | NOK | https://autobuild.buildroot.org/results/d1ae22ac640736811f6f08707d32fab4d3a3a2b3 | ORPH
loongarch64  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/50d5ff0d14d7e40f6357b31311c234a365aa2ef1 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/63eddc3892a9c17d4e2fa22fb2ac5c31ba380c2e | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/829e0ae5104e13a3be123a14a160557fef9c2a62 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/730cbe725c8ae9f4b792498f1ca544d4dc40a119 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/6880380f57a738d1c9528fee3624bce8d50ae107 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/d343bc86c90f3d40c0416192d8e416970eb4be0b | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/cfb43929c0112a0614f08144dd97b51ac8bb08b6 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/32b77b4bb9be4df85248c64f60685c6845b292ea | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a52736f671646aa50ac50e019e89a1b87645da57 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/81635fdfc663cab8ffefe54ae1ad8c0f6814ad19 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0d8a6542a54792d85cdc571e3cfd0df16deab69d | ORPH
    m68k     |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/a896062361a69eb7dd8ebc170dd21c4234fd916f |     
   sparc     |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/89a3113cda00b20eaf25a070c8b4504046331c36 | ORPH
   mips64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/562cecf7668699bffb5e911b853566e16fbb6d84 |     
 aarch64_be  |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/f85cff7a00f6c34ce698091eac5246e43bdd0f1c |     
    mips     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/2265494e8fd3d49049d96fb23ff70ceabd3d412c |     
    sh4      |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/b25e98d28db2012be0024c28ec0a29207e39d903 |     
 aarch64_be  |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/e54cc6888f60dee474726af077274d5318554da2 |     
loongarch64  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/859f42f5a8752ac8afcf9974825818c980a60009 |     
  powerpc    | luajit-871db2c84ecefd70a850... | NOK | https://autobuild.buildroot.org/results/bd1368738e32b954f3e73c5f57a295be8672c643 |     
   armeb     |         mini-snmpd-1.6         | NOK | https://autobuild.buildroot.org/results/7493965840d44d99e62c8a0f44cfaf0681b1df9a |     
    mips     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/ddb73a261086371df572a0d37373821182ccf290 |     
    sh4a     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/50eae392968bceca3ee9e0f32e6099d9ab6190ba |     
 microblaze  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/cc73dfd756678d30f2bedbf40a45bb11020a0388 |     
   sparc     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/9d247ffe84a817ff453e2cd2cbb0400c78eece52 |     
  sparc64    |          multicat-2.3          | NOK | https://autobuild.buildroot.org/results/e4c30f03b1df5608b5fd3dda5b1186f92ebeef18 | ORPH
   mips64    |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/b8dda66f5ccb590071686cc66f192e9367e4f4aa | ORPH
    sh4a     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d82f27289d24b78732d0821adb5bc7ef95cc26de |     
  mips64el   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/c9d3a85cf482af4cc9b547916d582dbe7d2a7f0e |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/da15ddecbf964bdac80cd1ffca2329a02ffb0aa4 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/bcb8e7dc8362135286b4da54072758d1cbe0f220 |     
    sh4a     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/860858f018ad43fa0b605ac2b22dc8bec862de8f |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4033f26817224f14897d907a7e79ba56ef178957 |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/10b21caca9597002a200cc140f1ec733078a4bb4 |     
    sh4a     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/98eff8759b5b4e034fbd061fbe40286ecaec427b |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/8cfc78b9fbfd698fa92858a275491aab7cab3079 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/854e5e4878c88bba7d6745729eca2fe08baa78a8 |     
   mipsel    |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/5b2867dad0487f89ed75f721e25c641a7a03b642 |     
   mips64    |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/3e5f42c286f54f8b0d7359f9208f01a2bdee9ccc |     
   s390x     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/515f9a52e337e639e9b031403846376b6475f987 | ORPH
    i586     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/d3181ab983fd0bf046f26e2aa28aa9e6aebb7ed4 |     
  aarch64    |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/732f23f97f0d84d67107cbcde32fa2f1f2e1c4f4 |     
    mips     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/da1296631e86c846585e25b62bef44d433c89c6b |     
  powerpc    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/d3b80f547516bbe6476dc7b48e9df22fa4a5e8ca | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/2d22198707c6f9a7178209b85020b2f2be240a87 | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/166a67c8b6552ba2f62b8cb4a31c03999b8e4de0 | ORPH
   armeb     |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/1bd6aebb4c059c0e6e3e6cdaba9d6c74d9cb8dcb |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/49bf971f8b438b56341efcfa5c1492bac5b80597 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/6e9932316cab6170a91c853de41fbd202f5717fa |     
    arm      |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/1c163064682ee8823e3d65505631b8ccd005d827 |     
  aarch64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4aa6ba4ab09e480e84eb9bd274d342bdca447112 |     
   mipsel    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7082537472db4be508bd0d2459fa306d93dabe8b |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/05c7507689a848220949b9bd4f238858c4162d1f |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/398325a334223f51f42e4ab70c73c34c0f5a0138 |     
   mips64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/da0b41e94a63e1107a692ca1a1bb2dde942fd02a |     
    or1k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3cc221010829b89e1db859cc1a92e5d1b84bf519 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/94d8bb6286ad8916ba3c53e6a8cff59c1648b8ed |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/0cf6970a47e7c0c6ce767796d470340c8f8bad98 |     
   s390x     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/9a07b6627b4d9b3418bd2f92b4199fd1171131e6 |     
 aarch64_be  |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/44ad57b42e35c0625559d51c0b5602264018e204 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ee086d4bf231c843eb45dbace1751763b5235d3e | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/29e6afbff0b11841cad168bcfc779f7b6e3518de |     
 aarch64_be  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/0522410e0d8c1fc4f9afc127c220fc74bea4a367 |     
   x86_64    |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/0be00e0570d73295b3b4428af7a0a25bd87cf307 |     
    arm      |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/9bdf3912216b57a952e6464926b707203fd017b2 | ORPH
  powerpc    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/9bc43bc8891196b55e281f5321d11a8b8f43bc97 | ORPH
    i586     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/3711a9a58c42c1993f05df43516c2c61990b6b08 | ORPH
   xtensa    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/adfe668f7a4a13bc01101e12603ed58fe866345d | ORPH
    arm      |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/edaea7775b4d08040cf4cb6682fde910c59c1666 |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/234a11852760097c6d35b6e547924c0ea1e38897 |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/8e7a8122cb2e0a492083904e5e96ac975ca75f08 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/41130fcbf486a53b3a05a1d8ad2b23ba0d16a312 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/39db304b52d3ceb5c6d15c37af7ecee24fec8430 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/2752d5d32766c7dda925fc7e9624e405e31c89ee |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/7c8fa1dde917d9389790e71b9674cfe84bf29fea |     
   sparc     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/0abb53b4e74aeab296787d2b1361a77bbb61edd6 |     
    arc      |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/574bad07f5ab1553df42ea24a14fb47d5fb4f431 |     
   mips64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/2923429f4a8196db59bfe548863c936d0c34a6e6 |     
 powerpc64   |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/69df47f6ee8b30d66490ed6eca8600eaa5d05ff8 |     
 powerpc64   |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/45d5b607cfe43a1d72714fc191e0bcc2ac050c57 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/cb61e489cda9653f9926a3855404e0b1353245c4 |     
  mips64el   |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/f49a04b3ac8ef9e434c151c2ca7f8ae3687f62e1 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/77347aaca61b92d647ec2b2b7d2bc248b3ae959e | ORPH
  mips64el   |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/53045f5f25ef99461d536de67040fb9cc9832a86 |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/96df798fd12f243ec42ecd0e6da5aa156d5255ba |     
 microblaze  |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/14047f3d7b4543c6628bb155bbf2ecd2e9cb85ab | ORPH
  powerpc    |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/25c629710965c4f5123d5568f64a679c55047529 | ORPH
   mipsel    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6ffd4ec3d4e64398f6f6be066e49c5606e5ba75e | ORPH
  sparc64    |        unixodbc-2.3.14         | NOK | https://autobuild.buildroot.org/results/ceaef6d92244af36ca34ace6f3f59261e89cc77a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d2b5972164c47cf43e0ac628abc9a5b6a1388f44 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/92e89d2fa916346ae55e2998f33073709463e6ea |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/ef0b6a45b12c137bdc68ddc012ffaca25c16c9fe |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/01de47e86ed126977e26eba85245a09ec2452cc4 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/e24ebf2e6a1df701291d588a0d43aeecf453bb39 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/44239d4c2af37b91ef1ed937a842dc8e5ba74545 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8fb8f7208f315157ef88298ddc0d78c850a730a6 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3339eb189ddf2dd37b6d8a078375af17ed0d7b9d |     
   mips64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/13f057cd550d11fd9fb1bebcb90c21dae94ea65b | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3bfcb8b18622f9ec17f7533909b5c594440a859e | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/753dda317e1c13544bd038e617d01c70ee5da673 | ORPH
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/e52e5dc09e70d62c3697925037b36a14a88d3db7 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/3342711152c78e02557112d102e3af68bad57e16 |     
 aarch64_be  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/037d2a65919da217520b55a1d27009c282d9a2db |     
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/20140446746960322e136c7c30ce4b329daf159f |     
  powerpc    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/77378706fdfe7cfb046711160d5969e9ffb939b6 |     
   s390x     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/ea7953374063a63119695611d57a5032d1bdb0b7 |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/13d9e2bdf6ac08e1a3caf714481aea8eaa486732 |     
    i686     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/0f9b9f6dd95c722752c60a3e0c52a13832d09683 |     
  mips64el   |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/eff22b799447814a5976814a6e3712fef283cc08 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/24495995a7a7c337eea9977787aa9eb824e13cce |     
  riscv64    |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/444821eff82aa233fa3c416d2482df6e930daf1e |     
   sparc     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/96b786003ab8f70164c41a3339b387f1fff412cc |     
    arc      |        vo-aacenc-0.1.3         | NOK | https://autobuild.buildroot.org/results/8f8bb8f9c40a251beeda2cfb3a534ad8955ae241 | ORPH
    sh4a     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/b1504a58ce653a51b399c0303521fc1bae269847 |     
    mips     |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/f9de6baa2b4f6326835d971f3db1bd37602bb245 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

    host-gcc-bare-metal-15.2.0 | 3 
ustream-ssl-5a81c108d20e247... | 2 
                 apitrace-13.0 | 1 
        balena-engine-20.10.26 | 1 
                bpftool-v7.5.0 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                haproxy-2.6.27 | 1 
                 host-gdb-14.2 | 1 
host-gobject-introspection-... | 1 
    host-mender-artifact-4.2.0 | 1 
                 libmbus-0.9.0 | 1 
           libmicrohttpd-1.0.5 | 1 
              libopenssl-3.6.2 | 1 
     libphidget-2.1.9.20190409 | 1 
               linux-pam-1.7.2 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                openocd-0.12.0 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.42.2 | 1 
             pptp-linux-1.10.0 | 1 
                rocksdb-6.20.3 | 1 
              tailscale-1.78.1 | 1 
             tpm-tools-1.3.9.1 | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/809771f788298138406b253cac22aaef8f2373d8 |     
powerpc64le  |     balena-engine-20.10.26     | NOK | https://autobuild.buildroot.org/results/2de418c19814cdf4f9e7a48eb83d813c8546bdd7 |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/3cff05598656c8c4c18aa07cb0b8751b16e6afb3 |     
   mipsel    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/81030e39fcf5c364e5697985214cbdcad3a39564 |     
    hppa     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/3227f103eb07bab06f126f3e2791aec7229d159e |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/a1f07a7483125e101821bef4e3d0862b256890ae |     
   armeb     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/67e106e8f9e3b3ba9f3dbbce9c80af77bd46d4b4 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/6b91657e3904b2ca965aa3c2d145c8262805614d |     
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b01cae3ad67310d7cedc70ca283cc60829562cf7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5714ff2782456fb1f3e44dbea31bf9909343786f | ORPH
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/2268531019c2e357fceec372c63dbababe8b0b02 |     
   mipsel    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/cea2b897eab4c7a3aead1a5cfd451affda268e54 | ORPH
  sparc64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/c5d3c54467e7340ace798197d95e94dff8961527 |     
    hppa     |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/e97f44f3e27463912028b7fa423f7e7f7dc746c8 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/117fd9018822afabab094eb27312c618b31db1ab |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3f8343ef4e8f9b2ab4585b1db0223da2116eb38f | ORPH
   x86_64    |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/b6c043f1c3c38bebb058f4eea5358887e8c1f259 |     
 microblaze  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/57b1223dc814df168599d2653cdf7d7adaf6d868 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/b493629df5eeb652e30c9b5faca4902cd73eada1 | ORPH
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1bb217a4e7e4b91c35f0a66f3d577d95c974d03a |     
  mips64el   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/720bf214ac1d998b87b2224d2d16a9781078537c | ORPH
 powerpc64   |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/ced73ca63360e2fd47add13081e24e7f5e343daf |     
  aarch64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/97297e20af35df5ebc2e3cf180597dbae45184db |     
   sh4eb     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/b92fe9680b5f0f83a37a1c719198285142e53495 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/67f43319dcf0bd71a9ec032fac884a37971600fc |     
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/759ab8d13ea2a31f0e82e3193456ca485b57bc84 | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/96f485165e261a798b1a9d119d914656050ac686 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.4 | 3 
                   dante-1.4.4 | 2 
                freerdp-2.11.8 | 2 
  gobject-introspection-1.82.0 | 2 
host-gobject-introspection-... | 2 
        host-python-lxml-5.3.0 | 2 
              host-rust-1.82.0 | 2 
        ltp-testsuite-20250130 | 2 
             pptp-linux-1.10.0 | 2 
                    azmq-1.0.3 | 1 
              bats-core-1.11.1 | 1 
               bootstrap-4.3.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
              dropbear-2025.89 | 1 
                easyframes-0.4 | 1 
               harfbuzz-10.3.0 | 1 
                haveged-1.9.19 | 1 
               host-4th-3.64.1 | 1 
host-binutils-arc-2023.09-r... | 1 
              host-guile-3.0.9 | 1 
             host-libsepol-3.7 | 1 
    host-mender-artifact-4.0.0 | 1 
host-netsurf-buildsystem-75... | 1 
              host-pahole-1.27 | 1 
           host-systemd-256.17 | 1 
              libbytesize-2.10 | 1 
                libdnet-1.18.0 | 1 
             libexecinfo-1.1-3 | 1 
     libphidget-2.1.9.20190409 | 1 
              libudfread-1.1.2 | 1 
                libvips-8.17.2 | 1 
           libzenoh-pico-1.2.1 | 1 
                 logsurfer-1.8 | 1 
                memtest86-7.20 | 1 
            nodejs-src-22.22.0 | 1 
                   openrc-0.56 | 1 
                openswan-3.0.0 | 1 
package/linux-headers/linux... | 1 
             parsec-tool-0.7.0 | 1 
                pipewire-1.2.8 | 1 
                 pixman-0.44.2 | 1 
procrank_linux-21c30ab4514a... | 1 
          refpolicy-2.20240226 | 1 
          sphinxbase-5prealpha | 1 
                       unknown | 1 
yavta-583bedefc2a247d2cfd32... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/d6c87e7b5ba653e1acb4b777746ebb8dd7109fbf |     
 microblaze  |        bats-core-1.11.1        | NOK | https://autobuild.buildroot.org/results/45063342d6f73dcdfb07f231b2dc88d997899a56 |     
  riscv64    |        bootstrap-4.3.1         | NOK | https://autobuild.buildroot.org/results/a10d6f701359ad5bc9d9dbf6e2f65d7e27a56bdf |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/95aa3f1e2c8af04a21716e9bdbdeb482ef54c510 |     
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/82be36ed6cbf49d66952eadabc3b07d06213ce00 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/be584d147a43d327d2b9ec6c8c650512febe6f5a | ORPH
  riscv32    |        dropbear-2025.89        | NOK | https://autobuild.buildroot.org/results/1ad68256516f4b27a7d34c508ece8baa72975941 |     
   mipsel    |         easyframes-0.4         | NOK | https://autobuild.buildroot.org/results/e4f7f73cbce7c2fab469d1270e6266dbe12f4d47 |     
    mips     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/2692423bfac7139fc90658d0cfe8dad4913958ba | ORPH
    i686     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/01262a7ceb128644642105d74ca2bc9d1efbfbe2 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/72ff9c7ea2362b017a3880b1367d502312a01664 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/ffeac51c3d2e3fd6fba7fc2dc0ed478abd66c33d | ORPH
    or1k     |        harfbuzz-10.3.0         | NOK | https://autobuild.buildroot.org/results/b9166b967f98211b33542896e142b78cb31c2b3e |     
   x86_64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/f3bd704e26edf1d9c7e33e41a74537560b6ef571 |     
 aarch64_be  |        host-4th-3.64.1         | NOK | https://autobuild.buildroot.org/results/cf6ee84be9db3cf3d21bbaa354ac1ce42c442463 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/5288af496d4d5ee066ee6fd52b39dff5060d4ec1 |     
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c5ebda42c19ee2efe7c2ac51f2cf61ea6642818 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/79fbda217af82819df1c59d65a3286ac3620bb2f | ORPH
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/345ec73b8b6fcebf54dc391582ff23c8085be4af |     
   xtensa    |       host-libsepol-3.7        | NOK | https://autobuild.buildroot.org/results/b07b43aef65fb368263bb17656c9f2ccfe994b3c |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/e90c060945b2b209c3eba4e177daebb246b5f107 |     
 microblaze  | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/df62cfaccc2e43c3422787ae5751be8e35104838 | ORPH
   s390x     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/09da8f081e8b13df9a37d6064774695976287bb5 |     
   armeb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/5b3b86484c4f11e6a976bc3dbd4b0e26499fb9de |     
    mips     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9de3644bd09a24bd86b0bfcd751b45d99fac8f41 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/a2f8fcafa819ff9ca93fdfbf337ac3a7894103fc |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/3a2210fb5565a9d68ea9ccb84e20a2a6db6f5dda |     
  powerpc    |      host-systemd-256.17       | NOK | https://autobuild.buildroot.org/results/953f5aefdfa9e6509a619bb57b93bf7aa2735e9f |     
   armeb     |        libbytesize-2.10        | NOK | https://autobuild.buildroot.org/results/922dd69e64ce6ae5a302c4205b1e128d0ca0e445 | ORPH
    or1k     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/293912fb027ee74b4cbf51292ab591ecfdc9bf34 | ORPH
    sh4      |       libexecinfo-1.1-3        | NOK | https://autobuild.buildroot.org/results/df65391715416e3f1b2b2b9a80969a1fdf9c809b | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d43f5250772621bc7011d82551d66440ae35d738 |     
    arm      |        libudfread-1.1.2        | NOK | https://autobuild.buildroot.org/results/6aefdd060cd6fefc249a9693b833942b87ce4397 |     
    i686     |         libvips-8.17.2         | NOK | https://autobuild.buildroot.org/results/2024c0a898317838155a789e1dfbe463d798d905 |     
  mips64el   |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/99a2312cfcdee99091dcffd0a5c18108aaf86e45 |     
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/1994e9cff5afee23dfbce3abcb6e65b9daf5c6e6 |     
  mips64el   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/c2fd3f7a862df4b8049b4cbf7baa8ed1060e4d4e |     
  mips64el   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/f33b7cc7efed7bce10180290dd63e43138aa78e2 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/855191c41d39aaa7225adb386b8de0a3c9218d7d |     
   x86_64    |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/43428f1cbe5a15c1cdd0461c5a7e214898b743ab |     
    or1k     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/f270df27ecf58e58578b40dcd007e25b9ec54493 |     
   xtensa    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/5fd6cb5dfed13808fa2816e4507e268a69b8a486 |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/aca0924821ffe73a6ea6b72248eeb4967b367111 |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/60ae1eacbd2a288ea3d80fa5de0f7738b36f91bc |     
  mips64el   |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/2a53bd6b9c763bc2c51378e6a1aa73445eb44677 |     
  mips64el   |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/be41b700f7b8372552d5ede791105d0a52467f3c |     
    arm      |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/eed27612f15fac9f476c0b330f14bccb7fc716d4 |     
  powerpc    |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/f04e68a8f68df46ebfa323a99576c7f5bb193635 |     
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/0433bb3678b4c0599d971e24fada19109a3cd531 | ORPH
microblazeel |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/2f960613a442bd207b514878b4bd429e8eb5f45c | ORPH
    m68k     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/597cb4a66c0035bf1ca973143eb9b8c73d472df2 | ORPH
    arc      | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/44a85330f2fac0c601b55ef3d993ed1ee3983ff7 |     
  sparc64    |      refpolicy-2.20240226      | NOK | https://autobuild.buildroot.org/results/3f6335a269c73db598061b875fd2165c46cd9de6 |     
 aarch64_be  |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/a42b387f0e6a6bd47385cb03980eece043b94c83 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/bb8b933862c1b3a9b28e032ea379a5aadb35f23a |     
   s390x     | yavta-583bedefc2a247d2cfd32... | NOK | https://autobuild.buildroot.org/results/69c971529687df055b6e07237811787fcbb35b0f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
