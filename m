Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DD4C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 03:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E80605DA;
	Sun, 18 Aug 2024 03:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEpSvp96JeFF; Sun, 18 Aug 2024 03:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9700605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9700605E8;
	Sun, 18 Aug 2024 03:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD87A1BF8B4
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 03:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5D4F81021
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 03:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97SuqYZaTr1j for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 03:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8350C8101F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8350C8101F
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8350C8101F
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 03:17:24 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-52f025ab3a7so4126815e87.2
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 20:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723951042; x=1724555842;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eJL1pbzWoEtqWDq0CAWx3O9/jmwTavSPWJ8hOENZmNs=;
 b=a5PERdePDFxyWHJPas1HUdNs/0KipqHo+iZnoQfENBxo7aOcZ9rT5rKe0+jmJJn55S
 cA+BkD2Cdp3apZDcVjKR/cvK6EMpCGDPQTVG0SoB7wki2zZX1cMgPb5dRVizSyKoNFvA
 Y3hqrPLKXtVasaJ/kkoyBpb71oNZjnan1D9DK/4YRuIPr4z/HPrIRDfqRGLS2S7q4vDZ
 ZgX/0XEALdKdNVgqVSnLjjvj4/RwtODYgmzKe7xOKeHAegAluK1mNB3bvPn/zmb4eMwt
 vu6C2Rn4ThAWjJAzAWE9tQ9fTZtSdxgpsJWbPMg11Zvz0h9LyjA0hrU05/JOlGhauqPn
 zzfg==
X-Gm-Message-State: AOJu0Yzl4ZmGvD6TfEqZNKd+v1FH42MGEI8sm2PDDmxI2dYPqOmmfnT2
 F/aMLugSzRwZw806jItMkFrzt4F7MPsH93o5vU0NnYBOliGmUQT5JM4uArgT/I0y+x8i
X-Google-Smtp-Source: AGHT+IE0SCXAPZECNqgCHfb2Y4RUkPGQNMrMp4KyUg5ngAutoPY3iDhKac49HjcusmRo8vvCR+UQUQ==
X-Received: by 2002:a05:6512:3190:b0:533:6f3:9840 with SMTP id
 2adb3069b0e04-5332df369c7mr2020471e87.11.1723951041265; 
 Sat, 17 Aug 2024 20:17:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cefafsm469069866b.49.2024.08.17.20.17.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2024 20:17:21 -0700 (PDT)
Message-ID: <66c167c1.170a0220.75ab1.e8ae@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 18 Aug 2024 03:17:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723951042; x=1724555842; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eJL1pbzWoEtqWDq0CAWx3O9/jmwTavSPWJ8hOENZmNs=;
 b=Z72MdnKw5plEq2g0xVGBOL4iXa3AZpEF/6pyacWLyMFvxz9x0WZ8caRGhUnjXEklqO
 nlP9tavGoDw18FJqkaTaQ5i5cVC+woR3kkjgcBK6FUnxlZ4ibYOyXc6lNQ5s8eKRXdVd
 mDciNbWHYcAABFTi8o+GjLpmEHA3CQAEjGGuuf3prNwsq+I1JlWNjBSAS8NI/yfOvvtS
 2YBE98KRjskuQylyiCWS39l0hJmJD/BXwDp8H5BSS/TzyhXRgkb3yBSYNbUoV/LCH759
 vn1D6t7kb3XmyinWCvIjiFcXwzemkP7drDKHTsEYyWAVzFF6G5mhlmiUNhh1e3OK1sJu
 B+EQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z72MdnKw
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-17
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

Autobuild statistics for 2024-08-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  4  |  1  | 11  |
  2024.05.x  |  6  | 15  |  0  | 21  |
    master   | 90  | 141 |  0  | 231 |
     next    |  5  | 18  |  0  | 23  |

Classification of failures by reason for master
-----------------------------------------------

                     avahi-0.8 | 13
                  libffi-3.4.6 | 6 
                 openssh-9.8p1 | 6 
                   foot-1.16.2 | 5 
  gobject-introspection-1.76.1 | 5 
                  linux-6.10.3 | 5 
      python-autocommand-2.2.2 | 4 
                 apache-2.4.62 | 3 
              cache-calibrator | 3 
                gnu-efi-3.0.18 | 3 
 host-binutils-bare-metal-2.42 | 3 
host-heimdal-f4faaeaba371ff... | 3 
android-tools-4.2.2+git2013... | 2 
               collectd-5.12.0 | 2 
                gerbera-1.12.1 | 2 
glibc-2.39-74-g198632a05f6c... | 2 
                 gnuplot-6.0.1 | 2 
              host-runc-1.1.12 | 2 
               ipmitool-1_8_19 | 2 
                libcuefile-475 | 2 
                   linux-tools | 2 
                memtest86-6.20 | 2 
                    norm-1.5.8 | 2 
               procps-ng-4.0.4 | 2 
           python-daemon-3.0.1 | 2 
                       unknown | 2 
               zxing-cpp-2.2.1 | 2 
                  axel-2.17.14 | 1 
                  bcusdk-0.0.5 | 1 
                  bind-9.16.48 | 1 
                   bird-2.0.12 | 1 
                    brltty-6.6 | 1 
                  cairo-1.18.0 | 1 
               cifs-utils-6.15 | 1 
             containerd-1.7.20 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.34 | 1 
            flashrom-1.4.0-rc2 | 1 
       freeradius-server-3.2.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
        gmrender-resurrect-0.1 | 1 
             gnuradio-3.10.7.0 | 1 
             host-delve-1.22.1 | 1 
host-go-bootstrap-stage1-1.... | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.79.0 | 1 
                  iozone-3.506 | 1 
                jemalloc-5.3.0 | 1 
               libcap-ng-0.8.5 | 1 
libeastl-45469730d641868ce0... | 1 
                libesmtp-1.1.0 | 1 
               libglib2-2.76.1 | 1 
                 libjcat-0.2.1 | 1 
                  libnss-3.103 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsepol-3.6 | 1 
                 libv4l-1.24.1 | 1 
               lighttpd-1.4.76 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               mariadb-10.11.6 | 1 
                     mdadm-4.3 | 1 
           mediastreamer-4.4.8 | 1 
                  mender-3.4.0 | 1 
                  ntpsec-1.2.3 | 1 
               openblas-0.3.27 | 1 
  python-pypika-tortoise-0.1.6 | 1 
                   rauc-1.11.3 | 1 
       riemann-c-client-1.10.5 | 1 
                s6-dns-2.3.7.2 | 1 
             sofia-sip-1.13.17 | 1 
             strongswan-5.9.13 | 1 
                   swipl-9.2.6 | 1 
                 systemd-256.4 | 1 
                    uftp-5.0.3 | 1 
           wpa_supplicant-2.11 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6c17af8b000a6a4c3a9ea31574e8f3e57ddb40e7 |     
    i686     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ceaaa2d0c79a8f06833ac5d9906de4d07efd72ca |     
  sparc64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/2d3a5893de4a8ed9274e12bd123f04870bf6dc07 |     
  aarch64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/2595d2b51eb8d5d76b708ee37b7d0a81adf95d0d |     
powerpc64le  |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/42acad9651f31ae03740cefa0af12de069868fb1 |     
 microblaze  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1bc7b420c03a02b6d59a59ab2558bd75d360a75b | ORPH
    sh4a     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c023c9cf94a96fd9b48c7185821d4d16f240696c | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2bf391b93362204917a560705bc402585334ab3c | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b77dc413594cab0fe91d1659e2ac70e56d4f05be | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/997a1d3617e7e4d786025a3bc44318fbe385e211 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/50f0fc5211ca4c2634dc21e2e7c2f4424c92e480 | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a4d2b071fa34a5548b09ac453d80a5b47ff3b2b5 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9eb1d10cf3f103ded6cd6eb1c8c8897ed13fc8cd | ORPH
   mips64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d98b77737a58184fc1b3b1946976aae31efa2f34 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2121ce7368a139da09789e5fc01de6bd3af5c569 | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b094144f3f947b8244be0cea8b1495f42f880f67 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/0dc57ec09a7f6decd57d74dd66c35087ad5690e3 | ORPH
   sh4eb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2acebcfa8ac37fcf1680c352e2d8348fbbdf176e | ORPH
microblazeel |          axel-2.17.14          | NOK | http://autobuild.buildroot.net/results/3e8e9fa8e4f2244e4db38ad74b445be02f19604b |     
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3edcf26d1805da686ac63633851beb4fa2b1e19e |     
   nios2     |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/6607545904058f0cd264966e8a8dd6bc4fd74fc9 | ORPH
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/26a2bec1fce9cc0ce0fa482768c16ce521977405 |     
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/46d3c45cd1ed39c92cdd8b631d1f32827b5aab89 |     
  powerpc    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/b54698f3a7f340d0f43611f365d7a772dd14a919 |     
    m68k     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/c77ae2225599316a1ddb218f3a0bc5e256e997d3 |     
   x86_64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/6df789a3ec971b8dbe137804affcdeb18827f336 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/85cf078f205dab5097acb7d716931737cb3c2d4a |     
   sh4aeb    |        cifs-utils-6.15         | NOK | http://autobuild.buildroot.net/results/cd80c41d4f828113d19c4fc8439763cc31a8d6e4 |     
    or1k     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/3301fb6a03b1d449c1e5ff6f02e957a3d0ceae11 |     
   s390x     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/9e20ce6e2ab2198ad36a5953d4b9b5b1e04f7b31 |     
   x86_64    |       containerd-1.7.20        | NOK | http://autobuild.buildroot.net/results/ee9957ab1329a63644caea3c58ee11f705ec0bb9 |     
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1d9c447247d28b882568c4ad4cda3b681bcda07f | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f405e893fc3a887621fe05716eea25b77413bac8 | ORPH
    i686     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/19518641440f16257351eadb02b95550a5ef20a3 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/c207e241222c561c76ce98acd449c897ffe8314f | ORPH
 powerpc64   |            fio-3.34            | NOK | http://autobuild.buildroot.net/results/347617b5aad93e85b0b959c33da6ff9e4fa28e51 |     
    mips     |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.net/results/0ed35f3433f873b3ee6d066f132fdf04899a1d1a |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d3fbb60ea30541cf226eab95c7f1a0f787b14aeb |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/aeebf6f761c2e9d5f5c7895ab3f5398a64b64460 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/e907a00a5e0da029a733da295a6b7b0e14c4927b |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/3010f9c3e62f4404c8481ab5bb21dbb4be3498d5 |     
   mips64    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/84c79ec96e276602b5b973b66ffc85e7a8c06e52 |     
    arm      |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/133f895f9cd3d48d01b3ed9a35cec44ebd879bcb |     
   mips64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/36b0713e3d5e7324eb2670e10c41080250c80e97 | ORPH
   sh4eb     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/39ec01b0943dcf61dfd9956bf74f8df4837f219e |     
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/0af886556c0110131d7c23a825cc5e8e906f3343 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/2459806ae1863385819d000c9fff4f73df1cfca7 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/07de83e0d03141a7a25619d5983e20ba227b3768 |     
   sh4aeb    |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/1dd85310f29a292465e6c6d1641f6df38f704072 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/8b4a503939bdbe773ceee69e01a3ea16873a75fa |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/18e981143919323b0466ee9bc86752401e3a028c |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ec294e430b5bd3ca455f753b552d615942274e39 |     
  mips64el   |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/02783ca47ce893e3f8efd9e77f32e9383d44b393 |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/f815c42592e2d001daad94a92cd910f96a6e0de2 |     
   mipsel    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/470da15e04e6c109304004999786aece98378357 |     
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/efdd84358003f85144a266eba1f5d7a15720761f | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e04df1ac924edd34dc7b6149a9e19e4feca2e715 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6225a25b1a5dbce3e27064341f85f8a6f665c310 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/682c9b2cc0b15b3c1c6685b660e36600973b78f0 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5ff83fdb044ecdc4ce7eb530bbadd13d2fdbd752 | ORPH
   arceb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/83139f5e8e613c2e647c19b52720fd0088c62eab |     
  sparc64    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/1cb88b60ddc2dd84477c681110c875f3cca1a80a |     
   arceb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/5ab65721552d7debd213644348d6b55d2c6c68dc |     
    i586     |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/bfa3788d6bf74c7b59fe2c95620ac58001495efd |     
   sparc     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/ede9f8cacebfdc00482004b7e0b716ff1473d1dc |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/9da8055a4dbe6db6d72719c8c1736a5519a207ec | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/da5158e67629ed0ec3bbf8c42c6ebc713be4583a | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3c1913b38f6168f4bfdf0cb3405f778ce63e0fe4 | ORPH
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f42065b4bdbb453cb8318170443dc07ef650c50c |     
  mips64el   |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/0c16ff63e7d552419e93250392569c85c15cbb32 |     
    m68k     |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/caeeccd6d7b17ced3a18f07e22d1795f2798fea9 |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/d3c3c2274d3142af2133e18bec8e2554d9766eb3 |     
 aarch64_be  |          iozone-3.506          | NOK | http://autobuild.buildroot.net/results/464e485c42f588a418bf2d679e56bfbda4aaaa73 |     
  mips64el   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/6975b1bb461ec36b0538c7eff33324b9b658fde9 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/023cb96315765cd0c38295548e9be7c9f7c56ef6 |     
    m68k     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/56449f12fda3187267ba0ef53b4a14c2b420f392 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | http://autobuild.buildroot.net/results/609ba56ebc978a8404cff158fec1cfe83929eea4 |     
powerpc64le  |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/9ebdb0f05f003a700ba484bbab5f831ddc58c84f | ORPH
  aarch64    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/8cf9db8335358a7b40a386ce131701211776d737 | ORPH
  powerpc    | libeastl-45469730d641868ce0... | NOK | http://autobuild.buildroot.net/results/16e92acc37c55c1e8ceccbd1ef265bf312e43002 | ORPH
   nios2     |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/ef155322421302e29eb0cf1ee1b516fddf7cb909 | ORPH
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/38e3e22164e49c77423af25c1d06cfb19ba41cd6 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/2ed46aa452b9d22d3fea52da55b08e1946a10a41 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6892041f052d2ea6f935ea14eed83e9fe44d01fe |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b2f1472879fccb18137eb03acf5bbda93b4919ef |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/a1ba5e21414f957705ef334628306645bfbd379e |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d98fffd2e481cbdc0573ce65c87db7b14d3008db |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/450ef173784e72106ae9c709e8cc5605e0964e55 |     
  mips64el   |         libjcat-0.2.1          | NOK | http://autobuild.buildroot.net/results/1c7e2348ce59472012e1a2c5968e4256a6fb69bb |     
powerpc64le  |          libnss-3.103          | NOK | http://autobuild.buildroot.net/results/9ce99ab867a0f0aaaaf8b744e6767b5474c0862a |     
   arceb     |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.net/results/3ce091bece386e1067c83089e0e6e0cdc0f1cca0 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/335aad5ecba2a4d21772767aa3a80d7d5631f4e4 |     
   mipsel    |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/7e1050eeeaf1cd66b5f023534c7fabdb17792a7c |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/86dad3c05b586f9cf595741fb689ddf8af0b25c4 | ORPH
    i586     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e63119e21d2934b9a0af4532f172920c09c947fa | ORPH
   sh4aeb    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/56d683b30512506f0fe15e869241f11a02b4766a | ORPH
powerpc64le  |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/89f54538e5da4be188a1f7a1ee4239fc3fe9a31b | ORPH
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/eca80fdda251e0d24e384c5aa7ec41669dbee76b | ORPH
   nios2     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/076dab28eb3a3a79fe15565364d6d1ff5964f989 | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/f9f6adc76f5d6a1f837a53dcdb335c247aeaf99b | ORPH
powerpc64le  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/2712397f40020d4d6a2cd6868b81644d1a8719d2 | ORPH
powerpc64le  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/71e33a6d86ade6e47251d0f73090c9fbc3c4de14 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/d9e8d7ae078ab23c72c82e220286cb9a0c8458a5 | ORPH
   s390x     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/4a692e5aa5ac5cb409282a69f664c35611101b32 | ORPH
  riscv64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/fa21a0e0f1b295b4e60662268295fc150bbea019 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/309666dc026a8dcd5683ccfd79083a4334188f9b |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/d74d53eeca869c2e37ff82cc8351810a83e78b1b |     
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/f5d5f933f16ab5404e6b25ccd0b2796a9e24ca6e |     
 powerpc64   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/febd15947d00fa79293ba52c5ff246a9cc6a1595 | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/40238547eaf339e56746fd9cf156b26dd84bf63a | ORPH
 aarch64_be  |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/f7f548e4ba890cb43f8b31cf3e2ee5d1e17dd9a7 | ORPH
  riscv64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/ba0382cb34ccf49676261bfe540e2a4f1b09f5f5 |     
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/8da65b67d2289f017243a9f48b34374965896918 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/450c2c501710667b207b7265b044f398d2a3241c | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/20e9ba5d72a499287e9a64cfde21ea2fab67778b | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/e98ffeb6b3fa3ea0e6233cff917c4993d2038edf | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/45d3c8ea5b187dcdbcca47886aca0127ceab7ee0 | ORPH
 powerpc64   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/eb8b9da141c61710ea63f78c7f7f3df78378f856 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/643b5c7be7da0d070a56589580de73cdb2be1c7d | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/fa0ab8279a74cdccdc8d066b59f360cad1611306 | ORPH
    m68k     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/0aec2525e0074d7b3ef23b9ccfe75acf3e8bec5d |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/0e2e85eb59e31cdabf9f559ed7ffd11e6293816b |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/e3d271bbdcca529136bced3f180f812f0a6a1a4b |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/f8e17fa4144c553fc65f3dba589569cf1f2002f5 |     
   nios2     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/1092fba9eba9f92096c58ce47f6a80ad43047d83 |     
    or1k     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/267da6d508d0a97510e90750d4cdd6ce2d33d4b1 |     
  aarch64    |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/0c76648f1f0deb8c24b3565416fb6485abb513cb |     
    mips     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/7a8d2f600a1868a5c652d3ca033df3d56f9e2e94 |     
    mips     |    riemann-c-client-1.10.5     | NOK | http://autobuild.buildroot.net/results/4f8c78b144097ae35fc461a25f06418de36b524e | ORPH
    arm      |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/a84993f14f2ae94a2d70265c049af9908351f96e |     
microblazeel |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/ad93aa40805ad378fe9dce755b03111d0e4b6fa0 |     
  sparc64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/278b3f74c48c858ae368d59069752adb69c05246 |     
  powerpc    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/b837296173f2869bd5248696d19497b3345496f9 |     
  sparc64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/b5939fb9d44dc4d91e29107b1b93d7e3ee005a8f |     
   mips64    |           uftp-5.0.3           | NOK | http://autobuild.buildroot.net/results/b5648795a2766208881ccb99f88237be4739aca4 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/1ec646c8cc92b268e1fdfcc9f5f00fe9a1249640 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/57c864a146ba08c9af2e9560e0a882bc27a5a124 |     
  sparc64    |      wpa_supplicant-2.11       | NOK | http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84 |     
    i586     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/fa9de8213dd69bbb840c0a47007b7fd11b9a87d5 |     
    sh4      |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/fedfd3fd7f3fa456c9c4482492620f78843d4c56 |     
  mips64el   |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/ca7291e4dbd5e227538fdbc81de6e619f3ba0414 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
         gobject-introspection | 1 
          libcamera-apps-1.2.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | glibc-2.38-81-gc8cb4d2b86ec... | NOK | http://autobuild.buildroot.net/results/154e009e17e0d552e66e088b8ef252f5ce4b1567 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b2deb6bbc1fa2ce8b54681ca0e55a8c4c5149772 |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/003a2a5014665f29962966e4fb6fc96425b4ec9b | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d129f9df05cb8a90699b5c4706a1db2670e46fce | ORPH
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/2e97a8ed89940d3899d7cb346e16055b1a6e2d5f |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 3 
                  boost-1.83.0 | 1 
               collectd-5.12.0 | 1 
                 coreutils-9.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               ipmitool-1_8_19 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                  libffi-3.4.6 | 1 
                 openal-1.22.0 | 1 
                rocksdb-6.20.3 | 1 
rtl8812au-aircrack-ng-f2397... | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/ef5e505764c9b74de04947ff995251f623a6b952 |     
powerpc64le  |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/c0253423ad5284ea2be2581fb674adafca406c0a |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/ef4b2026799e57ba668596eca528c2a10578dfab | ORPH
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/77ff1acaa3fb06ab58f07fe87597cab799918cb8 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3e4c24c767148b37438687abd2a0db2ce14cb8d6 | ORPH
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/17b97d7de8eb95878567485d429580d858904188 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c103f035f7b19a5b8f03f57c02a89cd940b8d3ae |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0f4bc241ab3729d28822c97c088c269e1565aba5 |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/228e0679645001558a8c320c0708bff790e3215d |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/b7c4ce0efc4e3ed45a6ca4a6cd31fc502e2815aa |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/a1cc0d46932f8576f39e10c5bb44078f999f1b4b |     
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/c1d51c57d85b33b569d8b14146ffd1bbfd7f304d | ORPH
    i686     |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/42851859b39a00bf0114418c4ab5fc9097a45432 |     
    mips     | rtl8812au-aircrack-ng-f2397... | NOK | http://autobuild.buildroot.net/results/f1d5626f5698a955bf378217528fbf4f8f741435 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/412c6898532cbdd515f0ba13c2b15f6ffa646c56 |     


Classification of failures by reason for next
---------------------------------------------

            flashrom-1.4.0-rc2 | 4 
                   atop-2.10.0 | 2 
                  ffmpeg-6.1.2 | 2 
                    brltty-6.6 | 1 
            gdk-pixbuf-2.42.10 | 1 
                  libva-2.22.0 | 1 
                   luvi-2.14.0 | 1 
               mariadb-10.11.6 | 1 
                    norm-1.5.8 | 1 
      python-autocommand-2.2.2 | 1 
        s6-linux-utils-2.6.2.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/9cb9b0455e7bd49b38e5025ec9231b2911e05c4c |     
   mips64    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/4f03ba20ec08b51877982f0c71ef2ad7310b9270 |     
powerpc64le  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/bacef5d52d4efb4d3c74762e092408c63e37c393 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/74ebb170131abe517e6d4d9449f2f5cff7fb1b0b |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/3d81487dd4926b7957a294b1bff9ff157d8c4cac |     
    i686     |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.net/results/cdd328b517c026f0ff283f2828cd3e618c416936 |     
    arm      |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.net/results/5d13746576c7af9131c71a0b78b70b5837682098 |     
   sparc     |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.net/results/7c405920ba23df30d938eb4b0d14c263748cc8e1 |     
   mips64    |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.net/results/885a957d1b5305d3b91339487cc2a0d64dc74f5e |     
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/4b0ebbd3045489cbbd3e7d0087eb8696b3a997d8 | ORPH
    mips     |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/cbdb148cb3b5cc7272a797698e5902185ef3c050 |     
  aarch64    |          luvi-2.14.0           | NOK | http://autobuild.buildroot.net/results/7df13c90ff735ef6b5b179a993fe692c187225e0 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/7be2b69015921f6d52e3999b302629e7008b76fb | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8e5cedca4084dedb929dcb0d0c63e0262cbeb114 | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/a59ba186d6495d04e07f8b8788fe390378dc9027 |     
  mips64el   |     s6-linux-utils-2.6.2.0     | NOK | http://autobuild.buildroot.net/results/ea4e9c51d33c2ea6340054f77d6d86092d52aa89 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/20a2e3f242e9f37bb14bbd6dec1b6040a5cbcdfd |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2a5891f21511efdbdc87346c745247ed7d44f792 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
