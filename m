Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D39C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 06:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C832813F0;
	Wed, 27 Dec 2023 06:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C832813F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipoEiv8GHL1G; Wed, 27 Dec 2023 06:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35EDC815AB;
	Wed, 27 Dec 2023 06:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35EDC815AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F06491BF2AB
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 06:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EA7160B93
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 06:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA7160B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwBWqg7Wd-tt for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 06:41:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DFAF60B10
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 06:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DFAF60B10
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76BDBC0005
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 06:41:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 06:41:37 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231227064142.9EA7160B93@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703659297; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1iTsZOWqUYGGcQk4FR0dxUbTflfNsV/1PogY/KH3pBo=;
 b=O9dx2z2zUBxdxKixdFknCaLvzMQnRSmn95T0GviM5tmWG07Qb4bDgKWnl0hsdAbbT774Q/
 l1A2i4xrJ9cbtysZHDtm5nsgXvN+xUT5mnQytERDX3kGs7z8gv/v+wzUxvn65B05EBpcYG
 sGkUeYPwbZUfVKEoUqTRan2+Gf4APTzdsMELxFukhXi/Gi4IlKbImvlyVKdvzE6T2k1cNp
 5GolfHW2FLKVSPTVFrRdJGfzbjl1cf/BAoHAf8qYthlQctFmJR7hnJlRkf9s+dMIhfr0Uc
 HUoFA/zyKFl6ora0BIpZw6z+huHPdMgTmG61W8xJe2z8T8E5dcz/VGcgL4nYzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O9dx2z2z
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-26
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

Autobuild statistics for 2023-12-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  3  |  0  |  7  |
  2023.08.x  |  2  |  3  |  0  |  5  |
    master   |  8  | 30  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.21.5 | 3 
                elfutils-0.189 | 2 
                     exim-4.97 | 2 
                    fcft-3.1.6 | 2 
                flickcurl-1.26 | 2 
              host-rust-1.71.1 | 2 
              libopenssl-3.2.0 | 2 
                libressl-3.8.2 | 2 
                libsoup-2.74.3 | 2 
android-tools-4.2.2+git2013... | 1 
                    bat-0.23.0 | 1 
glibc-2.38-27-g750a45a78390... | 1 
  gobject-introspection-1.76.1 | 1 
              iputils-20231222 | 1 
              libarchive-3.7.2 | 1 
               libsigsegv-2.14 | 1 
                   linux-6.6.8 | 1 
                   perl-5.38.2 | 1 
                python3-3.11.6 | 1 
          refpolicy-2.20231002 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/531843ee737709ce178a21f7f704cc31c249895f |     
    mips     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/b6f990f84256592aa180b16aad8af2a7285206aa |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fd028adda5d417b1bfa30a97618914c3df66057f | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8f4e755ecf11d0ba9f75c09df0299a9b115d538c | ORPH
 aarch64_be  |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/8c95eacab8c5a18b3258fcf55e106cb12182069f |     
  mips64el   |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/4af00f201d5aefe6a69ac487a9820e2dc332211e |     
   sparc     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/31a1f022414a8a1888cac4a5cd1761257d0f2196 |     
   x86_64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/4522781e0448b325b54e93bbfb20f8295ea7061d |     
   mips64    |         flickcurl-1.26         | NOK | http://autobuild.buildroot.net/results/7b35f6fe80e235cdabf7d6e42046761f935148c7 |     
    m68k     |         flickcurl-1.26         | NOK | http://autobuild.buildroot.net/results/a62c4fc944ca988b8f17e37d639d3a344ec98c1f |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/3a89b8018d2f8366f22174db00e0d96997e07a2d |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d991f152c886b634d4302ff61443affa21068503 | ORPH
   armeb     |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/c49552d5232a6bd1e73d4973721f57e8d6fa4bed |     
    i686     |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/a63951e9d7cf8b8247db27ed39165ca9a1c28aab |     
  mips64el   |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/c68c78d7c49a53378520f0ac559bb64bc8ef3f1d |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/3d4d3c97e03575b92c5c085927c13d539fdea7ed |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/253bdbb7f1ce48905f2cd7f6d1be464abe47e8b8 |     
  mips64el   |        iputils-20231222        | NOK | http://autobuild.buildroot.net/results/09702d9a56160dd4c77708ff2c6ff706a6d37f20 |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/f3a476373c8ce35ab3a737dbfe119214fd755425 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/48c96a785a7f2eb5a6938c97588523a9b9ef59d3 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/6b45239d6c7afc568dda90c4a8a0323b5b8e035b | ORPH
   sh4eb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1c59130add845e62782886321204cfed8569f09f | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/605e08cc5ca0860f9498e9cfae651861473e4973 | ORPH
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/6a147c5344acc82eb439514663b800c6ee934355 |     
powerpc64le  |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/4d652b704072f5dcfbb2a459d55df71793fb68bb |     
  sparc64    |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/f6d1fb68a611869bae08d19e539fc983f650c083 |     
 aarch64_be  |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/e65ac57a4347ccef1260778b207fc87f7cb0c013 | ORPH
   armeb     |          perl-5.38.2           | NOK | http://autobuild.buildroot.net/results/11c75ff9218177da34bea011bfa48af5874e5320 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/123e4611d25cf95d4181c05edb25fe5383d7adfd |     
    mips     |      refpolicy-2.20231002      | NOK | http://autobuild.buildroot.net/results/87d78b6f15875f0fa3e6fc85e352db14ab0383bb |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 2 
                elfutils-0.186 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0959c33051fed9982e5f4a735836870d503029a7 | ORPH
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/20713ce82dd40968ccb199e8d1993f0e374e91f4 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/98e006d5083d25eb93f16eaaa11ddbc4e9a7d73e |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

             glibmm2_66-2.66.6 | 1 
               host-go-1.20.11 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       glibmm2_66-2.66.6        | NOK | http://autobuild.buildroot.net/results/e9037166fd1bb23e0c741cdbe54152ad8df7966e |     
   mipsel    |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/3a9d6b27ab3193d7f9ce36d33d8a67c9f12a73f3 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/728c1dd157973c76468127f120ff8774be6dcb68 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
