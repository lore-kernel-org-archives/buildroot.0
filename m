Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B6EC4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 04:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 443DE613BF;
	Fri, 26 Apr 2024 04:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDakqxBhkTAk; Fri, 26 Apr 2024 04:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DDE5608D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DDE5608D2;
	Fri, 26 Apr 2024 04:06:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2B541BF3B0
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 04:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA084833B7
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 04:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UzXu50yaAth for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 04:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5455B82F57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5455B82F57
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5455B82F57
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 04:06:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37B7BFF806
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 04:06:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 26 Apr 2024 04:06:27 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714104387; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9cMk0SZ4f9GRzWbbxPftnH6PNRrd1/iQZvrZBU7wXuQ=;
 b=L5YKKiv208ic8YF2u64qmx5kcTmhVYqBAGhz0roJhtbpH1ZGcfs5y8p/xHBLIRuTci4aJo
 zs9E0aaTk5RSMjEEBpiUtelpdzKScuC+e/HaZaVlEad7Rc55+55D4HYVBzIylOsi0HADSN
 WFurlOH4sbtw1+ltMDlX+qkSG0iZWSq176Pzg0ZhNdpa9nUWRNbxSTMksGyEP2R1eLepa0
 IrnHJYkrwRjvHo/H73YwT5AU07+oiu/4ki7CooCW+JC1AFSMfhio/ocrRwUB4PXLXl9fk+
 qDn8ESsV574Xo1Z6FuI/BHJZ2ZY3I0oWr2Akt5yckqsXju6qyCiTs73Cylr1cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L5YKKiv2
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-25
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>
Message-ID: <20240426040627.2oH1IhVd0xbGHgkft34FhBAwcOjLhEAl1oRy4_-iRYA@z>

Hello,

Autobuild statistics for 2024-04-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  5  |  0  | 10  |
    master   | 26  | 24  |  0  | 50  |

Classification of failures by reason for master
-----------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
                     mdadm-4.3 | 2 
               belle-sip-4.4.8 | 1 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-4.4.4 | 1 
  gobject-introspection-1.76.1 | 1 
              gr-osmosdr-0.2.4 | 1 
         host-gcc-final-12.3.0 | 1 
               ipmitool-1_8_19 | 1 
      libabseil-cpp-20230802.1 | 1 
                  libbpf-1.1.0 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
                librsvg-2.50.9 | 1 
         python-remi-2022.7.27 | 1 
            python-scapy-2.5.0 | 1 
                    rtty-8.1.0 | 1 
             stress-ng-0.17.07 | 1 
                sysrepo-2.2.36 | 1 
                       unknown | 1 
        util-linux-libs-2.39.3 | 1 
                 wolfssl-5.7.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/bfb43ec6188167adeb47e7670d93f8dda52f854b |     
    mips     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1a240ab1ac980e9bcc2c73a823bd0bb0d4116990 | ORPH
    i686     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/8b36ab08ae64548a7a49b75e75d9a1efc9ac4c65 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2f9ba529dae3088249b7fd8c5e638af2078337a8 | ORPH
 powerpc64   |        gr-osmosdr-0.2.4        | NOK | http://autobuild.buildroot.net/results/b60e339e52fbc7ed7607a94381aaab6ec64b7a99 |     
   armeb     |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/c90fcf3777ddc31b7c9097d7fba4a611dcd983ac |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/657a1f83a586bad4db92f6726111585f44a8ad7f | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4543b9f649757706f4b16eb6644b62f5e3adb791 | ORPH
    arm      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/fd0300dbe66b7217c9bc65cb5d806a7f7b32666c |     
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/5e3c84f0bb99a117847d3f56c9e66741b46b8cf7 |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/9f64b2d27f4f8376b55c890ce6485d9ff8185574 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/27a5c5d7e323322b889d421feb9359bfa93c390a |     
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a4652013e6daa30c4136d20a949952b3b88b0029 | ORPH
    arm      |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/30deb2927f97c6a16280e3bf98ef3795c97b11a4 |     
    arm      |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/4c7118e70fae6f5f5aede527fe96c1ddfcca378b | ORPH
   xtensa    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/eb0d390cc11e174c6c57ccdad14270fefc8f7ed1 | ORPH
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4e5976195a8f1d16f639f22f0a31e7bebc8fb4d0 |     
  aarch64    |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/5b17252d958acb5178478edffe443d4d99708da3 |     
   x86_64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/b5898383ebdbc631d00c3318207721dfe67bc6a5 |     
    m68k     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/af0c5af36c3be86825062f6be720926393b2c4c8 |     
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.net/results/b31b70d62bb48b7e98acb9bf20704558cd2fa281 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/fec7782b4bef131f43251f76bf2032d3773a7376 |     
   arceb     |     util-linux-libs-2.39.3     | NOK | http://autobuild.buildroot.net/results/5b543a5bcc08ff132417b054714ff34555a26018 | ORPH
  mips64el   |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/9970505991f3beb54c6360948a61d187232779fb |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.2 | 1 
                  linux-6.6.22 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9c0e0160978ebdc89a48c421fe1ac91351652504 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2c08a9d9e9a17ea665d0d9826d5cd0bfc1c43ebd | ORPH
    sh4      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/9be7e0c8e1b3432d3a2730425670f34553328ac0 |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/364ee7faa55d453b376a63117a8e6f29112b351f |     
   x86_64    |          linux-6.6.22          | NOK | http://autobuild.buildroot.net/results/f7d3eb79c0bb7c78cafb041d4ca5e144411eb4c6 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
