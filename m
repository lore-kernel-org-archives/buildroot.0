Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D57C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 06:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4125682C7D;
	Wed, 13 Dec 2023 06:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4125682C7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZoKkdpGf83Lu; Wed, 13 Dec 2023 06:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FBF382C89;
	Wed, 13 Dec 2023 06:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FBF382C89
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27A4E1BF47F
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 06:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B6B840448
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 06:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B6B840448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVKEjGiGJMm1 for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 06:37:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3467F40191
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 06:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3467F40191
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BA9B60002
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 06:37:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 06:37:31 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231213063737.0B6B840448@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702449451; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7TY0P+j4lQf38lZZOcIz1RYR0bFC0ejAlEn6fouVEX4=;
 b=J2Fn7U5R/7tQ1+0rFyOCBRJZ+GgwdIUlj46FNJFBHVx8TSoRNU2fUfPc+rDSTvk1VBS0El
 5++W5A13FJuF0SBkYvWMPP5M9tMk2nWNjAaJjVasQtkuXXPPR8r/ImIuCinXy+V+dPHaRS
 G93k5olco6etLwRuzLVNCu21oqedzhI7Vl658fOU5cCMz4i5N5CGbznxuPam5xPltQZjrq
 2dw01jwwTBunHmcgJ6HKAlC/OkSvn8L8tqB4+7X5FqFm1joEnYHK3QFzyYSLGOC/a/BTDt
 xw0j6ofpjMeakI21qQBYzgFCKRGY/zUA2Ykj51Vff4mylMEAbMOQD6p0EdgFmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J2Fn7U5R
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-12
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

Autobuild statistics for 2023-12-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  1  |  0  |  2  |
  2023.08.x  |  5  |  1  |  0  |  6  |
    master   | 52  | 41  |  0  | 93  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 4 
                       unknown | 3 
                elfutils-0.189 | 2 
glibc-2.38-27-g750a45a78390... | 2 
        python-pysensors-0.0.4 | 2 
               apcupsd-3.14.14 | 1 
                   bird-2.0.12 | 1 
                    brltty-6.6 | 1 
check-11970a7e112dfe243a2e6... | 1 
           dmraid-1.0.0.rc16-3 | 1 
                 dtbocfg-0.1.0 | 1 
        edk2-edk2-stable202308 | 1 
                    grub2-2.06 | 1 
                host-go-1.21.5 | 1 
              host-rust-1.71.1 | 1 
              libarchive-3.7.2 | 1 
          libcamera-apps-1.3.0 | 1 
                 libcurl-8.5.0 | 1 
                 libldns-1.8.3 | 1 
                 libp11-0.4.12 | 1 
                libressl-3.8.2 | 1 
               libunwind-1.6.2 | 1 
          linux-5.10.162-cip24 | 1 
                    ngrep-1.47 | 1 
               openblas-0.3.25 | 1 
                   p7zip-17.04 | 1 
                   perl-5.36.3 | 1 
         python-rpds-py-0.12.0 | 1 
                 systemd-254.6 | 1 
           uboot-tools-2021.07 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                   uhd-4.3.0.0 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f87182cf798370d96a884d6d53fa457cf1615865 |     
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/de0a67216340d58e0ada6341f54cd045838aa1cd |     
 microblaze  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/87b2887344e78477cfb4cc2d8c32c6ed9c2dc3c4 |     
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/7614df2335714836ddf6dd4913f98fbc8d631d77 | ORPH
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e6cf805a054472510d941d96d620af35413d5dcd | ORPH
   mipsel    |         dtbocfg-0.1.0          | NOK | http://autobuild.buildroot.net/results/ed3bb03050d32233298fecc77cf416d2f2483196 |     
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/72abff87ac1f0e6fb4149181997dae8891223418 |     
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/07b13560c2ebbc7170cc96ac5e1601197a28fa3d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3dd910b1b7e0cef3c219c7567ed45d7ec46eb679 | ORPH
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/8d1cbc8b052cd6f251f7ad1c11d46af8596f65c0 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/80ddb7382a2d77d5bf1510daca9630b09af5d7da |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/361f3bf4d014b1207f5f11f3d89d95a41e4865d3 | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/77693aca2c445363650559f204881e7fdb57feb8 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0910842a78ab1664435ea5a7729fbb2384365c1b | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ceed83c2a3d2ef4a6864fd8e62c801f75beb2658 | ORPH
    arm      |           grub2-2.06           | NOK | http://autobuild.buildroot.net/results/3963d7747603ce0fc672e2d3d4c1112db7190649 |     
 aarch64_be  |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/747ca57c5513148f530a828e05e435381c842fc7 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/2734094a310983c949118356f6095f6761a13351 |     
    m68k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/cf94fcdc0b4df672fd6273e249a4eef5d5d389c2 |     
   mipsel    |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/b86b3c8776d6eb767735ddeb2281471cd99db976 |     
microblazeel |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/b8e67adfabc24ddf0ec01ead04303623581949ae |     
   armeb     |         libldns-1.8.3          | NOK | http://autobuild.buildroot.net/results/49b8e61fe8dfa1032655f7683a899550d349fe21 |     
  sparc64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/c592706f5ab72adfbcb0a424046462a3316b663e | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/d96df0931dbb3f589614105e9891aa4ea0b4582f | ORPH
   mips64    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/47379d1cb25739893d5fa013dd049faef4b80097 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/1b3871f288a81e233e77662fd3df8a9c1b6c4c5a | ORPH
   x86_64    |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/a1446760b1d31fefcf39e5c6558ef91faf216c13 |     
  mips64el   |        openblas-0.3.25         | NOK | http://autobuild.buildroot.net/results/342275a131711dad43dd4f89648d9161f6be69e7 |     
   s390x     |          p7zip-17.04           | NOK | http://autobuild.buildroot.net/results/01ca5af8bd2582cda59d555957d1960793d28cfa |     
  aarch64    |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/e4d36e3587682db48645eafdb8ba2d575d547d8d |     
  powerpc    |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/193b8ca3b4298588e5eac1de7c4bd1abcd6f1b40 |     
  riscv64    |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/c1e8d7fb7e233ade9c3cf96deffff0161c29e221 |     
  powerpc    |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/6312a080460e7b27cf88380ee0b70d844233b7d7 |     
powerpc64le  |         systemd-254.6          | NOK | http://autobuild.buildroot.net/results/3b095e0bfb76a8df477141b55dbad3413dad9a57 |     
   armeb     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/69e13b8588512f22e045a39a554413e89047baa4 | ORPH
   armeb     | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/d403f9ea0fee177e3028e812ed6411342a0437d0 |     
  aarch64    |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/e342d3ad090d99f56e85495e4f6e68cf361f974d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/049c03c50440e7d28f940219870ca80d7beea58c |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/11a178a9d3cd489fa098ab23c821a78080141130 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bcdb034cc5f28f42fd3cb7ff7715bce83b08b279 |     
  mips64el   |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/e69cdc3fa73818494675c02ed72a2f8b00336544 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

             fontconfig-2.13.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/04cea98ffa13c48cecda408d3ed6eb98b02e9588 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                elfutils-0.189 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ef14995d89e4184eebac18c6d5a834f3aedea485 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
