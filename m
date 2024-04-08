Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5633CD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 01:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B73981B14;
	Mon,  8 Apr 2024 01:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkoupxmpalWU; Mon,  8 Apr 2024 01:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4CEC81E12
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CEC81E12;
	Mon,  8 Apr 2024 01:39:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D89801BF2BD
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 01:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2F9581A23
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 01:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqQrSiJ84xa8 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 01:39:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=matt.stav.taylor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B3A2819E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B3A2819E6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B3A2819E6
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 01:39:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-343bccc0b2cso2863135f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 18:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712540360; x=1713145160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XjHXcKWwhPyHQStnEdTUvRF6ctKcREV2nYrs8R8cb3g=;
 b=w/Y1icjWqOK9TtSOqsKZKhcnL/WzF4V1bT+Qhqwy+eomwkHy1JiMniiQGPhHFYku38
 VmlyDzuDkz2pYHGU5xNSrazU48i+jBedG0D5K8YeKXKrB6B3RAoYx5x5oKi3oMASyky9
 XwERqSlhUo4wRFx4aJz+2HzQVjmnNmzYSZmNei7NI+UayBtuaeg+xcP/QCq0oaDdsApC
 3/7xvFEDOOlfCkogFMLHgbV8lIy4wzhBi6B/Q2XeMC1zVUhG49okdsYPN4ZO4B25FfdZ
 UZXqj0JmONElFmcE/Pi3LDc/hUIljntkKFBqmUvimmpfbrcUmG6U4wJsMShuqS47Ekhc
 +ljw==
X-Gm-Message-State: AOJu0Yy37QPDzTF2Pa+44pzINOsAP2nEBU1A2yOKhV6GVNMPxVUiXZYZ
 OkuZc9A/Vsv6swmJR5GVEFuHmp6HFv2rCU4dHBBmG25lKtRrQHQlZy9n5uKeMGg=
X-Google-Smtp-Source: AGHT+IEuvbVpn3Zck6Be+E6C7n0xif25Xf3EivfHt+SfKwyGiM6n9fdWdK+NHUamEM93Wb/3SDenVw==
X-Received: by 2002:adf:e611:0:b0:343:9e93:11d3 with SMTP id
 p17-20020adfe611000000b003439e9311d3mr4818808wrm.54.1712540359882; 
 Sun, 07 Apr 2024 18:39:19 -0700 (PDT)
Received: from arch-linux-pc.home ([2a00:23c4:b436:9101:9ba4:f365:9eb6:5e88])
 by smtp.gmail.com with ESMTPSA id
 m28-20020adfa3dc000000b003435e1c0b78sm7784068wrb.28.2024.04.07.18.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 18:39:19 -0700 (PDT)
From: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 02:38:43 +0100
Message-ID: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712540360; x=1713145160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XjHXcKWwhPyHQStnEdTUvRF6ctKcREV2nYrs8R8cb3g=;
 b=WFODUjiF13yRYhCjRw11f6HPQtjwAE78hPxYZaOfI1LOzzSnEV/4GcKXSAgqfL4UUL
 lklgoiBBLT6SNRIVA1ySqF1DnV494+anBWHS8ns2b1pIQUM3oitrzlFVs1+aGi0HqHYq
 U6ioE84+foL0lkz13a2hE0nzGTaAT+uaHVRPI9/Ja33b4efR1LATuP5XjjXfJMpvmi4v
 1y5J2pdkmIcT3F1dzrg+zGvwBSyP1bU8mfDDLABtc5hHMU3i7RKxn73Q7PG1slB/oW8t
 A2rZmvyOxHdNf6CYKDw+Ny1c0P/fvh/nxCtZcujkgX7B0EmnHsZ/4SXrqaIqftUdB6XM
 HaEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WFODUjiF
Subject: [Buildroot] [PATCH 0/2] Add bcachefs-tools package
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
Cc: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds a new bcachefs-tools package: the userspace tools
for the bcachefs filesystem [1].

The tarballs are only provided with zstd compression, so we first add
support for decompressing these in the package infrastructure.

Note that this does *not* teach buildroot how to format bcachefs
filesystems, as bcachefs-tools currently lacks the ability to do this
without root privileges (see [2]). I have local patches ready for when
this feature is implemented.

This package depends on host-clang to provide libclang, which is used to
generate C <-> Rust bindings. libudev is also required, which means
systemd is needed. Unfortunately these large dependencies seem to result
in utils/test-pkg -p bcachefs-tools -a reporting all toolchains SKIPPED.

(Apologies to Thomas -- re-sending because I wasn't subscribed to the
mailing list and my mail was rejected :)

[1]: https://bcachefs.org/
[2]: https://github.com/koverstreet/bcachefs-tools/issues/164

Matt Staveley-Taylor (2):
  package: add support for extracting zstd archives
  package/bcachefs-tools: new package

 Config.in                                  |  7 ++++++
 DEVELOPERS                                 |  3 +++
 Makefile                                   |  1 +
 package/Config.in                          |  1 +
 package/bcachefs-tools/Config.in           | 26 ++++++++++++++++++++++
 package/bcachefs-tools/bcachefs-tools.hash |  2 ++
 package/bcachefs-tools/bcachefs-tools.mk   | 23 +++++++++++++++++++
 package/pkg-utils.mk                       |  2 ++
 support/dependencies/check-host-zstd.mk    |  4 ++++
 support/dependencies/check-host-zstd.sh    | 14 ++++++++++++
 10 files changed, 83 insertions(+)
 create mode 100644 package/bcachefs-tools/Config.in
 create mode 100644 package/bcachefs-tools/bcachefs-tools.hash
 create mode 100644 package/bcachefs-tools/bcachefs-tools.mk
 create mode 100644 support/dependencies/check-host-zstd.mk
 create mode 100755 support/dependencies/check-host-zstd.sh

-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
