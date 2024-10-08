Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D84CED25D
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 03:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9461402EB;
	Tue,  8 Oct 2024 03:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLg8XHxWuVgQ; Tue,  8 Oct 2024 03:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E9F0402D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E9F0402D7;
	Tue,  8 Oct 2024 03:18:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A69301BF5A6
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 03:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9641B4025A
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 03:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ur6iL6NhCCkl for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 03:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92C4440257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92C4440257
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92C4440257
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 03:18:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cb7a2e4d6so52140735e9.0
 for <buildroot@buildroot.org>; Mon, 07 Oct 2024 20:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728357511; x=1728962311;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KQy4QBj8oSiwBWW/Vo0MtJfWh0euof5BjE/pHRVsQt4=;
 b=EYQQTd1jY4FyZUU1s/qwcUmz0GzDVSNc9KQuv7Aq3jIDEkUYVyUFaeRGUz+JomRW75
 tdZ2bVAhQ8+V3WgcmfetZpgTz8V/+AA9LHrW/kL8QqrLs0IEtaLzC6FVOxlgq36ClF16
 AJxWwrqVftGWQPPk6lHJgK20p2vEYC2So2791FiRQYXM6hqDauK8AoIHuZY5pqq7Zdr5
 TMdCJVKMjBxO6cRB0hx0NMMKxaV01/8EzQvoe6DjVSj/QECtneoK9wDIKwqSOzZAupvT
 4JZhx+WW0hFZlQdiqMPkZK3jYl94ZK2PcAiW00Uxfc2qVCA9LMbl8Uh7ghDek4MRkr1i
 kv0A==
X-Gm-Message-State: AOJu0Yw0ZoYoESNx7L5iNPl2sDRaBTyOR7CLsIzUaGV9HBeMiP+h7u5i
 dOL0I1lAplOMXmpgbTEFI2I+mm6knVT3W+T9w54i79U2Ap2B48AwZ+DwLA==
X-Google-Smtp-Source: AGHT+IHc6O8pMZNrGJQ2YKtnCGbkaLKMe7BNBIFZ8i0jHkFi2OowFzBS0KlLuYgm/Qw7lgsultY3VA==
X-Received: by 2002:adf:ecca:0:b0:374:c56e:1d4d with SMTP id
 ffacd0b85a97d-37d0e8f7539mr7615138f8f.54.1728357510912; 
 Mon, 07 Oct 2024 20:18:30 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e99440b8sm3237485a12.29.2024.10.07.20.18.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 20:18:30 -0700 (PDT)
Message-ID: <6704a486.050a0220.6bdad.bb80@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 08 Oct 2024 03:18:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728357511; x=1728962311; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KQy4QBj8oSiwBWW/Vo0MtJfWh0euof5BjE/pHRVsQt4=;
 b=EW9Y/J8iIXzKs/L4dmpIUg45QF76a9qDRgyW5qL+9Av6EvgIgtpcpIBYeOoJVlr3hX
 xv615nfejUo7EvquZ03INPhaTwRVIt6MLi1ZYRH5PUbe+V5FF7bjvcllBDqLeWdpV2Ii
 oxwjh8vfKKLtV59Av5z/IEnFOeaexn038ljAHlh5u5e3f59nrQHEs/ok0xONOBccWKVD
 3BZpQ8P4XQJh7ZuVcpFXXMYre0y2cAMugnRU8X3co5+iSG+ZnEnPxs8LKRS0VfnOQWMu
 xSLxT7NRm21IM3lML67KC54ycsoMFQ7R+iDaFcmd9WcniPXHNuhdf4HIivFqeeKlRQXg
 naIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EW9Y/J8i
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-07
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

Autobuild statistics for 2024-10-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  0  |  7  |
  2024.05.x  | 26  | 14  |  1  | 41  |
  2024.08.x  |  2  |  7  |  0  |  9  |
    master   | 19  | 303 |  0  | 322 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 61
             bluez5_utils-5.78 | 25
                libcurl-8.10.1 | 21
                 linux-6.10.10 | 15
               procps-ng-4.0.4 | 10
                 apache-2.4.62 | 7 
            host-binutils-2.42 | 7 
                  ntp-4.2.8p18 | 7 
android-tools-4.2.2+git2013... | 5 
                 coreutils-9.5 | 5 
     linux-5.10.162-cip24-rt10 | 5 
           at-spi2-core-2.50.0 | 4 
                  ffmpeg-6.1.2 | 4 
           host-librsvg-2.50.9 | 4 
                 rtptools-1.22 | 4 
                acpitool-0.5.1 | 3 
                  bind-9.18.28 | 3 
  binutils-arc-2023.09-release | 3 
                   foot-1.16.2 | 3 
            gdk-pixbuf-2.42.12 | 3 
glibc-2.40-18-g564178076272... | 3 
 host-binutils-bare-metal-2.42 | 3 
           host-checksec-2.7.1 | 3 
              host-rust-1.80.1 | 3 
              libopenssl-3.3.2 | 3 
               linux-pam-1.6.1 | 3 
                       unknown | 3 
                   bird-2.15.1 | 2 
                  boost-1.83.0 | 2 
                  curlpp-0.8.1 | 2 
                  dlib-19.24.6 | 2 
                  evilwm-1.4.3 | 2 
            gettext-gnu-0.22.4 | 2 
                 gnuplot-6.0.1 | 2 
         host-libxcrypt-4.4.36 | 2 
                jemalloc-5.3.0 | 2 
                latencytop-0.5 | 2 
                libglvnd-1.4.0 | 2 
                  libsepol-3.6 | 2 
               mariadb-10.11.6 | 2 
          obsidian-cursors-1.0 | 2 
                 openssh-9.8p1 | 2 
                 pixman-0.42.2 | 2 
               postgresql-16.4 | 2 
        s6-linux-utils-2.6.2.0 | 2 
                 agentpp-4.6.1 | 1 
                    bat-0.24.0 | 1 
                  bitcoin-26.2 | 1 
                    brltty-6.6 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.3 | 1 
                   duma-2.5.21 | 1 
                elfutils-0.189 | 1 
                espflash-3.1.0 | 1 
                     file-5.45 | 1 
              fluent-bit-3.1.3 | 1 
       freeradius-server-3.2.6 | 1 
                freerdp-2.11.7 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
               graphene-1.10.8 | 1 
           host-doxygen-1.8.18 | 1 
   host-mender-artifact-3.11.2 | 1 
httping-0e26c53d5fe504eb720... | 1 
               iproute2-6.10.0 | 1 
                  jack2-1.9.22 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
               libcap-ng-0.8.5 | 1 
                 libclc-15.0.3 | 1 
               libglib2-2.76.1 | 1 
                liblinear-2.45 | 1 
                  libnss-3.104 | 1 
             libopenh264-2.4.0 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
              luabitop-1.0.2-1 | 1 
                  lvm2-2.03.27 | 1 
mali-driver-d40c57d81c9cf4b... | 1 
                   mimic-1.1.0 | 1 
                     nut-2.8.2 | 1 
               openblas-0.3.28 | 1 
               popperjs-1.16.0 | 1 
      python-autocommand-2.2.2 | 1 
           python-numpy-1.25.0 | 1 
                python3-3.12.6 | 1 
                ramspeed-2.6.0 | 1 
           uboot-tools-2021.07 | 1 
uclibc-ng-test-132c6134d691... | 1 
           v4l2loopback-0.12.7 | 1 
                  whois-5.5.14 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/a64d6c6587e2adc31ee7db9e60423063e1f9d09e |     
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/72c5a4322d1bece3582058015f98931ee99bc31d |     
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/92d20dbfd5da98c018400dc7e9fa2e2ed3345c2d |     
   mipsel    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/45828f2189525b8b604602cdaac581a800a2e2b7 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/80ef37e19791a89baac7a1ea066ceced2586d94f |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/fbfa5205f87cd94d0f5547397e4a19c396309171 |     
   s390x     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/d0445f71d75a74fa7de79b4f2e64db929a1d7097 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/27315d6f3abe0eed0c54b5adf9cf8604ad23ac12 |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/dbe94af86220930d73079faa5957e13ca5f3cc62 |     
 aarch64_be  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/9306befd7b797de5795f565c59fca811c851eda7 |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/229b90f10516ec27824e14abaa273db3a7e30faf |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/a293d68e7a076c4b88de3aa8d450142c9269cf2e |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/887a06c04345003b9c078cac6f4717b899f9f7aa |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/df0482ca55dd2e956213ed836b129474112945c0 |     
   mips64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/1699a4b68f895cbdcf208a686e8ccc5437451883 |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/c2826f797142f483b887dbe66e0d78de4722b95c |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/da205d8670a7f27d49d6799865c38a1355696a1f |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4850456ee17edfc71a0b659c9ec8baf3ea843052 |     
   xtensa    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/18250caa3957669b45f81eac9b8722d8e282e520 |     
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/60b40db5b9155cfb3d069a4087c8da77367c03d4 |     
  aarch64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/a20f6dc5aab405e38a293245d866e47db5f0b861 |     
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/6465148a86669fdfd16b64b5a861be4ca704578a | ORPH
  riscv64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/1f197b209f92c71625e522e0fd078a9a0e748eeb | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/5088f7cb4b53823aea03f3efb68a7d4354b8f7a1 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/e2e8e77f7faa9f356ee4bc2a3a1d0a59cd75ae0d |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/d09e215b22d254570e4edd39038be851af87efc9 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/69ca26857394aeeb3e02e5813f7f0a954b2bde5d |     
   arceb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7c7621a8a61aba7684ae330058327439b8a78908 |     
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9f754fb38b80ce070f458bcb0a8bd37c0aa4c92e |     
    sh4      |          bitcoin-26.2          | NOK | https://autobuild.buildroot.org/results/329d2de38c5432867f4bd9946f01bf8fa086d733 |     
   x86_64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/3c7cf5831512c427f4ca01a20cbaf9b9988983db |     
    arc      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/f27316f7fa6da5b3aee531d949acc96c158a24f1 |     
  mips64el   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/cca1314ae8dc0a039f4f76d67389ec60907434b1 |     
   s390x     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/f36f9af95a445c7b4276807d5a9ab01e28bd6213 |     
    sh4      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/122374e1986cc4222d116d679037869e84f434c3 |     
   s390x     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/03409c6e39eaab826ae4e493048100a5c3ab9b9e |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/e4d796c1b538701dba44fca56d647912617fe816 |     
    i686     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/71439c92ed35c1476b79713609cb528416f4ad34 |     
 powerpc64   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/91a6fb3f1d5347b3bf64eb9a4985f1bf6bbb0ea8 |     
   armeb     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/eff6a814e455e0faeb38a23e4461d941c7f342f2 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/23fbd54a212764fe45326a3748d3f1c0b5cb7af5 |     
   mips64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/35306ade4c2b224f660097aa7c9d9fcd5c49733f |     
microblazeel |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/f0c57877d1370343754db591c60469769355449b |     
   mipsel    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/842db2f106b09a0034366aea369cb44f719c196b |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/adcc37ec643ec9504f113553f60f28af4ce90657 |     
    or1k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/09160b618276b0b4d28a76f22bcc827845752ffc |     
   mipsel    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/0b2603ce06a0b799c61f4838be793847ed80e94e |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/359075d78e3dac3059ca2c138a72d9e5bad1df4a |     
 microblaze  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/77280b1784a39bda275ae30c642bcd99ce9bfc13 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/3b84fda1d6116416b992e923b40653183c2967f9 |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/a6d9495a2db698623dbc3e039d6e4bfa1930ce79 |     
    m68k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/9f926059140c8c12807b0facf9591293659314bf |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/320b694af80e3ed49ed9273b83e98f4d99bedc5a |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/5fedbae15638500227bfc2b2017d2dcd15c1b035 |     
  riscv64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/885a7ef66818777dac8ada9df1696443c7f98f0a |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/27a23b6df7a712d6e3c83797dcd072007fb018ca |     
   s390x     |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/cf660d2003aba2798e27b127e47e4b1d524e9e41 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/bb5f84319fbb4bf829047bcfdd197a6dc35c999c |     
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/80461249eadbe496c2f2bfddb9b8d8c9c60f773e | ORPH
   arceb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/7a37b125427811a7e2f2694a79d76b1644512496 | ORPH
   arceb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/b0adf41400ebb059505ba290836554d8341b7ca9 | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/1cd696fbbee7bf3c44fec9ec710e081d39c2311e | ORPH
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/3ffae3cf2c72e5f160348030dfcced9f1b32d048 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/6ab7611f4691e659bd82c1aab60b529b63006f53 | ORPH
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/ca6d9cab4dce84b1c3a430fd158ad6909d3f4534 |     
  mips64el   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/4835b28cd711f814bd36ac804937e15debc97eb6 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8135d5e68151fde5989a15ce8a99cae4d47b570b |     
   arceb     |          dante-1.4.3           | NOK | https://autobuild.buildroot.org/results/255015c8400965fc928fe2e96ed64b78a4b6b603 | ORPH
  riscv64    |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/855d319a6e6b9b442df67c56458ae8ecdb9969cd |     
   sparc     |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/d88a480bc340d9c39432518bb3c3f263cff08ec7 |     
 microblaze  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/2e77e1f04d2bf60bc70ee64a7b52b0b90208b25f | ORPH
   arceb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/6a78cc44d062b9026a3708e22b219adc540386bb | ORPH
    i686     |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/05ffa53acd35897b450c35bec4644d10b66d111a |     
   x86_64    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/c0d6653dca50af11fccedb900cc18a5262245c02 |     
powerpc64le  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/c0d5b848bda0d787f275f60dcfabe71158befae6 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e39dd19ace989a3f791dd25740df75926b21db8f |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d5320b8499346e5eba422c5d6c466c63d7868e4a |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/bd0a6d1872f8d98db16703bc19e7ce62baf8f881 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/7465ff74fd8f2673bd3902c7081389f9732a1609 |     
    mips     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/425e1f78b83f65b56bd2da7d2eaaf22228f2917e | ORPH
    mips     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/66935aeabc2ec70ccb7a58c746bb15ed19bccff8 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/eed0fd0366745e36082ec1653ecb7c2bd0360e7f |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e4765cf28b4ebff17ea1c4cbd8a522104be6f440 |     
    arm      |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/35582d045c577ab33ac4cef5a611ef2c824ef2ea |     
powerpc64le  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/168e32f0cdf22f3d7255c5b041e3f983a34bd6fc |     
 aarch64_be  |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/087f37427b06675ea556f7a05a2207342204b082 |     
 powerpc64   | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/d3399de7b67ee03e923d0e06f1dde60c124ace29 |     
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7c4a3b14a8be733b6cc015e22d7ee56d404ce983 | ORPH
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/784089af29629d6f9180309db215272532872c1e | ORPH
    i586     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d5b11f55659ad9afaf2ac18a2891f67ebb8e9f29 | ORPH
microblazeel |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/6e68ea458bd99c16846e1dbb92f0981c092d6e38 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ac1e65c6ec18a490dadc57f2a937594855b183b9 | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/3c892fd6252ecf6859031ea0b14a50af695f7c88 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/aa6426a4a624403a4457a25e46c294ed91b19eb4 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/3bd0e0d1816dc2978a7b933962f52702025485b9 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/5a96d273e1b8113d326b5642f1552c87dd0902ad |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/606497240241cc8410a934227728f1fa3f1b215e |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d3c6e6a252ee13d46ec8e225cb7cdc998ba4fbc1 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6bd61e5c0bda2a6e95b75b42920f215863e96e15 |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8f7aea8e7b7e6c23d5d577c9ea8674264d222df5 |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4cd8137420a4cb6fe11e089dd558adbaf202d9b9 |     
    arm      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7feae68073bbcea9eebafaa999d24ee0f7b06fa9 |     
    sh4      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bf6185f7787dea3e466ba9cbf5bb6097a32dc2dd |     
    i486     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ed073f237c96c47bef44db40e5cd2dbf4ced7161 |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/da12c10b93cd079f916b275cae9131487e581cbe |     
microblazeel | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/dcc5a69401a0c3e98d45fa565848d7b8d5a8d8d6 |     
    i686     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/4b796c4ab5dadbebdc22b5a60726fff24601244b |     
    i686     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/84205a80dbea7c27ad09c1570c9e13b47e752635 |     
 powerpc64   |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/19aa2d2fefca07cd8ef7b4110d5524dd40af6c56 | ORPH
    sh4a     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/562d2245cc24a64a28b5e242ffe40d14490125d6 | ORPH
    i686     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/178ac81f610f0e7e54c53baff4d0ffff8b1d530f | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/ffbede21cefcb92dba2ae89e6ee520f95788b1d2 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6de3cbbe84938d973cbb1b2a4361daa122b38773 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5b0dc65593932945f9dcc183a611c573d5b7df41 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/52df329c9fc1b110776dbc15ae654d46e34e7dd8 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/038a8b69133b06f98fda121a6c9b009648c61d80 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2a304dfbcf954d996626a99c41fba129cc73df7c | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/759d8af588071dd3cdaa59d9865d713238915621 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9be02c8f5ea9a5639af90a61bd964537ce336ba3 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2de46e269e3b63211d6a6f3f5dbeab1890f7d0be | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4fa7321484658fa477c41316d92b42a644e0ae81 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/24b28e12ee911454f37d276a7fb8254e83ba3b5d | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/24d4399752287e6b051281b6fd42f00e88ee639b | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5cfb41c245746b595ac92a1552522f0296d08cf7 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/adcf5ace3d0d1cac75e9e893df9e0d17da4681be | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/40dba09f88fc64c374739ad7bdb41ccc4530958b | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a62500499d92862223a8c5abe366c41cc921fde1 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6dbb5c56a9470c1c957585b096fc77b8725ff1b3 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ebd3b64000c2a454919a193aef552e16182e9c25 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6b4b9a93e4ccc4cd459d60048b1a9ef10bf5de81 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f150b78f4576f5135e599d67cc6252de85bdc640 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0507c87b59863b2ed0cfa38b0c2945b1b8c4bbca | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/35146327b94cafb8f7385144a47c51d8cad70f9f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/23057f45bdb3097217d43c4140254dfdd21864dd | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b35e3864cdb221a868bc6045f71fbe54e69fd52d | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a9d36b38cae2b226ba7aef1b5bb3127560e06385 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1dcf972bc677b33aeb6f92962ea7d4a9fe153e1f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/74ce829581e3754fe17de16cf2d529163b9de5eb | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bd70edba7940d0e0cf21a5aa8c11f0565ef53eec | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f74142aa2977713b70b2410194fbd1cb9fdf9796 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bfef2c51571a1323f248cdd064ae0163d6c8741e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/171feb8db79b70e64a64e84c9ab570e362881469 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c8f5dbf5d4104594576008c7a55fec1abe120ec1 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/13b044fdc4503bcce717ea817b783889550bb008 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/76ce92a12e4dd66627b04f335ee573692736d143 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fc00761204ad40161b926b8c85da70233eb2174a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84d1009f4d4e1380e1adf8f1ced218dbe074e300 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/69a4e264c15f5f4ea8805be23200f18ed06b2a1a | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c2ae7d4bbcc302213ea88105d275a1cebcc4f0f7 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/86a0504f07cbbd48d5de0175bece583e1c3fd8a7 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1f993d12efa860f8667d1c2b0dcbd6c3627fa26f | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7cb7d5dccdcdf8e08397156d3bd6dabf3ab044b7 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce8ade1776dcee5d5922a2365a15d6aa0aa7da26 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b623f4bec267be6ef0d9453cee62c19ed7a5e01a | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e5bf61098e1576664e727eca925b89e1d9aa3c29 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/798925dab000f4780b1a616e291cbfdd2064f641 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/83285d32e5c2c64a4df850b0706051fc1eed701c | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c858963c32cf5b568b1d34e5553f6490618b8b17 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/35192cae00ad6cccc7a0720cc5026ff10f470e64 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c804b41f2b88c3e4a7b074661a567da1c0527ef4 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ac460fdb3551a114f463952b982e327a873aa05d | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2f2ca20cd95af51615afc4299e3d18b6f810a8ed | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e17e92d5fe1c83bb47f8f0ef987a94a81c469818 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b898c2836664dbb6a4c814d44012b17742805b4c | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d260e5e38103765dad269ddfff8851b75107bcc2 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4f15bd1d953a5b0e64eb60a52d54e686ee388641 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/591bc2253a722bcb7a8bc5a7e159440d46944b51 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b94367ca8047eee0aa1a38e4ba6551dfbab4c9e4 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bab931a76a851e31746a0f0758d928b1117b782d | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1ee1c34c55628ab35809ee4df4be9065567db021 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ad1d1208b91f00478b4b9dd6ecd2dd4e3d733dd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/90a7d56ed5a3c881bff6d30264463f8b043158b5 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f3d8ccf36ee68edb5825f2289f1c47e4878790de | ORPH
    i686     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/68a0854b6239d14c046c80094afe5fef82403351 |     
 powerpc64   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/ca4de618327d57cf75337228f8da0808cdf69b4a |     
  aarch64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/47e44e0a7a4a219256df44e049811565e398d12d |     
  mips64el   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/79dcd88f8c88735a2bd689369b4dfbd988cccc95 |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/92d50bc3a0d52355156e10b3bc5af77063007503 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/77ab0b5f15f927d1988936895de429d7bae16694 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/f12b0cc30ea4f9304dd16e9936492e550e4b4fa4 |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/157b97f1d448d06b221b1f7f9726bca4de7a87f8 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/f9332b5d00942c5773990340ad2e512a5cdc7c6f |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/723680b12e3238789488e6f200148d6d4095086c |     
powerpc64le  | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/524449e61beef37a3bdae3f6bfc7d8245d977edd |     
    m68k     |        iproute2-6.10.0         | NOK | https://autobuild.buildroot.org/results/2b1c10adc88951da1d09345d5b1473a07097455c |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/065ff4fd6d6c314f898fda80c4321ce6c025e440 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/d3623f93f2c98bbcc6b707debd3fc16d1d480256 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/81b5fd681974fa7aa2c798e62815f66c7f061b2e |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/68b163a4ba7c14d0e9117c4bc2fcff02e0a59847 | ORPH
   mipsel    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/96d07122b4cede60f4d3712f9f05916d1e6778b7 | ORPH
   s390x     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/2daabe4d2dcd51d139061f8784121c2cfdf4445c | ORPH
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/775c7da2056e5723c48f642bb0a2084d39cba404 |     
  riscv64    |         libclc-15.0.3          | NOK | https://autobuild.buildroot.org/results/4c903297290bc62fb6fc21682c4af10534f1013b |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/56309e00a3fcadc7aa0c652bb3032359a49a1cae |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/96ecce635483827c9f1dd72886c1d6da9c0449df |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c942cadf97233905b35dbf3f316e889157a46db5 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/28548524ee87bdb05ea7bfa86ac6543ecb2a7f91 |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/bf1da552c5ec9539a8d524c89bd7942af6e3635e |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/92a96d298d28537309b4255a1a3ca0c715cd3e64 |     
   sh4aeb    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8688dac64ea17fe0928fb2929e5138e80ad3cba8 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b43ca2df4f600c64b9cbeab1d47ccc6e98e1e3ac |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/dd53afc7ec963466a2cc856d98aa7890950bc7b3 |     
 microblaze  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b85d4a1c5cfe0dacdd375430fe18d09aeabe952a |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/acb9b1b0744edec0263dc495af62925669b00423 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/63b99fbfabe335c3eeb1bec465ab2a0abdd7d9a9 |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a4d1d23226026dc19177ca2e95c6e51641010298 |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7e903dcccbf63f9acd574b375699d2ec215349f3 |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/33989ef0b87835de241e6b81430964a035324641 |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/79bc9b8f4aa913cbbe5981a9c5cf41647d8cd55c |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/93be2eb5c433a96180cc7e883adb3b113a0877bf |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/227d19d0a05960f774b274aef75450ebb58f3fee |     
    arc      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0ed086439582e41bdd09a9778ff41a089d16bc92 |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/cdfabe670dbd42829126afdc15e5dc47caed4829 |     
   xtensa    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/756a642f6d94b5afa0fe6a95f425f724aa20003c |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/7ccf76f19b04ea77f2c2a139f74248f51217c9ca |     
    m68k     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/d54dbaf03e27ddfd277260f9e4c5c1f349d6be24 | ORPH
   xtensa    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/da9c1a4f77b4b5aaff826cb25c21814db3d05a62 | ORPH
    sh4      |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/fd514fd4219ba7f2e377d950cd40af3504e0b31a |     
powerpc64le  |          libnss-3.104          | NOK | https://autobuild.buildroot.org/results/00de4d126941adf0d26ab694c4209b2d8f3dfc55 |     
    i486     |       libopenh264-2.4.0        | NOK | https://autobuild.buildroot.org/results/e6b9a04cf76394fe158c2d70b781bd66196052e4 |     
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/afd252558c31ca8b2a18ab770ee13bef0a85515a | ORPH
powerpc64le  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/4cff0d602dfe3a7623c008f771d30e88696e49d2 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/8b920a76c1d8dcfcf07458284e994e316b9b1068 | ORPH
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/4a8955f14539d4c013ee951777c3efd60a00e7ee |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/64165eb15b5a5bd1be1c297fcbd3bfa680ef0ea6 |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6da9ce99869393db932f6a3d66586e28502ce136 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ff388ff4fac184257c101393b4fccae15bd04812 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/de819c8d98c6775755bf63033b20c4716e7be8ee | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1de68465bd37b3785feba4e7f5c0725821f33fe3 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/cf6edf3a0c20018a58351128edc43f0df69e344a | ORPH
powerpc64le  |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/ea89b51e212fb01c5ccdd212febd2094404319d0 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/65ff7ec561d2b26aef159ab8878173c54fd30ea2 | ORPH
   sh4aeb    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/e4edb7bf7d2ae6698afae7cf82fd658368f78e85 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/45caebc16ca8bf59948c700bd80c0a60a4a46b62 | ORPH
   sparc     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/2384bbb3e5fe5965949f59fc63648a00fdb0da45 | ORPH
    sh4      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/55d572e5480503ccc125acb941825bf8f84b8494 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/7a305924cbcd2dce6a4571fdf4c480136bd1606e | ORPH
   sparc     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/493e40f5683d2c160f69a062e658e9a08b7daa14 | ORPH
   nios2     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/7c93e16005254ee08c764fbb0b69fb93a8ff5210 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/563e93bd662308ca2e2b80e02adbd061510d7324 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/c570bc51565903c69be4dcdd77ac055d5eee4036 | ORPH
   sparc     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/fb89edc9231f04650f3e401430441523b8a27cc5 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/5519a987ab8627683e6d48fe26f651dda024f80a | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/445bb690886ca5de9a9c69b45da309e96135bf46 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/382dac0d16f275cf3c06452c80e3933f8bf1505c | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/86889cb720680515848a644d0d8e82e296bd6cd5 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a3e35520a49874b34408b8a0f85b5a1746ff40c9 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/2de7b0c2d83f6d732036df59b78cf33d514ea734 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/74c34d004715ee90cce9d02aeba8e5ca04fadaf7 | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/59ed0624d58950460e8d064f3f95703ade0a6b6b | ORPH
   mips64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/5cabdac62fd2446175234bad6224f1b826cb98f0 | ORPH
   sparc     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/1efbb660be91e7936faac64bde71658f0f678b1b |     
microblazeel |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/79f3d7e09e7f83e7c1b9a46f2a8c3ac1bc3dbb1c | ORPH
  aarch64    | mali-driver-d40c57d81c9cf4b... | NOK | https://autobuild.buildroot.org/results/323d4353aefdfb08d81cbb8bb522a31a30200e69 |     
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/56d1215c782f7e9e7f230f0d978e64e914d35029 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/dd1188f12a85289746efd564a19ef65940eb6506 | ORPH
   armeb     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/fe6bccc4be406c0bfddbeb5ad5bc975eac87c47e |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0ab09c41584f65f719d01a466d49291b74b8b0ff |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1bda63fd155ed285f84b70a6306ce9e5e6234555 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/bd3b09035e9759cae8b79a4a0a8aecee8221e5b4 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/edd363f5cdd856d952968e7989f8f6ffff90fb2c |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/665709709901b2676da762aedf4574a54677f12f |     
   sh4eb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3c460943f37dde49dab9432355aad037cbb5eca1 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cdcb4236975376ab03ce960579216c1ae1dba6d7 |     
  riscv32    |           nut-2.8.2            | NOK | https://autobuild.buildroot.org/results/cf61bc02f5b2fbba8da5a7592e9ef928376a07f3 |     
  sparc64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/04ab839030865688605472c3ef222d71a128fd0b | ORPH
    mips     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/7b6ec9abdd14adddb6570498d30be4b5c5cd1e13 | ORPH
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/1072290f63c8598cc8e8b46a65ddf02b5bc4a288 |     
    mips     |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/2e58e68489e690bcb0d8ac9c13c764a8c27e2b32 | ORPH
   mips64    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/56be49657e31ddd58764b00b41ddf24b11bbc2d6 | ORPH
 powerpc64   |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/b2823de9a35f8c5669b38b738d8af8ef1c7e30fc | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/1943dd85c3c93033d70f85aacf6c5bf737c38344 | ORPH
   sh4eb     |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/58a9aa5e80decf4e7b1764072a246c9acb727d33 | ORPH
    arc      |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/ed07181820ceceea5962b10d9040c52ac5450233 |     
   mips64    |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/19cf6a1284dbfbdbf08ada69b794067055ee3915 |     
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5535f94b1b87a89fa71e712e453536c2377e3d8d | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8a0faffd1f887e9b1ab8654ea240a60034aab4c2 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/af1c18cb2ae6ae544c93520cbfa17f161ec0c052 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/894bd1a97f309c9cb8d15f0aa16f879e1314e048 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/30fadfde79d6dd7cd09cb141dc7535ad21ca3ad2 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e0a3b317905b10a30bd72defc70c29c5b7a5b4ae | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/849d12e1b9f25935f414b15356d0cd90cebd625e | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/69c054cdec8e392ecf37312943fe40b49ce086da | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9390e15717373645e5c000b9c00633b4aa313051 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1319cc146561c7cb527fd7af8d431feea82d46f6 | ORPH
   armeb     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/6491f4352582323017b5d768fe8a5145d4c18233 |     
  aarch64    |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/1c2e8dbf010f6b58816a8ec5464aeaf2071c3158 |     
    arc      |         python3-3.12.6         | NOK | https://autobuild.buildroot.org/results/4c7ed725630ba29f92b98cc888f8385dbe7b3807 |     
   armeb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/38e8d7b083f73a3744564cb89f4be3072b6ce009 | ORPH
   sh4eb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b4780c9368278f99fa590cc797a0775b75a10d2d | ORPH
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/dcce389e35d6c536ef335beac5e947d6eb5f960d | ORPH
    m68k     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/3327d952d7a69486f382db5549736c39539b96e6 | ORPH
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/05467f0cebcb7ab8a8616b0deebbe3cdaf9fbf03 | ORPH
   xtensa    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/7fdf8f6e706c687d48746ad2aa15cfe43a47c2fa |     
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/61d0090566f95805949ee750715caeb77f289cc8 |     
  mips64el   |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/9d806381ca727e6d842e2fcb252fb5209ba63a1f | ORPH
   armeb     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/5809692a12005682ec6145e86bee912fc10e6d90 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/6eb914f64e447875673a64e78bc2be80bf29dc67 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/499b3937c69af68ac42e8fbb44f2e3b57b6cb1c0 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/1140a0be3d2f95e80e5e2f54db98e2e1b9f195f8 |     
  riscv64    |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/9734ff5258b13eb45b7cf6e6cf9d575ace315ce0 |     
  mips64el   |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/bc76e8a94c92ccdac7cb49615670d9eff0c89cf4 |     
  riscv64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/b277228a8459b60cae3cd096d3c3fadf1188d90c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bind-9.18.28 | 1 
                  fbterm-1.7.0 | 1 
        host-python-lxml-5.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/80a1b58a5c273e62319587bbafcd139031b4ef29 | ORPH
microblazeel |          fbterm-1.7.0          | NOK | https://autobuild.buildroot.org/results/991bf4b83668bd7912f8515187f1853d27c5f49c | ORPH
  riscv64    |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/63625567498e26d54eb420ce3600d5c7d4046b82 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 coreutils-9.3 | 1 
                      gdb-13.2 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.22.5 | 1 
                  linux-6.8.12 | 1 
                     lxc-5.0.3 | 1 
                  mbpfan-2.4.0 | 1 
                 openssh-9.7p1 | 1 
               procps-ng-4.0.4 | 1 
           python-zlmdb-22.6.1 | 1 
                 uclibc-1.0.48 | 1 
                       unknown | 1 
             zynaddsubfx-3.0.6 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/4ad09f3497837530c51365f47497ba0e07fe05d9 | ORPH
    mips     |            gdb-13.2            | NOK | https://autobuild.buildroot.org/results/57c336624e8f3d63fbed57df72fd5da2d26eb5af | ORPH
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/66ef2a12924b0351f5bcad1e216909e1e7265ffb |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/87457d675128054bca7bd2be5efb89900fe3d977 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4667242c90a66d0bfd0795db762a64352180878e | ORPH
  aarch64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/e567dd71b1bec57fc7dc9f0cdaec6c24e85f080a |     
  mips64el   |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/22d3c1ea509a18e59161c10e853af34e24768679 | ORPH
 aarch64_be  |           lxc-5.0.3            | NOK | https://autobuild.buildroot.org/results/e21ca7921cb282dda3033a0d71d745493a42cad5 |     
 aarch64_be  |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/814c093b86a4dfe3b74a0bd146e77df758e5de7b |     
  powerpc    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/70abd36e25d79b84c80cdd492f565dbb255bdec7 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d545fad87902afda49565657e8b86d23a4386acd | ORPH
   mipsel    |      python-zlmdb-22.6.1       | NOK | https://autobuild.buildroot.org/results/97a7ad0f2ced9e2cc37f3c3835d3f174e952e342 |     
    or1k     |         uclibc-1.0.48          | NOK | https://autobuild.buildroot.org/results/d1670d709c5da5ddc285e4c5d6128febaf557810 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/3e6d4ece9653612c210c91fb86ad934d2e9af481 |     
    arm      |       zynaddsubfx-3.0.6        | NOK | https://autobuild.buildroot.org/results/05352fcd56dfc77780e85a2a7b942add75c09571 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
              fluent-bit-3.1.3 | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.79.0 | 1 
               openblas-0.3.27 | 1 
               procps-ng-4.0.4 | 1 
                   rauc-1.11.3 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c997705fe8e96932b8b2376fac2e951d5fabfc97 | ORPH
microblazeel |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/d48885e7fc1d46176282f5ca02b843634a9ba671 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9b5589514fc2e3bd476a44ed205acda429019b1c | ORPH
   x86_64    |        host-rust-1.79.0        | NOK | https://autobuild.buildroot.org/results/7808a91afd53a46e4e5c600a269a0ae39cefa75a |     
  mips64el   |        openblas-0.3.27         | NOK | https://autobuild.buildroot.org/results/1d852f31a0bf9c3e6df328a65d4435bcb9df6be5 |     
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4c2bd767dd1e75c1179dca67c708db9a59c5fab4 | ORPH
 powerpc64   |          rauc-1.11.3           | NOK | https://autobuild.buildroot.org/results/f517f54b615fad66a8d279d620d16d38dfe6fe70 |     


Gitlab CI results for 2024-10-07
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210439  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210603  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005211358  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005211359  | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210605  | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210606  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210459  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210460  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210623  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210627  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210781  | ORPH 
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210834  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210852  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210856  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210883  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005211005  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210925  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210934  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210942  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005211052  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005211082  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210461  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210462  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005211094  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210463  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/8005210464  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
