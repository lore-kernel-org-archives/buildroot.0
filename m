Return-Path: <buildroot-bounces@buildroot.org>
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3688CC43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 16:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1DA4034C;
	Mon,  6 Jul 2026 16:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9lWgNbTribW; Mon,  6 Jul 2026 16:20:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5283C40520
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783354844;
	bh=0A3H7igN/vdTb66f5sL8dLitJLlwkCUrrur2FWdzgvw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ACyXZyKJz0g2gFWHq0LyFxZpLeS8kEpEHONMxy7Ugl2yXZRcGU822ovZKzq4px2cn
	 sfSbIsKih07DVP92KmkF63FAlhp3Gr+Y8LVZP56BXcVFJuWJ75vNL0g70/Phym4nmJ
	 7VNZrBqXE5BN4gBYdlJcvtosggShYnqbh1F5f21w/jQgHRgqmPIo5i0KZt0YSPnCr/
	 O6lPxgS9cXudFvQDbmsTkexGv7stfr2kc+oNc7wpVZ0p5yb7I1VQcTO+7FY3Akx6H8
	 RU6p5xLZz0B1+U5LSq+g5troYCGlpIUXk56UJaj2oKkQnI+1QOr81vtfu7bbZnYc7F
	 yhJjXtg9+nkNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5283C40520;
	Mon,  6 Jul 2026 16:20:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D3A82A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 03:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 392E68120F
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 03:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcuE-xL69ttb for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 03:29:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A7908120C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A7908120C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A7908120C
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 03:29:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4703bc0a99aso1286667f8f.3
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 20:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783308544; x=1783913344;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rxFdpRE57dffUUHngDtFEmKXDmAyTcpOEWO8rc8bKKQ=;
 b=Mx/+pe+3wLvMGbyDgfx91z0dAfC6HNZ7XhwQRnGLcxenIbi2v0aWnh9qLG/xzwmwVv
 0rLvHPXyd0hZP4YdgdDFZbo+d8cseOH1pc5Z9cNZphHEm27TTNJW3vLkw7rr0vQwfnbg
 Y2lo/jdpB9dQWORWbaJs7Q6QA/6ccwEXyXjY1wfdLUFxwrxAzLRTvno5tx+IBoiOhukL
 sA4bscJu5LZY7OHEWTpS2zVfYbjG4V/J1nmjh078aN5TCJRxUYP172G45MwsnWZer6MX
 mmAVrtXVobAxuGRBlQdP+gVe0UrJP4oW7wza5dQ21okMdoFg/D36OAJJxcpCxSM1lm5V
 pOgg==
X-Gm-Message-State: AOJu0YyExCRU6DourH9ylOvdXy4mwWsYnO1tIh75EWAdZiVrf6/qk8z9
 LyRvKRzXMW9wGXwF6I/ZjCpbU4A9oOs15LlpNoPq5FGY9DaWBn8K7n5LW4aNp9KX
X-Gm-Gg: AfdE7cmJKmPeRNR+68lvC4EQn3Nh3Bc9qSdKdVcZo14WrM1lY00uCKk5d2adbfnDQxZ
 ZPiJ8ET7KGm4phjDjKOx2/4RJR8C6t16YXG/SKIjveAfE9VSNdqnpl/lavRIMu2L8acjQkgmhYV
 KVu6H3o01IkJkBIV9CS7FOQM7mEhUM2hfP36sZA4iBWtWE9dfwIXdntPh7Fq+mwTzfv/HVMpQ0B
 nPFLciOv55QAHrH1rhpNnUDTvwHqxlHB5z7hjR0ezLEs6zo6xpQ7jXmLTdBcNe7cK/uxdywBl0L
 huNYA7JUpXGZhtVhfKy0S3wjFmgkfyw5NDci9mN2D+KDkiKO0j6qZB34IFgFpLOBgcew0Bzo0Bq
 vW4jvZwUqT48///CptXCEEqiVwbWIVItop0GKbxVeETK40kCmbSvRYReoqursy9Noz45j6GicYB
 Bo8PWOjG4Qn7BE9zE=
X-Received: by 2002:a05:6000:2212:b0:465:81cb:bb20 with SMTP id
 ffacd0b85a97d-47aa9699580mr9719295f8f.9.1783308542432; 
 Sun, 05 Jul 2026 20:29:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d83bdsm21146028f8f.13.2026.07.05.20.29.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 20:29:01 -0700 (PDT)
Message-ID: <6a4b20fd.1ea2676b.1b09b7.87b0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 06 Jul 2026 03:29:01 -0000
X-Mailman-Approved-At: Mon, 06 Jul 2026 16:20:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783308544; x=1783913344; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rxFdpRE57dffUUHngDtFEmKXDmAyTcpOEWO8rc8bKKQ=;
 b=YqEP4VGKFWYCnyOe9N6TBTGyNjIgY7QssRtacJfOOB6a6NO+6k3FmZZbS7FtfCJEae
 DTWfzXcmwre0RyB4/Ql+VjPX20BAZwR5n0CQ/7xwnX9ux3thUJqc6Hstq5A74NgyoM2g
 u/GLzJyhWmwcuGN/V9VhcdeuAKdd8PyUVFi7dRW2FjOs41I3+4SwtgJ7V/hk1Dej3Q8I
 akiHuLT50cE4aN+4jWOzX/CD/4Ckma2cfodJXdrTtpNpkYr87LRpecZIaaWtJtn0E9AT
 COAzz8Z5jfQ61yeEsmPMHhj9aNruPKsu49r7nZceD4/5HOCY5WA89M3HAN4r7TkEgmrk
 VIEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YqEP4VGK
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-05
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

Autobuild statistics for 2026-07-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  5  |  0  |  5  |
  2026.02.x  |  2  |  0  |  0  |  2  |
  2026.05.x  |  3  |  0  |  0  |  3  |
    master   | 63  | 321 |  1  | 385 |

Classification of failures by reason for master
-----------------------------------------------

                     apr-1.7.6 | 56
                 host-tar-1.35 | 25
               host-dracut-110 | 20
host-gobject-introspection-... | 19
          host-binutils-2.45.1 | 8 
              host-guile-3.0.9 | 7 
              host-pahole-1.28 | 7 
                       unknown | 7 
                host-odb-2.4.0 | 6 
                   bird-2.15.1 | 5 
amazon-ecr-credential-helpe... | 4 
               linux-pam-1.7.2 | 4 
uhttpd-15346de8d3ba42200249... | 4 
        edk2-edk2-stable202602 | 3 
glibc-2.43-45-gdae425b55420... | 3 
                 gnupg2-2.5.20 | 3 
            host-go-src-1.26.3 | 3 
host-google-breakpad-f49c2f... | 3 
                  iozone-3.508 | 3 
               libepoxy-1.5.10 | 3 
        ltp-testsuite-20260529 | 3 
                    olsr-0.9.8 | 3 
                   perl-5.42.2 | 3 
               tcf-agent-1.8.0 | 3 
               valgrind-3.26.0 | 3 
                   dante-1.4.4 | 2 
              erlang-26.2.5.15 | 2 
                    fmt-12.2.0 | 2 
host-am335x-pru-package-5f3... | 2 
            host-binutils-2.44 | 2 
       host-gcc-initial-16.1.0 | 2 
                      icu-78.2 | 2 
      libabseil-cpp-20260107.1 | 2 
libesmtp-v1.1.0-14-g335ee8d... | 2 
                    lua-ev-1.5 | 2 
          lua-lunix-20220331-1 | 2 
   openvmtools-11.3.5-18557794 | 2 
      passt-2025_06_11.0293c6f | 2 
               pcsc-lite-2.1.0 | 2 
                 systemd-258.7 | 2 
              tailscale-1.78.1 | 2 
           uboot-tools-2026.04 | 2 
                 uclibc-1.0.58 | 2 
            18xx-ti-utils-R8.8 | 1 
                 aichat-0.30.0 | 1 
             alsa-lib-1.2.16.1 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                   atop-2.12.1 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
                  clamav-1.5.3 | 1 
                   dbus-1.16.2 | 1 
                easydbus-0.1.0 | 1 
                enscript-1.6.6 | 1 
                  ffmpeg-6.1.5 | 1 
               freeipmi-1.6.18 | 1 
                    frr-10.5.4 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/tar/tar.mk:38: /home/aut... | 1 
                     gdbm-1.26 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
                    grub2-2.14 | 1 
             gtkiostream-1.8.0 | 1 
                   gvfs-1.57.2 | 1 
                     gzip-1.14 | 1 
                haproxy-2.6.27 | 1 
            host-autoconf-2.73 | 1 
          host-binutils-2.46.1 | 1 
    host-gcc-bare-metal-16.1.0 | 1 
       host-gcc-initial-14.4.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
          host-mosquitto-2.1.2 | 1 
host-vboot-utils-7dfa482d6a... | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                 lcdproc-0.5.9 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
                libgsasl-2.2.4 | 1 
                libmpeg2-0.5.1 | 1 
            libnfnetlink-1.0.2 | 1 
                    libopenssl | 1 
   libtorrent-rasterbar-1.2.20 | 1 
          linux-5.10.254-cip72 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-7.1.3 | 1 
        linux-headers-5.10.260 | 1 
         linux-headers-6.6.144 | 1 
           linux-headers-7.1.2 | 1 
                   linux-tools | 1 
                  luvi-v2.15.0 | 1 
             matchbox-lib-1.14 | 1 
                     mtd-2.3.1 | 1 
                 nettle-3.10.2 | 1 
                  nginx-1.30.3 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.33 | 1 
             openjdk-25.0.2+10 | 1 
                openocd-0.12.0 | 1 
                openscap-1.4.4 | 1 
                openssh-10.3p1 | 1 
                 pixman-0.46.4 | 1 
                  rt-tests-2.8 | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
                 rtl_433-25.02 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
           sane-backends-1.4.0 | 1 
                  stunnel-5.78 | 1 
                    szip-2.1.1 | 1 
               tcpreplay-4.5.2 | 1 
                tpm2-tss-4.1.3 | 1 
tremor-7c30a66346199f3f0901... | 1 
uclibc-ng-test-132c6134d691... | 1 
                  uftrace-0.14 | 1 
ulog-0389d243352255f6182326... | 1 
           virglrenderer-1.3.0 | 1 
        wireless_tools-30.pre9 | 1 
                wtfutil-0.47.1 | 1 
                 xenomai-3.2.5 | 1 
                 zlib-ng-2.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/e1a03eef274cd75685d8c949ce9a7458b1bf71f6 |     
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/967916c9bd56418edccd8e9fc75b2a404df29a08 |     
powerpc64le  |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/47e2f453aaac4e9189b74b07b3bda4897586b0b4 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/babd1501f21517ba6ca83ad330f0a2968f436f4d | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/5a8444341b5c0008559c7b6d4f1eb7ae55bbf051 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a6ae9256452d7e63ed2ff46c5896683406dfa217 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/111f61c1c264e6ad7f133736e3ecb5ea73d4db21 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/ad3edb4cd3d2f707a2d475ca053cf13aae764d05 | ORPH
  mips64el   |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/cb938ffcb44cdfcd128a00937aa2747de6505ed0 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/16e3ed03a2b39d5ee4889dcb1703d9c48883cb78 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/ee2a34216e0992b7400f87497da0caabbbe29d51 |     
    i586     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/7e63d7bacb0422efb52e7c54ba68b390788bd6bc |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/c2bec18f7e7b5b32a35a253142dbf4f4438d83dd |     
  mips64el   |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/a42376f2b01638d73a39fc50f7a4a493ec379738 |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/efa0e2b0dfcb81e888bd8061644e4177d7d0d7b2 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/5fce859841512ecbc79b06a3c7a21fec692f67dd |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/16626a9def9e43646b34b7025dccb9a45b1e70d8 |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0bd6912175b79867cc0a53a9b868f37ca843707d |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4397918b088e2e95c0bc6826635b7e7c135cb693 |     
    i586     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/d1bf75b1794b6566738aeb548334c9ce411506ee |     
   sh4aeb    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/e931bd03f1c3fab5f35d4a8f9af69449354917c4 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/25cc1b3d656fff3af0356ceb7db637a5e34c2db4 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/9a23451c47dd9e891b89b1ada7f77ee0efde0d79 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/8c538569c84bd222801491b9a96f6361a658369a |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/3269b2a3772c49870f827f84e4a106850eae7196 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/3292053e277cecd71c90ada7e6fa8f26f71f27ed |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/fe0ece9333747bd616974a0cf3e267f89f4c27a3 |     
   x86_64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/cbf778251aab879551b4fee89fb1bc76d4fa59da |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/d8aa4526cba008b97f5fd613be9a915d624e33d0 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/f8e49e1e708f6bcabec0f75e8925310a4ea0ca77 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/12fde19f6c33abc4662828f79e3505dd3bf34a37 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/a9cd7c52276fbe3cd85ac0aa5c3e5bcecb989b2b |     
   x86_64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/a4d471b62f8f85e8497a7bbb3e656a6a1b695c22 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/54eedcd0e1e2e52b54285d76b1152d70d0956ca3 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/96c297290bfcc72ff7a69f03a7cebe744d656a19 |     
    arm      |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/8ff3feff51f26727411011627e1292532eeb88c7 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/9219870b0d4f116f0c1b7cb9b56bed5c72f47241 |     
powerpc64le  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4ca4fcb924ff6d179d253739f517b23fa4fb3127 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/831f90c78001abbe7168445d24d48b99ce456163 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/d70e20a4b100bca541efdf6ec1b14d077c918552 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/cc3786137f6bd9c6e9853ee447ffb586c26a3ac8 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/b46d372414fdc340aa704e7415f668e6181ede50 |     
   x86_64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/1343d25212d6b4a500d2b102af9d41e018e997aa |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/862ff2105eea3719092ae2cfc9bc9f8642bd6201 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/fad1188739cd7e3775a16798c73c817ff7640f9e |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/e8fc1102e226f6ef9d715143d34cedf808fab08c |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/b415c2d273d4b6efe821dff44d13066a7126c7bf |     
  riscv64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/17f24a498b41dc2eb9be5d6b574a0334110236c0 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/396691270c635c3789acdbeeb981ab7ab38174a3 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/3b9e4a98b86fdbef89b3e02ae5718518aba6bf74 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/86ea0ed42f1c5cae1bd65bc44957c0da5a610908 |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/59cd708b5c38d41c98bed0194364ac720e6e8f9d |     
powerpc64le  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/bc945781846ae3bf438b51889e689dc8292825a1 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/09e63627f2429ce38fd4c831c8ecd52b2b083904 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/aadde5c70affb45ce6c6fe3b8a293dc0dfd1bbcc |     
 aarch64_be  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/60ee902676b406d902fe0d93613ec00c76ab994b |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/25a9023327187973c81126390acc3aa5af257d8e |     
  riscv64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/3e608760cb965abf24f4f36664cdedbcf456198b |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/2cf915cc586dec64d0283de57f7b8d429b98d88d |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/2a4cc72500c2cd9a27b476ae23f9345d291c2a38 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/cab0be9da2f4a2af704b80be72f16efc17a7aa61 |     
powerpc64le  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/583b2043084caa1d21ea9fe8ef8219db4297ce64 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/c1114ce1b002bdbba6c9a24a41806e46f6ba8a94 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/04e6338afb098fa6bf3db32bb8508981f9bc9012 |     
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/7efee8398ba498f5ca22df66b9b573529679750e |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/b9fe09d207a932e41910341fd1f8041c156779fc |     
    i586     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/73c6d3a6cd2923e7c01f8e4c0115219aa5ef0b68 |     
    i586     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/25b6c1c5150233d71ba95d32f6913909a6edfb54 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6528b7274af482856f6f7bc1bd4bdad707b90323 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/b197b9dea9ffcff2b89cd67696a628432d86d91f |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/3ff519ceaffb647ed475fe2f42eb107efc1723fb | ORPH
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/a3eb794ce1d680f0baf2d198f6a4efdf364dceee | ORPH
    i686     |          clamav-1.5.3          | NOK | https://autobuild.buildroot.org/results/300721a882f3410528878db730aaff1aa6822986 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f30b43c7ea19f77ab2cb5324e6b261a916720b0b | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5fa573c314821970de2aa6dc932cd4f410db852f | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/2b548f957ccc7686d8fdcfb73b1a57164492a52f | ORPH
   x86_64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/5adf05d50afb5f8cbccd96c8eada8ca262b005f4 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ee0b8b729f497969bd8fecb7697a4bd8500d8607 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c2a9425faa8cf80eb99e4c29ab88a2fb151aaa58 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/baf17bfc824c6e987ee02db390bf64fee60fa6ed |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/76bb416dfbcf10aa478c49cb6a90a89f7b420bfe | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/bd190600dc535441d109b4f06efb275b30d1f4d6 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/b6f89596b82e6451d032de5fd8cda4bfd244de7b |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/99475115edf09b3eb872879c808e8ed5dedceba3 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/3e9dfcb5ac9e6d77d47ab29e5e655840a965b339 |     
    i686     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/22f46e8b7cb34144709bf9345d992036bacae319 |     
   x86_64    |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/e45ab3c04509303c5b315ace8caa6d20358836f5 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/f23f951b42705f8f8357caad16f4a955a8770815 |     
    i586     | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/6ae64fc05626de09bb36522244f27312648fe863 |     
    i686     | fs/tar/tar.mk:38: /home/aut... | NOK | https://autobuild.buildroot.org/results/4dd169cea0cbe0947244a63e49ed571d105c7b73 |     
    i686     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/3922a8e0c50f41a58b132ecc42485e26d11f95ed | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9c637f63662b88c05af018ebf93aa71c682fbde3 | ORPH
    i686     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/17ff61f0eac946b3c027a540147b2573e224dcdb |     
    mips     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/b925a444bb3ef03354224ac643b0b3160c4c5e8a |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/3dc781ffaef101d101cea26f4212c036dbfe7517 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/4c0ac8ffbf58594987fc97ba6c8b31541ec40512 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/2e5d6cb408493af00fe98a1daab7a33d3f88f2dc |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/301209f49c59ab691d560a5ec49a74e7c9aa4028 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ba021d317103347af8f1a7d57cd6235b36c25cb7 | ORPH
   x86_64    |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/2bbe4b0f7edb5786a882a4d6b20d51812f2430c2 |     
  riscv64    |       gtkiostream-1.8.0        | NOK | https://autobuild.buildroot.org/results/5a350709099d5e277f222da1cec27f1a0e9cce24 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/4afe44900298d7d776e68d016e5f696e6d5abe55 | ORPH
powerpc64le  |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/426a4892f9acf6eff333a80981ac2e363b00f1e1 | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/62ba74979a4b9c29a976aba9a2967314a28f15ff |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9d6888a402cce9bddf10e3a48784ae2e44956163 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/68f5bc37611a559a98d17da1b9b0a10e1a64788f |     
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/0aaedb97c6280655e62d00b2482e9fda39339f41 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/78f32b64e6373d514255a7ded8d6f8c9a565bd83 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/49205ab5e736dbe79dc5fa8d87cbcb01cb9c8079 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/3de011d6067c8d5cd04c2be0003c92b79a5e69cd |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/87a06789792ec5f1f9be6089e7dcd523282cf54b |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/a60886239b5e89f2f2f05258fb37203f23267ac5 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/1c193514337c78f531f2a4ffd9d66b14de6d8bdb |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f3e2d2d20a7436077ce50f1a9c992f04ab94fd69 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/86fc7365c726aae5d85b0776d8f3cafd83292aa1 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/d2971a4d5226ddbe20d474c82249cec87c242443 |     
    i586     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/c7dea5cbdd0726a6d584561ba5900aa693478350 |     
    i586     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/8199600f5e4c1a9a91b6acce675c60ea2616f932 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/924746ffc09ac2ae5483fab20eceaadb9acb699e |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/dc385e8db86f6aae1086a0d3485b73ccebf4bbec |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/bb894ff13970db58238c365ecc63747b2fe23f2e |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/21cf8aa1a3d413174dd9f99a8065fbcf536e0637 |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/7a5bc4f47f5afac4e98d26cc2a7f0beffaaa4edb |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/172222626559d2074dba2c9b6ee78f46063e66d3 |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/62bd862a4b22f3e399a93844ee82aa6f4d98615a |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/748195fd2f2ec5f44bcdde6f2191fe02667538de |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/baa60024918127924e16983ee0801ba2fa3ab9a5 |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/c51dfb882901c83b68334b9823f02578cd38c622 |     
    arm      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/51d4064ca7f38124176b1d7cf26f31d66e08209e |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/2002a7a9c68e80fbbf2246094636ede44b026a27 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/308545dc81b9c16b59651be2fb2d90429697583e |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/9054c2b56c8432f5ced0197c560a9bb2c9c73316 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/6e98dff10c381dbb3b5f9b91e4dfadab5319d330 |     
microblazeel |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/33369b67236e40c298b7070fd364e2e98ef5de14 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/c27d942fe3335b6ae665a3e6360aedacef335dcd |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/589c1fcb1961281de888e35da120628450a9d227 |     
    arm      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/dc4d3c17f45fac039dbaa11e1c0139c6f3284ab0 |     
  riscv64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b86ead9d749cea848c0d5c6cc5a5dfb4daacc94d |     
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/580db06691649a636ad3e04a98cd378dca84090b |     
   x86_64    |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/9a34eb7d101f84c000bfcf4385ed4fa53dd71e9a |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/ef38effd8eb0570202735ed19fd503bf8007f5bd |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/24f4bfc98ca1658a635c78cb1f043ef674481f87 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/4e9468f1ea492c0b7646dbf73003e4ea7119a4ce |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/6856daf02e5d0349ad63f567aa16235cdf5ce822 |     
    arm      |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/c325587fbbf2b2dcb634925d489d0a94bee07002 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/147e11387ec83f2afb7c521798569e53ad2d6954 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/74327aa63ca8360fe77375d4dbe390bc8d1e583d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0473e33b80041f5e492344f964378e05db112385 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d2738522b199343d2ea0ac4fcb7a410eef8afdeb | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/325ea6732df633221238f4f269e37ad6a689bfbc | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3d8067d63a2f8379f1ab65e493903afcac0dbf48 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5aa121a3a64d950c721861441a187fae8db4ec2a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/52a08e60f5fef2cac367d5910c748d9b16ce5625 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2b54f51870c913c148fb99822cbcf73490745fad | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4ae0041686847441a765e0e19cb13eb75660c10d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/14c3cdaa589f39ab05c2c251b325068fc155c450 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0e8c7289271aa127a121d2825204becaba2a2943 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c4f7e3ecf1d04ca68e044f1607651822a444c4c4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9f41b8db2bc1038e0b9688f37a6a4131aaa7e91c | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/61118c5cb5222df38b5e81a9063ca3da431ee385 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9abf4a2d0ba297f4569347824379a97699d383b9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/15c8b64f886e539925768487bab54375583ad108 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c1e41a83ef32906dc907da167123da803639cfc2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a276f3ea9efef9208152a713e8c52ba26f2add07 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/53dd4d1e790140642cc8d3f0a380ffa9df1b262f | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/602a3aa54c22e3b0de304e683847dee9442ada6c |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/84e16d9c978b0a1303701ec7ece320436f437fff |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/736e90611c6b44a9c14e0f207a4ffd4fcd01526e |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/749add61033eb914ba99735f15d41a460352e61e |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/1ce1dae603b9fa35e79677fa2c11f11f74323ed6 |     
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/311d624ea84c3fe99e267ce91619c9feaacb80d9 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9e9da42af96b8c1e50cd947546c443e4041a6081 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8a5d49314fd3cf6f306c856f8e7bea7d60a3475f |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/4fec4df859e003d9d8e7ba669378d8f8b2900592 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8b1a9c9097f7ff33e3d6804943c4aeaf378e85e4 |     
    i686     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/ed034486f6cd5aab592bf76a8888d5259ddc2d07 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a6b577f0e21282d88e5c91e542ae71fcfa299a30 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/48803b4dae793d7a1ce6f3f860bd48b206486349 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/10ad8b7a390dc95a77820a34978f61c3443da739 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/5dc81a7229c2bd94923f123b1091d167048c16b4 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e554408f82cd3971701b1cd880b1d3ff77d6ac7c | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3f5c6a2c5ed5462ae3cf014ac1744d5a8838dfe0 | ORPH
    hppa     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3b325b91ad73209fa83c80001c3685e31fef70bb |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/c0ce1f9c19a08a2ce4d3b02da3ee074bc109f368 |     
  aarch64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/47eb55465bd9f2e04d799546f0fc21e03962f06a |     
powerpc64le  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/5195ece2671193a11e68ef7b45fc725fe4ba382d |     
    i586     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/d5ea43b531421ef10684053377c960f32e9ec910 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/67f80a3bbf423847fb9eed0e25cfe977a6aad8d8 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/9668fb33bca09eb123c6ffdf2c6156e68a47c8a1 |     
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/779105c4fa87aa52ccdfccd0f33f52f4b33c8321 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/483e275bda7d45bf2aa9b51129e43ba26b1394f6 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/88c56062763eb2be10444924facd2963eeb44b7e | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a01fe53494956076dc660e507b48dbc8b951105b | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/370179d6c71edd246b254fcfcfc44f28fd352929 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e8dd3c804ebf35f53e4dfacb86b2378424a66bca | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fe4f4b4c819c80609468da3d66467dd0e9af6b37 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3ee2f7555dffa6176919ecc6aeeaf2c844c00dc8 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b1728cbce798453fd02fb2ac696b7221cf509ca9 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5960d9f5e34a2912a0b40fe01607da98f520c159 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/13f18592e6646fe8f52d353f681e472849616538 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/58d2b2e87163dfed997dae16d154166f9eafafc5 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3ff771b5ffe95dfe06719e6e2b99ff516af3e208 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/dc3585e730a4b2b632e8f379e4747a8af7be2eb7 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/18775b8ae94f18d3a87ed747c1bf442dd9ed8ae9 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fb533ac04c3af07dd068a135ba88793ebfc4dc03 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d319d2c46e03d6480fcf3e2434196356e512f814 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bc18b61813f853cf79d74aff30463369f6f5addc | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/89fbc1274d2956e10b32ac5a5312f972d7b14600 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c884344de13d6676b3d506e5e04896705d45e605 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/87c89c2e1ae30d86becf637862a599f8c3eedd7d | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/041e79fa02336e27a55bc85048ea575f9e847b8b | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c766e13154e10a2d1f32edcece2a01abe08b51d0 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bc2fed308d08ce14993ba386f2c290ed2f68320f | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/186edcd15b185ebbe5de48199baf558bf889a5c3 | ORPH
    i586     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/f8edb321a3e41489b19f253d98d1aadf198dabd6 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/ca7dc2fdc852360e0842624e249053d454bb4c91 | ORPH
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/4c07213011bcadadf821ac5c7c626e0c64ffeda4 | ORPH
   mipsel    |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/a1ccad21b17737473990c83ee8503890f0fd08e0 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/e68bcf73d010b1834b7ea891a50cb238c93e351a |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9d7675476064de34a0afe91f217928d7115f6c65 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/53be20cde6116f66a6234319e7dd6a7673f801ac |     
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/dbb4120e1d4c60bec26d9f023d97e5deaad7c18d |     
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/89a68b033458339c73ec065f9780e3ef0f2bd94b | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/d1e02e54cbce2c90ef08db4ec1ee3b705822664a |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/5e2c7c81dd53790b42a33052bb078ca620745745 |     
    i686     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/ddedef0ab78706491d33d8cef96a8b2f7da24141 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/7069ff190b7198448fa713126e0e71eca7042b44 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/ae76df4aea606851a9c60c9557d3ece91d086fad |     
  aarch64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/d009ada0c3fe0226a18bd515a4d1f4785d8c031c |     
  mips64el   | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/8d6b8e9ad0bad2e7efb24c0e0243f3039839fec4 | ORPH
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/21216ebc0cca70ad41d7ce6abaabbe8a4c3ff7d8 | ORPH
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/497b4e4820ebbbea2aea22f0a4e3bd9cc7327cca | ORPH
   x86_64    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/3f52805102cac0654689edc60e46e18af01a8510 | ORPH
    i686     |       libnfnetlink-1.0.2       | NOK | https://autobuild.buildroot.org/results/fdcb0acb5d221943a3eee53a126ab35523e84e38 | ORPH
  mips64el   |           libopenssl           | TIM | https://autobuild.buildroot.org/results/0774e160fa47b07edff07490c6a645aa5a8ff564 |     
    i686     |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/f2db1649594f09d4f6d1a44008ef37ec1bbbab3a |     
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/46d0750964e9897c4d4067475e951361a7d04cb3 | ORPH
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/4cb5a63fd66d3182d26915e8aabe9bfbea03b3d5 | ORPH
    i686     |          linux-7.1.3           | NOK | https://autobuild.buildroot.org/results/d9349ab7febdcbb848ff0b8d134ac35485c398ef | ORPH
    i686     |     linux-headers-5.10.260     | NOK | https://autobuild.buildroot.org/results/3b12c88635acf764decbaf62b5fab9febe37ba88 | ORPH
    i686     |     linux-headers-6.6.144      | NOK | https://autobuild.buildroot.org/results/7df728be8b7cbf7ae9671388707e4ba222ab86c3 | ORPH
    i686     |      linux-headers-7.1.2       | NOK | https://autobuild.buildroot.org/results/78e1afdb9a33bc7ec5697fa5dc069a5977877bae | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/1ff3a1c6f12963dea4a08626baa743050adb1f6d | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/75ad53abc02c6d8d2be0a94ecf60955434525420 | ORPH
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/79457b38202fa71eb0507c84ce1c38bcc8e16385 | ORPH
  riscv64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/2d308a0b9cc6da344092aa049f992297c5ed7385 | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/57ca61cbfb83885002989a6dc9ba5ca62541585e | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/09ad9544fa4e60c8111bdae75ec750f9022f31db |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/17a442a776aa0de2ac666c5dc2c8b6a86c70178c |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/74b2aad9f7fd5cb4bafe3cbd6f9a06220127864d |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/f38bdc62b99ec177e53652888fe76459b8e71a50 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/bda8e37318ae7272589e0aa7e1d4543df0c7e12f |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/bb9543bd9741ba43534a555bea8328a337bbe863 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/9532cdaa3e7d1ac0e28a3388a6fe81febfe89bdc |     
    i686     |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/4a3fa96dd5800a4690d0fafeca7f338da273b50a | ORPH
    i686     |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/2921d2888d209c42639e0f418c85d30ce06b0431 | ORPH
  aarch64    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/d29d7553916692252f01e5bbf04d874a2e8f58f1 |     
    i686     |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/20e706e8d41fd1d360d231a7f27e582a00acf6a0 | ORPH
    i686     |          nginx-1.30.3          | NOK | https://autobuild.buildroot.org/results/81feedf9598c81eee6dcce578d5c78c31f81d417 | ORPH
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/58ecdc266a4c5c74a91069d1f5fb59007c4063f5 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/3c6e688e3dd69e9aa63ea0c52d94066ea7f21d46 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/cf6f2a4d57e5267689b9f5cfa0cd70aeb0a356fc | ORPH
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/aba908576bcd2b10453c847edf90a363901a81ea | ORPH
    i686     |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/1cf6ce73708b0e24eaade74e19d104b5364f6655 |     
    i686     |       openjdk-25.0.2+10        | NOK | https://autobuild.buildroot.org/results/b914af915f20db329bbc8329e9d9aeba17a85427 |     
    arc      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/376cd93399c911d30cc7d5ae520317da9e5d1c91 | ORPH
powerpc64le  |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/fc6205f6836e4dff4df6e4120cc7dd0e9d3d8dcc |     
    arm      |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/68e57ef096be77fbbba1ce6939157fe5e71ea383 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/9dddeaa3c6f4b56b2b9fae3ead18709609706d68 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/53ba95a9487cc2512bf421a6a494e6af4d155268 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/e11c9d8b8e678f800b90a08f3bd4feb4ce62c09e | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4fe621f104d0d59c77f2724428cdc981b4c73699 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/46c71c3c70a17596e9ed131ebb3097086dda8455 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/80e89328539a6ae256a4c888c2b2328c260be5f5 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/34f76385c8284c37d574e4816902e4e888bbe1d2 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/54532842b43af27089f7ff6c546931cbc0d7e034 |     
   mips64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/dda9198142b01172d1fa16f1fbd8e659becfac0d |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/81d464947e9c127d5aefc4a3c1446ab9dc7779c1 | ORPH
microblazeel |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/71e13368588dc26b91a027bd3f284d3b123a47e1 |     
   mips64    | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/8bacfd636aa8005e12b121246dc3b800c4382732 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/4d968451b35c0bf9b922237f39d6061866b77587 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/25e4ffae7fe422d59b424a9f37be8e724d5ca61d | ORPH
    i686     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/2f4fc4be925dea2a8f8e3bb3b7b93736f2ae498c |     
    i686     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/3435f362d0bdfccf5ff7d6d41c7727e3bea4ea25 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/a1a88bea6fdf5ae28d813f0a12d08e504b2fad06 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/f60d629e342dba5e3dd922585a8ac5898819dd5d |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/abfaacc47fc0cbf781160937e669f2ddce76552a |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/0b34303745ee4ce336300301411dda62f2f2f7f7 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/37f0c432243ef9298aacc7f9d74888bb41d73d50 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/8ba1a762fb765317696741539b48efb2d6ed4d6c |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2afd30d4bfafcaa8b819a223d98aa95c9ac18884 |     
    i586     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/bfa2e1d132353c5e48b91b7d8bae28a35e3f5dc7 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8baeecf4fd0e23313442be556b20cfacde813288 |     
   x86_64    |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/373a644d2cd53e4e31c3510cb56975c9d87722ee | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/7eead6066ee5d0f284d3c1c67826de470bed60c2 | ORPH
    i686     | tremor-7c30a66346199f3f0901... | NOK | https://autobuild.buildroot.org/results/691ba2360802126e23bb36c03dd3268ba02f3ba5 | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/d3146a4ce9512a24c1c6e736bea3f41cc1d3fad3 | ORPH
  powerpc    |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/924ecff1943b8b94919e2f429d11e0eb8d380b4e | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/17f719de3ead89f1fce3bca9f9b9e6aee58925ae |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/f98cea5f5fa90432f1049d82fb2485cc64b70690 |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/0a6c89b571d1c20585e1065364d60e90629ab42f |     
    i686     |          uftrace-0.14          | NOK | https://autobuild.buildroot.org/results/d16fecea735f7f35b8f8e4ac90f53e13dcac5646 | ORPH
  powerpc    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/075744e03c7fe77b5bd77d303edee675a6f71d99 | ORPH
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/1b11af8cda38a5592978e5d96900c4c90da63896 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e40078581d8a22ffab02d4d5cd96feb00b6b6d46 | ORPH
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a64f426d64ef7e9bf60c344ba19c6623e3961b00 | ORPH
  aarch64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/843cc4a9203ebfa02ecc057700f48209c1931147 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/18a9c0aa77a97e1143e926b3453ba809d8ea535e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8511d23e515c62a6c419dbb7f324dbb9027d41bb |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8221456efb5e0213bb33dcf02ad89ecfa8f9bf33 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d55cd2c9478e3ff51eb03c7a6ce8961466d4b287 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/04a0c45f0f93b12310e11c1bd3d55a79d3f9cb0e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c803296e6dc1e4833b117c42fff55c014700ba25 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a7a3a43615cdeb715f84d1de7a704d37ef255a9f |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/3a241433f721f654554564108c596b633eea279a | ORPH
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/8bb822f1f178b20dd7c4e60e54652024d2ff307c | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/464bbef4fb2545ea9916e013e1885590aa941725 | ORPH
    arm      |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/c5f14e82ec26ac766ddf6cc55bef1df0d974c433 |     
   x86_64    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/ddac2efa1bf62bacf37264defacb37a79e78ed78 |     
    i686     |         wtfutil-0.47.1         | NOK | https://autobuild.buildroot.org/results/397015bd0fad5e723464db63d45ae67ea1bc65ef | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/40ded70380cdcdd2b9cde89d9843b30f0e48f120 |     
   x86_64    |         zlib-ng-2.3.3          | NOK | https://autobuild.buildroot.org/results/11d9cac7d2e9f5ad7a87207950643e23e453ea88 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            igd2-for-linux-2.2 | 1 
                  libnl-3.11.0 | 1 
                   linux-tools | 1 
                memtest86-7.20 | 1 
xilinx-prebuilt-xilinx_v202... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/1903e52cae7f8530a7de5b0844eb94df10b45925 |     
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/afccc67bf49fa0f9225b49127e99bda628a32c48 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/310e362f5065d5a4b1d301fe09b189fa17623336 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/7cc155f6ed89ef4a3f50705702290c70ac6bad6e |     
  aarch64    | xilinx-prebuilt-xilinx_v202... | NOK | https://autobuild.buildroot.org/results/3212114cb0303f3058420570cfbe20060eeb303d |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.17.1      | 2.0.0        | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.6        | ORPH
                           acl |  DISTRO  | https://release-monitoring.org/project/000016 | 2.3.2        | 2.4.0        |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/000018 | 20251212     | 20260408     | ORPH
                      adsp-ldr |  DISTRO  | https://release-monitoring.org/project/388235 | 1.0.1        | 1.0.2        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 50.0         |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2026.2       | ORPH
  amazon-ecr-credential-helper |  DISTRO  | https://release-monitoring.org/project/359761 | v0.10.1      | 0.12.0       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/226905 | 4.2.2+git... | 35.0.2       |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 13.0         | 14.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.1        |     
                      argparse |  DISTRO  | https://release-monitoring.org/project/007317 | 0.7.1-1      | 0.7.2        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                         asn1c |  DISTRO  | https://release-monitoring.org/project/016926 | 0.9.28       | 0.9.29       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/006988 | 6.0.2        | 6.0.5        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.10.1      | 23.4.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.58.2       | 2.60.5       |     
                         atftp |  DISTRO  | https://release-monitoring.org/project/015219 | 0.8.0        | 0.8.1        |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.3       | 2.36.4       |     
                     atkmm2_28 |  DISTRO  | https://release-monitoring.org/project/373360 | 2.28.4       | 2.28.5       |     
                          attr |  DISTRO  | https://release-monitoring.org/project/000137 | 2.5.2        | 2.6.0        |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.5        | 4.1.4        | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.18.1       | ORPH
                  b43-fwcutter |  DISTRO  | https://release-monitoring.org/project/000152 | 019          | 020          |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/000154 | 1.13.1       | 1.14         |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.18.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2026.2       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2025.4       | 2026.2       |     
                   bats-assert |  DISTRO  | https://release-monitoring.org/project/372274 | 2.2.0        | 2.2.4        |     
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                           bcc |  DISTRO  | https://release-monitoring.org/project/012803 | v0.36.1      | 0.37.0       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.15      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.45.1       | 2.46.1       |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.3.1        |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.8.3        | 1.8.5        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.86         | 5.87         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.86         | 5.87         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 8.2.11       | 8.2.15       |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.91.0-1     |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.12.0       | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.7.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.24.2       | 0.26.1       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.8          | 6.9.1        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 7.0          | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.13.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.14       | 0.6.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/021328 | 2.4.3        | 2.5.0        |     
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/009026 | 20260223     | 20260601     |     
                          cage |  DISTRO  | https://release-monitoring.org/project/021171 | 0.3.0        | 0.3.1        |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.1       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.5       | 1.14.6       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 2.0.0        | 2.0.1        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.311        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.4.0        |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.8.2        | ORPH
                        cdrkit |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/000287 | 7.4          | 7.6          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.6.1        | 2.6.2        |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.8.1     | 2026.6.1     |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.5        | 2.0.16       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.20.1     | 4.3.20.2     |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.10.2       |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.2.1        |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.8        | 1.4.9        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.7        | 2.3.2        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.2       | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.10         | 9.11         | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.48.0       | 0.49.0       |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/021408 | 2.1          | 2.2          |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.24         | 1.28         |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 3.5.0        | 5.1.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.25       | 3.0.27       |     
                        davici |  DISTRO  | https://release-monitoring.org/project/021340 | 1.4          | 1.6          | ORPH
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.5.2        | 2.6.2        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.27.0       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.2.4       | 10.3.2       |     
                      dhcpdump |  DISTRO  | https://release-monitoring.org/project/021415 | 1.9          | 1.10         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20251001 | 1.3-20260107 | ORPH
                     ding-libs |  DISTRO  | https://release-monitoring.org/project/013710 | 0.6.2        | 0.7.0        |     
         distribution-registry |  DISTRO  | https://release-monitoring.org/project/378976 | v3.0.0       | 3.1.1        | ORPH
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0.1       |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 28.3.3       | 29.6.1       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.25.0       | 0.35.0       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.38.2       | 5.3.0        |     
         docker-credential-gcr |  DISTRO  | https://release-monitoring.org/project/377457 | v2.1.30      | 2.1.32       | ORPH
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 28.3.3       | 29.6.1       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2026.2       |     
                      dos2unix |  DISTRO  | https://release-monitoring.org/project/000453 | 7.5.5        | 7.5.6        |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/007454 | 3.3.1        | 3.4.0        |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.4        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.3        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/000457 | 1.16.1       | 1.17.0       | ORPH
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 25.11        | 26.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 110          | 111          |     
                      drm-info |  DISTRO  | https://release-monitoring.org/project/299264 | 2.9.0        | 2.10.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/016911 | 1.7.2        | 1.8.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 10.2         | 11.0         |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.2.3        | 1.2.4        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.9.0        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.6        |     
                      easydbus |  DISTRO  | https://release-monitoring.org/project/115313 | 0.1.0        | 0.2.1        |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/000666 | 3.4.0        | 5.0.1        | ORPH
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 26.04        |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.2.5.15    | 29.0.3       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.27       |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/009323 | 2.0.1        | 2.0.2        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/016913 | 1.11.10      | 1.11.12      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.31       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.34       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 1.0.3        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.60       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.34       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.26       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.29       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.23       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.16       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.10       | 1.9.2        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 4.0.1        | 4.4.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.9.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.9        | 1.4.2        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.23.3       | 0.23.4       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.2       | 2.0          | ORPH
                        fbterm |  DISTRO  | https://release-monitoring.org/project/008331 | 1.7.0        | 1.8          | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.3.2        | 3.3.3        | ORPH
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 10.3.0       | 10.4.2       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/000790 | 3.11.2       | 3.12.2       |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/000801 | 6.6.5        | 6.6.6        |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.5        | 8.1.2        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                          ficl |  DISTRO  | https://release-monitoring.org/project/021430 | 3.065        | 3065         |     
                          file |  DISTRO  | https://release-monitoring.org/project/000807 | 5.47         | 5.48         | ORPH
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.4.3        | ORPH
                  firmware-imx |  GUESS   | https://release-monitoring.org/project/390526 | 8.27         | 8.31         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.28.5       |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/021434 | 1.14         | 1.15         |     
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.5        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 4.2.0        | 5.0.9        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.7        | 2.5.6        |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 7.2.0        | 7.3.0        |     
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.17.1       | 2.18.1       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.26.0       | 1.27.0       | ORPH
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.4          | 5.5          |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/000853 | 3.2.8        | 3.2.10       |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/010442 | 2.11.8       | 3.27.1       | ORPH
                           frr |  DISTRO  | https://release-monitoring.org/project/018555 | 10.5.4       | 10.6.1       |     
                         ftxui |  DISTRO  | https://release-monitoring.org/project/373193 | 6.1.9        | 7.0.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.17         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.16.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.1.6        |     
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.11.4       | 3.13.1       |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.12      | 2.44.7       | ORPH
                     genext2fs |  DISTRO  | https://release-monitoring.org/project/021440 | 1.5.0        | 1.6.2        |     
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 3.0.2        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 1.0          | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/008735 | 2.2.2        | 2.3.0        |     
                           git |  DISTRO  | https://release-monitoring.org/project/005350 | 2.54.0       | 2.55.0       |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/017093 | 0.7.0        | 0.8.0        | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 19.1.1       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.88.1       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.8       | 2.66.9       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.1        | 1.0.3        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.3          | 0.3.1        |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.84.0       | 1.86.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.1        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.8.1        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.46       | 1.3.47       |     
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.14.3       | 0.16.0       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.80.0       | 1.82.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 50.1         |     
                         gssdp |  DISTRO  | https://release-monitoring.org/project/001262 | 1.6.4        | 1.6.6        |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.13      | 1.29.2       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.10       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.13      | 1.28.4       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.13      | 1.28.4       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.13      | 1.28.4       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.13      | 1.28.4       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.13      | 1.29.2       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.13      | 1.28.4       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.13      | 1.28.4       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.9.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.13      | 1.26.11      | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.2       | 0.16.0       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.13      | 1.28.4       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.13      | 1.28.4       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.10      | 3.24.11      |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 5.18.0       | 5.20.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.11       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.9        | 1.6.10       |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.4       | 0.14.5       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.2       | 0.12.3       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.57.2       | 1.61.1       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.27       | 3.4.2        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/011695 | 1.9.21       | 1.9.26       |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.3.0        | 1.4.0        |     
                       hiredis |  DISTRO  | https://release-monitoring.org/project/001318 | 1.3.0        | 1.4.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.26.4       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 2.0.1        | 2.0.2        |     
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.12.2       | 2.14.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.59.0       | 2.60.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 78.2         | 78.3         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.8        | 1.6.9        |     
                 igt-gpu-tools |  GUESS   | https://release-monitoring.org/project/323454 | 2.4          | 2.5          |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.2-26     | 7.1.2-27     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.12.5       | 1.12.6       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.25.9.0     | ORPH
              intel-vpl-gpu-rt |  DISTRO  | https://release-monitoring.org/project/372126 | 26.2.3       | 26.2.4       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.508        | 3.511        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.2        | ORPH
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/001392 | 7.0.0        | 7.1.0        |     
                      iptables |  DISTRO  | https://release-monitoring.org/project/001394 | 1.8.11       | 1.8.13       | ORPH
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.27         | 0.28         | ORPH
                       jansson |  DISTRO  | https://release-monitoring.org/project/001417 | 2.15.0       | 2.15.1       |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.3        | 3.7.0        | ORPH
                           joe |  DISTRO  | https://release-monitoring.org/project/001467 | 4.6          | 4.8          | ORPH
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 3.1.4.1      | 3.2.0        |     
                        json-c |  DISTRO  | https://release-monitoring.org/project/001477 | 0.18         | 0.19         |     
                       jsoncpp |  DISTRO  | https://release-monitoring.org/project/007483 | 1.9.7        | 1.9.8        |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.9.0        | 2.10.0       | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.4        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.27.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.27.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.27.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.27.0       |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.6        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.2        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/021863 | 3.91         | 3.98         | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20260107.1   | 20260526.0   |     
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.1        |     
                        libass |  DISTRO  | https://release-monitoring.org/project/001560 | 0.17.4       | 0.17.5       |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.6.2        | 1.7.0        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        | ORPH
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 1.0.0        | 1.1.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/006308 | 1.18.0       | 1.18.2       | ORPH
                      libecoli |  DISTRO  | https://release-monitoring.org/project/375859 | 0.10.1       | 0.11.7       |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.5       | 1.13.6       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                        libffi |  DISTRO  | https://release-monitoring.org/project/001611 | 3.5.2        | 3.6.0        |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                       libglew |  DISTRO  | https://release-monitoring.org/project/007878 | 2.2.0        | 2.3.1        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.86.5       | 2.88.2       |     
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.24.3       | 2.1.2        | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.3.1        | ORPH
                     libgpiod2 |  DISTRO  | https://release-monitoring.org/project/020640 | 2.2.4        | 2.3.1        |     
                        libgsm |  DISTRO  | https://release-monitoring.org/project/012587 | 1.0.23       | 1.0.24       | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.51      | 3.24.52      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.21.0       | 4.22.4       | ORPH
                       libheif |  DISTRO  | https://release-monitoring.org/project/064439 | 1.23.0       | 1.23.1       |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.51       | 0.5.53       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/001637 | 3.0.20       | 4.0.3        |     
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.43         | 1.44         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.3       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.3        | 0.2.6        |     
                        libjxl |  DISTRO  | https://release-monitoring.org/project/232764 | 0.11.2       | 0.12.0       |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/001649 | 1.7.0        | 1.8.0        | ORPH
                       libldns |  DISTRO  | https://release-monitoring.org/project/014817 | 1.9.0        | 1.9.2        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.49         | 250          |     
                    liblogging |  DISTRO  | https://release-monitoring.org/project/001654 | 1.0.6        | 1.0.8        | ORPH
                        libmad |  DISTRO  | https://release-monitoring.org/project/021487 | 0.15.1b      | 0.16.4       | ORPH
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.13.3       |     
                         libmd |  DISTRO  | https://release-monitoring.org/project/015525 | 1.1.0        | 1.2.0        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.6       | 0.14.2       |     
                     libmodbus |  DISTRO  | https://release-monitoring.org/project/009728 | 3.1.12       | 3.2.0        |     
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/068638 | 3.0.15       | 4.0.0.0      |     
                  libmpdclient |  DISTRO  | https://release-monitoring.org/project/021364 | 2.23         | 2.26         |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.11alpha    | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 3.7.10       | 4.4.10       |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.1        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.3.0        | 1.3.1        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.23       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 6.2.3        | 6.3.0        |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/007953 | 4.38.2       | 4.39         |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.7        |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/002566 | 3.6.3        | 4.0.1        | ORPH
                     libosmium |  DISTRO  | https://release-monitoring.org/project/007023 | 2.22.0       | 2.23.1       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2026.2       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.2.1        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.10.7       | 8.0.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                        libpsl |  DISTRO  | https://release-monitoring.org/project/007305 | 0.21.5       | 0.22.0       |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/009399 | 2.0.8        | 2.0.10       |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/007307 | 1.36.0       | 1.38.0       |     
                  libqrtr-glib |  DISTRO  | https://release-monitoring.org/project/192056 | 1.2.2        | 1.4.0        |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.4       | 0.22.1       |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/001713 | 1.11.0       | 1.12.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.3.2        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.62.90      |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.7        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/013823 | 2.6.0        | 2.6.1        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.8.1        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.1       | 2.12.2       |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.35       | 0.7.39       |     
                      libsoup3 |  DISTRO  | https://release-monitoring.org/project/011483 | 3.6.6        | 3.7.1        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/018547 | 2.7.0        | 2.8.0        |     
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.15.3       | 0.16.16      | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.20       | 2.0.13       |     
                 libtraceevent |  DISTRO  | https://release-monitoring.org/project/288159 | 1.8.7        | 1.9.0        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.4        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.3.3        | 1.5.1        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.25      | 2.0.2        |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 1.0.3        | 1.0.4        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.15.5       | 0.15.6       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.12         | 2.15         |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/001750 | 0.1.8        | 0.1.9        |     
                         libva |  DISTRO  | https://release-monitoring.org/project/001752 | 2.23.0       | 2.24.0       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.18.0       | 8.18.4       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 12.5.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.16.0       | 2023.4.0     |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.9.2        | 1.13.2       |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/003531 | 2.47         | 2.59         |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.27       | 0.3.28       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.6.1        | ORPH
                    libxmlsec1 |  DISTRO  | https://release-monitoring.org/project/005200 | 1.3.9        | 1.3.12       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 3.13.6       | 5.8.6        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.9.0        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.9.0        |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.28.0       |     
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20260519     | 20260622     |     
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.8.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2025.10.13   | 2026.07.04   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.20       | 1.0.22       | ORPH
                          lmdb |  DISTRO  | https://release-monitoring.org/project/006974 | 0.9.35       | 1.0.0        | ORPH
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cpp |  DISTRO  | https://release-monitoring.org/project/021499 | 1.1.4        | 1.1.6        |     
                          lpac |  DISTRO  | https://release-monitoring.org/project/371628 | 2.2.1        | 2.3.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/001842 | 0.651        | 0.660        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/001844 | 4.99.6       | 4.99.7       | ORPH
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.14.0       | 2.15.1       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.14.3       | 2.15.2       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.14.0       | 2.15.1       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.5.0        |     
                  lua-argparse |  GUESS   | https://release-monitoring.org/project/007317 | 0.7.1-1      | 0.7.2        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                      lua-zlib |  GUESS   | https://release-monitoring.org/project/380938 | 1.3-0        | 1.4          |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/001856 | 3.12.2       | 3.13.0       |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.2        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.51.0-1     | 1.52.1-0     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.41      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 6.0.6        | 7.0.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/001863 | 2.9.2        | 2.9.3        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/001866 | 1.25         | 1.26         | ORPH
                         lzlib |  DISTRO  | https://release-monitoring.org/project/021513 | 0.4.1.53-4   | 0.4.3        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 26.01        | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.8        | 1.7.9        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.18     | 13.0.1       | ORPH
              matchbox-desktop |  DISTRO  | https://release-monitoring.org/project/235369 | 0.9.1        | 2.0          | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.30       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 3.6.6        | 4.1.0        |     
                        mbpoll |  DISTRO  | https://release-monitoring.org/project/368619 | 1.5.2        | 1.5.4        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20260511     |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.8.2      |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.42       | 1.6.43       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 8.00         | 8.10         |     
               mender-artifact |  DISTRO  | https://release-monitoring.org/project/020630 | 4.2.0        | 4.4.0        |     
                    menu-cache |  DISTRO  | https://release-monitoring.org/project/001968 | 1.1.0        | 1.1.1        | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2026.04.1    |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.16.1       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                    mini-snmpd |  DISTRO  | https://release-monitoring.org/project/021523 | 1.6          | 2.0          |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.2.2        |     
                  minizip-zlib |  DISTRO  | https://release-monitoring.org/project/005303 | 1.3.1        | 1.3.2        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2026.06      |     
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.31.1       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.12       | 4.0.0.0      |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.35.2       | 6.0.0        |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.40.0       | 0.41.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 7.0.0        | 8.0.0        |     
                     msgpack-c |  DISTRO  | https://release-monitoring.org/project/235285 | 6.1.0        | 7.0.1        | ORPH
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.48       | 4.0.49       | ORPH
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
                      multicat |  DISTRO  | https://release-monitoring.org/project/021734 | 2.3          | 2.4          | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.14.3       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.28.0       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.3.2        | 2.4.1        |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.45         | 1.46         |     
                          nano |  DISTRO  | https://release-monitoring.org/project/002046 | 9.0          | 9.1          | ORPH
                          nasm |  DISTRO  | https://release-monitoring.org/project/002048 | 2.16.03      | 3.02         | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.26.1       | 3.27.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.10.0       |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.6-20251231 | 6.6-20260704 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                         neard |  DISTRO  | https://release-monitoring.org/project/021866 | 0.19         | 0.20         |     
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.3.4        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 4.4.3        | 4.5.0        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.17.1      | 2.0.0        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.234        | 1.238        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.37.1       | 2.10.3       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.14       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.4.5        | 2.8.7        |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/002073 | 3.10.2       | 4.0          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/021197 | 1.56.0       | 1.56.1       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.12.0       | 1.12.5       |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.68.1       | 1.69.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.30.3       | 1.31.2       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                           nnn |  DISTRO  | https://release-monitoring.org/project/017080 | 5.1          | 5.2          |     
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.22.0      | 26.4.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.22.0      | 26.4.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.3.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                         nqptp |  DISTRO  | https://release-monitoring.org/project/293307 | 1.2.4        | 1.2.8        |     
                       ntfs-3g |  DISTRO  | https://release-monitoring.org/project/002504 | 2022.10.3    | 2026.2.25    | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.108.0      | 0.114.0      | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 610.43.02    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 580.95.05    | 610.43.02    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 2.15         | 3.0-b.2      | ORPH
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 11.1.0       | 11.3.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.18         | 2.19         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v14.4.1      | 14.5.2       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.4        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.5.5        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.24.3       | 1.25.2       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2025.07.22   | 2026.05.29   |     
                opencl-headers |  DISTRO  | https://release-monitoring.org/project/223257 | 2025.07.22   | 2026.05.29   |     
             opencl-icd-loader |  DISTRO  | https://release-monitoring.org/project/378666 | 2025.07.22   | 2026.05.29   |     
                   openconnect |  DISTRO  | https://release-monitoring.org/project/015179 | 9.12         | 9.21         |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.8.1        | 1.8.3        |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.13.0       | 5.0.0        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.8        | 5.0.10       |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.63.3       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.4       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 13.1.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.41       | 0.4.42       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/002575 | 2.2.0        | 2.3.1        |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.6.0        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.31         |     
                          palo |  GUESS   | https://release-monitoring.org/project/389410 | 2.29         | 2.30         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.56.4       | 1.58.0       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.2       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.4       | 2.46.5       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                        parsec |  DISTRO  | https://release-monitoring.org/project/183223 | 1.4.1        | 1.5.0        |     
                        parted |  DISTRO  | https://release-monitoring.org/project/002596 | 3.6          | 3.7          |     
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.19.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.10       | ORPH
                       pcmanfm |  DISTRO  | https://release-monitoring.org/project/002607 | 1.3.2        | 1.4.0        |     
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.5.1        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                    perl-clone |  DISTRO  | https://release-monitoring.org/project/005875 | 0.47         | 0.50         |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.07         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.23         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.41         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.98         | 6.99         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.013        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.649        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.85         | 0.87         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.86         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/002967 | 3.83         | 3.85         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/002975 | 6.16         | 6.17         |     
                perl-http-date |  DISTRO  | https://release-monitoring.org/project/002976 | 6.06         | 6.07         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/002977 | 7.01         | 7.02         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.59        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.099        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.81         | 6.83         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/003050 | 6.14         | 6.15         |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/011809 | 5.515        | 5.517        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.052        | 0.053        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.42         | 9.47         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.53         | 1.55         |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/006578 | 1.0051       | 1.0054       |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/010665 | 2.002004     | 2.002005     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                 perl-sys-mmap |  DISTRO  | https://release-monitoring.org/project/005675 | 0.20         | 0.21         |     
           perl-time-parsedate |  DISTRO  | https://release-monitoring.org/project/003469 | 2015.103     | 2026.0219    |     
                 perl-timedate |  DISTRO  | https://release-monitoring.org/project/003463 | 2.33         | 2.35         |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.34         | 5.35         |     
           perl-www-robotrules |  DISTRO  | https://release-monitoring.org/project/003506 | 6.02         | 6.03         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0213       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.27       | 5.1.28       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.5.0        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.5.0        | 3.5.3        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 2.2.0        | 2.3.0        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 2.2.0-a4     | 2.3.0        |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/003643 | 1.3.2        | 1.3.3        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.6.6        | 1.6.7        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.5.1        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.14.2       | 1.15.3       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.7.0       | 6.0.0        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 126          | 127          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 25.10.0      | 26.07.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.6.2        | 3.6.4        |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.17         | 4.23         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.13       | 1.3.14       | ORPH
                          pppd |  DISTRO  | https://release-monitoring.org/project/003703 | 2.5.2        | 2.5.3        |     
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.10      | 0.14.12      |     
                       proftpd |  DISTRO  | https://release-monitoring.org/project/007609 | 1.3.9a       | 1.3.9b       | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/009463 | 9.8.0        | 9.8.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.6       |     
                     protozero |  DISTRO  | https://release-monitoring.org/project/008002 | 1.8.1        | 1.8.2        |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.16         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.10.5       | 1.11.0       |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/021245 | 4.0.0        | 4.0.4        |     
       python-aiohappyeyeballs |  DISTRO  | https://release-monitoring.org/project/373934 | 2.6.1        | 2.7.1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/006713 | 3.13.5       | 3.14.1       |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.17.2       | 1.18.5       |     
                  python-anyio |  DISTRO  | https://release-monitoring.org/project/049275 | 4.13.0       | 4.14.1       |     
            python-apscheduler |  DISTRO  | https://release-monitoring.org/project/005641 | 3.11.2       | 3.11.3       |     
            python-argcomplete |  DISTRO  | https://release-monitoring.org/project/003773 | 3.6.3        | 3.7.0        |     
             python-asyncclick |  DISTRO  | https://release-monitoring.org/project/025628 | 8.3.0.7      | 8.4.2.1      |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.22.0       | 2.24.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/007015 | 25.12.2      | 26.6.2       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.17.0       | 2.18.0       |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/003779 | 4.14.3       | 4.15.0       |     
               python-bitarray |  DISTRO  | https://release-monitoring.org/project/011014 | 3.8.1        | 3.8.2        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/026271 | 3.0.1        | 3.0.2        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.43.1       | 1.43.40      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.43.1       | 1.43.40      |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 6.2.4        | 7.1.4        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/064102 | 5.9.0        | 6.1.3        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2026.4.22    | 2026.6.17    |     
                python-chardet |  DISTRO  | https://release-monitoring.org/project/003798 | 5.2.0        | 7.4.3        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.5        | 3.4.7        |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/003802 | 8.3.3        | 8.4.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.3        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 48.0.0       | 49.0.0       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.1.3        | 3.2.8        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/021939 | 4.2.1        | 4.2.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/021697 | 1.1.0        | 1.1.1        |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 5.0.14       | 5.0.22       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.2.1        | 5.3.1        |     
                python-distlib |  DISTRO  | https://release-monitoring.org/project/034504 | 0.4.0        | 0.4.3        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/003849 | 0.22.4       | 0.23         |     
                 python-dotenv |  DISTRO  | https://release-monitoring.org/project/019788 | 1.2.1        | 1.2.2        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2026.4       | 2026.6       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.1       | 0.19.2       |     
             python-emailproxy |  DISTRO  | https://release-monitoring.org/project/377309 | 2025.10.4    | 2026.7.3     |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.13.0       | 4.13.3       |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 5.1.0        | 5.3.1        |     
                 python-falcon |  DISTRO  | https://release-monitoring.org/project/003860 | 4.2.0        | 4.3.1        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/047977 | 0.136.3      | 0.139.0      |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.29.0       | 3.29.5       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 6.0.2        | 6.0.5        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 25.9.23      | 25.12.19     |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.62.1       | 4.63.0       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/006459 | 3.1.46       | 3.1.50       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 16.1.0       | 16.3.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.54.5       | 3.56.3       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.30.3       | 2.31.0       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.49.1       | 2.55.1       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.74.0       | 1.75.0       |     
                  python-gpiod |  DISTRO  | https://release-monitoring.org/project/084415 | 2.4.2        | 2.5.0        |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/006870 | 3.5.0        | 3.5.3        |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.76.0       | 1.81.1       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.76.0       | 1.81.1       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/003882 | 23.0.0       | 26.0.0       |     
              python-hatchling |  DISTRO  | https://release-monitoring.org/project/185085 | 1.29.0       | 1.30.1       |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/012002 | 3.3.1        | 3.4.0        |     
                  python-hpack |  DISTRO  | https://release-monitoring.org/project/019034 | 4.1.0        | 4.2.0        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/003887 | 0.31.2       | 0.32.0       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.15.0       | 4.16.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/005487 | 3.11         | 3.18         |     
              python-installer |  DISTRO  | https://release-monitoring.org/project/197662 | 1.0.0        | 1.0.1        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 9.8.0        | 9.15.0       |     
            python-iterable-io |  DISTRO  | https://release-monitoring.org/project/374467 | 1.0.1        | 1.0.4        |     
         python-jaraco-context |  DISTRO  | https://release-monitoring.org/project/062309 | 6.0.2        | 6.1.2        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.4.0        | 4.5.0        |     
            python-jaraco-text |  DISTRO  | https://release-monitoring.org/project/023436 | 4.0.0        | 4.2.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/003893 | 0.19.2       | 0.20.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/016910 | 1.4.9        | 1.5.0        |     
                  python-librt |  DISTRO  | https://release-monitoring.org/project/388232 | 0.9.0        | 0.12.0       |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.3.1        | 3.4.0        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/015512 | 2.2.0        | 2.2.1        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 6.0.2        | 6.1.1        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.23.0       | 0.24.0       |     
python-magic-wormhole-mailb... |  DISTRO  | https://release-monitoring.org/project/019823 | 0.6.0        | 0.8.0        |     
         python-markdown-it-py |  DISTRO  | https://release-monitoring.org/project/088959 | 4.0.0        | 4.2.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.9       | 3.11.0       |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.2.1        | 0.2.2        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.11.2       | 1.14.1       |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/021702 | 1.1.4        | 1.1.5        |     
        python-mdit-py-plugins |  DISTRO  | https://release-monitoring.org/project/149444 | 0.5.0        | 0.6.1        |     
                 python-memray |  DISTRO  | https://release-monitoring.org/project/267110 | 1.19.1       | 1.19.3       |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.19.0       | 0.20.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.2.0        | 3.3.2        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 11.0.2       | 11.1.0       |     
                   python-mpd2 |  DISTRO  | https://release-monitoring.org/project/019721 | 3.1.1        | 3.1.2        |     
                 python-mpmath |  DISTRO  | https://release-monitoring.org/project/003930 | 1.3.0        | 1.4.1        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/021831 | 1.1.2        | 1.2.1        |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/018463 | 0.0.22       | 0.0.32       |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/003931 | 1.47.0       | 1.48.1       |     
                   python-mypy |  DISTRO  | https://release-monitoring.org/project/008453 | 1.19.1       | 2.1.0        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 2.4.0        | 2.5.1        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 2.0.1        |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.11.5       | 3.11.9       |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 4.0.0        | 5.0.0+rtd1   |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/016689 | 0.8.6        | 0.8.7        |     
            python-pdm-backend |  DISTRO  | https://release-monitoring.org/project/306904 | 2.4.8        | 2.4.9        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 12.0.0       | 12.3.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 26.1         | 26.1.2       |     
           python-platformdirs |  DISTRO  | https://release-monitoring.org/project/200932 | 4.9.6        | 4.10.0       |     
            python-poetry-core |  DISTRO  | https://release-monitoring.org/project/071155 | 2.3.2        | 2.4.1        |     
              python-propcache |  DISTRO  | https://release-monitoring.org/project/375192 | 0.4.1        | 0.5.2        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.27.2       | 1.28.0       |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/003979 | 2.9.11       | 2.9.12       |     
                  python-pyaml |  DISTRO  | https://release-monitoring.org/project/083931 | 26.2.1       | 26.7.0       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/013384 | 3.0.1        | 3.0.4        |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.11       | 0.8.1        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20260313.1   | 20260818.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/039654 | 2.13.3       | 2.13.4       |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.46.3       | 2.47.0       |     
      python-pydantic-settings |  DISTRO  | https://release-monitoring.org/project/342182 | 2.14.0       | 2.14.2       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.32         | 0.33         |     
                  python-pyjwt |  DISTRO  | https://release-monitoring.org/project/005653 | 2.12.1       | 2.13.0       |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/021583 | 0.23.0       | 0.24.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/015600 | 3.13.0       | 3.13.1       |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/007284 | 1.1.2        | 1.2.0        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 26.1.0       | 26.3.0       |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 1.3.0        | 1.5.0        |     
                  python-pypng |  DISTRO  | https://release-monitoring.org/project/006706 | 0.20220715.0 | 0.20250521.0 |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.11.0       | 0.12.1       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.13       | 1.2.14       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.6.2        | 2.0.0        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.22       | 7.1.27       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/003765 | 9.0.3        | 9.1.1        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 1.3.0        | 1.4.0        |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2026.1.post1 | 2026.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.1.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 7.4.0        | 8.0.1        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/005548 | 2026.4.4     | 2026.6.28    |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/004004 | 2.33.1       | 2.34.2       |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.30.0       | 2026.6.3     |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.13.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.4        |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.19.0       | 0.19.1       |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.17.0       | 0.19.0       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.17.1       | 1.18.0       |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.39.0       | 4.45.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.58.0       | 2.64.0       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/007917 | 24.2.0       | 26.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 80.9.0       | 83.0.0       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.12.1       | 1.13.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 9.2.2        | 10.2.0       |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.2.2        | 2.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.15.3       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.3        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.16.0       | 5.16.3       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.8.3        | 2.8.4        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/004034 | 2.0.49       | 2.0.51       |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 1.1.0        | 1.3.1        |     
                python-systemd |  DISTRO  | https://release-monitoring.org/project/007314 | 235          | 236          |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/021613 | 1.3.4        | 1.3.5        |     
             python-telnetlib3 |  DISTRO  | https://release-monitoring.org/project/133741 | 4.0.2        | 4.0.5        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.1        | 5.10.0       |     
                python-textual |  DISTRO  | https://release-monitoring.org/project/209284 | 8.2.5        | 8.2.8        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/021614 | 0.22.0       | 0.23.0       |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/019609 | 0.14.0       | 0.15.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/007498 | 6.5.5        | 6.5.7        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/036051 | 4.67.3       | 4.68.3       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/012211 | 5.14.3       | 5.15.1       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/019614 | 25.5.0       | 26.7.0       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2026.4.28.13 | 2026.6.1.19  |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/004071 | 25.5.0       | 26.4.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/007202 | 25.12.2      | 26.6.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/019661 | 24.8.0       | 26.6.0       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.5.1        | 4.5.2        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/021617 | 1.3.4        | 2.0.0        |     
           python-types-psutil |  DISTRO  | https://release-monitoring.org/project/221807 | 7.2.2.202... | 7.2.2.202... |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.9.0.202... | 2.9.0.202... |     
       python-types-setuptools |  DISTRO  | https://release-monitoring.org/project/214295 | 82.0.0.20... | 82.0.0.20... |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/019755 | 4.15.0       | 4.16.0       |     
                python-tzlocal |  DISTRO  | https://release-monitoring.org/project/006911 | 5.3.1        | 5.4.4        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/004076 | 5.12.0       | 5.13.0       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 4.0.0        | 4.0.3        |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/028526 | 0.46.0       | 0.50.0       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/008743 | 0.2.14       | 0.8.2        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 68.1         | 69.0         |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/020617 | v3.1.1       | 3.3.3        |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/006181 | 1.8.9        | 1.8.10       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/006108 | 2.0.1        | 2.2.2        |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/011805 | 3.2.1        | 3.2.2        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.23.0       | 1.24.2       |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/050636 | 20230507.3   | 20260518.1   |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.148.0      | 1.0.0        |     
           python-zipstream-ng |  DISTRO  | https://release-monitoring.org/project/215954 | 1.9.0        | 1.9.2        |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/066674 | 23.1.1       | 26.6.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/004112 | 8.4          | 8.5          |     
                 python-zopfli |  DISTRO  | https://release-monitoring.org/project/050016 | 0.4.1        | 0.4.3        |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2026.19      | 2026.27      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 11.0.0       | 11.0.2       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.1        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                qoriq-mc-utils |  DISTRO  | https://release-monitoring.org/project/377824 | 10.39.0      | 10.40.0      |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.18      | 6.11.1       |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.9.1        | 6.11.1       |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/004141 | 1.5          | 1.7.2        |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.8.0        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.17.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rasdaemon |  DISTRO  | https://release-monitoring.org/project/377958 | 0.8.4        | 0.8.5        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 62.0         | 63.0         |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20250923   | 2.20260616   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.7       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.1       | 15.1.0       |     
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.48         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 11.0.4       | 11.1.2       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2510.0     | 8.2606.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.10         |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 25.02        | 25.12        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.15.3       | 0.16.16      | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 9.0.4        | 9.1.0        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.3.5        | 1.5.0        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 45.2         |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.43.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.15.0.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.2      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.2.0.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.4.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.8.0.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.6.1.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.9.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/004758 | 4.24.3       | 4.24.4       |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.1          | 2.2          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.10.1       |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                           sdl |  DISTRO  | https://release-monitoring.org/project/004777 | 1.2.15       | 3.4.12       | ORPH
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.12       | 3.4.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 3.2.4        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/004783 | 2.2.0        | 3.2.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.6        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                         seatd |  DISTRO  | https://release-monitoring.org/project/234932 | 0.9.1        | 0.9.3        | ORPH
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.15.2       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.7        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.32.8       | 0.32.10      |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.5.1        | 4.7.0        | ORPH
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.18.0       | 4.19.4       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 4.3.7        | 5.1          | ORPH
                      shapelib |  DISTRO  | https://release-monitoring.org/project/004804 | 1.6.2        | 1.6.3        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.5.1        | ORPH
                   shellinabox |  DISTRO  | https://release-monitoring.org/project/009501 | 2.20         | 2.21         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       siproxd |  DISTRO  | https://release-monitoring.org/project/179540 | 0.8.3        | 0.8.4        |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.15.0.0     |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.22.2       | 1.23.0       |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.9.1        | 4.9.3        | ORPH
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/096795 | 1.3.3        | 1.3.4        |     
                      smcroute |  DISTRO  | https://release-monitoring.org/project/017369 | 2.5.7        | 2.6.0        |     
                      snagboot |  DISTRO  | https://release-monitoring.org/project/351979 | 2.5          | 2.6.1        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.8.2        | 1.8.3        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.6.5        | 3.6.6        |     
                        snooze |  DISTRO  | https://release-monitoring.org/project/376662 | 0.5          | 0.5.1        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.11.1.0     | 3.12.2.0     |     
                         socat |  DISTRO  | https://release-monitoring.org/project/004848 | 1.8.1.1      | 1.8.1.3      |     
                      softhsm2 |  DISTRO  | https://release-monitoring.org/project/004850 | 2.6.1        | 2.7.0        | ORPH
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/020628 | 1.0.2        | 1.1.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                 spirv-headers |  DISTRO  | https://release-monitoring.org/project/230542 | 1.4.350.0    | 1.4.350.1    | ORPH
         spirv-llvm-translator |  DISTRO  | https://release-monitoring.org/project/227273 | 22.1.3       | 22.1.4       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.4.350.0    | 1.4.350.1    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.16.0       |     
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.22       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.3.1        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.23.7       | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                    stellarium |  DISTRO  | https://release-monitoring.org/project/004891 | 26.1         | 26.2         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.21.02      | 0.21.03      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 6.0.5        | 6.0.7        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.78         | 5.79         |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 26.06        |     
                      supertux |  DISTRO  | https://release-monitoring.org/project/004911 | 0.6.3        | 0.7.0-rev.1  |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/016289 | 4.2.5        | 4.3.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 8.0.4        | 8.0.5        |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/020562 | 1.2.1        | 1.2.2        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.4.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 10.0.2       | 10.1.5       |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/015714 | 2026.05      | 2026.05.1    |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.41.4       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.11.0       | 4.12.0       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 49.0         | 50.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 3.7.11       | 5.1.0        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.9       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 258.7        | 261.1        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.14         | 3.18         | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.98.8       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.2        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2023.0.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.11.0       |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.4        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.8.1        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.21.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.15.10      |     
                           tig |  DISTRO  | https://release-monitoring.org/project/004969 | 2.6.0        | 2.6.1        |     
                          time |  DISTRO  | https://release-monitoring.org/project/004971 | 1.9          | 1.10         |     
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.27.1       | 2.28.2       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.1.2        |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/008699 | 1.11.2       | 1.11.3       | ORPH
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20260601     |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.7.2      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.4        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.3.1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.6b         | 3.7b         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/018777 | 1.9.1        | 1.10.0       |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/007873 | 3.3.3        | 3.4          |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/005002 | 4.1.2        | 4.1.3        |     
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.2.1        | 2.3.2        |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.19         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.9.0.1      | 4.10.0.0     |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 7.2.6        | 7.2.7        |     
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.9.7        | 1.9.17       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.91.3       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.2.0        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.52         | 6.61         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.10.0       | 2.11.3       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.5       | 2.42.2       |     
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.5       | 2.42.2       |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.15.3       | 0.15.4       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.18      | 0.56.19      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/013639 | 3.26.0       | 3.27.1       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.1.1        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.8.2        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.4        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.2148     | 9.2.0782     |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.2.0        | 3.3.0        |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.84.0       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.356      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.356      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.350.1    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.356      | ORPH
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.7        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.9.0        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.24.0       | 1.25.0       |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.48         | 1.49         | ORPH
                 wayland-utils |  DISTRO  | https://release-monitoring.org/project/129361 | 1.2.0        | 1.3.0        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.52.4       | 2.53.4       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.23         | 2.25         | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 11.0         | 11.12        |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.14       | 0.5.15       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.4.16       | 4.6.6        |     
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.20.0       | 0.20.1       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.10.0       | 4.0.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.50.5       | 2.52.4       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.47.1       | 0.50.0       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       | ORPH
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 4.1          | 4.2          |     
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
                   xapp_xclock |  DISTRO  | https://release-monitoring.org/project/015032 | 1.1.1        | 1.2.0        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.1.0        | 1.1.1        |     
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.4        | 1.2.5        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.6        | 1.2.7        | ORPH
                      xapp_xfd |  DISTRO  | https://release-monitoring.org/project/015024 | 1.1.4        | 1.1.5        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.1        | 1.1.2        | ORPH
                    xapp_xkill |  DISTRO  | https://release-monitoring.org/project/014993 | 1.0.6        | 1.0.7        | ORPH
               xapp_xlsclients |  DISTRO  | https://release-monitoring.org/project/014989 | 1.1.5        | 1.1.6        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.3        | 1.5.4        | ORPH
                xdata_xbitmaps |  DISTRO  | https://release-monitoring.org/project/013645 | 1.1.3        | 1.1.4        | ORPH
                       xdotool |  DISTRO  | https://release-monitoring.org/project/008648 | 3.20211022.1 | 4.20260303.1 | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.19.5       | 4.21.1       |     
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/015059 | 1.0.5        | 1.0.6        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.1        | 1.4.2        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.19.0       | 7.0.1        | ORPH
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.48         | ORPH
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
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.14         | 6.15         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.30         | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 14.2         | 15.0         |     
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/005284 | 0.8.0        | 0.9.0        | ORPH
                            yq |  DISTRO  | https://release-monitoring.org/project/303696 | 4.49.2       | 4.53.3       |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.15.2       | 4.16.0       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.13       | 7.4.11       |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.3        |     
                        zellij |  DISTRO  | https://release-monitoring.org/project/300087 | 0.44.2       | 0.44.3       |     
                  zisofs-tools |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     | ORPH
                           zix |  DISTRO  | https://release-monitoring.org/project/370005 | 0.8.0        | 0.8.2        |     
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.8        | 0.10.0       |     
                           zsh |  DISTRO  | https://release-monitoring.org/project/005307 | 5.9          | 5.9.1        |     
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.3.0        | 3.0.2        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

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
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
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
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
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
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                    containerd | CVE-2026-47262   | https://security-tracker.debian.org/tracker/CVE-2026-47262  
                    containerd | CVE-2026-53488   | https://security-tracker.debian.org/tracker/CVE-2026-53488  
                    containerd | CVE-2026-46680   | https://security-tracker.debian.org/tracker/CVE-2026-46680  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
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
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
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
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42790   | https://security-tracker.debian.org/tracker/CVE-2026-42790  
                        erlang | CVE-2026-42789   | https://security-tracker.debian.org/tracker/CVE-2026-42789  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
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
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
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
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
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
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-55204   | https://security-tracker.debian.org/tracker/CVE-2026-55204  
                       haproxy | CVE-2026-55203   | https://security-tracker.debian.org/tracker/CVE-2026-55203  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                       hostapd | CVE-2026-58374   | https://security-tracker.debian.org/tracker/CVE-2026-58374  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                      libglib2 | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
                      libglib2 | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
                      libglib2 | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
                      libglib2 | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
            libglib2-bootstrap | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
            libglib2-bootstrap | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
            libglib2-bootstrap | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
            libglib2-bootstrap | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                       libldns | CVE-2026-10846   | https://security-tracker.debian.org/tracker/CVE-2026-10846  
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
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libssh2 | CVE-2025-15661   | https://security-tracker.debian.org/tracker/CVE-2025-15661  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       libxml2 | CVE-2026-11979   | https://security-tracker.debian.org/tracker/CVE-2026-11979  
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
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
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       proftpd | CVE-2026-35025   | https://security-tracker.debian.org/tracker/CVE-2026-35025  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       quickjs | CVE-2025-69653   | https://security-tracker.debian.org/tracker/CVE-2025-69653  
                       quickjs | CVE-2025-69654   | https://security-tracker.debian.org/tracker/CVE-2025-69654  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
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
                         socat | CVE-2026-56123   | https://security-tracker.debian.org/tracker/CVE-2026-56123  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-55693   | https://security-tracker.debian.org/tracker/CVE-2026-55693  
                           vim | CVE-2026-52860   | https://security-tracker.debian.org/tracker/CVE-2026-52860  
                           vim | CVE-2026-52858   | https://security-tracker.debian.org/tracker/CVE-2026-52858  
                           vim | CVE-2026-52859   | https://security-tracker.debian.org/tracker/CVE-2026-52859  
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-57456   | https://security-tracker.debian.org/tracker/CVE-2026-57456  
                           vim | CVE-2026-57451   | https://security-tracker.debian.org/tracker/CVE-2026-57451  
                           vim | CVE-2026-57453   | https://security-tracker.debian.org/tracker/CVE-2026-57453  
                           vim | CVE-2026-57452   | https://security-tracker.debian.org/tracker/CVE-2026-57452  
                           vim | CVE-2026-57455   | https://security-tracker.debian.org/tracker/CVE-2026-57455  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-47167   | https://security-tracker.debian.org/tracker/CVE-2026-47167  
                           vim | CVE-2026-47162   | https://security-tracker.debian.org/tracker/CVE-2026-47162  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-55895   | https://security-tracker.debian.org/tracker/CVE-2026-55895  
                           vim | CVE-2026-55892   | https://security-tracker.debian.org/tracker/CVE-2026-55892  
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
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
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
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
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

CVEs for the '2026.05.x' branch
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
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
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
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                    containerd | CVE-2026-47262   | https://security-tracker.debian.org/tracker/CVE-2026-47262  
                    containerd | CVE-2026-53488   | https://security-tracker.debian.org/tracker/CVE-2026-53488  
                    containerd | CVE-2026-46680   | https://security-tracker.debian.org/tracker/CVE-2026-46680  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                  cups-filters | CVE-2025-64503   | https://security-tracker.debian.org/tracker/CVE-2025-64503  
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
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
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
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
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42790   | https://security-tracker.debian.org/tracker/CVE-2026-42790  
                        erlang | CVE-2026-42789   | https://security-tracker.debian.org/tracker/CVE-2026-42789  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
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
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
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
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
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
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-55204   | https://security-tracker.debian.org/tracker/CVE-2026-55204  
                       haproxy | CVE-2026-55203   | https://security-tracker.debian.org/tracker/CVE-2026-55203  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                       hostapd | CVE-2026-58374   | https://security-tracker.debian.org/tracker/CVE-2026-58374  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-53463   | https://security-tracker.debian.org/tracker/CVE-2026-53463  
                   imagemagick | CVE-2026-53466   | https://security-tracker.debian.org/tracker/CVE-2026-53466  
                   imagemagick | CVE-2026-53467   | https://security-tracker.debian.org/tracker/CVE-2026-53467  
                   imagemagick | CVE-2026-53461   | https://security-tracker.debian.org/tracker/CVE-2026-53461  
                   imagemagick | CVE-2026-53464   | https://security-tracker.debian.org/tracker/CVE-2026-53464  
                   imagemagick | CVE-2026-53462   | https://security-tracker.debian.org/tracker/CVE-2026-53462  
                   imagemagick | CVE-2026-53465   | https://security-tracker.debian.org/tracker/CVE-2026-53465  
                   imagemagick | CVE-2026-53460   | https://security-tracker.debian.org/tracker/CVE-2026-53460  
                   imagemagick | CVE-2026-56377   | https://security-tracker.debian.org/tracker/CVE-2026-56377  
                   imagemagick | CVE-2026-48994   | https://security-tracker.debian.org/tracker/CVE-2026-48994  
                   imagemagick | CVE-2026-48724   | https://security-tracker.debian.org/tracker/CVE-2026-48724  
                   imagemagick | CVE-2026-48734   | https://security-tracker.debian.org/tracker/CVE-2026-48734  
                   imagemagick | CVE-2026-48733   | https://security-tracker.debian.org/tracker/CVE-2026-48733  
                   imagemagick | CVE-2026-49218   | https://security-tracker.debian.org/tracker/CVE-2026-49218  
                   imagemagick | CVE-2026-49219   | https://security-tracker.debian.org/tracker/CVE-2026-49219  
                   imagemagick | CVE-2026-55595   | https://security-tracker.debian.org/tracker/CVE-2026-55595  
                   imagemagick | CVE-2026-55577   | https://security-tracker.debian.org/tracker/CVE-2026-55577  
                   imagemagick | CVE-2026-55594   | https://security-tracker.debian.org/tracker/CVE-2026-55594  
                   imagemagick | CVE-2026-55597   | https://security-tracker.debian.org/tracker/CVE-2026-55597  
                   imagemagick | CVE-2026-55510   | https://security-tracker.debian.org/tracker/CVE-2026-55510  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-49839   | https://security-tracker.debian.org/tracker/CVE-2026-49839  
                            jq | CVE-2026-41257   | https://security-tracker.debian.org/tracker/CVE-2026-41257  
                            jq | CVE-2026-41256   | https://security-tracker.debian.org/tracker/CVE-2026-41256  
                            jq | CVE-2026-33947   | https://security-tracker.debian.org/tracker/CVE-2026-33947  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-43896   | https://security-tracker.debian.org/tracker/CVE-2026-43896  
                            jq | CVE-2026-43894   | https://security-tracker.debian.org/tracker/CVE-2026-43894  
                            jq | CVE-2026-32316   | https://security-tracker.debian.org/tracker/CVE-2026-32316  
                            jq | CVE-2026-40612   | https://security-tracker.debian.org/tracker/CVE-2026-40612  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                            jq | CVE-2026-47770   | https://security-tracker.debian.org/tracker/CVE-2026-47770  
                            jq | CVE-2026-54679   | https://security-tracker.debian.org/tracker/CVE-2026-54679  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                      libglib2 | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
                      libglib2 | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
                      libglib2 | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
                      libglib2 | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
            libglib2-bootstrap | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
            libglib2-bootstrap | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
            libglib2-bootstrap | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
            libglib2-bootstrap | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                       libldns | CVE-2026-10846   | https://security-tracker.debian.org/tracker/CVE-2026-10846  
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
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2025-15661   | https://security-tracker.debian.org/tracker/CVE-2025-15661  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                       libssh2 | CVE-2026-55200   | https://security-tracker.debian.org/tracker/CVE-2026-55200  
                       libssh2 | CVE-2026-55199   | https://security-tracker.debian.org/tracker/CVE-2026-55199  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       libxml2 | CVE-2026-11979   | https://security-tracker.debian.org/tracker/CVE-2026-11979  
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mariadb | CVE-2026-49261   | https://security-tracker.debian.org/tracker/CVE-2026-49261  
                       mariadb | CVE-2026-48165   | https://security-tracker.debian.org/tracker/CVE-2026-48165  
                       mariadb | CVE-2026-48163   | https://security-tracker.debian.org/tracker/CVE-2026-48163  
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
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
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       proftpd | CVE-2026-35025   | https://security-tracker.debian.org/tracker/CVE-2026-35025  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
              python-starlette | CVE-2026-48818   | https://security-tracker.debian.org/tracker/CVE-2026-48818  
              python-starlette | CVE-2026-48817   | https://security-tracker.debian.org/tracker/CVE-2026-48817  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
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
                       quickjs | CVE-2025-69653   | https://security-tracker.debian.org/tracker/CVE-2025-69653  
                       quickjs | CVE-2025-69654   | https://security-tracker.debian.org/tracker/CVE-2025-69654  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                          ruby | CVE-2026-46727   | https://security-tracker.debian.org/tracker/CVE-2026-46727  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
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
                         socat | CVE-2026-56123   | https://security-tracker.debian.org/tracker/CVE-2026-56123  
                          sudo | CVE-2026-35535   | https://security-tracker.debian.org/tracker/CVE-2026-35535  
                      swupdate | CVE-2026-28525   | https://security-tracker.debian.org/tracker/CVE-2026-28525  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-55693   | https://security-tracker.debian.org/tracker/CVE-2026-55693  
                           vim | CVE-2026-52860   | https://security-tracker.debian.org/tracker/CVE-2026-52860  
                           vim | CVE-2026-52858   | https://security-tracker.debian.org/tracker/CVE-2026-52858  
                           vim | CVE-2026-52859   | https://security-tracker.debian.org/tracker/CVE-2026-52859  
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-57456   | https://security-tracker.debian.org/tracker/CVE-2026-57456  
                           vim | CVE-2026-57451   | https://security-tracker.debian.org/tracker/CVE-2026-57451  
                           vim | CVE-2026-57453   | https://security-tracker.debian.org/tracker/CVE-2026-57453  
                           vim | CVE-2026-57452   | https://security-tracker.debian.org/tracker/CVE-2026-57452  
                           vim | CVE-2026-57455   | https://security-tracker.debian.org/tracker/CVE-2026-57455  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-47167   | https://security-tracker.debian.org/tracker/CVE-2026-47167  
                           vim | CVE-2026-47162   | https://security-tracker.debian.org/tracker/CVE-2026-47162  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-55895   | https://security-tracker.debian.org/tracker/CVE-2026-55895  
                           vim | CVE-2026-55892   | https://security-tracker.debian.org/tracker/CVE-2026-55892  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                       wolfssl | CVE-2026-8720    | https://security-tracker.debian.org/tracker/CVE-2026-8720   
                       wolfssl | CVE-2026-11999   | https://security-tracker.debian.org/tracker/CVE-2026-11999  
                       wolfssl | CVE-2026-11703   | https://security-tracker.debian.org/tracker/CVE-2026-11703  
                       wolfssl | CVE-2026-11310   | https://security-tracker.debian.org/tracker/CVE-2026-11310  
                       wolfssl | CVE-2026-6094    | https://security-tracker.debian.org/tracker/CVE-2026-6094   
                       wolfssl | CVE-2026-6092    | https://security-tracker.debian.org/tracker/CVE-2026-6092   
                       wolfssl | CVE-2026-6091    | https://security-tracker.debian.org/tracker/CVE-2026-6091   
                       wolfssl | CVE-2026-55967   | https://security-tracker.debian.org/tracker/CVE-2026-55967  
                       wolfssl | CVE-2026-55962   | https://security-tracker.debian.org/tracker/CVE-2026-55962  
                       wolfssl | CVE-2026-55964   | https://security-tracker.debian.org/tracker/CVE-2026-55964  
                       wolfssl | CVE-2026-55960   | https://security-tracker.debian.org/tracker/CVE-2026-55960  
                       wolfssl | CVE-2026-55958   | https://security-tracker.debian.org/tracker/CVE-2026-55958  
                       wolfssl | CVE-2026-55961   | https://security-tracker.debian.org/tracker/CVE-2026-55961  
                       wolfssl | CVE-2026-6291    | https://security-tracker.debian.org/tracker/CVE-2026-6291   
                       wolfssl | CVE-2026-6412    | https://security-tracker.debian.org/tracker/CVE-2026-6412   
                       wolfssl | CVE-2026-6450    | https://security-tracker.debian.org/tracker/CVE-2026-6450   
                       wolfssl | CVE-2026-12340   | https://security-tracker.debian.org/tracker/CVE-2026-12340  
                       wolfssl | CVE-2026-6731    | https://security-tracker.debian.org/tracker/CVE-2026-6731   
                       wolfssl | CVE-2026-10592   | https://security-tracker.debian.org/tracker/CVE-2026-10592  
                       wolfssl | CVE-2026-10512   | https://security-tracker.debian.org/tracker/CVE-2026-10512  
                       wolfssl | CVE-2026-7532    | https://security-tracker.debian.org/tracker/CVE-2026-7532   
                       wolfssl | CVE-2026-7511    | https://security-tracker.debian.org/tracker/CVE-2026-7511   
                       wolfssl | CVE-2026-7531    | https://security-tracker.debian.org/tracker/CVE-2026-7531   
                       wolfssl | CVE-2026-10098   | https://security-tracker.debian.org/tracker/CVE-2026-10098  
                       wolfssl | CVE-2026-10097   | https://security-tracker.debian.org/tracker/CVE-2026-10097  
                       wolfssl | CVE-2026-6325    | https://security-tracker.debian.org/tracker/CVE-2026-6325   
                       wolfssl | CVE-2026-6329    | https://security-tracker.debian.org/tracker/CVE-2026-6329   
                       wolfssl | CVE-2026-6330    | https://security-tracker.debian.org/tracker/CVE-2026-6330   
                       wolfssl | CVE-2026-6331    | https://security-tracker.debian.org/tracker/CVE-2026-6331   
                       wolfssl | CVE-2026-6678    | https://security-tracker.debian.org/tracker/CVE-2026-6678   
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
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
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
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
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
                        apache | CVE-2026-43951   | https://security-tracker.debian.org/tracker/CVE-2026-43951  
                        apache | CVE-2026-42535   | https://security-tracker.debian.org/tracker/CVE-2026-42535  
                        apache | CVE-2026-42536   | https://security-tracker.debian.org/tracker/CVE-2026-42536  
                        apache | CVE-2026-48913   | https://security-tracker.debian.org/tracker/CVE-2026-48913  
                        apache | CVE-2026-34355   | https://security-tracker.debian.org/tracker/CVE-2026-34355  
                        apache | CVE-2026-34356   | https://security-tracker.debian.org/tracker/CVE-2026-34356  
                        apache | CVE-2026-49975   | https://security-tracker.debian.org/tracker/CVE-2026-49975  
                        apache | CVE-2026-29170   | https://security-tracker.debian.org/tracker/CVE-2026-29170  
                        apache | CVE-2026-29167   | https://security-tracker.debian.org/tracker/CVE-2026-29167  
                        apache | CVE-2026-44119   | https://security-tracker.debian.org/tracker/CVE-2026-44119  
                        apache | CVE-2026-44186   | https://security-tracker.debian.org/tracker/CVE-2026-44186  
                        apache | CVE-2026-44185   | https://security-tracker.debian.org/tracker/CVE-2026-44185  
                        apache | CVE-2026-44631   | https://security-tracker.debian.org/tracker/CVE-2026-44631  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
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
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
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
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                    containerd | CVE-2026-47262   | https://security-tracker.debian.org/tracker/CVE-2026-47262  
                    containerd | CVE-2026-53488   | https://security-tracker.debian.org/tracker/CVE-2026-53488  
                    containerd | CVE-2026-46680   | https://security-tracker.debian.org/tracker/CVE-2026-46680  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                   cpp-httplib | CVE-2026-45352   | https://security-tracker.debian.org/tracker/CVE-2026-45352  
                   cpp-httplib | CVE-2026-45372   | https://security-tracker.debian.org/tracker/CVE-2026-45372  
                   cpp-httplib | CVE-2026-46527   | https://security-tracker.debian.org/tracker/CVE-2026-46527  
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                  cups-filters | CVE-2025-64503   | https://security-tracker.debian.org/tracker/CVE-2025-64503  
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
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
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
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
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42790   | https://security-tracker.debian.org/tracker/CVE-2026-42790  
                        erlang | CVE-2026-42789   | https://security-tracker.debian.org/tracker/CVE-2026-42789  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                         expat | CVE-2026-56412   | https://security-tracker.debian.org/tracker/CVE-2026-56412  
                         expat | CVE-2026-56406   | https://security-tracker.debian.org/tracker/CVE-2026-56406  
                         expat | CVE-2026-56410   | https://security-tracker.debian.org/tracker/CVE-2026-56410  
                         expat | CVE-2026-56409   | https://security-tracker.debian.org/tracker/CVE-2026-56409  
                         expat | CVE-2026-56403   | https://security-tracker.debian.org/tracker/CVE-2026-56403  
                         expat | CVE-2026-56407   | https://security-tracker.debian.org/tracker/CVE-2026-56407  
                         expat | CVE-2026-56408   | https://security-tracker.debian.org/tracker/CVE-2026-56408  
                         expat | CVE-2026-56404   | https://security-tracker.debian.org/tracker/CVE-2026-56404  
                         expat | CVE-2026-56405   | https://security-tracker.debian.org/tracker/CVE-2026-56405  
                         expat | CVE-2026-56411   | https://security-tracker.debian.org/tracker/CVE-2026-56411  
                         expat | CVE-2026-56131   | https://security-tracker.debian.org/tracker/CVE-2026-56131  
                         expat | CVE-2026-56132   | https://security-tracker.debian.org/tracker/CVE-2026-56132  
                         expat | CVE-2026-50219   | https://security-tracker.debian.org/tracker/CVE-2026-50219  
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
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                    freeswitch | CVE-2026-49847   | https://security-tracker.debian.org/tracker/CVE-2026-49847  
                    freeswitch | CVE-2026-49843   | https://security-tracker.debian.org/tracker/CVE-2026-49843  
                    freeswitch | CVE-2026-49840   | https://security-tracker.debian.org/tracker/CVE-2026-49840  
                    freeswitch | CVE-2026-49841   | https://security-tracker.debian.org/tracker/CVE-2026-49841  
                    freeswitch | CVE-2026-49842   | https://security-tracker.debian.org/tracker/CVE-2026-49842  
                    freeswitch | CVE-2026-49848   | https://security-tracker.debian.org/tracker/CVE-2026-49848  
                    freeswitch | CVE-2026-49472   | https://security-tracker.debian.org/tracker/CVE-2026-49472  
                    freeswitch | CVE-2026-49475   | https://security-tracker.debian.org/tracker/CVE-2026-49475  
                    freeswitch | CVE-2026-45771   | https://security-tracker.debian.org/tracker/CVE-2026-45771  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                           frr | CVE-2026-5107    | https://security-tracker.debian.org/tracker/CVE-2026-5107   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
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
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-55204   | https://security-tracker.debian.org/tracker/CVE-2026-55204  
                       haproxy | CVE-2026-55203   | https://security-tracker.debian.org/tracker/CVE-2026-55203  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                       hostapd | CVE-2026-58374   | https://security-tracker.debian.org/tracker/CVE-2026-58374  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-53463   | https://security-tracker.debian.org/tracker/CVE-2026-53463  
                   imagemagick | CVE-2026-53466   | https://security-tracker.debian.org/tracker/CVE-2026-53466  
                   imagemagick | CVE-2026-53467   | https://security-tracker.debian.org/tracker/CVE-2026-53467  
                   imagemagick | CVE-2026-53461   | https://security-tracker.debian.org/tracker/CVE-2026-53461  
                   imagemagick | CVE-2026-53464   | https://security-tracker.debian.org/tracker/CVE-2026-53464  
                   imagemagick | CVE-2026-53462   | https://security-tracker.debian.org/tracker/CVE-2026-53462  
                   imagemagick | CVE-2026-53465   | https://security-tracker.debian.org/tracker/CVE-2026-53465  
                   imagemagick | CVE-2026-53460   | https://security-tracker.debian.org/tracker/CVE-2026-53460  
                   imagemagick | CVE-2026-56377   | https://security-tracker.debian.org/tracker/CVE-2026-56377  
                   imagemagick | CVE-2026-48994   | https://security-tracker.debian.org/tracker/CVE-2026-48994  
                   imagemagick | CVE-2026-48724   | https://security-tracker.debian.org/tracker/CVE-2026-48724  
                   imagemagick | CVE-2026-48734   | https://security-tracker.debian.org/tracker/CVE-2026-48734  
                   imagemagick | CVE-2026-48733   | https://security-tracker.debian.org/tracker/CVE-2026-48733  
                   imagemagick | CVE-2026-49218   | https://security-tracker.debian.org/tracker/CVE-2026-49218  
                   imagemagick | CVE-2026-49219   | https://security-tracker.debian.org/tracker/CVE-2026-49219  
                   imagemagick | CVE-2026-55595   | https://security-tracker.debian.org/tracker/CVE-2026-55595  
                   imagemagick | CVE-2026-55577   | https://security-tracker.debian.org/tracker/CVE-2026-55577  
                   imagemagick | CVE-2026-55594   | https://security-tracker.debian.org/tracker/CVE-2026-55594  
                   imagemagick | CVE-2026-55597   | https://security-tracker.debian.org/tracker/CVE-2026-55597  
                   imagemagick | CVE-2026-55510   | https://security-tracker.debian.org/tracker/CVE-2026-55510  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-49839   | https://security-tracker.debian.org/tracker/CVE-2026-49839  
                            jq | CVE-2026-41257   | https://security-tracker.debian.org/tracker/CVE-2026-41257  
                            jq | CVE-2026-41256   | https://security-tracker.debian.org/tracker/CVE-2026-41256  
                            jq | CVE-2026-33947   | https://security-tracker.debian.org/tracker/CVE-2026-33947  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-43896   | https://security-tracker.debian.org/tracker/CVE-2026-43896  
                            jq | CVE-2026-43894   | https://security-tracker.debian.org/tracker/CVE-2026-43894  
                            jq | CVE-2026-32316   | https://security-tracker.debian.org/tracker/CVE-2026-32316  
                            jq | CVE-2026-40612   | https://security-tracker.debian.org/tracker/CVE-2026-40612  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                            jq | CVE-2026-47770   | https://security-tracker.debian.org/tracker/CVE-2026-47770  
                            jq | CVE-2026-54679   | https://security-tracker.debian.org/tracker/CVE-2026-54679  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                      libfuse3 | CVE-2026-33150   | https://security-tracker.debian.org/tracker/CVE-2026-33150  
                      libfuse3 | CVE-2026-33179   | https://security-tracker.debian.org/tracker/CVE-2026-33179  
                     libgcrypt | CVE-2026-41989   | https://security-tracker.debian.org/tracker/CVE-2026-41989  
                     libgcrypt | CVE-2026-41990   | https://security-tracker.debian.org/tracker/CVE-2026-41990  
                      libglib2 | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
                      libglib2 | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
                      libglib2 | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
                      libglib2 | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
            libglib2-bootstrap | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
            libglib2-bootstrap | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
            libglib2-bootstrap | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
            libglib2-bootstrap | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libinput | CVE-2026-50292   | https://security-tracker.debian.org/tracker/CVE-2026-50292  
                       libldns | CVE-2026-10846   | https://security-tracker.debian.org/tracker/CVE-2026-10846  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                    libopenssl | CVE-2026-45447   | https://security-tracker.debian.org/tracker/CVE-2026-45447  
                    libopenssl | CVE-2026-45446   | https://security-tracker.debian.org/tracker/CVE-2026-45446  
                    libopenssl | CVE-2026-45445   | https://security-tracker.debian.org/tracker/CVE-2026-45445  
                    libopenssl | CVE-2026-42769   | https://security-tracker.debian.org/tracker/CVE-2026-42769  
                    libopenssl | CVE-2026-42767   | https://security-tracker.debian.org/tracker/CVE-2026-42767  
                    libopenssl | CVE-2026-42768   | https://security-tracker.debian.org/tracker/CVE-2026-42768  
                    libopenssl | CVE-2026-42764   | https://security-tracker.debian.org/tracker/CVE-2026-42764  
                    libopenssl | CVE-2026-42766   | https://security-tracker.debian.org/tracker/CVE-2026-42766  
                    libopenssl | CVE-2026-42765   | https://security-tracker.debian.org/tracker/CVE-2026-42765  
                    libopenssl | CVE-2026-42770   | https://security-tracker.debian.org/tracker/CVE-2026-42770  
                    libopenssl | CVE-2026-35188   | https://security-tracker.debian.org/tracker/CVE-2026-35188  
                    libopenssl | CVE-2026-9076    | https://security-tracker.debian.org/tracker/CVE-2026-9076   
                    libopenssl | CVE-2026-34183   | https://security-tracker.debian.org/tracker/CVE-2026-34183  
                    libopenssl | CVE-2026-34181   | https://security-tracker.debian.org/tracker/CVE-2026-34181  
                    libopenssl | CVE-2026-34180   | https://security-tracker.debian.org/tracker/CVE-2026-34180  
                    libopenssl | CVE-2026-34182   | https://security-tracker.debian.org/tracker/CVE-2026-34182  
                    libopenssl | CVE-2026-7383    | https://security-tracker.debian.org/tracker/CVE-2026-7383   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2025-15661   | https://security-tracker.debian.org/tracker/CVE-2025-15661  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                       libssh2 | CVE-2026-55200   | https://security-tracker.debian.org/tracker/CVE-2026-55200  
                       libssh2 | CVE-2026-55199   | https://security-tracker.debian.org/tracker/CVE-2026-55199  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       libxml2 | CVE-2026-11979   | https://security-tracker.debian.org/tracker/CVE-2026-11979  
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-33298   | https://security-tracker.debian.org/tracker/CVE-2026-33298  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mariadb | CVE-2026-49261   | https://security-tracker.debian.org/tracker/CVE-2026-49261  
                       mariadb | CVE-2026-48165   | https://security-tracker.debian.org/tracker/CVE-2026-48165  
                       mariadb | CVE-2026-48163   | https://security-tracker.debian.org/tracker/CVE-2026-48163  
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                      mongoose | CVE-2026-6986    | https://security-tracker.debian.org/tracker/CVE-2026-6986   
                      mongoose | CVE-2026-6985    | https://security-tracker.debian.org/tracker/CVE-2026-6985   
                      mongoose | CVE-2026-2966    | https://security-tracker.debian.org/tracker/CVE-2026-2966   
                      mongoose | CVE-2026-2967    | https://security-tracker.debian.org/tracker/CVE-2026-2967   
                      mongoose | CVE-2026-2968    | https://security-tracker.debian.org/tracker/CVE-2026-2968   
                      mongoose | CVE-2026-5244    | https://security-tracker.debian.org/tracker/CVE-2026-5244   
                      mongoose | CVE-2026-5245    | https://security-tracker.debian.org/tracker/CVE-2026-5245   
                      mongoose | CVE-2026-5246    | https://security-tracker.debian.org/tracker/CVE-2026-5246   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nano | CVE-2026-6843    | https://security-tracker.debian.org/tracker/CVE-2026-6843   
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
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
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       proftpd | CVE-2026-35025   | https://security-tracker.debian.org/tracker/CVE-2026-35025  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-39892   | https://security-tracker.debian.org/tracker/CVE-2026-39892  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-django | CVE-2026-48587   | https://security-tracker.debian.org/tracker/CVE-2026-48587  
                 python-django | CVE-2026-6873    | https://security-tracker.debian.org/tracker/CVE-2026-6873   
                 python-django | CVE-2026-8404    | https://security-tracker.debian.org/tracker/CVE-2026-8404   
                 python-django | CVE-2026-35193   | https://security-tracker.debian.org/tracker/CVE-2026-35193  
                 python-django | CVE-2026-7666    | https://security-tracker.debian.org/tracker/CVE-2026-7666   
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
              python-starlette | CVE-2026-48818   | https://security-tracker.debian.org/tracker/CVE-2026-48818  
              python-starlette | CVE-2026-48817   | https://security-tracker.debian.org/tracker/CVE-2026-48817  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
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
                       quickjs | CVE-2025-69653   | https://security-tracker.debian.org/tracker/CVE-2025-69653  
                       quickjs | CVE-2025-69654   | https://security-tracker.debian.org/tracker/CVE-2025-69654  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                         redis | CVE-2026-23479   | https://security-tracker.debian.org/tracker/CVE-2026-23479  
                         redis | CVE-2026-25243   | https://security-tracker.debian.org/tracker/CVE-2026-25243  
                         redis | CVE-2026-23631   | https://security-tracker.debian.org/tracker/CVE-2026-23631  
                          ruby | CVE-2026-46727   | https://security-tracker.debian.org/tracker/CVE-2026-46727  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
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
                         socat | CVE-2026-56123   | https://security-tracker.debian.org/tracker/CVE-2026-56123  
                        sqlite | CVE-2026-11822   | https://security-tracker.debian.org/tracker/CVE-2026-11822  
                        sqlite | CVE-2026-11824   | https://security-tracker.debian.org/tracker/CVE-2026-11824  
                          sudo | CVE-2026-35535   | https://security-tracker.debian.org/tracker/CVE-2026-35535  
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
                      swupdate | CVE-2026-28525   | https://security-tracker.debian.org/tracker/CVE-2026-28525  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2026-33243   | https://security-tracker.debian.org/tracker/CVE-2026-33243  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-55693   | https://security-tracker.debian.org/tracker/CVE-2026-55693  
                           vim | CVE-2026-52860   | https://security-tracker.debian.org/tracker/CVE-2026-52860  
                           vim | CVE-2026-52858   | https://security-tracker.debian.org/tracker/CVE-2026-52858  
                           vim | CVE-2026-52859   | https://security-tracker.debian.org/tracker/CVE-2026-52859  
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-57456   | https://security-tracker.debian.org/tracker/CVE-2026-57456  
                           vim | CVE-2026-57451   | https://security-tracker.debian.org/tracker/CVE-2026-57451  
                           vim | CVE-2026-57453   | https://security-tracker.debian.org/tracker/CVE-2026-57453  
                           vim | CVE-2026-57452   | https://security-tracker.debian.org/tracker/CVE-2026-57452  
                           vim | CVE-2026-57455   | https://security-tracker.debian.org/tracker/CVE-2026-57455  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-47167   | https://security-tracker.debian.org/tracker/CVE-2026-47167  
                           vim | CVE-2026-47162   | https://security-tracker.debian.org/tracker/CVE-2026-47162  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-55895   | https://security-tracker.debian.org/tracker/CVE-2026-55895  
                           vim | CVE-2026-55892   | https://security-tracker.debian.org/tracker/CVE-2026-55892  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                     wireshark | CVE-2026-9759    | https://security-tracker.debian.org/tracker/CVE-2026-9759   
                       wolfssl | CVE-2026-8720    | https://security-tracker.debian.org/tracker/CVE-2026-8720   
                       wolfssl | CVE-2026-11999   | https://security-tracker.debian.org/tracker/CVE-2026-11999  
                       wolfssl | CVE-2026-11703   | https://security-tracker.debian.org/tracker/CVE-2026-11703  
                       wolfssl | CVE-2026-11310   | https://security-tracker.debian.org/tracker/CVE-2026-11310  
                       wolfssl | CVE-2026-6094    | https://security-tracker.debian.org/tracker/CVE-2026-6094   
                       wolfssl | CVE-2026-6092    | https://security-tracker.debian.org/tracker/CVE-2026-6092   
                       wolfssl | CVE-2026-6091    | https://security-tracker.debian.org/tracker/CVE-2026-6091   
                       wolfssl | CVE-2026-55967   | https://security-tracker.debian.org/tracker/CVE-2026-55967  
                       wolfssl | CVE-2026-55962   | https://security-tracker.debian.org/tracker/CVE-2026-55962  
                       wolfssl | CVE-2026-55964   | https://security-tracker.debian.org/tracker/CVE-2026-55964  
                       wolfssl | CVE-2026-55960   | https://security-tracker.debian.org/tracker/CVE-2026-55960  
                       wolfssl | CVE-2026-55958   | https://security-tracker.debian.org/tracker/CVE-2026-55958  
                       wolfssl | CVE-2026-55961   | https://security-tracker.debian.org/tracker/CVE-2026-55961  
                       wolfssl | CVE-2026-6291    | https://security-tracker.debian.org/tracker/CVE-2026-6291   
                       wolfssl | CVE-2026-6412    | https://security-tracker.debian.org/tracker/CVE-2026-6412   
                       wolfssl | CVE-2026-6450    | https://security-tracker.debian.org/tracker/CVE-2026-6450   
                       wolfssl | CVE-2026-12340   | https://security-tracker.debian.org/tracker/CVE-2026-12340  
                       wolfssl | CVE-2026-6731    | https://security-tracker.debian.org/tracker/CVE-2026-6731   
                       wolfssl | CVE-2026-10592   | https://security-tracker.debian.org/tracker/CVE-2026-10592  
                       wolfssl | CVE-2026-10512   | https://security-tracker.debian.org/tracker/CVE-2026-10512  
                       wolfssl | CVE-2026-7532    | https://security-tracker.debian.org/tracker/CVE-2026-7532   
                       wolfssl | CVE-2026-7511    | https://security-tracker.debian.org/tracker/CVE-2026-7511   
                       wolfssl | CVE-2026-7531    | https://security-tracker.debian.org/tracker/CVE-2026-7531   
                       wolfssl | CVE-2026-10098   | https://security-tracker.debian.org/tracker/CVE-2026-10098  
                       wolfssl | CVE-2026-10097   | https://security-tracker.debian.org/tracker/CVE-2026-10097  
                       wolfssl | CVE-2026-6325    | https://security-tracker.debian.org/tracker/CVE-2026-6325   
                       wolfssl | CVE-2026-6329    | https://security-tracker.debian.org/tracker/CVE-2026-6329   
                       wolfssl | CVE-2026-6330    | https://security-tracker.debian.org/tracker/CVE-2026-6330   
                       wolfssl | CVE-2026-6331    | https://security-tracker.debian.org/tracker/CVE-2026-6331   
                       wolfssl | CVE-2026-6678    | https://security-tracker.debian.org/tracker/CVE-2026-6678   
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
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
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
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
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
           binutils-bare-metal | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
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
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                      bpftrace | CVE-2024-2313    | https://security-tracker.debian.org/tracker/CVE-2024-2313   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                    containerd | CVE-2026-47262   | https://security-tracker.debian.org/tracker/CVE-2026-47262  
                    containerd | CVE-2026-53488   | https://security-tracker.debian.org/tracker/CVE-2026-53488  
                    containerd | CVE-2026-46680   | https://security-tracker.debian.org/tracker/CVE-2026-46680  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                  cups-filters | CVE-2025-64503   | https://security-tracker.debian.org/tracker/CVE-2025-64503  
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
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
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
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
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42790   | https://security-tracker.debian.org/tracker/CVE-2026-42790  
                        erlang | CVE-2026-42789   | https://security-tracker.debian.org/tracker/CVE-2026-42789  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
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
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                    freeswitch | CVE-2026-49847   | https://security-tracker.debian.org/tracker/CVE-2026-49847  
                    freeswitch | CVE-2026-49843   | https://security-tracker.debian.org/tracker/CVE-2026-49843  
                    freeswitch | CVE-2026-49840   | https://security-tracker.debian.org/tracker/CVE-2026-49840  
                    freeswitch | CVE-2026-49841   | https://security-tracker.debian.org/tracker/CVE-2026-49841  
                    freeswitch | CVE-2026-49842   | https://security-tracker.debian.org/tracker/CVE-2026-49842  
                    freeswitch | CVE-2026-49848   | https://security-tracker.debian.org/tracker/CVE-2026-49848  
                    freeswitch | CVE-2026-49472   | https://security-tracker.debian.org/tracker/CVE-2026-49472  
                    freeswitch | CVE-2026-49475   | https://security-tracker.debian.org/tracker/CVE-2026-49475  
                    freeswitch | CVE-2026-45771   | https://security-tracker.debian.org/tracker/CVE-2026-45771  
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
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                        giflib | CVE-2026-26740   | https://security-tracker.debian.org/tracker/CVE-2026-26740  
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
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-55204   | https://security-tracker.debian.org/tracker/CVE-2026-55204  
                       haproxy | CVE-2026-55203   | https://security-tracker.debian.org/tracker/CVE-2026-55203  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                      harfbuzz | CVE-2026-22693   | https://security-tracker.debian.org/tracker/CVE-2026-22693  
                       hostapd | CVE-2026-58374   | https://security-tracker.debian.org/tracker/CVE-2026-58374  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                           icu | CVE-2025-5222    | https://security-tracker.debian.org/tracker/CVE-2025-5222   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-53463   | https://security-tracker.debian.org/tracker/CVE-2026-53463  
                   imagemagick | CVE-2026-53466   | https://security-tracker.debian.org/tracker/CVE-2026-53466  
                   imagemagick | CVE-2026-53467   | https://security-tracker.debian.org/tracker/CVE-2026-53467  
                   imagemagick | CVE-2026-53461   | https://security-tracker.debian.org/tracker/CVE-2026-53461  
                   imagemagick | CVE-2026-53464   | https://security-tracker.debian.org/tracker/CVE-2026-53464  
                   imagemagick | CVE-2026-53462   | https://security-tracker.debian.org/tracker/CVE-2026-53462  
                   imagemagick | CVE-2026-53465   | https://security-tracker.debian.org/tracker/CVE-2026-53465  
                   imagemagick | CVE-2026-53460   | https://security-tracker.debian.org/tracker/CVE-2026-53460  
                   imagemagick | CVE-2026-56377   | https://security-tracker.debian.org/tracker/CVE-2026-56377  
                   imagemagick | CVE-2026-48994   | https://security-tracker.debian.org/tracker/CVE-2026-48994  
                   imagemagick | CVE-2026-48724   | https://security-tracker.debian.org/tracker/CVE-2026-48724  
                   imagemagick | CVE-2026-48734   | https://security-tracker.debian.org/tracker/CVE-2026-48734  
                   imagemagick | CVE-2026-48733   | https://security-tracker.debian.org/tracker/CVE-2026-48733  
                   imagemagick | CVE-2026-49218   | https://security-tracker.debian.org/tracker/CVE-2026-49218  
                   imagemagick | CVE-2026-49219   | https://security-tracker.debian.org/tracker/CVE-2026-49219  
                   imagemagick | CVE-2026-55595   | https://security-tracker.debian.org/tracker/CVE-2026-55595  
                   imagemagick | CVE-2026-55577   | https://security-tracker.debian.org/tracker/CVE-2026-55577  
                   imagemagick | CVE-2026-55594   | https://security-tracker.debian.org/tracker/CVE-2026-55594  
                   imagemagick | CVE-2026-55597   | https://security-tracker.debian.org/tracker/CVE-2026-55597  
                   imagemagick | CVE-2026-55510   | https://security-tracker.debian.org/tracker/CVE-2026-55510  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-49839   | https://security-tracker.debian.org/tracker/CVE-2026-49839  
                            jq | CVE-2026-41257   | https://security-tracker.debian.org/tracker/CVE-2026-41257  
                            jq | CVE-2026-41256   | https://security-tracker.debian.org/tracker/CVE-2026-41256  
                            jq | CVE-2026-33947   | https://security-tracker.debian.org/tracker/CVE-2026-33947  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-43896   | https://security-tracker.debian.org/tracker/CVE-2026-43896  
                            jq | CVE-2026-43894   | https://security-tracker.debian.org/tracker/CVE-2026-43894  
                            jq | CVE-2026-32316   | https://security-tracker.debian.org/tracker/CVE-2026-32316  
                            jq | CVE-2026-40612   | https://security-tracker.debian.org/tracker/CVE-2026-40612  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                            jq | CVE-2026-47770   | https://security-tracker.debian.org/tracker/CVE-2026-47770  
                            jq | CVE-2026-54679   | https://security-tracker.debian.org/tracker/CVE-2026-54679  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libbson | CVE-2024-6381    | https://security-tracker.debian.org/tracker/CVE-2024-6381   
                       libbson | CVE-2025-0755    | https://security-tracker.debian.org/tracker/CVE-2025-0755   
                       libcdio | CVE-2024-36600   | https://security-tracker.debian.org/tracker/CVE-2024-36600  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
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
                      libglib2 | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
                      libglib2 | CVE-2026-58012   | https://security-tracker.debian.org/tracker/CVE-2026-58012  
                      libglib2 | CVE-2026-58011   | https://security-tracker.debian.org/tracker/CVE-2026-58011  
                      libglib2 | CVE-2026-58010   | https://security-tracker.debian.org/tracker/CVE-2026-58010  
                      libglib2 | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
                      libglib2 | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
                      libglib2 | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
                      libglib2 | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
            libglib2-bootstrap | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
            libglib2-bootstrap | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
            libglib2-bootstrap | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
            libglib2-bootstrap | CVE-2026-58012   | https://security-tracker.debian.org/tracker/CVE-2026-58012  
            libglib2-bootstrap | CVE-2026-58011   | https://security-tracker.debian.org/tracker/CVE-2026-58011  
            libglib2-bootstrap | CVE-2026-58010   | https://security-tracker.debian.org/tracker/CVE-2026-58010  
            libglib2-bootstrap | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
            libglib2-bootstrap | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
            libglib2-bootstrap | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
            libglib2-bootstrap | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                       libldns | CVE-2026-10846   | https://security-tracker.debian.org/tracker/CVE-2026-10846  
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
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2025-15661   | https://security-tracker.debian.org/tracker/CVE-2025-15661  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                       libssh2 | CVE-2026-55200   | https://security-tracker.debian.org/tracker/CVE-2026-55200  
                       libssh2 | CVE-2026-55199   | https://security-tracker.debian.org/tracker/CVE-2026-55199  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       libxml2 | CVE-2026-11979   | https://security-tracker.debian.org/tracker/CVE-2026-11979  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mariadb | CVE-2026-49261   | https://security-tracker.debian.org/tracker/CVE-2026-49261  
                       mariadb | CVE-2026-48165   | https://security-tracker.debian.org/tracker/CVE-2026-48165  
                       mariadb | CVE-2026-48163   | https://security-tracker.debian.org/tracker/CVE-2026-48163  
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                mesa3d-headers | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
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
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                       proftpd | CVE-2026-35025   | https://security-tracker.debian.org/tracker/CVE-2026-35025  
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
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
              python-starlette | CVE-2026-48818   | https://security-tracker.debian.org/tracker/CVE-2026-48818  
              python-starlette | CVE-2026-48817   | https://security-tracker.debian.org/tracker/CVE-2026-48817  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-tornado | CVE-2026-35536   | https://security-tracker.debian.org/tracker/CVE-2026-35536  
                python-tornado | CVE-2026-31958   | https://security-tracker.debian.org/tracker/CVE-2026-31958  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
               python-werkzeug | CVE-2025-66221   | https://security-tracker.debian.org/tracker/CVE-2025-66221  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2025-13837   | https://security-tracker.debian.org/tracker/CVE-2025-13837  
                       python3 | CVE-2025-12781   | https://security-tracker.debian.org/tracker/CVE-2025-12781  
                       python3 | CVE-2025-13462   | https://security-tracker.debian.org/tracker/CVE-2025-13462  
                       python3 | CVE-2025-12084   | https://security-tracker.debian.org/tracker/CVE-2025-12084  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
                       python3 | CVE-2026-3644    | https://security-tracker.debian.org/tracker/CVE-2026-3644   
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
                       quickjs | CVE-2025-69653   | https://security-tracker.debian.org/tracker/CVE-2025-69653  
                       quickjs | CVE-2025-69654   | https://security-tracker.debian.org/tracker/CVE-2025-69654  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                         redis | CVE-2026-23479   | https://security-tracker.debian.org/tracker/CVE-2026-23479  
                         redis | CVE-2026-25243   | https://security-tracker.debian.org/tracker/CVE-2026-25243  
                         redis | CVE-2026-23631   | https://security-tracker.debian.org/tracker/CVE-2026-23631  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
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
                         socat | CVE-2026-56123   | https://security-tracker.debian.org/tracker/CVE-2026-56123  
                        sqlite | CVE-2026-11822   | https://security-tracker.debian.org/tracker/CVE-2026-11822  
                        sqlite | CVE-2026-11824   | https://security-tracker.debian.org/tracker/CVE-2026-11824  
                         squid | CVE-2026-32748   | https://security-tracker.debian.org/tracker/CVE-2026-32748  
                          sudo | CVE-2026-35535   | https://security-tracker.debian.org/tracker/CVE-2026-35535  
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
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
               util-linux-libs | CVE-2026-27456   | https://security-tracker.debian.org/tracker/CVE-2026-27456  
                           vim | CVE-2026-55693   | https://security-tracker.debian.org/tracker/CVE-2026-55693  
                           vim | CVE-2026-52860   | https://security-tracker.debian.org/tracker/CVE-2026-52860  
                           vim | CVE-2026-52858   | https://security-tracker.debian.org/tracker/CVE-2026-52858  
                           vim | CVE-2026-52859   | https://security-tracker.debian.org/tracker/CVE-2026-52859  
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-57456   | https://security-tracker.debian.org/tracker/CVE-2026-57456  
                           vim | CVE-2026-57451   | https://security-tracker.debian.org/tracker/CVE-2026-57451  
                           vim | CVE-2026-57453   | https://security-tracker.debian.org/tracker/CVE-2026-57453  
                           vim | CVE-2026-57452   | https://security-tracker.debian.org/tracker/CVE-2026-57452  
                           vim | CVE-2026-57455   | https://security-tracker.debian.org/tracker/CVE-2026-57455  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-47167   | https://security-tracker.debian.org/tracker/CVE-2026-47167  
                           vim | CVE-2026-47162   | https://security-tracker.debian.org/tracker/CVE-2026-47162  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-55895   | https://security-tracker.debian.org/tracker/CVE-2026-55895  
                           vim | CVE-2026-55892   | https://security-tracker.debian.org/tracker/CVE-2026-55892  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                     wireshark | CVE-2026-0962    | https://security-tracker.debian.org/tracker/CVE-2026-0962   
                       wolfssl | CVE-2026-8720    | https://security-tracker.debian.org/tracker/CVE-2026-8720   
                       wolfssl | CVE-2026-11999   | https://security-tracker.debian.org/tracker/CVE-2026-11999  
                       wolfssl | CVE-2026-11703   | https://security-tracker.debian.org/tracker/CVE-2026-11703  
                       wolfssl | CVE-2026-11310   | https://security-tracker.debian.org/tracker/CVE-2026-11310  
                       wolfssl | CVE-2026-6094    | https://security-tracker.debian.org/tracker/CVE-2026-6094   
                       wolfssl | CVE-2026-6092    | https://security-tracker.debian.org/tracker/CVE-2026-6092   
                       wolfssl | CVE-2026-6091    | https://security-tracker.debian.org/tracker/CVE-2026-6091   
                       wolfssl | CVE-2026-55967   | https://security-tracker.debian.org/tracker/CVE-2026-55967  
                       wolfssl | CVE-2026-55962   | https://security-tracker.debian.org/tracker/CVE-2026-55962  
                       wolfssl | CVE-2026-55964   | https://security-tracker.debian.org/tracker/CVE-2026-55964  
                       wolfssl | CVE-2026-55960   | https://security-tracker.debian.org/tracker/CVE-2026-55960  
                       wolfssl | CVE-2026-55958   | https://security-tracker.debian.org/tracker/CVE-2026-55958  
                       wolfssl | CVE-2026-55961   | https://security-tracker.debian.org/tracker/CVE-2026-55961  
                       wolfssl | CVE-2026-6291    | https://security-tracker.debian.org/tracker/CVE-2026-6291   
                       wolfssl | CVE-2026-6412    | https://security-tracker.debian.org/tracker/CVE-2026-6412   
                       wolfssl | CVE-2026-6450    | https://security-tracker.debian.org/tracker/CVE-2026-6450   
                       wolfssl | CVE-2026-12340   | https://security-tracker.debian.org/tracker/CVE-2026-12340  
                       wolfssl | CVE-2026-6731    | https://security-tracker.debian.org/tracker/CVE-2026-6731   
                       wolfssl | CVE-2026-10592   | https://security-tracker.debian.org/tracker/CVE-2026-10592  
                       wolfssl | CVE-2026-10512   | https://security-tracker.debian.org/tracker/CVE-2026-10512  
                       wolfssl | CVE-2026-7532    | https://security-tracker.debian.org/tracker/CVE-2026-7532   
                       wolfssl | CVE-2026-7511    | https://security-tracker.debian.org/tracker/CVE-2026-7511   
                       wolfssl | CVE-2026-7531    | https://security-tracker.debian.org/tracker/CVE-2026-7531   
                       wolfssl | CVE-2026-10098   | https://security-tracker.debian.org/tracker/CVE-2026-10098  
                       wolfssl | CVE-2026-10097   | https://security-tracker.debian.org/tracker/CVE-2026-10097  
                       wolfssl | CVE-2026-6325    | https://security-tracker.debian.org/tracker/CVE-2026-6325   
                       wolfssl | CVE-2026-6329    | https://security-tracker.debian.org/tracker/CVE-2026-6329   
                       wolfssl | CVE-2026-6330    | https://security-tracker.debian.org/tracker/CVE-2026-6330   
                       wolfssl | CVE-2026-6331    | https://security-tracker.debian.org/tracker/CVE-2026-6331   
                       wolfssl | CVE-2026-6678    | https://security-tracker.debian.org/tracker/CVE-2026-6678   
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
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
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
