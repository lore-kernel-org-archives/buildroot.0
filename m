Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09462EDE987
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 06:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A4B82214;
	Thu, 14 Sep 2023 06:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A4B82214
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIMhM0ht4_nb; Thu, 14 Sep 2023 06:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AE7D832EB;
	Thu, 14 Sep 2023 06:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE7D832EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ACF01BF2E4
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 06:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6B7F41DCE
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 06:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B7F41DCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moq1KZFvGhUR for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 06:34:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0647F41D9C
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 06:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0647F41D9C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 360BEE000E
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 06:34:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 06:34:10 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230914063414.C6B7F41DCE@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694673250; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JnFh33INgXJ+hi01SEuBBIpBpQiTZvSY5DFozebbbM0=;
 b=Nrpn70qOcSF/Yp8pCX8IxavqMoSXhIeezcTfjCq9qCUWB0+uQazipV/Ex2T8xsfc10Lsyk
 8WYECI7sV66xKRiLQgxwXKDLv+EPUSZ++Lw0zZsicKGUY3qWzR7WF5MIyUHLITpJRKpoh0
 sqndPpWnFsxGEmFB6wl1qoQXVH2KE/7a2E6Oxc07YKA6MgtA/WuCQuyTe5hrWARh+mi9Ig
 euv6rfd9CiY/s0V2lm4JJ2gW0YUdr06/sjbB93So0Slp7MpYlFSdEXhufAfCrgxMKYk8pB
 1h5YuuOthME2LSRhydrTMXYCNI1P5Y6cBK/vsap9yKFaQ/b23cAzawCgwiRYuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nrpn70qO
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-13
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

Autobuild statistics for 2023-09-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  3  |  0  |  4  |
  2023.05.x  |  5  |  1  |  0  |  6  |
  2023.08.x  |  4  |  2  |  0  |  6  |
    master   | 39  | 27  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

              host-rust-1.71.1 | 3 
                    crun-1.8.4 | 2 
                elfutils-0.189 | 2 
           at-spi2-core-2.48.3 | 1 
             batman-adv-2022.3 | 1 
                  boost-1.82.0 | 1 
                host-go-1.21.1 | 1 
        host-sentry-cli-2.20.3 | 1 
               host-wine-8.0.2 | 1 
           janus-gateway-1.1.2 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.4.14 | 1 
               mariadb-10.11.4 | 1 
mmc-utils-613495ecaca97a19f... | 1 
                    ne10-1.2.1 | 1 
               openblas-0.3.24 | 1 
package/libspdm/libspdm.mk:... | 1 
                     pv-1.6.20 | 1 
                       unknown | 1 
             util-linux-2.39.2 | 1 
               xwayland-23.1.1 | 1 
                 zlib-ng-2.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      at-spi2-core-2.48.3       | NOK | http://autobuild.buildroot.net/results/8ed98017149881b5d5c19ffa86dba2146319050e |     
   s390x     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/52972904bfe11db1b0901bd57977b60d595e3a5f |     
   arceb     |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/f5f828b2012f9da15403282fd12fbeb7f033708c |     
   mips64    |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/217bf6a02f2c85d049040d16919cfd8e7a34e0be |     
    or1k     |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/a947f9c3263ed09679ca86d0416d82447c9ce83e |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/845656541fd1b3593ad171e57da1d0930909af0a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/824028853aaebdf3f696a99c0fbca1f385f3b1c6 | ORPH
   x86_64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/4e01369acf47225e59d8f4472e3c1cd746cdec02 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8cb2f9832bed75265b7987bab756caa88621f943 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/34cf23096523b3f50ae260f63a8a5cf189935210 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a399683730dce897d9053e08bc7160903d8b9062 |     
  riscv32    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ffca9aec03e9e70a1ec17b9f41fc811e3ae01482 |     
    i686     |        host-wine-8.0.2         | NOK | http://autobuild.buildroot.net/results/c70e61c4df37af3837c569d4caeae62ca685f700 |     
   mips64    |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/ec5d60f2231fa794447bff3510b2b28708ec8f4f |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/840652ba702d01e4408450194c565f47a7ee1d1e |     
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/bdf03ce6e2f49b0ce0ff0e59411d37680843508c | ORPH
    m68k     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/14f424b1911dd57e2de0b85d11b9256313d342cf | ORPH
   sh4eb     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/1a5046951c74c8b88ba791211d9dc410add67c6b | ORPH
  sparc64    | mmc-utils-613495ecaca97a19f... | NOK | http://autobuild.buildroot.net/results/bcc0790d0d762abafde10ef4399f5e437816b993 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/5df3abbb43f59f22c49320d4dbfa10bf89403594 |     
    i686     |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/e1e2034a78799abe1bd28b036fa6f7d13322e42f |     
   x86_64    | package/libspdm/libspdm.mk:... | NOK | http://autobuild.buildroot.net/results/b34401cd9b80eb71045e5a51b6518360900d2a7f |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/c5241a437bf19d892ed0172a445ab766b20fc5eb | ORPH
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/e3ea103d00a1ba828705e952eca7b24e90b1ebb3 |     
   sh4eb     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/04e37a095ae9bc577d6da7e54b214c3a94e5232a | ORPH
   mipsel    |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/92b0b638eb00130a235952929a897cb81330c800 |     
  powerpc    |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/0618bc0dbcdf837e9c3c21493d14dfd11d15e77a | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  linux-6.1.49 | 1 
            ocf-linux-20171122 | 1 
uclibc-ng-test-6790eafe897b... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |          linux-6.1.49          | NOK | http://autobuild.buildroot.net/results/dbc68db8907f6295e079a2db08d12eb214fc0455 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b8dcc50d4ad4f4f82dc187529ad0d244dd7ed695 |     
  mips64el   | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/dd149a32be0a0edc4c7ae82669e8d599fa8c0a9e |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                  libsepol-3.5 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/f2d52a368ef558d6c4b839acea292db3e6e9a1e1 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 2 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/fe34208f7010b22b4d8b613babb6deb6032d7830 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/7455834fe64c3e058de71b8ab3a18f5e75937559 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
