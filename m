Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646FFC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 06:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2CD361B28;
	Thu, 30 Nov 2023 06:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2CD361B28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWBvQAzlsp8H; Thu, 30 Nov 2023 06:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC83061B29;
	Thu, 30 Nov 2023 06:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC83061B29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4C981BF385
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 06:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64980821AB
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 06:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64980821AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7N-mz14EHtlP for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 06:37:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B712821A8
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 06:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B712821A8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2989820002
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 06:37:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 06:37:34 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231130063739.64980821AB@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1701326254; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d7UHZRy/PcB9z1kWj9EUWiCXd916nMN/v9OEw3Ut1eM=;
 b=hak2+MohCoXEIpC22HV7ZLkeFuFCkazP40cttiwEOiDeu6Hc1g0AAJPHz4i19if5NSQlJW
 lxAcPzafBEc5YfOlVsykf01VrYowwYC/TkIcg9ql+ab/WgwO8TaQsjZACyheQnVNnfmkYy
 a3s3my0foBd+NikvqGY4qEzKto+lS0Qb+JUt8t3n93RTE14iRmVsR4H2k1GmVYkAhBRwsY
 ZJhGkzcuvErliETUav92hxPOuIN37ft63G7yosvg7wjZqS3vtp6rPo2KZoh7/Jtw63DUFN
 fQBXJPp+XGggS3Ekx+uG3fKzg+XvviRaxZxdcEFC0WhOPj3CWVVlTk9VuWxeew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hak2+Moh
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-29
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

Autobuild statistics for 2023-11-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  1  |  0  |  4  |
  2023.08.x  |  2  |  1  |  0  |  3  |
    master   | 52  | 38  |  1  | 91  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 3 
        host-sentry-cli-2.20.3 | 3 
                libressl-3.8.2 | 3 
check-11970a7e112dfe243a2e6... | 2 
           dmraid-1.0.0.rc16-3 | 2 
              host-rust-1.71.1 | 2 
               libglib2-2.76.1 | 2 
                       unknown | 2 
                    brltty-6.6 | 1 
                     criu-3.18 | 1 
                 dc3dd-7.2.641 | 1 
                        ffmpeg | 1 
                    flac-1.4.3 | 1 
glibc-2.38-27-g750a45a78390... | 1 
host-go-bootstrap-stage2-1.... | 1 
              libarchive-3.7.2 | 1 
                libgdiplus-6.1 | 1 
       libzenoh-pico-0.10.0-rc | 1 
            linux-fusion-9.0.3 | 1 
                    ngrep-1.47 | 1 
                    php-8.2.12 | 1 
                     pv-1.6.20 | 1 
           python-bcrypt-4.0.1 | 1 
        python-pysensors-0.0.4 | 1 
                 systemd-254.5 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
           xtables-addons-3.22 | 1 
                 zlib-ng-2.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/6eaf4454d259ec9d1e374e42dfb658f9343cca79 |     
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4e5ffd4476f97b86976cebf92c05235356536c73 | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/e0d841d6ba403bc57e396fe710f10afbdcce5ac5 | ORPH
 aarch64_be  |           criu-3.18            | NOK | http://autobuild.buildroot.net/results/2f69af218581254b85a5ad5f026fa2dc648476a3 |     
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8c281437aca408662fc22b1794b74016a8102f81 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/a2f81b033016ce9bec5b4f0fbe78609fd73e4370 | ORPH
    arm      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/1457b5a3b228202838ee8fa9cab2e4a91089cbb1 | ORPH
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/e017b47300120aec717e3853c75a7904f7edcf13 |     
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/66b89f1a5680c06f3488a9e1c1d6ad9c70a62b1f |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/611338011f9de200d5eb4656318bf156bc9c1121 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e8f11ca63506dd9e3ad926c002d46bced5030c2b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/97f468fe720dc64d6de299f7d9379c773b2e15e7 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4c8a0788583cd3c334f917e50c5cd7161d9e1542 | ORPH
    i686     | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/83424fe66d077e072d90d666fd5a113d76b0322e |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/cd35496bf0ba557bdd60f960dcf20112d42fa68c |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b6c67b98d77e6611039fa8b2d2f151f44adc4000 |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/551f0aa6fff1951c57987816a2835eed5d789883 |     
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d716dfdeef0940f5a59e53bdc5e109966f161b4f |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/0bafa5bb073d84327feee3764bef2afb8e9defcb |     
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/fde3ae7eb3bf85b7166a34ec2c4e5306eae299ba |     
  sparc64    |         libgdiplus-6.1         | NOK | http://autobuild.buildroot.net/results/71c0b9c8b278fd9e81ba577163acdec4d5ef810a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/acd14f976f210653bad1369f33db61623f5e51fa |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9545525b749edf10f431ea68ea3a9c117840d122 |     
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/cb66d1966a2e3a412bed243b98eb7a5c63dec968 | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/f628fabcd0f27bb800069844e55e1df38e9ba40e | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c516f0cc936b5146c561fbc1f40fe8a20d873a70 | ORPH
    or1k     |    libzenoh-pico-0.10.0-rc     | NOK | http://autobuild.buildroot.net/results/663b631810b7e3982f35539f5d388cf5e5090654 |     
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/cf1b3aec457891183a8daaeea995560ee74b6755 | ORPH
  powerpc    |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/e7aca4f0d0d0c1938725b6dea75865867fde5964 |     
   sh4eb     |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/e04d02dd3b707ee3df9075ff941099899b4f82d3 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/0cc9680dbee308628f74587d9f0bf8ae96c6741e | ORPH
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/88433dd7856b360c3a1d18396a55445842e801a2 |     
 powerpc64   |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/5763d28327e456549327ad930189e1cedeafcdde |     
    mips     |         systemd-254.5          | NOK | http://autobuild.buildroot.net/results/40d42661544062325abcf02882037829d75aea26 |     
   armeb     | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/df0f5ae4db45cf448677233e946e3dae54d83ab4 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ffbb76980846db55ade8cfbf940d20da0a22c013 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b5f5a02b174cce0cc1024001682cbdb3b4d16c04 |     
    or1k     |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/0191ee0590c08b73f17b35a5c8521796693772b5 | ORPH
    arm      |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/1551aa69be19239a8d8e081f033e4027d679ab8f | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/a8fcbd5e5bda1c8c0b486b6bd11cea510c8d1e56 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                  linux-6.4.16 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/f9c119dafa979554a2519fbe417f735cad3f643e | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
