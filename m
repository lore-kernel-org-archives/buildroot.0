Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE65BEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 04:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8B808392C;
	Thu, 22 Jun 2023 04:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8B808392C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEP1Fq-d3EWf; Thu, 22 Jun 2023 04:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A6883123;
	Thu, 22 Jun 2023 04:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A6883123
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4401BF425
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 04:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EB3060B23
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 04:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB3060B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwOyyg23Rvvk for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 04:46:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7660D60A8B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7660D60A8B
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 04:46:13 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25DFD60009
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 04:46:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 04:46:09 -0000
Message-Id: <20230622044615.3EB3060B23@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1687409170; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JTviavVuBUvqO9Fk6pOuv1jcH0KyyJk+WGfzdNOm7Ys=;
 b=DpatQadSIVb9qIho/Kyfk2vPuEBCX4SH5BumnN30IV+8jVwKfIk/FiGzZllYlokHhasxpk
 y+SplMY3lo0MIkeF5Meh5D9duQOckS1llcxpFn2jpZWxPU7rHAq60WV1e+wfL8b5r1ZBPc
 YraR0My91i9Yd4VKt4Uda4SvqKe4/AZ12m+iBn3rtOdQpvycjBAjwWlJfbb4SIPQjlrUys
 +A5DxtlVayO6n5e/M6bfwUQ0CWOea87jBBWtwEfhaaDoiPPtnljSXRCKlkvPUfatFWA7or
 8yYyZpuYGI1F3tsU4Ji+d6/4Zte5t588RJ/r7w8KbZKsvx50u8NPmFopZNxeGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DpatQadS
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-21
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

Hello,

Autobuild statistics for 2023-06-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  6  |  0  | 12  |
    master   | 18  | 25  |  0  | 43  |

Classification of failures by reason for master
-----------------------------------------------

             host-ccache-4.8.2 | 6 
                   gupnp-1.4.3 | 4 
                 raptor-2.0.15 | 3 
                  check-0.15.2 | 2 
               libglib2-2.76.1 | 2 
           at-spi2-core-2.48.3 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
  gobject-introspection-1.74.0 | 1 
          libedit-20221030-3.1 | 1 
              libgcrypt-1.10.2 | 1 
           python-pyicu-2.10.2 | 1 
                  reaver-1.6.6 | 1 
                    strace-6.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      at-spi2-core-2.48.3       | NOK | http://autobuild.buildroot.net/results/cdd14a9a6976d302657935f3860382676bf2cde9 |     
  riscv64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/100a751f55593e330671d1973d9d2f67921b6977 | ORPH
   arceb     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/44f3fb85bbb3c4d2b475fe24324d8e27cb93f825 | ORPH
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/115b78a626677ecbc20d383c448b87f8b527aa20 |     
powerpc64le  |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/2183b7386f892f561f360d2d8159df91e0d4e868 | ORPH
 aarch64_be  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/993be689d3c03e7d2c2a1fce020da95190bb9a1d |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/b267c4137edebc504757b6275824c748cce3d894 |     
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/07920e918e1d3cf082798c7d9e1a05ba3e101a36 |     
   sh4aeb    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/8b0f4f1f5b9c04af81f6926d71871cd0208b0b28 |     
   mipsel    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/2c4bd6540d30aec61347475e66fcd17fcb34e906 | ORPH
microblazeel |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/74d845c06f9665fc71dd5a5e5f441b0e630c0dc6 | ORPH
    sh4a     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/2b7c6ffcf277e115863b65711ede22d72b97c2d2 | ORPH
 microblaze  |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/18de76034f53b160aabe7d2adbc099a5c9998473 | ORPH
   s390x     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/d0d51733b0be3e652d12a143a0a885e03a539f3c | ORPH
   xtensa    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/52691a2bd770fe2f8d09a36f8f9ba66caa07c045 | ORPH
   sparc     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/8b1541ee1c4f21a45a4b9fc3b6c5a16e2162cee9 |     
    i686     |        libgcrypt-1.10.2        | NOK | http://autobuild.buildroot.net/results/f2b0c5f1004ca8d77ff6f17581cce74b0e835cf6 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/eb2e356a09d26a3c7d93ff38f3e19ed51785bce6 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/68de9d0d979d387309b41908cd61e7fb30a84832 |     
microblazeel |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/45aed24ba6c0260804e063d5a5d9ff16ba0b36a3 |     
   arceb     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/6a5139fe86b8370477dc6cb044bf29180bd145df | ORPH
   nios2     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/2e3c7b8052e01f0c4b855d86711e7a49e29e220b | ORPH
    m68k     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/277e3abe7b7c6358a3da959f8359b78af007f5f8 | ORPH
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/b735768e8ef4a5800e4f650c0660d3db3a43d526 |     
   x86_64    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/9811b70b2da4cc1a54da0c8865f2cbd21dfd302a |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.72.0 | 1 
               host-go-1.19.10 | 1 
              host-rust-1.67.1 | 1 
               libglib2-2.72.3 | 1 
                tinifier-3.4.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/372848cec915d7d63e168efc15d04c433fd22df4 |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7fa22c0f0cdbb3409cf1313d589dc89fb2f9e6a3 | ORPH
powerpc64le  |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/d853f2c4b80a1a38bfd3ef46836b8c542ce00571 |     
 powerpc64   |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/2b45316abcd58511d07495eb18eb8f76e11fcd6b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/75a73c2a087896b512f541b96d871e7df6d85f09 |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/0ae4c148bd4dd1aff84357e1a1e355c1bd653bdd |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
