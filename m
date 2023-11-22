Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB7EC61D92
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 06:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3EFC81393;
	Wed, 22 Nov 2023 06:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3EFC81393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jebwTDdtzZgz; Wed, 22 Nov 2023 06:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2029817C3;
	Wed, 22 Nov 2023 06:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2029817C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6EB41BF39A
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 06:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FA2D408C2
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 06:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA2D408C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vpGdtKntnI4 for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 06:48:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 299764077D
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 06:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 299764077D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 359A82000B
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 06:48:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 06:48:44 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231122064849.7FA2D408C2@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700635724; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ob3G8AzFtWPH33ehNhNafSQNrpQkc6m0+ayYhrrJO34=;
 b=RHf19y8e+kqEDf6jIP+IhFrBE92GZkVAyuLFwDqWfUKIZpfDZS5TlBkM3YkHT9HTlGw9xR
 JDj9JtDe/1wftW9HDE9P9Obj0GlJKNRGEtgo7r43tmOeZgCOKJl2e/eUwG4sOw0RBEH4DC
 erm8+/2OQ5PodwmQo2Pv3+l+ElG4M9582A84Nif0BjmBk3py7gNd5PBHimuCYWwfMPRYEQ
 K/OdYKp6NtYji4pq8b1tj+1CwXVlwwVt6x/ZD7ENn7CmEte/34gR8l/85PSJuSYo3Oq8l5
 nFU5NC0h+K0MwTABxsBQvPdI5fMz5GNotkWVzXEVcrh6cxVCRW9jZX2DpuMksg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RHf19y8e
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-21
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

Autobuild statistics for 2023-11-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  2  |  0  |  6  |
  2023.08.x  |  2  |  1  |  0  |  3  |
    master   | 43  | 35  |  0  | 78  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 5 
glibc-2.38-27-g750a45a78390... | 3 
                host-go-1.21.4 | 3 
              host-rust-1.71.1 | 2 
              libarchive-3.7.2 | 2 
                   openrc-0.51 | 2 
          python-msgpack-1.0.7 | 2 
                   bird-2.0.12 | 1 
                 dc3dd-7.2.641 | 1 
                elfutils-0.189 | 1 
                    gdal-3.6.2 | 1 
  gobject-introspection-1.76.1 | 1 
               ipmitool-1_8_19 | 1 
             libblockdev-3.0.4 | 1 
           libfreeimage-3.18.0 | 1 
              libopenssl-3.1.4 | 1 
                   linux-6.6.1 | 1 
        ltp-testsuite-20230929 | 1 
on2-8170-modules-73b08061d3... | 1 
                    php-8.2.12 | 1 
                   uhd-4.3.0.0 | 1 
                 wolfssl-5.6.4 | 1 
                 zlib-ng-2.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/3e338bea46e54d5ac50c2c0af2f6517f18b125f4 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/45682660acff473a0166c47cb395e772b1058ac3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c908db0607f619a9052aa4c649c97a32aa1510c0 | ORPH
   sh4aeb    |           gdal-3.6.2           | NOK | http://autobuild.buildroot.net/results/cfeed8a73ecfa5bfde3200bc9c6dbe67cc0c98e0 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/cba5a94ae2fef02aef1d829039b75d26da02e15d |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/fe47c589bfdbc553a7a3f257ffe00652cececb40 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/fb0d45199a6fb1661eef337fcf4bcd9aead3877f |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e222eb154063a53319f54988733cf5550fe0d08c | ORPH
  mips64el   |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/0972855baa5fb2eb2ac0f686d3ccccc4491bf880 |     
   mips64    |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/c2a2ff272def2a929868909e2cbb780afe932d26 |     
  aarch64    |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/2c1756cf3072996d2abd513a7bbc71a153187ba9 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b90a1a5611a186b1c2267b0defb9679f2d6a2aaf |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b5b45078846edcbc0fe43e62f035ea2d87206c00 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/0eba8e7dbc30a4dc85e484b3214fb9d19d6d800d |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/e09736f24172d49a91e4f95cb9d5d60da5266ad2 |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/d16d77105cc6cb5b0c860f60e9860e0a09bfe24f |     
    m68k     |       libblockdev-3.0.4        | NOK | http://autobuild.buildroot.net/results/809928338277ba1730fe7cda00d4d49312edba73 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/f4ec8d8c4fd24723d2cc252fac72450337b09cb9 |     
    m68k     |        libopenssl-3.1.4        | NOK | http://autobuild.buildroot.net/results/3fa2135c1e321d0993e8d414b53a227f091bcb55 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/89f9148348c23a4305ce92e9a1d1067922b170f2 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ec92b087f22784b25d0d8fec219e1850519480c1 | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8370303dffd457fb9a1cca4690f7674d07d915ed | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/341c440692cf3f1875c0ad0378b384b0fa4137ce | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0d6ab7ad9b94588a5920cd07436e3f97cb8f5855 | ORPH
   mips64    |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/04bb7dae828b4218ad40bc68d0b27469ee08e405 | ORPH
   x86_64    |     ltp-testsuite-20230929     | NOK | http://autobuild.buildroot.net/results/7d5b433176ece30a50b3180cda2ef91ddc331891 |     
   armeb     | on2-8170-modules-73b08061d3... | NOK | http://autobuild.buildroot.net/results/acd7c4ae9a5b4079bb3c7b886431b60739f3aaf4 | ORPH
    arc      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/692292274c99ecb1ab76b8c01f3400b8424bb841 |     
    arm      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/37ab7342b39d386e18f43669ed9ee8c9d0030f1b |     
 microblaze  |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/e85626c7bc8e3133b80f60b6238935e24b870867 |     
   mipsel    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/5c5587ccf58863063ee4d979e30ed818462af99c |     
  riscv32    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/c6d1f425db01a603ecbc39c42b673f618f316e05 |     
   mipsel    |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/38e82c65c638ba249f4bbdf596d3c64d63f6fc78 |     
   mips64    |         wolfssl-5.6.4          | NOK | http://autobuild.buildroot.net/results/b6d44d5899bad7f76e1efef3222929d33aac0ac2 |     
    arm      |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/8971b741fda90fdc14312f48d52941c086c05e71 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

             fontconfig-2.13.1 | 1 
              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/593b55c2424a53bbbfdfc4b04aef84b8aa8c5cf7 | ORPH
  aarch64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/8ee4b09599fcf29bb5e66c49c2948500d0dee9a1 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

    python-cryptography-39.0.2 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/3b5176db7f6557f27346f7ed1471bbecaeabde91 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
