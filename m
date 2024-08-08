Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F42FC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 04:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E55406EB;
	Thu,  8 Aug 2024 04:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmvYcfaA-6e0; Thu,  8 Aug 2024 04:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A041404F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A041404F9;
	Thu,  8 Aug 2024 04:42:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BC7B1BF317
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 04:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4869440BFF
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 04:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kc8MKSsCiGhS for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 04:42:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED5D3401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED5D3401C2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED5D3401C2
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 04:42:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D7C0E0003
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 04:42:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 08 Aug 2024 04:42:40 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1723092160; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t+Xs6RJZOikUu6Gjk5CUn8Jzsmxan7x2ZOGC8W/iq+8=;
 b=PuMbOmuHAG2Y4Rfib9u6lRV0EUJkj6zbwxtVWm//20ADhVWkU/jUjD3ww2OzD0GGlXuQd9
 ISDJx4hd43wcZLCWoM8Wr3UUvBvM1tLmUSmlgwH6GETrmhxfabNH2e6b6xRblXSP56f0ZD
 qzzdE/ujq1kiPCUz9MImC56Fq4g5a43myID/uRpELaOs4ot34OT1m9a1yE+vI6XyCcyjJo
 UcU8Dj1gkTLTqJZjODwWIyE3U2QNa9kismwgzGHqXobYBHSXGwhm9yjKyMNiY+IUWuWegp
 oNoxM5cO2AqrPLKuuiBFFyR5PUxP4NeuKRd3V+iyTKgPeNTVre6kl1j/5ptBGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PuMbOmuH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-07
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
Message-ID: <20240808044240.zO6MA9Hv-nhpDu8U97U3CkheAxTbk-UGgSLWViwHJU4@z>

Hello,

Autobuild statistics for 2024-08-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  7  |  0  | 16  |
  2024.05.x  |  4  |  3  |  0  |  7  |
    master   | 18  | 49  |  1  | 68  |

Classification of failures by reason for master
-----------------------------------------------

                   atop-2.10.0 | 5 
                    norm-1.5.8 | 4 
                  ffmpeg-6.1.2 | 2 
                gnu-efi-3.0.18 | 2 
                  libsepol-3.6 | 2 
      python-autocommand-2.2.2 | 2 
                       unknown | 2 
                     avahi-0.8 | 1 
              cache-calibrator | 1 
                  cairo-1.18.0 | 1 
                 coreutils-9.3 | 1 
                         flite | 1 
              fluent-bit-3.1.3 | 1 
                  fwupd-1.9.20 | 1 
                gerbera-1.12.1 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                 gnuplot-6.0.1 | 1 
             gnuradio-3.10.7.0 | 1 
  gobject-introspection-1.76.1 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
             host-delve-1.22.1 | 1 
                   host-go-src | 1 
host-heimdal-f4faaeaba371ff... | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.79.0 | 1 
            host-skopeo-1.13.3 | 1 
                  libffi-3.4.6 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20240524 | 1 
               mariadb-10.11.6 | 1 
                 openssh-9.8p1 | 1 
               procps-ng-4.0.4 | 1 
    python-cryptography-39.0.2 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
             sofia-sip-1.13.17 | 1 
                      x265-3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/5893964e9dc8e0f2a6b9659db642a8f436734cf6 |     
    i686     |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/3fe8cc11b48ce2a9719bcf5c6f41920e5b11d6f9 |     
   nios2     |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/cc662238e3c8024362c87d74ae5a524389036773 |     
 aarch64_be  |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/be99bd91f54e11e36b92f3a0e31b7fb2ab50c300 |     
   x86_64    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/22a30520f9f8b949b0f43a6c5a6487882486b318 |     
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fc86ce80e454ff3586074adddce8ae9291add5ac | ORPH
   xtensa    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/849d1fdcfa61fefe1c9f1fd7d8dd97452e1adfc3 |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7d82f68b46c0231d58c1276be0f67ded7345d643 |     
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/15fee49b0bccb92b132830525a31e78fae7c4ab7 | ORPH
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/dabc8d38836bc46a14f58442f919083642945b74 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/e727c350b994ed9e48fb35e854f2f2a59d0190c9 |     
  riscv64    |             flite              | TIM | http://autobuild.buildroot.net/results/c0e2c6d3a4652b15b2ff648faafca67e829d48a8 |     
    arm      |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/53af507872e79770fc6ded838c2156aadd508791 |     
   nios2     |          fwupd-1.9.20          | NOK | http://autobuild.buildroot.net/results/37fdab3004e8ce3aa1a6053888bce1cdc58c2086 |     
  mips64el   |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/97ac468922eb9bce694023ca35978559ae6a3862 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3daf4a4aed79e989a4b3cbec596233884fb638a5 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/43b8067075883637c33c64c282b1b5b32ad25c06 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0a5d28d60afd66f3e3f369a5fa923ab89f4d3b4a |     
  powerpc    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/5d21995796d7f1fb31a603c5af8d2c298eaca30d |     
  aarch64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/e4cc8ab3d86e1701af732c3de1c9a56162082174 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/66ad62074fcbcb36b271f42384e7cda2e9d14650 | ORPH
  mips64el   |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/9dda5c6038b3ead7785e20c092c804c9f7309a89 |     
    i686     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/178819b0b297fdbb3a0ea67b6dc788cae3700b28 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/62e82eed4934f0a8179311b089131e39f52ba50b |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/5dd7de583bb6f980513e614586d4224d4e8cc69a |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6567805606f0f55ef5d6e3883c1bb4e1026b9834 | ORPH
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/70716557d85190acace16352364c1c6163b628b4 |     
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/c0a3570737262e0772e2ee874d0b98724b5ea998 |     
  mips64el   |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/a77c6b4b6aa83588a3522b7e6e1b27624c504ea0 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3ac3d8e520c6eb011cb6bdf9f00072e90934a6a4 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/15ae594de73f80f6ff912bd5f527357f7737f5a0 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/bf94b161d5bd5c38cd6f4b6a1798bdfddb186f00 |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/400acd770fdb8e59d1fe8856efa266169c1f3d4e | ORPH
   xtensa    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/dd0503fb79a89b729190461c423269e017fccdc1 |     
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/d46fae7469ee96759a23b1688e76d23901159082 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f906252b288f284297c8a4359bf79cfb53aa73bd | ORPH
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c9a6ee0ccdb606ec87e706c56150c9f0f40b968f | ORPH
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/171e1a5691c77db9761ab3b853ed522ac6a45a2f | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2778808e656f64a469f41912c2ec7b82ff14e17e | ORPH
  mips64el   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/2ca4d928b1ae2fd2e4321318eaddd58a694727fe | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/39df41b4a73c175f2cfb994db08e75a334dab4fe | ORPH
    i686     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/0ecc93c7bfd15ab215db632dd344067851236d2a |     
   xtensa    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/87d5fd28762b0fddd8bb2461cf3b87ece68976e9 |     
  riscv32    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/6b5da93d1bb2cdbf2c12e06e510c585b40fc856f |     
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/032529dc5761e32a7ab135103f35f32f58e21673 |     
 powerpc64   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/c902754a3fc01b600692a4d7d9b88359c942b4d7 |     
    arm      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/5114bb9345c0e954b35b196ddb581ff92959bb0d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7829eee24930e44d1f53fb3e655b05d3443b7d1d |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bd5ce5523ffe5b19168324a05757cde444901af5 |     
    i686     |            x265-3.5            | NOK | http://autobuild.buildroot.net/results/5a0040e1a5e352fdc7a37ac268083466ad80404b |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                       unknown | 2 
               asterisk-20.5.2 | 1 
                elfutils-0.189 | 1 
                     frr-8.5.4 | 1 
                libressl-3.8.4 | 1 
           python-numpy-1.25.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/a3aceec6247a34f0a3f970e0eda99c5d31bbc55d |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5fd46af31e1474c536f75df07d6ce61784c1922e | ORPH
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/24ae511fdea72f1c03f98279825031424dd156cd |     
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/be93eb0792ebf631a9ad1a37f02ddf0149e136ba | ORPH
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/db1fd8098c5e9c46be401db2c5d89452bcc133bc |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/1808be1e72908970bc54a97f4b59dadabb794ddc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8eb912b1431edffc4e80d1f903d73705976eb489 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

google-breakpad-f49c2f1a202... | 1 
host-heimdal-f4faaeaba371ff... | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/6f2965a14334edb64b9029dc2ef6dd3569f598e2 |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3ada8bef09ce84c4f038468d8630eb50c30e4f0a | ORPH
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/687e1f226763f81bca062d75f0670ccccc56528e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
