Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDE8C10DCE
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 06:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AA9781E74;
	Sun, 10 Dec 2023 06:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA9781E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrZj3uT2QvQL; Sun, 10 Dec 2023 06:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C849821D1;
	Sun, 10 Dec 2023 06:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C849821D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05BB81BF86D
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 06:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFCBD60FF1
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 06:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFCBD60FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbhFFCNGzMER for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 06:44:25 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9B3D60FC8
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 06:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9B3D60FC8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 348942000A
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 06:44:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 10 Dec 2023 06:44:22 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231210064426.DFCBD60FF1@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702190662; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o1r5RQcEkDtKo7GFi3t6idwBFy2nGaMhFCGgabrkMwo=;
 b=mtqafJDfzZpoTUywRsDZyzNmnwu1ZeB3XB25Rv/yPTX1n20rnigef8clAUiEjMtZAVMNyk
 KOjftXMfUf+I20X809uX/7f2EhiKBc3l/+w/+NVN9/QhSSJHqx8qqE/slU/AXdtOC0PmY4
 5bm6PtJXbOxtmjOgFzjS1fUgXUjqbyAtbPZHN8Q9a7eFD8b01cFWsecvgDt4C86W/DqLnH
 DTHY0ny7QYjlP3uArk2U/B2QhV0F0xnArAgG+JkIYHjuHDf8vs74IWdnzK/qMTMxKTxoa+
 WryPy35TBfKRd7WyJJgH0+FsbnLFjJdYwNZS44VsyO/V0eOgEkdJBhyfuNBFeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mtqafJDf
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-09
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

Autobuild statistics for 2023-12-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  4  |  0  |  8  |
  2023.08.x  |  0  |  3  |  0  |  3  |
    master   | 47  | 33  |  2  | 82  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 3 
                libressl-3.8.2 | 3 
                elfutils-0.189 | 2 
        host-sentry-cli-2.20.3 | 2 
                   linux-6.6.3 | 2 
               alsa-lib-1.2.10 | 1 
                     criu-3.18 | 1 
          cryptodev-linux-1.13 | 1 
                 dc3dd-7.2.641 | 1 
                 dhcp-4.4.3-P1 | 1 
fs/cloop/cloop.mk:33: /home... | 1 
         gobject-introspection | 1 
host-gcc-final-arc-2020.09-... | 1 
              host-rust-1.71.1 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
                libselinux-3.5 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
                         mimic | 1 
                    ngrep-1.47 | 1 
                    opkg-0.6.2 | 1 
                   perl-5.36.3 | 1 
                    php-8.2.13 | 1 
    python-cryptography-39.0.2 | 1 
                    qemu-8.1.1 | 1 
                       unknown | 1 
               xwayland-23.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/55ba991a7dbb8e5b84fdfea6cdde838fc1fdcfd9 |     
 aarch64_be  |           criu-3.18            | NOK | http://autobuild.buildroot.net/results/6377f52d34e1f0939af54b2665f98c1b6a4a76de |     
   xtensa    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/4e21c590633d4a04d4275b4e060ade20081bb5cd | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/89233a7324c448d8e666e3ac9138ab3a1d036d9d | ORPH
   sh4eb     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/000009c2969b83f572c4fb34ed96e25ea657b66a | ORPH
    or1k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/12af36e65c2f34452b56a1a021a8cc94f4a75a9f | ORPH
   armeb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/20108f915ec48bbd77ec4e104248509232e61d97 | ORPH
 aarch64_be  | fs/cloop/cloop.mk:33: /home... | NOK | http://autobuild.buildroot.net/results/aebd6f03288e4f29752a3b927f1668f007276cc0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9f8e2aececc0df0fd302504e8917634207dabadd |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d4cb365d15ad9a580c93fdb10c8469799c17f26e | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ec0ab227c7da0d0bb25999727533bef8f93b0ace | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/029bc353294a14fb92c0910ed757fe58baeac44e | ORPH
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/ea78aaff94852b2ff12ec73625753efdcf95cf55 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f93b067cdaec347cd029f670baa96a3a4b480ed3 |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/c7e0684bd04383b5cc157d59ebb6074299f8d960 |     
  aarch64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/e5aca83973fa3ba6f7c65c4cdb54015a59dfd649 |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ae3bbc88369dba305c143bb6994432789cdb2bf7 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/721482d9ed1d19a68fc6566bff4329b7ab1e1c9f |     
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/89a229a5a9e9b62c1b26b75277e02b71ea147e3b | ORPH
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e33b600f5c495c60129bf90920ade56c98bd2c58 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0fd884c4e5ab9ae3eb1ce900feeb0110d9b00164 | ORPH
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/a40cae9ed7ce3d0d917b9cceb514352d8f32c7f4 |     
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/4acc9b79b3fa1a55489751355d220cdd517dc906 | ORPH
 powerpc64   |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/2f1b4ff4f68f0c860c8cb5855e32a712c3013e53 | ORPH
    mips     |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/1aafd930de3a8dce35ae22f316aba964dcbff602 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/92ef708a37d1feafa976cf116c69cf64c6c34593 | ORPH
  riscv64    |             mimic              | TIM | http://autobuild.buildroot.net/results/184e59da5a14057be2cb38a8cbec27d6564b4b0e |     
   s390x     |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/5ea1bc1ff328e96a0d3e59cad11eb2938cebbbe6 |     
    arc      |           opkg-0.6.2           | NOK | http://autobuild.buildroot.net/results/8416c5e6b5c7337ba5def043327e028db9c31a94 | ORPH
   sh4eb     |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/efc514561cd03b04e65cc40f2bd52bc8ee20fa86 |     
    arm      |           php-8.2.13           | NOK | http://autobuild.buildroot.net/results/8952d647d799129862d879828c54295642a7e633 |     
    mips     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/0ce2ab76648918e48536d82a0bcfe6eed9acfb33 |     
powerpc64le  |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/59954bf509ef412de75fb7cb76b1aab0049a5d16 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/44c614f0905100bed5a6cb9bb35a7cb95f062cbf |     
 powerpc64   |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/47665d417dbae76bf27e805a5bcb1d8d6ab1f445 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               gupnp-av-0.14.0 | 1 
            host-binutils-2.38 | 1 
               host-go-1.20.11 | 1 
                  linux-6.1.64 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/8c159bc4c1a5cea92c6d7274dda51eef4bf81393 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c080d7a83959c83ae3c7687e19fe03e42577894a |     
   s390x     |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/8129ddf2f7066419624938d3e0eff8486ee31bce |     
   mips64    |          linux-6.1.64          | NOK | http://autobuild.buildroot.net/results/e88b2d0626ce79eaa4c6e69a8fe27f1613cd7e7e | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                jailhouse-0.12 | 1 
                    sdl-1.2.15 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/b4e133c4d575315d11187da34bddf26fccd418ce |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/eaf276e5a367677a9f1852ceb97d1160287f3179 | ORPH
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/5dda97a2f9b430cf1dd180cf42d1258c96a4de6d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
