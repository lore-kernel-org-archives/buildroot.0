Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D654CEBF69
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 03:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B8026067E;
	Fri, 27 Sep 2024 03:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cl-Dyhgo46a5; Fri, 27 Sep 2024 03:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC49D606FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC49D606FA;
	Fri, 27 Sep 2024 03:18:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 343A71BF982
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 03:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2263F606FA
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 03:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqSbAUvZRFlJ for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 03:18:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FD9F6067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD9F6067E
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FD9F6067E
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 03:18:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso1989907a12.1
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 20:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727407091; x=1728011891;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VWpC94/QbxZhO63OEmnBVqxZyR2e2RsNiNmFOZVzsoM=;
 b=KpnaM9Qb4zqB51Hsb62ShYoeIneBF9e+BzolxdiDT4Pst6rG756xk3G5JhG7uXSJWk
 QiGMPbd89IXg6S7yyUsCx9Oeb58+8cjXiP3GmJh8n6AbsyECME1BtOSuN1Dm7MhJ6PLU
 VL/iGV4Bd0FggBD2tQbbvIdlMeT9pYRcHLLeSrvPZ3bFjdZ+gmRf92e/UkLJ23uWj/Wj
 FS5Sh6B3stwt9mPICT9fEPKkPE/N6GI9oMBkCzSm8UcqTdaLZCnWLo/YP4EM+ZoyQJG7
 NakCKuyG0K48sqhYRl27Ikyffe7BCktX9bQxsJ6GwtaS8idPdZ54ddyvk/oEfiK7DBkF
 vROg==
X-Gm-Message-State: AOJu0YwVQPsAm9HG9JZ1rIl5UMUq/24sXMvMH894k5s0mjYLFWBGa52I
 lv4nwjZmwT432N6pT6ES1xDcndv06o0WjKsv6iLkdKcGcU7H0E4IX0FdQg==
X-Google-Smtp-Source: AGHT+IFVrtZzMXnenppO3oXCq4vxmenbHPtdEluYbWCv8xiiDGUHOHesa+cYWzHQFINEwZpNSgCz2w==
X-Received: by 2002:a17:906:730d:b0:a7a:a0c2:8be9 with SMTP id
 a640c23a62f3a-a93c4908e28mr144886666b.18.1727407090786; 
 Thu, 26 Sep 2024 20:18:10 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2978c18sm69902866b.148.2024.09.26.20.18.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 20:18:10 -0700 (PDT)
Message-ID: <66f623f2.170a0220.325c64.2cbc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 27 Sep 2024 03:18:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727407091; x=1728011891; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VWpC94/QbxZhO63OEmnBVqxZyR2e2RsNiNmFOZVzsoM=;
 b=mbCt7TZrz5tw1bIBeXLE4s7gXBkKKwQN0/JyF80ewy0cQ8yCXM7gBBOpjqXugmvf00
 9D33wA20tJuS/VIjUwgPcKcPeXSWOOlHmvdQbvybA8hE0aEvDyIF0/WGdWfIY2yBWUqX
 PTiXzT7y/xRRiMBp+2ERPqEHaTdkU/5wxo0R8+miRAJK99RW4dBiBzWxcVbRmEqXwhAH
 F5VepCw6O1mYUDWHsF/9Xam8eaak5vr4fIQPGuMlzBoEhhfe5eT+FTna2f8jJn7Ibg2u
 IvFm975zj5McwfyZai6YR4kM5KmHzTJBssT3JYHWkW0x0Re0WLKJ6aicGu1VNemPNc46
 Dbhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mbCt7TZr
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-26
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

Autobuild statistics for 2024-09-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  3  |  0  |  6  |
  2024.05.x  | 22  | 19  |  1  | 42  |
  2024.08.x  |  1  |  2  |  0  |  3  |
    master   | 14  | 179 |  0  | 193 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 26
                  linux-6.10.9 | 22
               procps-ng-4.0.4 | 14
             bluez5_utils-5.77 | 8 
                libcurl-8.10.1 | 8 
           host-librsvg-2.50.9 | 6 
                       unknown | 6 
          cryptodev-linux-1.13 | 5 
     linux-5.10.162-cip24-rt10 | 4 
android-tools-4.2.2+git2013... | 3 
aubio-152d6819b360c2e7b379e... | 3 
                  ffmpeg-6.1.2 | 3 
               linux-pam-1.6.1 | 3 
           at-spi2-core-2.50.0 | 2 
                  bind-9.18.28 | 2 
                 coreutils-9.5 | 2 
                     file-5.45 | 2 
                  libsepol-3.6 | 2 
          linux-5.10.162-cip24 | 2 
               mariadb-10.11.6 | 2 
                  mupdf-1.23.9 | 2 
                  ntp-4.2.8p18 | 2 
package/zabbix/zabbix.mk:14... | 2 
                   pcre2-10.43 | 2 
               postgresql-16.4 | 2 
               valgrind-3.23.0 | 2 
                 apache-2.4.62 | 1 
                  assimp-5.3.1 | 1 
                      at-3.2.5 | 1 
                    azmq-1.0.3 | 1 
             batman-adv-2024.2 | 1 
  binutils-arc-2023.09-release | 1 
                    bsdiff-4.3 | 1 
check-11970a7e112dfe243a2e6... | 1 
          cloudflared-2024.6.1 | 1 
                  dlib-19.24.6 | 1 
                  evilwm-1.4.3 | 1 
              fluent-bit-3.1.3 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
            gdk-pixbuf-2.42.10 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.40-18-g564178076272... | 1 
                 gnuplot-6.0.1 | 1 
               graphene-1.10.8 | 1 
             gstreamer1-1.22.9 | 1 
            host-binutils-2.42 | 1 
            host-ccache-4.10.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.80.1 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.506 | 1 
                 lapack-3.10.1 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
               libdeflate-1.20 | 1 
                libdrm-2.4.123 | 1 
                libesmtp-1.1.0 | 1 
libilbc-829b08c7902ceb87a26... | 1 
              libopenssl-3.3.2 | 1 
                memtest86-6.20 | 1 
                 openssh-9.8p1 | 1 
                pipewire-1.2.2 | 1 
                 pixman-0.42.2 | 1 
      python-autocommand-2.2.2 | 1 
                python3-3.12.5 | 1 
                     rauc-1.12 | 1 
                  whois-5.5.14 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/82eff558ce3ca4ff2ec209c6d2d3f3181e239c15 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b8838f77c1266337e54e277de7bd53525a5cc15d |     
   sparc     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/1e53cdf3aead8921ec3ab394b988bc1ea24d92e4 |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/5019521988f66ab907e039a402e39e1e4cd7b23e |     
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/7223bb85dd955df8165f58793d7f6d92cf881b6a | ORPH
   mips64    |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/48f8e656c13e3444b355985271606b5ea546a22f |     
  riscv32    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d4b431159dcc45696d3060b5239b41f3fc56f2ff |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/17f8627c2cda5de2642c72a056d0496f62bc978a |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/9b82ace47caf8aaed60b2c6e2edb158d31e4e0a1 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/cc29fb9455f916c55df5822f9ffcd08050d980d0 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/951141ae5ac7fb17f9c514769c8b4423053df7d8 |     
   mipsel    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/ed71845126865936cadc8ac3d9b71fcb49c330e1 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/b1c54c9ec16c4eb9fbc3f5a0741acc432261ad63 |     
  mips64el   |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/adff807d6415491c970c91503c5e82012ea9a87f | ORPH
   nios2     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/04dcd307475565fd01ed78e239139fa27aa46a7f | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/d31bd6133488d7fa716119b871beec428b5838a0 |     
   armeb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/93fa8ef1be64a1c16633afd2c2ea0a0d3d259faf |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/29bbbf1eac2292d4bdd3c5f4d2eefc53998cf86c |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/aa8f4908457bb8280f60683beffeeeeb36530c70 |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/9f5ba2e7a6510ca122ed96a05bf7b3f732586547 |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c384ea9942492729c8b36668ac10ec43e0b3b1c6 |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/565373f43e77e93465b103c1b104ebd036edaa1d |     
microblazeel |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/202609c2ec02d0359c04e360df81acd5031c2398 |     
microblazeel |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/0a5feaeb49b56b63e459ebbf6021cd071155e583 |     
  riscv64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/6dc3f4d6d3c280732d8be567a25fc6fe42f73431 | ORPH
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/f539c7e680c99da0f0c9bb59fd82514daddf5ff9 | ORPH
powerpc64le  |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/d4f1e815ac6a9bf7a3d1c847c0bd5e80ee1de27e |     
   xtensa    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/8241cdb78c75fa6794dc6bcf74f2a7d5db359885 | ORPH
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/39185a8cc305b73f5f6633da44273e789e70c473 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/7d52ae73f708343e57e474c95dfe977c1bf923f8 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/c4fd6c66ba039d647e2f9a96829ff1a445471977 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/3f3eff567191e55dea988c7b0bb0139a9cc9bc5c | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/877039babb1f9cbaa8d8b91ddb534f94b4fe958d | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/6cd0b93fbe8221972e111fc0fd660f5b0dca0a55 | ORPH
 microblaze  |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/f5c543bcf57181373680d0c16a1814d21b000bcf |     
    m68k     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/1a20e38b368e3cc81fbf41808cedf44023da845e |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/685f467a77a007998bba64ec38a2a7f991bbf192 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a4e23937df8b904e8f85c920839827d30a0fee3a |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0833d6870318265f3f9966cda513159b73d1a927 |     
   mipsel    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/733009a9bbacec746502a102cdd14762bb7b9b12 | ORPH
    mips     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/05867bb8da428fe2af0f48a63c1c9b69b1f90814 | ORPH
    i686     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/de59e68916d9d10d3b8cc67f029f20021c8335e3 |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/11b24fc6379a05f9340e5139dabf3284828b24ed |     
    or1k     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/6a94cc71dd19aeee9c0615ff5ab74f8f8afd193b | ORPH
   x86_64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d5845075bac490b9c4ab703a1d814f9c794e03d8 | ORPH
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/f3dfb01bf0ee636b1a25bd9410080f1996df9b26 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/aa177c4f4f7c7429f052cebbf54f7027e4b2cabd |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f553f51928837a5bb693eafc05d8426152299bbd |     
    sh4      |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/7e96a8ae7119c1240d1a5b4a5189e2862833fe69 | ORPH
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2d3fc23dd1a75f7771eeaec9822a801962385e8d |     
   mipsel    |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/8112a2eba6f08bb9f4b293c52ad5f6456fae350d | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/696695a27f1cf87d823af5908f494a5ab8375b4e | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4291eabbef9378823d51442d602fbca0733abfc7 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2805755612ef4055a1c7c1ee1e4e7ea013cf7cb2 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f064fe53266039f710e355b92f4be361942c6428 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f1afff53debd10a03598625d7041ecd32d76c638 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dfb744111984285ae3b425b847340bcfd1652002 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c6d7d2acf1b6f0baf893be3a1e9367073419361f | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/170598bf7cf53505092cac4a657e467803b795a3 | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/af4652dabd2c59822be1abe28b8162de03d8c093 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7f877b499cafc90eb64f66712c1f8570b40aba68 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b6eb0e6bf6a731348f1230016e0c82c22844a4c5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/636d2067652d11531890bffd07e531eb973a15a6 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b931944df2c69a0a38c894599f4d1b6138ebd89d | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c06770bced98f1879904224d1baa4f804f2188a0 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fb6661821797753d945c054f721de6c300a7cfd2 | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a8581479f5484d550092b42309e46fe50ab87727 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7697aebe6da0890b6e6c45f94830fd28fbbf8f5 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ebe5fa40be33fa514df9d245d0bd5532939e30ea | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e8da971ede516037a9b6306e3f93d91ff92868fa | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/98a4010e89634564c1f1e0e96758ff80799293d5 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/20c06cbb20ecbf0b2a8cea62d2bd7a76706b198a | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f82756d918c932896057c8e4185cd8e5651c331b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9e1a4e2a7b3c5a398ef88c9b49bec4f514f9344a | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ea815e678a11f211e9c755b41250cdd7b5decb04 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cc08d519af1487b9d246a22676a9d6d62fc6c2f4 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/13242f263fd670fbb7861cca82c68cd5bb9fd289 | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/43ed153f376cc05c63675773db68d01df8e8e12b | ORPH
    or1k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/24e89e38b37ef722a97395e1b39467ef05d7bec2 |     
   armeb     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/7781bf3a51195499049e371c68722f0373d097d9 |     
    sh4      |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/15e5c0dcbf5f70d8b06c6c41d72795010eb3d64f |     
    or1k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/219b50b9be2e06f031e796f40f3dde1fd0667893 |     
  aarch64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/9a61946a14759a64866fd1db3c1c270f56c25f75 |     
    m68k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/84835c22953daf9aefb8368919be0d61b6ff2e69 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/910ecc0531a7c616e0c4346c7ef4f7540108e7d7 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/89148b1011cb370df273f767187b2be08e10d9e8 |     
  mips64el   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/3f3fb8ddd86deda5efdc62dd59f9550e0a73cd0f | ORPH
   arceb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/5380759eb7e6258c623480c93ffb4bbcbd1e2bff |     
    arm      |         lapack-3.10.1          | NOK | https://autobuild.buildroot.org/results/0b348c8f30a7ccd4e93d51b1298df8ffb2c98a51 |     
   s390x     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/cc59c74d5970e173ecb1cff03944f3d4d165288c |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d279fc4223942195a9b4ad43e674c4fe62f259ff |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8740933f0077cc0b253d3e776fa5704e54a0a700 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5f06264de1de1fc9b0475cb0696e53274df95387 |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8060fbd7b2d15d38f38d0605ca567554391412a5 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e85a20cc80d6b7ef078b63b5de10b8dc4dc14ed4 |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/61cbdaf6ba1112b390094ebc442d99c4e7214364 |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/6ad8343ad514966efe36a098094a58da349be06a |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/84c2eff54c50e253b6850b8c36ec37b22bb3e7d8 |     
  riscv64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/7abcc62cde49a25c0fae4a549f0ce489dde516fa |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/2e5f3e78db4ac4d2ec65f9c9ce8a5877942828f1 |     
  powerpc    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/87e73eaf1e32bb61c8dfdb500c9c92f0a9e02464 | ORPH
   armeb     | libilbc-829b08c7902ceb87a26... | NOK | https://autobuild.buildroot.org/results/d92226ce1b50803a3b69e6b75e2c9a5cc0280dd1 |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/b6ea533ec1e82fa28bad05af5bac5e0f085398e3 | ORPH
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/fbb47a4ac8658548f3e0c8542d0c926274277c61 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/c75bcedeec931d165ac392d6ad8216bc922d0972 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/105cf7c80ced1f9517eb0da4146059ad938a9044 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b07c17384c5fe2f80728822de1bf66f28d36240b | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2eda4f96662a374fb2f0b973004c662f3fed8b50 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/58e01cff8cf573299712c9ef916267d27c97c11b | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e5997bf5e5837ba88ebad7ce66ae032670823111 | ORPH
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5be40bb6a01a9cf63e61ecbef006c5e75cc59464 | ORPH
   s390x     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/0037707be6292d37826153804c9975e089c2d8da | ORPH
 powerpc64   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/f4910c2357312a79c0bc52b760856feb59f0d009 | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/995025d45aaa46aa62d71db604e1362c0ffcba2e | ORPH
    i686     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8f183f10258a12ed9e3993491f8cef23c4e2c974 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/c04d251c6885b6ce05cfc60eb579800be1b39638 | ORPH
   nios2     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/1c97ef271b6a7d2ab876ab1bf403ef06c071c218 | ORPH
    i586     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/0bd57caf9725cb0f8e52dedcf0c242d15f243088 | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/003fd5116738620345b4cb5075d7fd049faca36e | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/1c680d7abba24633422db0e763cd8852db5131d9 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/15f8384d6bab133263bb4ef882855740355decb3 | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/3a172bff377782b66f1c91dfd7738a4a18c6a2e6 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/49165fcaefca97496118056839fa94332c7d01bd | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/940a9757103845cd8dbdc9e9f7308f649b1c4b74 | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8b00a5237aca890bdcdcb94a849c0711944c1fd5 | ORPH
   sh4aeb    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/ea78d97cec96e75b210f03d7a40ed52b60f52fe0 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/14827186d0b0601432df37dbb62b6528315c299b | ORPH
    m68k     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/9eb760ac0c7504a88c92f8f7ced8c2e093831870 | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/4dfaaedc717dc4ef27966bf2d17c9cd94cc99630 | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/c31666d4248260f1f715bc987db57983644fb235 | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/326d68ee26c046825b3d4f1051be22f100d21d5d | ORPH
 powerpc64   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/a00120d2b3edcd1fef9f9c590beaffe815a27a70 | ORPH
    m68k     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/18695373d63452b85155d810c754fe97ad9e8212 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b547468d2df95eb4d68b5512bf36ffd422b5cb8b | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/dabbf5d71de1e11ec257ffa49e432442c0cb217c | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/4707f93087f21311732ae4e98fc4dd53b2792caa | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/664b10b285bcbbcef87165a44431808259ce312c | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e0fca70e80c88d859d891c39ff7068825817854a | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/fd6a98160525a6f450087cb2851f385420e717fd |     
   armeb     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/15aacbabaebc8bfa6b15baeb5e0c8205a26d937f |     
    mips     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/42e032b23e33085b2ffcce23801624b70833462f |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8e20c92b02fca85e14e443863af6d1510ecafce8 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5f7ee4c27d598b9a87522f4c3098364ec0547db0 |     
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/381be6b676421345bfc2b6e0815e3ab2dbe0ad3c | ORPH
   mips64    | package/zabbix/zabbix.mk:14... | NOK | https://autobuild.buildroot.org/results/84d9a45ed97fd1506e4192e515ad0ed25bec36e5 |     
  mips64el   | package/zabbix/zabbix.mk:14... | NOK | https://autobuild.buildroot.org/results/c406d2bef3859dd372a93a67d264e019686d743b |     
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/45c7d0aa30f1234425b525c123df5d1df22dc514 | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/a47997277dbeb366f131a3b22a90de08e59ac7b9 | ORPH
    arc      |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/ee50c8331946814c2fecb0ca56ca51c1bb0bc551 |     
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/7113293ad774648e8693c5e40700ffb7ab6929ec | ORPH
   x86_64    |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/e1b4a0621fcac5a52d19dcb5acc0cee1cb7e853c |     
   xtensa    |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/d39719b91d82c7698bf9d9af400a1502c8a28613 |     
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5262ae7febf2ccd5b880b1152b1b726d91579f85 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/67466792605dd7809a6f3b0394da9369016dc36d | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/09566706c6eed078fd1d3d8c885de79601b213b9 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/963da7a7272d498202b05668cad8b1116f2d69f5 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3c940a46424bb4fdbe66ab7733ab1db27cfb7031 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/156bdd1445d28577e038fbf73f77de5edb797212 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fc06c537168d74aafa77acf219409f5b903a26ee | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/38a0d2f71dc6f99976984708b765c6a5394b3d44 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/070fbebd53d7fc64f6cfab17b5b81cc4ed39cf84 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7bdbf17cba02afa4dadd91f40addc3d9fbce37f6 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/de50b64e99f0c6bf940222c975d1af6c865be212 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d8429734dac2879cc468cee331a3588efb7cd0f0 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4148be003bfdca92c2826a9cdceeb0c231519d59 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/edf5c8de06634e24132b6b4ace1320e218dade60 | ORPH
  mips64el   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/483a90481171b27bc12c2bddbf40714c90ccdd13 |     
   arceb     |         python3-3.12.5         | NOK | https://autobuild.buildroot.org/results/0eb3ebbdd07f956dd11907e3c9e5dd31ffc0fe59 |     
   mipsel    |           rauc-1.12            | NOK | https://autobuild.buildroot.org/results/cea8bf11b78d54a930dcccf2143827089796f6b3 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/649add16a31c853f51ffd2acd0551837964a2dd7 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/abd01ccda827a2a4a332fffe6d0848ff67cdaba8 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e15dcd897420178f2ac04368e8372fb37b843800 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2cc9c826eb888a324ec8a41131197437b0bbba70 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2533b4d34a62008ea38bf7416a5c065650457aa0 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/a5aa6c18d192a7c0c6fc697b893b0815ee18c1bc |     
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/850dd20325e654154f54b6b52f387d7f260bc784 | ORPH
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/1f82c86fc1caf079cee639053935c641373b63e4 | ORPH
   x86_64    |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/0cf799b23df97c07b4e2276b46ecc857c03dc45a |     
powerpc64le  |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/a1fef41374b0d60687a426719b5863e515068095 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                libressl-3.8.4 | 1 
              libudfread-1.1.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/7be9bee33388076e8a0245297eebecd829ea69cd |     
  powerpc    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/b38bfe0dcf522ce15eb2f36f19fe35737af65625 | ORPH
   armeb     |        libudfread-1.1.2        | NOK | https://autobuild.buildroot.org/results/bfa088cdfde8c84762d1ddd3491c979e83e24f7f |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                gnu-efi-3.0.18 | 2 
             containerd-1.7.18 | 1 
                  fbterm-1.7.0 | 1 
               freeipmi-1.6.14 | 1 
 glslsandbox-player-2023.04.05 | 1 
         gobject-introspection | 1 
             host-delve-1.22.1 | 1 
                host-go-1.22.5 | 1 
host-go-bootstrap-stage3-1.... | 1 
          libcamera-apps-1.2.1 | 1 
                libesmtp-1.1.0 | 1 
                libressl-3.8.4 | 1 
                librsvg-2.50.9 | 1 
                  linux-6.8.12 | 1 
               procps-ng-4.0.4 | 1 
         python-remi-2022.7.27 | 1 
              skalibs-2.12.0.1 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.48 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       containerd-1.7.18        | NOK | https://autobuild.buildroot.org/results/1f66f50cfaf67d51ad3ee0ae0e92a3a44f5ac0f8 |     
    arm      |          fbterm-1.7.0          | NOK | https://autobuild.buildroot.org/results/795c9b7ad4545814a539d8b493bed7c1b40ae516 | ORPH
   arceb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/0fe1158e1e1bc58db343039fcff579ec9c3ff094 |     
    arm      | glslsandbox-player-2023.04.05  | NOK | https://autobuild.buildroot.org/results/b2c84c9c92f862a9767ad04a8be897a90ce6ebc5 |     
    arm      |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/64c9981e02dae05e03aeddf5f80f9c027f7ddc5f |     
   armeb     |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/1e50379475c649f6febe3d5944805c83448565a1 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/de6625ba30bb0b5ff3b93bf61f6068cabc6a3307 |     
   mips64    |       host-delve-1.22.1        | NOK | https://autobuild.buildroot.org/results/cff6f15f835912732cca009efe7c0fb7da38b67b |     
 powerpc64   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/507f7c040fb721fb3ad80db765bfd3d6483facdd |     
    arm      | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/fa0eda28085e18c4186ff098541fa899e8cdb6b2 |     
    i686     |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/1fcc38b89c629d8d1fae2ccd2975d22e9bfb27b9 |     
   nios2     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/49fc52ed9f1a591b7efc7402fc25ff274375df08 | ORPH
   mips64    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/1b825361f3cb0ab6fb8fc4cf6febd01e82feb316 | ORPH
    arm      |         librsvg-2.50.9         | NOK | https://autobuild.buildroot.org/results/657e33e84d37fadbd07c228c5df635e0f1b2b951 |     
    mips     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/a7281d34e4c86b05b0b31b51c1f4b64ca561e283 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c173198179e9cea12e5d42b1d727f21d5e86ca5a | ORPH
  aarch64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/9018422729ca408c5785ef8a3fd5346126d754ce |     
  sparc64    |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/e87c5073b9cef826962e28fc97a5c4543549ef82 |     
   mipsel    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/6e01d3674c57b092db5a429b0c451c04e167756b | ORPH
  riscv32    |         uclibc-1.0.48          | NOK | https://autobuild.buildroot.org/results/12484a63a4d30786b1209132a2b99966550d7858 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  linux-6.10.9 | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/27a637da086422ca1652405899eadbadc6079264 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e185fde459be3da517b2805d54a5bb2fce03f0ce | ORPH


Gitlab CI results for 2024-09-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921314939  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315011  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315017  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315026  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315047  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315136  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315187  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315217  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315233  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315238  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315245  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315248  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315252  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315269  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315272  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315274  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315368  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315440  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315449  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315452  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315455  | ORPH 
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315504  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315505  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315508  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315539  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315544  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315561  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315565  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315635  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315649  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315654  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315657  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315669  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315685  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315688  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315717  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315719  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7921315722  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
