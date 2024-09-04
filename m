Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130E3CD4845
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 03:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDE9180FEF;
	Wed,  4 Sep 2024 03:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmjDpecaWI4d; Wed,  4 Sep 2024 03:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BA7380F75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA7380F75;
	Wed,  4 Sep 2024 03:17:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB9611BF573
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 03:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC8B64012B
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 03:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-RBzM8pNHDb for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 03:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46361400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46361400AF
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46361400AF
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 03:17:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-374c5bab490so138175f8f.1
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 20:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725419829; x=1726024629;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vz7y84bFouDXWRz4jSR1wSGOnxtipXYpnoPvt0/3RPs=;
 b=qN5gzfvYleiS+u9/aqJgwduXPPlTDxeuEiiQSoVFV/zQUMVnkSVEsYU+5mPyFsTCMp
 cbyJXoCnQykd1uMKIgHJlf1CyQnWQWrwuUU34ornjeTP665QgRpaJ6CsqxtI75TDqSdd
 TFoeKG++maNkgJIizUxGUqthGg5CPbyAiex625gV9yHSV4b1bqcoxJwa6efUWXeo1m1p
 pQtXALmNgOW4urPVP258mxbn9XNqAGYaOWWRlUDP98r9+jeFr3AeI8bOA2vOhlLE1Ck/
 qpw2YpJGcGgRqr3HaF9hXSFpGw9LV4mjVpu96CjZhJU5w8T/7eNNQ4bsfPge/lZlOZTk
 1Yog==
X-Gm-Message-State: AOJu0YxtkKPCy5A8tbazt86ZXPjJ8Id7xhfwFfYtNQlh9WODhlvgOU58
 iT3d62nqfEgb0709g1Ku3Y5DDqlQgrXHDll9Eme64c5+ZeLOoELS13MpRw==
X-Google-Smtp-Source: AGHT+IF6yNxrfUkujRcyPBKmWAtXpwpfoBmRm2jyfSKAqRfHp0BZn80GJt456JfQjtH/cPyUpi5grg==
X-Received: by 2002:a5d:4801:0:b0:374:c878:21f7 with SMTP id
 ffacd0b85a97d-37799f5e676mr233228f8f.10.1725419828756; 
 Tue, 03 Sep 2024 20:17:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba6425811sm227936515e9.40.2024.09.03.20.17.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 20:17:08 -0700 (PDT)
Message-ID: <66d7d134.050a0220.be642.defd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 04 Sep 2024 03:17:08 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725419829; x=1726024629; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vz7y84bFouDXWRz4jSR1wSGOnxtipXYpnoPvt0/3RPs=;
 b=MICXsCjdznzjLjngB93g40fePtAblbAcvlkjgNQ2WHF7m6osvjflhHc+AHDSJsMgOw
 YGt9sGf9GTwkP6bgw/MCutLj1J/QgQ15jnmQ9p6CKsT694Ww7XzNCQOr3SiOTw3HRBL+
 IZiTn/lCSJ9kB+b93fVer5Nxu071DhoD6ljrXia8dv16h1MA+8iJSlUUiQd7iLIKaDOj
 8VN2wFOrt/IYff/DkTqO1tYOA9fFl9z5QSXTt/yLgkzLD7GOQVozBDJopcfe9DasewI2
 LFCBv2zcls794WyUY+5LB9N8UVPwce3mgeZ2s9OnKb/VmtUY/raXTieqyXyFTyyr8H4S
 SlCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MICXsCjd
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-03
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

Autobuild statistics for 2024-09-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 12  |  8  |  0  | 20  |
  2024.05.x  |  3  | 20  |  0  | 23  |
    master   | 21  | 248 | 12  | 281 |
     next    |  5  | 13  |  0  | 18  |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 25
                  linux-6.10.7 | 20
         gobject-introspection | 12
          cryptodev-linux-1.13 | 9 
glibc-2.39-74-g198632a05f6c... | 9 
aubio-152d6819b360c2e7b379e... | 8 
                  ffmpeg-6.1.2 | 7 
  gobject-introspection-1.76.1 | 7 
android-tools-4.2.2+git2013... | 6 
     linux-5.10.162-cip24-rt10 | 6 
                   duma-2.5.21 | 5 
           host-librsvg-2.50.9 | 5 
               ipmitool-1_8_19 | 5 
                  libsepol-3.6 | 5 
            linux-fusion-9.0.3 | 5 
                  ntp-4.2.8p18 | 5 
             armadillo-9.900.2 | 4 
                directfb-1.7.7 | 4 
             host-delve-1.22.1 | 4 
          linux-5.10.162-cip24 | 4 
                       unknown | 4 
                  cairo-1.18.0 | 3 
          cloudflared-2024.6.1 | 3 
                elfutils-0.189 | 3 
                     file-5.45 | 3 
                 gnuplot-6.0.1 | 3 
         host-libxcrypt-4.4.36 | 3 
                   httping-2.5 | 3 
              libopenssl-3.3.1 | 3 
                  libva-2.22.0 | 3 
               linux-pam-1.6.1 | 3 
               mariadb-10.11.6 | 3 
                xenomai-3.0.10 | 3 
                 apache-2.4.62 | 2 
  binutils-arc-2023.09-release | 2 
                    bsdiff-4.3 | 2 
check-11970a7e112dfe243a2e6... | 2 
                 coreutils-9.3 | 2 
                      fbv-1.0b | 2 
           host-doxygen-1.8.18 | 2 
                   lsuio-0.2.0 | 2 
                 openssh-9.8p1 | 2 
               postgresql-16.4 | 2 
                python3-3.12.5 | 2 
                  tllist-1.1.0 | 2 
               valgrind-3.23.0 | 2 
abootimg-1ebeb393252ab5aeed... | 1 
                  acpid-2.0.34 | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
                  babeld-1.9.2 | 1 
             batman-adv-2023.1 | 1 
             berkeleydb-5.3.28 | 1 
                  bitcoin-26.2 | 1 
                   bzip2-1.0.8 | 1 
              cache-calibrator | 1 
                      ell-0.65 | 1 
                      fd-9.0.0 | 1 
              fluent-bit-3.1.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
               graphene-1.10.8 | 1 
             gstreamer1-1.22.9 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
           host-cryptopp-8.9.0 | 1 
          host-elf2flt-2024.05 | 1 
              host-rust-1.79.0 | 1 
 host-softether-4.30-9700-beta | 1 
                latencytop-0.5 | 1 
      libabseil-cpp-20230802.1 | 1 
                libdrm-2.4.122 | 1 
                liblinear-2.45 | 1 
             libopenh264-2.4.0 | 1 
            libsvg-cairo-0.1.6 | 1 
               lighttpd-1.4.76 | 1 
               openblas-0.3.27 | 1 
                   p910nd-0.97 | 1 
                   pcre2-10.43 | 1 
      python-autocommand-2.2.2 | 1 
rtl8189fs-9a82349c2c40515f9... | 1 
                tinifier-3.4.0 | 1 
                 uclibc-1.0.50 | 1 
                  whois-5.5.14 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                zerofree-1.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | abootimg-1ebeb393252ab5aeed... | NOK | http://autobuild.buildroot.org/results/0520fa7aa55415b5eb69f2df751f6ddcfbfe6bb7 |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/ef2279492407392a0c9a958b474d04461488e63e | ORPH
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/dcf4eaf23f71b0e4a14097a904b1e19235e05d43 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/dc281adf108b7b07cd8470bbaf0b8cca1c9b4d83 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/a92495242dad1306c2759e670ef02b8d4dae0121 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/e6e3c7dec98c16367ee89c62a37f3993349e9b47 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/7beaacd9d5f62399d56659e094225df0687473dc |     
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/b0284cad575454138f0a38e8713674026e1e7a87 |     
powerpc64le  |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/c5212d205f01602c830e384ba68738eee52c9cdd |     
  mips64el   |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/4887575e261ba9f721584db3321d3e4b28ff6583 |     
  sparc64    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/bdfd80a42ef0186f14c16d2ec8844c6d51f0ff1d |     
    i586     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/04f26fb3471dff66e77dab08ed165a10dbf64a5e |     
  riscv64    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/fa5e591377f2819437466ff4958fc0be7dfdf277 |     
   mipsel    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/9980d0c97e639a822573d8971332ba5a6fc85e87 |     
   nios2     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.org/results/a3fcf784f21095ae3a3e9bda223eb31bd4298890 | ORPH
    arc      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/22ae900a8fae5b4d34d99076cd3547ea1cec1fe9 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/8b82f0da623e90a84ad89133c8c3ea90eb353917 |     
   sh4aeb    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/52e0aa1b05024541b3363fc06c8a95c370c35e7e |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/cb82f860f035f58987bf0465f74857f5ff22fbac |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/368e5e944304ef33a6835b82504bb5e5e562db7d |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a3b34c7e5b0cd658a97ffe59818e95b56fd3d522 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a22ba3d6c5a64836974138f4c3a319f7a0e07e1c |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/af46e07dbb413474d6ed23fe96bd0e4711998c10 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/2c31526b48de2847de21212897f52bf1ea6a6295 |     
    i686     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/48fb91ec3665d611637aca3dc6a34e34dbe27ce6 |     
   mipsel    |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.org/results/e8ce70b4e11e7e92f00e7685889fb0eb8c1dd4cb |     
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.org/results/03a4e400b7c76c7764ab73e8e5fe387906c419ef | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/da6f1fce67782e6843ffaa2de9193a7260e59a28 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/737e3e8237b2a342a1b2299c2e7b6db4b81c9b66 |     
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.org/results/c18c5ac5bcb0faa03e64e743d1b5349234b5478d |     
   sparc     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/ece80e843a161cd18c83153607f6a3e7d8e87530 | ORPH
  mips64el   |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/0f0af1ae0d4fbdbbd664ab2aee16052650a561ff | ORPH
powerpc64le  |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.org/results/6841b8b1836842fc5ebe371e44a1ce73dfe83119 | ORPH
 aarch64_be  |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/db996c894c810ff5c7f4263975d1def0edef6d55 |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/ebed428c413d2a8e01d4617f4bc3a36048a34a10 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/e042511609bc3d7f0c564a85a6d992d6e1c2142f |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/a852722950a6dc0110bea4d337f944b24e759c41 |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.org/results/2dc1e57e997a1a15788c8bdf85fbf8eb4c88f316 | ORPH
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.org/results/ce61cad987ed4ea2f432b6a045b9a4a0d12725ae | ORPH
powerpc64le  |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/30f97651ce624b437a8c81b64e0f5c2edbf12c18 |     
powerpc64le  |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/2eee0645235f4f2c88c34614cd8ea7085415f1c0 |     
   s390x     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/c81797588bca73d52099e70d2abe7afbff9d328f |     
   s390x     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/992bdca208eeb0715953e80a5180af980ace6399 | ORPH
   sh4aeb    |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/41a9cec67ac376d3ee6aa3af7ea79a436a3814d4 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/4aa00f174bdce7780565e095900ab3e1a155db02 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/d35a781ba764e0468f498481c2a459a1c1683a96 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/308e9f827145c6691055b42a4c93acf45541f6ea | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/413ae1994466c5688243d0bd623faa8efebe4db1 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/714fed5777708803ae858272ed6c71230edd6c19 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/f3c1545ba2f3b7c9f9d9ea54932b972747818aeb | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/446492998923f28f81ac59fccbea0e4c8fe78b88 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/81aed6416d809554fa804418bac83a5b3f1992d1 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/85a10c712bbf3072de54c1a36bc8bb36ffd2339a | ORPH
   sh4eb     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/168ba4f7c665110fe0c0173d8ba8694b1c1a8bd0 | ORPH
    sh4      |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/f100da1a70939b9368cf98cb0046122260574473 | ORPH
   sh4aeb    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/27228ba18387c2c442b6ad548ab8e8c52bd1a1a0 | ORPH
    mips     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/c084731c72314268a8e65f95b81f097d750d4d96 | ORPH
   mipsel    |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/e99510357fd711f79bcfd4394c2d405e76e5053a | ORPH
powerpc64le  |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/cb98e9eaf94598e0572ca7a93e72003088075763 | ORPH
   s390x     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/613f9c14d2af3f16c8aba52e3ac61ece991bf4c5 | ORPH
    mips     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/26dc970b92101454faa42188e7203b60b1a0d667 | ORPH
  sparc64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/ed35560656a09c38c0e8e9b744174fb4943177c0 | ORPH
    or1k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/312b0330c60d5de5c76775f47144768e0d6b535e | ORPH
   mipsel    |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/e17506324e89c830a2ff6859426122065389569a | ORPH
    mips     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/14852089f6488f22009b9078f57b36b7bfcc6094 | ORPH
    sh4      |            ell-0.65            | NOK | http://autobuild.buildroot.org/results/9b45fc6ec953e64170c95754d08828d95e9c2690 | ORPH
 powerpc64   |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/5ebdecf6978b422e1ceb760fe6b24cc9e44f5e4a | ORPH
   sh4aeb    |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/3f14c15ef154dcacee0482fe9033913a96889b4d | ORPH
   x86_64    |            fd-9.0.0            | NOK | http://autobuild.buildroot.org/results/a4240b20aafde613c911c21933babc8c1948661f |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/bf3d081f41877a7bb72a3f6f53fe7a5b6c163e76 |     
    i686     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/c189b32df90648d3c5a6b79a81480e67e90b5909 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/55b168e9f596a2fe92bced3b753330b296ec3922 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/a12cf5605a3fcc6ec7ba92a5b36a5d6653b94a72 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/aa74550b571f92f752058aa6f8f5471514483c5a |     
  mips64el   |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/3c481251f648126a12ee6fdc147bd48eae77f356 |     
    i686     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/5261ff29dac72b4348519d54ff88e780f50183ec |     
   mipsel    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/ced984bf2677838c819006fef880b470b1899fa0 | ORPH
   mipsel    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/42cb222d32f2e155f22c5e0aa8a33e30c04327b1 | ORPH
   mipsel    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/3034f6a2cbfde3e2b6880d83c8544dcd31db1e67 | ORPH
  aarch64    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/f3e2ceee4796139bf9ad4e587247136a066984bb |     
   arceb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/a736660f3def107f034a33fad5bd50232d5f08ee | ORPH
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/8f570567b208a0c4047e1b43c74febc11b13c60c |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/49e50ed1025b0d89a75aa12c50c7f4ca934a975d |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/c2f281babfca489ab6873c5f42ccb6d98cac41f5 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/efde98d4ac2e63b344b5047c1f2fa7ff724aceb2 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/361bc039845b782b57a2bfde8fe56365a84399d1 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/78cffed180e5cb710719378613bd605d4756436f |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/3beb55f9570c936967234820dbe8e375364641c5 |     
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/0b57cc97debc7ec69d74d28648a0a408589487cc |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/adf0c4615a915be11f1d092e955b95c30d24f3a1 |     
   mips64    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/ce1b99ae370da4b4e3b1f202b761cbaa5bddd84c |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/2f6237f9eb6961a38fd7278f507bd7abbf32f1ec |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/49273878c277a4e86eea1c0b5d4fde9feb65bef6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/c624091bff6766341288f2c55237de33510ad95a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/0e8ca97525be9c901521b3a21cca53baf73d6d72 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/89d87ccce8a17c6a00fd0bf0303f5cd7ba78f3cf |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/96693736701dae2ff970b8ce2da0e95b6370fabc |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/24ffceddf6e0d54cb40150de3261df6acec39480 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/0e5c998ed37fb258cb64fac6e4e5803d900edf92 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/76c5368d0e6f6e2a997aae99137c049a94c04c8d |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/70facd8284e2f8de0ca3da3b8fc379cdc2941c30 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/bbb47939883d4ec8cc7e3e3f6f253479c92856be |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/5b2b54d2f6a1d6a39066e9f955ebef6c6aa370d2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/4eca9f76c9152ee769274efd0a82a4770b4b136c |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/82e64f93cc6930ec6ed3d0501dadb38a6b796cbc |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/fc37362547680eafa6832b7ab36ee4a60e59066c | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d10cff6ca85f662945c76332174859b6bf33f723 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d55fcc013223081c0935e02c5819b353047f3ec5 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b176d10e98834ccf9adf0f5a2fe73ee3325f31ba | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/8dc00e8cccf7ac8aa391ccd8f5a0b92816b99281 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/1229f50b52c878a1fc3b62ac1f1933b320d16d63 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/3f322f8da2e0ab360e13d1a42dacf066529ed2e6 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/ac297b1bbd193b2dc43e77d25f59f1c43104e54a |     
   armeb     |       gstreamer1-1.22.9        | NOK | http://autobuild.buildroot.org/results/bbf0a4a875241debe4f39c5f0c4efef86ab6c2ab | ORPH
microblazeel |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/32a1c44a3c4213d517c972ac4363f48c28f28bce |     
   arceb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/434bfbb5fbf2c0efc3026ff551b8a0bdc2272c84 |     
    arm      |      host-cryptopp-8.9.0       | NOK | http://autobuild.buildroot.org/results/1edbe5f13fd34a829f0b46d6e0607b5ef8461264 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/56ad54f05b84548a6c285bfc237cac4a3ea2c1a0 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/9254325282dea5bff4971c5e754ca6af82ac3dfb |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/0623d9d4dd62a602af6cd51154d11d56a683902a |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/37ef82b2e5dc9dace3eedaca1b31d8c35304d973 |     
  powerpc    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/cca666c720a2f4a5b9e19d7efa02a424cd8c19d4 | ORPH
   sh4eb     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/3661437380c8bb8648d29d8513a90a8afa5bbd92 | ORPH
  riscv64    |      host-elf2flt-2024.05      | NOK | http://autobuild.buildroot.org/results/ec43a1a76fcf2a7e0c4ca9f8b9a084a0934f6130 | ORPH
  sparc64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/92780f409bfe1a7b3430fb146b7427170c8312a5 |     
 powerpc64   |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/b757af160e805c1df614b224cf0c95ef99601014 |     
powerpc64le  |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/dcd6c5e2bbb0b68203396ff45093f33d4a913fe2 |     
   nios2     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/e9ae3727619d69a2cfd735e5e1f3694aad545106 |     
  riscv64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/93290d923c12a92a6ad74edc0b2078dd6b0787a7 |     
microblazeel |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/b752c41539deff97e522eca24c28fba591b9bc89 |     
    i586     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/f5bde2b2734dc4ff2e85dc437d4d8fef4b6931fb |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/2dc324eb5bb88dc1d477cd5d29d5fff33bf4a747 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/11ca6316079e8c23e7450c5739ff7b12dbd196d8 |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/aee00f9e3f14ba028748d1deef029018cebfbea9 | ORPH
   armeb     |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/8cd9118de053be2014bf258bacb1174e0292522a |     
  powerpc    |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/dcad06897b1436ed9b06f978320841b047e99ea2 |     
 powerpc64   |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/7d53670d71a9efe957585036209ad304e1bc330e |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/7021ffc0f4b211aa68543da6286eaf20c94a8c99 |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/9d1a62fee8b48db12c81933d503e2e401fa352ad |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/eb7c2bf008e6ffda4073a07ae80d96fa6e6e3a22 |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/e0ff57c00c71d1a9646cd2122097fb5865b9e154 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/1980e7e701e88174133fa32a7959d3273dc6abd3 |     
  sparc64    |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/8aa91d93f87f26448dc8dc6092eb47cb170618dd | ORPH
  mips64el   |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.org/results/a267aa5ef891c85fed1bcb84915a4a3b5221eaa0 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/20d4e6effcd31aca7bd40acf9f5e4ee83b4221fe |     
 powerpc64   |         liblinear-2.45         | NOK | http://autobuild.buildroot.org/results/fc4517f9b3db24c71b19233de1f169c2a8498ca0 |     
    i586     |       libopenh264-2.4.0        | NOK | http://autobuild.buildroot.org/results/e9df2fe3d7f044c539a775bf41a02e96e01a1d8d |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/3b6c4ad79041c420c8f4d2e93fa2b8f08cf5761b | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/67fa07937b2d6cf4142cb73be855f62be5eb6796 | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/204aa5b896f7c95d08de70e9ebfc2c5ae179813e | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/07cd8725ee1ed804e7bf990ff7f47d140bf20e39 |     
powerpc64le  |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/1314b6021ba73d7c1ed29ef042d587b1c0a8c7fb |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/80919df50d6e5f90822da07f107439f994e8e119 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/c0b52c3c0c864456f5033fde1b71aae958ee04f0 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/d59593425d807b7979a18c2828997c23abd93bc4 |     
 powerpc64   |       libsvg-cairo-0.1.6       | NOK | http://autobuild.buildroot.org/results/2e2f852bd778f9de19e11218bba967dbb61127f8 |     
   mipsel    |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/dec3ed8871face3c5c12da09a9562ab9e632212c |     
 aarch64_be  |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/a6b6260fe02a829fc2ccbc43c920fa23a023e4a7 |     
    mips     |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/de5c341baf3a9c2868fe3a809c72b32518215cb2 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/93d16d30341f8a4852b9a9da39a303a87157e683 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/1c708df988358f79cd5cb092d412eec8253bfda0 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/6bcf88c51b7e7c15ffdc27ab227dd16fdc988316 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/5f689b5a69e34ca5cec07551f8518ebc91025b3a | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/244d9a8ec50c27f7a47039c971255aefbb7d85ae | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/f10d86c4c27cb035112e3bfce5472d2e5c46004a | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/a6dfe1d5920c6e5fbc8f1b2beb14e7a9db076062 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/7dd5369eb99f8828f8e1b761cb68a76ed5a301e7 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/09ed59487077c05932e053221909b1ed071dc83a | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/c4efac84614cdb2343c260bb40a571520c71be13 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/938cb8e42c9b5972b09772a811df9a00c5338738 | ORPH
    m68k     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/e4e9834f7802a61204ae53b3d5e71c9ce6f62d31 | ORPH
powerpc64le  |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/478ee24547f67e898c2de8701ad8073c7aeb2ade | ORPH
    m68k     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/8d736f892357193310ae0fd2c50ddcfb56f8d7a3 | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/dbebdb2e8a572d5bbaf4d35a52edf6ee37b8c3db | ORPH
 powerpc64   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/63452d9f5460963a42fb31854fed1dfc5297b51e | ORPH
 powerpc64   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/492f5c6af2e5405cf618dfa1040008ea60159036 | ORPH
   mipsel    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/99e14e19747fe2bff95b155f195493dc982a0b46 | ORPH
   nios2     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/52ae7c40ca2b9150d74d318825c0b748ba86ba75 | ORPH
   xtensa    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/bc307a9607069d600d7798a3ecfcdaad23aaa9eb | ORPH
   sh4aeb    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/aa0b5f1f68b5490834d09f30f22427430aa5f985 | ORPH
   sparc     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/776e9aa5007158c40bca7d9263625050e91c0e5f | ORPH
   x86_64    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/c737945d0327b12dc095e62558a4fe7c54df1d64 | ORPH
    arm      |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/e3ebe779a3ed8c05abe46a62538d666ad38779e1 | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/a54b704dcd2addf212a00cd3d8fbde4931b500f5 | ORPH
   x86_64    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/e9ce4ad58f7c8caaaa30fa0bfcafea047eabf01d | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/235e158fbc2ea28dbfa134ac29c960e72791b9b9 | ORPH
    sh4a     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/0f941da567c857496556fb001d0d6ddfc69a7387 | ORPH
    m68k     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/4e61517bd17313aa03188ec2e392ca669fdec302 | ORPH
   sparc     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/c90fcb4ef1cd022076ff972420e75e6a9761b826 | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/7eb791bcfeac8848b9705ae65afbf13e57c6731a | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/0dfd4ac25bcef9688fee209429c12f2cf79180ee | ORPH
   armeb     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/1de8047b25798964d9f4ca0d5203e3148403ef50 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/324bac03aa3b5535eb800e16cc7d29150f55da2e | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/2f2c2a5eeae276127acf7cd27981bab5549b2ccf | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/9984286f3c24915e978afbc1eaf4b4ca0d376393 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/0b1382fe47af8c7f0cb646116568de3dca32541d | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/6ccb80b08a02ca5a420759731a52f26b2fee7902 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/838a7be98fccb93633b357d4f32ff00750f3a240 | ORPH
  aarch64    |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/102f1cb25866f881cee6da0975be612786d09ce1 | ORPH
   s390x     |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/37108638c4de6a5aab403ff5cf96bdad0f14b74c | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/dd18b88dbd47f7995dae2e649b5ca125a828f03d | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/dc9b8bb42707d500b7cbb940c1fdbf9a1de7590b | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/cedb68e040b53aa714080c6b215a699e5dabe74c | ORPH
 microblaze  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/f3f019a59da151dc8898b2a767b91d4412dbbff7 |     
    or1k     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/2f2be8ea5c4af59733182970f51f0d52160f3288 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/1c3a92aec1f3f21b3788214af400bb90868340d0 |     
  riscv64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/e53e1264b054c5bcbc2ee9663c3737d9d7fe9b94 |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/2a10a9dd47b96dcf7b7cda250b104cea30a757ab |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/7be3d906e144ae8519a7b125d5b7cf56e01e12e8 |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/43f1513a31e53e442e61f2293b908ac15326eb8b | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/550c27111e2d94dc4efbfd5926f309d8eed51900 | ORPH
   mipsel    |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/eadc1669badd4a2d416682e2ed45daaeae31cc45 | ORPH
   mipsel    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/13fc5dc794e972f4e6a9f82bd70ad51ff866dc54 | ORPH
   arceb     |        postgresql-16.4         | NOK | http://autobuild.buildroot.org/results/2ce8c413c231e9878b69ea11bda623c450e94c0d |     
   sh4eb     |        postgresql-16.4         | NOK | http://autobuild.buildroot.org/results/2c2f3c2b12b75820292a686791b95f79a906a323 |     
    or1k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/cf1643cf1ae7bca777b9f240b950d273cc8fe291 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9f3ada6414202d75f7994b870753a11c1f66a9e6 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/e432188aacb294edf2bc145021a7c939c57c3898 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7e520bb7f1cee4c561d3ec3763bc5186b222d275 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/30e82c4e6539d4310aacbeef1c8402e86cb87280 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/dc0bc6f68dfecc541707ea6fbf78539a140ea665 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/84471d58f776d5cfa3c5a66389ef827dd08b3eb8 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ca5b8ba87a49ffbb678b4bf1e99474c479de6980 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/04010a29defe9a8a7cd54561db1de2d442b1dd33 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/85c7dfe135981b7210bf0ae231f3dd5f2a23e067 | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4f246970f56e9c8cf24f66d946ecdf8fe673bba6 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7a3a5e69172c74029046b21bc41e74c0fab74831 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/966fe65e0bdc577183894c6e01e2241e3ec05de9 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/de258797e555ce41f331abeca6c02cc0cc14c7bd | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c45568967bbfd63b8703f749bb781e1ddd7da847 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a306c4774a8fb466f3e8573d2047f00a55f21387 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ebf651c3dce7c4621008bfd2695c332dc23570d1 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2830629397b037136ae457a70d43aee1b322692f | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c3b4f7073ed771f187263aa1da4a968aed883d1d | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/eec4ff9d0caa296d9c3f39ea0950c27bad616b6e | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7f62e2e925d689b1ca276d60025994aceb359666 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a9f842f9813e494594dde60a0635247206f40391 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a405abaa5fee249275cbf825da86b3567ed7d1a0 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/606c070152546b637199be9d33b5371a7a57abfc | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ec3f50580e53b3500a82562cfd67ec9703896d26 | ORPH
    or1k     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/215dee2b73731372601ed504ac93fb2dc599109f |     
   arceb     |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/64449c007f37cb3b8e478a1ea0c92ac49fca16f8 |     
    arc      |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/8ca65f60e09261c9ed41c01916f7166414d56f6d |     
powerpc64le  | rtl8189fs-9a82349c2c40515f9... | NOK | http://autobuild.buildroot.org/results/3e31c9ee38e2998f920c87d35c60b2fe4edbb408 |     
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.org/results/e455ca55e77c6a88430abbc753916d13a14a387b |     
   s390x     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/15de82f2c401ba9c5de4692039ec00c8f5c1dbb4 |     
    mips     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/df73117af7a300a8b4e7b7f97fd328534caaddba |     
  riscv32    |         uclibc-1.0.50          | NOK | http://autobuild.buildroot.org/results/6ccc61f28a0f33e0dea8ffa88017cf4849ec3d50 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.org/results/febf3147141c8618f21bb123e4479df9b806de99 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.org/results/dfcab68466ba8b3ddbfec57b574a44d2350aa145 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.org/results/eba338a2be1d849ba2d361a6234f650d0d14a9b1 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/fe9fa0f8bfc60e244e9c18abeb0a618e76218649 |     
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/90249c09524c3bbae0c5b7dffb8b109045a5f31c | ORPH
    i686     |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/ae0e1637e4ac83dca0d9c36de6697669f9e44040 | ORPH
  riscv64    |          whois-5.5.14          | NOK | http://autobuild.buildroot.org/results/62b168bd8dbdc1a94993745bc65c4fae60e39f4b |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.org/results/2756a7f6decf7fa70a6f8a43121cf007a04512f4 |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/d8adce3b9ba20837ffa109e8b47d9bf0d343749e |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/3a67284bc4ef46027c211659c50c683003dd2064 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/d9aa2949eccc81b0d500ef21b3c653312f5d350d |     
    arc      |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.org/results/8f5e0c1f7f65b7ccc0d477c1b798a678b2942326 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  clang-15.0.3 | 1 
                 coreutils-9.3 | 1 
                     crun-1.12 | 1 
host-am335x-pru-package-5f3... | 1 
host-heimdal-f4faaeaba371ff... | 1 
         python-greenlet-3.0.3 | 1 
   python-pydantic-core-2.14.6 | 1 
                 x11vnc-0.9.16 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          clang-15.0.3          | NOK | http://autobuild.buildroot.org/results/6bf44e770093b35ffb8c068e167c3bd0e5956e1c |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/80f0f353a9beed7305a7c6949ebe3442cc4d0c92 | ORPH
   xtensa    |           crun-1.12            | NOK | http://autobuild.buildroot.org/results/56d592f846d9bc62ab2ba3031723211accbd482b |     
    arm      | host-am335x-pru-package-5f3... | NOK | http://autobuild.buildroot.org/results/03494bc7816e03149debc41b4484c69320837f14 |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/04982f43b68c0a2a84628bd79176353d3526ee64 | ORPH
    mips     |     python-greenlet-3.0.3      | NOK | http://autobuild.buildroot.org/results/737b11dc8911eb511989b1586473b698784c63d9 |     
  powerpc    |  python-pydantic-core-2.14.6   | NOK | http://autobuild.buildroot.org/results/761bfefe80597b163d78fa0fc82e99e3effb8cc1 |     
  sparc64    |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.org/results/fb4f6ba51b7027e722e1b99cd6e583bc33dda0bd |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 3 
                  ffmpeg-6.1.1 | 2 
                  linux-6.8.12 | 2 
             containerd-1.7.18 | 1 
                  dhcpdump-1.8 | 1 
                host-go-1.22.5 | 1 
host-go-bootstrap-stage2-1.... | 1 
         host-libxcrypt-4.4.36 | 1 
               ipmitool-1_8_19 | 1 
                libdrm-2.4.120 | 1 
                libmad-0.15.1b | 1 
                 libv4l-1.24.1 | 1 
               lighttpd-1.4.76 | 1 
                 openssh-9.7p1 | 1 
               pcsc-lite-2.1.0 | 1 
   python-pydantic-core-2.14.6 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.org/results/0d1860faf1c070f8290bd34c989069e47b677717 |     
    mips     |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.org/results/1cf903f235ed379751f9abf8bb1b781d2321947a | ORPH
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.org/results/bf2c13023fe67a3561047a9bed3e512f7e70f51b |     
   mipsel    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.org/results/7cd2bcd4e26100ff9ee2244843fb12815bc9a57d |     
  mips64el   |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/37d070089ae048139e4b03da513effe8adc28cc7 |     
   xtensa    | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.org/results/139fab5d8393a01ea24196781772c0f920e4d301 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/78356ebcbc7d021b6099468ea020c8831effbfff |     
   sh4eb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/24b635383e302748455151c91773ed2df0f003fb |     
   sparc     |         libdrm-2.4.120         | NOK | http://autobuild.buildroot.org/results/078952e30a2e8d0a6a0ed63ad486c806e99f1936 |     
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.org/results/9fcb34b775d6f8b6f8f1253623cb08e7b485c700 | ORPH
   nios2     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/a379f882c1e2b7fc135e2547df6d2c962739420e |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/6daea9809fdb25d09c6c0fe941b2a026c1c8110b | ORPH
    or1k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/fc917fb49fbbf75c021730578cd43f430ff4126c | ORPH
  aarch64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/af87e70989419242f7a0d186b5ab97d0a3bf7f6d | ORPH
  powerpc    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/b20028630d864e79e158dad98b36b9b1faa0108a | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.org/results/dc8dfcf69ea6b3b80312d9188d254f84a2f7b5eb | ORPH
  powerpc    |  python-pydantic-core-2.14.6   | NOK | http://autobuild.buildroot.org/results/c2dcf94c15426a84aeeea32a28e5451989f39699 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.org/results/60e0844c2872fc457dd82da790a6823b58f16b2a |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.org/results/615143124f3929b27b255da2a453ec9953737bee |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.org/results/a55c04d3599d5bc11c0f8ff0c2fdcb33f7a52303 |     


Classification of failures by reason for next
---------------------------------------------

                  ffmpeg-6.1.2 | 3 
                     avahi-0.8 | 1 
              bluez-alsa-4.1.1 | 1 
              host-rust-1.80.1 | 1 
                      iwd-2.19 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
                 libssh-0.11.0 | 1 
           lttng-libust-2.13.1 | 1 
                    mpv-0.35.1 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/dcfd1ce5305832f92bf061474a122807dc1567a8 | ORPH
    i686     |        bluez-alsa-4.1.1        | NOK | http://autobuild.buildroot.org/results/612ba4db50ccd656f52409ac133cf76c6348cd79 | ORPH
    arm      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/f2750e3a565c096b4dd5e5f2f5c0b4316c073e9f |     
    i686     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/21164c01cc4ad96b6167a984359fb3d394b8a794 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/65a90fa84e45b07bb339ad1ed08bffc4af450201 |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/8a7122959626934a61b82117e82817bf1271cecc |     
powerpc64le  |            iwd-2.19            | NOK | http://autobuild.buildroot.org/results/b5575741b66ba3bcaee7d8fdc6a3d4007869bfa3 | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.org/results/5689b219494fffcaeadbc4ae8c633ff3f818957a | ORPH
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/bc66349f34960dd35b1b5ab50de95f80c6b24f26 |     
 powerpc64   |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/aac5deab2db7cd82bc77a52002d8f1e4286c5aa5 | ORPH
  riscv32    |      lttng-libust-2.13.1       | NOK | http://autobuild.buildroot.org/results/a1d5c777a582470cc6ce71ec7de075273ae20187 |     
  powerpc    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/722da5997f873f62abf4d6b0b1ce4bee46773de2 |     
  mips64el   |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.org/results/8aaacc77f83133561551fc45e50ada752911e884 |     


Gitlab CI results for 2024-09-03
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335305  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335306  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334889  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335036  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334596  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7717335093  | ORPH 



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
