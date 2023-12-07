Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC48C4167B
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 06:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFCFE60A5A;
	Thu,  7 Dec 2023 06:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFCFE60A5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAgKESnAxmBu; Thu,  7 Dec 2023 06:39:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB0AB60B88;
	Thu,  7 Dec 2023 06:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB0AB60B88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C81361BF2E4
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 06:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D3798248C
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 06:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D3798248C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JixMruGenK5g for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 06:39:45 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D54182486
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 06:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D54182486
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADBD31BF20C
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 06:39:41 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 07 Dec 2023 06:39:41 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231207063946.8D3798248C@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1701931181; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r1F7iyb06/t4HhWyIrvQLKQddhRXFBK1p7Dfez+D1iI=;
 b=k2E77wpugIQoRz2PaH9LvnhMbDVefXTp/ezsMurvEGMwT5PkyFt+OM6xggFi1l8qQXpj4O
 ps7mp1TdbBKDTt6ZLkhh+YVqIexS0ZTVcP7h6C+ajlf4CbFzmps1TniaPCFVNcmy3tAP2j
 CQ4fjxivY5dNZdYbJFxDX90wCneHDiBCtyfHr3uD/N2JR2Qi8I7nnZU9AQhute/ogG0vjr
 jIwt5HWJ/rd11HNS8tGPqVjCx2PJJERVnYEZB8aF0Qk/Bb6riZg8FTRsXL6zF1neNp+WQY
 qAu8AkHWUt2z4hh+C8J59A07Wgv6zyJ3lxmjXSDpz4Z7ZsuCBhA/94u8RP3h0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k2E77wpu
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-06
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

Autobuild statistics for 2023-12-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  1  |  0  |  3  |
  2023.08.x  |  7  |  1  |  0  |  8  |
    master   | 49  | 29  |  2  | 80  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 5 
                 coreutils-9.3 | 2 
                elfutils-0.189 | 2 
         gobject-introspection | 2 
              libarchive-3.7.2 | 2 
               trace-cmd-2.9.7 | 2 
               apcupsd-3.14.14 | 1 
                    bat-0.23.0 | 1 
                  boost-1.83.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
                host-go-1.21.4 | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.71.1 | 1 
              hyperfine-1.14.0 | 1 
              libtommath-1.2.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                nushell-0.85.0 | 1 
               openblas-0.3.25 | 1 
                   sdl2-2.28.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/db5519a010e6df704d078ce3730554512068a805 |     
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/3b6934bbfc60724c92f81ee6c2325a10045eaaf6 |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/ef6cd114bd9a834f465b88651ffabb4dee80a924 |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a42ff68cc5f1c96a0f60dbab55e6775e883c96bb | ORPH
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/833a47289fa832cc1f53fa68b5d5e4201baa5718 | ORPH
    arm      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/764b0a4b815e7550e5d5772b5c9fb46f544f5322 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2747b50205e38a268062884161d0950c19743611 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/905f77ced13eea17bada2a856e1043938972f0b5 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c53908a974f8a2daf9d8612d78482492f0049ac2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/30f5a799183096ab55a3e082444d5e20c81027bb |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/00b0a91f891dacf5eb0a2375e13f741428c4bb04 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/8825646064847262b9e14198e3ca640c93e65aee |     
   s390x     |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/092c3d358d554150cba243f55b56a6c7da63fa40 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/9a0bb2e09e1a0dd451dbd5dc2355f82027622162 |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4b570e57b17709e9db1e4d28ac21d954b78ae20a |     
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/e0665d5677f1ece814590c0e01a4162eb06ab974 | ORPH
microblazeel |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/0bb4abebe48c53417977be2e659e9a7c5209ea83 |     
   mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/8b69ba836f0fdcd4815eb4a0bcd496432cc52fd2 |     
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/fb02c9dcf749bf358da2034528dae555206bc240 | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/43b0571b17a6addebf0e6e5d29f13cab6f5c7500 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c4c15676fc82e997763cb3e7b4f65e143a0094f7 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1d1313bc8daba89b242090e643968c76db3f8012 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/562a3678e332795b71bf865c51fd6b6c6a9ff677 | ORPH
    arc      |        libtommath-1.2.1        | NOK | http://autobuild.buildroot.net/results/20e6be5a6d401f5aedd2c659abcebe805cc89b2a |     
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e1d72f8afd2b4600ef5aef4b6ba854db53d2186a | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/60e6d12b2b6cba41a837b2c1f5cd727748764fb8 | ORPH
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/c24a857be0f299cf06851780fc17850b0918c7b4 |     
  mips64el   |        openblas-0.3.25         | NOK | http://autobuild.buildroot.net/results/32702ccaa2384252058840960d8998abca294fad |     
   armeb     |          sdl2-2.28.5           | NOK | http://autobuild.buildroot.net/results/f5cd026ccd82af43cf5604638e2caf903b7a75a6 |     
  mips64el   |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/552e3fc37012423a74e95aabb59553b99c82f18e |     
    mips     |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/e1f543d6ad2500df9233ff15d0df623c089656e7 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               ding-libs-0.6.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/a8484faa2b83fe3159b03876fece6e82b75a7d49 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

         host-sentry-cli-2.8.0 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d0a78bfc0aca74a5e7cc5d228725ad5c6857ec7b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
