Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB83CC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66CB640133;
	Thu, 11 Jan 2024 07:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66CB640133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pkF5pqYqxpA; Thu, 11 Jan 2024 07:00:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD2840538;
	Thu, 11 Jan 2024 07:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BD2840538
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5EE1BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E881182778
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E881182778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qFSfTYR5jUz for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:00:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F41578220A
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F41578220A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E383C000A
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:00:00 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 07:00:00 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240111070004.E881182778@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704956400; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QUnhqJRWhlDUM8Yr6jumyH7OmeHUqSkquJ/RSa8CZ/I=;
 b=DRed19DRswz0Lc3fKeZd3FDJKMXSSSLiB/nKx1DRQmhAzcE5yZqye/JjJkk9RiUoj5JWFC
 uyYd3RyVBcrn1btOIJr4uoi3/VTzIFhvz2wrGyQWaEKS+4siuAvKr6Swqer0GWd+8T65UD
 U6B1vV8QAwwWZ7g8sKX7G6W0ztzyxGSDQUa6klcw9eeHLwbhFmS6MW5as0lHzEiGyZQnzR
 EXIfnLA+WkupDpiplCpROWDvjf4VOgGhiZdFwtph7JPZqjCH0yj6cwzAGXjcY0IFiEOF5C
 Q0VcB6tM5wupaZbiyGiyyOE+tNOcVAnd/bvgQcaCvUaoGE+tNkCM5bFIKdq9rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DRed19DR
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-10
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

Autobuild statistics for 2024-01-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  3  |  0  |  5  |
  2023.11.x  |  1  |  3  |  0  |  4  |
    master   | 18  | 28  |  0  | 46  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
        host-sentry-cli-2.20.3 | 3 
                   exim-4.97.1 | 2 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.74.1 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
                  stunnel-5.71 | 2 
                     criu-3.19 | 1 
           dmraid-1.0.0.rc16-3 | 1 
glibc-2.38-27-g750a45a78390... | 1 
                host-go-1.21.5 | 1 
host-go-bootstrap-stage2-1.... | 1 
              libarchive-3.7.2 | 1 
              libopenssl-3.2.0 | 1 
                libressl-3.8.2 | 1 
                  linux-6.6.10 | 1 
 Makefile:727: target-finalize | 1 
                 sudo-1.9.15p5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           criu-3.19            | NOK | http://autobuild.buildroot.net/results/b0341d0654e66bdac2c91d5949be3810a961d9da |     
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/cf9841040e96ad170d90d981568569d5709abed2 | ORPH
   armeb     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/be40ccfd37ee94174e35fca6bc2d982956d73d45 |     
    m68k     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/4acea72f889eb5e1c750d7c1fddcd3586ebef910 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/b234abfb4e389aafb6434f584a96e50b2529c3d8 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/36d4c1727732e586ab765b2e2ddfb5faa2a812e6 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c96f37ebf3b523992cd4ae2f60c45114dd4192b3 | ORPH
powerpc64le  |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/afded52a9d8eb02ded8dc9542deff425452320b1 |     
  aarch64    | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/018560907fd57793f46809cc060229105ef42947 |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/b93dc3ce331f3cf6d2ec8041840a226c9815798c |     
powerpc64le  |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/7c1a87eb62579b526efdb4bb71f84a94cc655473 |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/dd069bb92e9b66c951db5c81e6112d22c69f02d6 |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/653d6b489c3eb1c37e80a5c704e546e127b43e59 |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/48f9043c67e76214fc034ccb220c2583acd3f391 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f22867e71dca64d4ab5fee4db39fe9b1899f4b85 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6f1ab825159e5145b06c8c13ccc82d238fb24b82 |     
microblazeel |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/76d43de56d91a4a6c315a876ced49fec554ce22f |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/5d4a913647dc29e19d4491ab0b31ddfe9ff30f05 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/97b89ae29e3387c993f48eb24fc8c86d789f4c57 | ORPH
   nios2     |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/f0515b5484d3bda5c01bc06eb59e9657ebd9e708 | ORPH
 aarch64_be  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/8de327c31f77e785f419ba04ce22d8354e91bf63 |     
   nios2     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/2782581a086742c231d459335473288020ed53ff |     
microblazeel |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/a11871b5e9c688607fcdb8d413d0581580dfb51c |     
    mips     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/2067dc3f566bb23950453e104a7964d48e7801a8 | ORPH
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/14ff6c0027ad0a2e0830341f6e80e6237f9159a1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/539b7e1840470ab4f494351a3b4e193902d3a985 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f2c93609b6b008482574b234c7a89ea25e09022 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/7e3b6c096d30116fb8d46c2571642a9c9b6c65b1 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               libglib2-2.72.3 | 1 
                 openssh-9.6p1 | 1 
           udpxy-1.0.23-9-prod | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/30332e9c5f272e7f65cb7b23fc1cba0826b0f8e9 |     
   mips64    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/1f9d5590201bfc12d8ebed1edebced4b05d81e83 | ORPH
  powerpc    |      udpxy-1.0.23-9-prod       | NOK | http://autobuild.buildroot.net/results/c859a77f2406aa15f9356ea7f22f666ad0822672 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                    fwup-1.9.1 | 1 
                host-go-1.21.5 | 1 
            linux-fusion-9.0.3 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c75e8cff462f163dd95d3c3c16efe950ca70ffd8 |     
    i686     |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/08ef3596df01ced169ccad25b13baa0b0dd098bc |     
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/93aa60876fa9614a73f17b58e67472267e2654eb | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
